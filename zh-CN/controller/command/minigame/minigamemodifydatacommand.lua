class("MiniGameModifyDataCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot6 = getProxy(MiniGameProxy).GetMiniGameData(slot5, slot3)

	for slot10, slot11 in pairs(slot4) do
		slot6:SetRuntimeData(slot10, slot11)
	end

	slot0:sendNotification(GAME.MODIFY_MINI_GAME_DATA_DONE, {
		id = slot3,
		map = slot4
	})
end

return class("MiniGameModifyDataCommand", pm.SimpleCommand)
