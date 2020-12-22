slot0 = class("WorldTriggerTaskCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.portId

	if nowWorld:GetTaskProxy():getTaskById(slot2.taskId) then
		pg.TipsMgr.GetInstance():ShowTips(i18n1("该任务已存在" .. slot3))

		return
	end

	print("trigger task ", slot3)

	slot8, slot9 = WorldTask.canTrigger(slot3)

	if not slot8 then
		pg.TipsMgr.GetInstance():ShowTips(slot9)

		return
	end

	pg.ConnectionMgr.GetInstance():Send(33205, {
		taskId = slot3
	}, 33206, function (slot0)
		if slot0.result == 0 then
			if uv0 then
				slot1 = nowWorld:GetActiveMap():GetPort()
				slot2 = underscore.rest(slot1.taskIds, 1)

				table.removebyvalue(slot2, uv1)
				slot1:UpdateTaskIds(slot2)
			end

			slot1 = WorldTask.New(slot0.task)
			slot1.new = 1

			uv2:addTask(slot1)

			if #slot1.config.task_op > 0 then
				pg.NewStoryMgr.GetInstance():Play(slot1.config.task_op, nil, true)
			end

			uv3:sendNotification(GAME.WORLD_TRIGGER_TASK_DONE, {
				task = slot1
			})
		elseif slot0.result == 6 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_task_refuse1"))
		else
			pg.TipsMgr.GetInstance():ShowTips("trigger task fail" .. slot0.result)
		end
	end)
end

return slot0
