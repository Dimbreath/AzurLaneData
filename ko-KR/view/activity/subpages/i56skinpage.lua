slot0 = class("I56SkinPage", import(".TemplatePage.SkinTemplatePage"))

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
	slot0.uilist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot4 = uv0:findTF("item", slot2)

			if not uv0.taskProxy:getTaskById(uv0.taskGroup[uv0.nday][slot1 + 1]) then
				slot6 = uv0.taskProxy:getFinishTaskById(slot5)
			end

			slot7 = slot6:getConfig("award_display")[1]
			slot8.type = slot7[1]
			slot8.id = slot7[2]
			slot8.count = slot7[3]

			updateDrop(slot4, {})
			onButton(uv0, slot4, function ()
				uv0:emit(BaseUI.ON_DROP, uv1)
			end, SFX_PANEL)

			slot9 = slot6:getProgress()
			slot10 = slot6:getConfig("target_num")

			setText(uv0:findTF("description", slot2), slot6:getConfig("desc") .. " " .. ("(" .. slot9 .. "/" .. slot10 .. ")"))
			setSlider(uv0:findTF("progress", slot2), 0, slot10, slot9)

			slot13 = uv0
			slot14 = uv0:findTF("get_btn", slot2)

			setActive(slot13:findTF("go_btn", slot2), slot6:getTaskStatus() == 0)
			setActive(slot14, slot16 == 1)
			setActive(uv0:findTF("got_btn", slot2), slot16 == 2)
			onButton(uv0, slot13, function ()
				uv0:emit(ActivityMediator.ON_TASK_GO, uv1)
			end, SFX_PANEL)
			onButton(uv0, slot14, function ()
				uv0:emit(ActivityMediator.ON_TASK_SUBMIT, uv1)
			end, SFX_PANEL)
		end
	end)
end

function slot0.OnUpdateFlush(slot0)
	uv0.super.OnUpdateFlush(slot0)
	setText(slot0.dayTF, slot0.nday .. " " .. #slot0.taskGroup)
	eachChild(slot0.items, function (slot0)
		slot1 = uv0
		slot2 = uv0:findTF("got_btn", slot0)
		slot3 = isActive(slot2)

		setButtonEnabled(slot2, false)
		setButtonEnabled(slot1:findTF("get_btn", slot0), not slot3)

		if slot3 then
			setActive(slot1, true)
		end
	end)
end

return slot0
