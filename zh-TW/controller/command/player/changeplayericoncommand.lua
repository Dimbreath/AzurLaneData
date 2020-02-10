slot0 = class("ChangePlayerIcon", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.characterId
	slot6 = slot2.callback

	if type(slot2.characterId) == "number" then
		if getProxy(PlayerProxy):getData().character == slot3 then
			if slot2.skinPage then
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

	slot12.character = slot4

	pg.ConnectionMgr.GetInstance():Send(11011, {}, 11012, function (slot0)
		if slot0.result == 0 then
			slot2 = getProxy(BayProxy):getShipById(uv0[1])
			uv1.character = uv0[1]
			uv1.characters = uv0
			uv1.icon = slot2.configId
			uv1.skinId = slot2.skinId

			uv2:updatePlayer(uv1)

			if uv3 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("change_skin_secretary_ship"))
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("player_changePlayerIcon_ok"))
			end

			if uv4 then
				uv4()
			end

			slot6.ship = slot2

			uv5:sendNotification(GAME.CHANGE_PLAYER_ICON_DONE, {})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("player_changePlayerIcon", slot0.result))
		end
	end)
end

return slot0
