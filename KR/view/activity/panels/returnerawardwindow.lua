function slot1(slot0, slot1, slot2, slot3)
	slot0.UIlist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setText(slot2:Find("title/Text"), "PHASE " .. slot1 + 1)
			setText(slot2:Find("target/Text"), slot4)
			setText(slot2:Find("target/title"), slot2.resTitle)
			updateDrop(slot2:Find("award"), slot5, {
				hideName = true
			})
			onButton(slot2.binder, slot2:Find("award"), function ()
				slot0.binder:emit(BaseUI.ON_DROP, slot0.binder)
			end, SFX_PANEL)
			setActive(slot2:Find("award/mask"), table.contains(slot0[slot1 + 1], slot1[slot1 + 1]))
		end
	end)
	slot0.UIlist:align(#slot1)
end

class("ReturnerAwardWindow", import(".PtAwardWindow")).Show = function (slot0, slot1)
	slot0.cntTitle = i18n("pt_total_count", slot7)
	slot0.resTitle = i18n("pt_count", slot7)

	slot0(slot0, slot2, slot1.targets, slot1.fetchList)

	slot0.totalTxt.text = slot1.count
	slot0.totalTitleTxt.text = slot0.cntTitle

	setActive(slot0._tf, true)
end

return class("ReturnerAwardWindow", import(".PtAwardWindow"))
