class("UpdateTaskProgressCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = pg.task_data_template[slot1:getBody().taskId]
	slot5, slot6 = nil

	if not getProxy(TaskProxy):getTaskById(slot1.getBody().taskId) then
		return
	end

	slot10 = false

	if slot8:getConfig("sub_type") == 2001 then
		slot5 = Task.TASK_PROGRESS_UPDATE
		slot11 = slot4.target_id
		slot12 = slot4.target_num

		for slot18, slot19 in pairs(slot14) do
			if (table.contains(slot11, slot19.id) or #slot11 == 0) and slot19:getShipCount() == slot12 then
				slot10 = true

				break
			end
		end

		slot6 = slot12
	elseif slot9 == 2002 then
		slot5 = Task.TASK_PROGRESS_UPDATE
		slot12 = slot4.target_id[1]
		slot13 = slot4.target_id[2]
		slot14 = slot4.target_num
		slot17 = 0

		for slot21, slot22 in pairs(slot16) do
			if slot22:getShipCount() == slot13 and slot12 <= slot22:avgLevel() then
				slot17 = slot17 + 1
			end
		end

		if not slot8:isFinish() and slot8.progress < slot17 then
			slot10 = true
			slot6 = slot17
		end
	end

	if not slot10 then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(20009, {
		progressinfo = {
			{
				id = slot3,
				mode = slot5,
				progress = slot6
			}
		}
	}, 20010, function (slot0)
		if slot0.result == 0 then
			if slot0 == Task.TASK_PROGRESS_UPDATE then
				slot1:updateProgress(slot1)
			elseif slot0 == Task.TASK_PROGRESS_APPEND then
				slot1:updateProgress(slot1.progress + slot2)
			end

			slot3:updateTask(slot3.updateTask)
		end
	end)
end

return class("UpdateTaskProgressCommand", pm.SimpleCommand)
