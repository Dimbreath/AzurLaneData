slot0 = class("PtAwardWindow")

function slot0.Ctor(slot0, slot1, slot2)
	slot0._tf = slot1
	slot0.binder = slot2
	slot0.UIlist = UIItemList.New(slot0._tf:Find("window/panel/list"), slot0._tf:Find("window/panel/list/item"))
	slot0.ptTF = slot0._tf:Find("window/pt")
	slot0.totalTxt = slot0._tf:Find("window/pt/Text"):GetComponent(typeof(Text))
	slot0.totalTitleTxt = slot0._tf:Find("window/pt/title"):GetComponent(typeof(Text))
	slot0.closeBtn = slot0._tf:Find("window/top/btnBack")

	onButton(slot0.binder, slot0._tf, function ()
		uv0:Hide()
	end, SFX_PANEL)
	onButton(slot0.binder, slot0.closeBtn, function ()
		uv0:Hide()
	end, SFX_PANEL)
end

function slot1(slot0, slot1, slot2, slot3)
	slot0.UIlist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = uv0[slot1 + 1]

			setText(slot2:Find("title/Text"), "PHASE " .. slot1 + 1)
			setText(slot2:Find("target/Text"), uv1[slot1 + 1])
			setText(slot2:Find("target/title"), HXSet.hxLan(uv2.resTitle))
			updateDrop(slot2:Find("award"), {
				type = slot3[1],
				id = slot3[2],
				count = slot3[3]
			}, {
				hideName = true
			})
			onButton(uv2.binder, slot2:Find("award"), function ()
				uv0.binder:emit(BaseUI.ON_DROP, uv1)
			end, SFX_PANEL)
			setActive(slot2:Find("award/mask"), slot1 + 1 <= uv3)
		end
	end)
	slot0.UIlist:align(#slot1)
end

function slot0.Show(slot0, slot1)
	slot2 = slot1.dropList
	slot3 = slot1.targets
	slot4 = slot1.level
	slot5 = slot1.count
	slot8 = slot1.type == 3 and "" or pg.item_data_statistics[id2ItemId(slot1.resId)].name

	if slot7 == 2 then
		slot0.cntTitle = i18n("pt_total_count", i18n("pt_cosume", slot8))
		slot0.resTitle = i18n("pt_count", i18n("pt_cosume", slot8))
	elseif slot7 == 3 then
		slot0.cntTitle = i18n("pt_ship_now")
		slot0.resTitle = i18n("pt_ship_goal")
	else
		slot0.cntTitle = i18n("pt_total_count", slot8)
		slot0.resTitle = i18n("pt_count", slot8)
	end

	uv0(slot0, slot2, slot3, slot4)

	slot0.totalTxt.text = slot5
	slot0.totalTitleTxt.text = HXSet.hxLan(slot0.cntTitle)

	Canvas.ForceUpdateCanvases()
	setActive(slot0._tf, true)
end

function slot0.Hide(slot0)
	setActive(slot0._tf, false)
end

function slot0.Dispose(slot0)
	slot0:Hide()
	removeOnButton(slot0._tf)
	removeOnButton(slot0.closeBtn)
end

return slot0
