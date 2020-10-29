slot0 = class("SubmitTaskOneStepCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot4 = {}
	slot5 = {}
	slot6 = getProxy(TaskProxy)

	for slot10, slot11 in ipairs(slot1:getBody().resultList) do
		slot12 = slot11.id
		slot13 = {}

		if slot11.choiceItemList then
			for slot17, slot18 in ipairs(slot11.choiceItemList) do
				table.insert(slot13, slot18)
			end
		end

		if not slot6:getTaskById(slot12) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("task_is_not_existence", slot12))

			return
		end

		if not slot14:isFinish() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("task_submitTask_error_notFinish"))

			return
		end

		table.insert(slot4, slot12)
	end

	pg.ConnectionMgr.GetInstance():Send(20011, {
		id_list = slot4
	}, 20012, function (slot0)
		for slot5, slot6 in ipairs(slot0.id_list) do
			if uv0:getTaskById(slot6):getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
				getProxy(BagProxy):removeItemById(tonumber(slot7:getConfig("target_id_for_client")), tonumber(slot7:getConfig("target_num")))
			elseif slot7:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
				getProxy(ActivityProxy):removeVitemById(slot7:getConfig("target_id_for_client"), slot7:getConfig("target_num"))
			elseif slot7:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
				slot10 = getProxy(PlayerProxy)
				slot11 = slot10:getData()

				slot11:consume({
					[id2res(slot7:getConfig("target_id_for_client"))] = slot7:getConfig("target_num")
				})
				slot10:updatePlayer(slot11)
			end

			if slot7:getConfig("type") ~= 8 then
				uv0:removeTask(slot7)
			else
				slot7.submitTime = 1

				uv0:updateTask(slot7)
			end

			if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR) and not slot9:isEnd() and table.contains(slot9:getConfig("config_data")[1] or {}, slot7.id) then
				slot8:monitorTaskList(slot9)
			end
		end

		for slot5, slot6 in ipairs(PlayerConst.addTranDrop(slot0.award_list)) do
			if slot6.type == DROP_TYPE_VITEM and pg.item_data_statistics[slot6.id].virtual_type == 6 then
				if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) then
					slot9[task.id] = (slot8.data1KeyValueList[1][task.id] or 0) + slot6.count

					slot7:updateActivity(slot8)
				end
			else
				table.insert(uv1, slot6)
			end
		end

		uv2:sendNotification(GAME.SUBMIT_TASK_DONE, uv1, _.map(uv3, function (slot0)
			return slot0.id
		end))
	end)
end

return slot0
