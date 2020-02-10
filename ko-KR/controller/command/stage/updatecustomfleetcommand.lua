slot0 = class("UpdateCustomFleetCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.callback
	slot6 = getProxy(BayProxy):getRawData()
	slot8 = getProxy(ChapterProxy):getChapterById(slot2.chapterId)
	slot9 = slot8:getConfig("map")
	slot11 = slot8:getEliteFleetCommanders()
	slot12 = {}

	for slot16, slot17 in ipairs(slot8:getEliteFleetList()) do
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

		for slot27, slot28 in pairs(slot11[slot16]) do
			slot31.pos = slot27
			slot31.id = slot28

			table.insert(slot22, {})
		end

		slot18.map_id = slot9
		slot18.main_id = slot19
		slot18.scout_id = slot20
		slot18.submarine_id = slot21
		slot18.commanders = slot22
		slot12[#slot12 + 1] = slot18
	end

	slot16.id = slot9
	slot16.elite_fleet_list = slot12

	pg.ConnectionMgr.GetInstance():Send(13107, {}, 13108, function (slot0)
		if slot0.result == 0 then
			if uv0 ~= nil then
				uv0()
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("update_custom_fleet", slot0.result))
		end
	end)
end

return slot0
