slot0 = class("BuyFurnitureCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot5 = getProxy(DormProxy)
	slot7 = getProxy(PlayerProxy):getData()

	if #slot2.furnitureIds == 0 or not slot2.type then
		return
	end

	slot8 = 0

	for slot12, slot13 in ipairs(slot3) do
		slot15.id = slot13

		if not Furniture.New({}):inTime() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("buy_furniture_overtime"))

			return
		elseif slot4 == 4 then
			slot8 = slot8 + slot14:getPrice(4)
		elseif slot4 == 6 then
			slot8 = slot8 + slot14:getPrice(6)
		end
	end

	if slot7:getResById(slot4) < slot8 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	function slot9()
		slot3.furniture_id = uv0
		slot3.currency = uv1

		pg.ConnectionMgr.GetInstance():Send(19006, {}, 19007, function (slot0)
			if slot0.result == 0 then
				slot3[id2res(uv1)] = uv2

				uv0:consume({})
				uv3:updatePlayer(uv0)

				for slot4, slot5 in ipairs(uv4) do
					slot7.id = slot5

					uv5:addFurniture(Furniture.New({
						count = 1
					}))
				end

				uv6:sendNotification(GAME.BUY_FURNITURE_DONE, uv5:getData())
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_buy_success"))
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("backyard_buyFurniture_error", slot0.result))
			end
		end)
	end

	if slot4 == 4 then
		slot10 = i18n("word_furniture")

		if #slot3 == 1 then
			slot12.id = slot3[1]
			slot10 = Furniture.New({}):getConfig("name")
		end

		slot13.content = i18n("charge_scene_buy_confirm", slot8, slot10)

		function slot13.onYes()
			uv0()
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({})
	else
		slot9()
	end
end

return slot0
