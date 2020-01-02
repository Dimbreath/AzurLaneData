slot0 = class("CommanderTalentPanel", import("...base.BasePanel"))
slot1 = 1
slot2 = 2
slot3 = 3
slot4 = 4

function slot0.init(slot0)
	slot0.resetTimeTF = slot0:findTF("frame/point/reset_frame/reset_time")
	slot0.resetTimeTxt = slot0:findTF("frame/point/reset_frame/reset_time/Text"):GetComponent(typeof(Text))
	slot0.resetTimeBtn = slot0:findTF("frame/point/reset_frame/reset_btn")
	slot0.pointTxt = slot0:findTF("frame/point/usage_frame/point/Text"):GetComponent(typeof(Text))
	slot0.useBtn = slot0:findTF("frame/point/usage_frame/use_btn")
	slot0.usagePanel = slot0:findTF("useage_panel")
	slot0.usageList = UIItemList.New(slot0:findTF("bg/frame/bg/talents/content", slot0.usagePanel), slot0:findTF("bg/frame/bg/talents/content/talent", slot0.usagePanel))
	slot0.usageCancelBtn = slot0:findTF("bg/frame/cancel_btn", slot0.usagePanel)
	slot0.usageConfirmBtn = slot0:findTF("bg/frame/confirm_btn", slot0.usagePanel)
	slot0.usageConfirmUpgrade = slot0:findTF("bg/frame/confirm_btn/upgrade", slot0.usagePanel)
	slot0.usageConfirmILearned = slot0:findTF("bg/frame/confirm_btn/learned", slot0.usagePanel)
	slot0.usageTalent = slot0:findTF("bg/frame/bg/talent", slot0.usagePanel)
	slot0.usageCostIconTF = slot0:findTF("bg/frame/consume/Image", slot0.usagePanel)
	slot0.usageCostTxtTF = slot0:findTF("bg/frame/consume/Text", slot0.usagePanel)
	slot0.usageCostTxt = slot0.usageCostTxtTF:GetComponent(typeof(Text))
	slot0.usageCloseBtn = slot0:findTF("bg/frame/close_btn", slot0.usagePanel)

	setActive(slot0.usagePanel, false)

	slot0.resetPanel = slot0:findTF("reset_panel")
	slot0.resetCancelBtn = slot0:findTF("bg/frame/cancel_btn", slot0.resetPanel)
	slot0.resetConfirmBtn = slot0:findTF("bg/frame/confirm_btn", slot0.resetPanel)
	slot0.resetCloseBtn = slot0:findTF("bg/frame/close_btn", slot0.resetPanel)
	slot0.resetGoldTxt = slot0:findTF("bg/frame/bg/tip/texts/Text", slot0.resetPanel):GetComponent(typeof(Text))
	slot0.resetPointTxt = slot0:findTF("bg/frame/bg/tip/texts1/Text", slot0.resetPanel):GetComponent(typeof(Text))
	slot0.resetList = UIItemList.New(slot0:findTF("bg/frame/bg/talents/content", slot0.resetPanel), slot0:findTF("bg/frame/bg/talents/content/talent_tpl", slot0.resetPanel))

	setActive(slot0.resetPanel, false)

	slot0.replacePanel = slot0:findTF("replace_panel")
	slot0.replaceList = UIItemList.New(slot0:findTF("bg/frame/bg/talents/content", slot0.replacePanel), slot0:findTF("bg/frame/bg/talents/content/talent", slot0.replacePanel))
	slot0.replaceTargetTF = slot0:findTF("bg/frame/bg/talent", slot0.replacePanel)
	slot0.replaceTalent = slot0:findTF("bg/frame/bg/replace", slot0.replacePanel)
	slot0.replaceCloseBtn = slot0:findTF("bg/frame/close_btn", slot0.replacePanel)
	slot0.replaceCancelBtn = slot0:findTF("bg/frame/cancel_btn", slot0.replacePanel)
	slot0.replaceconfirmBtn = slot0:findTF("bg/frame/confirm_btn", slot0.replacePanel)

	setActive(slot0:findTF("bg/frame/consume", slot0.replacePanel), false)
	setActive(slot0.replacePanel, false)

	slot0.uilist = UIItemList.New(slot0:findTF("frame/talents/content"), slot0:findTF("frame/talents/content/talent_tpl"))
	slot0.resetPoint = false
	slot0.scrollTxts = {}
end

function slot0.inChapter(slot0, slot1)
	if getProxy(ChapterProxy):getActiveChapter() then
		for slot7, slot8 in pairs(slot3) do
			if _.any(_.values(slot9), function (slot0)
				return slot0.id == slot0.id
			end) then
				return true
			end
		end
	end

	return false
end

function slot0.attach(slot0, slot1)
	slot0.super.attach(slot0, slot1)
	onButton(slot0, slot0.replaceCloseBtn, function ()
		slot0:closeReplacePanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.replaceCancelBtn, function ()
		slot0:closeReplacePanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.replacePanel, function ()
		slot0:closeReplacePanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.resetTimeBtn, function ()
		if #slot0.commanderVO:getTalentOrigins() == #slot0.commanderVO:getTalents() and _.all(slot0, function (slot0)
			return _.any(slot0, function (slot0)
				return slot0.id == slot0.id
			end)
		end) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_reset_talent_is_not_need"))

			return
		end

		if slot0:inChapter(slot0.commanderVO) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_is_in_battle"))

			return
		end

		if slot0.resetPoint and slot0.commanderVO then
			slot0:openResetPanel()
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_reset_talent_time_no_rearch"))
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.resetPanel, function ()
		slot0:closeResetPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.resetCloseBtn, function ()
		slot0:closeResetPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.resetCancelBtn, function ()
		slot0:closeResetPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.resetConfirmBtn, function ()
		if slot0.commanderVO then
			if slot0.parent.playerVO.gold < slot0.total then
				GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
					{
						59001,
						slot0.total - slot0.gold,
						slot0.total
					}
				})

				return
			end

			slot0.parent:openMsgBox({
				content = i18n("commander_reset_talent_tip"),
				onYes = function ()
					slot0.parent:emit(CommanderInfoMediator.RESET_TALENTS, slot0.commanderVO.id)
					slot0.parent.emit:closeResetPanel()
				end
			})
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.useBtn, function ()
		if slot0:inChapter(slot0.commanderVO) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_is_in_battle"))

			return
		end

		if slot0.commanderVO:getTalentPoint() > 0 then
			slot0:openUseagePanel()
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_skill_point_noengough"))
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.usagePanel, function ()
		slot0:closeUsagePanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.usageCancelBtn, function ()
		slot0:closeUsagePanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.usageCloseBtn, function ()
		slot0:closeUsagePanel()
	end, SFX_PANEL)
end

function slot0.update(slot0, slot1)
	slot0.resetPoint = false
	slot0.commanderVO = slot1
	slot0.pointTxt.text = slot1:getTalentPoint()

	slot0:removeTimer()
	setActive(slot0.resetTimeBtn, slot0.commanderVO:getPt() > 0 or pg.TimeMgr.GetInstance():GetServerTime() < slot1.abilityTime + CommanderConst.RESET_TALENT_WAIT_TIME)
	setActive(slot0.resetTimeTF, slot0.commanderVO:getPt() > 0 or pg.TimeMgr.GetInstance().GetServerTime() < slot1.abilityTime + CommanderConst.RESET_TALENT_WAIT_TIME)

	if slot2 <= slot3 then
		slot0.resetPoint = true
		slot0.resetTimeTxt.text = i18n("commander_reset_talent")

		setActive(slot0.resetTimeTF, false)
	else
		slot0.timer = Timer.New(function ()
			slot0 = pg.TimeMgr.GetInstance():GetServerTime()

			if pg.TimeMgr.GetInstance() -  > 0 then
				slot2.resetTimeTxt.text = pg.TimeMgr.GetInstance():DescCDTime(slot0)
			else
				slot2.resetTimeTxt.text = i18n("commander_reset_talent")

				setActive(i18n("commander_reset_talent").resetTimeTF, false)

				i18n("commander_reset_talent").resetTimeTF.resetPoint = true
			end
		end, 1, -1)

		slot0.timer:Start()
		slot0.timer.func()
	end

	slot0:updateTalents()
end

function slot0.updateTalents(slot0)
	slot0:clearScrollTxts(slot0)

	slot2 = slot0.commanderVO.getTalents(slot1)

	slot0.uilist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot0:updateTalentCard(slot2, slot1[slot1 + 1], slot2)
		end
	end)
	slot0.uilist:align(CommanderConst.MAX_TELENT_COUNT)
end

function slot0.updateTalentCard(slot0, slot1, slot2, slot3)
	slot4 = slot1:Find("unlock")
	slot5 = slot1:Find("lock")
	slot0.scrollTxts[slot3] = {}

	if slot2 then
		GetImageSpriteFromAtlasAsync("CommanderTalentIcon/" .. slot2:getConfig("icon"), "", slot4:Find("icon"))

		if slot4:Find("tree_btn") then
			onButton(slot0, slot4:Find("tree_btn"), function ()
				slot0.parent:openTreePanel(slot0.parent)
			end, SFX_PANEL)
		end

		setText(slot4:Find("name_bg/Text"), slot2:getConfig("name"))

		slot6 = ScrollTxt.New(slot4:Find("desc"), slot4:Find("desc/Text"))

		slot6:setText(slot2:getConfig("desc"))
		table.insert(slot0.scrollTxts[slot3], slot6)
	end

	setActive(slot4, slot2)

	if slot5 then
		setActive(slot5, not slot2)
	end
end

function slot0.clearScrollTxts(slot0, slot1)
	slot2 = ipairs
	slot3 = slot0.scrollTxts[slot1] or {}

	for slot5, slot6 in slot2(slot3) do
		slot6:clear()
	end

	slot0.scrollTxts = {}
end

function slot0.openUseagePanel(slot0)
	slot0:clearScrollTxts(slot0)
	setActive(slot0.usagePanel, true)
	slot0.usagePanel:SetAsLastSibling()
	removeOnButton(slot0.usageConfirmBtn)
	setActive(slot0.usageCostIconTF, false)
	setActive(slot0.usageCostTxtTF, false)

	if not slot0.commanderVO.getNotLearnedList(slot1) or #slot2 == 0 then
		slot0.parent:emit(CommanderInfoMediator.FETCH_NOT_LEARNED_TALENT, slot1.id)
	else
		slot3 = nil

		slot0.usageList:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				onToggle(slot1, slot2, function (slot0)
					if slot0 and (not slot0 or slot0.id ~= slot1.id) then
						slot0 = slot1

						slot2:updateTalentCard(slot2.usageTalent, slot2.updateTalentCard, )
						slot2(slot2.usageCostIconTF, slot2.updateTalentCard:getConfig("cost") > 0)
						slot2(slot2.usageCostTxtTF, slot1 > 0)

						slot2.usageCostTxt.text = slot1

						setActive(slot2.usageConfirmUpgrade, slot1 > 0:hasTalent(slot1))
						setActive(slot2.usageConfirmILearned, not slot1 > 0.hasTalent:hasTalent(slot1))
					end
				end, SFX_PANEL)
				setActive(slot2:Find("up"), slot4)
				GetImageSpriteFromAtlasAsync("CommanderTalentIcon/" .. slot0[slot1 + 1].getConfig(slot3, "icon"), "", slot2)

				if slot1 == 0 then
					triggerToggle(slot2, true)
				end
			end
		end)
		slot0.usageList:align(#slot2)
		onButton(slot0, slot0.usageConfirmBtn, function ()
			if slot0 and slot1:fullTalentCnt() and not slot1:hasTalent(slot1.hasTalent) then
				slot2:openReplacePanel(slot2.openReplacePanel)
			elseif slot0 then
				slot2:emit(CommanderInfoMediator.ON_LEARN_TALENT, slot1.id, slot0.id, 0)
			end
		end, SFX_PANEL)
	end
end

function slot0.closeUsagePanel(slot0)
	setActive(slot0.usagePanel, false)
end

function slot0.openResetPanel(slot0)
	slot0:clearScrollTxts(slot0)
	setActive(slot0.resetPanel, true)
	slot0.resetPanel:SetAsLastSibling()
	slot0.resetList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot0:updateTalentCard(slot2, slot1[slot1 + 1], slot2)
		end
	end)
	slot0.resetList:align(#slot0.commanderVO.getTalentOrigins(slot1))

	slot0.total = slot0.commanderVO.getResetTalentConsume(slot1)
	slot0.resetGoldTxt.text = (slot0.parent.playerVO.gold < slot0.total and "<color=" .. COLOR_RED .. ">" .. slot0.total .. "</color>") or slot0.total
	slot0.resetPointTxt.text = slot1:getTotalPoint()
	GetComponent(slot0.resetGoldTxt, typeof(Outline)).enabled = slot0.total <= slot3.gold
end

function slot0.closeResetPanel(slot0)
	setActive(slot0.resetPanel, false)
end

function slot0.openReplacePanel(slot0, slot1)
	slot0:clearScrollTxts(slot0)
	setActive(slot0.replacePanel, true)
	slot0.replacePanel:SetAsLastSibling()
	slot0.replaceList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			onButton(slot1, slot2, function ()
				if slot0.repalceToggle ~= slot1 then
					slot2(slot3, slot4)

					if slot2.repalceToggle then
						setActive(slot0.repalceToggle:Find("mark"), false)
					end

					slot0.repalceToggle = slot1

					setActive(slot1:Find("mark"), true)
				end
			end, SFX_PANEL)
			GetImageSpriteFromAtlasAsync("CommanderTalentIcon/" .. slot0[slot1 + 1].getConfig(slot3, "icon"), "", slot2)
		end
	end)
	slot3(slot1, nil)
	slot0.replaceList:align(#slot0.commanderVO.getTalents(slot2))
end

function slot0.closeReplacePanel(slot0)
	setActive(slot0.replacePanel, false)

	if slot0.repalceToggle then
		setActive(slot0.repalceToggle:Find("mark"), false)

		slot0.repalceToggle = nil
	end
end

function slot0.removeTimer(slot0)
	if slot0.timer then
		slot0.timer:Stop()

		slot0.timer = nil
	end
end

function slot0.exit(slot0)
	slot0:removeTimer()
	slot0:clearScrollTxts(slot0)
	slot0:clearScrollTxts(slot0.clearScrollTxts)
	slot0:clearScrollTxts(slot0)
	slot0:clearScrollTxts(slot0)
end

return slot0
