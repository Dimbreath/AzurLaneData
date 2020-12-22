slot0 = class("TechnologySettingsLayer", import("..base.BaseUI"))
slot0.TEC_PAGE_TENDENCY = 1
slot0.TEC_PAGE_CATCHUP_TARGET = 2
slot0.TEC_PAGE_CATCHUP_ACT = 3
slot0.PANEL_INTO_TIME = 0.15
slot0.SELECT_TENDENCY_FADE_TIME = 0.3
slot0.SELECT_CHAR_LIGHT_FADE_TIME = 0.3

function slot0.getUIName(slot0)
	return "TechnologySettingsUI"
end

function slot0.init(slot0)
	slot0:initData()
	slot0:findUI()
	slot0:addListener()
	slot0:initTendencyPage()
	slot0:initTargetCatchupPage()
	slot0:initActCatchupPage()

	if slot0.technologyProxy:isOnCatchup() and not slot0.technologyProxy:isOnCatchupNewest() then
		slot0:initGiveUpMsgBox()
	end
end

function slot0.didEnter(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
	slot0:resetLeftBtnUnsel()
	slot0:updateTendencyBtn(slot0.curTendency)
	slot0:updateTargetCatchupBtn()
	slot0:updateActCatchupBtn()
	triggerButton(slot0.leftBtnList[1])
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)

	if slot0.actCatchupTimer then
		slot0.actCatchupTimer:Stop()

		slot0.actCatchupTimer = nil
	end

	slot0.loader:Clear()
end

function slot0.initData(slot0)
	slot0.technologyProxy = getProxy(TechnologyProxy)
	slot0.bayProxy = getProxy(BayProxy)
	slot0.bagProxy = getProxy(BagProxy)
	slot0.curPageID = 0
	slot0.curTendency = slot0.technologyProxy:getTendency(2)
	slot0.curSelectedIndex = 0
	slot0.reSelectTag = false
	slot0.actCatchup = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BLUEPRINT_CATCHUP)
	slot0.isShowActCatchup = slot0.actCatchup and not slot0.actCatchup:isEnd()
	slot0.loader = AutoLoader.New()
end

function slot0.findUI(slot0)
	slot0.bg = slot0:findTF("BG")

	setText(slot0:findTF("BackTips/ClickText", slot0.bg), i18n("click_back_tip"))

	slot2 = slot0:findTF("Panel")
	slot3 = slot0:findTF("LeftBtnList", slot2)
	slot0.tendencyBtn = slot0:findTF("TendencyBtn", slot3)
	slot0.targetCatchupBtn = slot0:findTF("TargetCatchupBtn", slot3)
	slot0.actCatchupBtn = slot0:findTF("ActCatchupBtn", slot3)
	slot0.leftBtnList = {
		[uv0.TEC_PAGE_TENDENCY] = slot0.tendencyBtn,
		[uv0.TEC_PAGE_CATCHUP_TARGET] = slot0.targetCatchupBtn,
		[uv0.TEC_PAGE_CATCHUP_ACT] = slot0.actCatchupBtn
	}
	slot4 = slot0:findTF("RightPanelContainer", slot2)
	slot0.tendencyPanel = slot0:findTF("TecTendencyPanel", slot4)
	slot0.targetCatchupPanel = slot0:findTF("TargetCatchupPanel", slot4)
	slot0.actCatchupPanel = slot0:findTF("ActCatchupPanel", slot4)
	slot0.rightPageTFList = {
		[uv0.TEC_PAGE_TENDENCY] = slot0.tendencyPanel,
		[uv0.TEC_PAGE_CATCHUP_TARGET] = slot0.targetCatchupPanel,
		[uv0.TEC_PAGE_CATCHUP_ACT] = slot0.actCatchupPanel
	}
	slot0.giveupMsgBox = slot0:findTF("GiveUpMsgBox")
end

function slot0.addListener(slot0)
	function slot4()
		uv0:closeView()
	end

	slot5 = SFX_PANEL

	onButton(slot0, slot0.bg, slot4, slot5)

	for slot4, slot5 in pairs(slot0.leftBtnList) do
		onButton(slot0, slot5, function ()
			if uv0.onPageSwitchAnim then
				return
			end

			if uv0.curPageID ~= uv1 then
				uv0:resetLeftBtnUnsel()
				setActive(uv0:findTF("Selected", uv2), true)
				uv0:switchRightPage(uv1)
			end
		end, SFX_PANEL)
	end
end

function slot0.resetLeftBtnUnsel(slot0)
	for slot4, slot5 in pairs(slot0.leftBtnList) do
		setActive(slot0:findTF("Selected", slot5), false)
	end
end

function slot0.switchRightPage(slot0, slot1)
	slot3 = slot0.rightPageTFList[slot1]

	setActive(slot3, true)

	slot0.onPageSwitchAnim = true

	slot0:managedTween(LeanTween.alphaCanvas, function ()
		uv0.onPageSwitchAnim = false
	end, GetOrAddComponent(slot3, typeof(CanvasGroup)), 1, uv0.PANEL_INTO_TIME):setFrom(0)

	if slot0.rightPageTFList[slot0.curPageID] then
		slot0:managedTween(LeanTween.alphaCanvas, function ()
			setActive(uv0, false)
		end, GetOrAddComponent(slot2, typeof(CanvasGroup)), 0, uv0.PANEL_INTO_TIME):setFrom(1)
	end

	slot0.curPageID = slot1

	if slot1 == uv0.TEC_PAGE_TENDENCY then
		slot0:updateTendencyPage(slot0.curTendency)
	elseif slot1 == uv0.TEC_PAGE_CATCHUP_TARGET then
		slot0:updateTargetCatchupPage()
	elseif slot1 == uv0.TEC_PAGE_CATCHUP_ACT then
		slot0:updateActCatchupPage()
	end
end

function slot0.initTendencyPage(slot0)
	slot0.tendencyItemList = {}

	for slot7 = 1, slot0:findTF("TecItemList", slot0.tendencyPanel).childCount do
		slot8 = slot1:GetChild(slot7 - 1)

		table.insert(slot0.tendencyItemList, slot8)

		slot11 = "tec_tendency_" .. slot7 - 1

		setText(slot0:findTF("UnSelect/Text", slot8), i18n(slot11))
		setText(slot0:findTF("Selected/Text", slot8), i18n(slot11))
	end

	slot0.tendencyNumList = {}

	eachChild(slot0:findTF("TendencyNum", slot0.tendencyPanel), function (slot0)
		table.insert(uv0.tendencyNumList, 1, slot0)
	end)

	for slot8, slot9 in ipairs(slot0.tendencyItemList) do
		onButton(slot0, slot9, function ()
			if uv0.curTendency ~= uv1 - 1 then
				uv0:emit(TechnologySettingsMediator.CHANGE_TENDENCY, uv1 - 1)
			end
		end, SFX_PANEL)
	end
end

function slot0.updateTendencyPage(slot0, slot1)
	slot0.curTendency = slot1

	for slot5, slot6 in ipairs(slot0.tendencyItemList) do
		setActive(slot0:findTF("Selected", slot6), slot1 == slot5 - 1)

		if slot1 == slot5 - 1 then
			slot8 = slot0:findTF("Image", slot7)

			setImageAlpha(slot8, 0)
			slot0:managedTween(LeanTween.alpha, nil, rtf(slot8), 1, uv0.SELECT_TENDENCY_FADE_TIME):setFrom(0)
		end
	end

	for slot5, slot6 in ipairs(slot0.tendencyNumList) do
		setActive(slot6, slot5 == slot1)

		if slot5 == slot1 then
			setImageAlpha(slot6, 0)
			slot0:managedTween(LeanTween.alpha, nil, rtf(slot6), 1, uv0.SELECT_TENDENCY_FADE_TIME):setFrom(0)
		end
	end
end

function slot0.updateTendencyBtn(slot0, slot1)
	slot4 = "tec_tendency_cur_" .. slot1

	setText(slot0:findTF("UnSelect/Text", slot0.tendencyBtn), i18n(slot4))
	setText(slot0:findTF("Selected/Text", slot0.tendencyBtn), i18n(slot4))
end

function slot0.initTargetCatchupPage(slot0)
	slot0.choosePanel = slot0:findTF("ChoosePanel", slot0.targetCatchupPanel)
	slot0.selectedImgUIItemList = UIItemList.New(slot0:findTF("SelectedImgList", slot0.choosePanel), slot0:findTF("SelectedImgTpl", slot0.choosePanel))
	slot0.charUIItemList = UIItemList.New(slot0:findTF("CharList", slot0.choosePanel), slot0:findTF("CharTpl", slot0.choosePanel))
	slot0.charListImg = slot0:findTF("CharListBG", slot0.choosePanel)
	slot0.confirmBtn = slot0:findTF("ConfirmBtn", slot0.choosePanel)

	slot0.selectedImgUIItemList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setActive(uv0:findTF("Selected", slot2), slot1 + 1 == uv0.curSelectedIndex)

			if slot1 == uv0.curSelectedIndex then
				setImageAlpha(slot3, 0)
				uv0:managedTween(LeanTween.alpha, nil, rtf(slot3), 1, uv1.SELECT_CHAR_LIGHT_FADE_TIME):setFrom(0)
			end
		end
	end)

	slot8 = #pg.technology_catchup_template[slot0.technologyProxy:getNewestCatchupTecID()].char_choice

	slot0.charUIItemList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			uv0:updateCharTpl(slot1 + 1, slot2)
			onButton(uv0, slot2, function ()
				if uv0 ~= uv1.curSelectedIndex then
					uv1.curSelectedIndex = uv0

					uv1.selectedImgUIItemList:align(uv2)
				end
			end, SFX_PANEL)
		end
	end)
	onButton(slot0, slot0.confirmBtn, function ()
		if uv0.curSelectedIndex and uv0.curSelectedIndex ~= 0 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("tec_target_catchup_select_tip", HXSet.hxLan(ShipGroup.getDefaultShipNameByGroupID(uv1[uv0.curSelectedIndex]))),
				onYes = function ()
					if not uv0.reSelectTag then
						pg.m02:sendNotification(GAME.SELECT_TEC_TARGET_CATCHUP, {
							charID = uv1
						})
					else
						pg.m02:sendNotification(GAME.RESELECT_TEC_TARGET_CATCHUP, {
							charID = uv1
						})

						uv0.reSelectTag = false
					end
				end
			})
		end
	end, SFX_PANEL)

	slot0.showPanel = slot0:findTF("ShowPanel", slot0.targetCatchupPanel)
	slot0.showBG = slot0:findTF("BG", slot0.showPanel)
	slot0.nameText = slot0:findTF("NameText", slot0.showPanel)
	slot0.progressText = slot0:findTF("Progress/ProgressText", slot0.showPanel)
	slot0.selectedImg = slot0:findTF("Selected", slot0.showPanel)
	slot0.giveupBtn = slot0:findTF("GiveupBtn", slot0.showPanel)
	slot0.helpBtn = slot0:findTF("HelpBtn", slot0.targetCatchupPanel)

	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.tec_target_catchup_help_tip.tip
		})
	end, SFX_PANEL)
end

function slot0.updateTargetCatchupPage(slot0)
	slot1 = slot0.technologyProxy:isOnCatchup()

	setActive(slot0.showPanel, slot1)
	setActive(slot0.choosePanel, not slot1)

	if not slot1 then
		slot0:updateChoosePanel()
	else
		slot0:updateShowPanel()
	end
end

function slot0.updateChoosePanel(slot0, slot1)
	slot4 = slot1 and slot1 or slot0.technologyProxy:getNewestCatchupTecID()
	slot6 = #pg.technology_catchup_template[slot4].char_choice

	setImageSprite(slot0.choosePanel, LoadSprite("TecCatchup/ChooseBG", "ChooseBG"))
	setImageSprite(slot0.charListImg, LoadSprite("TecCatchup/Target" .. slot4, "Target" .. slot4))
	slot0.selectedImgUIItemList:align(slot6)
	slot0.charUIItemList:align(slot6)
end

function slot0.updateCharTpl(slot0, slot1, slot2)
	setText(slot0:findTF("PrintNum/Text", slot2), i18n("tec_target_need_print"))

	slot11 = pg.technology_catchup_template[slot0.technologyProxy:getNewestCatchupTecID()].char_choice[slot1]

	setText(slot0:findTF("PrintNum/NumText", slot2), math.max(slot8[slot9].blueprint_max[slot1] - (slot0.bayProxy:findShipByGroup(slot11) and math.floor(slot0:getShipBluePrintCurExp(slot0.technologyProxy:getBluePrintVOByGroupID(slot11)) / pg.item_data_template[pg.ship_data_blueprint[slot11].strengthen_item].usage_arg[1]) or 0), 0))
	setText(slot0:findTF("NameText", slot2), HXSet.hxLan(ShipGroup.getDefaultShipNameByGroupID(slot11)))
	setActive(slot0:findTF("LevelText", slot2), slot12)
	setActive(slot0:findTF("NotGetTag", slot2), not slot12)

	if slot12 then
		slot19 = slot0.technologyProxy:getBluePrintVOByGroupID(slot11)

		setText(slot6, "Lv. " .. slot19.level .. "/" .. slot19:getMaxLevel())
	end
end

function slot0.updateShowPanel(slot0)
	setText(slot0:findTF("Progress/Text", slot0.showPanel), i18n("tec_target_catchup_progress"))

	slot7 = slot0:findTF("GiveupBtn", slot0.showPanel)
	slot8 = slot0.technologyProxy:getCurCatchupTecInfo()
	slot10 = slot8.groupID
	slot11 = slot8.printNum

	setImageSprite(slot0:findTF("BG", slot0.showPanel), LoadSprite("TecCatchup/selbg" .. slot10, slot10))
	setText(slot0:findTF("NameText", slot0.showPanel), HXSet.hxLan(ShipGroup.getDefaultShipNameByGroupID(slot10)))

	slot13 = pg.technology_catchup_template[slot8.tecID].obtain_max

	setText(slot0:findTF("Progress/ProgressText", slot0.showPanel), slot11 .. "/" .. slot13)

	if not slot0.technologyProxy:isOnCatchupNewest() then
		setActive(slot7, true)

		if not (slot13 <= slot11) then
			setActive(slot0:findTF("Selected", slot0.showPanel), true)
			setActive(slot0:findTF("Finished", slot0.showPanel), false)
		else
			setActive(slot5, false)
			setActive(slot6, true)
		end

		onButton(slot0, slot7, function ()
			uv0:openGiveupPanel()
		end, SFX_PANEL)
	else
		setActive(slot5, not slot15)
		setActive(slot6, slot15)
		setActive(slot7, false)
		onButton(slot0, slot5, function ()
			uv0.reSelectTag = true

			uv0:updateChoosePanel(uv1)
			setActive(uv0.showPanel, false)
			setActive(uv0.choosePanel, true)
		end, SFX_PANEL)
	end
end

function slot0.updateTargetCatchupBtn(slot0)
	slot3 = slot0:findTF("UnSelect/CharImg", slot0.targetCatchupBtn)
	slot4 = slot0:findTF("Selected/CharImg", slot0.targetCatchupBtn)
	slot7 = slot0.technologyProxy:isOnCatchup()

	setActive(slot3, slot7)
	setActive(slot4, slot7)

	if slot7 then
		setText(slot0:findTF("UnSelect/Text", slot0.targetCatchupBtn), i18n("tec_target_catchup_selected"))
		setText(slot0:findTF("Selected/Text", slot0.targetCatchupBtn), i18n("tec_target_catchup_selected"))

		slot8 = slot0.technologyProxy:getCurCatchupTecInfo()
		slot10 = slot8.groupID
		slot11 = slot8.printNum
		slot12 = pg.technology_catchup_template[slot8.tecID].obtain_max

		setImageSprite(slot3, LoadSprite("TecCatchup/QChar" .. slot10, tostring(slot10)))
		setImageSprite(slot4, LoadSprite("TecCatchup/QChar" .. slot10, tostring(slot10)))
		setText(slot0:findTF("ProgressText", slot3), slot11 .. "/" .. slot12)
		setText(slot0:findTF("ProgressText", slot4), slot11 .. "/" .. slot12)
	else
		setText(slot1, i18n("tec_target_catchup_none"))
		setText(slot2, i18n("tec_target_catchup_none"))
	end
end

function slot0.initActCatchupPage(slot0)
	if slot0.isShowActCatchup then
		slot0.loader:GetPrefab("ui/" .. slot0.actCatchup:getConfig("page_info").ui_name, "", function (slot0)
			setParent(slot0, uv0.actCatchupPanel)
			setLocalScale(slot0, {
				x = 0.925,
				y = 0.923
			})
			setAnchoredPosition(slot0, Vector2.zero)

			uv0.actCatchupTF = uv0:findTF("AD", tf(slot0))
			uv0.actCatchupItemTF = uv0:findTF("Award", uv0.actCatchupTF)
			uv0.actCatchupSliderTF = uv0:findTF("Slider", uv0.actCatchupTF)
			uv0.actCatchupProgressText = uv0:findTF("Progress", uv0.actCatchupTF)

			setActive(uv0:findTF("GoBtn", uv0.actCatchupTF), false)
			setActive(uv0:findTF("FinishBtn", uv0.actCatchupTF), false)

			slot3 = uv0.actCatchup.data1
			slot5 = pg.activity_event_blueprint_catchup[uv0.actCatchup:getConfig("config_id")].obtain_max

			updateDrop(uv0.actCatchupItemTF, {
				count = 1,
				type = DROP_TYPE_ITEM,
				id = uv0.actCatchup:getConfig("config_client").itemid
			})
			onButton(uv0, uv0.actCatchupItemTF, function ()
				uv0:emit(BaseUI.ON_DROP, uv1)
			end, SFX_PANEL)
			setSlider(uv0.actCatchupSliderTF, 0, slot5, slot3)
			setText(uv0.actCatchupProgressText, slot3 .. "/" .. slot5)
			setActive(slot0, true)
		end)
	end
end

function slot0.updateActCatchupPage(slot0)
end

function slot0.updateActCatchupBtn(slot0)
	setText(slot0:findTF("UnSelect/Text", slot0.actCatchupBtn), i18n("tec_act_catchup_btn_word"))
	setText(slot0:findTF("Selected/Text", slot0.actCatchupBtn), i18n("tec_act_catchup_btn_word"))

	slot7 = false

	if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BLUEPRINT_CATCHUP) and not slot8:isEnd() then
		slot9 = slot8.data1
		slot10 = slot8:getConfig("config_id")
		slot11 = pg.activity_event_blueprint_catchup[slot10].char_choice
		slot12 = pg.activity_event_blueprint_catchup[slot10].obtain_max

		setImageSprite(slot3, LoadSprite("TecCatchup/QChar" .. slot11, tostring(slot11)))
		setImageSprite(slot4, LoadSprite("TecCatchup/QChar" .. slot11, tostring(slot11)))
		setText(slot0:findTF("ProgressText", slot0:findTF("UnSelect/CharImg", slot0.actCatchupBtn)), slot9 .. "/" .. slot12)
		setText(slot0:findTF("ProgressText", slot0:findTF("Selected/CharImg", slot0.actCatchupBtn)), slot9 .. "/" .. slot12)

		slot13 = slot8.stopTime - pg.TimeMgr.GetInstance():GetServerTime()

		if slot0.actCatchupTimer then
			slot0.actCatchupTimer:Stop()

			slot0.actCatchupTimer = nil
		end

		slot14 = slot0:findTF("TimeLeft/Day", slot0.actCatchupBtn)
		slot15 = slot0:findTF("TimeLeft/Hour", slot0.actCatchupBtn)
		slot16 = slot0:findTF("TimeLeft/Min", slot0.actCatchupBtn)
		slot17 = slot0:findTF("TimeLeft/NumText", slot0.actCatchupBtn)
		slot0.actCatchupTimer = Timer.New(function ()
			slot0, slot1, slot2, slot3 = pg.TimeMgr.GetInstance():parseTimeFrom(uv0)
			uv0 = uv0 - 1

			if slot0 >= 1 then
				setActive(uv1, true)
				setActive(uv2, false)
				setActive(uv3, false)
				setText(uv4, slot0)
			elseif slot0 <= 0 and slot1 > 0 then
				setActive(uv1, false)
				setActive(uv2, true)
				setActive(uv3, false)
				setText(uv4, slot1)
			elseif slot0 <= 0 and slot1 <= 0 and (slot2 > 0 or slot3 > 0) then
				setActive(uv1, false)
				setActive(uv2, false)
				setActive(uv3, true)
				setText(uv4, math.max(slot2, 1))
			elseif slot0 <= 0 and slot1 <= 0 and slot2 <= 0 and slot3 <= 0 and uv5.actCatchupTimer then
				uv5.actCatchupTimer:Stop()

				uv5.actCatchupTimer = nil

				uv5:switchRightPage(uv6.TEC_PAGE_TENDENCY)
				setActive(uv5.actCatchupBtn, false)
			end
		end, 1, -1, 1)

		slot0.actCatchupTimer:Start()
		slot0.actCatchupTimer.func()

		slot7 = true
	end

	setActive(slot0.actCatchupBtn, slot7)
end

function slot0.initGiveUpMsgBox(slot0)
	slot0.giveupMsgboxIntro = slot0.giveupMsgBox:Find("window/info/intro")
	slot0.giveupMsgBoxConfirmBtn = slot0.giveupMsgBox:Find("window/button_container/confirm_btn")
	slot0.giveupMsgBoxCancelBtn = slot0.giveupMsgBox:Find("window/button_container/cancel_btn")
	slot0.giveupMsgBoxInput = slot0.giveupMsgBox:Find("window/info/InputField")
	slot0.giveupMsgboxBackBtn = slot0.giveupMsgBox:Find("window/top/btnBack")

	onButton(slot0, slot0.giveupMsgBoxConfirmBtn, function ()
		if not getInputText(uv0.giveupMsgBoxInput) or slot0 == "" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("word_should_input"))

			return
		end

		if slot0 ~= i18n("tec_target_catchup_giveup_confirm") then
			pg.TipsMgr.GetInstance():ShowTips(i18n("tec_target_catchup_giveup_input_err"))

			return
		end

		pg.m02:sendNotification(GAME.SELECT_TEC_TARGET_CATCHUP, {
			charID = 0
		})
		uv0:closeGiveupPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.giveupMsgBoxCancelBtn, function ()
		uv0:closeGiveupPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.giveupMsgboxBackBtn, function ()
		uv0:closeGiveupPanel()
	end, SFX_PANEL)
end

function slot0.openGiveupPanel(slot0)
	setActive(slot0.giveupMsgBox, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.giveupMsgBox)

	slot0.giveupMsgboxIntro = slot0.giveupMsgBox:Find("window/info/intro")

	setText(slot0.giveupMsgboxIntro, i18n("tec_target_catchup_giveup_tip", ShipGroup.getDefaultShipNameByGroupID(slot0.technologyProxy:getCurCatchupTecInfo().groupID)))
end

function slot0.closeGiveupPanel(slot0)
	setActive(slot0.giveupMsgBox, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.giveupMsgBox)
end

function slot0.getShipBluePrintCurExp(slot0, slot1)
	slot3 = slot1.fateLevel
	slot6 = slot1:getConfig("fate_strengthen")

	for slot11 = 1, slot1.level do
		slot7 = 0 + slot1.exp + pg.ship_strengthen_blueprint[slot1:getConfig("strengthen_effect")[slot11]].need_exp
	end

	for slot11 = 1, slot3 do
		slot7 = slot7 + pg.ship_strengthen_blueprint[slot6[slot11]].need_exp
	end

	return slot7
end

return slot0
