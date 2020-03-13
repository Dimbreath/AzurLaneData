slot0 = class("BayProxy", import(".NetProxy"))
slot0.SHIP_ADDED = "ship added"
slot0.SHIP_REMOVED = "ship removed"
slot0.SHIP_UPDATED = "ship updated"

function slot0.register(slot0)
	slot0:on(12001, function (slot0)
		slot0.data = {}

		for slot4, slot5 in ipairs(slot0.shiplist) do
			slot6 = Ship.New(slot5)

			slot6:display("loaded")

			slot0.shipHighestLevel = math.max(slot0.shipHighestLevel, slot6.level)

			if slot6:getConfigTable() then
				slot0.data[slot6.id] = slot6

				slot1.recordShipLevelVertify(slot6)
			else
				warning("不存在的角色: " .. slot6.id)
			end
		end
	end)
	slot0:on(12031, function (slot0)
		slot0.energyRecoverTime = slot0.energy_auto_increase_time + Ship.ENERGY_RECOVER_TIME

		slot0:addEnergyListener(slot0.energyRecoverTime - pg.TimeMgr.GetInstance():GetServerTime())
	end)
	slot0:on(12010, function (slot0)
		slot2 = getProxy(PlayerProxy).getInited(slot1)
		slot3 = 0
		slot0.newShipList = {}

		for slot7, slot8 in ipairs(slot0.ship_list) do
			if Ship.New(slot8):getConfigTable() then
				slot0:addShip(slot9, false)

				if slot2 then
					slot3 = slot3 + 1
				end

				slot0.newShipList[#slot0.newShipList + 1] = slot9
			else
				warning("不存在的角色: " .. slot9.id)
			end
		end

		if slot3 > 0 then
			slot0:countShip(slot3)
		end
	end)

	slot1 = getProxy(PlayerProxy)

	slot0:on(12019, function (slot0)
		slot1 = slot0:getData()
		slot2 = slot1:getShipById(slot1.character)

		slot2:setLikability(slot0.intimacy)
		slot1:updateShip(slot2)
	end)

	slot0.handbookTypeAssign = {}

	slot0:buildHandbookTypeAssign()

	slot0.shipHighestLevel = 0
end

function slot0.buildHandbookTypeAssign(slot0)
	for slot5, slot6 in ipairs(slot1) do
		slot0.handbookTypeAssign[pg.ship_data_group[slot6].group_type] = pg.ship_data_group[slot6].handbook_type
	end
end

function slot0.recoverAllShipEnergy(slot0)
	slot1 = getProxy(DormProxy)
	slot2 = pg.energy_template[4].lower_bound - 2
	slot3 = pg.energy_template[4].upper_bound

	for slot7, slot8 in pairs(slot0.data) do
		if slot8.state == Ship.STATE_REST or slot8.state == Ship.STATE_TRAIN then
			slot10 = slot8:getRecoverEnergyPoint() + Ship.BACKYARD_1F_ENERGY_ADDITION

			if slot8.state == Ship.STATE_REST then
				slot10 = slot9 + Ship.BACKYARD_2F_ENERGY_ADDITION
			end

			if slot3 > slot8.energy + slot10 then
				slot8:addEnergy(slot10)
			else
				slot8:setEnergy(slot3)
			end
		elseif slot2 > slot8.energy + slot8:getRecoverEnergyPoint() then
			slot8:addEnergy(slot8:getRecoverEnergyPoint())
		elseif slot2 < slot8.energy then
			slot8:setEnergy(slot8.energy)
		else
			slot8:setEnergy(slot2)
		end

		slot0:updateShip(slot8)
	end
end

function slot0.addEnergyListener(slot0, slot1)
	if slot1 <= 0 then
		slot0:recoverAllShipEnergy()
		slot0:addEnergyListener(Ship.ENERGY_RECOVER_TIME)

		return
	end

	if slot0.energyTimer then
		slot0.energyTimer:Stop()

		slot0.energyTimer = nil
	end

	slot0.energyTimer = Timer.New(function ()
		slot0:recoverAllShipEnergy()
		slot0.recoverAllShipEnergy:addEnergyListener(Ship.ENERGY_RECOVER_TIME)
	end, slot1, 1)

	slot0.energyTimer:Start()
end

function slot0.remove(slot0)
	if slot0.energyTimer then
		slot0.energyTimer:Stop()

		slot0.energyTimer = nil
	end
end

function slot0.recordShipLevelVertify(slot0)
	if slot0 then
		ys.BattleShipLevelVertify[slot0.id] = slot0.generateLevelVertify(slot0.level)
	end
end

function slot0.checkShiplevelVertify(slot0)
	if slot0.generateLevelVertify(slot0.level) == ys.BattleShipLevelVertify[slot0.id] then
		return true
	else
		return false
	end
end

function slot0.generateLevelVertify(slot0)
	return (slot0 + 1114) * 824
end

function slot0.addShip(slot0, slot1, slot2)
	slot0.data[slot1.id] = slot1:clone()

	slot0.recordShipLevelVertify(slot1)

	if defaultValue(slot2, true) then
		slot0:countShip()
	end

	slot0.shipHighestLevel = math.max(slot0.shipHighestLevel, slot1.level)

	if getProxy(CollectionProxy) and not slot1:isActivityNpc() then
		slot3:flushCollection(slot1)
	end

	slot0.facade:sendNotification(slot0.SHIP_ADDED, slot1:clone())
end

function slot0.countShip(slot0, slot1)
	slot2 = getProxy(PlayerProxy)
	slot3 = slot2:getData()

	slot3:increaseShipCount(slot1)
	slot2:updatePlayer(slot3)
end

function slot0.getNewShip(slot0, slot1)
	slot1 = slot1 or true
	slot2 = slot0.newShipList or {}

	if slot1 then
		slot0.newShipList = nil
	end

	return slot2
end

function slot0.getShipsByFleet(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot1:getShipIds()) do
		table.insert(slot2, slot0.data[slot7])
	end

	return slot2
end

function slot0.getSortShipsByFleet(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot1.mainShips) do
		table.insert(slot2, slot0.data[slot7])
	end

	for slot6, slot7 in ipairs(slot1.vanguardShips) do
		table.insert(slot2, slot0.data[slot7])
	end

	return slot2
end

function slot0.getShipByTeam(slot0, slot1, slot2)
	slot3 = {}

	if slot2 == TeamType.Vanguard then
		for slot7, slot8 in ipairs(slot1.vanguardShips) do
			table.insert(slot3, slot0.data[slot8])
		end
	elseif slot2 == TeamType.Main then
		for slot7, slot8 in ipairs(slot1.mainShips) do
			table.insert(slot3, slot0.data[slot8])
		end
	elseif slot2 == TeamType.Submarine then
		for slot7, slot8 in ipairs(slot1.subShips) do
			table.insert(slot3, slot0.data[slot8])
		end
	end

	return Clone(slot3)
end

function slot0.getShipsByTypes(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.data) do
		if table.contains(slot1, slot7:getShipType()) then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot0.getShipsByStatus(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.data) do
		if slot7.status == slot1 then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot0.getConfigShipCount(slot0, slot1)
	slot2 = 0

	for slot6, slot7 in pairs(slot0.data) do
		if slot7.configId == slot1 then
			slot2 = slot2 + 1
		end
	end

	return slot2
end

function slot0.getShips(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.data) do
		table.insert(slot1, slot6)
	end

	return slot1
end

function slot0.getShipCount(slot0)
	return table.getCount(slot0.data)
end

function slot0.getShipById(slot0, slot1)
	if slot0.data[slot1] ~= nil then
		return slot0.data[slot1]:clone()
	end
end

function slot0.updateShip(slot0, slot1)
	if slot1.isNpc then
		return
	end

	if slot0.shipHighestLevel < slot1.level then
		slot0.shipHighestLevel = slot1.level

		pg.TrackerMgr.GetInstance():Tracking(TRACKING_SHIP_HIGHEST_LEVEL, slot0.shipHighestLevel)
	end

	slot0.data[slot1.id] = slot1:clone()

	slot0.recordShipLevelVertify(slot1)

	if slot0.data[slot1.id].level < slot1.level then
		pg.TrackerMgr.GetInstance():Tracking(TRACKING_SHIP_LEVEL_UP, slot1.level - slot2.level)
	end

	if (slot2:getStar() < slot1:getStar() or slot2.intimacy < slot1.intimacy or slot2.level < slot1.level or (not slot2.propose and slot1.propose)) and getProxy(CollectionProxy) and not slot1:isActivityNpc() then
		slot3:flushCollection(slot1)
	end

	slot0.facade:sendNotification(slot0.SHIP_UPDATED, slot1:clone())
end

function slot0.removeShip(slot0, slot1)
	slot0:removeShipById(slot1.id)
end

function slot0.getEquipment2ByflagShip(slot0)
	return slot0:getShipById(getProxy(PlayerProxy).getData(slot1).character):getEquip(2)
end

function slot0.removeShipById(slot0, slot1)
	slot0.data[slot0.data[slot1].id] = nil

	slot0.data[slot1].display(slot2, "removed")
	slot0.facade:sendNotification(slot0.SHIP_REMOVED, slot0.data[slot1])
end

function slot0.findShipByGroup(slot0, slot1)
	for slot5, slot6 in pairs(slot0.data) do
		if slot6.groupId == slot1 then
			return slot6
		end
	end

	return nil
end

function slot0.findShipsByGroup(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.data) do
		if slot7.groupId == slot1 then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot0.getSameGroupShipCount(slot0, slot1)
	slot2 = 0

	for slot6, slot7 in pairs(slot0.data) do
		if slot7.groupId == slot1 then
			slot2 = slot2 + 1
		end
	end

	return slot2
end

function slot0.getBayPower(slot0)
	slot1 = {}
	slot2 = 0

	for slot6, slot7 in pairs(slot0.data) do
		slot8 = slot7.configId
		slot9 = calcFloor(slot7:getShipCombatPower())

		if defaultValue(slot0.handbookTypeAssign[slot7:getGroupId()], 0) ~= 1 and (not slot1[slot8] or slot1[slot8] < slot9) then
			slot1[slot8] = slot9
			slot2 = slot2 - defaultValue(slot1[slot8], 0) + slot9
		end
	end

	return slot2
end

function slot0.getBayPowerRooted(slot0)
	return slot0:getBayPower()^0.667
end

function slot0.getEquipsInShips(slot0, slot1, slot2)
	function slot3(slot0, slot1, slot2)
		slot0.shipId = slot1
		slot0.shipPos = slot2

		return slot0
	end

	slot4 = {}

	for slot8, slot9 in pairs(slot0.data) do
		if not slot1 or slot1.id ~= slot9.id then
			for slot13, slot14 in pairs(slot9.equipments) do
				if slot14 and (not slot1 or not slot2 or not slot1:isForbiddenAtPos(slot14, slot2)) then
					table.insert(slot4, slot3(Clone(slot14), slot9.id, slot13))
				end
			end
		end
	end

	return slot4
end

function slot0.getEquipmentSkinInShips(slot0, slot1, slot2)
	function slot3(slot0)
		return _.any(pg.equip_skin_template[slot0].equip_type, function (slot0)
			return not slot0 or slot0 == slot0
		end)
	end

	slot4 = {}

	for slot8, slot9 in pairs(slot0.data) do
		if not slot1 or slot1.id ~= slot9.id then
			for slot13, slot14 in pairs(slot9.equipments) do
				if slot14 and slot14:hasSkin() and slot3(slot14.skinId) then
					table.insert(slot4, {
						id = slot14.skinId,
						shipId = slot9.id,
						shipPos = slot13
					})
				end
			end
		end
	end

	return slot4
end

function slot0.setSelectShipId(slot0, slot1)
	slot0.selectShipId = slot1
end

function slot0.getProposeGroupList(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.data) do
		if slot6.propose then
			slot1[slot6.groupId] = true
		end
	end

	return slot1
end

function slot0.getEliteRecommendShip(slot0, slot1, slot2)
	slot4 = {}

	for slot8, slot9 in ipairs(slot3) do
		slot4[slot9] = slot9:getShipCombatPower()
	end

	table.sort(slot3, function (slot0, slot1)
		return slot0[slot0] < slot0[slot1]
	end)

	slot5 = {}

	for slot9, slot10 in ipairs(slot2) do
		slot5[#slot5 + 1] = slot0.data[slot10]:getGroupId()
	end

	slot6 = getProxy(EventProxy):getActiveShipIds()
	slot7 = #slot3
	slot8 = nil

	while slot7 > 0 do
		slot11 = slot3[slot7].getGroupId(slot9)

		if not table.contains(slot6, slot3[slot7].id) and not table.contains(slot2, slot10) and not table.contains(slot5, slot11) then
			slot8 = slot9

			break
		else
			slot7 = slot7 - 1
		end
	end

	return slot8
end

function slot0.getChallengeRecommendShip(slot0, slot1, slot2)
	table.sort(slot3, function (slot0, slot1)
		return slot0:getShipCombatPower() < slot1:getShipCombatPower()
	end)

	slot4 = {}
	slot5 = {}

	for slot9, slot10 in ipairs(slot2) do
		slot4[#slot4 + 1] = slot0.data[slot10].getGroupId(slot11)

		if slot5[Challenge.shipTypeFixer(slot0.data[slot10]:getShipType())] == nil then
			slot5[slot12] = 0
		end

		slot5[slot12] = slot5[slot12] + 1
	end

	slot6 = #slot3
	slot7 = nil

	while slot6 > 0 do
		slot9 = slot3[slot6].id
		slot10 = slot3[slot6].getGroupId(slot8)

		if slot5[Challenge.shipTypeFixer(slot3[slot6]:getShipType())] == nil then
			slot5[slot11] = 0
		end

		if slot5[slot11] < Challenge.SAME_TYPE_LIMIT and not table.contains(slot2, slot9) and not table.contains(slot4, slot10) then
			slot7 = slot8

			break
		else
			slot6 = slot6 - 1
		end
	end

	return slot7
end

function slot0.getActivityRecommendShips(slot0, slot1, slot2, slot3)
	slot5 = {}

	for slot9, slot10 in ipairs(slot4) do
		slot5[slot10] = slot10:getShipCombatPower()
	end

	table.sort(slot4, function (slot0, slot1)
		return slot0[slot0] < slot0[slot1]
	end)

	slot6 = {}

	for slot10, slot11 in ipairs(slot2) do
		slot6[#slot6 + 1] = slot0.data[slot11]:getGroupId()
	end

	slot7 = getProxy(EventProxy):getActiveShipIds()
	slot8 = #slot4
	slot9 = {}

	while slot8 > 0 and slot3 > 0 do
		slot12 = slot4[slot8].getGroupId(slot10)

		if not table.contains(slot2, slot4[slot8].id) and not table.contains(slot7, slot11) and not table.contains(slot6, slot12) then
			table.insert(slot9, slot10)
			table.insert(slot6, slot12)

			slot3 = slot3 - 1
		end

		slot8 = slot8 - 1
	end

	return slot9
end

function slot0.getDelegationRecommendShips(slot0, slot1)
	slot2 = 6 - #slot1.shipIds
	slot4 = math.max(slot1.template.ship_lv, 2)

	table.sort(slot6, function (slot0, slot1)
		return slot1.level < slot0.level
	end)

	slot7 = {}
	slot8 = false

	for slot12, slot13 in ipairs(slot5) do
		if slot4 <= slot0.data[slot13].level then
			slot8 = true
		end

		slot7[#slot7 + 1] = slot14:getGroupId()
	end

	slot9 = getProxy(EventProxy):getActiveShipIds()
	slot10 = getProxy(FleetProxy):getAllShipIds()
	slot11 = {}

	for slot16, slot17 in ipairs(slot12) do
		for slot22, slot23 in pairs(slot18) do
			for slot28, slot29 in ipairs(slot24) do
				table.insert(slot11, slot29)
			end

			break
		end
	end

	slot13 = {}

	for slot18, slot19 in ipairs(slot14) do
		for slot24, slot25 in pairs(slot20) do
			for slot30, slot31 in ipairs(slot26) do
				table.insert(slot13, slot31)
			end
		end
	end

	slot15 = {}

	for slot21, slot22 in pairs(slot17) do
		for slot26, slot27 in pairs(slot22) do
			for slot32, slot33 in ipairs(slot28) do
				table.insert(slot15, slot33)
			end
		end
	end

	if slot8 then
		slot4 = 2
	end

	slot18 = {}


	-- Decompilation error in this vicinity:
	function ()
		slot0 = #slot0

		while slot0 > 0 do
			if slot1 <= 0 then
				break
			end

			slot3 = slot0[slot0].getGroupId(slot1)

			if slot0[slot0].id <= slot0[slot0].level and not slot1:isActivityNpc() and slot1.lockState ~= Ship.LOCK_STATE_UNLOCK and not table.contains(slot3, slot3) and not table.contains(table.contains, slot2) and not table.contains(slot5, slot2) and not table.contains(slot6, slot2) and not table.contains(slot7, slot2) and not table.contains(slot8, slot2) and not table.contains(slot9, slot2) then
				table.insert(slot3, slot3)
				table.insert(slot3, slot2)
				table.insert(slot9, slot2)

				slot1 = slot1 - 1

				if slot10 == false then
					slot11 = true

					break

					if false then
						slot0 = slot0 - 1
					end
				end
			end
		end
	end()

	if nil then
		slot8 = true
		slot4 = 2

		slot20()
	end

	return slot18
end

function slot0.fileterShips(slot0, slot1)
	slot2 = {}

	if defaultValue(slot1.inChapter, false) and getProxy(ChapterProxy):getActiveChapter() then
		_.each(slot5:getShips(), function (slot0)
			table.insert(slot0, slot0.id)
		end)
	end

	if defaultValue(slot1.inSham, false) and getProxy(ChapterProxy):getShamChapter() and slot6:isOpen() and slot6.active then
		_.each(slot6:getShips(), function (slot0)
			table.insert(slot0, slot0.id)
		end)
	end

	slot6 = defaultValue(slot1.inPvp, false)

	if defaultValue(slot1.inFleet, false) then
		for slot12, slot13 in ipairs(slot8) do
			if slot0.data[slot13] and (slot14:getFleetId() ~= FleetProxy.PVP_FLEET_ID or not not slot6) then
				table.insert(slot2, slot13)
			end
		end
	end

	if defaultValue(slot1.inBackyard, false) then
		for slot13, slot14 in pairs(slot9) do
			table.insert(slot2, slot13)
		end
	end

	if defaultValue(slot1.inClass, false) then
		for slot14, slot15 in ipairs(slot10) do
			table.insert(slot2, slot15)
		end
	end

	if defaultValue(slot1.inTactics, false) then
		for slot15, slot16 in pairs(slot11) do
			table.insert(slot2, slot16.shipId)
		end
	end

	if defaultValue(slot1.inEvent, false) then
		for slot16, slot17 in ipairs(slot12) do
			table.insert(slot2, slot17)
		end
	end

	if defaultValue(slot1.inAdmiral, false) then
		for slot16, slot17 in ipairs(getProxy(PlayerProxy).getRawData(slot12).characters) do
			table.insert(slot2, slot17)
		end
	end

	if defaultValue(slot1.inExercise, false) then
		for slot18, slot19 in pairs(getProxy(MilitaryExerciseProxy).getExerciseFleet(slot13).vanguardShips) do
			table.insert(slot2, slot19)
		end

		for slot18, slot19 in pairs(slot14.mainShips) do
			table.insert(slot2, slot19)
		end
	end

	if defaultValue(slot1.isActivityNpc, false) then
		for slot17, slot18 in pairs(slot0.data) do
			if slot18:isActivityNpc() and not table.contains(slot2, slot18.id) then
				table.insert(slot2, slot18.id)
			end
		end
	end

	return slot2
end

function slot0.GetBlackBlockShipIDsForFormation(slot0, slot1)
	slot2 = slot0:fileterShips({
		inEvent = true
	})
	slot6 = slot0.data[slot1.activeShipId]
	slot8 = getProxy(FleetProxy):getFleetById(slot3).getTeamByName(slot7, slot4)

	for slot12, slot13 in pairs(slot0.data) do
		for slot17, slot18 in pairs(slot8) do
			slot19 = slot0.data[slot18]

			if slot6 and slot6:isSameKind(slot13) then
			elseif slot19:isSameKind(slot13) and slot19.id ~= slot13.id then
				table.insert(slot2, slot13.id)
			end
		end
	end

	return slot2
end

function slot0.GetBlackBlockShipIDsForEvent(slot0)
	return slot0:fileterShips({
		inSham = true,
		inChapter = true,
		inChallenge = true,
		inEvent = true
	})
end

function slot0.GetBlackBlockShipIDsForBackYard(slot0)
	return slot0:fileterShips({
		inClass = true
	})
end

function slot0.GetBlackBlockShipIDsForClass(slot0)
	return slot0:fileterShips({
		inClass = true
	})
end

return slot0
