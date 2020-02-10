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

				for slot5 = #PlayerConst.tranOwnShipSkin(slot0.award_list), 1, -1 do
					slot6 = slot1[slot5]
					uv1[#uv1 + 1] = slot6

					if slot6.type ~= DROP_TYPE_SHIP then
						uv2:sendNotification(GAME.ADD_ITEM, slot6)
					end

					if slot6.type == DROP_TYPE_ITEM and pg.item_data_statistics[slot6.id].virtual_type == 6 then
						slot7 = getProxy(ActivityProxy)

						if slot7:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) then
							slot9[uv0.id] = (slot8.data1KeyValueList[1][uv0.id] or 0) + slot6.count

							slot7:updateActivity(slot8)
						end

						table.remove(uv1, slot5)
					end
				end

				if uv0:getConfig("type") ~= 8 then
					uv3:removeTask(uv0)
				else
					uv0.submitTime = 1

					uv3:updateTask(uv0)
				end

				slot2 = getProxy(ActivityProxy)

				if slot2:getActivityByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR) and not slot3:isEnd() and table.contains(slot3:getConfig("config_data")[1] or {}, uv0.id) then
					slot2:monitorTaskList(slot3)
				end

				if uv4 == #uv5 then
					uv2:sendNotification(GAME.SUBMIT_TASK_DONE, uv1)
				end
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("task_submitTask", slot0.result))

				return
			end
		end)
	end
end

return slot0
