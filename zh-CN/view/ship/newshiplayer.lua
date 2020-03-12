slot0 = class("NewShipLayer", import("..base.BaseUI"))
slot0.PAINT_DURATION = 0.35
slot0.STAR_DURATION = 0.5
slot0.STAR_ANIMATION_DUR1 = 0.075
slot0.STAR_ANIMATION_DUR2 = 0.1
slot0.STAR_ANIMATION_DUR3 = 0.4
slot0.STAR_ANIMATION_DUR4 = 0.26
slot1 = 19

function slot0.getUIName(slot0)
	return "NewShipUI"
end

function slot0.preload(slot0, slot1)
	LoadSpriteAsync("newshipbg/bg_" .. slot0.contextData.ship:rarity2bgPrintForGet(), function (slot0)
		slot0.bgSprite = slot0
		slot0.isLoadBg = true

		slot0()
	end)
end

function slot0.init(slot0)
	slot0._shake = slot0:findTF("shake_panel")
	slot0._shade = slot0:findTF("shade")
	slot0._bg = slot0._shake:Find("bg")
	slot0._drag = slot0._shake:Find("drag")
	slot0._paintingTF = slot0._shake:Find("paint")
	slot0._paintingShadowTF = slot0._shake:Find("shadow")
	slot0._dialogue = slot0._shake:Find("dialogue")
	slot0._shipName = slot0._dialogue:Find("name"):GetComponent(typeof(Text))
	slot0._shipType = slot0._dialogue:Find("type"):GetComponent(typeof(Text))
	slot0._dialogueText = slot0._dialogue:Find("desc/Text")
	slot0._left = slot0._shake:Find("ForNotch/left_panel")
	slot0._lockBtn = slot0._left:Find("lock/lock")
	slot0._unlockBtn = slot0._left:Find("lock/unlock_btn")
	slot0._viewBtn = slot0._left:Find("view_btn")
	slot0._evaluationBtn = slot0._left:Find("evaluation_btn")
	slot0._shareBtn = slot0._left:Find("share_btn")
	slot0.audioBtn = slot0._shake:Find("property_btn")
	slot0.clickTF = slot0._shake:Find("click")
	slot0.npc = slot0:findTF("shake_panel/npc")

	setActive(slot0.npc, false)

	slot0.newTF = slot0._shake:Find("New")
	slot0.rarityTF = slot0._shake:Find("rarity")
	slot0.starsTF = slot0.rarityTF:Find("stars")
	slot0.starsCont = slot0:findTF("content", slot0.starsTF)
	slot0._skipButton = slot0._shake:Find("ForNotch/skip")

	setActive(slot0._skipButton, slot0.contextData.canSkipBatch)
	setActive(slot0._left, not slot0.contextData.canSkip)
	setActive(slot0.audioBtn, not slot0.contextData.canSkip)
	pg.UIMgr.GetInstance():OverlayPanel(slot0._tf, {
		hideLowerLayer = true
	})

	slot0.rarityEffect = {}
end

function slot0.voice(slot0, slot1)
	if not slot1 then
		return
	end

	function slot2()
		if slot0._currentVoice then
			slot0._currentVoice:Stop(true)
		end

		slot0._currentVoice = playSoundEffect(playSoundEffect)
	end

	if slot0.loadedCVBankName then
		slot2()
	else
		pg.CriMgr:LoadCV(ShipWordHelper.RawGetCVKey(slot0._shipVO.skinId), function ()
			slot0 = pg.CriMgr.GetCVBankName(pg.CriMgr.GetCVBankName)

			if pg.CriMgr.GetCVBankName.exited then
				pg.CriMgr.UnloadCVBank(slot0)
			else
				slot1.loadedCVBankName = slot0

				slot2()
			end

			slot1.loadedCVBankName = slot0

			slot2()
		end)
	end
end

function slot0.setShip(slot0, slot1)
	slot0:recyclePainting()

	slot0._shipVO = slot1
	slot0.isRemoulded = slot1:isRemoulded()

	setImageSprite(slot0._bg, slot0.bgSprite)

	if slot1:isBluePrintShip() then
		if slot0.designBg and slot0.designName ~= "raritydesign" .. slot1:getRarity() then
			PoolMgr.GetInstance():ReturnUI(slot0.designName, slot0.designBg)

			slot0.designBg = nil
		end

		if not slot0.designBg then
			PoolMgr.GetInstance():GetUI("raritydesign" .. slot1:getRarity(), true, function (slot0)
				slot0.designBg = slot0
				slot0.designName = "raritydesign" .. slot1:getRarity()

				slot0.transform:SetParent(slot0._shake, false)

				slot0.transform.localPosition = Vector3(1, 1, 1)
				slot0.transform.localScale = Vector3(1, 1, 1)

				slot0.transform:SetSiblingIndex(1)
				setActive(slot0, true)
			end)
		else
			setActive(slot0.designBg, true)
		end
	elseif slot0.designBg then
		setActive(slot0.designBg, false)
	end

	if slot1.virgin and not slot0.isRemoulded and not slot1:isActivityNpc() then
		setActive(slot0.newTF, true)
		LoadImageSpriteAsync("clutter/new", slot0.newTF)

		if OPEN_TEC_TREE_SYSTEM and table.indexof(pg.fleet_tech_ship_template.all, slot0._shipVO.groupId, 1) then
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_TECPOINT, {
				point = pg.fleet_tech_ship_template[slot0._shipVO.groupId].pt_get,
				typeList = pg.fleet_tech_ship_template[slot0._shipVO.groupId].add_get_shiptype,
				attr = pg.fleet_tech_ship_template[slot0._shipVO.groupId].add_get_attr,
				value = pg.fleet_tech_ship_template[slot0._shipVO.groupId].add_get_value
			})
		end
	else
		setActive(slot0.newTF, false)
	end

	setActive(slot0.audioBtn, not slot0.isRemoulded)
	slot0:UpdateLockButton(slot0._shipVO:GetLockState())

	slot3 = slot0._shipVO:getConfigTable()

	if slot0.isRemoulded then
		setPaintingPrefabAsync(slot0._paintingTF, slot0._shipVO:getRemouldPainting(), "huode")
		setPaintingPrefabAsync(slot0._paintingShadowTF, slot0._shipVO:getRemouldPainting(), "huode")
	else
		setPaintingPrefabAsync(slot0._paintingTF, slot0._shipVO:getPainting(), "huode")
		setPaintingPrefabAsync(slot0._paintingShadowTF, slot0._shipVO:getPainting(), "huode")
	end

	slot0._shipType.text = pg.ship_data_by_type[slot0._shipVO:getShipType()].type_name
	slot0._shipName.text = slot1:getName()
	slot4 = nil
	slot5 = ""
	slot6 = nil

	if slot0.isRemoulded then
		if ShipWordHelper.RawGetWord(slot1:getRemouldSkinId(), ShipWordHelper.WORD_TYPE_UNLOCK) == "" then
			slot4, slot6, slot5 = ShipWordHelper.GetWordAndCV(slot7, ShipWordHelper.WORD_TYPE_DROP)
		else
			slot4, slot6, slot5 = ShipWordHelper.GetWordAndCV(slot7, ShipWordHelper.WORD_TYPE_UNLOCK)
		end
	else
		slot4, slot6, slot5 = ShipWordHelper.GetWordAndCV(slot0._shipVO.skinId, ShipWordHelper.WORD_TYPE_UNLOCK)
	end

	setWidgetText(slot0._dialogue, slot5, "desc/Text")

	slot0._dialogue.transform.localScale = Vector3(0, 1, 1)

	SetActive(slot0._dialogue, false)
	slot0:AddLeanTween(function ()
		return LeanTween.delayedCall(0.5, System.Action(function ()
			SetActive(slot0._dialogue, true)
			SetActive:AddLeanTween(function ()
				return LeanTween.scale(slot0._dialogue, Vector3(1, 1, 1), 0.1)
			end)
			SetActive.AddLeanTween:voice(SetActive.AddLeanTween)
		end))
	end)

	slot7 = slot1:getRarity()
	slot9 = slot0._shipVO:getStar()
	slot11 = (pg.ship_data_template[slot3.id].star_max % 2 == 0 and slot8 / 2) or math.floor(slot8 / 2) + 1
	slot12 = 15

	for slot16 = 1, 6, 1 do
		slot17 = slot0.starsTF:Find("content/star_" .. slot16)

		setActive(slot17:Find("star"), slot16 <= slot9)
		setActive(slot17:Find("star_empty"), slot9 < slot16)

		if slot8 < slot16 then
			setActive(slot17, false)
		end
	end

	slot13 = slot0._shake:Find("rarity/nation")

	if not LoadSprite("prints/" .. nation2print(slot3.nationality) .. "_0") then
		warning("找不到印花, shipConfigId: " .. slot1.configId)
		setActive(slot13, false)
	else
		setImageSprite(slot13, slot14, false)
	end

	LoadImageSpriteAsync("shiprarity/" .. ((slot2 and "0") or "") .. slot7 .. "m", slot0._shake:Find("rarity/type"), true)
	LoadImageSpriteAsync("shiprarity/" .. ((slot2 and "0") or "") .. slot7 .. "s", slot0._shake:Find("rarity/type/rarLogo"), true)
	setActive(slot13, false)
	setActive(slot0.rarityTF, false)
	setActive(slot0._shade, true)

	slot0.inAnimating = true

	slot0:AddLeanTween(function ()
		return LeanTween.delayedCall(0.5, System.Action(function ()
			setActive(setActive, true)
			setActive(setActive.rarityTF, true)
			setActive.rarityTF:starsAnimation()
		end))
	end)

	slot19 = slot0._shake:Find("ship_type"):Find("stars/startpl")

	setText(slot20, slot0._shipVO:getConfig("english_name"))

	slot22 = slot0._shipVO:getStar()

	for slot27 = slot17:Find("stars").childCount, slot0._shipVO:getMaxStar() - 1, 1 do
		cloneTplTo(slot19, slot18)
	end

	for slot27 = 0, slot18.childCount - 1, 1 do
		slot18:GetChild(slot27).gameObject:SetActive(slot27 < slot23)
		setActive(slot28:Find("star"), slot27 < slot22)
		setActive(slot28:Find("empty"), slot22 <= slot27)
	end

	slot24 = slot0._shipVO:getConfigTable()
	findTF(slot17, "type_bg/type"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("shiptype", tostring(slot0._shipVO:getShipType()))
	slot0.scrollTxt = ScrollTxt.New(slot17:Find("name_bg/mask"), slot17:Find("name_bg/mask/Text"))

	slot0.scrollTxt:setText(slot0._shipVO:getName())

	if slot2 then
		slot7 = slot7 .. "_1"
	end

	if not slot0.rarityEffect[slot7] then
		PoolMgr.GetInstance():GetUI("getrole_" .. slot7, true, function (slot0)
			if IsNil(slot0._tf) then
				return
			end

			slot0.rarityEffect[] = slot0

			slot0.transform:SetParent(slot0._tf, false)

			slot0.transform.localPosition = Vector3(1, 1, 1)
			slot0.transform.localScale = Vector3(1, 1, 1)

			slot0.transform:SetSiblingIndex(1)
			setActive(slot0, true)

			slot0.effectObj = slot0
		end)
	else
		slot0.effectObj = slot0.rarityEffect[slot7]

		setActive(slot0.effectObj, true)
	end
end

function slot0.updateShip(slot0, slot1)
	slot0._shipVO = slot1
end

function slot0.switch2Property(slot0)
	setActive(slot0.newTF, false)
	setActive(slot0._dialogue, false)
	setActive(slot0.rarityTF, false)
	setActive(slot0._shake:Find("rarity/nation"), false)
	setActive(slot1, true)
	slot0:AddLeanTween(function ()
		return LeanTween.move(rtf(slot0), Vector3(0, -149.55, 0), 0.3)
	end)
	slot0:AddLeanTween(function ()
		return LeanTween.move(rtf(slot0._paintingTF), Vector3(-59, 21, 0), 0.2)
	end)
	slot0:DisplayNewShipDocumentView()
end

function slot0.showExitTip(slot0, slot1)
	slot2 = slot0._shipVO:GetLockState()

	if slot0._shipVO.virgin and slot2 == Ship.LOCK_STATE_UNLOCK then
		if slot0.effectObj then
			setActive(slot0.effectObj, false)
		end

		if slot0.effectLineObj then
			setActive(slot0.effectLineObj, false)
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			content = i18n("ship_lock_tip"),
			onYes = function ()
				triggerButton(slot0._lockBtn)

				if slot0._lockBtn then
					slot1()
				else
					slot0:emit(NewShipMediator.ON_EXIT)
				end
			end,
			onNo = function ()
				if slot0 then
					slot0()
				else
					slot1:emit(NewShipMediator.ON_EXIT)
				end
			end
		})
	elseif slot1 then
		slot1()
	else
		slot0:emit(NewShipMediator.ON_EXIT)
	end
end

function slot0.UpdateLockButton(slot0, slot1)
	setActive(slot0._lockBtn, slot1 ~= Ship.LOCK_STATE_LOCK)
	setActive(slot0._unlockBtn, slot1 ~= Ship.LOCK_STATE_UNLOCK)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0._lockBtn, function ()
		slot0:emit(NewShipMediator.ON_LOCK, {
			slot0._shipVO.id
		}, Ship.LOCK_STATE_LOCK)
	end, SFX_PANEL)
	onButton(slot0, slot0._unlockBtn, function ()
		slot0:emit(NewShipMediator.ON_LOCK, {
			slot0._shipVO.id
		}, Ship.LOCK_STATE_UNLOCK)
	end, SFX_PANEL)
	onButton(slot0, slot0._viewBtn, function ()
		slot0.isInView = true

		slot0:paintView()
		setActive(slot0.clickTF, false)
	end, SFX_PANEL)
	onButton(slot0, slot0._evaluationBtn, function ()
		slot0:emit(NewShipMediator.ON_EVALIATION, slot0._shipVO:getGroupId())
	end, SFX_PANEL)
	onButton(slot0, slot0._shareBtn, function ()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeNewShip)
	end, SFX_PANEL)
	onButton(slot0, slot0.clickTF, function ()
		if slot0.isInView or not slot0.isLoadBg then
			return
		end

		slot0:showExitTip()
	end, SFX_CANCEL)
	onButton(slot0, slot0.audioBtn, function ()
		if slot0.isInView then
			return
		end

		if not slot0.isOpenProperty then
			slot0:switch2Property()

			slot0.switch2Property.isOpenProperty = true
		end

		slot0(slot0.audioBtn, not slot0.isRemoulded and not slot0.isOpenProperty)
	end, SFX_PANEL)
	onButton(slot0, slot0._skipButton, function ()
		slot0:showExitTip(function ()
			slot0:emit(NewShipMediator.ON_SKIP_BATCH)
		end)
	end, SFX_PANEL)
	playSoundEffect(SFX_UI_DOCKYARD_CHARGET)

	slot0.hideParentList = {}

	eachChild(slot0._tf.parent, function (slot0)
		if slot0 ~= slot0._tf and slot0.gameObject.activeSelf then
			setActive(slot0, false)
			table.insert(slot0.hideParentList, slot0)
		end
	end)
end

function slot0.onBackPressed(slot0)
	if slot0.inAnimating then
		return
	end

	playSoundEffect(SFX_CANCEL)

	if slot0.isInView then
		slot0:hidePaintView(true)

		return
	end

	slot0:DestroyNewShipDocumentView()
	triggerButton(slot0.clickTF)
end

function slot0.paintView(slot0)
	slot1 = {}
	slot2 = slot0._shake.childCount
	slot3 = 0

	while slot2 > slot3 do
		if slot0._shake:GetChild(slot3).gameObject.activeSelf and slot4 ~= slot0._paintingTF and slot4 ~= slot0._bg and slot4 ~= slot0._drag then
			slot1[#slot1 + 1] = slot4

			setActive(slot4, false)
		end

		slot3 = slot3 + 1
	end

	setActive(slot0._paintingShadowTF, false)
	openPortrait()

	slot5 = slot0._paintingTF.anchoredPosition.x
	slot6 = slot0._paintingTF.anchoredPosition.y
	slot9 = slot0._tf.rect.width / UnityEngine.Screen.width
	slot10 = slot0._tf.rect.height / UnityEngine.Screen.height
	slot11 = slot0._paintingTF.rect.width / 2
	slot12 = slot0._paintingTF.rect.height / 2
	slot13, slot14 = nil

	if not LeanTween.isTweening(go(slot0._paintingTF)) then
		slot0:AddLeanTween(function ()
			return LeanTween.moveX(rtf(slot0), 150, 0.5):setEase(LeanTweenType.easeInOutSine)
		end)
	end

	slot15 = GetOrAddComponent(slot0._drag, "MultiTouchZoom")

	slot15:SetZoomTarget(slot0._paintingTF)

	slot16 = GetOrAddComponent(slot0._drag, "EventTriggerListener")
	slot0.dragTrigger = slot16
	slot17 = true
	slot15.enabled = true
	slot16.enabled = true
	slot18 = false

	slot16:AddPointDownFunc(function (slot0)
		if Input.touchCount == 1 or Application.isEditor then
			slot0 = true
			slot1 = true
		elseif Input.touchCount >= 2 then
			slot1 = false
			slot0 = false
		end
	end)
	slot16:AddPointUpFunc(function (slot0)
		if Input.touchCount <= 2 then
			slot0 = true
		end
	end)
	slot16:AddBeginDragFunc(function (slot0, slot1)
		slot0 = false
		slot5 = slot1.position.x *  - slot1.position.x - tf(slot4._paintingTF).localPosition.x.position.y * slot6 - slot7 - tf(slot4._paintingTF._paintingTF).localPosition.y
	end)
	slot16:AddDragFunc(function (slot0, slot1)
		if slot0 then
			tf(slot1._paintingTF).localPosition = Vector3(slot1.position.x * slot2 - slot3 - slot4, slot1.position.y * slot5 -  - slot1.position.y * slot5, -22)
		end
	end)
	onButton(slot0, slot0._drag, function ()
		slot0:hidePaintView()
	end, SFX_CANCEL)

	function slot0.hidePaintView(slot0, slot1)
		if not slot1 and not slot0 then
			return
		end

		slot1.enabled = false
		slot1.enabled = false

		for slot5, slot6 in ipairs(false) do
			setActive(slot6, true)
		end

		setActive(slot0._paintingShadowTF, true)
		closePortrait()
		LeanTween.cancel(go(slot0._paintingTF))

		slot0._paintingTF.localScale = Vector3(1, 1, 1)

		setAnchoredPosition(slot0._paintingTF, {
			x = slot4,
			y = slot4
		})

		slot0.isInView = false

		setActive(slot0.clickTF, true)
	end
end

function slot0.recyclePainting(slot0)
	if slot0._shipVO then
		retPaintingPrefab(slot0._paintingTF, slot0._shipVO:getPainting())
		retPaintingPrefab(slot0._paintingShadowTF, slot0._shipVO:getPainting())
	end
end

function slot0.starsAnimation(slot0)
	slot0.inAnimating = true

	if slot0._shipVO:getMaxStar() >= 6 and PlayerPrefs.GetInt(RARE_SHIP_VIBRATE, 1) > 0 then
		LuaHelper.Vibrate()
	end

	setActive(slot0.starsCont, false)

	slot2 = slot0._tf:GetComponent(typeof(DftAniEvent))

	slot2:SetTriggerEvent(function (slot0)
		slot0:AddLeanTween(function ()
			return LeanTween.scale(rtf(slot0.starsCont), Vector3.one, 0):setOnComplete(System.Action(function ()
				setActive(slot0.starsCont, true)
			end))
		end)

		slot1 = slot0.STAR_ANIMATION_DUR1

		for slot5 = 0, slot0.starsCont.childCount - 1, 1 do
			slot6 = slot0.starsCont:GetChild(slot5)

			setActive(slot7, false)
			setActive(slot8, false)

			slot9 = slot5 * slot1

			slot0:AddLeanTween(function ()
				return LeanTween.scale(rtf(slot0), Vector3(1.8, 1.8, 1.8), 0):setDelay(LeanTween.scale(rtf(slot0), Vector3(1.8, 1.8, 1.8), 0)):setOnComplete(System.Action(function ()
					setActive(setActive, true)
					setActive:AddLeanTween(function ()
						return LeanTween.scale(rtf(slot0), Vector3(1, 1, 1), )
					end)
				end))
			end)
		end

		slot3 = slot0.STAR_ANIMATION_DUR2
		slot4 = slot0.STAR_ANIMATION_DUR3

		for slot8 = 0, slot0._shipVO:getStar() - 1, 1 do
			slot9 = slot0.starsCont:GetChild(slot8)
			slot10 = slot9:Find("star_empty")
			slot11 = slot9:Find("star")
			slot12 = slot1 * slot0.starsCont.childCount + slot8 * slot3

			slot0:AddLeanTween(function ()
				return LeanTween.scale(rtf(slot0), Vector3(1.8, 1.8, 1.8), 0):setDelay(LeanTween.scale(rtf(slot0), Vector3(1.8, 1.8, 1.8), 0)):setOnStart(System.Action(function ()
					playSoundEffect(SFX_UI_DOCKYARD_STAR)
				end)):setOnComplete(System.Action(function ()
					setActive(setActive, false)
					setActive(setActive, true)
					slot2:AddLeanTween(function ()
						return LeanTween.scale(rtf(slot0), Vector3(1, 1, 1), )
					end)
				end))
			end)

			if slot9:Find("light") then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 89-110, warpins: 1 ---
				slot0:AddLeanTween(function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-9, warpins: 1 ---
					return LeanTween.delayedCall(LeanTween.delayedCall, System.Action(function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-4, warpins: 1 ---
						if slot0.exited then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 5-5, warpins: 1 ---
							return
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 6-10, warpins: 2 ---
						setActive(slot1, true)

						return
						--- END OF BLOCK #1 ---



					end))
					--- END OF BLOCK #0 ---



				end)
				slot0:AddLeanTween(function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-20, warpins: 1 ---
					return LeanTween.alpha(rtf(slot0), 0, ):setDelay(0):setOnComplete(System.Action(function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-13, warpins: 1 ---
						SetActive(SetActive, false)
						LeanTween.alpha(rtf(slot0), 1, 0)

						return
						--- END OF BLOCK #0 ---



					end))
					--- END OF BLOCK #0 ---



				end)

				slot13.transform.localScale = Vector3(1, 1, 1)

				slot0:AddLeanTween(function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-21, warpins: 1 ---
					return LeanTween.scale(rtf(slot0), Vector3(0.5, 1, 1), slot1.STAR_ANIMATION_DUR4):setDelay(Vector3(0.5, 1, 1) + (slot1.STAR_ANIMATION_DUR4 * 1) / 3)
					--- END OF BLOCK #0 ---



				end)
				--- END OF BLOCK #0 ---



			end
		end
	end)
	slot2:SetEndEvent(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-18, warpins: 1 ---
		slot0.inAnimating = false

		setActive(slot0.npc, slot0._shipVO:isActivityNpc())
		setActive(slot0._shade, false)

		return
		--- END OF BLOCK #0 ---



	end)
end

function slot0.ClearTweens(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0:cleanManagedTween(true)

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0:DestroyNewShipDocumentView()

	if slot0.scrollTxt then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-10, warpins: 1 ---
		slot0.scrollTxt:destroy()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-13, warpins: 2 ---
	if slot0.designBg then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-21, warpins: 1 ---
		PoolMgr.GetInstance():ReturnUI(slot0.designName, slot0.designBg)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 22-25, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 26-39, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.rarityEffect) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-27, warpins: 1 ---
		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-37, warpins: 1 ---
			PoolMgr.GetInstance():ReturnUI("getrole_" .. slot4, slot5)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 38-39, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 40-42, warpins: 1 ---
	if slot0.dragTrigger then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 43-47, warpins: 1 ---
		ClearEventTrigger(slot0.dragTrigger)

		slot0.dragTrigger = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 48-50, warpins: 2 ---
	if not slot0.isRemoulded then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 51-73, warpins: 1 ---
		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_newShipLayer_get", pg.ship_data_by_type[slot0._shipVO:getShipType()].type_name, slot0._shipVO:getName()), COLOR_GREEN)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 74-87, warpins: 2 ---
	slot0:recyclePainting()
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0._tf)

	if slot0._currentVoice then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 88-92, warpins: 1 ---
		slot0._currentVoice:Stop(true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 93-97, warpins: 2 ---
	slot0._currentVoice = nil

	if slot0.loadedCVBankName then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 98-104, warpins: 1 ---
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

		slot0.loadedCVBankName = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 105-112, warpins: 2 ---
	if LeanTween.isTweening(go(slot0.rarityTF)) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 113-118, warpins: 1 ---
		LeanTween.cancel(go(slot0.rarityTF))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 119-125, warpins: 2 ---
	cameraPaintViewAdjust(false)

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 126-136, warpins: 0 ---
	for slot4, slot5 in ipairs(slot0.hideParentList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 126-130, warpins: 1 ---
		if not IsNil(slot5) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 131-134, warpins: 1 ---
			setActive(slot5, true)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 135-136, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 137-137, warpins: 1 ---
	return
	--- END OF BLOCK #11 ---



end

function slot0.DisplayNewShipDocumentView(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-30, warpins: 1 ---
	slot0.newShipDocumentView = NewShipDocumentView.New(slot0._shake:Find("ForNotch"), slot0.event, slot0.contextData)

	slot0.newShipDocumentView:Load()
	slot0.newShipDocumentView:ActionInvoke("SetParams", slot0._shipVO, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if not slot0.isLoadBg then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-10, warpins: 2 ---
		slot0:showExitTip()

		return
		--- END OF BLOCK #1 ---



	end)
	slot0.newShipDocumentView:ActionInvoke("RefreshUI")

	return
	--- END OF BLOCK #0 ---



end

function slot0.DestroyNewShipDocumentView(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.newShipDocumentView and slot0.newShipDocumentView:CheckState(BaseSubView.STATES.INITED) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-16, warpins: 1 ---
		slot0.newShipDocumentView:Destroy()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-17, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

return slot0
