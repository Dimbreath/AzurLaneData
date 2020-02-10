slot0 = class("SetComanderPrefabFleetCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = slot1:getBody().id
	slot5 = getProxy(CommanderProxy)

	for slot10, slot11 in pairs(slot2.commanders) do
		table.insert({}, {
			id = slot11.id,
			pos = slot10
		})
	end

	if #slot6 == 0 or _.all(slot6, function (slot0)
		return slot0.id == 0
	end) then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(25022, {
		id = slot3,
		commandersid = slot6
	}, 25023, function (slot0)
		if slot0.result == 0 then
			slot1 = uv0:getPrefabFleetById(uv1)

			slot1:updateCommanders(uv2)
			uv0:updatePrefabFleet(slot1)
			uv3:sendNotification(GAME.SET_COMMANDER_PREFAB_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result])
		end
	end)
end

return slot0
