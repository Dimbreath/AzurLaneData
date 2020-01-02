pg = pg or {}
pg.PushNotificationMgr = singletonClass("PushNotificationMgr")
pg.PushNotificationMgr.PUSH_TYPE_EVENT = 1
pg.PushNotificationMgr.PUSH_TYPE_GOLD = 2
pg.PushNotificationMgr.PUSH_TYPE_OIL = 3
pg.PushNotificationMgr.PUSH_TYPE_BACKYARD = 4
pg.PushNotificationMgr.PUSH_TYPE_SCHOOL = 5
pg.PushNotificationMgr.PUSH_TYPE_CLASS = 6
pg.PushNotificationMgr.PUSH_TYPE_TECHNOLOGY = 7
pg.PushNotificationMgr.PUSH_TYPE_BLUEPRINT = 8
pg.PushNotificationMgr.PUSH_TYPE_COMMANDER = 9
slot2 = {}
slot3 = false

function pg.PushNotificationMgr.Init(slot0)
	slot0 = {}

	for slot4, slot5 in ipairs(slot1.push_data_template) do
		slot0[slot5.id] = PlayerPrefs.GetInt("push_setting_" .. slot5.id) == 0
	end

	slot2 = PlayerPrefs.GetInt("setting_ship_name") == 1
end

function pg.PushNotificationMgr.Reset(slot0)
	slot0 = {}

	for slot4, slot5 in ipairs(slot1.push_data_template) do
		PlayerPrefs.SetInt("push_setting_" .. slot5.id, 0)

		slot0[slot5.id] = true
	end

	PlayerPrefs.SetInt("setting_ship_name", 0)

	slot2 = false
end

function pg.PushNotificationMgr.setSwitch(slot0, slot1, slot2)
	if not slot0.push_data_template[slot1] then
		return
	end

	slot1[slot1] = slot2

	PlayerPrefs.SetInt("push_setting_" .. slot1, (slot2 and 0) or 1)
end

function pg.PushNotificationMgr.setSwitchShipName(slot0, slot1)
	slot0 = slot1

	PlayerPrefs.SetInt("setting_ship_name", (slot1 and 1) or 0)
end

function pg.PushNotificationMgr.isEnabled(slot0, slot1)
	return slot0[slot1]
end

function pg.PushNotificationMgr.isEnableShipName(slot0)
	return slot0
end

function pg.PushNotificationMgr.Push(slot0, slot1, slot2, slot3)
	NotificationMgr.Inst:ScheduleLocalNotification(slot1, slot2, slot5)
	slot0:log(slot1, slot2, os.time() + slot3 - slot0.TimeMgr.GetInstance():GetServerTime())
end

function pg.PushNotificationMgr.cancelAll(slot0)
	NotificationMgr.Inst:CancelAllLocalNotifications()
end

function pg.PushNotificationMgr.PushAll(slot0)
	if getProxy(PlayerProxy) and slot1:getInited() then
		slot0:cancelAll()

		if slot0[slot1.PUSH_TYPE_EVENT] then
			slot0:PushEvent()
		end

		if slot0[slot1.PUSH_TYPE_GOLD] then
			slot0:PushGold()
		end

		if slot0[slot1.PUSH_TYPE_OIL] then
			slot0:PushOil()
		end

		if slot0[slot1.PUSH_TYPE_BACKYARD] then
			slot0:PushBackyard()
		end

		if slot0[slot1.PUSH_TYPE_SCHOOL] then
			slot0:PushSchool()
		end

		if slot0[slot1.PUSH_TYPE_CLASS] then
			slot0:PushClass()
		end

		if slot0[slot1.PUSH_TYPE_TECHNOLOGY] then
			slot0:PushTechnlogy()
		end

		if slot0[slot1.PUSH_TYPE_BLUEPRINT] then
			slot0:PushBluePrint()
		end

		if slot0[slot1.PUSH_TYPE_COMMANDER] then
			slot0:PushCommander()
		end
	end
end

function pg.PushNotificationMgr.PushEvent(slot0)
	slot2 = slot0.push_data_template[slot0.PUSH_TYPE_EVENT]

	for slot6, slot7 in ipairs(slot1) do
		slot0:Push(slot2.title, string.gsub(slot2.content, "$1", slot7.template.title), slot7.finishTime)
	end
end

function pg.PushNotificationMgr.PushGold(slot0)
	slot1 = getProxy(NavalAcademyProxy):GetGoldVO()
	slot2 = slot1:bindConfigTable()
	slot3 = slot1:GetLevel()
	slot5 = slot2[slot3].production
	slot6 = slot2[slot3].hour_time
	slot8 = getProxy(PlayerProxy).data.resUpdateTm

	if getProxy(PlayerProxy).data.goldField < slot2[slot3].store and slot0.TimeMgr.GetInstance():GetServerTime() < slot8 + ((slot4 - slot9) / slot5 * 60 * 60) / 3 then
		slot0:Push(slot0.push_data_template[slot0.PUSH_TYPE_GOLD].title, slot0.push_data_template[slot0.PUSH_TYPE_GOLD].content, slot10)
	end
end

function pg.PushNotificationMgr.PushOil(slot0)
	slot1 = getProxy(NavalAcademyProxy):GetOilVO()
	slot2 = slot1:bindConfigTable()
	slot3 = slot1:GetLevel()
	slot5 = slot2[slot3].production
	slot6 = slot2[slot3].hour_time
	slot8 = getProxy(PlayerProxy).data.resUpdateTm

	if getProxy(PlayerProxy).data.oilField < slot2[slot3].store and slot0.TimeMgr.GetInstance():GetServerTime() < slot8 + ((slot4 - slot9) / slot5 * 60 * 60) / 3 then
		slot0:Push(slot0.push_data_template[slot0.PUSH_TYPE_OIL].title, slot0.push_data_template[slot0.PUSH_TYPE_OIL].content, slot10)
	end
end

function pg.PushNotificationMgr.PushBackyard(slot0)
	if slot0.TimeMgr.GetInstance():GetServerTime() < getProxy(DormProxy):getData().getFoodLeftTime(slot1) then
		slot0:Push(slot0.push_data_template[slot0.PUSH_TYPE_BACKYARD].title, slot0.push_data_template[slot0.PUSH_TYPE_BACKYARD].content, slot2)
	end
end

function pg.PushNotificationMgr.PushSchool(slot0)
	slot2 = slot0.push_data_template[slot0.PUSH_TYPE_SCHOOL]
	slot4 = getProxy(BayProxy).getData(slot3)

	for slot8, slot9 in ipairs(slot1) do
		if slot0.TimeMgr.GetInstance():GetServerTime() < slot9.finishTime then
			slot12 = slot4[slot9.shipId].skills[slot9:getSkillId(slot10)]

			slot0:Push(slot2.title, string.gsub(string.gsub(slot2.content, "$1", slot13), "$2", slot14), slot9.finishTime)
		end
	end
end

function pg.PushNotificationMgr.PushClass(slot0)
	slot1 = slot0.push_data_template[slot0.PUSH_TYPE_CLASS]

	if getProxy(NavalAcademyProxy):getCourse():inClass() and slot0.TimeMgr.GetInstance():GetServerTime() < slot2.timestamp + AcademyCourse.MaxStudyTime then
		slot0:Push(slot1.title, slot1.content, slot3)
	end
end

function pg.PushNotificationMgr.PushTechnlogy(slot0)
	slot2 = getProxy(TechnologyProxy)

	if slot0.push_data_template[slot1.PUSH_TYPE_TECHNOLOGY] and slot2 then
		for slot7, slot8 in ipairs(slot3) do
			if slot8:isStarting() then
				slot0:Push(slot1.title, string.gsub(slot1.content, "$1", slot8:getConfig("name")), slot8.time)

				break
			end
		end
	end
end

function pg.PushNotificationMgr.PushBluePrint(slot0)
	slot2 = getProxy(TechnologyProxy)
	slot3 = getProxy(TaskProxy)

	if slot0.push_data_template[slot1.PUSH_TYPE_BLUEPRINT] and slot2 and slot3 and slot2:getBuildingBluePrint() then
		for slot9, slot10 in ipairs(slot5) do
			if slot0.TimeMgr.GetInstance():GetServerTime() < slot4:getTaskOpenTimeStamp(slot10) then
				slot13 = slot3:isFinishPrevTasks(slot10)

				if not (slot3:getTaskById(slot10) or slot3:getFinishTaskById(slot10)) and slot13 then
					slot0:Push(slot1.title, string.gsub(slot1.content, "$1", slot4:getShipVO().getConfig(slot14, "name")), slot11)
				end
			end
		end
	end
end

function pg.PushNotificationMgr.PushCommander(slot0)
	slot2 = getProxy(CommanderProxy)

	if slot0.push_data_template[slot1.PUSH_TYPE_COMMANDER] and slot2 then
		for slot7, slot8 in pairs(slot3) do
			if slot8:getState() == CommanderBox.STATE_STARTING then
				slot0:Push(slot1.title, slot1.content, slot8.finishTime)

				break
			end
		end
	end
end

function pg.PushNotificationMgr.log(slot0, slot1, slot2, slot3)
	print(slot1, " - ", slot2, " - ", slot3 - os.time(), "s后推送")
end

return
