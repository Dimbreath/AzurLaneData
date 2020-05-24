slot0 = class("InformBackYardThemeTemplateCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()

	if getProxy(PlayerProxy):getRawData().level < 20 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("inform_level_limit"))

		return
	end

	slot4 = slot2.uid
	slot5 = slot2.tid

	for slot10, slot11 in ipairs(slot2.content) do
		slot6 = slot11 + 0
	end

	pg.ConnectionMgr.GetInstance():Send(19129, {
		target_id = slot4,
		theme_id = slot5,
		reason = slot6
	}, 19130, function (slot0)
		if slot0.result == 0 then
			table.insert(getProxy(ChatProxy).informs, uv0 .. uv1)
			uv2:sendNotification(GAME.INFORM_THEME_TEMPLATE_DONE)
			pg.TipsMgr.GetInstance():ShowTips(i18n("inform_sueecss"))
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
		end
	end)
end

return slot0
