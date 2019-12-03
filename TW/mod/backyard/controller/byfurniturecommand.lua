class("BYFurnitureCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if not slot1:getBody() then
		return
	end

	slot4 = getBackYardProxy(BackYardHouseProxy)

	if slot2.name == BACKYARD.FURNITURE_ADD then
		slot4:addFurniture(BackyardFurnitureVO.New(slot2.furniture), slot2.callback)
	elseif slot3 == BACKYARD.CLEAR_FURNITURE then
		slot4:removeAllFurniture()
		slot4:removePaper()
	elseif slot3 == BACKYARD.FURNITURE_CHANGE_DIR then
		slot6 = slot4:getFurnitureById(slot5)
		slot7 = slot6:getReverseDir()

		if slot4:getData():canRotate(slot6) then
			slot9 = slot6:getPosition()

			pg.backyard:sendNotification(BACKYARD.REMOVE_ITEM, Clone(slot6))

			if slot6:hasStageShip() then
				slot11 = pairs
				slot12 = slot6:getStageShip() or {}

				for slot14, slot15 in slot11(slot12) do
					slot16 = nil
					slot17 = slot6:getPosition()
					slot18 = slot8:getShipPosById(slot15)
					slot19 = nil

					slot4:changeShipPos(slot15, (slot7 ~= 2 or Vector2(slot9.x + (slot6.dir ~= 2 or Vector2(slot18.y - slot17.y, slot18.x - slot17.x)) and Vector2(slot18.x - slot17.x, slot18.y - slot17.y).y, slot9.y + (slot6.dir ~= 2 or Vector2(slot18.y - slot17.y, slot18.x - slot17.x)) and Vector2(slot18.x - slot17.x, slot18.y - slot17.y).x)) and Vector2(slot9.x + (slot6.dir ~= 2 or Vector2(slot18.y - slot17.y, slot18.x - slot17.x)) and Vector2(slot18.x - slot17.x, slot18.y - slot17.y).x, slot9.y + (slot6.dir ~= 2 or Vector2(slot18.y - slot17.y, slot18.x - slot17.x)) and Vector2(slot18.x - slot17.x, slot18.y - slot17.y).y))
				end
			end

			slot4:changeFurnitureDir(slot5, slot7)

			for slot13, slot14 in pairs(slot6.child) do
				slot15 = nil
				slot16 = slot4:getFurnitureById(slot13)

				pg.backyard:sendNotification(BACKYARD.REMOVE_ITEM, Clone(slot16))
				slot4:changeFurnitureDir(slot13, slot16:getReverseDir())
				slot4:changeFurniturePos(slot13, (slot6.dir ~= 2 or Vector2(slot9.x + slot14.y, slot9.y + slot14.x)) and Vector2(slot9.x + slot14.x, slot9.y + slot14.y))
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_backyardScene_error_canNotRotate"))
		end
	else
		if slot3 == BACKYARD.FURNITURE_POS_CHANGE then
			slot5 = slot2.id
			slot7 = slot2.parentId

			if not slot2.pos then
				return
			end

			slot8 = slot4:getFurnitureById(slot5)
			slot9 = slot8:getPosition()

			pg.backyard:sendNotification(BACKYARD.REMOVE_ITEM, Clone(slot8))

			if slot8:hasParent() then
				slot4:getFurnitureById(slot8.parent).child[slot8.id] = nil
				slot8.parent = 0
			end

			slot10 = slot4:getData()

			if slot7 then
				slot11 = slot4:getFurnitureById(slot7)
				slot12 = slot11:getPosition()

				if slot11.dir == 2 then
					slot11.child[slot8.id] = Vector2(slot6.y - slot12.y, slot6.x - slot12.x)
				else
					slot11.child[slot8.id] = Vector2(slot6.x - slot12.x, slot6.y - slot12.y)
				end

				slot8.parent = slot11.id
			end

			slot4:changeFurniturePos(slot5, slot6)
			slot11(slot8)

			if slot8:hasStageShip() then
				slot13 = pairs
				slot14 = slot8:getStageShip() or {}

				for slot16, slot17 in slot13(slot14) do
					slot4:changeShipPos(slot17, Vector2(slot6.x + Vector2(slot10:getShipPosById(slot17).x - slot9.x, slot10.getShipPosById(slot17).y - slot9.y).x, slot6.y + Vector2(slot10.getShipPosById(slot17).x - slot9.x, slot10.getShipPosById(slot17).y - slot9.y).y))
				end
			end

			return
		end

		if slot3 == BACKYARD.FURNITURE_REMOVE then
			if slot4:getFurnitureById(slot5):hasInterActionShipId() or slot6:getSpineId() or slot6:hasStageShip() then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("backyard_ship_on_furnitrue"),
					onYes = function ()
						slot0:removeFurniture(slot0)
					end
				})
			else
				slot4:removeFurniture(slot5)
			end
		elseif slot3 == BACKYARD.FURNITURE_SAVE then
			pg.m02:sendNotification(GAME.PUT_FURNITURE, {
				furnsPos = slot4:getData().getSaveData(slot6),
				tip = slot2.tip
			})
			slot4:clearPreRecord()
			slot4:checkEffect()
		elseif slot3 == BACKYARD.REPALCE_PAPER then
			slot4:replacePaper(slot2.furniture)
		elseif slot3 == BACKYARD.OPEN_DECORATION then
			slot4:recordPerFurnitures()

			for slot10, slot11 in ipairs(slot6) do
				if slot11:getSpineId() then
					print("clear..........")
					slot4:clearSpineInterAction(slot12)
				end
			end
		elseif slot3 == BACKYARD.RESTORE_FURNITURES then
			slot4:restoreFurnitures()
			slot4:clearPreRecord()
		elseif slot3 == BACKYARD.REMOVE_PAPER then
			if slot2.type == 1 then
				slot4:removeWallPaper()
			elseif slot5 == 4 then
				slot4:removeFloorPaper()
			end
		elseif slot3 == BACKYARD.CHECK_EFFECT then
			slot4:checkEffect()
		end
	end
end

return class("BYFurnitureCommand", pm.SimpleCommand)
