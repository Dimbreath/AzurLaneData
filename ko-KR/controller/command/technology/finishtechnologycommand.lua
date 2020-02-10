slot0 = class("FinishTechnologyCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.pool_id

	if not getProxy(TechnologyProxy):getTechnologyById(slot2.id) then
		return
	end

	if not slot6:isFinished() then
		return
	end

	slot10.tech_id = slot3
	slot10.refresh_id = slot4

	pg.ConnectionMgr.GetInstance():Send(63003, {}, 63004, function (slot0)
		if slot0.result == 0 then
			uv0:reset()
			uv1:updateTechnology(uv0)

			for slot5, slot6 in ipairs(slot0.drop_list) do
				slot7 = Item.New(slot6)

				uv2:sendNotification(GAME.ADD_ITEM, slot7)
				table.insert({}, slot7)
			end

			for slot6, slot7 in ipairs(slot0.common_list) do
				slot8 = Item.New(slot7)

				uv2:sendNotification(GAME.ADD_ITEM, slot8)
				table.insert({}, slot8)
			end

			if uv0:hasCondition() then
				slot3 = uv0

				if slot3:getTaskId() then
					getProxy(TaskProxy):removeTaskById(slot3)
				end
			end

			uv1:updateTechnologys(slot0)

			slot6.technologyId = uv0.id
			slot6.items = slot1
			slot6.commons = slot2

			uv2:sendNotification(GAME.FINISH_TECHNOLOGY_DONE, {})
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("technology_finish_erro") .. slot0.result)
		end
	end)
end

return slot0
