slot0 = class
slot1 = "PlayerConst"
slot0 = slot0(slot1)
slot1 = 1
slot0.ResGold = slot1
slot1 = 2
slot0.ResOil = slot1
slot1 = 3
slot0.ResExploit = slot1
slot1 = 4
slot0.ResDiamond = slot1
slot1 = 5
slot0.ResOilField = slot1
slot1 = 6
slot0.ResDormMoney = slot1
slot1 = 7
slot0.ResGoldField = slot1
slot1 = 8
slot0.ResContribution = slot1
slot1 = 9
slot0.ResBlueprintFragment = slot1
slot1 = 101
slot0.ResBattery = slot1
slot1 = 102
slot0.ResPT = slot1

function slot1(slot0, slot1, slot2)
	slot3 = DROP_TYPE_RESOURCE

	if slot0 == slot3 then
		slot3 = getProxy
		slot4 = PlayerProxy
		slot3 = slot3(slot4)

		if slot3 then
			slot5 = slot3
			slot4 = slot3.UpdatePlayerRes
			slot6 = slot1
			slot7 = slot2

			slot4(slot5, slot6, slot7)
		end
	else
		slot3 = DROP_TYPE_ITEM

		if slot0 == slot3 then
			slot3 = pg
			slot3 = slot3.item_data_statistics
			slot3 = slot3[slot1]

			if slot3 then
				slot4 = getProxy
				slot5 = BagProxy
				slot4 = slot4(slot5)

				if slot4 then
					slot5 = 0

					if slot2 > slot5 then
						slot6 = slot4
						slot5 = slot4.addItemById
						slot7 = slot1
						slot8 = slot2

						slot5(slot6, slot7, slot8)
					else
						slot5 = 0

						if slot2 < slot5 then
							slot6 = slot4
							slot5 = slot4.removeItemById
							slot7 = slot1
							slot8 = -slot2

							slot5(slot6, slot7, slot8)
						end
					end
				end
			end
		end
	end
end

function slot2(slot0, slot1, slot2)
	slot3 = math
	slot3 = slot3.max
	slot4 = slot2
	slot5 = 0
	slot3 = slot3(slot4, slot5)
	slot2 = slot3
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot6 = slot2

	slot3(slot4, slot5, slot6)
end

addPlayerOwn = slot2

function slot2(slot0, slot1, slot2)
	slot3 = math
	slot3 = slot3.max
	slot4 = slot2
	slot5 = 0
	slot3 = slot3(slot4, slot5)
	slot2 = slot3
	slot3 = slot0
	slot4 = slot0
	slot5 = slot1
	slot6 = -slot2

	slot3(slot4, slot5, slot6)
end

reducePlayerOwn = slot2

function slot2(slot0, slot1)
	slot2 = ""
	slot3 = 0
	slot4 = DROP_TYPE_RESOURCE

	if slot0 == slot4 then
		slot4 = id2res
		slot5 = slot1
		slot4 = slot4(slot5)
		slot5 = pg
		slot5 = slot5.item_data_statistics
		slot6 = id2ItemId
		slot7 = slot1
		slot6 = slot6(slot7)
		slot5 = slot5[slot6]
		slot2 = slot5.name
		slot5 = getProxy
		slot6 = PlayerProxy
		slot5 = slot5(slot6)

		if slot5 then
			slot7 = slot5
			slot6 = slot5.getRawData
			slot6 = slot6(slot7)
			slot3 = slot6[slot4]
		end
	else
		slot4 = DROP_TYPE_ITEM

		if slot0 == slot4 then
			slot4 = pg
			slot4 = slot4.item_data_statistics
			slot4 = slot4[slot1]

			if slot4 then
				slot2 = slot4.name
				slot5 = getProxy
				slot6 = BagProxy
				slot5 = slot5(slot6)

				if slot5 then
					slot7 = slot5
					slot6 = slot5.getItemCountById
					slot8 = slot1
					slot6 = slot6(slot7, slot8)
					slot3 = slot6
				end
			end
		end
	end

	slot4 = slot2
	slot5 = slot3

	return slot4, slot5
end

getPlayerOwn = slot2

function slot2(slot0)
	slot1 = {}
	slot2 = pg
	slot2 = slot2.item_data_statistics
	slot3 = pg
	slot3 = slot3.ship_skin_template
	slot4 = ipairs
	slot5 = slot0
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = nil
		slot10 = slot8.type
		slot11 = DROP_TYPE_SKIN

		if slot10 == slot11 then
			slot10 = getProxy
			slot11 = ShipSkinProxy
			slot10 = slot10(slot11)
			slot11 = slot10
			slot10 = slot10.hasNonLimitSkin
			slot12 = slot8.id
			slot10 = slot10(slot11, slot12)

			if slot10 then
				slot10 = Player
				slot10 = slot10.skin2Res
				slot11 = slot8.id
				slot10, slot11 = slot10(slot11)
				slot12 = id2ItemId
				slot13 = slot10
				slot12 = slot12(slot13)
				slot12 = slot2[slot12]
				slot12 = slot12.name
				slot13 = {}
				slot14 = DROP_TYPE_RESOURCE
				slot13.type = slot14
				slot13.id = slot10
				slot13.count = slot11
				slot14 = slot12
				slot15 = "("
				slot16 = slot8.id
				slot16 = slot3[slot16]
				slot16 = slot16.name
				slot17 = ")"
				slot14 = slot14 .. slot15 .. slot16 .. slot17
				slot13.name = slot14
				slot9 = slot13
			end
		else
			slot10 = slot8.type
			slot11 = DROP_TYPE_NPC_SHIP

			if slot10 == slot11 then
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
		end

		slot10 = table
		slot10 = slot10.insert
		slot11 = slot1
		slot12 = Item
		slot12 = slot12.New
		slot13 = slot9

		slot10(slot11, slot12(slot13))
	end

	return slot1
end

slot0.tranOwnShipSkin = slot2

return slot0
