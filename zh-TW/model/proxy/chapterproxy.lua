slot0 = class("ChapterProxy", import(".NetProxy"))
slot0.CHAPTER_UPDATED = "ChapterProxy:CHAPTER_UPDATED"
slot0.CHAPTER_ADDED = "ChapterProxy:CHAPTER_ADDED"
slot0.CHAPTER_REMOVED = "ChapterProxy:CHAPTER_REMOVED"
slot0.CHAPTER_TIMESUP = "ChapterProxy:CHAPTER_TIMESUP"
slot0.CHAPTER_CELL_UPDATED = "ChapterProxy:CHAPTER_CELL_UPDATED"
slot0.CHAPTER_EXTAR_FLAG_UPDATED = "ChapterProxy:CHAPTER_EXTAR_FLAG_UPDATED"
slot0.SHAM_CHAPTER_UPDATED = "ChapterProxy:SHAM_CHAPTER_UPDATED"
slot0.SHAM_SHOP_UPDATED = "ChapterProxy:SHAM_SHOP_UPDATED"
slot0.GUILD_CHAPTER_UPDATED = "ChapterProxy:GUILD_CHAPTER_UPDATED"
slot0.LAST_MAP_FOR_ACTIVITY = "last_map_for_activity"
slot0.LAST_MAP = "last_map"

function slot0.register(slot0)
	slot0:on(13001, function (slot0)
		slot1 = {}
		slot2 = pairs
		slot3 = slot0.data or {}

		for slot5, slot6 in slot2(slot3) do
			if slot6:getPlayType() == ChapterConst.TypeMainSub then
				slot1[slot5] = slot6
			end
		end

		slot0.mapEliteFleetCache = {}
		slot0.mapEliteCommanderCache = {}
		slot2 = {}

		for slot6, slot7 in ipairs(slot0.fleet_list) do
			slot2[slot7.map_id] = slot2[slot7.map_id] or {}

			table.insert(slot2[slot7.map_id], slot7)
		end

		for slot6, slot7 in pairs(slot2) do
			slot0.mapEliteFleetCache[slot6], slot0.mapEliteCommanderCache[slot6] = Chapter.BuildEliteFleetList(slot7)
		end

		slot0.data = {}

		for slot6, slot7 in ipairs(slot0.chapter_list) do
			if not pg.chapter_template[slot7.id] then
				errorMsg("chapter_template not exist: " .. slot7.id)
			else
				slot8 = Chapter.New(slot7)

				slot8:setEliteFleetList(slot0.mapEliteFleetCache[slot8:getConfig("map")] or {
					{},
					{},
					{}
				})
				slot8:setEliteCommanders(slot0.mapEliteCommanderCache[slot9] or {
					{},
					{},
					{}
				})

				if slot0.data[slot8.id] then
					slot0:updateChapter(slot8)
				else
					slot0:addChapter(slot8)
				end
			end
		end

		for slot6, slot7 in pairs(slot1) do
			if slot0.data[slot6] then
				slot8.expireTime = slot7.expireTime
				slot8.awardIndex = slot7.awardIndex
			else
				slot0.data[slot6] = slot7
			end
		end

		if slot0.current_chapter and slot0.current_chapter.id > 0 then
			slot0.data[slot3] or Chapter.New({
				id = slot3
			}):update(slot0.current_chapter)

			if slot0.data[slot3] then
				slot0:updateChapter(slot4)
			else
				slot0:addChapter(slot4)
			end
		end

		slot0.repairTimes = slot0.daily_repair_count

		if slot0.react_chapter then
			slot0.remasterId = slot0.react_chapter.active_id
			slot0.remasterTime = slot0.react_chapter.active_timestamp
			slot0.remasterTickets = slot0.react_chapter.count
			slot0.remasterDailyCount = slot0.react_chapter.daily_count
			slot0.remasterTip = slot0.remasterDailyCount <= 1
		end

		Map.lastMap = slot0:getLastMap(slot1.LAST_MAP)
		Map.lastMapForActivity = slot0:getLastMap(slot1.LAST_MAP_FOR_ACTIVITY)
	end)
	slot0:on(13105, function (slot0)
		if slot0:getActiveChapter() then
			slot2 = 0

			if _.any(slot0.ai_list, function (slot0)
				return slot0.item_type == ChapterConst.AttachOni
			end) then
				slot1:onOniEnter()
			end

			if _.any(slot0.map_update, function (slot0)
				return slot0.item_type == ChapterConst.AttachBomb_Enemy
			end) then
				slot1:onBombEnemyEnter()
			end

			if #slot0.map_update > 0 then
				_.each(slot0.map_update, function (slot0)
					if slot0.item_type == ChapterConst.AttachStory and slot0.item_data == ChapterConst.StoryTrigger then
						slot1 = ChapterCell.New(slot0)

						if _.detect(slot0.cellAttachments, function (slot0)
							return slot0.row == slot0.row and slot0.column == slot0.column
						end) then
							if slot2.flag == 3 and slot1.flag == 4 and pg.map_event_template[slot2.attachmentId].gametip ~= "" then
								pg.TipsMgr.GetInstance():ShowTips(i18n(slot3))
							end

							slot2.attachment = slot1.attachment
							slot2.attachmentId = slot1.attachmentId
							slot2.flag = slot1.flag
							slot2.data = slot1.data
						else
							table.insert(slot0.cellAttachments, slot1)
						end

						return
					end

					if slot0.item_type ~= ChapterConst.AttachNone and slot0.item_type ~= ChapterConst.AttachBorn and slot0.item_type ~= ChapterConst.AttachBorn_Sub and slot0.item_type ~= ChapterConst.AttachOni_Target and slot0.item_type ~= ChapterConst.AttachOni then
						slot0:mergeChapterCell(ChapterCell.New(slot0))
					end
				end)

				slot2 = bit.bor(slot2, ChapterConst.DirtyAttachment, ChapterConst.DirtyAutoAction)
			end

			if #slot0.ai_list > 0 then
				_.each(slot0.ai_list, function (slot0)
					slot0:mergeChampion(ChapterChampionPackage.New(slot0))
				end)

				slot2 = bit.bor(slot2, ChapterConst.DirtyChampion, ChapterConst.DirtyAutoAction)
			end

			if #slot0.add_flag_list > 0 or #slot0.del_flag_list > 0 then
				slot2 = bit.bor(slot2, ChapterConst.DirtyStrategy, ChapterConst.DirtyCellFlag)

				slot0:updateExtraFlag(slot1, slot0.add_flag_list, slot0.del_flag_list)
			end

			slot0:updateChapter(slot1, slot2)
		end
	end)

	slot0.shamChapter = ShamChapter.New()

	slot0:on(23001, function (slot0)
		slot1 = slot0.sim_id

		if not ChapterConst.ActivateMirror then
			if not slot1 or not pg.sim_battle_template[slot1] then
				slot1 = pg.TimeMgr.GetInstance():STimeDescS(pg.TimeMgr.GetInstance():GetServerTime(), "*t").month
			end

			slot0.shamChapter.simId = slot1
		end

		slot0.shamChapter.shamResetCount = slot0.sham_count

		if slot0.shamChapter:isFirstDay() and slot0.shamChapter.shamResetCount == 0 then
			slot0.shamChapter.shamResetCount = 1
		end

		slot0.shamChapter.repairTimes = slot0.daily_repair_count

		if slot0.current_sham and slot0.current_sham.id > 0 and pg.sham_battle_template[slot0.current_sham.id] then
			slot0.shamChapter:update(slot0.current_sham)
		else
			slot0:localLoadShamChapter()
		end
	end)
	slot0:on(23009, function (slot0)
		slot1 = slot0:getShamChapter()

		if #slot0.cell_list > 0 then
			_.each(slot0.cell_list, function (slot0)
				slot0:mergeChapterCell(ChapterCell.New(slot0))
			end)
			slot0:updateShamChapter(slot1, bit.bor(ChapterConst.DirtyAttachment, ChapterConst.DirtyAutoAction))
		end
	end)

	slot0.guildChapter = GuildChapter.New()

	slot0:on(61001, function (slot0)
		if slot0 ~= nil then
			slot0.guildChapter = GuildChapter.New()
			slot0.guildChapter.shamResetCount = slot0.guild_count
			slot0.guildChapter.repairTimes = slot0.daily_repair_count

			if slot0.current_guild and slot0.current_guild.id > 0 and pg.sham_battle_template[slot0.current_guild.id] then
				slot0.guildChapter:update(slot0.current_guild)
			else
				slot0:localLoadGuildChapter()
			end
		end
	end)
	slot0:on(61009, function (slot0)
		slot1 = slot0:guildChapter()

		if #slot0.cell_list > 0 then
			_.each(slot0.cell_list, function (slot0)
				slot0:mergeChapterCell(ChapterCell.New(slot0))
			end)
			slot0:updateGuildChapter(slot1, bit.bor(ChapterConst.DirtyAttachment, ChapterConst.DirtyAutoAction))
		end
	end)

	slot0.timers = {}
	slot0.escortChallengeTimes = 0

	slot0:buildEscortMaps()

	slot0.subNextReqTime = 0
	slot0.subRefreshCount = 0
	slot0.subProgress = 1
	slot0.defeatedEnemiesBuffer = {}
	slot0.comboHistoryBuffer = {}
	slot0.justClearChapters = {}
end

function slot0.IsChapterInRemaster(slot0, slot1)
	slot2 = pg.TimeMgr.GetInstance()

	return _.detect(pg.re_map_template.all, function (slot0)
		if pg.re_map_template[slot0].time ~= "always" and (slot0:parseTimeFromConfig(slot2[2], true) > slot0:GetServerTime() or slot0:GetServerTime() > slot0:parseTimeFromConfig(slot2[3], true)) then
			return false
		end

		return _.any(slot1.config_data, function (slot0)
			return slot0 == slot0
		end)
	end)
end

function slot0.buildRemasterMaps(slot0)
	slot2 = pg.TimeMgr.GetInstance()

	_.each(pg.re_map_template.all, function (slot0)
		if pg.re_map_template[slot0].time == "always" or (slot0:parseTimeFromConfig(slot2[2], true) <= slot0:GetServerTime() and slot0:GetServerTime() <= slot0:parseTimeFromConfig(slot2[3], true)) then
			_.each(slot1.config_data, function (slot0)
				if not slot0[pg.chapter_template[slot0].map] then
					Map.New({
						id = slot1
					}):setRemaster(slot1.id)

					slot0[slot1] = Map.New()
				end
			end)
		end
	end)

	return {}
end

function slot0.getActiveRemaster(slot0)
	if slot0.remasterId and slot0.remasterId > 0 and pg.TimeMgr.GetInstance():GetServerTime() < slot0.remasterTime then
		return slot0.remasterId
	end
end

function slot0.getMaxEscortChallengeTimes(slot0)
	return pg.gameset.gardroad_count.key_value
end

function slot0.buildEscortMaps(slot0)
	slot1 = {}

	if OPEN_ESCORT then
		_.each(pg.escort_map_template.all, function (slot0)
			table.insert(slot0, EscortInfo.New(slot0))
		end)

		for slot5, slot6 in ipairs(pg.gameset.gardroad_count.description[1]) do
			slot7 = pg.chapter_template[slot6]

			table.insert(_.detect(slot1, function (slot0)
				return slot0.id == slot0.map
			end).chapters, {
				escortId = slot6,
				chapter = Chapter.New({
					id = slot6
				})
			})
		end
	end

	slot0.escortMaps = slot1
end

function slot0.resetEscortChallengeTimes(slot0)
	slot0.escortChallengeTimes = 0
end

function slot0.checkMirrorCount(slot0)
	if slot0.shamChapter == nil then
		return
	end

	if ChapterConst.ActivateMirror and slot0.shamChapter:isFirstDay() and slot0.shamChapter.shamResetCount == 0 then
		slot0.shamChapter.shamResetCount = 1
	end
end

function slot0.addChapterListener(slot0, slot1)
	if not slot1.dueTime or not slot0.timers then
		return
	end

	if slot0.timers[slot1.id] then
		slot0.timers[slot1.id]:Stop()

		slot0.timers[slot1.id] = nil
	end

	function slot3()
		slot0.data[slot1.id].dueTime = nil

		slot0.data[slot1.id].data[nil.id]:display("times'up")
		slot0.data[slot1.id].data[nil.id].display:sendNotification("times'up".CHAPTER_UPDATED, {
			dirty = 0,
			chapter = slot0.data[slot1.id]:clone()
		})
		slot0.data[slot1.id].data[nil.id].display.sendNotification:sendNotification("times'up".CHAPTER_UPDATED.CHAPTER_TIMESUP)
	end

	if slot1.dueTime - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
		slot0.timers[slot1.id] = Timer.New(function ()
			slot0()
			slot1.timers[slot2.id]:Stop()

			slot1.timers[slot2.id] = nil
		end, slot2, 1)

		slot0.timers[slot1.id]:Start()
	else
		slot3()
	end
end

function slot0.removeChapterListener(slot0, slot1)
	if slot0.timers[slot1] then
		slot0.timers[slot1]:Stop()

		slot0.timers[slot1] = nil
	end
end

function slot0.remove(slot0)
	for slot4, slot5 in pairs(slot0.timers) do
		slot5:Stop()
	end

	slot0.timers = nil
end

function slot0.existChapter(slot0, slot1)
	return slot0.data[slot1] ~= nil
end

function slot0.getChapterById(slot0, slot1)
	if slot0.data[slot1] then
		return slot0.data[slot1]:clone()
	else
		slot2 = Chapter.New({
			id = slot1
		})
		slot3 = slot2:getConfig("map")

		if slot2:getConfig("type") == Chapter.CustomFleet then
			slot2:setEliteFleetList(slot0.mapEliteFleetCache[slot3] or {
				{},
				{},
				{}
			})
			slot2:setEliteCommanders(slot0.mapEliteCommanderCache[slot3] or {
				{},
				{},
				{}
			})

			slot4 = getProxy(BayProxy):getRawData()

			for slot8, slot9 in ipairs(slot2:getEliteFleetList()) do
				slot10 = #slot9

				while slot10 > 0 do
					if slot4[slot9[slot10]] == nil then
						table.remove(slot9, slot10)
					end

					slot10 = slot10 - 1
				end
			end
		end

		return slot2
	end
end

function slot0.addChapter(slot0, slot1)
	slot2 = slot1:clone()
	slot0.data[slot2.id] = slot2

	slot0:addChapterListener(slot2)
	slot0.facade:sendNotification(slot0.CHAPTER_ADDED, {
		dirty = -1,
		chapter = slot2
	})
end

function slot0.updateChapter(slot0, slot1, slot2)
	slot3 = slot0.data[slot1.id]
	slot0.data[slot1.id] = slot1:clone()

	if not slot1:inWartime() then
		slot0:removeChapterListener(slot1.id)
	elseif not slot3 or slot3.dueTime ~= slot1.dueTime then
		slot0:addChapterListener(slot1)
	end

	slot0.facade:sendNotification(slot0.CHAPTER_UPDATED, {
		chapter = slot1,
		dirty = defaultValue(slot2, 0)
	})

	if slot0.data[slot1.id] and slot0.data[slot1.id].fleet then
		slot0.data[slot1.id].fleet:clearShipHpChange()
	end
end

function slot0.updateExtraFlag(slot0, slot1, slot2, slot3)
	if not slot1:updateExtraFlags(slot2, slot3) then
		return
	end

	slot5 = {}

	for slot9, slot10 in ipairs(slot2) do
		table.insert(slot5, slot10)
	end

	slot0.extraFlagUpdate = true

	slot0.facade:sendNotification(slot0.CHAPTER_EXTAR_FLAG_UPDATED, slot5)

	return true
end

function slot0.extraFlagUpdated(slot0)
	slot0.extraFlagUpdate = false
end

function slot0.removeChapter(slot0, slot1)
	if slot0.data[slot1] then
		slot0:removeChapterListener(slot1)

		slot0.data[slot1] = nil

		slot0.facade:sendNotification(slot0.CHAPTER_REMOVED, {
			dirty = -1,
			chapter = slot0.data[slot1]
		})
	end
end

function slot0.duplicateEliteFleet(slot0, slot1, slot2)
	if slot1:getConfig("type") == Chapter.CustomFleet then
		slot1:EliteShipTypeFilter()

		slot0.mapEliteFleetCache[slot1:getConfig("map")] = slot1:getEliteFleetList()
		slot0.mapEliteCommanderCache[slot1.getConfig("map")] = slot1:getEliteFleetCommanders()

		for slot9, slot10 in pairs(slot0.data) do
			if slot10:getConfig("map") == slot5 and slot10.configId ~= slot1.configId then
				slot10:setEliteFleetList(slot3)
				slot10:setEliteCommanders(slot4)

				if slot2 then
					slot0:updateChapter(slot10)
				end
			end
		end
	end
end

function slot0.getSameMapChapters(slot0, slot1)
	slot2 = {}

	if slot1:getConfig("type") == Chapter.CustomFleet then
		slot3 = slot1:getConfig("map")

		for slot7, slot8 in pairs(slot0.data) do
			if slot8:getConfig("map") == slot3 and slot8.configId ~= slot1.configId then
				table.insert(slot2, slot8)
			end
		end
	end

	return slot2
end

function slot0.getMaps(slot0)
	slot1 = {}
	slot2 = pg.expedition_data_by_map
	slot3 = (OPEN_REMASTER and slot0:buildRemasterMaps()) or {}
	slot5 = slot0:getActiveChapter() and slot4:getConfig("map")

	for slot9, slot10 in ipairs(slot2.all) do
		if not slot3[slot10] or Map.New({
			id = slot10
		}):isInValidMap() or slot5 == slot11.id then
			slot1[slot11.id] = slot11
		end
	end

	slot7 = getProxy(BayProxy).getRawData(slot6)

	for slot12, slot13 in ipairs(Chapter.bindConfigTable().all) do
		if slot1[slot8[slot13].map] then
			if slot0.data[slot14.id] then
				for slot20, slot21 in ipairs(slot16:getEliteFleetList()) do
					slot22 = #slot21

					while slot22 > 0 do
						if slot7[slot21[slot22]] == nil then
							table.remove(slot21, slot22)
						end

						slot22 = slot22 - 1
					end
				end
			end

			slot17 = nil

			if slot16 then
				slot17 = slot16:clone()

				slot0:duplicateEliteFleet(slot16)
			elseif slot14.model ~= ChapterConst.TypeMainSub and Chapter.New({
				id = slot14.id
			}).getConfig(slot17, "type") == Chapter.CustomFleet then
				slot17:setEliteFleetList(slot0.mapEliteFleetCache[slot15.configId] or {
					{},
					{},
					{}
				})
				slot17:setEliteCommanders(slot0.mapEliteCommanderCache[slot15.configId] or {
					{},
					{},
					{}
				})
			end

			if slot17 and slot17:isValid() then
				slot15:updateChapter(slot17)
			end
		end
	end

	slot9 = true
	slot11 = getProxy(PlayerProxy).getData(slot10)
	slot12 = nil

	for slot16, slot17 in ipairs(slot2.all) do
		if slot1[slot17] then
			slot19 = slot1[slot17 + 1]

			slot18:updateChapters(slot12)

			slot20 = slot18:getConfig("level_limit")

			if slot18:getMapType() == Map.SCENARIO then
				slot18:setUnlock(slot9 and slot20 <= slot11.level)

				if slot19 then
					slot9 = slot18:isClear() and slot19:getConfig("level_limit") <= slot11.level
				else
					slot9 = slot18:isClear()
				end
			elseif slot18:isActivity() then
				slot18:setUnlock(slot20 <= slot11.level and slot18:isAnyChapterUnlocked())
			else
				slot18:setUnlock(slot20 <= slot11.level)
			end

			slot12 = slot18

			if slot1[slot18:getBindMap()] then
				slot18:setBindMapVO(slot1[slot21])
			end
		else
			slot12 = nil
		end
	end

	return slot1
end

function slot0.getActiveChapter(slot0)
	for slot4, slot5 in pairs(slot0.data) do
		if slot5.active then
			return slot5:clone()
		end
	end
end

function slot0.getNonActActiveChapter(slot0)
	for slot4, slot5 in pairs(slot0.data) do
		if not slot5:isActivity() and slot5.active then
			return slot5:clone()
		end
	end
end

function slot0.getActActiveChapter(slot0)
	for slot4, slot5 in pairs(slot0.data) do
		if slot5.active and slot5:isActivity() and not slot0:IsChapterInRemaster(slot5.id) then
			return slot5:clone()
		end
	end
end

function slot0.getUnlockActMapBytype(slot0, slot1, slot2, slot3)
	slot4 = {}

	for slot9, slot10 in pairs(slot5) do
		if slot10:getConfig("type") == slot1 and slot10:getConfig("on_activity") == slot2 then
			table.insert(slot4, slot10)
		end
	end

	for slot9, slot10 in ipairs(slot4) do
		if slot10:getActiveChapter() then
			return slot10
		end
	end

	for slot9, slot10 in ipairs(slot4) do
		if slot10.id == slot3 then
			return slot10
		end
	end

	for slot9, slot10 in ipairs(slot4) do
		if slot5[slot10.id - 1] and slot11:isClearForActivity() and slot10:isUnlock() then
			return slot10
		end
	end

	table.sort(slot4, function (slot0, slot1)
		return slot0.id < slot1.id
	end)

	return slot4[1]
end

function slot0.getBindActMapBytype(slot0, slot1, slot2, slot3)
	slot4 = {}

	for slot9, slot10 in pairs(slot5) do
		if slot10:getConfig("type") == slot2 and slot10:getConfig("on_activity") == slot3 then
			table.insert(slot4, slot10)
		end
	end

	for slot9, slot10 in ipairs(slot4) do
		if slot10:getActiveChapter() then
			return slot10
		end
	end

	if (slot1 and slot1:getBindMap()) ~= 0 then
		slot8 = slot5[slot5[slot6].id - 1]

		if slot5[slot6] and slot7:isUnlock() and (not slot8 or slot8:isClearForActivity()) then
			return slot7
		end
	end

	table.sort(slot4, function (slot0, slot1)
		return slot1.id < slot0.id
	end)

	for slot10, slot11 in ipairs(slot4) do
		if (not slot5[slot11.id - 1] or slot12:isClearForActivity()) and slot11:isUnlock() then
			return slot11
		end
	end

	return slot4[#slot4]
end

function slot0.getLastMapForActivity(slot0)
	slot2, slot3 = nil

	if getProxy(ChapterProxy):getActActiveChapter() then
		slot2 = slot1.id
		slot3 = slot1:getConfig("map")
	else
		slot4 = slot0:getMaps()

		function slot5(slot0)
			return getProxy(ActivityProxy):getActivityById(slot0:getConfig("on_activity")) and not slot2:isEnd()
		end

		if Map.lastMapForActivity and slot4[Map.lastMapForActivity] and slot4[Map.lastMapForActivity]:isActivity() and slot5(slot4[Map.lastMapForActivity]) then
			slot3 = Map.lastMapForActivity
		else
			if Map.lastMapForActivity then
				Map.lastMapForActivity = nil

				slot0:recordLastMap(slot0.LAST_MAP_FOR_ACTIVITY, 0)
			end

			table.sort(slot6, function (slot0, slot1)
				return slot0.id < slot1.id
			end)

			if #getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT) > 0 then
				_.each(slot6, function (slot0)
					if _.all(_.select(_.values(slot0), function (slot0)
						return slot0:getConfig("on_activity") == slot0.id
					end), function (slot0)
						return slot0:isActivity() and slot0:getConfig("type") == Map.EVENT
					end) then
						_.each(slot1, function (slot0)
							if slot0:isUnlock() then
								slot0 = slot0.id
							end
						end)
					elseif _.any(slot1, function (slot0)
						return slot0:getConfig("type") == Map.ACTIVITY_EASY and not slot0:isClearForActivity()
					end) then
						_.each(slot1, function (slot0)
							if slot0:getConfig("type") == Map.ACTIVITY_EASY and slot0:isUnlock() then
								slot0 = slot0.id
							end
						end)
					else
						_.each(slot1, function (slot0)
							if slot0:getConfig("type") == Map.ACTIVITY_HARD and slot0:isUnlock() then
								slot0 = slot0.id
							end
						end)
					end
				end)
			end

			slot3 = slot3 or checkExist(slot6, {
				1
			}, {
				"getConfig",
				{
					"config_data"
				}
			}, {
				1
			})
		end
	end

	return slot3, slot2
end

function slot0.inWarTime(slot0)
	if slot0:getActiveChapter() then
		return slot1:inWartime()
	end
end

function slot0.isInVaildFleet(slot0)
	return not slot0:getActiveChapter() or not slot1.fleet:isValid()
end

function slot0.checkNextFleet(slot0)
	return not slot0:getActiveChapter() or slot1.fleet:isValid() or slot1:getNextValidIndex() <= 0
end

function slot0.inChapterLine(slot0, slot1)
	if slot0:getActiveChapter() and slot2.fleet.line.row == slot1.row and slot2.fleet.line.column == slot1.column then
		if slot1.attachment and slot1.flag then
			return slot0:getChapterCell(slot1)
		end

		return true
	end
end

function slot0.getChapterCell(slot0, slot1)
	if slot0:getActiveChapter() then
		return slot2:getChapterCell(slot1.row, slot1.column).attachment == slot1.attachment and slot3.flag == slot1.flag
	end
end

function slot0.updateActiveChapterShips(slot0)
	for slot4, slot5 in pairs(slot0.data) do
		if slot5.active then
			_.each(slot5.fleets, function (slot0)
				slot0:flushShips()
			end)
		end
	end
end

function slot0.resetRepairTimes(slot0)
	slot0.repairTimes = 0
end

function slot0.getUseableEliteMap(slot0)
	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		if slot7:getMapType() == Map.ELITE and slot7:isEliteEnabled() then
			slot2[#slot2 + 1] = slot7
		end
	end

	return slot2
end

function slot0.getUseableActivityMap(slot0)
	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		if slot7:getMapType() == Map.ACTIVITY_HARD then
			slot2[#slot2 + 1] = slot7
		end
	end

	return slot2
end

function slot0.getUseableMaxEliteMap(slot0)
	if #slot0:getUseableEliteMap() == 0 then
		return false
	end

	table.sort(slot1, function (slot0, slot1)
		return slot1.configId < slot0.configId
	end)

	return slot1[1]
end

function slot0.getAnyPassedChapterMapList(slot0)
	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		if slot7:getMapType() == Map.SCENARIO then
			for slot12, slot13 in pairs(slot8) do
				if slot13:isClear() then
					slot2[#slot2 + 1] = slot7
				end
			end
		end
	end

	return slot2
end

function slot0.getHigestAnyPassedChapterMap(slot0)
	if #slot0:getAnyPassedChapterMapList() == 0 then
		return false
	end

	table.sort(slot1, function (slot0, slot1)
		return slot1.configId < slot0.configId
	end)

	return slot1[1]
end

function slot0.getHigestClearChapterAndMap(slot0)
	if slot0:getHigestAnyPassedChapterMap() then
		slot2 = {}

		for slot7, slot8 in pairs(slot3) do
			if slot8:isClear() then
				slot2[#slot2 + 1] = slot8
			end
		end

		table.sort(slot2, function (slot0, slot1)
			return slot1.configId < slot0.configId
		end)

		return slot2[1], slot1
	else
		slot4 = {}

		for slot9, slot10 in pairs(slot5) do
			slot4[#slot4 + 1] = slot10
		end

		table.sort(slot4, function (slot0, slot1)
			return slot0.configId < slot1.configId
		end)

		return slot4[1], slot3
	end
end

function slot0.eliteFleetRecommend(slot0, slot1, slot2)
	slot3 = getProxy(BayProxy)
	slot4 = slot1:getEliteFleetList()[slot2]


	-- Decompilation error in this vicinity:
	function (slot0)
		table.sort(slot0, function (slot0, slot1)
			if type(slot0) == type(slot1) then
				return slot3 < slot2
			elseif slot2 == "string" then
				return slot1 == 0
			else
				return slot0 ~= 0
			end
		end)
	end((slot1:getConfig("limitation")[slot2] and Clone(slot5[1])) or {
		0,
		0,
		0
	})

	-- Decompilation error in this vicinity:
	function (slot0)
		table.sort(slot0, function (slot0, slot1)
			if type(slot0) == type(slot1) then
				return slot3 < slot2
			elseif slot2 == "string" then
				return slot1 == 0
			else
				return slot0 ~= 0
			end
		end)
	end((slot5 and Clone(slot5[2])) or {
		0,
		0,
		0
	})

	-- Decompilation error in this vicinity:
	function (slot0)
		table.sort(slot0, function (slot0, slot1)
			if type(slot0) == type(slot1) then
				return slot3 < slot2
			elseif slot2 == "string" then
				return slot1 == 0
			else
				return slot0 ~= 0
			end
		end)
	end(slot9)

	slot10 = {}

	for slot14, slot15 in ipairs(slot1:getEliteFleetList()) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 47-50, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 51-55, warpins: 0 ---
		for slot19, slot20 in ipairs(slot15) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 51-53, warpins: 1 ---
			slot10[#slot10 + 1] = slot20
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 54-55, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 56-57, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	slot11 = {
		[TeamType.Main] = slot7,
		[TeamType.Vanguard] = slot8,
		[TeamType.Submarine] = slot9
	}

	function slot12(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		if type(slot1) == "string" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-13, warpins: 1 ---
			return table.contains(ShipType.BundleList[slot1], slot0)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-18, warpins: 1 ---
			if type(slot1) == "number" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 19-20, warpins: 1 ---
				return slot1 == 0 or slot0 == slot1
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 26-26, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 27-27, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot13 = getProxy(BayProxy):getRawData()

	for slot17, slot18 in ipairs(slot4) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 79-92, warpins: 1 ---
		slot22 = 0

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 93-102, warpins: 0 ---
		for slot27, slot28 in ipairs(slot23) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 93-98, warpins: 1 ---
			if slot12(slot20, slot28) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 99-100, warpins: 1 ---
				slot22 = slot28

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 101-101, warpins: 1 ---
				break
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 101-102, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 103-106, warpins: 2 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 107-116, warpins: 0 ---
		for slot27, slot28 in ipairs(slot23) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 107-108, warpins: 1 ---
			if slot28 == slot22 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 109-114, warpins: 1 ---
				table.remove(slot23, slot27)

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 115-115, warpins: 1 ---
				break
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 115-116, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 117-118, warpins: 3 ---
		--- END OF BLOCK #4 ---



	end

	function slot14(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		if slot0:getEliteRecommendShip(slot0, slot0.getEliteRecommendShip) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-19, warpins: 1 ---
			slot1[#slot1 + 1] = slot1.id
			slot1.id[#slot2 + 1] = slot1.id
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 20-20, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	if slot2 >= 1 and slot2 <= 2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 126-129, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 130-160, warpins: 0 ---
		for slot18, slot19 in ipairs(slot7) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 130-135, warpins: 1 ---
			slot20 = nil

			if type(slot19) == "string" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 136-142, warpins: 1 ---
				slot20 = Clone(ShipType.BundleList[slot19])
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 143-147, warpins: 1 ---
				if type(slot19) == "number" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 148-149, warpins: 1 ---
					slot14((slot19 ~= 0 or TeamType.MainShipType) and {
						slot19
					})
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 156-158, warpins: 4 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 159-160, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 161-164, warpins: 1 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 165-195, warpins: 0 ---
		for slot18, slot19 in ipairs(slot8) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 165-170, warpins: 1 ---
			slot20 = nil

			if type(slot19) == "string" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 171-177, warpins: 1 ---
				slot20 = Clone(ShipType.BundleList[slot19])
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 178-182, warpins: 1 ---
				if type(slot19) == "number" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 183-184, warpins: 1 ---
					slot14((slot19 ~= 0 or TeamType.VanguardShipType) and {
						slot19
					})
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 191-193, warpins: 4 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 194-195, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 196-196, warpins: 1 ---
		--- END OF BLOCK #4 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 197-200, warpins: 2 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 201-231, warpins: 0 ---
		for slot18, slot19 in ipairs(slot9) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 201-206, warpins: 1 ---
			slot20 = nil

			if type(slot19) == "string" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 207-213, warpins: 1 ---
				slot20 = Clone(ShipType.BundleList[slot19])
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 214-218, warpins: 1 ---
				if type(slot19) == "number" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 219-220, warpins: 1 ---
					slot14((slot19 ~= 0 or TeamType.SubShipType) and {
						slot19
					})
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 227-229, warpins: 4 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 230-231, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #1 ---



	end
end

function slot0.isClear(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	return slot0:getChapterById(slot1) and slot2:isClear()
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-10, warpins: 2 ---
	--- END OF BLOCK #1 ---



end

function slot0.getShamChapter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return Clone(slot0.shamChapter)
	--- END OF BLOCK #0 ---



end

function slot0.updateShamChapter(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	slot0.shamChapter = slot1

	slot0.facade:sendNotification(slot0.SHAM_CHAPTER_UPDATED, {
		shamChapter = slot1:clone(),
		dirty = defaultValue(slot2, 0)
	})
	slot0.shamChapter.fleet:clearShipHpChange()

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateShamChapterShips(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.shamChapter:flushShips()

	return
	--- END OF BLOCK #0 ---



end

function slot0.localSaveShamChapter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.shamChapter:localSaveChapter()

	return
	--- END OF BLOCK #0 ---



end

function slot0.resetShamChapter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0.shamChapter.shamResetCount = 0
	slot0.shamChapter.repairTimes = 0

	return
	--- END OF BLOCK #0 ---



end

function slot0.localLoadShamChapter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.shamChapter:localLoadChapter()

	return
	--- END OF BLOCK #0 ---



end

function slot0.getGuildChapter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return Clone(slot0.guildChapter)
	--- END OF BLOCK #0 ---



end

function slot0.localLoadGuildChapter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.guildChapter:localLoadChapter()

	return
	--- END OF BLOCK #0 ---



end

function slot0.localSaveGuildChapter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.guildChapter:localSaveChapter()

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateGuildChapter(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	slot0.guildChapter = slot1

	slot0.facade:sendNotification(slot0.GUILD_CHAPTER_UPDATED, {
		guildChapter = slot1:clone(),
		dirty = defaultValue(slot2, 0)
	})
	slot0.guildChapter.fleet:clearShipHpChange()

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateGuildChapterShips(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.guildChapter then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot0.guildChapter:flushShips()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-8, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.getEscortShop(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return Clone(slot0.escortShop)
	--- END OF BLOCK #0 ---



end

function slot0.updateEscortShop(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot0.escortShop = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot0.removeEscortChapter(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-23, warpins: 0 ---
	for slot5, slot6 in pairs(slot0.escortMaps) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-9, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-21, warpins: 0 ---
		for slot10 = #slot6.chapters, 1, -1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-15, warpins: 2 ---
			if slot6.chapters[slot10].chapter.id == slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 16-20, warpins: 1 ---
				table.remove(slot6.chapters, slot10)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 21-21, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 22-23, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 24-24, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.recordLastMap(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = false

	if slot1 == slot0.LAST_MAP_FOR_ACTIVITY then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-9, warpins: 1 ---
		Map.lastMapForActivity = slot2
		slot3 = true
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-13, warpins: 1 ---
		if slot1 == slot0.LAST_MAP and slot2 ~= Map.lastMap then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-20, warpins: 1 ---
			Map.lastMap = slot2
			slot3 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-22, warpins: 4 ---
	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-38, warpins: 1 ---
		PlayerPrefs.SetInt(slot1 .. getProxy(PlayerProxy):getRawData().id, slot2)
		PlayerPrefs.Save()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 39-39, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.getLastMap(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	if PlayerPrefs.GetInt(slot1 .. getProxy(PlayerProxy):getRawData().id) ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-15, warpins: 1 ---
		return slot3
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.getChapterCommandes(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-27, warpins: 0 ---
	for slot5, slot6 in pairs(slot0.data) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-12, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-25, warpins: 0 ---
		for slot11, slot12 in pairs(slot7) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-16, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 17-23, warpins: 0 ---
			for slot16, slot17 in pairs(slot12) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-21, warpins: 1 ---
				table.insert(slot1, slot17)
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 22-23, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 24-25, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 26-27, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-28, warpins: 1 ---
	return slot1
	--- END OF BLOCK #2 ---



end

function slot0.getFleetCommander(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-21, warpins: 0 ---
	for slot6, slot7 in pairs(slot0.data) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		if slot7.id == slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-14, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-19, warpins: 0 ---
			for slot12, slot13 in pairs(slot8) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-16, warpins: 1 ---
				if slot2 == slot12 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 17-17, warpins: 1 ---
					return slot13
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 18-19, warpins: 3 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 20-21, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 22-22, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.getOtherFleetCommander(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-26, warpins: 0 ---
	for slot7, slot8 in pairs(slot0.data) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-8, warpins: 1 ---
		if slot8.id == slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-15, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 16-24, warpins: 0 ---
			for slot13, slot14 in pairs(slot9) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 16-17, warpins: 1 ---
				if slot2 ~= slot13 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 18-22, warpins: 1 ---
					table.insert(slot3, slot14)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 23-24, warpins: 3 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-26, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-27, warpins: 1 ---
	return slot3
	--- END OF BLOCK #2 ---



end

function slot0.getSubAidFlag(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot1 = ys.Battle.BattleConst.SubAidFlag
	slot2 = slot0.fleet
	slot3 = false

	if _.detect(slot0.fleets, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		return slot0:getFleetType() == FleetType.Submarine and slot0:isValid()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-15, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-22, warpins: 1 ---
		if slot4:inHuntingRange(slot2.line.row, slot2.line.column) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-24, warpins: 1 ---
			slot3 = true
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-34, warpins: 1 ---
			if _.detect(slot4:getStrategies(), function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				return slot0.id == ChapterConst.StrategyCallSubOutofRange
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 9-9, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end) and slot6.count > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 39-39, warpins: 1 ---
				slot3 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 40-41, warpins: 5 ---
	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 42-58, warpins: 1 ---
		slot6 = getProxy(PlayerProxy).getRawData(slot5)
		slot7, slot8 = slot0:getFleetCost(slot2)
		slot9, slot10 = slot0:getFleetAmmo(slot4)

		if slot10 <= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 59-62, warpins: 1 ---
			return slot1.AMMO_EMPTY
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 63-70, warpins: 1 ---
			if slot6.oil < slot4:getSummonCost() + slot8.oil then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 71-74, warpins: 1 ---
				return slot1.OIL_EMPTY
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 75-79, warpins: 1 ---
				return true, slot4
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 80-82, warpins: 1 ---
		return slot1.AID_EMPTY
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 83-83, warpins: 4 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.GetChapterAuraBuffs(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-21, warpins: 0 ---
	for slot5, slot6 in ipairs(slot0.fleets) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-12, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-19, warpins: 0 ---
		for slot11, slot12 in ipairs(slot7) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-17, warpins: 1 ---
			table.insert(slot1, slot12)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 18-19, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 20-21, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 22-22, warpins: 1 ---
	return slot1
	--- END OF BLOCK #2 ---



end

function slot0.GetChapterAidBuffs(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-20, warpins: 0 ---
	for slot5, slot6 in ipairs(slot0.fleets) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-8, warpins: 1 ---
		if slot6 ~= slot0.fleet then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-15, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 16-18, warpins: 0 ---
			for slot11, slot12 in pairs(slot7) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 16-16, warpins: 1 ---
				slot1[slot11] = slot12
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 17-18, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 19-20, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 21-21, warpins: 1 ---
	return slot1
	--- END OF BLOCK #2 ---



end

function slot0.RecordLastDefeatedEnemy(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot1 or slot1 <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-9, warpins: 2 ---
	slot0.defeatedEnemiesBuffer[slot1] = slot2

	return
	--- END OF BLOCK #1 ---



end

function slot0.RecordComboHistory(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot1 or slot1 <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-9, warpins: 2 ---
	slot0.comboHistoryBuffer[slot1] = slot2

	return
	--- END OF BLOCK #1 ---



end

function slot0.RecordJustClearChapters(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot1 or slot1 <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-9, warpins: 2 ---
	slot0.justClearChapters[slot1] = slot2

	return
	--- END OF BLOCK #1 ---



end

function slot0.GetJustClearChapters(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0.justClearChapters[slot1]
	--- END OF BLOCK #0 ---



end

function slot0.ifShowRemasterTip(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0.remasterTip
	--- END OF BLOCK #0 ---



end

function slot0.setRemasterTip(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot0.remasterTip = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateRemasterTicketsNum(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot0.remasterTickets = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateDailyCount(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot0.remasterDailyCount = slot0.remasterDailyCount + 2

	return
	--- END OF BLOCK #0 ---



end

function slot0.GetSkipPrecombat(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.skipPrecombat == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0.skipPrecombat = PlayerPrefs.GetInt("chapter_skip_precombat", 0)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-13, warpins: 2 ---
	return (slot0.skipPrecombat > 0 and true) or false
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-17, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

function slot0.UpdateSkipPrecombat(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 9-13, warpins: 2 ---
	if ((tobool(slot1) and 1) or 0) ~= slot0:GetSkipPrecombat() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-19, warpins: 1 ---
		PlayerPrefs.SetInt("chapter_skip_precombat", slot1)

		slot0.skipPrecombat = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-20, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

return slot0
