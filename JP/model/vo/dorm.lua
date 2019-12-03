slot0 = class("Dorm", import(".BaseVO"))
slot0.comforChatState = {
	i18n("backyard_backyardScene_comforChatContent1_1"),
	i18n("backyard_backyardScene_comforChatContent2_2"),
	i18n("backyard_backyardScene_comforChatContent3_3")
}

slot0.comforChatContent = function (slot0)
	slot3 = 0

	if pg.gameset.dorm_exp_ratio_comfort_degree.key_value + slot0:getComfortable() ~= 0 then
		slot3 = slot2 / (slot1 + slot2) * 100
	end

	return i18n("backyard_backyardScene_comforChatContent2", slot0.comforChatState[slot0:getComBGIndex()], string.format("%d", slot3), slot0.level - 1) .. i18n("backyard_backyardScene_comforChatContent1", unpack(_.map(slot4, function (slot0)
		return slot0[2]
	end)))
end

slot0.MAX_FLOOR = 2
slot0.MAX_LEVEL = 4
slot0.DORM_2_FLOOR_COMFORTABLE_ADDITION = 20

slot0.Ctor = function (slot0, slot1)
	slot0.configId = slot1.id or slot1.lv
	slot0.id = slot0.configId
	slot0.level = slot0.id
	slot0.food = slot1.food or 0
	slot0.food_extend_count = slot1.food_max_increase_count
	slot0.dorm_food_max = slot1.food_max_increase
	slot0.next_timestamp = slot1.next_timestamp or 0
	slot0.exp_pos = slot1.exp_pos or 2
	slot0.rest_pos = slot0.exp_pos
	slot0.load_exp = 0
	slot0.load_food = 0
	slot0.load_time = slot1.load_time or 0
	slot0.furnitures = slot1.furnitures or {}
	slot0.name = slot1.name
	slot0.shipIds = slot1.shipIds or {}
	slot0.floorNum = slot1.floor_num or 1
end

slot0.isUnlockFloor = function (slot0, slot1)
	return slot1 <= slot0.floorNum
end

slot0.setFloorNum = function (slot0, slot1)
	slot0.floorNum = slot1
end

slot0.getOtherFloorFurnitrues = function (slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.furnitures) do
		if slot7.floor ~= slot1 and slot7.floor ~= 0 then
			slot2[slot7.id] = slot7
		end
	end

	return slot2
end

slot0.getFurnitrues = function (slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.furnitures) do
		if slot7.floor == slot1 then
			slot2[slot7.id] = slot7
		end
	end

	return slot2
end

slot0.setName = function (slot0, slot1)
	slot0.name = slot1
end

slot0.getExtendTrainPosShopId = function (slot0)
	for slot5, slot6 in pairs(pg.shop_template.all) do
		if slot1[slot6].effect_args == ShopArgs.EffectDromExpPos and slot1[slot6].limit_args[1][2] <= slot0.exp_pos and slot0.exp_pos <= slot1[slot6].limit_args[1][3] then
			return slot6
		end
	end
end

slot0.setShipIds = function (slot0, slot1)
	slot0.shipIds = slot1
end

slot0.setFurnitrues = function (slot0, slot1)
	slot0.furnitures = slot1
end

slot0.clearFurnitrues = function (slot0)
	slot0.furnitures = {}
end

slot0.bindConfigTable = function (slot0)
	return pg.dorm_data_template
end

slot0.getPutFurnis = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.furnitures) do
		if slot6.position then
			slot1[slot6.id] = slot6
		end
	end

	return slot1
end

slot0.getComfortable = function (slot0, slot1)
	slot2 = 0
	slot3 = {}

	for slot7, slot8 in pairs(slot0.furnitures) do
		table.insert(slot3, slot8)
	end

	if slot1 and table.getCount(slot1) > 0 then
		for slot7, slot8 in pairs(slot1) do
			table.insert(slot3, slot8)
		end
	end

	for slot8, slot9 in pairs(slot4) do
		slot2 = _.reduce(_(Clone(slot3)):chain():filter(function (slot0)
			return slot0:getTypeForComfortable() == slot0[1]
		end):sort(function (slot0, slot1)
			return slot1:getConfig("comfortable") < slot0:getConfig("comfortable")
		end):slice(1, slot9[2]):value(), 0, function (slot0, slot1)
			return slot0 + slot1:getConfig("comfortable")
		end) + slot2
	end

	slot2 = slot2 + (slot0.level - 1) * 10

	if slot0:isUnlockFloor(2) then
		slot2 = slot2 + slot0.DORM_2_FLOOR_COMFORTABLE_ADDITION
	end

	return slot2
end

slot0.increaseTrainPos = function (slot0)
	slot0.exp_pos = slot0.exp_pos + 1
end

slot0.increaseRestPos = function (slot0)
	slot0.rest_pos = slot0.rest_pos + 1
end

slot0.increaseFoodExtendCount = function (slot0)
	slot0.food_extend_count = slot0.food_extend_count + 1
end

slot0.extendFoodCapacity = function (slot0, slot1)
	slot0.dorm_food_max = slot0.dorm_food_max + slot1
end

slot0.levelUp = function (slot0)
	slot0.configId = slot0.configId + 1
	slot0.id = slot0.configId
	slot0.level = slot0.configId
	slot0.comfortable = (slot0.level - 1) * 10
end

slot0.consumeFood = function (slot0, slot1)
	slot0.food = math.max(slot0.food - slot1, 0)
end

slot0.restNextTime = function (slot0)
	slot0.next_timestamp = pg.TimeMgr.GetInstance():GetServerTime() + slot0:bindConfigTable()[slot0.id].time
end

slot0.isMaxFood = function (slot0)
	return slot0.food >= slot0.dorm_food_max + slot0:bindConfigTable()[slot0.id].capacity
end

slot0.addShip = function (slot0, slot1)
	table.insert(slot0.shipIds, slot1)
end

slot0.deleteShip = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0.shipIds) do
		if slot6 == slot1 then
			table.remove(slot0.shipIds, slot5)

			break
		end
	end
end

slot0.addFurniture = function (slot0, slot1)
	slot0.furnitures[slot1.id] = slot1
end

slot0.updateFurniture = function (slot0, slot1)
	slot0.furnitures[slot1.id] = slot1
end

slot0.getFurnitrueById = function (slot0, slot1)
	return slot0.furnitures[slot1]
end

slot0.hasFurnitrue = function (slot0, slot1)
	return slot0.furnitures[slot1] ~= nil
end

slot0.getFoodLeftTime = function (slot0)
	slot1 = slot0:bindConfigTable()[slot0.id]

	if getProxy(DormProxy):getTrainShipCount() == 0 then
		return 0
	end

	return slot0.next_timestamp + ((slot0.food - slot0.food % (pg.gameset["dorm_food_ratio_by_" .. slot2].key_value / 100 * slot1.consume)) / (pg.gameset["dorm_food_ratio_by_" .. slot2].key_value / 100 * slot1.consume) - 1) * slot1.time
end

slot0.getComBGIndex = function (slot0)
	if slot0:getComfortable() < 30 then
		return 1
	elseif slot1 >= 30 and slot1 < 68 then
		return 2
	else
		return 3
	end
end

slot0.getFood = function (slot0)
	return slot0.food
end

slot0.addFood = function (slot0, slot1)
	slot0.food = slot0.food + slot1
end

slot0.getSaveData = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0:getPutFurnis()) do
		slot1[slot5] = {
			id = slot5,
			x = slot6.position or {}.x or 0,
			y = slot6.position or .y or 0,
			position = Vector2(slot6.position or .x or 0, slot6.position or .y or 0),
			dir = slot6.dir or 1,
			child = slot6.child or {},
			parent = slot6.parent or 0,
			shipId = slot6.shipId or 0
		}
	end

	return slot1
end

slot0.checkData = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0) do
		slot7, slot8 = slot0.checkFurnitrueData(slot6, slot0, slot1)

		if not slot7 then
			return slot7, i18n1("[" .. pg.furniture_data_template[slot6.configId].name .. "]的数据出错了哦:" .. slot8 .. "-" .. slot6.id)
		end
	end

	return true
end

slot0.checkFurnitrueData = function (slot0, slot1, slot2)
	slot3 = BackYardHouseVO.New({
		level = slot2
	})

	if not slot0.floor then
		return false, 0
	end

	if not slot0.parent then
		return false, 1
	end

	if not slot0.dir or slot0.dir < 0 or slot0.dir > 2 then
		return false, 2
	end

	if not slot0.child then
		return false, 4
	end

	if slot0.position then
		slot0.x = slot0.position.x
		slot0.y = slot0.position.y
	end

	if not slot0.x or not slot0.y then
		return false, 5
	end

	if slot0.parent ~= 0 then
		if not slot1[slot0.parent] then
			return false, 7
		end

		if not table.contains(_.keys(slot4.child or {}), slot0.id) then
			return false, 8
		end
	end

	if table.getCount(slot0.child) ~= 0 then
		for slot7, slot8 in pairs(slot0.child) do
			if not slot1[slot7] or slot1[slot7].parent ~= slot0.id then
				return false, 9
			end
		end
	end

	if BackyardFurnitureVO.New(slot0):checkBoundItem() and not slot3:checkBound(slot4:getOccupyGrid(Vector2(slot0.x, slot0.y))) then
		return false, 10
	end

	if not slot4:hasParent() and slot4:isMapItem() and not slot4:isPaper() then
		for slot8, slot9 in pairs(slot1) do
			if slot9.position and slot9.parent == 0 and slot4.id ~= slot9.id and BackyardFurnitureVO.New(slot9):isMapItem() and not slot10:isPaper() and slot4:isConflictPos(slot10) then
				return false, 11
			end
		end
	end

	if table.getCount(slot4.child or {}) ~= 0 then
		slot5 = pairs
		slot6 = slot4.child or {}

		for slot8, slot9 in slot5(slot6) do
			if slot1[slot8] then
				slot11 = BackyardFurnitureVO.New(slot10)

				for slot15, slot16 in pairs(slot4.child) do
					if slot15 ~= slot8 and slot11:isConflictPos(BackyardFurnitureVO.New(slot17)) then
						return false, 12
					end
				end
			end
		end
	end

	return true
end

return slot0
