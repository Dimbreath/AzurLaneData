slot0 = class("GuildGetActivationEventCommand", import(".GuildEventBaseCommand"))

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.callback

	if not getProxy(GuildProxy):ShouldFetchActivationEvent() and not slot2.force then
		if slot4 then
			slot4()
		end

		return
	end

	pg.ConnectionMgr.GetInstance():Send(61005, {
		type = 0
	}, 61006, function (slot0)
		if slot0.result == 0 then
			slot2 = uv0:getData()

			slot2:GetEventById(slot0.operation.operation_id):Active(slot0.operation)
			uv0:AddFetchActivationEventCDTime()
			uv0:updateGuild(slot2)
			uv1:sendNotification(GAME.GUILD_GET_ACTIVATION_EVENT_DONE)
			pg.ShipFlagMgr:GetInstance():UpdateFlagShips("inGuildEvent")

			if uv2 then
				uv2()
			end
		elseif uv2 then
			uv2()
		end
	end)
end

return slot0
