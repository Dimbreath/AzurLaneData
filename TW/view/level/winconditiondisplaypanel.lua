slot0 = class("WinConditionDisplayPanel", BaseSubView)

slot0.getUIName = function (slot0)
	return "WinConditionDisplayPanel"
end

slot0.OnInit = function (slot0)
	slot0.listTF = slot0._tf:Find("window/bg/awards/awardList")
	slot0.closeBtn = slot0._tf:Find("window/top/btnBack")
	slot0.winCondtitle = slot0:findTF("window/bg/winCond/title/text")

	setText(slot0.winCondtitle, i18n("text_win_condition"))

	slot0.winCondDesc = slot0:findTF("window/bg/winCond/desc")
	slot0.loseCondtitle = slot0:findTF("window/bg/loseCond/title/text")

	setText(slot0.loseCondtitle, i18n("text_lose_condition"))

	slot0.loseCondDesc = slot0:findTF("window/bg/loseCond/desc")
	slot0.rewardList = slot0:findTF("window/bg/awards")
	slot0.rewardtip = slot0:findTF("text", slot0.rewardList)

	setText(slot0.rewardtip, i18n("desc_defense_reward"))

	slot0.rewardWord = slot0:findTF("desc", slot0.rewardList)

	setText(slot0.rewardWord, i18n("word_reward"))

	slot0.rewardCond = slot0:findTF("cond", slot0.rewardList)

	setText(slot0.rewardCond, i18n("text_rest_HP"))
	onButton(slot0, slot0._tf, function ()
		slot0:Destroy()
	end, SFX_PANEL)
	onButton(slot0, slot0.closeBtn, function ()
		slot0:Destroy()
	end, SFX_PANEL)
end

slot1 = {
	"s",
	"a",
	"b"
}

slot0.UpdateList = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = nil

	if #slot4 == 3 then
		slot1.listTF:GetChild(1).gameObject:SetActive(true)
		slot1.listTF:GetChild(2).gameObject:SetActive(true)
		slot1.listTF:GetChild(3).gameObject:SetActive(true)

		slot6 = {
			3,
			2,
			1
		}
	elseif #slot4 == 2 then
		slot1.listTF:GetChild(1).gameObject:SetActive(true)
		slot1.listTF:GetChild(2).gameObject:SetActive(false)
		slot1.listTF:GetChild(3).gameObject:SetActive(true)

		slot6 = {
			3,
			1
		}
	elseif #slot4 == 1 then
		slot1.listTF:GetChild(1).gameObject:SetActive(false)
		slot1.listTF:GetChild(2).gameObject:SetActive(true)
		slot1.listTF:GetChild(3).gameObject:SetActive(false)

		slot6 = {
			2
		}
	end

	slot7 = false

	for slot11 = 1, #slot4, 1 do
		slot12 = slot1.listTF:GetChild(slot6[slot11])
		slot13 = tostring(slot3[slot11] - 1)

		if slot3[slot11] - 1 ~= slot3[slot11 + 1] then
			slot13 = tostring(slot3[slot11 + 1]) .. "-" .. slot13
		end

		setText(slot12:Find("text"), slot13)
		updateDrop(slot12:Find("award"), slot14, {
			hideName = true
		})
		onButton(slot1, slot12:Find("award"), function ()
			slot0:emit(BaseUI.ON_DROP, slot0)
		end, SFX_PANEL)

		slot7 = slot7 or slot3[slot11 + 1] <= slot5

		setActive(slot12:Find("mask"), not (not slot7 and slot3[slot11 + 1] <= slot5))
	end
end

slot0.Show = function (slot0)
	pg.UIMgr.GetInstance():BlurCamera(pg.UIMgr.CameraLevel)
	slot0.super.Show(slot0)
end

slot0.Hide = function (slot0)
	slot0.super.Hide(slot0)
	pg.UIMgr.GetInstance():UnblurCamera(pg.UIMgr.CameraLevel)
end

slot0.Enter = function (slot0, slot1)
	setText(slot0.winCondDesc, slot1:getConfig("win_condition_display")[1])
	setText(slot0.loseCondDesc, slot1:getConfig("lose_condition_display")[1])
	setActive(slot0.rewardList, slot1:getPlayType() == ChapterConst.TypeDefence)

	if slot1.getPlayType() == ChapterConst.TypeDefence then
		slot0:UpdateRewardList(slot1)
	end

	slot0:Show()
	Canvas.ForceUpdateCanvases()
end

slot0.UpdateRewardList = function (slot0, slot1)
	if not pg.chapter_defense[slot1.id] then
		return
	end

	table.insert(slot4, 1, slot3.port_hp + 1)

	slot5 = {}

	for slot9, slot10 in ipairs(slot0) do
		if #slot3["evaluation_display_" .. slot10] > 0 then
			table.insert(slot5, {
				type = slot11[1],
				id = slot11[2],
				count = slot11[3]
			})
		end
	end

	slot0:UpdateList(slot0, slot3, slot4, slot5, slot1.BaseHP)
end

slot0.OnDestroy = function (slot0)
	if slot0.ParentView then
		slot0.ParentView.winCondPanel = nil
	end

	pg.UIMgr.GetInstance():UnblurCamera(pg.UIMgr.CameraLevel)
end

return slot0
