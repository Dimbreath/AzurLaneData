slot0 = class("ActivityBossExchangeTicketCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if not slot1:getBody().stageId then
		return
	end

	slot4 = getProxy(ActivityProxy)

	if not slot4:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) or slot4:isEnd() then
		return
	end

	if not pg.activity_event_worldboss[slot4:getConfig("config_id")] then
		return
	end

	if getProxy(PlayerProxy):getRawData():getResource(slot5.ticket) <= 0 then
		return
	end

	slot11.activity_id = slot4.id
	slot11.arg1 = slot3

	pg.ConnectionMgr.GetInstance():Send(11202, {
		cmd = 1
	}, 11203, function (slot0)
		if slot0.result == 0 then
			slot5[id2res(uv0)] = 1

			getProxy(PlayerProxy):getRawData():consume({})

			slot6.stageId = uv2

			uv1:sendNotification(GAME.ACT_BOSS_NORMAL_UPDATE, {
				num = 1
			})
			uv1:sendNotification(GAME.ACT_BOSS_EXCHANGE_TICKET_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return slot0
