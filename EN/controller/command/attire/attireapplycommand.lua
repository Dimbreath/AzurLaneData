class("AttireApplyCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if not getProxy(AttireProxy):getAttireFrame(slot1:getBody().type, slot1.getBody().id) then
		return
	end

	slot7 = getProxy(PlayerProxy).getData(slot6)

	pg.ConnectionMgr.GetInstance():Send(11005, {
		id = slot3,
		type = slot4
	}, 11006, function (slot0)
		if slot0.result == 0 then
			slot0:updateAttireFrame(slot0.updateAttireFrame, slot0)
			slot3:updatePlayer(slot0)
			slot4:sendNotification(GAME.ATTIRE_APPLY_DONE)
		else
			print(slot0.result)
		end
	end)
end

return class("AttireApplyCommand", pm.SimpleCommand)
