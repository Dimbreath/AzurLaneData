class("ChangeManifestoCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot5 = getProxy(PlayerProxy).getData(slot4)

	pg.ConnectionMgr.GetInstance():Send(11009, {
		adv = slot1:getBody().manifesto
	}, 11010, function (slot0)
		if slot0.result == 0 then
			slot0.manifesto = slot0

			slot0:updatePlayer(slot0)
			pg.TipsMgr.GetInstance():ShowTips(i18n("player_changeManifesto_ok"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("player_changeManifesto", slot0.result))
		end
	end)
end

return class("ChangeManifestoCommand", pm.SimpleCommand)
