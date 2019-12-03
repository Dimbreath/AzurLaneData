slot0 = class("NavalAcademyProxy", import(".NetProxy"))
slot0.COURSE_START = "NavalAcademyProxy:COURSE_START"
slot0.COURSE_UPDATED = "NavalAcademyProxy:COURSE_UPDATED"
slot0.COURSE_REWARD = "NavalAcademyProxy:COURSE_REWARD"
slot0.COURSE_CANCEL = "NavalAcademyProxy:COURSE_CANCEL"
slot0.RESOURCE_UPGRADE = "NavalAcademyProxy:RESOURCE_UPGRADE"
slot0.BUILDING_FINISH = "NavalAcademyProxy:BUILDING_FINISH"
slot0.START_LEARN_TACTICS = "NavalAcademyProxy:START_LEARN_TACTICS"
slot0.CANCEL_LEARN_TACTICS = "NavalAcademyProxy:CANCEL_LEARN_TACTICS"
slot0.SKILL_CLASS_POS_UPDATED = "NavalAcademyProxy:SKILL_CLASS_POS_UPDATED"

slot0.register = function (slot0)
	slot0.students = {}
	slot0.course = AcademyCourse.New()

	slot0:on(22001, function (slot0)
		slot1 = ResourceField.New(ResourceField.TYPE_OIL)

		slot1:SetLevel(slot0.oil_well_level)
		slot1:SetUpgradeTimeStamp(slot0.oil_well_lv_up_time)

		slot0._oilVO = slot1
		slot2 = ResourceField.New(ResourceField.TYPE_GOLD)

		slot2:SetLevel(slot0.gold_well_level)
		slot2:SetUpgradeTimeStamp(slot0.gold_well_lv_up_time)

		slot0._goldVO = slot2
		slot3 = ResourceField.New(ResourceField.TYPE_CLASS)

		slot3:SetLevel(slot0.class_lv)
		slot3:SetUpgradeTimeStamp(slot0.class_lv_up_time)

		slot0._classVO = slot3

		slot0.course:update(slot0.class)

		slot4 = {}

		for slot8, slot9 in ipairs(slot0.skill_class_list) do
			slot4[Student.New(slot9).id] = Student.New(slot9)
		end

		slot0.skillClassNum = (LOCK_CLASSROOM and 2) or slot0.skill_class_num or 2

		slot0:setStudents(slot4)

		slot0._mainUITimer = pg.TimeMgr.GetInstance():AddTimer("NavalAcademyProxy", 0, 10, function ()
			slot0:notification()
		end)
	end)
end

slot0.getSkillClassNum = function (slot0)
	return slot0.skillClassNum
end

slot0.MAX_SKILL_CLASS_NUM = 3

slot0.inCreaseKillClassNum = function (slot0)
	slot0.skillClassNum = math.min(slot0.skillClassNum + 1, slot0.MAX_SKILL_CLASS_NUM)

	slot0:sendNotification(slot0.SKILL_CLASS_POS_UPDATED, slot0.skillClassNum)
end

slot0.notification = function (slot0)
	if getProxy(PlayerProxy) and not slot1:getFlag("blockResourceUpgrade") and slot1:getData() and slot0:isResourceFieldUpgradeConditionSatisfy() then
		slot0.facade:sendNotification(slot0.BUILDING_FINISH)

		return
	end

	if getProxy(ShopsProxy) and slot2:getShopStreet() and slot3:isUpdateGoods() then
		slot0.facade:sendNotification(slot0.BUILDING_FINISH)

		return
	end

	slot3 = pg.TimeMgr.GetInstance():GetServerTime()

	for slot7, slot8 in pairs(slot0.students) do
		if slot8:getFinishTime() <= slot3 then
			slot0.facade:sendNotification(slot0.BUILDING_FINISH)

			return
		end
	end

	if getProxy(CollectionProxy) and slot4:unclaimTrophyCount() > 0 then
		slot0.facade:sendNotification(slot0.BUILDING_FINISH)

		return
	end
end

slot0.onRemove = function (slot0)
	if slot0._mainUITimer then
		pg.TimeMgr.GetInstance():RemoveTimer(slot0._mainUITimer)
	end

	slot0.super.onRemove(slot0)
end

slot0.getStudentById = function (slot0, slot1)
	return slot0.students[slot1]:clone()
end

slot0.getStudentIdByShipId = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0.students) do
		if slot6.shipId == slot1 then
			return slot6.id
		end
	end
end

slot0.getStudentByShipId = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0.students) do
		if slot6.shipId == slot1 then
			return slot6
		end
	end
end

slot0.setStudents = function (slot0, slot1)
	slot0.students = slot1
end

slot0.getStudents = function (slot0)
	return Clone(slot0.students)
end

slot0.addStudent = function (slot0, slot1)
	slot0.students[slot1.id] = slot1

	slot0:sendNotification(slot0.START_LEARN_TACTICS, Clone(slot1))
end

slot0.updateStudent = function (slot0, slot1)
	slot0.students[slot1.id] = slot1
end

slot0.deleteStudent = function (slot0, slot1)
	slot0.students[slot1] = nil

	slot0:sendNotification(slot0.CANCEL_LEARN_TACTICS, slot1)
end

slot0.GetOilVO = function (slot0)
	return slot0._oilVO
end

slot0.GetGoldVO = function (slot0)
	return slot0._goldVO
end

slot0.GetClassVO = function (slot0)
	return slot0._classVO
end

slot0.getCourse = function (slot0)
	return Clone(slot0.course)
end

slot0.setCourse = function (slot0, slot1)
	slot0.course = slot1
end

slot0.GetShipIDs = function (slot0)
	slot1 = {}

	if slot0.course:inClass() then
		slot1 = Clone(slot0.course.students)
	end

	return slot1
end

slot0.StartUpGradeSuccess = function (slot0, slot1)
	slot1:SetUpgradeTimeStamp(pg.TimeMgr.GetInstance():GetServerTime() + slot1:bindConfigTable()[slot1:GetLevel()].time)
	slot0.facade:sendNotification(slot0.RESOURCE_UPGRADE, {
		resVO = slot1
	})
end

slot0.UpgradeFinish = function (slot0)
	if slot0._goldVO:GetDuration() and slot0._goldVO:GetDuration() <= 0 then
		slot0._goldVO:SetLevel(slot0._goldVO:GetLevel() + 1)
		slot0._goldVO:SetUpgradeTimeStamp(0)
		pg.TipsMgr.GetInstance():ShowTips(i18n("main_navalAcademyScene_upgrade_complete", pg.navalacademy_data_template[3].name, slot0._goldVO:bindConfigTable()[slot0._goldVO:GetLevel()].store - slot0._goldVO:bindConfigTable()[slot0._goldVO:GetLevel()].store))
	end

	if slot0._oilVO:GetDuration() and slot0._oilVO:GetDuration() <= 0 then
		slot0._oilVO:SetLevel(slot0._oilVO:GetLevel() + 1)
		slot0._oilVO:SetUpgradeTimeStamp(0)
		pg.TipsMgr.GetInstance():ShowTips(i18n("main_navalAcademyScene_upgrade_complete", pg.navalacademy_data_template[4].name, slot0._oilVO:bindConfigTable()[slot0._oilVO:GetLevel()].store - slot0._oilVO:bindConfigTable()[slot0._oilVO:GetLevel()].store))
	end

	if slot0._classVO:GetDuration() and slot0._classVO:GetDuration() <= 0 then
		slot0._classVO:SetLevel(slot0._classVO:GetLevel() + 1)
		slot0._classVO:SetUpgradeTimeStamp(0)
		pg.TipsMgr.GetInstance():ShowTips(i18n("main_navalAcademyScene_class_upgrade_complete", pg.navalacademy_data_template[1].name, slot0._classVO:bindConfigTable()[slot0._classVO:GetLevel()].store - slot0._classVO:bindConfigTable()[slot0._classVO:GetLevel()].store, slot0._classVO:bindConfigTable()[slot0._classVO:GetLevel()].proficency_get_percent - slot0._classVO:bindConfigTable()[slot0._classVO:GetLevel()].proficency_get_percent, (slot0._classVO:bindConfigTable()[slot0._classVO:GetLevel()].proficency_cost_per_min - slot0._classVO:bindConfigTable()[slot0._classVO:GetLevel()].proficency_cost_per_min) * 60))
	end
end

slot0.isResourceFieldUpgradeConditionSatisfy = function (slot0)
	if slot0:GetOilVO():CanUpgrade(getProxy(PlayerProxy).getData(slot1).level, getProxy(PlayerProxy).getData(slot1).gold) or slot0:GetGoldVO():CanUpgrade(slot2.level, slot2.gold) or slot0:GetClassVO():CanUpgrade(slot2.level, slot2.gold) then
		return true
	end

	return false
end

slot0.fillStudens = function (slot0, slot1)
	slot2 = pg.gameset.academy_random_ship_count.key_value
	slot3 = {}

	for slot7, slot8 in pairs(slot1) do
		slot3[slot8.groupId] = true
		slot2 = slot2 - 1
	end

	slot4 = pg.gameset.academy_random_ship_coldtime.key_value

	if not slot0._timeStamp or slot4 < os.time() - slot0._timeStamp then
		slot0._studentsFiller = nil
	end

	if not slot0._studentsFiller then
		slot2 = math.random(1, slot2)
		slot0._timeStamp = os.time()
		slot0._studentsFiller = {}
		slot7 = getProxy(BayProxy)
		slot9 = getProxy(ShipSkinProxy).getSkinList(slot8)
		slot10 = {}

		for slot14, slot15 in pairs(slot6) do
			if not table.contains(slot3, slot14) then
				slot10[#slot10 + 1] = slot14
			end
		end

		slot11 = #slot10

		while slot2 > 0 and slot11 > 0 do
			slot14 = slot6[slot10[math.random(#slot10)]]
			slot16 = 10000000000.0 + slot10[math.random(#slot10)] * 10 + 1
			slot18 = {}
			slot19 = nil
			slot20 = {}

			for slot24, slot25 in ipairs(slot17) do
				if slot25.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(slot9, slot25.id) or (slot26 == ShipSkin.SKIN_TYPE_REMAKE and slot14.trans) or (slot26 == ShipSkin.SKIN_TYPE_PROPOSE and slot14.married == 1) then
					slot20[#slot20 + 1] = slot25.id
				end

				slot19 = slot20[math.random(#slot20)]
			end

			table.remove(slot10, slot12)

			slot11 = slot11 - 1
			slot2 = slot2 - 1
			slot0._studentsFiller[#slot0._studentsFiller + 1] = {
				id = slot16,
				groupId = slot13,
				configId = slot15,
				skin_id = slot19
			}
		end
	end

	for slot8, slot9 in ipairs(slot0._studentsFiller) do
		slot1[#slot1 + 1] = Ship.New(slot9)
	end

	return slot1
end

return slot0
