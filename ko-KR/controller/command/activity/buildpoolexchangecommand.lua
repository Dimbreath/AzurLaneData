slot0 = class("BuildPoolExchangeCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if not getProxy(ActivityProxy):getActivityById(slot1:getBody().activity_id) or slot4:isEnd() then
		pg.TipsMgr:GetInstance():ShowTips(i18n("common_activity_end"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(11202, {
		cmd = 2,
		arg1 = 0,
		arg2 = 0,
		activity_id = slot3,
		arg_list = {}
	}, 11203, function (slot0)
		if slot0.result == 0 then
			uv0.data2 = uv0.data2 + 1

			getProxy(ActivityProxy):updateActivity(uv0)

			slot1 = {}

			for slot5, slot6 in ipairs(slot0.award_list) do
				print(slot6.type)

				slot7 = {
					type = slot6.type,
					id = slot6.id,
					count = slot6.number
				}

				table.insert(slot1, slot7)
				uv1:sendNotification(GAME.ADD_ITEM, Item.New(slot7))
			end

			uv1:sendNotification(GAME.ACTIVITY_BUILD_POOL_EXCHANGE_DONE, {
				awards = slot1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
		end
	end)
end

return slot0
