slot0 = class("MonthSignReSignUI", import("...base.BaseSubView"))

function slot0.getUIName(slot0)
	return "MonthSignReSignUI"
end

function slot0.OnInit(slot0)
	slot0:InitUI()
	setActive(slot0._tf, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
end

function slot0.InitUI(slot0)
	slot0.destroyBonusList = slot0._tf:Find("frame/bg/scrollview/list")
	slot0.itemTpl = slot0.destroyBonusList:Find("item_tpl")

	setText(slot0:findTF("frame/title_text/Text"), i18n("month_sign_resign"))
	onButton(slot0, slot0:findTF("frame/top/btnBack"), function ()
		slot0:Destroy()
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("frame/actions/confirm_btn"), function ()
		slot0:Destroy()
	end, SFX_UI_EQUIPMENT_RESOLVE)
end

function slot0.setAwardShow(slot0, slot1, slot2)
	slot0.awards = slot1
	slot0.callback = slot2

	slot0:displayAwards()
end

function slot0.OnDestroy(slot0)
	slot0.selectedIds = nil

	if slot0.callback then
		slot0.callback()

		slot0.callback = nil
	end

	slot0.awards = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0._parentTF)
end

function slot0.displayAwards(slot0)
	for slot4 = 1, #slot0.awards, 1 do
		slot5 = cloneTplTo(slot0.itemTpl, slot0.destroyBonusList):Find("bg")

		updateDrop(tf(slot5), slot6, {
			fromAwardLayer = true
		})
		setActive(findTF(slot5, "bonus"), slot0.awards[slot4].riraty)
		setActive(slot7, false)
		setActive(findTF(slot5, "name_mask"), true)
		findTF(slot5, "name_mask/name"):GetComponent("ScrollText"):SetText(slot0.awards[slot4].name or getText(slot7))
		onButton(slot0, slot5, function ()
			if slot0.inAniming then
				return
			end

			slot0:emit(BaseUI.ON_DROP, slot0)
		end, SFX_PANEL)
	end
end

return slot0
