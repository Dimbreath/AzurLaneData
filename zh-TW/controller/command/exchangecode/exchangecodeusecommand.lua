slot0 = class("ExchangeCodeUseCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = slot1:getBody().key

	if pg.SDKMgr:GetInstance():GetChannelUID() == "" then
		slot4 = PLATFORM_LOCAL
	end

	slot8.key = slot3
	slot8.platform = slot4

	pg.ConnectionMgr.GetInstance():Send(11508, {}, 11509, function (slot0)
		if slot0.result == 0 then
			slot3.content = i18n("exchangecode_use_ok")

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true
			})
			pg.m02:sendNotification(GAME.EXCHANGECODE_USE_SUCCESS)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("exchangecode_use", slot0.result))
		end
	end)
end

return slot0
