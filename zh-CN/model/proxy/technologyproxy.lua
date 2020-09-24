slot0 = class("TechnologyProxy", import(".NetProxy"))
slot0.TECHNOLOGY_ADDED = "TechnologyProxy:TECHNOLOGY_ADDED"
slot0.TECHNOLOGY_UPDATED = "TechnologyProxy:TECHNOLOGY_UPDATED"
slot0.BLUEPRINT_ADDED = "TechnologyProxy:BLUEPRINT_ADDED"
slot0.BLUEPRINT_UPDATED = "TechnologyProxy:BLUEPRINT_UPDATED"
slot0.REFRESH_UPDATED = "TechnologyProxy:REFRESH_UPDATED"

function slot0.register(slot0)
	slot0.tendency = {}

	slot0:on(63000, function (slot0)
		uv0:updateTechnologys(slot0)

		uv0.refreshTechnologysFlag = slot0.refresh_flag or 0

		if slot0.catchup then
			uv0.curCatchupTecID = slot0.catchup.id
			uv0.curCatchupGroupID = slot0.catchup.target
			uv0.curCatchupPrintsNum = slot0.catchup.number
		end
	end)

	slot0.bluePrintData = {}
	slot0.item2blueprint = {}
	slot0.maxConfigVersion = 0

	_.each(pg.ship_data_blueprint.all, function (slot0)
		slot1 = ShipBluePrint.New({
			id = slot0,
			version = pg.ship_data_blueprint[slot0].blueprint_version
		})
		uv0.maxConfigVersion = math.max(uv0.maxConfigVersion, slot1.version)
		uv0.bluePrintData[slot1.id] = slot1
		uv0.item2blueprint[slot1:getItemId()] = slot1.id
	end)
	slot0:on(63100, function (slot0)
		for slot4, slot5 in ipairs(slot0.blueprint_list) do
			uv0.bluePrintData[slot5.id]:updateInfo(slot5)
		end

		uv0.coldTime = slot0.cold_time or 0
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
	for slot4, slot5 in pairs(slot0.bluePrintData or {}) do
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

	slot0:sendNotification(uv0.REFRESH_UPDATED, slot0.refreshTechnologysFlag)
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
	for slot5, slot6 in pairs(slot0.data) do
		if slot6:isStart() then
			slot1 = 0 + 1
		end
	end

	return slot1
end

function slot0.getActiveTechnology(slot0)
	for slot4, slot5 in pairs(slot0.data or {}) do
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

	slot0:sendNotification(uv0.TECHNOLOGY_ADDED, slot1:clone())
end

function slot0.updateTechnology(slot0, slot1)
	slot0.data[slot1.id] = slot1

	slot0:sendNotification(uv0.TECHNOLOGY_UPDATED, slot1:clone())
end

function slot0.getTechnologys(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.data or {}) do
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

	slot0:sendNotification(uv0.BLUEPRINT_ADDED, slot1:clone())
end

function slot0.updateBluePrint(slot0, slot1)
	slot0.bluePrintData[slot1.id] = slot1

	slot0:sendNotification(uv0.BLUEPRINT_UPDATED, slot1:clone())
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

function slot0.isOpenTargetCatchup(slot0)
	return pg.technology_catchup_template ~= nil and #pg.technology_catchup_template.all > 0
end

function slot0.getNewestCatchupTecID(slot0)
	return math.max(unpack(pg.technology_catchup_template.all))
end

function slot0.isOnCatchup(slot0)
	return slot0.curCatchupTecID ~= 0 and slot0.curCatchupGroupID ~= 0
end

function slot0.isOnCatchupNewest(slot0)
	if not slot0:isOnCatchup() then
		-- Nothing
	end

	return slot0.curCatchupTecID == slot0:getNewestCatchupTecID()
end

function slot0.judgeOnCatchupOldAndFinished(slot0)
	if not slot0:isOnCatchupNewest() and pg.technology_catchup_template[slot0.curCatchupTecID].obtain_max <= slot0.curCatchupPrintsNum then
		print("finish and old, need reset")
		pg.m02:sendNotification(GAME.SELECT_TEC_TARGET_CATCHUP, {
			charID = 0
		})
	end
end

function slot0.getBluePrintVOByGroupID(slot0, slot1)
	return slot0.bluePrintData[slot1]
end

function slot0.getCurCatchupTecInfo(slot0)
	return {
		tecID = slot0.curCatchupTecID,
		groupID = slot0.curCatchupGroupID,
		printNum = slot0.curCatchupPrintsNum
	}
end

function slot0.setCurCatchupTecInfo(slot0, slot1, slot2, slot3)
	slot0.curCatchupTecID = slot1
	slot0.curCatchupGroupID = slot2
	slot0.curCatchupPrintsNum = slot3 or slot0.curCatchupPrintsNum

	print("设置后的科研追赶信息", slot0.curCatchupTecID, slot0.curCatchupGroupID, slot0.curCatchupPrintsNum)
end

function slot0.addCatupPrintsNum(slot0, slot1)
	slot0.curCatchupPrintsNum = slot0.curCatchupPrintsNum + slot1

	print("增加科研图纸", slot1, slot0.curCatchupPrintsNum)
end

return slot0
