slot0 = class("BackYardGetThemeTemplateCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.callback
	slot5 = getProxy(DormProxy)

	function slot6(slot0)
		if uv0 == BackYardConst.THEME_TEMPLATE_TYPE_SHOP then
			for slot5, slot6 in ipairs(slot0.theme_id_list or {}) do
				slot7 = nil
				slot7 = BackYardThemeTemplate.New({
					id = slot6
				})
			end

			uv1:SetShopThemeTemplates({
				[slot7.id] = slot7
			})
		elseif uv0 == BackYardConst.THEME_TEMPLATE_TYPE_CUSTOM then
			for slot5, slot6 in ipairs(slot0.theme_list or {}) do
				slot7 = nil
				slot7 = BackYardSelfThemeTemplate.New(slot6)
			end

			uv1:SetCustomThemeTemplates({
				[slot7.id] = slot7
			})
		elseif uv0 == BackYardConst.THEME_TEMPLATE_TYPE_COLLECTION then
			for slot5, slot6 in ipairs(slot0.theme_profile_list or {}) do
				slot7 = nil
				slot7 = BackYardThemeTemplate.New({
					id = slot6.id,
					upload_time = slot6.upload_time
				})
			end

			uv1:SetCollectionThemeTemplates({
				[slot7.id] = slot7
			})
		end

		uv2:sendNotification(GAME.BACKYARD_GET_THEME_TEMPLATE_DONE)

		if uv3 then
			uv3()
		end
	end

	if slot2.type == BackYardConst.THEME_TEMPLATE_TYPE_CUSTOM then
		pg.ConnectionMgr.GetInstance():Send(19105, {
			typ = slot3
		}, 19106, function (slot0)
			if slot0.result == 0 then
				uv0(slot0)
			else
				pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
			end
		end)
	elseif slot3 == BackYardConst.THEME_TEMPLATE_TYPE_SHOP then
		pg.ConnectionMgr.GetInstance():Send(19117, {
			typ = slot5.TYPE,
			page = slot5.PAGE,
			num = BackYardConst.THEME_TEMPLATE_SHOP_REFRSH_CNT
		}, 19118, function (slot0)
			if slot0.result == 0 then
				uv0.PAGE = uv0.PAGE + 1

				uv1(slot0)
			else
				pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
			end
		end)
	elseif slot3 == BackYardConst.THEME_TEMPLATE_TYPE_COLLECTION then
		pg.ConnectionMgr.GetInstance():Send(19115, {
			typ = 3
		}, 19116, function (slot0)
			if slot0.result == 0 then
				uv0(slot0)
			else
				pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
			end
		end)
	end
end

return slot0
