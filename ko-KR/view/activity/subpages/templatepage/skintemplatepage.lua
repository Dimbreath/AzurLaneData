slot0 = class("SkinTemplatePage", import("....base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.dayTF = slot0:findTF("day", slot0.bg)
	slot0.item = slot0:findTF("item", slot0.bg)
	slot0.items = slot0:findTF("items", slot0.bg)
	slot0.uilist = UIItemList.New(slot0.items, slot0.item)

	setActive(slot0.item, false)
end

function slot0.OnDataSetting(slot0)
	slot0.nday = 0
	slot0.taskProxy = getProxy(TaskProxy)
	slot0.taskGroup = slot0.activity:getConfig("config_data")

	return updateActivityTaskStatus(slot0.activity)
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
		end
	end)
end

function slot0.OnUpdateFlush(slot0)
	slot0.nday = slot0.activity.data3

	if checkExist(slot0.activity:getConfig("config_client").story, {
		slot0.nday
	}, {
		1
	}) and not pg.StoryMgr.GetInstance():IsPlayed(slot1[slot0.nday][1]) then
		slot2:Play(slot1[slot0.nday][1])
	end

	if slot0.dayTF then
		setText(slot0.dayTF, tostring(slot0.nday))
	end

	slot0.uilist:align(#slot0.taskGroup[slot0.nday])
end

function slot0.OnDestroy(slot0)
	eachChild(slot0.items, function (slot0)
		Destroy(slot0)
	end)
end

return slot0
