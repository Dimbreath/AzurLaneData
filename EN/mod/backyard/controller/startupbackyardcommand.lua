class("StartUpBackYardCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().level
	slot4 = {}

	for slot8, slot9 in pairs(slot1.getBody().ships) do
		slot4[slot8] = BackyardBoatVO.New(slot9)
	end

	slot5 = {}
	slot6, slot7 = nil

	for slot11, slot12 in pairs(slot2.furnitures) do
		slot13 = slot12:getConfig("type")

		if slot12.position and slot13 == Furniture.TYPE_WALLPAPER then
			slot6 = BackyardFurnitureVO.New(slot12)
		elseif slot12.position and slot13 == Furniture.TYPE_FLOORPAPER then
			slot7 = BackyardFurnitureVO.New(slot12)
		elseif slot12.position then
			slot5[slot11] = BackyardFurnitureVO.New(slot12)
		end
	end

	slot8 = BackYardHouseVO.New({
		ships = slot4,
		furnitures = slot5,
		level = slot3,
		wallPaper = slot6,
		floorPaper = slot7
	})

	if slot8:getEmptyGridCount() < table.getCount(slot8.ships) then
		slot11 = slot10 - slot9

		for slot15, slot16 in pairs(slot8.ships) do
			if slot11 == 0 then
				break
			end

			slot11 = slot11 - 1
			slot8.ships[slot15] = nil

			pg.m02:sendNotification(GAME.EXIT_SHIP, {
				shipId = slot15
			})
			pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_notPosition_shipExit"))
		end
	end

	pg.backyard:registerProxy(BackYardHouseProxy.New(slot8))
end

return class("StartUpBackYardCommand", pm.SimpleCommand)
