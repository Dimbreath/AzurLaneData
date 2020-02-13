slot0 = class("TechnologyProxy", import(".NetProxy"))
slot0.TECHNOLOGY_ADDED = "TechnologyProxy:TECHNOLOGY_ADDED"
slot0.TECHNOLOGY_UPDATED = "TechnologyProxy:TECHNOLOGY_UPDATED"
slot0.BLUEPRINT_ADDED = "TechnologyProxy:BLUEPRINT_ADDED"
slot0.BLUEPRINT_UPDATED = "TechnologyProxy:BLUEPRINT_UPDATED"
slot0.REFRESH_UPDATED = "TechnologyProxy:REFRESH_UPDATED"

function slot0.register(slot0)
	slot0.tendency = {}

	slot0:on(63000, function (slot0)
		slot0:updateTechnologys(slot0)

		slot0.refreshTechnologysFlag = slot0.refresh_flag or 0
	end)

	slot0.bluePrintData = {}
	slot0.item2blueprint = {}
	slot0.maxConfigVersion = 0

	_.each(pg.ship_data_blueprint.all, function (slot0)
		slot1 = ShipBluePrint.New({
			id = slot0,
			version = pg.ship_data_blueprint[slot0].blueprint_version
		})
		slot0.maxConfigVersion = math.max(slot0.maxConfigVersion, slot1.version)
		slot0.bluePrintData[slot1.id] = slot1
		slot0.item2blueprint[slot1:getItemId()] = slot1.id
	end)
	slot0:on(63100, function (slot0)
		for slot4, slot5 in ipairs(slot0.blueprint_list) do
			slot0.bluePrintData[slot5.id]:updateInfo(slot5)
		end

		slot0.coldTime = slot0.cold_time or 0
	end)
end

function slot0.setVersion(slot0, slot1)
	PlayerPrefs.SetInt("technology_version", slot1)
	PlayerPrefs.Save()
end

function slot0.getVersion(slot0)
	if not PlayerPrefs.HasKey("technology_version") then
		slot0:setVersion(1)

		return 1
	else
		return PlayerPrefs.GetInt("technology_version")
	end
end

function slot0.getConfigMaxVersion(slot0)
	return slot0.maxConfigVersion
end

function slot0.setTendency(slot0, slot1, slot2)
	slot0.tendency[slot1] = slot2
end

function slot0.getTendency(slot0, slot1)
	return slot0.tendency[slot1]
end

function slot0.updateBlueprintStates(slot0)
	slot1 = pairs
	slot2 = slot0.bluePrintData or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:updateState()
	end
end

function slot0.getColdTime(slot0)
	return slot0.coldTime
end

function slot0.updateColdTime(slot0)
	slot0.coldTime = pg.TimeMgr.GetInstance():GetServerTime() + 86400
end

function slot0.updateRefreshFlag(slot0, slot1)
	slot0.refreshTechnologysFlag = slot1

	slot0:sendNotification(slot0.REFRESH_UPDATED, slot0.refreshTechnologysFlag)
end

function slot0.updateTechnologys(slot0, slot1)
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

function slot0.getActiveTechnologyCount(slot0)
	slot1 = 0

	for slot5, slot6 in pairs(slot0.data) do
		if slot6:isStart() then
			slot1 = slot1 + 1
		end
	end

	return slot1
end

function slot0.getActiveTechnology(slot0)
	slot1 = pairs
	slot2 = slot0.data or {}

	for slot4, slot5 in slot1(slot2) do
		if slot5:isStart() then
			return Clone(slot5)
		end
	end
end

function slot0.getTechnologyById(slot0, slot1)
	return slot0.data[slot1]:clone()
end

function slot0.addTechnology(slot0, slot1)
	slot0.data[slot1.id] = slot1

	slot0:sendNotification(slot0.TECHNOLOGY_ADDED, slot1:clone())
end

function slot0.updateTechnology(slot0, slot1)
	slot0.data[slot1.id] = slot1

	slot0:sendNotification(slot0.TECHNOLOGY_UPDATED, slot1:clone())
end

function slot0.getTechnologys(slot0)
	slot1 = {}
	slot2 = pairs
	slot3 = slot0.data or {}

	for slot5, slot6 in slot2(slot3) do
		table.insert(slot1, slot6)
	end

	return slot1
end

function slot0.getBluePrints(slot0)
	return Clone(slot0.bluePrintData)
end

function slot0.getBluePrintById(slot0, slot1)
	return Clone(slot0.bluePrintData[slot1])
end

function slot0.getRawBluePrintById(slot0, slot1)
	return slot0.bluePrintData[slot1]
end

function slot0.addBluePrint(slot0, slot1)
	slot0.bluePrintData[slot1.id] = slot1

	slot0:sendNotification(slot0.BLUEPRINT_ADDED, slot1:clone())
end

function slot0.updateBluePrint(slot0, slot1)
	slot0.bluePrintData[slot1.id] = slot1

	slot0:sendNotification(slot0.BLUEPRINT_UPDATED, slot1:clone())
end

function slot0.getBuildingBluePrint(slot0)
	for slot4, slot5 in pairs(slot0.bluePrintData) do
		if slot5:isDeving() or slot5:isFinished() then
			return slot5
		end
	end
end

function slot0.GetBlueprint4Item(slot0, slot1)
	return slot0.item2blueprint[slot1]
end

return slot0
