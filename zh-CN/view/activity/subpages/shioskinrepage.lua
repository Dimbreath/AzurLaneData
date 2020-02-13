slot0 = class("ShioSkinRePage", import(".TemplatePage.SkinTemplatePage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.dayTF = slot0:findTF("day", slot0.bg)
	slot0.item1TF = slot0:findTF("item1", slot0.bg)
	slot0.item2TF = slot0:findTF("item2", slot0.bg)
	slot0.itemTFList = {
		slot0.item1TF,
		slot0.item2TF
	}
end

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
end

function slot0.OnUpdateFlush(slot0)
	slot0.nday = slot0.activity.data3
	slot1 = #slot0.activity:getConfig("config_data")

	if slot0.dayTF then
		setText(slot0.dayTF, slot0.nday .. "/" .. slot1)
	end

	if checkExist(slot0.activity:getConfig("config_client").story, {
		slot0.nday
	}, {
		1
	}) and not pg.StoryMgr.GetInstance():IsPlayed(slot2[slot0.nday][1]) then
		slot3:Play(slot2[slot0.nday][1])
	end

	for slot6 = 1, 2, 1 do
		slot8 = slot6

		updateDrop(slot0:findTF("item", slot7), slot13)
		onButton(slot0, slot0.findTF("item", slot7), function ()
			slot0:emit(BaseUI.ON_DROP, slot0)
		end, SFX_PANEL)
		setText(slot0:findTF("description", slot7), slot0.taskProxy:getTaskById(slot0.taskGroup[slot0.nday][slot6]) or slot0.taskProxy:getFinishTaskById(slot10):getConfig("desc"))
		setText(slot0:findTF("progressText", slot7), slot14 .. "/" .. slot15)
		setSlider(slot0:findTF("progress", slot7), 0, slot15, slot14)
		setActive(slot0:findTF("go_btn", slot7), slot0.taskProxy.getTaskById(slot0.taskGroup[slot0.nday][slot6]) or slot0.taskProxy.getFinishTaskById(slot10):getTaskStatus() == 0)
		setActive(slot0:findTF("get_btn", slot7), slot19 == 1)
		setActive(slot0:findTF("got_btn", slot7), slot19 == 2)
		onButton(slot0, slot16, function ()
			slot0:emit(ActivityMediator.ON_TASK_GO, slot0)
		end, SFX_PANEL)
		onButton(slot0, slot0.findTF("get_btn", slot7), function ()
			slot0:emit(ActivityMediator.ON_TASK_SUBMIT, slot0)
		end, SFX_PANEL)
	end
end

function slot0.OnDestroy(slot0)
	return
end

return slot0
