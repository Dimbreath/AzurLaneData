function slot1(slot0, slot1, slot2, slot3)
	slot0.UIlist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setText(slot2:Find("title/Text"), "PHASE " .. slot1 + 1)
			setActive(slot2:Find("target/Text"), false)
			setText(slot2:Find("target/title"), slot4)
			updateDrop(slot2:Find("award"), slot5, {
				hideName = true
			})
			onButton(slot2.binder, slot2:Find("award"), function ()
				slot0.binder:emit(BaseUI.ON_DROP, slot0.binder)
			end, SFX_PANEL)
			setActive(slot2:Find("award/mask"), slot1 + 1 <= slot0[slot1 + 1])
		end
	end)
	slot0.UIlist:align(#slot1)
end

class("KillEnemyAwardWindow", import(".PtAwardWindow")).Show = function (slot0, slot1)
	slot0(slot0, slot2, slot1.descs, slot1.finishedIndex)
	setActive(slot0.ptTF, false)
	setActive(slot0._tf, true)
end

return class("KillEnemyAwardWindow", import(".PtAwardWindow"))
