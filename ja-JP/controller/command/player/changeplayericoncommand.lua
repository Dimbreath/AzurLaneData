class("ChangePlayerIcon", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.characterId
	slot5 = slot2.skinPage
	slot6 = slot2.callback
	slot8 = getProxy(PlayerProxy).getData(slot7)

	if type(slot2.characterId) == "number" then
		if slot8.character == slot3 then
			if slot5 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("change_skin_secretary_ship"))
			end

			return
		else
			slot4 = {}

			for slot12 = 1, #slot8.characters, 1 do
				slot4[slot12] = slot8.characters[slot12]
			end

			for slot12 = 1, #slot4, 1 do
				if slot4[slot12] == slot3 then
					slot4[slot12] = slot4[1]
					slot4[1] = slot4[slot12]
				end
			end

			slot4[1] = slot3
		end
	end

	pg.ConnectionMgr.GetInstance():Send(11011, {
		character = slot4
	}, 11012, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(BayProxy)
			slot2 = slot1:getShipById(slot0[1])
			slot1.character = slot0[1]
			slot1.characters = slot0
			slot1.icon = slot2.configId
			slot1.skinId = slot2.skinId

			slot2:updatePlayer(slot1)

			if slot2.updatePlayer then
				pg.TipsMgr.GetInstance():ShowTips(i18n("change_skin_secretary_ship"))
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("player_changePlayerIcon_ok"))
			end

			if slot4 then
				slot4()
			end

			slot5:sendNotification(GAME.CHANGE_PLAYER_ICON_DONE, {
				ship = slot2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("player_changePlayerIcon", slot0.result))
		end
	end)
end

return class("ChangePlayerIcon", pm.SimpleCommand)
