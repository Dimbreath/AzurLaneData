class("UpdateCustomFleetCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().callback
	slot6 = getProxy(BayProxy).getRawData(slot5)
	slot8 = getProxy(ChapterProxy).getChapterById(slot7, slot3)
	slot9 = slot8:getConfig("map")
	slot11 = slot8:getEliteFleetCommanders()
	slot12 = {}

	for slot16, slot17 in ipairs(slot10) do
		slot18 = {}
		slot19 = {}
		slot20 = {}
		slot21 = {}
		slot22 = {}

		for slot26, slot27 in ipairs(slot17) do
			if pg.ship_data_by_type[slot6[slot27]:getShipType()].team_type == TeamType.Vanguard then
				slot20[#slot20 + 1] = slot27
			elseif slot29 == TeamType.Main then
				slot19[#slot19 + 1] = slot27
			elseif slot29 == TeamType.Submarine then
				slot21[#slot21 + 1] = slot27
			end
		end

		for slot27, slot28 in pairs(slot23) do
			table.insert(slot22, {
				pos = slot27,
				id = slot28
			})
		end

		slot18.map_id = slot9
		slot18.main_id = slot19
		slot18.scout_id = slot20
		slot18.submarine_id = slot21
		slot18.commanders = slot22
		slot12[#slot12 + 1] = slot18
	end

	pg.ConnectionMgr.GetInstance():Send(13107, {
		id = slot9,
		elite_fleet_list = slot12
	}, 13108, function (slot0)
		if slot0.result == 0 then
			if slot0 ~= nil then
				slot0()
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("update_custom_fleet", slot0.result))
		end
	end)
end

return class("UpdateCustomFleetCommand", pm.SimpleCommand)
