slot0 = class("PlayerConst")
slot0.ResGold = 1
slot0.ResOil = 2
slot0.ResExploit = 3
slot0.ResDiamond = 4
slot0.ResOilField = 5
slot0.ResDormMoney = 6
slot0.ResGoldField = 7
slot0.ResContribution = 8
slot0.ResBlueprintFragment = 9
slot0.ResBattery = 101
slot0.ResPT = 102

function slot1(slot0, slot1, slot2)
	if slot0 == DROP_TYPE_RESOURCE then
		if getProxy(PlayerProxy) then
			slot3:UpdatePlayerRes(slot1, slot2)
		end
	elseif slot0 == DROP_TYPE_ITEM and pg.item_data_statistics[slot1] and getProxy(BagProxy) then
		if slot2 > 0 then
			slot4:addItemById(slot1, slot2)
		elseif slot2 < 0 then
			slot4:removeItemById(slot1, -slot2)
		end
	end
end

function addPlayerOwn(slot0, slot1, slot2)
	slot0(slot0, slot1, math.max(slot2, 0))
end

function reducePlayerOwn(slot0, slot1, slot2)
	slot0(slot0, slot1, -math.max(slot2, 0))
end

function getPlayerOwn(slot0, slot1)
	slot2 = ""
	slot3 = 0

	if slot0 == DROP_TYPE_RESOURCE then
		slot4 = id2res(slot1)
		slot2 = pg.item_data_statistics[id2ItemId(slot1)].name

		if getProxy(PlayerProxy) then
			slot3 = slot5:getRawData()[slot4]
		end
	elseif slot0 == DROP_TYPE_ITEM and pg.item_data_statistics[slot1] then
		slot2 = slot4.name

		if getProxy(BagProxy) then
			slot3 = slot5:getItemCountById(slot1)
		end
	end

	return slot2, slot3
end

function slot0.tranOwnShipSkin(slot0)
	slot1 = {}
	slot2 = pg.item_data_statistics
	slot3 = pg.ship_skin_template

	for slot7, slot8 in ipairs(slot0) do
		slot9 = nil

		if slot8.type == DROP_TYPE_SKIN and getProxy(ShipSkinProxy):hasNonLimitSkin(slot8.id) then
			slot13, slot13.count = Player.skin2Res(slot8.id)
			slot9 = {
				type = DROP_TYPE_RESOURCE,
				id = slot10,
				count = slot11,
				name = slot12 .. "(" .. slot3[slot8.id].name .. ")"
			}
		elseif slot8.type == DROP_TYPE_NPC_SHIP then
			slot9 = {
				count = 1,
				type = slot8.type,
				id = slot8.number or slot8.count
			}
		else
			slot9 = {
				type = slot8.type,
				id = slot8.id,
				count = slot8.number or slot8.count
			}
		end

		table.insert(slot1, Item.New(slot9))
	end

	return slot1
end

return slot0
