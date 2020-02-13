class("GuildFacilityUpgradeCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	if not getProxy(GuildProxy):getData() then
		return
	end

	if not slot4:getFacilityById(slot2) then
		return
	end

	if not slot5:canUpgrade(slot4.resource, slot4.level) then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(62046, {
		facility_id = slot2
	}, 62047, function (slot0)
		if slot0.result == 0 then
			slot0:sendNotification(GAME.GUILD_FACILITY_UPGRADE_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("guild_fire_erro", slot0.result))
		end
	end)
end

return class("GuildFacilityUpgradeCommand", pm.SimpleCommand)
