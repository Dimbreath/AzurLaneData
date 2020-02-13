slot0 = class("ShamPreCombatLayer", import("..base.BaseUI"))
slot1 = import("..ship.FormationUI")

function slot0.getUIName(slot0)
	return "ShamPreCombatUI"
end

function slot0.init(slot0)
	slot0.eventTriggers = {}
	slot0.formation = slot0:findTF("formation")
	slot0.fleetConfirm = slot0:findTF("fleet_confirm")

	setActive(slot0.formation, false)
	setActive(slot0.fleetConfirm, false)

	slot0._startBtn = slot0:findTF("right/start", slot0.formation)
	slot0._backBtn = slot0:findTF("top/title/back", slot0.formation)
	slot0._moveLayer = slot0:findTF("moveLayer", slot0.formation)
	slot1 = slot0:findTF("middle", slot0.formation)
	slot0._mainGS = slot1:Find("gear_score/main/Text")
	slot0._vanguardGS = slot1:Find("gear_score/vanguard/Text")

	setText(slot0._mainGS, 0)
	setText(slot0._vanguardGS, 0)

	slot0._gridTFs = {
		vanguard = {},
		main = {}
	}
	slot0._gridFrame = slot1:Find("mask/GridFrame")

	for slot5 = 1, 3, 1 do
		slot0._gridTFs[TeamType.Vanguard][slot5] = slot0._gridFrame:Find("vanguard_" .. slot5)
		slot0._gridTFs[TeamType.Main][slot5] = slot0._gridFrame:Find("main_" .. slot5)
	end

	slot0._heroInfo = slot0:getTpl("heroInfo", slot0.formation)
	slot0._starTpl = slot0:getTpl("star_tpl", slot0.formation)
	slot0._heroContainer = slot1:Find("HeroContainer")
	slot0._strategy = slot1:Find("strategy")
	slot0._myAssist = slot1:Find("assist")

	setActive(slot0._strategy, false)

	slot0._middle = slot0:findTF("middle", slot0.formation)
	slot0._right = slot0:findTF("right", slot0.formation)
	slot0._ships = slot0:findTF("fleet/scrollview/ships", slot0._right)
	slot0._shipTpl = slot0:findTF("fleet/scrollview/shiptpl", slot0._right)
	slot0._friendAssist = slot0:findTF("assist", slot0._right)

	setActive(slot0._shipTpl, false)

	slot0.topPanel = slot0:findTF("top", slot0.formation)
	slot0._playerResOb = slot0:findTF("top/title/playerRes", slot0.formation)
	slot0.repairWindow = slot0:findTF("repair_window", slot0.topPanel)
	slot0.strategyInfo = slot0:findTF("strategy_info", slot0.topPanel)

	setActive(slot0.repairWindow, false)
	setActive(slot0.strategyInfo, false)

	slot0._attachmentList = {}
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0._backBtn, function ()
		slot0:emit(ShamPreCombatMediator.SAVE, function ()
			slot0:emit(slot1.ON_CLOSE)
		end)
	end, SFX_CANCEL)
	onButton(slot0, slot0._startBtn, function ()
		slot0:emit(ShamPreCombatMediator.START)
	end, SFX_UI_WEIGHANCHOR)
	onButton(slot0, slot0._strategy, function ()
		slot0:displayStrategyInfo(_.detect(slot0, function (slot0)
			return slot0.id == ChapterConst.StrategyRepair
		end))
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("fleet_confirm/help_button"), function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("sham_battle_help_tip")
		})
	end, SFX_PANEL)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
end

function slot0.onBackPressed(slot0)
	if slot0.strategyPanel and slot0.strategyPanel._go and isActive(slot0.strategyPanel._go) then
		playSoundEffect(SFX_CANCEL)
		slot0:hideStrategyInfo()
	elseif slot0.repairWindow and slot0.repairWindow._go and isActive(slot0.repairWindow._go) then
		playSoundEffect(SFX_CANCEL)
		slot0:hideRepairWindow()
	else
		playSoundEffect(SFX_CANCEL)
		triggerButton(slot0._backBtn)
	end
end

function slot0.setPlayerInfo(slot0, slot1)
	slot0.player = slot1
end

function slot0.updateChapter(slot0, slot1)
	slot0.chapter = slot1
end

function slot0.displayFleetPanel(slot0)
	slot0.fleetPanel = slot0.fleetPanel or ShamFleetConfirmPanel.New(slot0.fleetConfirm)

	slot0.fleetPanel:attach(slot0)
	slot0.fleetPanel:set(slot0.chapter:getShips())

	function slot0.fleetPanel.onCancel()
		slot0:emit(ShamPreCombatMediator.SAVE, function ()
			slot0:emit(slot1.ON_CLOSE)
		end)
	end

	function slot0.fleetPanel.onConfirm()
		if not slot0.chapter:isValid() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("sham_team_limit"))
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				content = i18n((#slot0:getShips() < ChapterConst.ShamShipLimit and "sham_ship_equip_forbid_1") or "sham_ship_equip_forbid_2"),
				onYes = function ()
					slot0:updateFleetShips(slot0:filterPower3())
					slot0:emit(ShamPreCombatMediator.SAVE, function ()
						slot0.contextData.confirmed = true

						slot0.contextData:hideFleetPanel()
						slot0.contextData.hideFleetPanel:displayFormation()
					end)
				end
			})
		end
	end

	function slot0.fleetPanel.onClickShip(slot0)
		slot0:emit(ShamPreCombatMediator.CHANGE_FLEET_SHIP, {
			type = 1,
			team = slot0
		})
	end

	function slot0.fleetPanel.onLongPressed(slot0)
		slot0:emit(ShamPreCombatMediator.OPEN_SHIP_INFO, slot0.id)
	end
end

function slot0.hideFleetPanel(slot0)
	if slot0.fleetPanel then
		slot0.fleetPanel:detach()
	end
end

function slot0.displayFormation(slot0)
	setActive(slot0.formation, true)
	slot0:updateView(true, function ()
		slot0:switchToEditMode(false)
	end)
end

function slot0.hideFormation(slot0)
	setActive(slot0.formation, false)
end

function slot0.updateView(slot0, slot1, slot2)
	slot3 = nil
	slot3 = coroutine.create(function ()
		pg.UIMgr.GetInstance():LoadingOn()
		pg.UIMgr.GetInstance().LoadingOn:resetGrid(TeamType.Vanguard)
		pg.UIMgr.GetInstance().LoadingOn.resetGrid:resetGrid(TeamType.Main)
		pg.UIMgr.GetInstance().LoadingOn.resetGrid.resetGrid:resetFlag()

		if pg.UIMgr.GetInstance().LoadingOn.resetGrid.resetGrid then
			slot0:loadAllCharacter(function ()
				onNextTick(onNextTick)
			end)
			coroutine.yield()
		else
			slot0:setAllCharacterPos(true)
		end

		slot0:updateViewState()
		slot0.updateViewState:updateDockView()
		slot0.updateViewState.updateDockView:updateFriendAssist()

		if slot0.updateViewState.updateDockView.updateFriendAssist.chapter.active then
			slot0:updateStrategyIcon()
		end

		onNextTick(slot2)
		coroutine.yield()
		coroutine.yield:displayFleetInfo()
		pg.UIMgr.GetInstance():LoadingOff()

		if slot3 then
			slot3()
		end
	end)


	-- Decompilation error in this vicinity:
	function ()
		if coroutine.status(coroutine.status) == "suspended" then
			slot0, slot1 = coroutine.resume(coroutine.resume)
		end
	end()
end

function slot0.updateViewState(slot0)
	slot3 = slot0.chapter:getChapterCell(slot0.chapter.fleet.line.row, slot0.chapter.fleet.line.column) and slot2.attachment == ChapterConst.AttachRival and slot2.flag == 0

	setActive(slot0._strategy, slot0.chapter.active)
end

function slot0.updateDockView(slot0)
	slot1 = slot0.chapter:getShips()

	if not slot0.chapter.active then
		for slot5 = #slot1 + 1, ChapterConst.ShamShipLimit, 1 do
			table.insert(slot1, false)
		end
	end

	slot2 = UIItemList.New(slot0._ships, slot0._shipTpl)

	slot2:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot1:updateShip(slot2, slot3, slot0[slot1 + 1] and slot1.chapter.fleet:containsShip(slot3.id), function ()
				if slot0.chapter.active then
					if slot1 and slot1.hpRant < ChapterConst.HpGreen then
						slot0:displayRepairWindow(slot0)
					else
						pg.TipsMgr.GetInstance():ShowTips(i18n("sham_can_not_change_ship"))
					end
				end
			end)
		end
	end)
	slot2:align(#slot1)
end

function slot0.updateFriendAssist(slot0)
	slot0:updateShip(slot0._friendAssist, slot1, slot0.chapter:getFriendShip() and slot0.chapter.fleet:containsShip(slot1.id), function ()
		if slot0.chapter.active then
			if slot1 and slot1.hpRant < ChapterConst.HpGreen then
				slot0:displayRepairWindow(slot0)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("sham_can_not_change_ship"))
			end
		else
			slot0:emit(ShamPreCombatMediator.CHANGE_FLEET_SHIP, {
				type = 2,
				shipVO = slot0
			})
		end
	end)
end

function slot0.updateShip(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = findTF(slot1, "ship")
	slot7 = findTF(slot1, "empty")
	slot8 = slot6:Find("bg")
	slot9 = slot7:Find("bg")

	setActive(slot6, slot2)
	setActive(slot7, not slot2)

	if slot2 then
		updateShip(slot6, slot2)
		setActive(findTF(slot6, "blood"), slot2.hpRant ~= nil)

		if slot10 then
			slot14 = findTF(slot6, "mask")

			setActive(findTF(slot6, "blood/fillarea/green"), not (slot10 < ChapterConst.HpGreen))
			setActive(findTF(slot6, "blood/fillarea/red"), slot10 < ChapterConst.HpGreen)

			slot11:GetComponent(typeof(Slider)).fillRect = (slot10 < ChapterConst.HpGreen and findTF(slot6, "blood/fillarea/red")) or findTF(slot6, "blood/fillarea/green")

			setSlider(slot11, 0, 10000, slot10)

			if not IsNil(slot14) then
				setActive(slot14, slot15 or slot3)
				setActive(setActive, slot3)
				setActive(findTF(slot14, "repair").gameObject, slot15)

				if not slot15 then
					LeanTween.cancel(slot17)
					setImageAlpha(slot17, 1)
				end

				if slot15 and not LeanTween.isTweening(slot17) then
					LeanTween.alpha(rtf(slot17), 0, 2):setLoopPingPong()
				end
			end
		end

		onButton(slot0, slot8, slot4, SFX_UI_CLICK)

		GetOrAddComponent(slot8, "UILongPressTrigger").longPressThreshold = 1

		GetOrAddComponent(slot8, "UILongPressTrigger").onLongPressed:RemoveAllListeners()

		if slot5 then
			pg.DelegateInfo.Add(slot0, slot12.onLongPressed)
			slot12.onLongPressed:AddListener(slot5)
		end
	else
		onButton(slot0, slot9, slot4, SFX_UI_CLICK)
	end
end

function slot0.loadAllCharacter(slot0, slot1)
	if slot0._characterList then
		slot0:recycleCharacterList(slot0.chapter.fleet[TeamType.Main], slot0._characterList[TeamType.Main])
		slot0:recycleCharacterList(slot0.chapter.fleet[TeamType.Vanguard], slot0._characterList[TeamType.Vanguard])
	end

	removeAllChildren(slot0._heroContainer)

	slot0._characterList = {
		[TeamType.Vanguard] = {},
		[TeamType.Main] = {}
	}

	function slot2(slot0, slot1, slot2, slot3)
		if slot0.exited then
			PoolMgr.GetInstance():ReturnSpineChar(slot1:getPrefab(), slot0)

			return
		end

		for slot8, slot9 in pairs(slot4) do
			if slot9.attachment_combat_ui[1] ~= "" then
				ResourceMgr.Inst:getAssetAsync("Effect/" .. slot10, slot10, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
					if slot0.exited then
					else
						slot1 = Object.Instantiate(slot0)
						slot0._attachmentList[#slot0._attachmentList + 1] = slot1

						tf(slot1):SetParent(tf(slot1))

						tf(slot1).localPosition = BuildVector3(slot2.attachment_combat_ui[2])
					end
				end), true, true)
			end
		end

		slot0._characterList[slot2][slot3] = slot0

		tf(slot0):SetParent(slot0._heroContainer, false)

		tf(slot0).localScale = Vector3(0.5, 0.5, 1)

		pg.ViewUtils.SetLayer(tf(slot0), Layer.UI)
		slot0:enabledCharacter(slot0, true, slot1, slot2)
		slot0:setCharacterPos(slot2, slot3, slot0)
		slot0:sortSiblingIndex()

		slot5 = cloneTplTo(slot0._heroInfo, slot0)

		setAnchoredPosition(slot5, {
			x = 0,
			y = 0
		})

		slot5.localScale = Vector3(2, 2, 1)

		SetActive(slot5, true)

		slot5.name = "info"
		slot7 = findTF(slot6, "stars")
		slot8 = slot1.energy <= Ship.ENERGY_MID
		slot9 = findTF(slot6, "energy")

		if slot8 then
			slot14, slot11 = slot1:getEnergyPrint()

			if not GetSpriteFromAtlas("energy", slot10) then
				warning("找不到疲劳")
			end

			setImageSprite(slot9, slot12)
		end

		setActive(slot9, slot8)

		for slot14 = 1, slot1:getStar(), 1 do
			cloneTplTo(slot0._starTpl, slot7)
		end

		if not GetSpriteFromAtlas("shiptype", shipType2print(slot1:getShipType())) then
			warning("找不到船形, shipConfigId: " .. slot1.configId)
		end

		setImageSprite(findTF(slot6, "type"), slot11, true)
		setText(findTF(slot6, "frame/lv_contain/lv"), slot1.level)
		setActive(findTF(slot12, "fillarea/green"), ChapterConst.HpGreen <= slot1.hpRant)
		setActive(findTF(slot12, "fillarea/red"), slot1.hpRant < ChapterConst.HpGreen)

		slot12:GetComponent(typeof(Slider)).fillRect = (ChapterConst.HpGreen <= slot1.hpRant and slot13) or findTF(slot12, "fillarea/red")

		setSlider(slot12, 0, 10000, slot1.hpRant)
	end

	slot4(TeamType.Vanguard)
	slot4(TeamType.Main)
	seriesAsync({}, function (slot0)
		if slot0 then
			slot0()
		end
	end)
end

function slot0.setAllCharacterPos(slot0, slot1)
	for slot5, slot6 in ipairs(slot0._characterList[TeamType.Vanguard]) do
		slot0:setCharacterPos(TeamType.Vanguard, slot5, slot6, slot1)
	end

	for slot5, slot6 in ipairs(slot0._characterList[TeamType.Main]) do
		slot0:setCharacterPos(TeamType.Main, slot5, slot6, slot1)
	end

	slot0:sortSiblingIndex()
end

function slot0.setCharacterPos(slot0, slot1, slot2, slot3, slot4)
	SetActive(slot3, true)

	slot6 = slot0._gridTFs[slot1][slot2].localPosition

	LeanTween.cancel(go(slot3))

	if slot4 then
		tf(slot3).localPosition = Vector3(slot6.x + 2, slot6.y - 80, slot6.z)

		LeanTween.moveLocalY(go(slot3), slot6.y - 110, 0.5):setDelay(0.5)
	else
		tf(slot3).localPosition = Vector3(slot6.x + 2, slot6.y - 110, slot6.z)
	end

	SetActive(slot5:Find("shadow"), true)
	slot3:GetComponent("SpineAnimUI"):SetAction("stand", 0)
end

function slot0.resetGrid(slot0, slot1)
	for slot6, slot7 in ipairs(slot2) do
		SetActive(slot7:Find("shadow"), false)
	end
end

function slot0.resetFlag(slot0)
	setActive(slot0._gridTFs.main[1]:Find("flag"), #slot0.chapter.fleet[TeamType.Main] > 0)
end

function slot0.switchToEditMode(slot0, slot1)
	slot0:EnableAddGrid(TeamType.Main)
	slot0:EnableAddGrid(TeamType.Vanguard)
	slot2(slot0._characterList[TeamType.Vanguard])
	slot2(slot0._characterList[TeamType.Main])

	slot0._shiftIndex = nil

	if slot1 then
		slot0:updateView(false)
	end
end

function slot0.switchToShiftMode(slot0, slot1, slot2)
	for slot6 = 1, 3, 1 do
		setActive(slot0._gridTFs[TeamType.Vanguard][slot6].Find(slot7, "tip"), false)
		setActive(slot0._gridTFs[TeamType.Main][slot6].Find(slot8, "tip"), false)
		setActive(slot0._gridTFs[slot2][slot6]:Find("shadow"), false)
	end

	for slot7, slot8 in ipairs(slot3) do
		if slot8 ~= slot1 then
			LeanTween.moveLocalY(go(slot8), slot0._gridTFs[slot2][slot7].localPosition.y - 80, 0.5)

			slot10 = tf(slot8):Find("mouseChild"):GetComponent("EventTriggerListener")
			slot0.eventTriggers[slot10] = true

			slot10:AddPointEnterFunc(function ()
				for slot3, slot4 in ipairs(ipairs) do
					if slot4 == slot1 then
						slot2:shift(slot2._shiftIndex, slot3, slot3)

						break
					end
				end
			end)
		else
			slot0._shiftIndex = slot7
			tf(slot8):Find("mouseChild"):GetComponent(typeof(Image)).enabled = false
		end

		slot8:GetComponent("SpineAnimUI"):SetAction("normal", 0)
	end
end

function slot0.shift(slot0, slot1, slot2, slot3)
	tf(slot8).localPosition = Vector3(slot0._gridTFs[slot3][slot1].localPosition.x + 2, slot0._gridTFs[slot3][slot1].localPosition.y - 80, slot0._gridTFs[slot3][slot1].localPosition.z)

	LeanTween.cancel(go(slot8))

	slot0._characterList[slot3][slot2] = slot0._characterList[slot3][slot1]
	slot0._characterList[slot3][slot1] = slot0._characterList[slot3][slot2]

	slot0.chapter.fleet.switchShip(slot6, slot0.chapter.fleet[slot3][slot1].id, slot0.chapter.fleet[slot3][slot2].id)

	slot0._shiftIndex = slot2

	slot0:sortSiblingIndex()
end

function slot0.sortSiblingIndex(slot0)
	slot1 = 3
	slot2 = 0

	while slot1 > 0 do
		slot4 = slot0._characterList[TeamType.Vanguard][slot1]

		if slot0._characterList[TeamType.Main][slot1] then
			tf(slot3):SetSiblingIndex(slot2)

			slot2 = slot2 + 1
		end

		if slot4 then
			tf(slot4):SetSiblingIndex(slot2)

			slot2 = slot2 + 1
		end

		slot1 = slot1 - 1
	end
end

function slot0.EnableAddGrid(slot0, slot1)
	slot5 = slot0._gridTFs[slot1]

	if #slot0.chapter.fleet[slot1] < 3 then
		slot8 = slot5[slot6 + 1].Find(slot7, "tip")
		slot8:GetComponent("Button").enabled = true

		onButton(slot0, slot8, function ()
			slot0:emit(ShamPreCombatMediator.CHANGE_FLEET_SHIP, {
				type = 0,
				team = slot0
			})
		end, SFX_UI_FORMATION_ADD)

		slot8.localScale = Vector3(0, 0, 1)

		SetActive(slot8, true)
		LeanTween.value(go(slot8), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)
			slot0.localScale = Vector3(slot0, slot0, 1)
		end)):setEase(LeanTweenType.easeOutBack)
	end
end

function slot0.enabledCharacter(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-11, warpins: 1 ---
		slot5, slot6, slot7, slot8 = tf(slot1):Find("mouseChild")

		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-16, warpins: 1 ---
			SetActive(slot5, true)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-114, warpins: 1 ---
			tf(slot5):SetParent(tf(slot1))

			tf(slot5).localPosition = Vector3.zero
			slot0.eventTriggers[GetOrAddComponent(slot5, "EventTriggerListener")] = true

			GetOrAddComponent(slot5, "ModelDrag").Init(slot6)

			slot9 = GameObject("mouseChild").GetComponent(slot5, typeof(RectTransform))
			slot9.sizeDelta = Vector2(2.5, 2.5)
			slot9.pivot = Vector2(0.5, 0)
			slot9.anchoredPosition = Vector2(0, 0)
			GetOrAddComponent(slot5, "UILongPressTrigger").longPressThreshold = 1

			pg.DelegateInfo.Add(slot0, GetOrAddComponent(slot5, "UILongPressTrigger").onLongPressed)
			GetOrAddComponent(slot5, "UILongPressTrigger").onLongPressed:AddListener(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-1, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end)
			pg.DelegateInfo.Add(slot0, GetOrAddComponent(slot5, "ModelDrag").onModelClick)
			GetOrAddComponent(slot5, "ModelDrag").onModelClick:AddListener(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-15, warpins: 1 ---
				playSoundEffect(SFX_UI_CLICK)
				playSoundEffect:emit(ShamPreCombatMediator.CHANGE_FLEET_SHIP, {
					type = 0,
					shipVO = slot1,
					team = ShamPreCombatMediator.CHANGE_FLEET_SHIP
				})

				return
				--- END OF BLOCK #0 ---



			end)
			GetOrAddComponent(slot5, "EventTriggerListener").AddBeginDragFunc(slot8, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-58, warpins: 1 ---
				screenWidth = UnityEngine.Screen.width
				screenHeight = UnityEngine.Screen.height
				widthRate = rtf(slot0._tf).rect.width / screenWidth
				heightRate = rtf(slot0._tf).rect.height / screenHeight

				LeanTween.cancel(go(go))
				LeanTween.cancel:switchToShiftMode(LeanTween.cancel, )
				LeanTween.cancel:GetComponent("SpineAnimUI"):SetAction("tuozhuai", 0)
				tf(LeanTween.cancel.GetComponent("SpineAnimUI")):SetParent(slot0._moveLayer, false)

				return
				--- END OF BLOCK #0 ---



			end)
			GetOrAddComponent(slot5, "EventTriggerListener").AddDragFunc(slot8, function (slot0, slot1)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-23, warpins: 1 ---
				rtf(slot0).anchoredPosition = Vector2((slot1.position.x - screenWidth / 2) * widthRate + 20, (slot1.position.y - screenHeight / 2) * heightRate - 20)

				return
				--- END OF BLOCK #0 ---



			end)
			GetOrAddComponent(slot5, "EventTriggerListener"):AddDragEndFunc(function (slot0, slot1)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-19, warpins: 1 ---
				slot0:GetComponent("SpineAnimUI"):SetAction("tuozhuai", 0)

				function slot2()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-19, warpins: 1 ---
					tf(tf):SetParent(slot1._heroContainer, false)
					tf(tf):switchToEditMode(true)
					tf(tf):sortSiblingIndex()

					return
					--- END OF BLOCK #0 ---



				end

				if slot1.position.x > UnityEngine.Screen.width * 0.65 or slot1.position.y < UnityEngine.Screen.height * 0.25 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 28-32, warpins: 2 ---
					if slot1.chapter.active and #slot1.chapter.fleet[slot2] == 1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 41-62, warpins: 1 ---
						pg.TipsMgr.GetInstance():ShowTips(i18n("ship_formationUI_removeError_onlyShip", slot3:getName(), "", Fleet.C_TEAM_NAME[slot2]))
						slot2()
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 63-82, warpins: 2 ---
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							hideNo = false,
							zIndex = -100,
							content = i18n("battle_preCombatLayer_quest_leaveFleet", slot3:getName()),
							onYes = function ()

								-- Decompilation error in this vicinity:
								--- BLOCK #0 1-8, warpins: 1 ---
								--- END OF BLOCK #0 ---

								FLOW; TARGET BLOCK #1



								-- Decompilation error in this vicinity:
								--- BLOCK #1 9-30, warpins: 0 ---
								for slot4, slot5 in ipairs(slot0) do

									-- Decompilation error in this vicinity:
									--- BLOCK #0 9-11, warpins: 1 ---
									if slot5 == slot2 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 12-28, warpins: 1 ---
										PoolMgr.GetInstance():ReturnSpineChar(slot3:getPrefab(), slot2)
										table.remove(slot0, slot4)

										--- END OF BLOCK #0 ---

										FLOW; TARGET BLOCK #1



										-- Decompilation error in this vicinity:
										--- BLOCK #1 29-29, warpins: 1 ---
										break
										--- END OF BLOCK #1 ---



									end
									--- END OF BLOCK #0 ---

									FLOW; TARGET BLOCK #1



									-- Decompilation error in this vicinity:
									--- BLOCK #1 29-30, warpins: 2 ---
									--- END OF BLOCK #1 ---



								end

								--- END OF BLOCK #1 ---

								FLOW; TARGET BLOCK #2



								-- Decompilation error in this vicinity:
								--- BLOCK #2 31-48, warpins: 2 ---
								slot0.chapter.fleet:removeShip(slot3.id)
								slot0:switchToEditMode(true)
								slot0:sortSiblingIndex()

								return
								--- END OF BLOCK #2 ---



							end,
							onNo = slot2
						})
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 83-84, warpins: 1 ---
					slot2()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 85-88, warpins: 3 ---
				playSoundEffect(SFX_UI_HOME_PUT)

				return
				--- END OF BLOCK #1 ---



			end)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 115-124, warpins: 1 ---
		SetActive(tf(slot1):Find("mouseChild"), false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 125-126, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.displayFleetInfo(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-35, warpins: 1 ---
	slot0.tweenNumText(slot0._vanguardGS, slot2)
	slot0.tweenNumText(slot0._mainGS, _.reduce(slot0.chapter.fleet.getShipsByTeam(slot1, TeamType.Main, false), 0, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		return slot0 + slot1:getShipCombatPower()
		--- END OF BLOCK #0 ---



	end))

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateStrategyIcon(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-49, warpins: 1 ---
	slot2 = _.detect(slot1, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		return slot0.id == ChapterConst.StrategyRepair
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-9, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end)

	GetImageSpriteFromAtlasAsync("strategyicon/" .. pg.strategy_data_template[slot2.id].icon, "", slot0._strategy:Find("icon"))
	onButton(slot0, slot0._strategy, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0:displayStrategyInfo(slot0)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	setText(slot0._strategy:Find("nums"), slot2.count)
	setActive(slot0._strategy:Find("mask"), slot2.count == 0)
	setActive(slot0._strategy:Find("selected"), false)

	return
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 53-63, warpins: 2 ---
	--- END OF BLOCK #1 ---



end

function slot0.displayStrategyInfo(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot0.strategyPanel = slot0.strategyPanel or StrategyPanel.New(slot0.strategyInfo)

	slot0.strategyPanel:attach(slot0)
	slot0.strategyPanel:set(slot1)

	function slot0.strategyPanel.onConfirm()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		if not slot0.chapter.fleet:canUseStrategy(slot0.chapter.fleet) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-10, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-34, warpins: 2 ---
		slot0:emit(ShamPreCombatMediator.OP, {
			type = ChapterConst.OpStrategy,
			id = slot1:getNextStgUser(slot1.id),
			arg1 = slot1.id
		})
		slot0:hideStrategyInfo()

		return
		--- END OF BLOCK #1 ---



	end

	function slot0.strategyPanel.onCancel()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:hideStrategyInfo()

		return
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-26, warpins: 2 ---
	--- END OF BLOCK #1 ---



end

function slot0.hideStrategyInfo(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.strategyPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot0.strategyPanel:detach()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-8, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.displayRepairWindow(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot3 = slot0.chapter.repairTimes
	slot4, slot5, slot6 = ChapterConst.GetShamRepairParams()
	slot0.repairPanel = slot0.repairPanel or RepairPanel.New(slot0.repairWindow)

	slot0.repairPanel:attach(slot0)
	slot0.repairPanel:set(slot2.repairTimes, slot4, slot5, slot6)

	function slot0.repairPanel.onConfirm()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		if slot0 - math.min(math.min, slot0) == 0 and slot2.player:getTotalGem() < slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-28, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_rmb"))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 29-50, warpins: 3 ---
		slot2:emit(ShamPreCombatMediator.OP, {
			type = ChapterConst.OpRepair,
			id = slot4.fleet.id,
			arg1 = slot4.fleet.id.id
		})
		slot2:hideRepairWindow()

		return
		--- END OF BLOCK #1 ---



	end

	function slot0.repairPanel.onCancel()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:hideRepairWindow()

		return
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-34, warpins: 2 ---
	--- END OF BLOCK #1 ---



end

function slot0.hideRepairWindow(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.repairPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot0.repairPanel:detach()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-8, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.recycleCharacterList(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-22, warpins: 0 ---
	for slot6, slot7 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		if slot2[slot6] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-20, warpins: 1 ---
			PoolMgr.GetInstance():ReturnSpineChar(slot7:getPrefab(), slot2[slot6])

			slot2[slot6] = nil
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-22, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-23, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.eventTriggers then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-12, warpins: 0 ---
		for slot4, slot5 in pairs(slot0.eventTriggers) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-10, warpins: 1 ---
			ClearEventTrigger(slot4)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 11-12, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 13-14, warpins: 1 ---
		slot0.eventTriggers = nil
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-25, warpins: 2 ---
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)

	if slot0._characterList then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-47, warpins: 1 ---
		slot0:recycleCharacterList(slot0.chapter.fleet[TeamType.Main], slot0._characterList[TeamType.Main])
		slot0:recycleCharacterList(slot0.chapter.fleet[TeamType.Vanguard], slot0._characterList[TeamType.Vanguard])
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 48-54, warpins: 2 ---
	slot0:hideFleetPanel()

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 55-60, warpins: 0 ---
	for slot4, slot5 in ipairs(slot0._attachmentList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-58, warpins: 1 ---
		Object.Destroy(slot5)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 59-60, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 61-63, warpins: 1 ---
	slot0._attachmentList = nil

	return
	--- END OF BLOCK #4 ---



end

return slot0
