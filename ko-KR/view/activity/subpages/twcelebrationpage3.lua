slot0 = class("TWCelebrationPage3", import("...base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.getBtn = slot0:findTF("AD/get")
	slot0.gotBtn = slot0:findTF("AD/got")
	slot0.share = slot0:findTF("AD/share")
	slot0.mask = slot0:findTF("AD/mask")
	slot0.finished = slot0:findTF("AD/finished")
	slot0.unfinished = slot0:findTF("AD/unfinished")
end

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
end

function slot0.OnUpdateFlush(slot0)
	slot4 = getProxy(TaskProxy):getTaskById(slot0.activity:getConfig("config_data")[1]) or slot2:getFinishTaskById(slot1) or Task.New({
		id = slot1
	}):isFinish()
	slot5 = getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New():isReceive()

	setActive(slot0.getBtn, (getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New()) and slot4 and not slot5)
	setActive(slot0.gotBtn, (getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New()) and slot5)
	setActive(slot0.mark, (getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New()) and slot5)
	setActive(slot0.share, (getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New()) and not slot4)
	setActive(slot0.finished, (getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New()) and slot4)
	setActive(slot0.unfinished, (getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New()) and not slot4)
	onButton(slot0, slot0.share, function ()
		slot0:share()
	end, SFX_PANEL)
	onButton(slot0, slot0.getBtn, function ()
		if slot0 and slot1 and not slot2 then
			slot3:emit(ActivityMediator.ON_TASK_SUBMIT, slot3.emit)
		end
	end, SFX_PANEL)
end

function slot0.share(slot0)
	slot0:initShare()
end

function slot0.initShare(slot0)
	PoolMgr.GetInstance():GetUI("TWCelebrationShare", false, function (slot0)
		SetParent(slot0, GameObject.Find("UICamera"):GetComponent(typeof(Camera)).transform:GetChild(0), false)
	end)
end

return slot0
