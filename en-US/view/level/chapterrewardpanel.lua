slot0 = class("ChapterRewardPanel", BaseSubView)

function slot0.getUIName(slot0)
	return "ChapterRewardPanel"
end

function slot0.OnInit(slot0)
	setText(slot0:findTF("window/bg/text"), i18n("desc_defense_reward"))

	slot0.UIlist = UIItemList.New(slot0._tf:Find("window/bg/panel/list"), slot0._tf:Find("window/bg/panel/list/item"))
	slot0.closeBtn = slot0._tf:Find("window/top/btnBack")
	slot0.confirmBtn = slot0._tf:Find("window/btn_confirm")

	onButton(slot0, slot0._tf, function ()
		slot0:Hide()
	end, SFX_PANEL)
	onButton(slot0, slot0.closeBtn, function ()
		slot0:Hide()
	end, SFX_PANEL)
	onButton(slot0, slot0.confirmBtn, function ()
		slot0:Hide()
	end, SFX_PANEL)
end

slot1 = {
	"s",
	"a",
	"b"
}

function slot2(slot0, slot1, slot2, slot3)
	slot0.UIlist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setText(slot2:Find("title/Text"), "PHASE " .. slot1 + 1)

			slot3 = tostring(slot0[slot1 + 1] - 1)

			if slot0[slot1 + 1] - 1 ~= slot0[slot1 + 2] then
				slot3 = tostring(slot0[slot1 + 2]) .. "-" .. slot3
			end

			setText(slot2:Find("target/title"), i18n("text_rest_HP") .. "：")
			setText(slot2:Find("target/Text"), slot3)
			updateDrop(slot2:Find("award"), slot4, {
				hideName = true
			})
			onButton(slot2, slot2:Find("award"), function ()
				slot0:emit(BaseUI.ON_DROP, slot0)
			end, SFX_PANEL)
			setActive(slot2:Find("award/mask"), false)
		end
	end)
	slot0.UIlist:align(#slot3)
end

function slot0.Show(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
	slot0.super.Show(slot0)
end

function slot0.Hide(slot0)
	slot0.super.Hide(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0._parentTf)
end

function slot0.Enter(slot0, slot1)
	table.insert(slot4, 1, pg.chapter_defense[slot1.id].port_hp + 1)

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

	slot1(slot0, slot3, slot4, slot5)
	slot0:Show()
	Canvas.ForceUpdateCanvases()
end

function slot0.OnDestroy(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0._parentTf)
end

return slot0
