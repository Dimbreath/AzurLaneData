slot0 = class("TechnologyNationProxy", import(".NetProxy"))

slot0.register = function (slot0)
	slot0.typeAttrTable = {}
	slot0.typeOrder = {}
	slot0.typeAttrOrderTable = {}
	slot0.groupListInCount = {}
	slot0.nationToPoint = {}
	slot0.ifShowRedPoint = false
	slot0.timer = nil
	slot0.leftTime = 0
	slot0.techList = {}

	slot0:on(64000, function (slot0)
		for slot4, slot5 in ipairs(slot0.tech_list) do
			slot0.techList[slot5.group_id] = {
				completeID = slot5.effect_tech_id,
				studyID = slot5.study_tech_id,
				finishTime = slot5.study_finish_time
			}
		end

		slot0:flushData()
		slot0:setTimer()
	end)
end

slot0.flushData = function (slot0)
	slot0:shipGroupFilter()
	slot0:nationPointFilter()
	slot0:calculateTecBuff()
	slot0:refreshRedPoint()
end

slot0.updateTecItem = function (slot0, slot1, slot2, slot3, slot4)
	if not slot0.techList[slot1] then
		slot0.techList[slot1] = {
			completeID = 0,
			studyID = slot3,
			finishTime = slot4
		}

		return
	end

	slot0.techList[slot1] = {
		completeID = slot2 or slot0.techList[slot1].completeID,
		studyID = slot3,
		finishTime = slot4
	}
end

slot0.shipGroupFilter = function (slot0)
	slot0.groupListInCount = {}

	for slot5, slot6 in pairs(slot1) do
		if table.indexof(pg.fleet_tech_ship_template.all, slot6.id, 1) then
			slot0.groupListInCount[#slot0.groupListInCount + 1] = slot6
		end
	end
end

slot0.nationPointFilter = function (slot0)
	slot0.nationToPoint = {
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}

	for slot4, slot5 in ipairs(slot0.groupListInCount) do
		slot6 = slot5:getNation()
		slot7 = slot5.id

		if not slot5.maxLV or slot5.maxLV < TechnologyConst.MAX_LV then
			slot0.nationToPoint[slot6] = slot0.nationToPoint[slot6] + pg.fleet_tech_ship_template[slot7].pt_get
		else
			slot0.nationToPoint[slot6] = slot0.nationToPoint[slot6] + pg.fleet_tech_ship_template[slot7].pt_get + pg.fleet_tech_ship_template[slot7].pt_level
		end

		if pg.fleet_tech_ship_template[slot7].max_star <= slot5.star then
			slot0.nationToPoint[slot6] = slot0.nationToPoint[slot6] + pg.fleet_tech_ship_template[slot7].pt_upgrage
		end
	end

	slot0.point = 0

	for slot4, slot5 in ipairs(slot0.nationToPoint) do
		slot0.point = slot0.point + slot5
	end
end

slot0.calculateTecBuff = function (slot0)
	slot0.typeBuffList = {}
	slot0.typeOrder = {}

	for slot4, slot5 in ipairs(slot0.groupListInCount) do
		slot8 = pg.fleet_tech_ship_template[slot5.id].add_get_attr
		slot9 = pg.fleet_tech_ship_template[slot5.id].add_get_value

		for slot13, slot14 in ipairs(slot7) do
			if not slot0.typeBuffList[slot14] then
				slot0.typeBuffList[slot14] = {
					{
						slot8,
						slot9
					}
				}
				slot0.typeOrder[#slot0.typeOrder + 1] = slot14
			else
				slot0.typeBuffList[slot14][#slot0.typeBuffList[slot14] + 1] = {
					slot8,
					slot9
				}
			end
		end

		if slot5.maxLV == TechnologyConst.MAX_LV then
			slot11 = pg.fleet_tech_ship_template[slot6].add_level_attr
			slot12 = pg.fleet_tech_ship_template[slot6].add_level_value

			for slot16, slot17 in ipairs(slot10) do
				if not slot0.typeBuffList[slot17] then
					slot0.typeBuffList[slot17] = {
						{
							slot11,
							slot12
						}
					}
					slot0.typeOrder[#slot0.typeOrder + 1] = slot17
				else
					slot0.typeBuffList[slot17][#slot0.typeBuffList[slot17] + 1] = {
						slot11,
						slot12
					}
				end
			end
		end
	end

	for slot4, slot5 in pairs(slot0.techList) do
		if slot5.completeID ~= 0 then
			for slot10, slot11 in ipairs(slot6) do
				slot13 = slot11[3]
				slot14 = slot11[4]

				for slot18, slot19 in ipairs(slot12) do
					if not slot0.typeBuffList[slot19] then
						slot0.typeBuffList[slot19] = {
							{
								slot13,
								slot14
							}
						}
						slot0.typeOrder[#slot0.typeOrder + 1] = slot19
					else
						slot0.typeBuffList[slot19][#slot0.typeBuffList[slot19] + 1] = {
							slot13,
							slot14
						}
					end
				end
			end
		end
	end

	slot0.typeAttrTable = {}
	slot0.typeAttrOrderTable = {}

	for slot4, slot5 in pairs(slot0.typeBuffList) do
		if not slot0.typeAttrTable[slot4] then
			slot0.typeAttrTable[slot4] = {}
			slot0.typeAttrOrderTable[slot4] = {}
		end

		for slot9, slot10 in ipairs(slot5) do
			slot12 = slot10[2]

			if not slot0.typeAttrTable[slot4][slot10[1]] then
				slot0.typeAttrTable[slot4][slot11] = slot12
				slot0.typeAttrOrderTable[slot4][#slot0.typeAttrOrderTable[slot4] + 1] = slot11
			else
				slot0.typeAttrTable[slot4][slot11] = slot0.typeAttrTable[slot4][slot11] + slot12
			end
		end
	end

	table.sort(slot0.typeOrder, function (slot0, slot1)
		return slot0 < slot1
	end)

	for slot4, slot5 in pairs(slot0.typeAttrOrderTable) do
		table.sort(slot5, function (slot0, slot1)
			return slot0 < slot1
		end)
	end
end

slot0.setTimer = function (slot0)
	if slot0.timer then
		slot0.timer:Stop()

		slot0.leftTime = 0
	end

	for slot4, slot5 in pairs(slot0.techList) do
		if slot5.studyID ~= 0 then
			slot6 = slot5.finishTime
			slot7 = pg.TimeMgr.GetInstance():GetServerTime()
			slot9 = pg.fleet_tech_group[slot4].techs[(table.indexof(pg.fleet_tech_group[slot4].techs, slot5.completeID, 1) or 0) + 1]

			if slot6 < slot7 then
				slot0:sendNotification(GAME.FINISH_CAMP_TEC, {
					tecID = slot4,
					levelID = slot9
				})

				return
			else
				slot0.leftTime = slot6 - slot7
				slot0.timer = Timer.New(function ()
					slot0.leftTime = slot0.leftTime - 1

					if slot0.leftTime == 0 then
						slot0:sendNotification(GAME.FINISH_CAMP_TEC, {
							tecID = slot1,
							levelID = GAME.FINISH_CAMP_TEC
						})
						slot0.sendNotification.timer:Stop()

						slot0.sendNotification.timer.Stop.leftTime = 0
					end
				end, 1, -1)

				slot0.timer:Start()

				return
			end
		end
	end
end

slot0.refreshRedPoint = function (slot0)
	slot0.ifShowRedPoint = false

	for slot4, slot5 in pairs(slot0.techList) do
		if slot5.studyID ~= 0 then
			if slot5.finishTime < pg.TimeMgr.GetInstance():GetServerTime() then
				slot0.ifShowRedPoint = true

				return
			else
				return
			end
		end
	end

	for slot4, slot5 in ipairs(pg.fleet_tech_group.all) do
		if (not slot0.techList[slot5] or slot0.techList[slot5].studyID == 0) and slot0:getLevelByTecID(slot5) < #pg.fleet_tech_group[slot5].techs and pg.fleet_tech_template[pg.fleet_tech_group[slot5].techs[slot6 + 1]].pt <= slot0.nationToPoint[pg.fleet_tech_group[slot5].nation[1]] then
			slot0.ifShowRedPoint = true

			break
		end
	end
end

slot0.GetTecList = function (slot0)
	return slot0.techList
end

slot0.getLevelByTecID = function (slot0, slot1)
	slot2 = nil

	return (not slot0.techList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.techList[slot1].completeID, 1) or 0
end

slot0.getGroupListInCount = function (slot0)
	return slot0.groupListInCount
end

slot0.getShowRedPointTag = function (slot0)
	return slot0.ifShowRedPoint
end

slot0.getStudyingTecItem = function (slot0)
	for slot4, slot5 in pairs(slot0.techList) do
		if slot5.studyID ~= 0 then
			return slot4
		end
	end

	return nil
end

slot0.getPoint = function (slot0)
	return slot0.point
end

slot0.getNationPointList = function (slot0)
	return slot0.nationToPoint
end

slot0.getNationPoint = function (slot0, slot1)
	return slot0.nationToPoint[slot1]
end

slot0.getLeftTime = function (slot0)
	return slot0.leftTime
end

slot0.getTecBuff = function (slot0)
	if OPEN_TEC_TREE_SYSTEM then
		return slot0.typeAttrTable, slot0.typeOrder, slot0.typeAttrOrderTable
	end
end

slot0.getShipAddition = function (slot0, slot1, slot2)
	slot3 = table.indexof(TechnologyConst.TECH_NATION_ATTRS, slot2)
	slot4 = 0
	slot5 = slot0:getTecBuff() or {}

	if slot5[slot1] and slot3 and slot6[slot3] then
		slot4 = slot6[slot3]
	end

	return slot4
end

return slot0
