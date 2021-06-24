slot0 = class("MetaCharacterProxy", import(".NetProxy"))
slot0.METAPROGRESS_UPDATED = "MetaCharacterProxy:METAPROGRESS_UPDATED"
slot1 = pg.ship_strengthen_meta

function slot0.register(slot0)
	slot0.data = {}
	slot0.metaProgressVOList = {}
	slot0.metaTacticsInfoTable = nil
	slot0.metaTacticsInfoTableOnStart = nil
	slot0.metaSkillLevelMaxInfoList = nil
	slot0.lastMetaSkillExpInfoList = nil
	slot0.startRecordTag = false

	for slot4, slot5 in pairs(uv0.all) do
		slot6 = MetaProgress.New({
			id = slot5
		})
		slot0.data[slot5] = slot6

		table.insert(slot0.metaProgressVOList, slot6)
	end

	slot0.redTagTable = {}

	for slot4, slot5 in pairs(uv0.all) do
		slot0.redTagTable[slot5] = {
			false,
			false
		}
	end

	slot0:on(63315, function (slot0)
		print("63315 get red tag info")

		for slot5, slot6 in ipairs(slot0.arg1) do
			table.insert({}, MetaCharacterConst.GetMetaShipGroupIDByConfigID(slot6))
		end

		if slot0.type == 1 then
			for slot5, slot6 in pairs(uv0.redTagTable) do
				if table.contains(slot1, slot5) then
					slot6[1] = true
					slot6[2] = false
				else
					slot6[1] = false
					slot6[2] = false
				end
			end
		end
	end)
	slot0:on(63316, function (slot0)
		print("63316 get meta skill exp info")

		slot2 = uv0.metaSkillLevelMaxInfoList or {}

		for slot6, slot7 in ipairs(slot0.skill_info_list) do
			slot9 = slot7.skill_id
			slot10 = slot7.skill_level

			uv0:addExpToMetaTacticsInfo(slot7)
			uv0:setLastMetaSkillExpInfo({}, slot7)
			uv0:setMetaSkillLevelMaxInfo(slot2, slot7)

			slot14 = getProxy(BayProxy):getShipById(slot7.ship_id)

			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_META, {
				metaShipVO = slot14,
				newDayExp = slot7.day_exp,
				addDayExp = slot7.add_exp,
				curSkillID = slot9,
				newSkillLevel = slot10,
				oldSkillLevel = slot14:getMetaSkillLevelBySkillID(slot9)
			})
			slot14:updateSkill({
				skill_id = slot9,
				skill_lv = slot10,
				skill_exp = slot7.skill_exp
			})
			getProxy(BayProxy):updateShip(slot14)
		end

		if #slot2 > 0 then
			uv0.metaSkillLevelMaxInfoList = slot2
		end

		if #slot1 > 0 then
			uv0.lastMetaSkillExpInfoList = slot1
		end
	end)
end

function slot0.getMetaProgressVOList(slot0)
	for slot4, slot5 in ipairs(slot0.metaProgressVOList) do
		slot5:setDataBeforeGet()
	end

	return slot0.metaProgressVOList
end

function slot0.getMetaProgressVOByID(slot0, slot1)
	if slot0.data[slot1] then
		slot2:setDataBeforeGet()
	end

	return slot2
end

function slot0.updateRedTag(slot0, slot1)
	if slot0.redTagTable[slot1][1] == true then
		slot0.redTagTable[slot1][2] = true
	end
end

function slot0.getRedTag(slot0, slot1)
	return slot0.redTagTable[slot1][2] == false and slot2[1] == true
end

function slot0.isHaveVaildMetaProgressVO(slot0)
	for slot5, slot6 in ipairs(slot0:getMetaProgressVOList()) do
		if slot6:isShow() then
			return true
		end
	end

	return false
end

function slot0.isHaveBuildMetaProgressVO(slot0)
	for slot5, slot6 in ipairs(slot0:getMetaProgressVOList()) do
		if slot6:isBuildType() and slot6:isInAct() then
			return true
		end
	end

	return false
end

function slot0.setMetaTacticsInfo(slot0, slot1)
	slot0.metaTacticsInfoTable = slot0.metaTacticsInfoTable or {}

	if MetaTacticsInfo.New(slot1) then
		slot0.metaTacticsInfoTable[slot1.ship_id] = slot3

		slot3:printInfo()
	else
		errorMessage("Creat MetaTacticsInfo Fail!")
	end
end

function slot0.addExpToMetaTacticsInfo(slot0, slot1)
	if slot0.metaTacticsInfoTable[slot1.ship_id] then
		slot3:updateExp(slot1)
		slot3:printInfo()
	else
		errorMessage("MetaTacticsInfo is Null", slot2)
	end
end

function slot0.switchMetaTacticsSkill(slot0, slot1, slot2)
	if slot0.metaTacticsInfoTable[slot1] then
		slot3:switchSkill(slot2)
		slot3:printInfo()
	else
		errorMessage("MetaTacticsInfo is Null", slot1)
	end
end

function slot0.unlockMetaTacticsSkill(slot0, slot1, slot2, slot3)
	slot0.metaTacticsInfoTable = slot0.metaTacticsInfoTable or {}

	if slot0.metaTacticsInfoTable[slot1] then
		slot4:unlockSkill(slot2, slot3)
	else
		slot0.metaTacticsInfoTable[slot1] = MetaTacticsInfo.New({
			ship_id = slot1,
			exp = slot3 and 0,
			skill_id = slot3 and slot2,
			skill_exp = {
				{
					exp = 0,
					skill_id = slot2
				}
			}
		})
	end

	slot4:printInfo()
end

function slot0.requestMetaTacticsInfo(slot0, slot1, slot2)
	if #(slot1 or getProxy(BayProxy):getMetaShipIDList()) == 0 then
		return
	end

	if slot2 then
		slot0:sendNotification(GAME.TACTICS_EXP_META_INFO_REQUEST, {
			idList = slot3
		})
	elseif not slot0.metaTacticsInfoTable then
		slot0:sendNotification(GAME.TACTICS_EXP_META_INFO_REQUEST, {
			idList = slot3
		})
	end
end

function slot0.getMetaTacticsInfoByShipID(slot0, slot1)
	if not slot0.metaTacticsInfoTable then
		return MetaTacticsInfo.New()
	end

	return slot0.metaTacticsInfoTable[slot1] or MetaTacticsInfo.New()
end

function slot0.printAllMetaTacticsInfo(slot0)
	for slot4, slot5 in pairs(slot0.metaTacticsInfoTable) do
		slot5:printInfo()
	end
end

function slot0.setMetaTacticsInfoOnStart(slot0)
	if slot0.startRecordTag then
		return
	end

	slot1 = true

	for slot5, slot6 in pairs(slot0.metaTacticsInfoTable) do
		if slot6 then
			slot1 = false

			break
		end
	end

	if slot0.metaTacticsInfoTable and not slot1 then
		slot0.metaTacticsInfoTableOnStart = Clone(slot0.metaTacticsInfoTable)
		slot0.startRecordTag = true
	end
end

function slot0.getMetaTacticsInfoOnEnd(slot0)
	if not slot0.metaTacticsInfoTableOnStart then
		return false
	end

	slot1 = {}

	for slot7, slot8 in pairs(slot0.metaTacticsInfoTable) do
		slot9 = slot8.shipID
		slot11 = slot0.metaTacticsInfoTableOnStart[slot9] or MetaTacticsInfo.New()

		if not slot2[slot9]:isAnyLearning() or not slot11:isAnyLearning() then
			break
		end

		if getProxy(BayProxy):getShipById(slot9):isAllMetaSkillLevelMax() or (slot11 and slot11:isExpMaxPerDay() or false) then
			break
		end

		slot16 = getProxy(BayProxy):getShipById(slot9):isSkillLevelMax(slot10.curSkillID)

		table.insert(slot1, {
			shipID = slot9,
			addDayExp = slot15,
			isUpLevel = slot10.curDayExp - slot11.curDayExp > 0 and slot16,
			isMaxLevel = slot16,
			isExpMax = slot10:isExpMaxPerDay(),
			progressOld = slot11.curDayExp / pg.gameset.meta_skill_exp_max.key_value,
			progressNew = slot10.curDayExp / pg.gameset.meta_skill_exp_max.key_value
		})
	end

	slot0:clearMetaTacticsInfoRecord()

	return slot1
end

function slot0.clearMetaTacticsInfoRecord(slot0)
	slot0.metaTacticsInfoTableOnStart = nil
	slot0.startRecordTag = false
end

function slot0.setMetaSkillLevelMaxInfo(slot0, slot1, slot2)
	slot4 = slot2.skill_id
	slot6 = slot2.skill_exp
	slot7 = slot2.day_exp
	slot8 = slot2.add_exp

	if getProxy(BayProxy):getShipById(slot2.ship_id):getMetaSkillLevelBySkillID(slot4) < slot2.skill_level and pg.skill_data_template[slot4].max_level <= slot5 then
		slot15 = false

		for slot19, slot20 in pairs(slot1) do
			if slot20.metaShipVO.configId == ({
				metaShipVO = slot9,
				metaSkillID = slot4
			}).metaShipVO.configId then
				slot15 = true

				break
			end
		end

		if not slot15 then
			table.insert(slot1, slot14)
		end
	end
end

function slot0.getMetaSkillLevelMaxInfoList(slot0)
	return slot0.metaSkillLevelMaxInfoList or {}
end

function slot0.clearMetaSkillLevelMaxInfoList(slot0)
	slot0.metaSkillLevelMaxInfoList = nil
end

function slot0.setLastMetaSkillExpInfo(slot0, slot1, slot2)
	slot4 = slot2.skill_id
	slot6 = slot2.skill_exp
	slot7 = slot2.day_exp

	table.insert(slot1, {
		shipID = slot3,
		addDayExp = slot2.add_exp,
		isUpLevel = getProxy(BayProxy):getShipById(slot2.ship_id):getMetaSkillLevelBySkillID(slot4) < slot2.skill_level,
		isMaxLevel = pg.skill_data_template[slot4].max_level <= slot5,
		isExpMax = pg.gameset.meta_skill_exp_max.key_value <= slot7,
		progress = slot7 / pg.gameset.meta_skill_exp_max.key_value
	})
end

function slot0.getLastMetaSkillExpInfoList(slot0)
	return slot0.lastMetaSkillExpInfoList or {}
end

function slot0.clearLastMetaSkillExpInfoList(slot0)
	slot0.lastMetaSkillExpInfoList = nil
end

return slot0
