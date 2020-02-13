class("BuyFurnitureCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().type
	slot5 = getProxy(DormProxy)
	slot7 = getProxy(PlayerProxy).getData(slot6)

	if #slot1:getBody().furnitureIds == 0 or not slot4 then
		return
	end

	slot8 = 0

	for slot12, slot13 in ipairs(slot3) do
		if not Furniture.New({
			id = slot13
		}):inTime() then
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
		pg.ConnectionMgr.GetInstance():Send(19006, {
			furniture_id = slot0,
			currency = slot1
		}, 19007, function (slot0)
			if slot0.result == 0 then
				slot0:consume({
					[id2res(slot1)] = slot0
				})
				slot3:updatePlayer(slot0)

				for slot4, slot5 in ipairs(slot4) do
					slot5:addFurniture(Furniture.New({
						count = 1,
						id = slot5
					}))
				end

				slot6:sendNotification(GAME.BUY_FURNITURE_DONE, slot5:getData())
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_buy_success"))
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("backyard_buyFurniture_error", slot0.result))
			end
		end)
	end

	if slot4 == 4 then
		slot10 = i18n("word_furniture")

		if #slot3 == 1 then
			slot10 = Furniture.New({
				id = slot3[1]
			}):getConfig("name")
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("charge_scene_buy_confirm", slot8, slot10),
			onYes = function ()
				slot0()
			end
		})
	else
		slot9()
	end
end

return class("BuyFurnitureCommand", pm.SimpleCommand)
