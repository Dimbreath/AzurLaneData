class("FetchNpcShipCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().callback

	if not getProxy(TaskProxy):getTaskById(slot1.getBody().taskId) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("task_is_not_existence", slot3))

		return
	end

	if not slot6:isFinish() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("task_submitTask_error_notFinish"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(20005, {
		id = slot6.id,
		choice_award = {}
	}, 20006, function (slot0)
		if slot0.result == 0 then
			slot1 = {}

			for slot5, slot6 in ipairs(slot0.award_list) do
				table.insert(slot1, Item.New({
					type = slot6.type,
					id = slot6.id,
					count = slot6.number or slot6.count
				}))
			end

			slot0.submitTime = 1

			slot1:updateTask(slot0)
			slot1.updateTask:sendNotification(GAME.FETCH_NPC_SHIP_DONE, {
				items = slot1,
				callback = slot1.updateTask
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("task_submitTask", slot0.result))
		end
	end)
end

return class("FetchNpcShipCommand", pm.SimpleCommand)
