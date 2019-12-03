slot0 = class("TWCelebrationPage3", import("...base.BaseActivityPage"))

slot0.OnInit = function (slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.getBtn = slot0:findTF("AD/get")
	slot0.gotBtn = slot0:findTF("AD/got")
	slot0.shareBtn = slot0:findTF("AD/share")
	slot0.mask = slot0:findTF("AD/mask")
	slot0.finished = slot0:findTF("AD/finished")
	slot0.unfinished = slot0:findTF("AD/unfinished")
end

slot0.OnFirstFlush = function (slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
end

slot0.OnUpdateFlush = function (slot0)
	slot4 = getProxy(TaskProxy):getTaskById(slot0.activity:getConfig("config_data")[1]) or slot2:getFinishTaskById(slot1) or Task.New({
		id = slot1
	}):isFinish()
	slot5 = getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New():isReceive()

	setActive(slot0.getBtn, (getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New()) and slot4 and not slot5)
	setActive(slot0.gotBtn, false)
	setActive(slot0.mask, (getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New()) and slot5)
	setActive(slot0.shareBtn, (getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New()) and (not slot4 or slot5))
	setActive(slot0.finished, (getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New()) and slot4)
	setActive(slot0.unfinished, (getProxy(TaskProxy).getTaskById(slot0.activity.getConfig("config_data")[1]) or slot2.getFinishTaskById(slot1) or Task.New()) and not slot4)
	onButton(slot0, slot0.shareBtn, function ()
		slot0:share(slot0)
	end, SFX_PANEL)
	onButton(slot0, slot0.getBtn, function ()
		if slot0 and slot1 and not slot2 then
			slot3:emit(ActivityMediator.ON_TASK_SUBMIT, slot3.emit)
		end
	end, SFX_PANEL)
end

slot0.share = function (slot0, slot1)
	PoolMgr.GetInstance():GetUI("TWCelebrationShare", false, function (slot0)
		SetParent(slot0, slot2, false)

		slot0.shareGo = slot0
		slot10 = getProxy(PlayerProxy).getData(slot9)

		setText(slot5, slot10.shipCount)
		setText(slot4, slot10.attackCount)

		slot12 = getProxy(BayProxy).getShipById(slot11, slot10.character)

		setText(slot3, slot12:getName())
		setText(slot6, "指揮官" .. slot10.name .. "和\n秘書艦" .. slot12:getName() .. "在大海中奮戰")
		setActive(slot0:findTF("ssr", slot0), slot12:getRarity() == 5)
		setPaintingPrefabAsync(slot0:findTF("paint", slot0), slot12:getPainting(), "kanban", function ()
			pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeTWCelebrationShare)

			slot0 = pg.ShareMgr.GetInstance().Share.activity:getConfig("config_data")[1]

			if not pg.ShareMgr.GetInstance().Share.activity then
				slot0:emit(ActivityMediator.SHARE_TASK_DONE, slot0)
			end
		end)
	end)
end

slot0.OnDestroy = function (slot0)
	if slot0.shareGo then
		PoolMgr.GetInstance():ReturnUI("TWCelebrationShare", slot0.shareGo)
	end
end

return slot0
