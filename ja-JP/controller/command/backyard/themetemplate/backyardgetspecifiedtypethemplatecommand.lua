slot0 = class("BackYardGetSpecifiedTypeThemplateCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot4 = getProxy(DormProxy)

	function slot5(slot0)
		for slot5, slot6 in ipairs(slot0.theme_id_list or {}) do
			if not uv0:GetShopThemeTemplateById(slot6) then
				slot8 = BackYardThemeTemplate.New({
					id = slot6
				})
			else
				slot1[slot7.id] = slot7
			end
		end

		uv0:SetShopThemeTemplates({
			[slot8.id] = slot8
		})
		uv1:sendNotification(GAME.BACKYARD_GET_SPECIFIED_TYPE_TEMPLATE_DONE)
	end

	slot4.PAGE = 1

	pg.ConnectionMgr.GetInstance():Send(19117, {
		typ = slot1:getBody().type,
		page = slot4.PAGE,
		num = BackYardConst.THEME_TEMPLATE_SHOP_REFRSH_CNT
	}, 19118, function (slot0)
		if slot0.result == 0 then
			uv0.TYPE = uv1
			uv0.PAGE = uv0.PAGE + 1

			uv2(slot0)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
		end
	end)
end

return slot0
