slot0 = class("GuildPreCombatLayer", import("..base.BaseUI"))
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

	for slot5 = 1, 3 do
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
		uv0:emit(GuildPreCombatMediator.SAVE, function ()
			uv0:emit(uv1.ON_CLOSE)
		end)
	end, SFX_CANCEL)
	onButton(slot0, slot0._startBtn, function ()
		uv0:emit(GuildPreCombatMediator.START)
	end, SFX_UI_WEIGHANCHOR)
	onButton(slot0, slot0._strategy, function ()
		uv0:displayStrategyInfo(_.detect(uv0.chapter:getFleetStgs(uv0.chapter.fleet), function (slot0)
			return slot0.id == ChapterConst.StrategyRepair
		end))
	end)
	onButton(slot0, slot0:findTF("fleet_confirm/help_button"), function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("sham_battle_help_tip")
		})
	end, SFX_PANEL)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
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
		uv0:emit(GuildPreCombatMediator.SAVE, function ()
			uv0:emit(uv1.ON_CLOSE)
		end)
	end

	function slot0.fleetPanel.onConfirm()
		if not uv0.chapter:isValid() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("sham_team_limit"))
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				content = i18n(#slot0:getShips() < ChapterConst.ShamShipLimit and "sham_ship_equip_forbid_1" or "sham_ship_equip_forbid_2"),
				onYes = function ()
					uv0:updateFleetShips(uv0:filterPower3())
					uv1:emit(GuildPreCombatMediator.SAVE, function ()
						uv0.contextData.confirmed = true

						uv0:hideFleetPanel()
						uv0:displayFormation()
					end)
				end
			})
		end
	end

	function slot0.fleetPanel.onClickShip(slot0)
		uv0:emit(GuildPreCombatMediator.CHANGE_FLEET_SHIP, {
			type = 1,
			team = slot0
		})
	end

	function slot0.fleetPanel.onLongPressed(slot0)
		uv0:emit(GuildPreCombatMediator.OPEN_SHIP_INFO, slot0.id)
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
		uv0:switchToEditMode(false)
	end)
end

function slot0.hideFormation(slot0)
	setActive(slot0.formation, false)
end

function slot0.updateView(slot0, slot1, slot2)
	slot3 = nil
	slot3 = coroutine.create(function ()
		pg.UIMgr.GetInstance():LoadingOn()
		uv0:resetGrid(TeamType.Vanguard)
		uv0:resetGrid(TeamType.Main)
		uv0:resetFlag()

		if uv1 then
			uv0:loadAllCharacter(function ()
				onNextTick(uv0)
			end)
			coroutine.yield()
		else
			uv0:setAllCharacterPos(true)
		end

		uv0:updateViewState()
		uv0:updateDockView()
		uv0:updateFriendAssist()

		if uv0.chapter.active then
			uv0:updateStrategyIcon()
		end

		onNextTick(uv2)
		coroutine.yield()
		uv0:displayFleetInfo()
		pg.UIMgr.GetInstance():LoadingOff()

		if uv3 then
			uv3()
		end
	end)

	function ()
		if coroutine.status(uv0) == "suspended" then
			slot0, slot1 = coroutine.resume(uv0)
		end
	end()
end

function slot0.updateViewState(slot0)
	slot1 = slot0.chapter.fleet
	slot3 = slot0.chapter:getChapterCell(slot1.line.row, slot1.line.column) and slot2.attachment == ChapterConst.AttachRival and slot2.flag == 0

	setActive(slot0._strategy, slot0.chapter.active)
end

function slot0.updateDockView(slot0)
	slot1 = slot0.chapter:getShips()

	if not slot0.chapter.active then
		for slot5 = #slot1 + 1, ChapterConst.ShamShipLimit do
			table.insert(slot1, false)
		end
	end

	slot2 = UIItemList.New(slot0._ships, slot0._shipTpl)

	slot2:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			uv1:updateShip(slot2, slot3, uv0[slot1 + 1] and uv1.chapter.fleet:containsShip(slot3.id), function ()
				if uv0.chapter.active then
					if uv1 and uv1.hpRant < ChapterConst.HpGreen then
						uv0:displayRepairWindow(uv1)
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
		if uv0.chapter.active then
			if uv1 and uv1.hpRant < ChapterConst.HpGreen then
				uv0:displayRepairWindow(uv1)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("sham_can_not_change_ship"))
			end
		else
			uv0:emit(GuildPreCombatMediator.CHANGE_FLEET_SHIP, {
				type = 2,
				shipVO = uv1
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
			slot12 = findTF(slot6, "blood/fillarea/green")
			slot13 = findTF(slot6, "blood/fillarea/red")
			slot15 = slot10 < ChapterConst.HpGreen

			setActive(slot12, not slot15)
			setActive(slot13, slot15)

			slot11:GetComponent(typeof(Slider)).fillRect = slot15 and slot13 or slot12

			setSlider(slot11, 0, 10000, slot10)

			if not IsNil(findTF(slot6, "mask")) then
				setActive(slot14, slot15 or slot3)
				setActive(findTF(slot14, "fighting"), slot3)
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

		onButton(slot0, slot8, slot4)

		slot12 = GetOrAddComponent(slot8, "UILongPressTrigger")
		slot12.longPressThreshold = 1

		slot12.onLongPressed:RemoveAllListeners()

		if slot5 then
			pg.DelegateInfo.Add(slot0, slot12.onLongPressed)
			slot12.onLongPressed:AddListener(slot5)
		end
	else
		onButton(slot0, slot9, slot4)
	end
end

function slot0.loadAllCharacter(slot0, slot1)
	if slot0._characterList then
		slot2 = slot0.chapter.fleet

		slot0:recycleCharacterList(slot2[TeamType.Main], slot0._characterList[TeamType.Main])
		slot0:recycleCharacterList(slot2[TeamType.Vanguard], slot0._characterList[TeamType.Vanguard])
	end

	removeAllChildren(slot0._heroContainer)

	slot0._characterList = {
		[TeamType.Vanguard] = {},
		[TeamType.Main] = {}
	}

	function slot2(slot0, slot1, slot2, slot3)
		if uv0.exited then
			PoolMgr.GetInstance():ReturnSpineChar(slot1:getPrefab(), slot0)

			return
		end

		for slot8, slot9 in pairs(slot1:getAttachmentPrefab()) do
			if slot9.attachment_combat_ui[1] ~= "" then
				ResourceMgr.Inst:getAssetAsync("Effect/" .. slot10, slot10, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
					if not uv0.exited then
						slot1 = Object.Instantiate(slot0)
						uv0._attachmentList[#uv0._attachmentList + 1] = slot1

						tf(slot1):SetParent(tf(uv1))

						tf(slot1).localPosition = BuildVector3(uv2.attachment_combat_ui[2])
					end
				end), true, true)
			end
		end

		uv0._characterList[slot2][slot3] = slot0

		tf(slot0):SetParent(uv0._heroContainer, false)

		tf(slot0).localScale = Vector3(0.5, 0.5, 1)

		pg.ViewUtils.SetLayer(tf(slot0), Layer.UI)
		uv0:enabledCharacter(slot0, true, slot1, slot2)
		uv0:setCharacterPos(slot2, slot3, slot0)
		uv0:sortSiblingIndex()

		slot5 = cloneTplTo(uv0._heroInfo, slot0)

		setAnchoredPosition(slot5, {
			x = 0,
			y = 0
		})

		slot5.localScale = Vector3(2, 2, 1)

		SetActive(slot5, true)

		slot5.name = "info"
		slot7 = findTF(findTF(slot5, "info"), "stars")
		slot9 = findTF(slot6, "energy")

		if slot1.energy <= Ship.ENERGY_MID then
			slot10, slot11 = slot1:getEnergyPrint()

			if not GetSpriteFromAtlas("energy", slot10) then
				warning("找不到疲劳")
			end

			setImageSprite(slot9, slot12)
		end

		setActive(slot9, slot8)

		for slot14 = 1, slot1:getStar() do
			cloneTplTo(uv0._starTpl, slot7)
		end

		if not GetSpriteFromAtlas("shiptype", shipType2print(slot1:getShipType())) then
			warning("找不到船形, shipConfigId: " .. slot1.configId)
		end

		setImageSprite(findTF(slot6, "type"), slot11, true)
		setText(findTF(slot6, "frame/lv_contain/lv"), slot1.level)

		slot12 = findTF(slot6, "blood")
		slot14 = findTF(slot12, "fillarea/red")

		setActive(findTF(slot12, "fillarea/green"), ChapterConst.HpGreen <= slot1.hpRant)
		setActive(slot14, slot1.hpRant < ChapterConst.HpGreen)

		slot12:GetComponent(typeof(Slider)).fillRect = ChapterConst.HpGreen <= slot1.hpRant and slot13 or slot14

		setSlider(slot12, 0, 10000, slot1.hpRant)
	end

	function slot4(slot0)
		for slot6, slot7 in ipairs(uv0.chapter.fleet[slot0]) do
			slot8 = slot7:getPrefab()

			table.insert(uv1, function (slot0)
				PoolMgr.GetInstance():GetSpineChar(uv0, true, function (slot0)
					uv0(slot0, uv1, uv2, uv3)
					onNextTick(uv4)
				end)
			end)
		end
	end

	slot4(TeamType.Vanguard)
	slot4(TeamType.Main)
	seriesAsync({}, function (slot0)
		if uv0 then
			uv0()
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
	for slot6, slot7 in ipairs(slot0._gridTFs[slot1]) do
		SetActive(slot7:Find("shadow"), false)
	end
end

function slot0.resetFlag(slot0)
	setActive(slot0._gridTFs.main[1]:Find("flag"), #slot0.chapter.fleet[TeamType.Main] > 0)
end

function slot0.switchToEditMode(slot0, slot1)
	slot0:EnableAddGrid(TeamType.Main)
	slot0:EnableAddGrid(TeamType.Vanguard)

	function slot2(slot0)
		for slot4, slot5 in ipairs(slot0) do
			if tf(slot5):Find("mouseChild") then
				slot7 = slot6:GetComponent("EventTriggerListener")
				uv0.eventTriggers[slot7] = true

				if slot7 then
					slot7:RemovePointEnterFunc()
				end

				if slot4 == uv0._shiftIndex then
					slot6:GetComponent(typeof(Image)).enabled = true
				end
			end
		end
	end

	slot2(slot0._characterList[TeamType.Vanguard])
	slot2(slot0._characterList[TeamType.Main])

	slot0._shiftIndex = nil

	if slot1 then
		slot0:updateView(false)
	end
end

function slot0.switchToShiftMode(slot0, slot1, slot2)
	for slot6 = 1, 3 do
		setActive(slot0._gridTFs[TeamType.Vanguard][slot6]:Find("tip"), false)
		setActive(slot0._gridTFs[TeamType.Main][slot6]:Find("tip"), false)
		setActive(slot0._gridTFs[slot2][slot6]:Find("shadow"), false)
	end

	for slot7, slot8 in ipairs(slot0._characterList[slot2]) do
		if slot8 ~= slot1 then
			LeanTween.moveLocalY(go(slot8), slot0._gridTFs[slot2][slot7].localPosition.y - 80, 0.5)

			slot10 = tf(slot8):Find("mouseChild"):GetComponent("EventTriggerListener")
			slot0.eventTriggers[slot10] = true

			slot10:AddPointEnterFunc(function ()
				for slot3, slot4 in ipairs(uv0) do
					if slot4 == uv1 then
						uv2:shift(uv2._shiftIndex, slot3, uv3)

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
	slot4 = slot0._characterList[slot3]
	slot6 = slot0.chapter.fleet
	slot7 = slot6[slot3]
	slot8 = slot4[slot2]
	slot10 = slot0._gridTFs[slot3][slot1].localPosition
	tf(slot8).localPosition = Vector3(slot10.x + 2, slot10.y - 80, slot10.z)

	LeanTween.cancel(go(slot8))

	slot4[slot2] = slot4[slot1]
	slot4[slot1] = slot4[slot2]

	slot6:switchShip(slot7[slot1].id, slot7[slot2].id)

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
	if #slot0.chapter.fleet[slot1] < 3 then
		slot8 = slot0._gridTFs[slot1][slot6 + 1]:Find("tip")
		slot8:GetComponent("Button").enabled = true

		onButton(slot0, slot8, function ()
			uv0:emit(GuildPreCombatMediator.CHANGE_FLEET_SHIP, {
				type = 0,
				team = uv1
			})
		end, SFX_PANEL)

		slot8.localScale = Vector3(0, 0, 1)

		SetActive(slot8, true)
		LeanTween.value(go(slot8), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)
			uv0.localScale = Vector3(slot0, slot0, 1)
		end)):setEase(LeanTweenType.easeOutBack)
	end
end

function slot0.enabledCharacter(slot0, slot1, slot2, slot3, slot4)
	if slot2 then
		slot5, slot6, slot7, slot8 = tf(slot1):Find("mouseChild")

		if slot5 then
			SetActive(slot5, true)
		else
			slot5 = GameObject("mouseChild")

			tf(slot5):SetParent(tf(slot1))

			tf(slot5).localPosition = Vector3.zero
			slot6 = GetOrAddComponent(slot5, "ModelDrag")
			slot7 = GetOrAddComponent(slot5, "UILongPressTrigger")
			slot8 = GetOrAddComponent(slot5, "EventTriggerListener")
			slot0.eventTriggers[slot8] = true

			slot6:Init()

			slot9 = slot5:GetComponent(typeof(RectTransform))
			slot9.sizeDelta = Vector2(2.5, 2.5)
			slot9.pivot = Vector2(0.5, 0)
			slot9.anchoredPosition = Vector2(0, 0)
			slot7.longPressThreshold = 1

			pg.DelegateInfo.Add(slot0, slot7.onLongPressed)
			slot7.onLongPressed:AddListener(function ()
			end)
			pg.DelegateInfo.Add(slot0, slot6.onModelClick)
			slot6.onModelClick:AddListener(function ()
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_CLICK)
				uv0:emit(GuildPreCombatMediator.CHANGE_FLEET_SHIP, {
					type = 0,
					shipVO = uv1,
					team = uv2
				})
			end)
			slot8:AddBeginDragFunc(function ()
				screenWidth = UnityEngine.Screen.width
				screenHeight = UnityEngine.Screen.height
				widthRate = rtf(uv0._tf).rect.width / screenWidth
				heightRate = rtf(uv0._tf).rect.height / screenHeight

				LeanTween.cancel(go(uv1))
				uv0:switchToShiftMode(uv1, uv2)
				uv1:GetComponent("SpineAnimUI"):SetAction("tuozhuai", 0)
				tf(uv1):SetParent(uv0._moveLayer, false)
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_HOME_DRAG)
			end)
			slot8:AddDragFunc(function (slot0, slot1)
				rtf(uv0).anchoredPosition = Vector2((slot1.position.x - screenWidth / 2) * widthRate + 20, (slot1.position.y - screenHeight / 2) * heightRate - 20)
			end)
			slot8:AddDragEndFunc(function (slot0, slot1)
				uv0:GetComponent("SpineAnimUI"):SetAction("tuozhuai", 0)

				if slot1.position.x > UnityEngine.Screen.width * 0.65 or slot1.position.y < UnityEngine.Screen.height * 0.25 then
					if uv1.chapter.active and #uv1.chapter.fleet[uv2] == 1 then
						pg.TipsMgr.GetInstance():ShowTips(i18n("ship_formationUI_removeError_onlyShip", uv3:getName(), "", Fleet.C_TEAM_NAME[uv2]))
						function ()
							tf(uv0):SetParent(uv1._heroContainer, false)
							uv1:switchToEditMode(true)
							uv1:sortSiblingIndex()
						end()
					else
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							hideNo = false,
							zIndex = -100,
							content = i18n("battle_preCombatLayer_quest_leaveFleet", uv3:getName()),
							onYes = function ()
								for slot4, slot5 in ipairs(uv0._characterList[uv1]) do
									if slot5 == uv2 then
										PoolMgr.GetInstance():ReturnSpineChar(uv3:getPrefab(), uv2)
										table.remove(slot0, slot4)

										break
									end
								end

								uv0.chapter.fleet:removeShip(uv3.id)
								uv0:switchToEditMode(true)
								uv0:sortSiblingIndex()
							end,
							onNo = slot2
						})
					end
				else
					slot2()
				end

				pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_HOME_PUT)
			end)
		end
	else
		SetActive(tf(slot1):Find("mouseChild"), false)
	end
end

function slot0.displayFleetInfo(slot0)
	slot1 = slot0.chapter.fleet

	uv0.tweenNumText(slot0._vanguardGS, _.reduce(slot1:getShipsByTeam(TeamType.Vanguard, false), 0, function (slot0, slot1)
		return slot0 + slot1:getShipCombatPower()
	end))
	uv0.tweenNumText(slot0._mainGS, _.reduce(slot1:getShipsByTeam(TeamType.Main, false), 0, function (slot0, slot1)
		return slot0 + slot1:getShipCombatPower()
	end))
end

function slot0.updateStrategyIcon(slot0)
	slot2 = _.detect(slot0.chapter:getFleetStgs(slot0.chapter.fleet), function (slot0)
		return slot0.id == ChapterConst.StrategyRepair
	end)

	GetImageSpriteFromAtlasAsync("strategyicon/" .. pg.strategy_data_template[slot2.id].icon, "", slot0._strategy:Find("icon"))
	onButton(slot0, slot0._strategy, function ()
		uv0:displayStrategyInfo(uv1)
	end, SFX_PANEL)
	setText(slot0._strategy:Find("nums"), slot2.count)
	setActive(slot0._strategy:Find("mask"), slot2.count == 0)
	setActive(slot0._strategy:Find("selected"), false)
end

function slot0.displayStrategyInfo(slot0, slot1)
	slot0.strategyPanel = slot0.strategyPanel or StrategyPanel.New(slot0.strategyInfo)

	slot0.strategyPanel:attach(slot0)
	slot0.strategyPanel:set(slot1)

	function slot0.strategyPanel.onConfirm()
		if not uv0.chapter.fleet:canUseStrategy(uv1) then
			return
		end

		uv0:emit(GuildPreCombatMediator.OP, {
			type = ChapterConst.OpStrategy,
			id = slot1:getNextStgUser(uv1.id),
			arg1 = uv1.id
		})
		uv0:hideStrategyInfo()
	end

	function slot0.strategyPanel.onCancel()
		uv0:hideStrategyInfo()
	end
end

function slot0.hideStrategyInfo(slot0)
	if slot0.strategyPanel then
		slot0.strategyPanel:detach()
	end
end

function slot0.displayRepairWindow(slot0, slot1)
	slot3 = slot0.chapter.repairTimes
	slot4, slot5, slot6 = ChapterConst.GetShamRepairParams()
	slot0.repairPanel = slot0.repairPanel or RepairPanel.New(slot0.repairWindow)

	slot0.repairPanel:attach(slot0)
	slot0.repairPanel:set(slot2.repairTimes, slot4, slot5, slot6)

	function slot0.repairPanel.onConfirm()
		if uv0 - math.min(uv1, uv0) == 0 and uv2.player:getTotalGem() < uv3 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_rmb"))

			return
		end

		uv2:emit(GuildPreCombatMediator.OP, {
			type = ChapterConst.OpRepair,
			id = uv4.fleet.id,
			arg1 = uv5.id
		})
		uv2:hideRepairWindow()
	end

	function slot0.repairPanel.onCancel()
		uv0:hideRepairWindow()
	end
end

function slot0.hideRepairWindow(slot0)
	if slot0.repairPanel then
		slot0.repairPanel:detach()
	end
end

function slot0.recycleCharacterList(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot1) do
		if slot2[slot6] then
			PoolMgr.GetInstance():ReturnSpineChar(slot7:getPrefab(), slot2[slot6])

			slot2[slot6] = nil
		end
	end
end

function slot0.willExit(slot0)
	if slot0.eventTriggers then
		for slot4, slot5 in pairs(slot0.eventTriggers) do
			ClearEventTrigger(slot4)
		end

		slot0.eventTriggers = nil
	end

	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)

	if slot0._characterList then
		slot1 = slot0.chapter.fleet

		slot0:recycleCharacterList(slot1[TeamType.Main], slot0._characterList[TeamType.Main])
		slot0:recycleCharacterList(slot1[TeamType.Vanguard], slot0._characterList[TeamType.Vanguard])
	end

	slot0:hideFleetPanel()

	for slot4, slot5 in ipairs(slot0._attachmentList) do
		Object.Destroy(slot5)
	end

	slot0._attachmentList = nil
end

return slot0
