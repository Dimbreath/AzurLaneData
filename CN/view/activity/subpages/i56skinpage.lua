slot0 = class("I56SkinPage", import(".TemplatePage.SkinTemplatePage"))

slot0.OnFirstFlush = function (slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
	slot0.uilist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			updateDrop(slot0:findTF("item", slot2), slot8)
			onButton(slot0, slot0.findTF("item", slot2), function ()
				slot0:emit(BaseUI.ON_DROP, slot0)
			end, SFX_PANEL)
			setText(slot0:findTF("description", slot2), slot11 .. " " .. slot12)
			setSlider(slot0:findTF("progress", slot2), 0, slot10, slot9)
			setActive(slot0:findTF("go_btn", slot2), slot0.taskProxy:getTaskById(slot0.taskGroup[slot0.nday][slot1 + 1]) or slot0.taskProxy:getFinishTaskById(slot5):getTaskStatus() == 0)
			setActive(slot0:findTF("get_btn", slot2), slot16 == 1)
			setActive(slot0:findTF("got_btn", slot2), slot16 == 2)
			onButton(slot0, slot13, function ()
				slot0:emit(ActivityMediator.ON_TASK_GO, slot0)
			end, SFX_PANEL)
			onButton(slot0, slot0.findTF("get_btn", slot2), function ()
				slot0:emit(ActivityMediator.ON_TASK_SUBMIT, slot0)
			end, SFX_PANEL)
		end
	end)
end

slot0.OnUpdateFlush = function (slot0)
	slot0.super.OnUpdateFlush(slot0)
	setText(slot0.dayTF, slot0.nday .. " " .. #slot0.taskGroup)
	eachChild(slot0.items, function (slot0)
		setButtonEnabled(slot2, false)
		setButtonEnabled(slot0:findTF("get_btn", slot0), not isActive(slot2))

		if isActive(slot2) then
			setActive(slot1, true)
		end
	end)
end

return slot0
