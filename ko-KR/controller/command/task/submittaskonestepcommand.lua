slot0 = class("SubmitTaskOneStepCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = {}
	slot4 = getProxy(TaskProxy)

	for slot8, slot9 in ipairs(slot1:getBody()) do
		slot10 = slot9.id

		if slot9.choice_award then
			table.insert({}, slot9.choice_award)
		end

		if not slot4:getTaskById(slot10) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("task_is_not_existence", slot10))

			return
		end

		if not slot12:isFinish() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("task_submitTask_error_notFinish"))

			return
		end

		pg.ConnectionMgr.GetInstance():Send(20005, {
			id = slot12.id,
			choice_award = slot11
		}, 20006, function (slot0)
			if slot0.result == 0 then
				if uv0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
					getProxy(BagProxy):removeItemById(tonumber(uv0:getConfig("target_id_for_client")), tonumber(uv0:getConfig("target_num")))
				elseif uv0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
					getProxy(ActivityProxy):removeVitemById(uv0:getConfig("target_id_for_client"), uv0:getConfig("target_num"))
				elseif uv0:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
					slot3 = getProxy(PlayerProxy)
					slot4 = slot3:getData()

					slot4:consume({
						[id2res(uv0:getConfig("target_id_for_client"))] = uv0:getConfig("target_num")
					})
					slot3:updatePlayer(slot4)
				end

				for slot4, slot5 in ipairs(PlayerConst.addTranDrop(slot0.award_list)) do
					if slot5.type == DROP_TYPE_VITEM and pg.item_data_statistics[slot5.id].virtual_type == 6 then
						if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) then
							slot8[uv0.id] = (slot7.data1KeyValueList[1][uv0.id] or 0) + slot5.count

							slot6:updateActivity(slot7)
						end
					else
						table.insert(uv1, slot5)
					end
				end

				if uv0:getConfig("type") ~= 8 then
					uv2:removeTask(uv0)
				else
					uv0.submitTime = 1

					uv2:updateTask(uv0)
				end

				if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR) and not slot2:isEnd() and table.contains(slot2:getConfig("config_data")[1] or {}, uv0.id) then
					slot1:monitorTaskList(slot2)
				end

				if uv3 == #uv4 then
					uv5:sendNotification(GAME.SUBMIT_TASK_DONE, uv1, _.map(uv4, function (slot0)
						return slot0.id
					end))
				end
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("task_submitTask", slot0.result))

				return
			end
		end)
	end
end

return slot0
