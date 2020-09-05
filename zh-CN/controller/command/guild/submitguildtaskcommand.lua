slot0 = class("SubmitGuildTaskCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = slot1:getBody().id

	if not getProxy(GuildProxy):getGuildEvent() then
		return
	end

	if not slot5:getTaskById(slot3) or slot6:hasFetched() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(60040, {
		id = slot3
	}, 60041, function (slot0)
		if slot0.result == 0 then
			uv0:setFetched()
			uv1:updateTask(uv0)
			uv2:updateGuildEvent(uv1)

			slot1 = {}

			for slot5, slot6 in ipairs(slot0.award_list) do
				slot7 = {
					type = slot6.type,
					id = slot6.id,
					count = slot6.number
				}

				if slot6.type ~= DROP_TYPE_SHIP then
					uv3:sendNotification(GAME.ADD_ITEM, Item.New(slot7))
				end

				slot1[#slot1 + 1] = slot7
			end

			uv3:sendNotification(GAME.SUBMIT_GUILD_TASK, slot1)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("task_submitTask", slot0.result))
		end
	end)
end

return slot0
