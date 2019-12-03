slot0 = class("DachaolifuSkinPage", import(".TemplatePage.SkinTemplatePage"))

function slot0.OnInit(slot0)
	slot0.super.OnInit(slot0)

	slot0.step_txt = slot0:findTF("step_text", slot0.bg)
end

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
	slot0.uilist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			updateDrop(slot0:findTF("item", slot2), slot8)
			onButton(slot0, slot0.findTF("item", slot2), function ()
				slot0:emit(BaseUI.ON_DROP, slot0)
			end, SFX_PANEL)
			setText(slot0:findTF("description", slot2), slot0.taskProxy:getTaskById(slot0.taskGroup[slot0.nday][slot1 + 1]) or slot0.taskProxy:getFinishTaskById(slot5):getConfig("desc"))
			setText(slot0:findTF("progressText", slot2), slot9 .. "/" .. slot10)
			setSlider(slot0:findTF("progress", slot2), 0, slot10, slot9)
			setActive(slot0:findTF("go_btn", slot2), slot0.taskProxy.getTaskById(slot0.taskGroup[slot0.nday][slot1 + 1]) or slot0.taskProxy.getFinishTaskById(slot5):getTaskStatus() == 0)
			setActive(slot0:findTF("get_btn", slot2), slot14 == 1)
			setActive(slot0:findTF("got_btn", slot2), slot14 == 2)
			onButton(slot0, slot11, function ()
				slot0:emit(ActivityMediator.ON_TASK_GO, slot0)
			end, SFX_PANEL)
			onButton(slot0, slot0.findTF("get_btn", slot2), function ()
				slot0:emit(ActivityMediator.ON_TASK_SUBMIT, slot0)
			end, SFX_PANEL)
			setActive(slot0:findTF("progressText", slot2), false)
		end
	end)
end

function slot0.OnUpdateFlush(slot0)
	slot0.super.OnUpdateFlush(slot0)
	setText(slot0.step_txt, setColorStr(slot0.nday, "#89FF59FF") .. "/" .. #slot0.taskGroup)
end

return slot0
