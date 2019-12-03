slot0 = class("SpecialActivityCommand", pm.SimpleCommand)

slot0.execute = function (slot0, slot1)
	slot2 = getProxy(ActivityProxy):getActivityById(ActivityConst.ACT_NPC_SHIP_ID)

	if not getProxy(BayProxy).isClearNpc and (not slot2 or slot2:isEnd()) then
		for slot8, slot9 in pairs(slot4) do
			if slot9:isActivityNpc() then
				slot0:unloadEquipments(slot9)
				slot0:checkChapters(slot9)
				slot0:checkFormations(slot9)
				slot0:checkNavTactics(slot9)
				slot3:removeShipById(slot9.id)
			end
		end

		slot3.isClearNpc = true
	end
end

slot0.unloadEquipments = function (slot0, slot1)
	slot2 = getProxy(EquipmentProxy)

	for slot7, slot8 in pairs(slot3) do
		if slot8 then
			if slot8:hasSkin() then
				slot1:updateEquipmentSkin(slot7, 0)
				slot2:addEquipmentSkin(slot8.skinId, 1)
			end

			slot1:updateEquip(slot7, nil)
			slot2:addEquipmentById(slot8.id, 1)
		end
	end
end

slot0.checkChapters = function (slot0, slot1)
	if getProxy(ChapterProxy):getActiveChapter() then
		for slot8, slot9 in pairs(slot4) do
			if slot9:containsShip(slot1.id) then
				slot0:sendNotification(GAME.CHAPTER_OP, {
					type = ChapterConst.OpRetreat
				})

				break
			end
		end
	end

	for slot8, slot9 in pairs(slot4) do
		for slot14, slot15 in pairs(slot10) do
			if table.contains(slot15, slot1.id) then
				table.remove(slot15, table.indexof(slot15, slot1.id))
			end
		end
	end
end

slot0.checkFormations = function (slot0, slot1)
	for slot7, slot8 in pairs(slot3) do
		if slot8:containShip(slot1) then
			slot8:removeShip(slot1)
			slot2:updateFleet(slot8)
		end
	end
end

slot0.checkNavTactics = function (slot0, slot1)
	for slot7, slot8 in ipairs(slot3) do
		if slot8.shipId == slot1.id then
			slot2:deleteStudent(slot8.id)

			break
		end
	end
end

return slot0
