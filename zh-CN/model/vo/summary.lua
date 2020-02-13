slot0 = class("Summary", import(".BaseVO"))

function slot0.Ctor(slot0, slot1)
	slot0.name = getProxy(PlayerProxy):getData().name
	slot0.registerTime = pg.TimeMgr.GetInstance().STimeDescC(slot2, slot1.register_date, "%Y/%m/%d")
	slot0.days = math.ceil((getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_SUMMARY).getStartTime(slot3) - slot1.register_date) / 86400) + 1
	slot0.serverName = (getProxy(ServerProxy):getRawData()[(getProxy(UserProxy):getRawData() and slot5.server) or 0] and getProxy(ServerProxy).getRawData().name) or ""
	slot0.chapterName = pg.chapter_template[math.max(slot1.chapter_id, 101)].chapter_name .. " " .. pg.chapter_template[math.max(slot1.chapter_id, 101)].name
	slot0.guildName = slot1.guild_name
	slot0.proposeCount = slot1.marry_number
	slot0.medalCount = slot1.medal_number
	slot0.furnitureCount = slot1.furniture_number
	slot0.furnitureWorth = slot1.furniture_worth
	slot0.flagShipId = slot1.character_id
	slot0.firstLadyId = slot1.first_lady_id
	slot0.isProPose = slot0.proposeCount > 0
	slot0.firstProposeName = ""

	if slot0.firstLadyId > 0 then
		slot0.firstProposeName = Ship.New({
			configId = slot0.firstLadyId
		}):getConfig("name")
	end

	if slot1.first_lady_name ~= "" then
		slot0.firstProposeName = slot1.first_lady_name
	end

	slot0.proposeTime = math.ceil((slot4 - slot1.first_lady_time) / 86400) + 1
	slot0.firstLadyTime = slot2:STimeDescC(slot1.first_lady_time, "%Y-%m-%d %H:%M")
	slot0.unMarryShipId = 100001
	slot0.medalList = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_SUMMARY):getConfig("config_data") or {}
	slot0.furnitures = getProxy(DormProxy):getFurnitrues()
end

function slot0.hasGuild(slot0)
	return slot0.guildName and slot0.guildName ~= ""
end

function slot0.hasMedal(slot0)
	return slot0.medalCount > 0
end

return slot0
