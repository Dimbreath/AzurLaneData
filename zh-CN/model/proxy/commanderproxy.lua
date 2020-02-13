slot0 = class("CommanderProxy", import(".NetProxy"))
slot0.COMMANDER_UPDATED = "CommanderProxy:COMMANDER_UPDATED"
slot0.COMMANDER_ADDED = "CommanderProxy:COMMANDER_ADDED"
slot0.COMMANDER_DELETED = "CommanderProxy:COMMANDER_DELETED"
slot0.RESERVE_CNT_UPDATED = "CommanderProxy:RESERVE_CNT_UPDATED"
slot0.COMMANDER_BOX_FINISHED = "CommanderProxy:COMMANDER_BOX_FINISHED"
slot0.PREFAB_FLEET_UPDATE = "CommanderProxy:PREFAB_FLEET_UPDATE"
slot0.MAX_WORK_COUNT = 4
slot0.MAX_SLOT = 10
slot0.MAX_PREFAB_FLEET = 3

function slot0.register(slot0)
	slot0.data = {}
	slot0.boxes = {}
	slot0.prefabFleet = {}

	for slot4 = 1, slot0.MAX_PREFAB_FLEET, 1 do
		slot0.prefabFleet[slot4] = CommnaderFleet.New({
			id = slot4
		})
	end

	for slot5 = 1, pg.gameset.commander_box_count.key_value, 1 do
		slot0:addBox(CommanderBox.New({
			id = slot5
		}))
	end

	slot0.pools = {}

	for slot5, slot6 in ipairs(pg.commander_data_create_material.all) do
		table.insert(slot0.pools, CommanderBuildPool.New({
			id = slot6
		}))
	end

	slot0.boxUsageCount = 0

	slot0:on(25001, function (slot0)
		for slot4, slot5 in ipairs(slot0.commanders) do
			slot0:addCommander(Commander.New(slot5))
		end

		for slot4, slot5 in ipairs(slot0.box) do
			slot0:updateBox(CommanderBox.New(slot5))
		end

		for slot4, slot5 in ipairs(slot0.presets) do
			slot6 = slot5.id
			slot8 = {}

			for slot12, slot13 in ipairs(slot7) do
				if slot0:getCommanderById(slot13.id) then
					slot8[slot13.pos] = slot14
				end
			end

			slot0.prefabFleet[slot6]:Update({
				id = slot6,
				name = slot0.name,
				commanders = slot8
			})
		end

		slot0.boxUsageCount = slot0.usage_count or 0
		slot0._mainUITimer = pg.TimeMgr.GetInstance():AddTimer("CommanderProxy", 0, 10, function ()
			slot0:notification()
		end)
	end)
end

function slot0.getPrefabFleetById(slot0, slot1)
	return slot0.prefabFleet[slot1]
end

function slot0.getPrefabFleet(slot0)
	return Clone(slot0.prefabFleet)
end

function slot0.updatePrefabFleet(slot0, slot1)
	slot0.prefabFleet[slot1.id] = slot1

	slot0:sendNotification(slot0.PREFAB_FLEET_UPDATE)
end

function slot0.updatePrefabFleetName(slot0, slot1, slot2)
	slot0.prefabFleet[slot1].updateName(slot3, slot2)
	slot0:sendNotification(slot0.PREFAB_FLEET_UPDATE)
end

function slot0.getCommanderCnt(slot0)
	return table.getCount(slot0.data)
end

function slot0.getPoolById(slot0, slot1)
	return _.detect(slot0:getPools(), function (slot0)
		return slot0.id == slot0
	end)
end

function slot0.getPools(slot0)
	return slot0.pools
end

function slot0.getBoxUseCnt(slot0)
	return slot0.boxUsageCount
end

function slot0.updateBoxUseCnt(slot0, slot1)
	slot0.boxUsageCount = slot0.boxUsageCount + slot1

	slot0:sendNotification(slot0.RESERVE_CNT_UPDATED, slot0.boxUsageCount)
end

function slot0.resetBoxUseCnt(slot0)
	slot0.boxUsageCount = 0

	slot0:sendNotification(slot0.RESERVE_CNT_UPDATED, 0)
end

function slot0.updateBox(slot0, slot1)
	slot0.boxes[slot1.id] = slot1
end

function slot0.addBox(slot0, slot1)
	slot0.boxes[slot1.id] = slot1
end

function slot0.getBoxes(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.boxes) do
		table.insert(slot1, slot6)
	end

	return slot1
end

function slot0.getBoxById(slot0, slot1)
	return slot0.boxes[slot1]
end

function slot0.getCommanderById(slot0, slot1)
	if slot0.data[slot1] then
		return slot2:clone()
	end
end

function slot0.addCommander(slot0, slot1)
	slot0.data[slot1.id] = slot1

	slot0:sendNotification(slot0.COMMANDER_ADDED, slot1:clone())
end

function slot0.updateCommander(slot0, slot1)
	slot0.data[slot1.id] = slot1

	slot0:sendNotification(slot0.COMMANDER_UPDATED, slot1:clone())
end

function slot0.removeCommanderById(slot0, slot1)
	slot0:checkPrefabFleet(slot1)

	slot0.data[slot1] = nil

	slot0:sendNotification(slot0.COMMANDER_DELETED, slot1)
end

function slot0.checkPrefabFleet(slot0, slot1)
	for slot5, slot6 in pairs(slot0.prefabFleet) do
		if slot6:contains(slot1) then
			slot6:removeCommander(slot1)
		end
	end
end

function slot0.notification(slot0)
	if slot0:haveFinishedBox() then
		slot0:sendNotification(slot0.COMMANDER_BOX_FINISHED)
	end
end

function slot0.haveFinishedBox(slot0)
	for slot4, slot5 in pairs(slot0.boxes) do
		if slot5:getState() == CommanderBox.STATE_FINISHED then
			return true
		end
	end

	return false
end

function slot0.onRemove(slot0)
	if slot0._mainUITimer then
		pg.TimeMgr.GetInstance():RemoveTimer(slot0._mainUITimer)
	end

	slot0.super.onRemove(slot0)
end

return slot0
