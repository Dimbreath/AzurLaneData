slot0 = class("BackyardBoatVO")
slot0.INTERACTION_TYPE_BEFORE = 0
slot0.INTERACTION_TYPE_AFTER = 1

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot1.configId
	slot0.gruopId = pg.ship_data_template[slot0.configId].group_type
	slot0.position = slot1.position
	slot0.lockPosition = slot1.lockPosition
	slot0.inimacy = slot1.state_info_3
	slot0.money = slot1.state_info_4
	slot0.energy = slot1.energy
	slot0.skinId = slot1.skinId
	slot0.lockPathList = {}
	slot0.furnitureId = slot1.furnitureId
	slot0.spineId = slot1.spineId
	slot0.stageId = slot1.stageId
	slot0.spineExtra = nil
	slot0.rawShip = slot1
	slot0.rate = slot1.rate or 100
end

slot0.hasSpineExtra = function (slot0)
	return slot0.spineExtra ~= nil
end

slot0.getSpineExtraId = function (slot0)
	return slot0.spineExtra
end

slot0.addSpineExtra = function (slot0, slot1)
	slot0.spineExtra = slot1
end

slot0.removeSpineExtra = function (slot0)
	slot0.spineExtra = nil
end

slot0.setArchId = function (slot0, slot1)
	slot0.archId = slot1
end

slot0.getArchId = function (slot0)
	return slot0.archId
end

slot0.setStageId = function (slot0, slot1)
	slot0.stageId = slot1
end

slot0.getStageId = function (slot0)
	return slot0.stageId
end

slot0.inStageFurniture = function (slot0)
	return slot0.stageId ~= nil
end

slot0.getRate = function (slot0)
	return slot0.rate
end

slot0.reduceRate = function (slot0)
	slot0.rate = 0
end

slot0.riseRate = function (slot0)
	slot0.rate = math.min(slot0.rate + 5, 50)
end

slot0.getSpeed = function (slot0)
	return math.floor(1 / pg.ship_data_statistics[slot0.configId].backyard_speed)
end

slot0.setLockPathList = function (slot0, slot1)
	slot0.lockPathList = slot1
end

slot0.setSpineId = function (slot0, slot1)
	slot0.spineId = slot1
end

slot0.getSpineId = function (slot0)
	return slot0.spineId
end

slot0.clearSpineId = function (slot0)
	slot0.spineId = nil
end

slot0.hasSpineInterAction = function (slot0)
	return slot0.spineId ~= nil
end

slot0.getLockPathList = function (slot0)
	return slot0.lockPathList
end

slot0.clearLockPathList = function (slot0)
	slot0.lockPathList = {}
end

slot0.hasInterActionFurnitrue = function (slot0)
	return slot0.furnitureId ~= nil
end

slot0.setInterActionFurnitrueId = function (slot0, slot1)
	slot0.furnitureId = slot1
end

slot0.getInterActionFurnitrueId = function (slot0)
	return slot0.furnitureId
end

slot0.setPosition = function (slot0, slot1)
	slot0.position = slot1
end

slot0.setLockPosition = function (slot0, slot1)
	slot0.lockPosition = slot1
end

slot0.setInimacy = function (slot0, slot1)
	slot0.inimacy = slot1
end

slot0.hasInimacy = function (slot0)
	return slot0.inimacy ~= 0
end

slot0.hasMoney = function (slot0)
	return slot0.money ~= 0
end

slot0.setMoney = function (slot0, slot1)
	slot0.money = slot1
end

slot0.getLockPosition = function (slot0)
	return slot0.lockPosition
end

slot0.getPosition = function (slot0)
	return slot0.position
end

slot0.getConfig = function (slot0, slot1)
	return pg.ship_data_statistics[slot0.configId][slot1]
end

slot0.getPrefab = function (slot0)
	return slot0.rawShip:getPrefab()
end

slot0.getAttachmentPrefab = function (slot0)
	return slot0.rawShip:getAttachmentPrefab()
end

slot0.getPainting = function (slot0)
	return slot0.rawShip:getPainting()
end

slot0.getSurroundGrid = function (slot0)
	slot1 = slot0:getPosition()

	table.insert(slot2, Vector2(slot1.x, slot1.y + 1))
	table.insert(slot2, Vector2(slot1.x, slot1.y - 1))
	table.insert(slot2, Vector2(slot1.x - 1, slot1.y))
	table.insert({}, Vector2(slot1.x + 1, slot1.y))

	return 
end

return slot0
