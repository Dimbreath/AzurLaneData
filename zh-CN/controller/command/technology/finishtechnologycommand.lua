class("FinishTechnologyCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().pool_id

	if not getProxy(TechnologyProxy):getTechnologyById(slot1.getBody().id) then
		return
	end

	if not slot6:isFinished() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(63003, {
		tech_id = slot3,
		refresh_id = slot4
	}, 63004, function (slot0)
		if slot0.result == 0 then
			slot0:reset()
			slot0.reset:updateTechnology(slot0)

			slot1 = {}

			for slot5, slot6 in ipairs(slot0.drop_list) do
				slot2:sendNotification(GAME.ADD_ITEM, Item.New(slot6))
				table.insert(slot1, Item.New(slot6))
			end

			slot2 = {}

			for slot6, slot7 in ipairs(slot0.common_list) do
				slot2:sendNotification(GAME.ADD_ITEM, Item.New(slot7))
				table.insert(slot2, Item.New(slot7))
			end

			if slot0:hasCondition() and slot0:getTaskId() then
				getProxy(TaskProxy):removeTaskById(slot3)
			end

			slot1:updateTechnologys(slot0)
			slot2:sendNotification(GAME.FINISH_TECHNOLOGY_DONE, {
				technologyId = slot0.id,
				items = slot1,
				commons = slot2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("technology_finish_erro") .. slot0.result)
		end
	end)
end

return class("FinishTechnologyCommand", pm.SimpleCommand)
