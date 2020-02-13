class("ActivityBossExchangeTicketCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if not slot1:getBody().stageId then
		return
	end

	if not getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) or slot4:isEnd() then
		return
	end

	if not pg.activity_event_worldboss[slot4:getConfig("config_id")] then
		return
	end

	if getProxy(PlayerProxy):getRawData().getResource(slot6, slot5.ticket) <= 0 then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(11202, {
		cmd = 1,
		activity_id = slot4.id,
		arg1 = slot3
	}, 11203, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(PlayerProxy)
			slot2 = slot1:getRawData()

			slot2:consume({
				[id2res(slot0)] = 1
			})
			slot1:sendNotification(GAME.ACT_BOSS_NORMAL_UPDATE, {
				num = 1,
				stageId = slot2
			})
			slot1:sendNotification(GAME.ACT_BOSS_EXCHANGE_TICKET_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return class("ActivityBossExchangeTicketCommand", pm.SimpleCommand)
