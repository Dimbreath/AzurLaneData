slot0 = class("GuildUpdateBossMissionFleetCommand", import(".GuildEventBaseCommand"))

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.editFleet
	slot4 = slot2.callback

	if not slot0:ExistBoss() then
		return
	end

	function slot5(slot0)
		if table.getCount(slot0) == 0 then
			if uv0 then
				uv0()
			end

			return
		end

		pg.ConnectionMgr.GetInstance():Send(61013, {
			fleet = slot0
		}, 61014, function (slot0)
			if slot0.result == 0 then
				for slot8, slot9 in pairs(uv0) do
					getProxy(GuildProxy):getData():GetActiveEvent():GetBossMission():UpdateFleet(slot9)
				end

				slot1:updateGuild(slot2)
				uv1:sendNotification(GAME.GUILD_UPDATE_BOSS_FORMATION_DONE)
				pg.ShipFlagMgr:GetInstance():UpdateFlagShips("inGuildEvent")

				if uv2 then
					uv2()
				end
			else
				pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
			end
		end)
	end

	slot6 = {}

	for slot10, slot11 in pairs(slot3) do
		slot12, slot13 = slot11:IsLegal()

		if not slot12 then
			pg.TipsMgr.GetInstance():ShowTips(slot13)

			return
		end

		slot11:ClearInvaildShip()
		table.insert(slot6, slot0:WarpData(slot11))
	end

	slot5(slot6)
end

function slot0.WarpData(slot0, slot1)
	slot2 = {}

	for slot7, slot8 in ipairs(slot1:GetShipIds()) do
		if not slot2[slot8.uid] then
			slot2[slot8.uid] = {}
		end

		table.insert(slot2[slot8.uid], slot8.id)
	end

	for slot8, slot9 in pairs(slot2) do
		if slot1:ExistMember(slot8) then
			table.insert({}, {
				user_id = slot8,
				ship_ids = slot9
			})
		end
	end

	slot5 = {}

	for slot10, slot11 in pairs(slot1:getCommanders()) do
		table.insert(slot5, {
			pos = slot10,
			id = slot11.id
		})
	end

	return {
		fleet_id = slot1.id,
		ships = slot4,
		commanders = slot5
	}
end

return slot0
