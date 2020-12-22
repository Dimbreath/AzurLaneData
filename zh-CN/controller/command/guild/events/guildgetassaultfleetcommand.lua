slot0 = class("GuildGetAssaultFleetCommand", import(".GuildEventBaseCommand"))

function slot0.execute(slot0, slot1)
	slot3 = slot1:getBody().callback

	if not getProxy(GuildProxy):ShouldRequestForamtion() then
		if slot3 then
			slot3()
		end

		return
	end

	pg.ConnectionMgr.GetInstance():Send(61011, {
		type = 0
	}, 61012, function (slot0)
		if slot0.result == 0 then
			slot1 = uv0:getData()

			for slot5, slot6 in ipairs(slot0.ships) do
				if slot1:getMemberById(slot6.user_id) then
					slot8:UpdateAssaultFleet(GuildAssaultFleet.New(slot6))
				end
			end

			uv0:updateGuild(slot1)
			uv1:sendNotification(GAME.GUILD_GET_ASSAULT_FLEET_DONE)
			pg.ShipFlagMgr:GetInstance():UpdateFlagShips("inGuildEvent")

			if uv2 then
				uv2()
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
		end
	end)
end

return slot0
