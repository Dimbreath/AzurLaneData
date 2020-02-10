slot0 = class("WorldTriggerTaskCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.fleetId
	slot5 = slot2.callback

	if getProxy(WorldProxy):GetWorld():getTaskProxy():getTaskById(slot2.taskId) then
		pg.TipsMgr.GetInstance():ShowTips(i18n1("该任务已存在" .. slot4))

		return
	end

	print("trigger task ", slot4, " - fleetid ", slot4)

	slot10, slot11 = WorldTask.canTrigger(slot4)

	if not slot10 then
		pg.TipsMgr.GetInstance():ShowTips(slot11)

		return
	end

	slot15.fleet_id = slot3
	slot15.taskId = slot4

	pg.ConnectionMgr.GetInstance():Send(33205, {}, 33206, function (slot0)
		if slot0.result == 0 then
			slot1 = WorldTask.New(slot0.task)
			slot1.new = 1

			uv0:addTask(slot1)
			pg.TipsMgr.GetInstance():ShowTips("接取任务：" .. slot1.id)

			if #slot1.config.task_op > 0 then
				pg.StoryMgr.GetInstance():Play(slot1.config.task_op)
			end

			if uv1 then
				uv1()
			end

			slot5.task = slot1.id

			uv2:AddLog(WorldLog.TypeTask, {})
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n1("触发任务失败" .. slot0.result))
		end
	end)
end

return slot0
