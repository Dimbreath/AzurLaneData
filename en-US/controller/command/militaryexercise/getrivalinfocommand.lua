slot0 = class("GetRivalInfoCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot6.id = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(18104, {}, 18105, function (slot0)
		if slot0.info.id == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_get_player_info_erro"))
		else
			slot5.rival = Rival.New(slot0.info)

			uv0:sendNotification(GAME.GET_RIVAL_INFO_DONE, {})
		end
	end)
end

return slot0
