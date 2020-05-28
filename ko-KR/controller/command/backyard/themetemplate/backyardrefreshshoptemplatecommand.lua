slot0 = class("BackYardRefreshShopTemplateCommand", pm.SimpleCommand)
slot1 = 300
slot0.nextRefreshTime = 0

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()

	if pg.TimeMgr.GetInstance():GetServerTime() <= uv0.nextRefreshTime then
		pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_theme_refresh_time_tip"))

		return
	end

	slot3 = getProxy(DormProxy)

	function slot4(slot0)
		for slot5, slot6 in ipairs(slot0.theme_id_list or {}) do
			if not uv0:GetShopThemeTemplateById(slot6) then
				slot8 = BackYardThemeTemplate.New({
					id = slot6
				})
			else
				slot1[slot7.id] = slot7
			end
		end

		if table.getCount({
			[slot8.id] = slot8
		}) > 0 then
			uv0:SetShopThemeTemplates(slot1)
		end

		if table.getCount(slot1) == 0 then
			uv0.PAGE = 1
		end

		uv1.nextRefreshTime = pg.TimeMgr.GetInstance():GetServerTime() + uv2

		uv3:sendNotification(GAME.BACKYARD_REFRESH_SHOP_TEMPLATE_DONE)
	end

	pg.ConnectionMgr.GetInstance():Send(19117, {
		typ = slot3.TYPE,
		page = slot3.PAGE,
		num = BackYardConst.THEME_TEMPLATE_SHOP_REFRSH_CNT
	}, 19118, function (slot0)
		if slot0.result == 0 then
			uv0.PAGE = uv0.PAGE + 1

			uv1(slot0)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
		end
	end)
end

return slot0
