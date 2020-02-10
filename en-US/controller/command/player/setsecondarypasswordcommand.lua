slot0 = class("SetSecondaryPasswordCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()

	pg.UIMgr.GetInstance():LoadingOn()

	slot6.password = slot2.pwd
	slot6.notice = slot2.tip
	slot6.system_list = slot2.settings

	pg.ConnectionMgr.GetInstance():Send(11605, {}, 11606, function (slot0)
		pg.UIMgr.GetInstance():LoadingOff()

		if slot0.result == 0 then
			getProxy(SecondaryPWDProxy):OnFirstSet(uv0)
		end

		uv1:sendNotification(GAME.SET_PASSWORD_DONE, slot0)
	end)
end

return slot0
