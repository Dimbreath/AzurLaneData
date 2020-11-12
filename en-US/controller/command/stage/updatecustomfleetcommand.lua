slot0 = class("UpdateCustomFleetCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.callback
	slot6 = getProxy(BayProxy):getRawData()
	slot8 = getProxy(ChapterProxy):getChapterById(slot2.chapterId)
	slot9 = slot8:getConfig("formation")
	slot11 = slot8:getEliteFleetCommanders()
	slot12 = {}

	for slot16, slot17 in ipairs(slot8:getEliteFleetList()) do
		slot18 = {}
		slot19 = {}
		slot20 = {}

		for slot24, slot25 in ipairs(slot17) do
			slot19[#slot19 + 1] = slot25
		end

		for slot25, slot26 in pairs(slot11[slot16]) do
			table.insert(slot20, {
				pos = slot25,
				id = slot26
			})
		end

		slot18.map_id = slot9
		slot18.main_id = slot19
		slot18.commanders = slot20
		slot12[#slot12 + 1] = slot18
	end

	pg.ConnectionMgr.GetInstance():Send(13107, {
		id = slot9,
		elite_fleet_list = slot12
	}, 13108, function (slot0)
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
