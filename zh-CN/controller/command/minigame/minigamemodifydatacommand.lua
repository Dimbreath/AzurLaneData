slot0 = class("MiniGameModifyDataCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	for slot10, slot11 in pairs(slot2.map) do
		getProxy(MiniGameProxy):GetMiniGameData(slot1:getBody().id):SetRuntimeData(slot10, slot11)
	end

	slot0:sendNotification(GAME.MODIFY_MINI_GAME_DATA_DONE, {
		id = slot3,
		map = slot4
	})
end

return slot0
