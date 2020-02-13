class("SubmitTaskCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = nil
	slot4 = {}
	slot5 = getProxy(TaskProxy)

	if type(slot1:getBody()) == "number" or type(slot2) == "string" then
		slot3 = slot2
	elseif type(slot2) == "table" then
		for slot12, slot13 in ipairs(slot8) do
			table.insert(slot4, {
				type = slot13[1],
				id = slot13[2],
				number = slot13[3]
			})
		end
	end

	if not slot5:getTaskById(slot3) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("task_is_not_existence", slot3))

		return
	end

	if not slot6:isFinish() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("task_submitTask_error_notFinish"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(20005, {
		id = slot6.id,
		choice_award = slot4
	}, 20006, function (slot0)
		if slot0.result == 0 then
			if slot0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
				getProxy(BagProxy):removeItemById(tonumber(slot1), tonumber(slot0:getConfig("target_num")))
			elseif slot0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
				getProxy(ActivityProxy):removeVitemById(slot0:getConfig("target_id_for_client"), slot0:getConfig("target_num"))
			elseif slot0:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
				slot3 = getProxy(PlayerProxy)
				slot4 = slot3:getData()

				slot4:consume({
					[id2res(slot0:getConfig("target_id_for_client"))] = slot0:getConfig("target_num")
				})
				slot3:updatePlayer(slot4)
			end

			for slot5 = #PlayerConst.tranOwnShipSkin(slot0.award_list), 1, -1 do
				if slot1[slot5].type ~= DROP_TYPE_SHIP then
					slot1:sendNotification(GAME.ADD_ITEM, slot6)
				end

				if slot6.type == DROP_TYPE_ITEM and pg.item_data_statistics[slot6.id].virtual_type == 6 then
					if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) then
						slot9[slot0.id] = (slot8.data1KeyValueList[1][slot0.id] or 0) + slot6.count

						slot7:updateActivity(slot8)
					end

					table.remove(slot1, slot5)
				end
			end

			if slot0:getConfig("type") ~= 8 then
				slot2:removeTask(slot0)
			else
				slot0.submitTime = 1

				slot0:updateTask(slot0)
			end

			slot1:sendNotification(GAME.SUBMIT_TASK_DONE, slot1)

			if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR) and not slot3:isEnd() and table.contains(slot3:getConfig("config_data")[1] or {}, slot0.id) then
				slot2:monitorTaskList(slot3)
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("task_submitTask", slot0.result))
		end
	end)
end

return class("SubmitTaskCommand", pm.SimpleCommand)
