slot0 = class("DormProxy", import(".NetProxy"))
slot0.DORM_UPDATEED = "DormProxy updated"
slot0.LEVEL_UP = "DormProxy level up"
slot0.FURNITURE_ADDED = "DormProxy FURNITURE ADDED"
slot0.FURNITURE_UPDATED = "DormProxy FURNITURE UPDATED"
slot0.SHIP_ADDED = "DormProxy ship added"
slot0.SHIP_EXIT = "DormProxy ship exit"
slot0.INIMACY_AND_MONEY_ADD = "DormProxy inimacy and money added"
slot0.SHIPS_EXP_ADDED = "DormProxy SHIPS_EXP_ADDED"
slot0.THEME_ADDED = "DormProxy THEME_ADDED"
slot0.THEME_DELETED = "DormProxy THEME_DELETED"

function slot0.register(slot0)
	slot0.friendData = nil

	slot0:on(19001, function (slot0)
		slot0:sendNotification(GAME.GET_BACKYARD_DATA, {
			isMine = true,
			data = slot0
		})
	end)

	slot0.isLoadExp = nil

	slot0:on(19009, function (slot0)
		slot0.isLoadExp = true
		slot0.data.load_exp = slot0.data.load_exp + slot0.exp
		slot0.data.load_food = slot0.data.load_food + slot0.food_consume

		slot0:updateFood(slot0.food_consume)
		slot0:sendNotification(GAME.BACKYARD_ADD_EXP, slot0.exp)
	end)
	slot0:on(19010, function (slot0)
		for slot4, slot5 in ipairs(slot0.pop_list) do
			slot0:addInimacyAndMoney(slot0.pop_list[slot4].id, slot0.pop_list[slot4].intimacy, slot0.pop_list[slot4].dorm_icon)
		end
	end)
end

function slot0.getBackYardShips(slot0)
	slot1 = {}
	slot2 = getProxy(BayProxy)

	for slot6, slot7 in ipairs(slot0.data.shipIds) do
		if slot2:getShipById(slot7) then
			slot1[slot8.id] = slot8
		else
			print("not found ship >>>", slot7)
		end
	end

	return slot1
end

function slot0.addShip(slot0, slot1)
	slot0.data:addShip(slot1)
	slot0:sendNotification(slot0.SHIP_ADDED, slot0:getShipById(slot1):clone())
	slot0:updateDrom(slot0.data)
end

function slot0.exitYardById(slot0, slot1)
	slot0.data:deleteShip(slot1)
	slot0:sendNotification(slot0.SHIP_EXIT, slot0:getShipById(slot1))
	slot0:updateDrom(slot0.data)
end

function slot0.getShipById(slot0, slot1)
	if slot0:getBackYardShips()[slot1] then
		return slot2[slot1]
	end
end

function slot0.getShipsByState(slot0, slot1)
	slot3 = {}

	for slot7, slot8 in pairs(slot2) do
		if slot8.state == slot1 then
			slot3[slot8.id] = slot8
		end
	end

	return slot3
end

function slot0.getTrainShipIds(slot0)
	return _.keys(slot0:getShipsByState(Ship.STATE_TRAIN) or {})
end

function slot0.getRestShipIds(slot0)
	return _.keys(slot0:getShipsByState(Ship.STATE_REST) or {})
end

function slot0.getTrainShipCount(slot0)
	return #slot0:getTrainShipIds()
end

function slot0.addInimacyAndMoney(slot0, slot1, slot2, slot3)
	if not getProxy(BayProxy):getShipById(slot1) then
		return
	end

	slot5:updateStateInfo34(slot2, slot3)
	slot4:updateShip(slot5)
	slot0:sendNotification(slot0.INIMACY_AND_MONEY_ADD)

	if pg.backyard then
		pg.backyard:sendNotification(BACKYARD.COMMAND_BACKYARD_BOAT, {
			name = BACKYARD.BOAT_HARVEST,
			ship = slot5:clone()
		})
	end
end

function slot0.isLackOfFood(slot0)
	if slot0:getTrainShipCount() == 0 then
		return false
	end

	slot2 = slot0:getRestFood()

	if not slot0.isLoadExp then
		slot2 = slot2 - slot0.data.load_food
	end

	return slot2 <= 0
end

function slot0.havePopEvent(slot0)
	for slot5, slot6 in pairs(slot1) do
		if slot6:hasStateInfo3Or4() then
			return true
		end
	end

	return false
end

function slot0.getFurnitrues(slot0)
	return Clone(slot0.data.furnitures)
end

function slot0.getFurnitrueCount(slot0, slot1)
	slot3 = 0

	for slot7, slot8 in pairs(slot2) do
		if slot8.configId == slot1 then
			slot3 = slot3 + 1
		end
	end

	return slot3
end

function slot0.getTempFurnitrues(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.data.furnitures) do
		if pg.furniture_data_template[slot6.id] then
			slot1[slot6.id] = slot6:clone()
		end
	end

	return slot1
end

function slot0.getFurnitureCountByType(slot0, slot1)
	slot2 = 0

	for slot6, slot7 in pairs(slot0:getFurnitrues()) do
		if slot7:getConfig("type") == slot1 then
			slot2 = slot2 + 1
		end
	end

	return slot2
end

function slot0.addFurniture(slot0, slot1)
	slot3 = slot1.count

	if not slot0:getFurniById(slot1.id) then
		slot2 = slot1

		slot0.data:addFurniture(slot1)
		slot0:sendNotification(slot0.FURNITURE_ADDED, slot1:clone())
	else
		slot2:addFurnitrueCount(slot1.count)
		slot0:updateFurniture(slot2)

		slot3 = slot3 + 1
	end

	for slot7 = 1, slot3 - 1, 1 do
		for slot11 = 1, slot2.count - 1, 1 do
			if not slot0:getFurniById(slot2:getCloneId(slot11)) then
				slot13 = Furniture.New({
					count = 1,
					id = slot12,
					configId = slot2.id,
					get_time = slot2.date
				})

				slot0.data:addFurniture(slot13)
				slot0:sendNotification(slot0.FURNITURE_ADDED, slot13:clone())

				break
			end
		end
	end

	slot0:updateDrom(slot0.data)
end

function slot0.updateFurniture(slot0, slot1)
	slot0.data:updateFurniture(slot1)
	slot0:sendNotification(slot0.FURNITURE_UPDATED, slot1:clone())
end

function slot0.getFurniById(slot0, slot1)
	return Clone(slot0.data:getFurnitrueById(slot1))
end

function slot0.getPutFurnis(slot0)
	return Clone(slot0.data:getPutFurnis())
end

function slot0.getWallPaper(slot0, slot1)
	for slot5, slot6 in pairs(slot0:getFurnitrues()) do
		slot7 = slot6:getConfig("type")

		if slot6.position and slot1 == slot7 then
			return slot6:clone()
		end
	end
end

function slot0.addDorm(slot0, slot1)
	slot0.data = slot1
end

function slot0.updateDrom(slot0, slot1)
	slot0.data = slot1

	slot0.facade:sendNotification(slot0.DORM_UPDATEED, slot1:clone())
end

function slot0.getData(slot0)
	return slot0.data or Dorm.New({
		id = 1
	}):clone()
end

function slot0.updateFood(slot0, slot1)
	slot0.data:consumeFood(slot1)
	slot0.data:restNextTime()
	slot0:updateDrom(slot0.data)
end

function slot0.getRestFood(slot0)
	return slot0.data.food
end

function slot0.hasFood(slot0)
	return slot0.data:isMaxFood() == false and getProxy(BagProxy):getItemCountById(50001) > 0
end

function slot0.initThemes(slot0, slot1)
	slot0.userThemes = {}

	for slot5, slot6 in ipairs(slot1) do
		slot0:updateTheme(slot6)
	end

	slot0.themeInited = true
end

function slot0.AddTheme(slot0, slot1)
	slot0.userThemes[slot1.id] = BackYardTheme.New({
		id = slot1.id,
		name = slot1.name,
		furniture_put_list = slot1.furniture_put_list,
		type = BackYardTheme.TYPE_USER
	})

	slot0.facade:sendNotification(slot0.THEME_ADDED, Clone(BackYardTheme.New()))
end

function slot0.deleteTheme(slot0, slot1)
	slot0.userThemes[slot1] = nil

	slot0:sendNotification(slot0.THEME_DELETED, slot1)
end

function slot0.getThemeById(slot0, slot1)
	return slot0.userThemes[slot1]
end

function slot0.updateTheme(slot0, slot1)
	slot0.userThemes[slot1.id] = BackYardTheme.New({
		id = slot1.id,
		name = slot1.name,
		furniture_put_list = slot1.furniture_put_list,
		type = BackYardTheme.TYPE_USER
	})
end

function slot0.getThemes(slot0)
	if not slot0.themeInited then
		return nil
	end

	return Clone(slot0.userThemes)
end

function slot0.getTheme(slot0, slot1)
	if not slot0.userThemes then
		return nil
	end

	return slot0.userThemes[slot1]
end

function slot0.getNewID(slot0)
	for slot4 = 1, 10, 1 do
		if not slot0.userThemes[slot4] then
			return slot4
		end
	end
end

return slot0
