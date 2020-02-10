slot0 = class("GetDormThemeListCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(19018, {
		id = slot1:getBody() or 0
	}, 19019, function (slot0)
		slot1 = getProxy(DormProxy)

		if uv0 == 0 then
			slot1.initThemes(slot1, slot0.theme_list or {})
		else
			for slot5, slot6 in ipairs(slot0.theme_list) do
				slot1:updateTheme(slot6)
			end
		end

		uv1:sendNotification(GAME.GET_DORMTHEME_DONE)
	end)
end

return slot0
