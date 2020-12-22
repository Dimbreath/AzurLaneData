slot0 = class("GuildShopCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()

	if getProxy(PlayerProxy):getData():getResource(8) < getProxy(ShopsProxy):getGuildShop():getGoodsById(slot2.goodsId):GetPrice() * #slot2.selectedId then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	if not slot11:CanPurchaseCnt(slot5) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_shop_cnt_no_enough"))

		return
	end

	slot13 = {}

	for slot17, slot18 in ipairs(slot4) do
		if not slot13[slot18] then
			slot13[slot18] = {
				count = 1,
				id = slot18
			}
		else
			slot13[slot18].count = slot13[slot18].count + 1
		end
	end

	pg.ConnectionMgr.GetInstance():Send(60035, {
		goodsid = slot11.configId,
		index = slot11.index,
		selected = _.values(slot13)
	}, 60036, function (slot0)
		if slot0.result == 0 then
			slot1 = {}

			for slot5, slot6 in ipairs(slot0.drop_list) do
				slot7 = Item.New({
					type = slot6.type,
					id = slot6.id,
					count = slot6.number
				})

				uv0:sendNotification(GAME.ADD_ITEM, slot7)
				table.insert(slot1, slot7)
			end

			slot2 = uv1:getGuildShop()

			slot2:UpdateGoodsCnt(uv2, uv3)
			uv1:updateGuildShop(slot2)
			uv4:consume({
				guildCoin = uv5 * uv3
			})
			uv6:updatePlayer(uv4)
			uv0:sendNotification(GAME.ON_GUILD_SHOP_PURCHASE_DONE, {
				awards = slot1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
		end
	end)
end

return slot0
