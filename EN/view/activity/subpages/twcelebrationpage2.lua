slot0 = class("TWCelebrationPage2", import("...base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.getBtn = slot0:findTF("AD/get_btn")
	slot0.gotBtn = slot0:findTF("AD/got_btn")
	slot0.goBtn = slot0:findTF("AD/battle_btn")
	slot0.mark = slot0:findTF("AD/mark")
end

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
end

function slot0.OnUpdateFlush(slot0)
	slot5 = getProxy(TaskProxy):getTaskById(slot0.activity:getConfig("config_data")[1]) or slot2:getFinishTaskById(slot1) or Task.New({
		id = slot1
	}):isReceive()

	setActive(slot0.getBtn, (getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New()) and getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New():isFinish() and not slot5)
	setActive(slot0.gotBtn, (getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New()) and slot5)
	setActive(slot0.mark, (getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New()) and slot5)
	setActive(slot0.goBtn, (getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New()) and not getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New().isFinish())
	onButton(slot0, slot0.goBtn, function ()
		slot0:emit(ActivityMediator.SPECIAL_BATTLE_OPERA)
	end, SFX_PANEL)
	onButton(slot0, slot0.getBtn, function ()
		if slot0 and slot1 and not slot2 then
			slot3:emit(ActivityMediator.ON_TASK_SUBMIT, slot3.emit)
		end
	end, SFX_PANEL)
end

return slot0
