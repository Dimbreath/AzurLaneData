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

function slot0.register(slot0)
	slot0.students = {}
	slot0.course = AcademyCourse.New()

	slot0:on(22001, function (slot0)
		slot1 = ResourceField.New(ResourceField.TYPE_OIL)

		print("olilv:" .. slot0.oil_well_level .. "|" .. slot0.oil_well_lv_up_time)
		slot1.SetLevel(slot1, slot0.oil_well_level > 0 and slot0.oil_well_level or 1)
		slot1:SetUpgradeTimeStamp(slot0.oil_well_lv_up_time)

		uv0._oilVO = slot1
		slot2 = ResourceField.New(ResourceField.TYPE_GOLD)

		slot2:SetLevel(slot0.gold_well_level)
		slot2:SetUpgradeTimeStamp(slot0.gold_well_lv_up_time)

		uv0._goldVO = slot2
		slot3 = ResourceField.New(ResourceField.TYPE_CLASS)

		slot3:SetLevel(slot0.class_lv)
		slot3:SetUpgradeTimeStamp(slot0.class_lv_up_time)

		uv0._classVO = slot3

		uv0.course:update(slot0.class)

		slot4 = {}

		for slot8, slot9 in ipairs(slot0.skill_class_list) do
			slot10 = Student.New(slot9)
			slot4[slot10.id] = slot10
		end

		uv0.skillClassNum = LOCK_CLASSROOM and 2 or slot0.skill_class_num or 2

		uv0:setStudents(slot4)

		uv0._mainUITimer = pg.TimeMgr.GetInstance():AddTimer("NavalAcademyProxy", 0, 10, function ()
			uv0:notification()
		end)
	end)
end

function slot0.getSkillClassNum(slot0)
	return slot0.skillClassNum
end

slot0.MAX_SKILL_CLASS_NUM = 3

function slot0.inCreaseKillClassNum(slot0)
	slot0.skillClassNum = math.min(slot0.skillClassNum + 1, uv0.MAX_SKILL_CLASS_NUM)

	slot0:sendNotification(uv0.SKILL_CLASS_POS_UPDATED, slot0.skillClassNum)
end

function slot0.notification(slot0)
	if getProxy(PlayerProxy) and not slot1:getFlag("blockResourceUpgrade") and slot1:getData() and slot0:isResourceFieldUpgradeConditionSatisfy() then
		slot0.facade:sendNotification(uv0.BUILDING_FINISH)

		return
	end

	if getProxy(ShopsProxy) and slot2:getShopStreet() and slot3:isUpdateGoods() then
		slot0.facade:sendNotification(uv0.BUILDING_FINISH)

		return
	end

	for slot7, slot8 in pairs(slot0.students) do
		if slot8:getFinishTime() <= pg.TimeMgr.GetInstance():GetServerTime() then
			slot0.facade:sendNotification(uv0.BUILDING_FINISH)

			return
		end
	end

	if getProxy(CollectionProxy) and slot4:unclaimTrophyCount() > 0 then
		slot0.facade:sendNotification(uv0.BUILDING_FINISH)

		return
	end
end

function slot0.onRemove(slot0)
	if slot0._mainUITimer then
		pg.TimeMgr.GetInstance():RemoveTimer(slot0._mainUITimer)
	end

	uv0.super.onRemove(slot0)
end

function slot0.getStudentById(slot0, slot1)
	return slot0.students[slot1]:clone()
end

function slot0.getStudentIdByShipId(slot0, slot1)
	for slot5, slot6 in pairs(slot0.students) do
		if slot6.shipId == slot1 then
			return slot6.id
		end
	end
end

function slot0.getStudentByShipId(slot0, slot1)
	for slot5, slot6 in pairs(slot0.students) do
		if slot6.shipId == slot1 then
			return slot6
		end
	end
end

function slot0.setStudents(slot0, slot1)
	slot0.students = slot1
end

function slot0.getStudents(slot0)
	return Clone(slot0.students)
end

function slot0.addStudent(slot0, slot1)
	slot0.students[slot1.id] = slot1

	slot0:sendNotification(uv0.START_LEARN_TACTICS, Clone(slot1))
end

function slot0.updateStudent(slot0, slot1)
	slot0.students[slot1.id] = slot1
end

function slot0.deleteStudent(slot0, slot1)
	slot0.students[slot1] = nil

	slot0:sendNotification(uv0.CANCEL_LEARN_TACTICS, slot1)
end

function slot0.GetOilVO(slot0)
	return slot0._oilVO
end

function slot0.GetGoldVO(slot0)
	return slot0._goldVO
end

function slot0.GetClassVO(slot0)
	return slot0._classVO
end

function slot0.getCourse(slot0)
	return Clone(slot0.course)
end

function slot0.setCourse(slot0, slot1)
	slot0.course = slot1
end

function slot0.GetShipIDs(slot0)
	slot1 = {}

	if slot0.course:inClass() then
		slot1 = Clone(slot0.course.students)
	end

	return slot1
end

function slot0.StartUpGradeSuccess(slot0, slot1)
	slot1:SetUpgradeTimeStamp(pg.TimeMgr.GetInstance():GetServerTime() + slot1:bindConfigTable()[slot1:GetLevel()].time)

	slot6.resVO = slot1

	slot0.facade:sendNotification(uv0.RESOURCE_UPGRADE, {})
end

function slot0.UpgradeFinish(slot0)
	if slot0._goldVO:GetDuration() then
		if slot0._goldVO:GetDuration() <= 0 then
			slot2 = slot0._goldVO

			slot0._goldVO:SetLevel(slot0._goldVO:GetLevel() + 1)
			slot0._goldVO:SetUpgradeTimeStamp(0)

			slot2 = slot0._goldVO
			slot3 = slot0._goldVO
			slot3 = pg.TipsMgr.GetInstance()

			slot3:ShowTips(i18n("main_navalAcademyScene_upgrade_complete", pg.navalacademy_data_template[3].name, slot2:bindConfigTable()[slot3:GetLevel()].store - slot0._goldVO:bindConfigTable()[slot2:GetLevel()].store))
		end
	end

	if slot0._oilVO:GetDuration() then
		if slot0._oilVO:GetDuration() <= 0 then
			slot2 = slot0._oilVO

			slot0._oilVO:SetLevel(slot0._oilVO:GetLevel() + 1)
			slot0._oilVO:SetUpgradeTimeStamp(0)

			slot2 = slot0._oilVO
			slot3 = slot0._oilVO
			slot3 = pg.TipsMgr.GetInstance()

			slot3:ShowTips(i18n("main_navalAcademyScene_upgrade_complete", pg.navalacademy_data_template[4].name, slot2:bindConfigTable()[slot3:GetLevel()].store - slot0._oilVO:bindConfigTable()[slot2:GetLevel()].store))
		end
	end

	if slot0._classVO:GetDuration() then
		if slot0._classVO:GetDuration() <= 0 then
			slot2 = slot0._classVO
			slot2 = slot0._classVO
			slot3 = slot0._classVO
			slot3 = slot0._classVO
			slot4 = slot0._classVO

			slot0._classVO:SetLevel(slot0._classVO:GetLevel() + 1)
			slot0._classVO:SetUpgradeTimeStamp(0)

			slot4 = slot0._classVO
			slot5 = slot0._classVO
			slot5 = slot0._classVO
			slot6 = slot0._classVO
			slot6 = slot0._classVO
			slot7 = slot0._classVO
			slot7 = pg.TipsMgr.GetInstance()

			slot7:ShowTips(i18n("main_navalAcademyScene_class_upgrade_complete", pg.navalacademy_data_template[1].name, slot4:bindConfigTable()[slot5:GetLevel()].store - slot0._classVO:bindConfigTable()[slot2:GetLevel()].store, slot5:bindConfigTable()[slot6:GetLevel()].proficency_get_percent - slot2:bindConfigTable()[slot3:GetLevel()].proficency_get_percent, (slot6:bindConfigTable()[slot7:GetLevel()].proficency_cost_per_min - slot3:bindConfigTable()[slot4:GetLevel()].proficency_cost_per_min) * 60))
		end
	end
end

function slot0.isResourceFieldUpgradeConditionSatisfy(slot0)
	slot2 = getProxy(PlayerProxy):getData()

	if not slot0:GetOilVO():CanUpgrade(slot2.level, slot2.gold) then
		if slot0:GetGoldVO():CanUpgrade(slot2.level, slot2.gold) then
			return true
		end
	end

	return false
end

function slot0.fillStudens(slot0, slot1)
	slot3 = {}

	for slot7, slot8 in pairs(slot1) do
		slot3[slot8.groupId] = true
		slot2 = pg.gameset.academy_random_ship_count.key_value - 1
	end

	if not slot0._timeStamp or pg.gameset.academy_random_ship_coldtime.key_value < os.time() - slot0._timeStamp then
		slot0._studentsFiller = nil
	end

	if not slot0._studentsFiller then
		slot2 = math.random(1, slot2)
		slot0._timeStamp = os.time()
		slot0._studentsFiller = {}
		slot7 = getProxy(BayProxy)
		slot9 = getProxy(ShipSkinProxy):getSkinList()
		slot10 = {}

		for slot14, slot15 in pairs(getProxy(CollectionProxy):getGroups()) do
			if not table.contains(slot3, slot14) then
				slot10[#slot10 + 1] = slot14
			end
		end

		slot11 = #slot10

		if slot2 > 0 then
			while slot2 > 0 and slot11 > 0 do
				slot13 = slot10[math.random(#slot10)]
				slot14 = slot6[slot13]
				slot16 = 10000000000.0 + slot13 * 10 + 1
				slot18 = {}
				slot19 = nil
				slot20 = {}

				for slot24, slot25 in ipairs(ShipGroup.getSkinList(slot13)) do
					if slot25.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(slot9, slot25.id) or slot26 == ShipSkin.SKIN_TYPE_REMAKE and slot14.trans or slot26 == ShipSkin.SKIN_TYPE_PROPOSE and slot14.married == 1 then
						slot20[#slot20 + 1] = slot25.id
					end

					slot19 = slot20[math.random(#slot20)]
				end

				slot21.id = slot16
				slot21.groupId = slot13
				slot21.configId = slot15
				slot21.skin_id = slot19

				table.remove(slot10, slot12)

				slot11 = slot11 - 1
				slot2 = slot2 - 1
				slot0._studentsFiller[#slot0._studentsFiller + 1] = {}
			end
		end
	end

	for slot8, slot9 in ipairs(slot0._studentsFiller) do
		slot1[#slot1 + 1] = Ship.New(slot9)
	end

	return slot1
end

return slot0
