class("SetComanderPrefabFleetCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().id
	slot5 = getProxy(CommanderProxy)
	slot6 = {}

	for slot10, slot11 in pairs(slot4) do
		table.insert(slot6, {
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
			slot1 = slot0:getPrefabFleetById(slot0.getPrefabFleetById)

			slot1:updateCommanders(slot1.updateCommanders)
			slot0:updatePrefabFleet(slot1)
			slot0:sendNotification(GAME.SET_COMMANDER_PREFAB_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result])
		end
	end)
end

return class("SetComanderPrefabFleetCommand", pm.SimpleCommand)
