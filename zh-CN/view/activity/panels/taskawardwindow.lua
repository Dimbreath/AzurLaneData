function slot1(slot0)
	function slot2(slot0)
		for slot4, slot5 in ipairs(slot0.tasklist) do
			for slot9, slot10 in ipairs(slot5) do
				if slot10 == slot0 then
					return slot4
				end
			end
		end
	end

	slot3 = getProxy(TaskProxy)
	slot4 = nil

	for slot8 = #_.flatten(slot0.tasklist), 1, -1 do
		if slot3:getFinishTaskById(slot1[slot8]) and slot10:isReceive() then
			slot4 = slot9
		end
	end

	slot0.UIlist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setText(slot2:Find("title/Text"), "PHASE " .. slot2(slot3))
			setText(slot2:Find("target/title"), slot1:getTaskById(slot0[slot1 + 1]) or slot1:getFinishTaskById(slot3) or Task.New({
				id = slot3
			}):getConfig("name"))
			setText(slot2:Find("target/Text"), "")
			updateDrop(slot2:Find("award"), slot6)
			onButton(slot3.binder, slot2:Find("award"), function ()
				slot0.binder:emit(BaseUI.ON_DROP, slot0.binder)
			end, SFX_PANEL)
			setActive(slot2:Find("award/mask"), slot1.getTaskById(slot0[slot1 + 1]) or slot1.getFinishTaskById(slot3) or Task.New():isReceive() or ((slot1.getTaskById(slot0[slot1 + 1]) or slot1.getFinishTaskById(slot3) or Task.New()) and slot3 < (slot1.getTaskById(slot0[slot1 + 1]) or slot1.getFinishTaskById(slot3) or Task.New())))
		end
	end)
	slot0.UIlist:align(#slot1)
end

class("TaskAwardWindow", import(".PtAwardWindow")).Show = function (slot0, slot1)
	slot0.tasklist = slot1.tasklist
	slot0.ptId = slot1.ptId
	slot0.totalPt = slot1.totalPt

	slot0(slot0)

	slot0.totalTxt.text = slot0.totalPt
	slot0.totalTitleTxt.text = i18n("award_window_pt_title")

	setActive(slot0._tf, true)
end

return class("TaskAwardWindow", import(".PtAwardWindow"))
