pg = pg or {}
pg.TimeMgr = singletonClass("TimeMgr")
pg.TimeMgr._Timer = nil
pg.TimeMgr._BattleTimer = nil
pg.TimeMgr._sAnchorTime = 0
pg.TimeMgr._AnchorDelta = 0
pg.TimeMgr._serverUnitydelta = 0
pg.TimeMgr._isdstClient = false
slot2 = 3600
slot3 = 86400
slot4 = 604800

function pg.TimeMgr.Ctor(slot0)
	slot0._battleTimerList = {}
end

function pg.TimeMgr.Init(slot0)
	print("initializing time manager...")

	slot0._Timer = TimeUtil.NewUnityTimer()

	UpdateBeat:Add(slot0.Update, slot0)
end

function pg.TimeMgr.Update(slot0)
	if slot0._stopCombatTime > 0 then
		slot0._cobTime = slot0._stopCombatTime - slot0._waitTime
	else
		slot0._cobTime = Time.time - slot0._waitTime
	end

	slot0._Timer:Schedule()
end

function pg.TimeMgr.AddTimer(slot0, slot1, slot2, slot3, slot4)
	return slot0._Timer:SetTimer(slot1, slot2 * 1000, slot3 * 1000, slot4)
end

function pg.TimeMgr.RemoveTimer(slot0, slot1)
	if slot1 == nil or slot1 == 0 then
		return
	end

	slot0._Timer:DeleteTimer(slot1)
end

pg.TimeMgr._waitTime = 0
pg.TimeMgr._stopCombatTime = 0
pg.TimeMgr._cobTime = 0

function pg.TimeMgr.GetCombatTime(slot0)
	return slot0._cobTime
end

function pg.TimeMgr.ResetCombatTime(slot0)
	slot0._waitTime = 0
	slot0._cobTime = Time.time
end

function pg.TimeMgr.GetCombatDeltaTime()
	return Time.fixedDeltaTime
end

function pg.TimeMgr.PauseBattleTimer(slot0)
	slot0._stopCombatTime = Time.time

	for slot4, slot5 in pairs(slot0._battleTimerList) do
		slot4:Pause()
	end
end

function pg.TimeMgr.ResumeBattleTimer(slot0)
	slot0._waitTime = (slot0._waitTime + Time.time) - slot0._stopCombatTime
	slot0._stopCombatTime = 0

	for slot4, slot5 in pairs(slot0._battleTimerList) do
		slot4:Resume()
	end
end

function pg.TimeMgr.AddBattleTimer(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0._battleTimerList[Timer.New(slot4, slot3, slot2 or -1, slot5 or false)] = true

	if not (slot6 or false) then
		slot7:Start()
	end

	if slot0._stopCombatTime ~= 0 then
		slot7:Pause()
	end

	return slot7
end

function pg.TimeMgr.ScaleBattleTimer(slot0, slot1)
	Time.timeScale = slot1
end

function pg.TimeMgr.RemoveBattleTimer(slot0, slot1)
	if slot1 then
		slot0._battleTimerList[slot1] = nil

		slot1:Stop()
	end
end

function pg.TimeMgr.RemoveAllBattleTimer(slot0)
	for slot4, slot5 in pairs(slot0._battleTimerList) do
		slot4:Stop()
	end

	slot0._battleTimerList = {}
end

function pg.TimeMgr.RealtimeSinceStartup(slot0)
	return math.ceil(Time.realtimeSinceStartup)
end

function pg.TimeMgr.SetServerTime(slot0, slot1, slot2)
	if PLATFORM_CODE == PLATFORM_US then
		SERVER_SERVER_DAYLIGHT_SAVEING_TIME = true
	end

	slot0._isdstClient = os.date("*t").isdst
	slot0._serverUnitydelta = slot1 - slot0:RealtimeSinceStartup()
	slot0._sAnchorTime = slot2 - ((SERVER_DAYLIGHT_SAVEING_TIME and 3600) or 0)
	slot0._AnchorDelta = slot2 - os.time({
		hour = 0,
		month = 1,
		year = 1970,
		min = 0,
		sec = 0,
		isdst = false,
		day = 5
	})
end

function pg.TimeMgr.GetServerTime(slot0)
	return slot0:RealtimeSinceStartup() + slot0._serverUnitydelta
end

function pg.TimeMgr.GetServerWeek(slot0)
	return slot0:GetServerTimestampWeek(slot0:GetServerTime())
end

function pg.TimeMgr.GetServerTimestampWeek(slot0, slot1)
	return math.ceil(((slot1 - slot0._sAnchorTime) % slot0 + 1) / slot1)
end

function pg.TimeMgr.GetServerHour(slot0)
	return math.floor((slot0:GetServerTime() - slot0._sAnchorTime) % slot0 / slot0.GetServerTime())
end

function pg.TimeMgr.Table2ServerTime(slot0, slot1)
	if slot0._isdstClient ~= SERVER_DAYLIGHT_SAVEING_TIME then
		if SERVER_DAYLIGHT_SAVEING_TIME then
			return (slot0._AnchorDelta + os.time(slot1)) - slot0
		else
			return slot0._AnchorDelta + os.time(slot1) + slot0
		end
	else
		return slot0._AnchorDelta + os.time(slot1)
	end
end

function pg.TimeMgr.CTimeDescC(slot0, slot1, slot2)
	return os.date(slot2 or "%Y%m%d%H%M%S", slot1)
end

function pg.TimeMgr.STimeDescC(slot0, slot1, slot2)
	return os.date(slot2 or "%Y/%m/%d %H:%M:%S", (slot1 - slot0._serverUnitydelta + os.time()) - slot0:RealtimeSinceStartup())
end

function pg.TimeMgr.STimeDescS(slot0, slot1, slot2)
	slot2 = slot2 or "%Y/%m/%d %H:%M:%S"
	slot3 = 0

	if slot0._isdstClient ~= SERVER_DAYLIGHT_SAVEING_TIME then
		return os.date(slot2, slot1 - slot0._AnchorDelta + ((SERVER_DAYLIGHT_SAVEING_TIME and 3600) or -3600))
	end
end

function pg.TimeMgr.CurrentSTimeDesc(slot0, slot1, slot2)
	if slot2 then
		return slot0:STimeDescS(slot0:GetServerTime(), slot1)
	else
		return slot0:STimeDescC(slot0:GetServerTime(), slot1)
	end
end

function pg.TimeMgr.ChieseDescTime(slot0, slot1, slot2)
	format = "%Y/%m/%d"
	slot3 = nil
	slot4 = split((not slot2 or os.date(format, slot1)) and os.date(format, (slot1 - slot0._ServerUnitydelta + os.time()) - slot0:RealtimeSinceStartup()), "/")

	return NumberToChinese(slot4[1], false) .. "年" .. NumberToChinese(slot4[2], true) .. "月" .. NumberToChinese(slot4[3], true) .. "日"
end

function pg.TimeMgr.GetNextTime(slot0, slot1, slot2, slot3, slot4)
	return math.floor((slot0:GetServerTime() - (slot0._sAnchorTime + slot1 * slot1 + slot2 * 60 + slot3)) / (slot4 or slot0) + 1) * (slot4 or slot0) + slot0._sAnchorTime + slot1 * slot1 + slot2 * 60 + slot3
end

function pg.TimeMgr.GetNextWeekTime(slot0, slot1, slot2, slot3, slot4)
	return slot0:GetNextTime((slot1 - 1) * 24 + slot2, slot3, slot4, slot0)
end

function pg.TimeMgr.ParseTime(slot0, slot1)
	return slot0:Table2ServerTime({
		year = tonumber(slot1) / 100 / 100 / 100 / 100 / 100,
		month = (tonumber(slot1) / 100 / 100 / 100 / 100) % 100,
		day = (tonumber(slot1) / 100 / 100 / 100) % 100,
		hour = (tonumber(slot1) / 100 / 100) % 100,
		min = (tonumber(slot1) / 100) % 100,
		sec = tonumber(slot1) % 100
	})
end

function pg.TimeMgr.ParseTimeEx(slot0, slot1, slot2)
	if slot2 == nil then
		slot2 = "(%d+)%-(%d+)%-(%d+)%s(%d+)%:(%d+)%:(%d+)"
	end

	slot11.year, slot11.month, slot11.day, slot11.hour, slot11.min, slot11.sec = slot1:match(slot2)

	return slot0:Table2ServerTime({
		year = slot3,
		month = slot4,
		day = slot5,
		hour = slot6,
		min = slot7,
		sec = slot8
	})
end

function pg.TimeMgr.parseTimeFromConfig(slot0, slot1)
	return slot0:Table2ServerTime({
		year = slot1[1][1],
		month = slot1[1][2],
		day = slot1[1][3],
		hour = slot1[2][1],
		min = slot1[2][2],
		sec = slot1[2][3]
	})
end

function pg.TimeMgr.DescCDTime(slot0, slot1)
	return string.format("%02d:%02d:%02d", math.floor(slot1 / 3600), math.floor((slot1 - math.floor(slot1 / 3600) * 3600) / 60), (slot1 - math.floor(slot1 / 3600) * 3600) % 60)
end

function pg.TimeMgr.parseTimeFrom(slot0, slot1)
	return math.floor(slot1 / slot0), math.fmod(math.floor(slot1 / 3600), 24), math.fmod(math.floor(slot1 / 60), 60), math.fmod(slot1, 60)
end

function pg.TimeMgr.DiffDay(slot0, slot1, slot2)
	return math.floor((slot2 - slot0._sAnchorTime) / slot0) - math.floor((slot1 - slot0._sAnchorTime) / slot0)
end

function pg.TimeMgr.IsSameDay(slot0, slot1, slot2)
	return math.floor((slot1 - slot0._sAnchorTime) / slot0) == math.floor((slot2 - slot0._sAnchorTime) / slot0)
end

function pg.TimeMgr.IsPassTimeByZero(slot0, slot1, slot2)
	return slot2 < math.fmod(slot1 - slot0._sAnchorTime, slot0)
end

function pg.TimeMgr.CalcMonthDays(slot0, slot1, slot2)
	slot3 = 30

	if slot2 == 2 then
		slot3 = (((slot1 % 4 == 0 and slot1 % 100 ~= 0) or slot1 % 400 == 0) and 29) or 28
	elseif _.include({
		1,
		3,
		5,
		7,
		8,
		10,
		12
	}, slot2) then
		slot3 = 31
	end

	return slot3
end

function pg.TimeMgr.inTime(slot0, slot1)
	if not slot1 then
		return true
	end

	if type(slot1) == "string" then
		return slot1 == "always"
	end

	if slot1[1] == nil then
		slot1 = {
			slot1[2],
			slot1[3]
		}
	end

	function slot2(slot0)
		return {
			year = slot0[1][1],
			month = slot0[1][2],
			day = slot0[1][3],
			hour = slot0[2][1],
			min = slot0[2][2],
			sec = slot0[2][3]
		}
	end

	slot3 = nil

	if #slot1 > 0 then
		slot3 = slot2(slot1[1] or {
			{
				2000,
				1,
				1
			},
			{
				0,
				0,
				0
			}
		})
	end

	slot4 = nil

	if #slot1 > 1 then
		slot4 = slot2(slot1[2] or {
			{
				2000,
				1,
				1
			},
			{
				0,
				0,
				0
			}
		})
	end

	slot5 = nil

	if slot3 and slot4 then
		slot8 = slot0:Table2ServerTime(slot4)

		if slot0:GetServerTime() < slot0:Table2ServerTime(slot3) then
			return false, slot3
		end

		if slot8 < slot6 then
			return false, nil
		end

		slot5 = slot4
	end

	return true, slot5
end

return
