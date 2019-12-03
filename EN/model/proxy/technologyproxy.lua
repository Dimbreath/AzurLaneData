slot0 = class("TechnologyProxy", import(".NetProxy"))
slot0.TECHNOLOGY_ADDED = "TechnologyProxy:TECHNOLOGY_ADDED"
slot0.TECHNOLOGY_UPDATED = "TechnologyProxy:TECHNOLOGY_UPDATED"
slot0.BLUEPRINT_ADDED = "TechnologyProxy:BLUEPRINT_ADDED"
slot0.BLUEPRINT_UPDATED = "TechnologyProxy:BLUEPRINT_UPDATED"
slot0.REFRESH_UPDATED = "TechnologyProxy:REFRESH_UPDATED"

slot0.register = function (slot0)
	slot0.tendency = {}

	slot0:on(63000, function (slot0)
		slot0:updateTechnologys(slot0)

		slot0.refreshTechnologysFlag = slot0.refresh_flag or 0
	end)

	slot0.bluePrintData = {}

	_.each(pg.ship_data_blueprint.all, function (slot0)
		slot0.bluePrintData[ShipBluePrint.New({
			id = slot0,
			version = pg.ship_data_blueprint[slot0].blueprint_version
		}).id] = ShipBluePrint.New()
	end)
	slot0:on(63100, function (slot0)
		for slot4, slot5 in ipairs(slot0.blueprint_list) do
			slot0.bluePrintData[slot5.id]:updateInfo(slot5)
		end

		slot0.coldTime = slot0.cold_time or 0
	end)
end

slot0.setVersion = function (slot0, slot1)
	PlayerPrefs.SetInt("technology_version", slot1)
	PlayerPrefs.Save()
end

slot0.getVersion = function (slot0)
	if not PlayerPrefs.HasKey("technology_version") then
		slot0:setVersion(1)

		return 1
	else
		return PlayerPrefs.GetInt("technology_version")
	end
end

slot0.setTendency = function (slot0, slot1, slot2)
	slot0.tendency[slot1] = slot2
end

slot0.getTendency = function (slot0, slot1)
	return slot0.tendency[slot1]
end

slot0.updateBlueprintStates = function (slot0)
	slot1 = pairs
	slot2 = slot0.bluePrintData or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:updateState()
	end
end

slot0.getColdTime = function (slot0)
	return slot0.coldTime
end

slot0.updateColdTime = function (slot0)
	slot0.coldTime = pg.TimeMgr.GetInstance():GetServerTime() + 86400
end

slot0.updateRefreshFlag = function (slot0, slot1)
	slot0.refreshTechnologysFlag = slot1

	slot0:sendNotification(slot0.REFRESH_UPDATED, slot0.refreshTechnologysFlag)
end

slot0.updateTechnologys = function (slot0, slot1)
	slot0.data = {}

	for slot5, slot6 in ipairs(slot1.refresh_list) do
		slot0.tendency[slot6.id] = slot6.target

		for slot10, slot11 in ipairs(slot6.technologys) do
			slot0:addTechnology(Technology.New({
				id = slot11.id,
				time = slot11.time,
				pool_id = slot6.id
			}))
		end
	end
end

slot0.getActiveTechnologyCount = function (slot0)
	slot1 = 0

	for slot5, slot6 in pairs(slot0.data) do
		if slot6:isStart() then
			slot1 = slot1 + 1
		end
	end

	return slot1
end

slot0.getActiveTechnology = function (slot0)
	slot1 = pairs
	slot2 = slot0.data or {}

	for slot4, slot5 in slot1(slot2) do
		if slot5:isStart() then
			return Clone(slot5)
		end
	end
end

slot0.getTechnologyById = function (slot0, slot1)
	return slot0.data[slot1]:clone()
end

slot0.addTechnology = function (slot0, slot1)
	slot0.data[slot1.id] = slot1

	slot0:sendNotification(slot0.TECHNOLOGY_ADDED, slot1:clone())
end

slot0.updateTechnology = function (slot0, slot1)
	slot0.data[slot1.id] = slot1

	slot0:sendNotification(slot0.TECHNOLOGY_UPDATED, slot1:clone())
end

slot0.getTechnologys = function (slot0)
	slot1 = {}
	slot2 = pairs
	slot3 = slot0.data or {}

	for slot5, slot6 in slot2(slot3) do
		table.insert(slot1, slot6)
	end

	return slot1
end

slot0.getBluePrints = function (slot0)
	return Clone(slot0.bluePrintData)
end

slot0.getBluePrintById = function (slot0, slot1)
	return Clone(slot0.bluePrintData[slot1])
end

slot0.getRawBluePrintById = function (slot0, slot1)
	return slot0.bluePrintData[slot1]
end

slot0.addBluePrint = function (slot0, slot1)
	slot0.bluePrintData[slot1.id] = slot1

	slot0:sendNotification(slot0.BLUEPRINT_ADDED, slot1:clone())
end

slot0.updateBluePrint = function (slot0, slot1)
	slot0.bluePrintData[slot1.id] = slot1

	slot0:sendNotification(slot0.BLUEPRINT_UPDATED, slot1:clone())
end

slot0.getBuildingBluePrint = function (slot0)
	for slot4, slot5 in pairs(slot0.bluePrintData) do
		if slot5:isDeving() or slot5:isFinished() then
			return slot5
		end
	end
end

return slot0
