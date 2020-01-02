slot0 = class("ShadowPlayPage", import("...base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.getBtn = slot0:findTF("AD/get")
	slot0.gotBtn = slot0:findTF("AD/got")
	slot0.urlBtn = slot0:findTF("AD/url")
end

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
	onButton(slot0, slot0.urlBtn, function ()
		Application.OpenURL(slot0.activity:getConfig("config_client"))
	end, SFX_PANEL)
end

function slot0.OnUpdateFlush(slot0)
	setActive(slot0.getBtn, (getProxy(TaskProxy):getTaskById(slot0.activity:getConfig("config_data")[1]) or slot2:getFinishTaskById(slot1) or Task.New({
		id = slot1
	})) and getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New():isFinish() and not getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New():isReceive())
	setActive(slot0.gotBtn, (getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New()) and getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New().isReceive())
	onButton(slot0, slot0.getBtn, function ()
		if slot0 and slot1 and not slot2 then
			slot3:emit(ActivityMediator.ON_TASK_SUBMIT, slot3.emit)
		end
	end, SFX_PANEL)
end

function slot0.OnDestroy(slot0)
	return
end

return slot0
