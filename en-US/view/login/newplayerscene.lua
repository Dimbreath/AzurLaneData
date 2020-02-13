slot0 = class("NewPlayerScene", import("..base.BaseUI"))
slot1 = 0.5
slot2 = -300
slot3 = Vector3(-380, 265, 0)
slot4 = 19
slot5 = {
	101171,
	201211,
	401231
}
slot6 = {
	[201211.0] = "biaoqiang",
	[301051.0] = "lingbo",
	[401231.0] = "z23",
	[101171.0] = "lafei"
}
slot7 = {
	[101171] = i18n("login_newPlayerScene_word_laFei"),
	[201211] = i18n("login_newPlayerScene_word_biaoqiang"),
	[401231] = i18n("login_newPlayerScene_word_z23")
}

function slot0.getUIName(slot0)
	return "NewPlayerUI"
end

function slot0.init(slot0)
	slot0.eventTriggers = {}
	slot0.characters = slot0:findTF("select_character/characters")
	slot0.propPanel = slot0:findTF("prop_panel")
	slot0.selectPanel = slot0:findTF("select_character")

	setActive(slot0.propPanel, false)
	setActive(slot0.selectPanel, true)

	slot0.confirmBtn = slot0:findTF("bg/qr_btn", slot0.propPanel)
	slot0.tip = slot0:findTF("select_character/tip")
	slot0.skillPanel = slot0:findTF("bg/skill_panel", slot0.propPanel)
	slot0.skillTpl = slot0:getTpl("bg/skill_panel/frame/skilltpl", slot0.propPanel)
	slot0.skillContainer = slot0:findTF("bg/skill_panel/frame", slot0.propPanel)
	slot0.namedPanel = slot0:findTF("named_panel")

	setActive(slot0.namedPanel, false)

	slot0.info = slot0.namedPanel:Find("info")
	slot0.nickname = slot0.info:Find("nickname")
	slot0.qChar = slot0.propPanel:Find("q_char")
	slot0.chat = slot0:findTF("info/tip/chatbgtop0/Text", slot0.namedPanel)
	slot0.propertyPanel = PropertyPanel.New(slot0.propPanel:Find("bg/property_panel/frame"))
	slot0.paintTF = slot0:findTF("prop_panel/bg/paint")
	slot0.nameTF = slot0:findTF("prop_panel/bg/name")
	slot0.nameEnTF = slot0:findTF("prop_panel/bg/english_name_bg")
	slot0.titleShipinfoTF = slot0:findTF("lines/hori/shipinfo_text")
	slot0.titleShipchooseTF = slot0:findTF("lines/hori/shipchoose_text")

	setImageAlpha(slot0.titleShipinfoTF, 1)
	setImageAlpha(slot0.titleShipchooseTF, 0)

	slot0.randBtn = findTF(slot0.info, "random_button")

	setActive(slot0.randBtn, PLATFORM_CODE == PLATFORM_CH)
end

function slot0.onBackPressed(slot0)
	if LeanTween.isTweening(go(slot0.propPanel)) then
		return
	end

	playSoundEffect(SFX_CANCEL)

	if isActive(slot0.namedPanel) then
		slot0:closeNamedPanel()

		return
	end

	pg.SdkMgr.GetInstance():OnAndoridBackPress()
end

function slot0.switchPanel(slot0)
	setActive(slot0.propPanel, true)

	slot1 = slot0.propPanel:GetComponent(typeof(CanvasGroup))
	slot2 = slot0.selectPanel:GetComponent(typeof(CanvasGroup))

	LeanTween.value(go(slot0.propPanel), 0, 1, 0.5):setOnUpdate(System.Action_float(function (slot0)
		slot0.alpha = slot0
		slot0.alpha = 1 - slot0
	end)):setOnComplete(System.Action(function ()
		setActive(slot0.selectPanel, false)
	end))

	slot0.skillPanel.localPosition = Vector3.New(-1000, slot0.skillPanel.localPosition.y, slot0.skillPanel.localPosition.z)

	LeanTween.moveX(slot0.skillPanel, 339, 0.2)
	LeanTween.moveY(slot3, -328, 0.2)
	LeanTween.moveX(slot4, -820, 0.2)

	for slot8 = 1, 3, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 84-136, warpins: 2 ---
		slot9 = slot0:findTF("character_" .. slot8, slot0.characters)

		setImageAlpha(slot9, 1)
		LeanTween.alpha(slot9, 0, 0.25)
		LeanTween.move(go(slot9), slot0:findTF("bg/characters/character_" .. slot8, slot0.propPanel).position, 0.3)
		setImageAlpha(slot0.titleShipinfoTF, 0)
		setImageAlpha(slot0.titleShipchooseTF, 1)
		LeanTween.alpha(slot0.titleShipinfoTF, 1, 0.25)
		LeanTween.alpha(slot0.titleShipchooseTF, 0, 0.25)
		--- END OF BLOCK #0 ---



	end
end

function slot0.initCharacters(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0.charInitPos = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-20, warpins: 0 ---
	for slot4 = 1, 3, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-20, warpins: 2 ---
		onToggle(slot0, slot0:findTF("prop_panel/bg/characters/character_" .. slot4), function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-2, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 3-32, warpins: 1 ---
				slot0:selectCharacterByIdx(slot0.selectCharacterByIdx, slot2[slot0.selectCharacterByIdx])
				setActive(slot0:findTF("selected", setActive), true)

				setActive:GetComponent(typeof(RectTransform)).sizeDelta = Vector2(196, 196)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-53, warpins: 1 ---
				setActive(slot0:findTF("selected", setActive), false)

				setActive:GetComponent(typeof(RectTransform)).sizeDelta = Vector2(140, 140)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 54-54, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 21-25, warpins: 1 ---
	slot1 = {
		0.2,
		0.3,
		0.1
	}

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 26-72, warpins: 0 ---
	for slot5 = 1, 3, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-72, warpins: 2 ---
		slot6 = slot0:findTF("character_" .. slot5, slot0.characters)

		onButton(slot0, slot6, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-15, warpins: 1 ---
			slot0:switchPanel()
			triggerToggle(slot0:findTF("prop_panel/bg/characters/character_" .. slot0.findTF), true)

			return
			--- END OF BLOCK #0 ---



		end)

		slot6.localPosition = Vector3.New(slot6.localPosition.x, 912, slot6.localPosition.z)

		setImageAlpha(slot6, 0)
		LeanTween.alpha(slot6, 1, 0.3):setDelay(slot1[slot5])
		LeanTween.moveY(slot6, 0, 0.2):setDelay(slot1[slot5])
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 73-74, warpins: 1 ---
	return
	--- END OF BLOCK #4 ---



end

function slot0.didEnter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-37, warpins: 1 ---
	onButton(slot0, slot0.confirmBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:showNamedPanel()

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, findTF(slot0.info, "random_button"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-41, warpins: 1 ---
		slot0 = require("GameCfg.names")

		setInputText(slot0.nickname, slot1 .. slot0[2][math.random(#slot0[2])] .. slot0[3][math.random(#slot0[3])] .. slot0[4][math.random(#slot0[4])])

		return
		--- END OF BLOCK #0 ---



	end, SFX_MAIN)
	onButton(slot0, findTF(slot0.info, "btn_container/enter_button"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		if not slot0.contextData.configId then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-16, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(i18n("login_newPlayerScene_error_notChoiseShip"))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 17-22, warpins: 2 ---
		if getInputText(slot0.nickname) == "" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-33, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(i18n("login_newPlayerScene_inputName"))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 34-41, warpins: 2 ---
		if not nameValidityCheck(slot0, 4, 14, {
			"spece_illegal_tip",
			"login_newPlayerScene_name_tooShort",
			"login_newPlayerScene_name_tooLong",
			"login_newPlayerScene_invalideName"
		}) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-42, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 43-54, warpins: 2 ---
		slot0.event:emit(NewPlayerMediator.ON_CREATE, slot0, slot0.contextData.configId)

		return
		--- END OF BLOCK #3 ---



	end, SFX_CONFIRM)
	onButton(slot0, findTF(slot0.info, "btn_container/cancel_button"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:closeNamedPanel()

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:initCharacters()

	return
	--- END OF BLOCK #0 ---



end

slot8 = 0.3
slot9 = -47

function slot0.selectCharacterByIdx(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-57, warpins: 1 ---
	slot0.inProp = true
	slot0.contextData.configId = slot2

	slot0.propertyPanel:initProperty(slot2)
	slot0:initSkills()
	setPaintingPrefab(slot0.paintTF, slot0[slot2], "chuanwu")
	setText(slot0:findTF("name_mask/Text", slot0.nameTF), pg.ship_data_statistics[slot2].name)
	setText(slot0:findTF("english_name", slot0.nameTF), pg.ship_data_statistics[slot2].english_name)
	setText(slot0.nameEnTF, string.upper(pg.ship_data_statistics[slot2].english_name))

	if Ship.New({
		configId = slot0.contextData.configId
	}).getPrefab(slot4) == slot0.shipPrefab then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 58-58, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 59-79, warpins: 1 ---
	slot0:recycleSpineChar()
	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetSpineChar(slot5, true, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-59, warpins: 1 ---
		pg.UIMgr.GetInstance():LoadingOff()

		slot0.shipPrefab = slot0
		slot0.shipModel = slot0

		slot0:GetComponent("SpineAnimUI"):SetAction("stand", 0)

		tf(slot0).localScale = Vector3(0.5, 0.5, 1)
		tf(slot0).localPosition = Vector3(15, -95, 0)

		pg.ViewUtils.SetLayer(tf(slot0), Layer.UI)
		removeAllChildren(slot0.qChar)
		SetParent(slot0, slot0.qChar, false)

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 80-80, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

function slot0.initSkills(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	removeAllChildren(slot0.skillContainer)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-49, warpins: 0 ---
	for slot5, slot6 in ipairs(pg.ship_data_template[slot0.contextData.configId].buff_list_display) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-47, warpins: 1 ---
		slot9 = cloneTplTo(slot0.skillTpl, slot0.skillContainer)

		setActive(slot9:Find("mask"), not table.contains(slot1.buff_list, slot6))
		onButton(slot0, slot9, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			slot0:emit(NewPlayerMediator.ON_SKILLINFO, slot1.id)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		LoadImageSpriteAsync("skillicon/" .. getSkillConfig(slot6).icon, findTF(slot9, "icon"))
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 48-49, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 50-51, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.showNamedPanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-29, warpins: 1 ---
	slot0.qChar:SetParent(slot0.info)
	pg.UIMgr.GetInstance():BlurPanel(slot0.namedPanel)
	setActive(slot0.namedPanel, true)
	setInputText(slot0.nickname, "")
	setText(slot0.chat, slot0[slot0.contextData.configId])

	return
	--- END OF BLOCK #0 ---



end

function slot0.closeNamedPanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	pg.UIMgr.GetInstance():UnblurPanel(slot0.namedPanel, slot0._tf)
	setActive(slot0.namedPanel, false)
	slot0.qChar:SetParent(slot0.propPanel)

	return
	--- END OF BLOCK #0 ---



end

function slot0.recycleSpineChar(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.shipPrefab and slot0.shipModel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-18, warpins: 1 ---
		PoolMgr.GetInstance():ReturnSpineChar(slot0.shipPrefab, slot0.shipModel)

		slot0.shipPrefab = nil
		slot0.shipModel = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



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
	--- BLOCK #1 15-18, warpins: 2 ---
	slot0:closeNamedPanel()

	return
	--- END OF BLOCK #1 ---



end

return slot0
