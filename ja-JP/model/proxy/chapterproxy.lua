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
		slot3 = uv0.data or {}

		for slot5, slot6 in slot2(slot3) do
			if slot6:getPlayType() == ChapterConst.TypeMainSub then
				slot1[slot5] = slot6
			end
		end

		uv0.mapEliteFleetCache = {}
		uv0.mapEliteCommanderCache = {}
		slot2 = {}

		for slot6, slot7 in ipairs(slot0.fleet_list) do
			slot2[slot7.map_id] = slot2[slot7.map_id] or {}

			table.insert(slot2[slot7.map_id], slot7)
		end

		for slot6, slot7 in pairs(slot2) do
			uv0.mapEliteFleetCache[slot6], uv0.mapEliteCommanderCache[slot6] = Chapter.BuildEliteFleetList(slot7)
		end

		uv0.data = {}

		for slot6, slot7 in ipairs(slot0.chapter_list) do
			if not pg.chapter_template[slot7.id] then
				Debugger.LogError("chapter_template not exist: " .. slot7.id)
			else
				slot8 = Chapter.New(slot7)
				slot11 = slot8
				slot10 = slot8.setEliteFleetList

				if not uv0.mapEliteFleetCache[slot8:getConfig("map")] then
					slot12 = {
						{},
						{},
						{}
					}
				end

				slot10(slot11, slot12)

				slot11 = slot8
				slot10 = slot8.setEliteCommanders

				if not uv0.mapEliteCommanderCache[slot9] then
					slot12 = {
						{},
						{},
						{}
					}
				end

				slot10(slot11, slot12)

				if uv0.data[slot8.id] then
					slot10 = uv0

					uv0:updateChapter(slot8)
				else
					slot10 = uv0

					uv0:addChapter(slot8)
				end
			end
		end

		for slot6, slot7 in pairs(slot1) do
			if uv0.data[slot6] then
				slot8.expireTime = slot7.expireTime
				slot8.awardIndex = slot7.awardIndex
			else
				uv0.data[slot6] = slot7
			end
		end

		if slot0.current_chapter and slot0.current_chapter.id > 0 then
			if not uv0.data[slot3] then
				slot5.id = slot3
				slot4 = Chapter.New({})
			end

			slot4:update(slot0.current_chapter)

			if uv0.data[slot3] then
				slot5 = uv0

				uv0:updateChapter(slot4)
			else
				slot5 = uv0

				uv0:addChapter(slot4)
			end
		end

		uv0.repairTimes = slot0.daily_repair_count

		if slot0.react_chapter then
			uv0.remasterId = slot0.react_chapter.active_id
			uv0.remasterTime = slot0.react_chapter.active_timestamp
			uv0.remasterTickets = slot0.react_chapter.count
			uv0.remasterDailyCount = slot0.react_chapter.daily_count
			uv0.remasterTip = uv0.remasterDailyCount <= 1
		end

		slot4 = uv0
		Map.lastMap = uv0:getLastMap(uv1.LAST_MAP)
		slot4 = uv0
		Map.lastMapForActivity = uv0:getLastMap(uv1.LAST_MAP_FOR_ACTIVITY)
	end)
	slot0:on(13105, function (slot0)
		slot1 = uv0

		if slot1:getActiveChapter() then
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

						if _.detect(uv0.cellAttachments, function (slot0)
							return slot0.row == uv0.row and slot0.column == uv0.column
						end) then
							if slot2.flag == 3 and ChapterCell.New(slot0).flag == 4 and pg.map_event_template[slot2.attachmentId].gametip ~= "" then
								slot4 = pg.TipsMgr.GetInstance()

								pg.TipsMgr.GetInstance():ShowTips(i18n(slot3))
							end

							slot2.attachment = slot1.attachment
							slot2.attachmentId = slot1.attachmentId
							slot2.flag = slot1.flag
							slot2.data = slot1.data
						else
							table.insert(uv0.cellAttachments, slot1)
						end

						return
					end

					if slot0.item_type ~= ChapterConst.AttachNone and slot0.item_type ~= ChapterConst.AttachBorn and slot0.item_type ~= ChapterConst.AttachBorn_Sub and slot0.item_type ~= ChapterConst.AttachOni_Target and slot0.item_type ~= ChapterConst.AttachOni then
						slot2 = uv0

						uv0:mergeChapterCell(ChapterCell.New(slot0))
					end
				end)

				slot2 = bit.bor(slot2, ChapterConst.DirtyAttachment, ChapterConst.DirtyAutoAction)
			end

			if #slot0.ai_list > 0 then
				_.each(slot0.ai_list, function (slot0)
					slot2 = uv0

					uv0:mergeChampion(ChapterChampionPackage.New(slot0))
				end)

				slot2 = bit.bor(slot2, ChapterConst.DirtyChampion, ChapterConst.DirtyAutoAction)
			end

			if #slot0.add_flag_list > 0 or #slot0.del_flag_list > 0 then
				slot2 = bit.bor(slot2, ChapterConst.DirtyStrategy, ChapterConst.DirtyCellFlag)
				slot3 = uv0

				uv0:updateExtraFlag(slot1, slot0.add_flag_list, slot0.del_flag_list)
			end

			slot3 = uv0

			uv0:updateChapter(slot1, slot2)
		end
	end)

	slot0.shamChapter = ShamChapter.New()

	slot0:on(23001, function (slot0)
		slot1 = slot0.sim_id

		if not ChapterConst.ActivateMirror then
			if not slot1 or not pg.sim_battle_template[slot1] then
				slot2 = pg.TimeMgr.GetInstance()
				slot4 = pg.TimeMgr.GetInstance()
				slot1 = pg.TimeMgr.GetInstance():STimeDescS(pg.TimeMgr.GetInstance():GetServerTime(), "*t").month
			end

			uv0.shamChapter.simId = slot1
		end

		uv0.shamChapter.shamResetCount = slot0.sham_count
		slot2 = uv0.shamChapter

		if uv0.shamChapter:isFirstDay() and uv0.shamChapter.shamResetCount == 0 then
			uv0.shamChapter.shamResetCount = 1
		end

		uv0.shamChapter.repairTimes = slot0.daily_repair_count

		if slot0.current_sham and slot0.current_sham.id > 0 and pg.sham_battle_template[slot0.current_sham.id] then
			slot2 = uv0.shamChapter

			uv0.shamChapter:update(slot0.current_sham)
		else
			slot2 = uv0

			uv0:localLoadShamChapter()
		end
	end)
	slot0:on(23009, function (slot0)
		slot1 = uv0
		slot1 = uv0:getShamChapter()

		if #slot0.cell_list > 0 then
			_.each(slot0.cell_list, function (slot0)
				slot2 = uv0

				uv0:mergeChapterCell(ChapterCell.New(slot0))
			end)

			slot2 = uv0

			uv0:updateShamChapter(uv0:getShamChapter(), bit.bor(ChapterConst.DirtyAttachment, ChapterConst.DirtyAutoAction))
		end
	end)

	slot0.guildChapter = GuildChapter.New()

	slot0:on(61001, function (slot0)
		if slot0 ~= nil then
			uv0.guildChapter = GuildChapter.New()
			uv0.guildChapter.shamResetCount = slot0.guild_count
			uv0.guildChapter.repairTimes = slot0.daily_repair_count

			if slot0.current_guild and slot0.current_guild.id > 0 and pg.sham_battle_template[slot0.current_guild.id] then
				slot1 = uv0.guildChapter

				uv0.guildChapter:update(slot0.current_guild)
			else
				slot1 = uv0

				uv0:localLoadGuildChapter()
			end
		end
	end)
	slot0:on(61009, function (slot0)
		slot1 = uv0
		slot1 = uv0:guildChapter()

		if #slot0.cell_list > 0 then
			_.each(slot0.cell_list, function (slot0)
				slot2 = uv0

				uv0:mergeChapterCell(ChapterCell.New(slot0))
			end)

			slot2 = uv0

			uv0:updateGuildChapter(uv0:guildChapter(), bit.bor(ChapterConst.DirtyAttachment, ChapterConst.DirtyAutoAction))
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
end

function slot0.buildRemasterMaps(slot0)
	slot2 = pg.TimeMgr.GetInstance()

	_.each(pg.re_map_template.all, function (slot0)
		if pg.re_map_template[slot0].time ~= "always" then
			slot3 = uv0
			slot4 = uv0

			if uv0:parseTimeFromConfig(slot2[2], true) <= uv0:GetServerTime() then
				slot3 = uv0
				slot4 = uv0

				if uv0:GetServerTime() <= uv0:parseTimeFromConfig(slot2[3], true) then
					_.each(slot1.config_data, function (slot0)
						if not uv0[pg.chapter_template[slot0].map] then
							slot4.id = slot1
							slot2 = Map.New({})

							slot2:setRemaster(uv1.id)

							uv0[slot1] = slot2
						end
					end)
				end
			end
		end
	end)

	return {}
end

function slot0.getActiveRemaster(slot0)
	if slot0.remasterId and slot0.remasterId > 0 then
		slot1 = pg.TimeMgr.GetInstance()

		if pg.TimeMgr.GetInstance():GetServerTime() < slot0.remasterTime then
			return slot0.remasterId
		end
	end
end

function slot0.getMaxEscortChallengeTimes(slot0)
	return pg.gameset.gardroad_count.key_value
end

function slot0.buildEscortMaps(slot0)
	slot1 = {}

	if OPEN_ESCORT then
		_.each(pg.escort_map_template.all, function (slot0)
			table.insert(uv0, EscortInfo.New(slot0))
		end)

		for slot5, slot6 in ipairs(pg.gameset.gardroad_count.description[1]) do
			slot7 = pg.chapter_template[slot6]
			slot11.escortId = slot6
			slot13.id = slot6
			slot11.chapter = Chapter.New({})

			table.insert(_.detect(slot1, function (slot0)
				return slot0.id == uv0.map
			end).chapters, {})
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

	if ChapterConst.ActivateMirror then
		slot1 = slot0.shamChapter

		if slot0.shamChapter:isFirstDay() and slot0.shamChapter.shamResetCount == 0 then
			slot0.shamChapter.shamResetCount = 1
		end
	end
end

function slot0.addChapterListener(slot0, slot1)
	if not slot1.dueTime or not slot0.timers then
		return
	end

	if slot0.timers[slot1.id] then
		slot2 = slot0.timers[slot1.id]

		slot0.timers[slot1.id]:Stop()

		slot0.timers[slot1.id] = nil
	end

	slot3 = pg.TimeMgr.GetInstance()

	function slot3()
		uv0.data[uv1.id].dueTime = nil
		slot0 = uv0.data[uv1.id]

		uv0.data[uv1.id]:display("times'up")

		slot0 = uv0
		slot4 = uv0.data[uv1.id]
		slot3.chapter = uv0.data[uv1.id]:clone()

		uv0:sendNotification(uv2.CHAPTER_UPDATED, {
			dirty = 0
		})

		slot0 = uv0

		uv0:sendNotification(uv2.CHAPTER_TIMESUP)
	end

	if slot1.dueTime - function ()
		uv0.data[uv1.id].dueTime = nil
		slot0 = uv0.data[uv1.id]

		uv0.data[uv1.id]:display("times'up")

		slot0 = uv0
		slot4 = uv0.data[uv1.id]
		slot3.chapter = uv0.data[uv1.id]:clone()

		uv0:sendNotification(uv2.CHAPTER_UPDATED, )

		slot0 = uv0

		uv0:sendNotification(uv2.CHAPTER_TIMESUP)
	end:GetServerTime() > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 36-51, warpins: 1 ---
		slot0.timers[slot1.id] = Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-17, warpins: 1 ---
			uv0()

			slot0 = uv1.timers[uv2.id]

			uv1.timers[uv2.id]:Stop()

			uv1.timers[uv2.id] = nil

			return
			--- END OF BLOCK #0 ---



		end, slot2, 1)
		slot4 = slot0.timers[slot1.id]

		slot0.timers[slot1.id]:Start()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 52-53, warpins: 1 ---
		slot3()
		--- END OF BLOCK #0 ---



	end
end

function slot0.removeChapterListener(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.timers[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-12, warpins: 1 ---
		slot2 = slot0.timers[slot1]

		slot0.timers[slot1]:Stop()

		slot0.timers[slot1] = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-13, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.remove(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.timers) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		slot5:Stop()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-9, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-12, warpins: 1 ---
	slot0.timers = nil

	return
	--- END OF BLOCK #2 ---



end

function slot0.existChapter(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 8-8, warpins: 2 ---
	return slot0.data[slot1] ~= nil
	--- END OF BLOCK #0 ---



end

function slot0.getChapterById(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.data[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-10, warpins: 1 ---
		slot2 = slot0.data[slot1]

		return slot0.data[slot1]:clone()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-27, warpins: 1 ---
		slot3.id = slot1
		slot2 = Chapter.New({})
		slot3 = slot2:getConfig("map")

		if slot2:getConfig("type") == Chapter.CustomFleet then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-33, warpins: 1 ---
			slot5 = slot2
			slot4 = slot2.setEliteFleetList

			if not slot0.mapEliteFleetCache[slot2:getConfig("map")] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 34-40, warpins: 1 ---
				slot6 = {}
				slot6[1] = {}
				slot6[2] = {}
				slot6[3] = {}
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 41-47, warpins: 2 ---
			slot4(slot5, slot6)

			slot5 = slot2
			slot4 = slot2.setEliteCommanders

			if not slot0.mapEliteCommanderCache[slot3] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 48-54, warpins: 1 ---
				slot6 = {}
				slot6[1] = {}
				slot6[2] = {}
				slot6[3] = {}
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 55-67, warpins: 2 ---
			slot4(slot5, slot6)

			slot4 = getProxy(BayProxy)
			slot4 = getProxy(BayProxy):getRawData()

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 68-85, warpins: 0 ---
			for slot8, slot9 in ipairs(slot2:getEliteFleetList()) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 68-68, warpins: 1 ---
				slot10 = #slot9

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 69-71, warpins: 2 ---
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 72-84, warpins: 0 ---
				while slot10 > 0 do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 72-72, warpins: 1 ---
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 73-76, warpins: 1 ---
					if slot4[slot9[slot10]] == nil then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 77-81, warpins: 1 ---
						table.remove(slot9, slot10)
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 82-83, warpins: 2 ---
					slot10 = slot10 - 1
					--- END OF BLOCK #2 ---

					FLOW; TARGET BLOCK #3



					-- Decompilation error in this vicinity:
					--- BLOCK #3 84-84, warpins: 2 ---
					--- END OF BLOCK #3 ---



				end
				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 84-85, warpins: 2 ---
				--- END OF BLOCK #3 ---



			end
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 86-86, warpins: 2 ---
		return slot2
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 87-87, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.addChapter(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	slot2 = slot1:clone()
	slot0.data[slot2.id] = slot2

	slot0:addChapterListener(slot2)

	slot3 = slot0.facade
	slot6.chapter = slot2

	slot0.facade:sendNotification(uv0.CHAPTER_ADDED, {
		dirty = -1
	})

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateChapter(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot3 = slot0.data[slot1.id]
	slot0.data[slot1.id] = slot1:clone()

	if not slot1:inWartime() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-19, warpins: 1 ---
		slot0:removeChapterListener(slot1.id)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-21, warpins: 1 ---
		if not slot3 or slot3.dueTime ~= slot1.dueTime then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-29, warpins: 2 ---
			slot0:addChapterListener(slot1)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 30-47, warpins: 3 ---
	slot4 = slot0.facade
	slot7.chapter = slot1
	slot7.dirty = defaultValue(slot2, 0)

	slot0.facade:sendNotification(uv0.CHAPTER_UPDATED, {})

	if slot0.data[slot1.id] and slot0.data[slot1.id].fleet then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-60, warpins: 1 ---
		slot4 = slot0.data[slot1.id].fleet

		slot0.data[slot1.id].fleet:clearShipHpChange()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 61-61, warpins: 3 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.updateExtraFlag(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if not slot1:updateExtraFlags(slot2, slot3) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-13, warpins: 2 ---
	slot5 = {}

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-20, warpins: 0 ---
	for slot9, slot10 in ipairs(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-18, warpins: 1 ---
		table.insert(slot5, slot10)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 19-20, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 21-31, warpins: 1 ---
	slot0.extraFlagUpdate = true
	slot6 = slot0.facade

	slot0.facade:sendNotification(uv0.CHAPTER_EXTAR_FLAG_UPDATED, slot5)

	return true
	--- END OF BLOCK #3 ---



end

function slot0.extraFlagUpdated(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot0.extraFlagUpdate = false

	return
	--- END OF BLOCK #0 ---



end

function slot0.removeChapter(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.data[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-21, warpins: 1 ---
		slot0:removeChapterListener(slot1)

		slot0.data[slot1] = nil
		slot3 = slot0.facade
		slot6.chapter = slot0.data[slot1]

		slot0.facade:sendNotification(uv0.CHAPTER_REMOVED, {
			dirty = -1
		})
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-22, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.duplicateEliteFleet(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	if slot1:getConfig("type") == Chapter.CustomFleet then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-29, warpins: 1 ---
		slot1:EliteShipTypeFilter()

		slot5 = slot1:getConfig("map")
		slot0.mapEliteFleetCache[slot5] = slot1:getEliteFleetList()
		slot0.mapEliteCommanderCache[slot5] = slot1:getEliteFleetCommanders()

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 30-55, warpins: 0 ---
		for slot9, slot10 in pairs(slot0.data) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-35, warpins: 1 ---
			if slot10:getConfig("map") == slot5 and slot10.configId ~= slot1.configId then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 40-49, warpins: 1 ---
				slot10:setEliteFleetList(slot3)
				slot10:setEliteCommanders(slot4)

				if slot2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 50-53, warpins: 1 ---
					slot0:updateChapter(slot10)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 54-55, warpins: 5 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 56-56, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.getSameMapChapters(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot2 = {}

	if slot1:getConfig("type") == Chapter.CustomFleet then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-17, warpins: 1 ---
		slot3 = slot1:getConfig("map")

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-34, warpins: 0 ---
		for slot7, slot8 in pairs(slot0.data) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-23, warpins: 1 ---
			if slot8:getConfig("map") == slot3 and slot8.configId ~= slot1.configId then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 28-32, warpins: 1 ---
				table.insert(slot2, slot8)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 33-34, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 35-35, warpins: 2 ---
	return slot2
	--- END OF BLOCK #1 ---



end

function slot0.getMaps(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 22-25, warpins: 2 ---
	slot1 = {}
	slot2 = pg.expedition_data_by_map
	slot3 = OPEN_REMASTER and slot0:buildRemasterMaps() or {}
	slot5 = slot0:getActiveChapter() and slot4:getConfig("map")

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 26-45, warpins: 0 ---
	for slot9, slot10 in ipairs(slot2.all) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-28, warpins: 1 ---
		if not slot3[slot10] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-33, warpins: 1 ---
			slot12.id = slot10
			slot11 = Map.New({})
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 34-38, warpins: 2 ---
		if not slot11:isInValidMap() or slot5 == slot11.id then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-43, warpins: 2 ---
			slot1[slot11.id] = slot11
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 44-45, warpins: 3 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 46-58, warpins: 1 ---
	slot6 = getProxy(BayProxy)
	slot7 = getProxy(BayProxy):getRawData()

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 59-167, warpins: 0 ---
	for slot12, slot13 in ipairs(Chapter.bindConfigTable().all) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 59-63, warpins: 1 ---
		if slot1[slot8[slot13].map] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 64-68, warpins: 1 ---
			if slot0.data[slot14.id] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 69-74, warpins: 1 ---
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 75-92, warpins: 0 ---
				for slot20, slot21 in ipairs(slot16:getEliteFleetList()) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 75-75, warpins: 1 ---
					slot22 = #slot21

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 76-78, warpins: 2 ---
					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 79-91, warpins: 0 ---
					while slot22 > 0 do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 79-79, warpins: 1 ---
						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 80-83, warpins: 1 ---
						if slot7[slot21[slot22]] == nil then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 84-88, warpins: 1 ---
							table.remove(slot21, slot22)
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #1 ---

						FLOW; TARGET BLOCK #2



						-- Decompilation error in this vicinity:
						--- BLOCK #2 89-90, warpins: 2 ---
						slot22 = slot22 - 1
						--- END OF BLOCK #2 ---

						FLOW; TARGET BLOCK #3



						-- Decompilation error in this vicinity:
						--- BLOCK #3 91-91, warpins: 2 ---
						--- END OF BLOCK #3 ---



					end
					--- END OF BLOCK #2 ---

					FLOW; TARGET BLOCK #3



					-- Decompilation error in this vicinity:
					--- BLOCK #3 91-92, warpins: 2 ---
					--- END OF BLOCK #3 ---



				end
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 93-95, warpins: 2 ---
			slot17 = nil

			if slot16 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 96-104, warpins: 1 ---
				slot17 = slot16:clone()

				slot0:duplicateEliteFleet(slot16)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 105-109, warpins: 1 ---
				if slot14.model ~= ChapterConst.TypeMainSub then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 110-124, warpins: 1 ---
					slot19.id = slot14.id
					slot17 = Chapter.New({})

					if slot17:getConfig("type") == Chapter.CustomFleet then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 125-131, warpins: 1 ---
						slot19 = slot17
						slot18 = slot17.setEliteFleetList

						if not slot0.mapEliteFleetCache[slot15.configId] then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 132-138, warpins: 1 ---
							slot20 = {}
							slot20[1] = {}
							slot20[2] = {}
							slot20[3] = {}
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 139-146, warpins: 2 ---
						slot18(slot19, slot20)

						slot19 = slot17
						slot18 = slot17.setEliteCommanders

						if not slot0.mapEliteCommanderCache[slot15.configId] then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 147-153, warpins: 1 ---
							slot20 = {}
							slot20[1] = {}
							slot20[2] = {}
							slot20[3] = {}
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #1 ---

						FLOW; TARGET BLOCK #2



						-- Decompilation error in this vicinity:
						--- BLOCK #2 154-154, warpins: 2 ---
						slot18(slot19, slot20)
						--- END OF BLOCK #2 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 155-156, warpins: 4 ---
			if slot17 and slot17:isValid() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 162-165, warpins: 1 ---
				slot15:updateChapter(slot17)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 166-167, warpins: 5 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 168-179, warpins: 1 ---
	slot9 = true
	slot10 = getProxy(PlayerProxy)
	slot11 = getProxy(PlayerProxy):getData()
	slot12 = nil

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 180-276, warpins: 0 ---
	for slot16, slot17 in ipairs(slot2.all) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 180-182, warpins: 1 ---
		if slot1[slot17] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 183-199, warpins: 1 ---
			slot19 = slot1[slot17 + 1]

			slot18:updateChapters(slot12)

			slot20 = slot18:getConfig("level_limit")

			if slot18:getMapType() == Map.SCENARIO then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 210-212, warpins: 3 ---
				slot18.setUnlock(slot18, slot9 and slot18:getConfig("level_limit") <= slot11.level)

				if slot19 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 228-228, warpins: 3 ---
					slot9 = slot18:isClear() and slot19:getConfig("level_limit") <= slot11.level
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 229-233, warpins: 1 ---
					slot9 = slot18:isClear()
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 234-238, warpins: 1 ---
				if slot18:isActivity() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 251-252, warpins: 3 ---
					slot18.setUnlock(slot18, slot20 <= slot11.level and slot18:isAnyChapterUnlocked())
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 261-261, warpins: 2 ---
					slot18.setUnlock(slot18, slot20 <= slot11.level)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 262-268, warpins: 4 ---
			slot12 = slot18

			if slot1[slot18:getBindMap()] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 269-273, warpins: 1 ---
				slot18:setBindMapVO(slot1[slot21])
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 274-274, warpins: 1 ---
			slot12 = nil
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 275-276, warpins: 4 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 277-277, warpins: 1 ---
	return slot1
	--- END OF BLOCK #6 ---



end

function slot0.getActiveChapter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-12, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.data) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		if slot5.active then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-10, warpins: 1 ---
			return slot5:clone()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-12, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 13-13, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.getNonActActiveChapter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-17, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.data) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-9, warpins: 1 ---
		if not slot5:isActivity() and slot5.active then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-15, warpins: 1 ---
			return slot5:clone()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-17, warpins: 4 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-18, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.getActActiveChapter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-17, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.data) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-9, warpins: 1 ---
		if slot5:isActivity() and slot5.active then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-15, warpins: 1 ---
			return slot5:clone()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-17, warpins: 4 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-18, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.getUnlockActMapBytype(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot4 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-27, warpins: 0 ---
	for slot9, slot10 in pairs(slot0:getMaps()) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-14, warpins: 1 ---
		if slot10:getConfig("type") == slot1 and slot10:getConfig("on_activity") == slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-25, warpins: 1 ---
			table.insert(slot4, slot10)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 26-27, warpins: 4 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-31, warpins: 1 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 32-39, warpins: 0 ---
	for slot9, slot10 in ipairs(slot4) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-36, warpins: 1 ---
		if slot10:getActiveChapter() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 37-37, warpins: 1 ---
			return slot10
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 38-39, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 40-43, warpins: 1 ---
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 44-49, warpins: 0 ---
	for slot9, slot10 in ipairs(slot4) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-46, warpins: 1 ---
		if slot10.id == slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 47-47, warpins: 1 ---
			return slot10
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 48-49, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 50-53, warpins: 1 ---
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 54-71, warpins: 0 ---
	for slot9, slot10 in ipairs(slot4) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-58, warpins: 1 ---
		if slot5[slot10.id - 1] and slot11:isClearForActivity() and slot10:isUnlock() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 69-69, warpins: 1 ---
			return slot10
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 70-71, warpins: 4 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 72-79, warpins: 1 ---
	table.sort(slot4, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 2 ---
		return slot0.id < slot1.id
		--- END OF BLOCK #0 ---



	end)

	return slot4[1]
	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 80-80, warpins: 2 ---
	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 81-81, warpins: 2 ---
	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 82-82, warpins: 2 ---
	--- END OF BLOCK #11 ---



end

function slot0.getLastMapForActivity(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot1 = getProxy(ChapterProxy)
	slot2, slot3 = nil

	if slot1:getActActiveChapter() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-16, warpins: 1 ---
		slot2 = slot1.id
		slot3 = slot1:getConfig("map")
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-24, warpins: 1 ---
		slot4 = slot0:getMaps()

		function slot5(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-18, warpins: 2 ---
			slot2 = getProxy(ActivityProxy)

			return slot2:getActivityById(slot0:getConfig("on_activity")) and not slot2:isEnd()
			--- END OF BLOCK #0 ---



		end

		if Map.lastMapForActivity and slot4[Map.lastMapForActivity] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-37, warpins: 1 ---
			slot6 = slot4[Map.lastMapForActivity]

			if slot4[Map.lastMapForActivity]:isActivity() and function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 18-18, warpins: 2 ---
				slot2 = getProxy(ActivityProxy)

				return slot2:getActivityById(slot0:getConfig("on_activity")) and not slot2:isEnd()
				--- END OF BLOCK #0 ---



			end(slot4[Map.lastMapForActivity]) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 45-47, warpins: 1 ---
				slot3 = Map.lastMapForActivity
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 48-51, warpins: 4 ---
			if Map.lastMapForActivity then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 52-60, warpins: 1 ---
				Map.lastMapForActivity = nil

				slot0:recordLastMap(uv0.LAST_MAP_FOR_ACTIVITY, 0)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 61-77, warpins: 2 ---
			slot6 = getProxy(ActivityProxy)
			slot6 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT)

			table.sort(slot6, function (slot0, slot1)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-8, warpins: 2 ---
				return slot0.id < slot1.id
				--- END OF BLOCK #0 ---



			end)

			if #slot6 > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 78-82, warpins: 1 ---
				_.each(slot6, function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-15, warpins: 1 ---
					if _.all(_.select(_.values(uv0), function (slot0)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 12-12, warpins: 2 ---
						return slot0:getConfig("on_activity") == uv0.id
						--- END OF BLOCK #0 ---



					end), function (slot0)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 17-17, warpins: 3 ---
						return slot0:isActivity() and slot0:getConfig("type") == Map.EVENT
						--- END OF BLOCK #0 ---



					end) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 16-21, warpins: 1 ---
						_.each(slot1, function (slot0)

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-5, warpins: 1 ---
							if slot0:isUnlock() then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 6-7, warpins: 1 ---
								uv0 = slot0.id
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 8-8, warpins: 2 ---
							return
							--- END OF BLOCK #1 ---



						end)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 22-28, warpins: 1 ---
						if _.any(slot1, function (slot0)

							-- Decompilation error in this vicinity:
							--- BLOCK #0 17-17, warpins: 3 ---
							return slot0:getConfig("type") == Map.ACTIVITY_EASY and not slot0:isClearForActivity()
							--- END OF BLOCK #0 ---



						end) then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 29-34, warpins: 1 ---
							_.each(slot1, function (slot0)

								-- Decompilation error in this vicinity:
								--- BLOCK #0 1-8, warpins: 1 ---
								if slot0:getConfig("type") == Map.ACTIVITY_EASY and slot0:isUnlock() then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 14-15, warpins: 1 ---
									uv0 = slot0.id
									--- END OF BLOCK #0 ---



								end

								--- END OF BLOCK #0 ---

								FLOW; TARGET BLOCK #1



								-- Decompilation error in this vicinity:
								--- BLOCK #1 16-16, warpins: 3 ---
								return
								--- END OF BLOCK #1 ---



							end)
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 35-39, warpins: 1 ---
							_.each(slot1, function (slot0)

								-- Decompilation error in this vicinity:
								--- BLOCK #0 1-8, warpins: 1 ---
								if slot0:getConfig("type") == Map.ACTIVITY_HARD and slot0:isUnlock() then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 14-15, warpins: 1 ---
									uv0 = slot0.id
									--- END OF BLOCK #0 ---



								end

								--- END OF BLOCK #0 ---

								FLOW; TARGET BLOCK #1



								-- Decompilation error in this vicinity:
								--- BLOCK #1 16-16, warpins: 3 ---
								return
								--- END OF BLOCK #1 ---



							end)
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 40-41, warpins: 3 ---
					return
					--- END OF BLOCK #1 ---



				end)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 83-84, warpins: 2 ---
			if not slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 85-93, warpins: 1 ---
				slot10[2] = {
					"config_data"
				}
				slot3 = checkExist(slot6, {
					1
				}, {
					"getConfig"
				}, {
					1
				})
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 94-94, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 95-98, warpins: 2 ---
	return slot3, slot2
	--- END OF BLOCK #1 ---



end

function slot0.inWarTime(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if slot0:getActiveChapter() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-8, warpins: 1 ---
		return slot1:inWartime()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-9, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.isInVaildFleet(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if slot0:getActiveChapter() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-11, warpins: 1 ---
		slot2 = slot1.fleet
		slot2 = not slot1.fleet:isValid()

		if not slot1.fleet:isValid() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-13, warpins: 0 ---
			slot2 = false
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-14, warpins: 1 ---
		slot2 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-15, warpins: 3 ---
	return slot2
	--- END OF BLOCK #1 ---



end

function slot0.checkNextFleet(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-21, warpins: 2 ---
	return slot1.fleet:isValid() or slot1:getNextValidIndex() <= 0
	--- END OF BLOCK #1 ---



end

function slot0.inChapterLine(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if slot0:getActiveChapter() and slot2.fleet.line.row == slot1.row and slot2.fleet.line.column == slot1.column then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-20, warpins: 1 ---
		if slot1.attachment and slot1.flag then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-27, warpins: 1 ---
			return slot0:getChapterCell(slot1)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 28-29, warpins: 3 ---
		return true
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 30-30, warpins: 4 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.getChapterCell(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if slot0:getActiveChapter() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-22, warpins: 2 ---
		return slot2:getChapterCell(slot1.row, slot1.column).attachment == slot1.attachment and slot3.flag == slot1.flag
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 23-23, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.updateActiveChapterShips(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-14, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.data) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		if slot5.active then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-12, warpins: 1 ---
			_.each(slot5.fleets, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				slot0:flushShips()

				return
				--- END OF BLOCK #0 ---



			end)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-14, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-15, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.resetRepairTimes(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot0.repairTimes = 0

	return
	--- END OF BLOCK #0 ---



end

function slot0.getUseableEliteMap(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot2 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-25, warpins: 0 ---
	for slot6, slot7 in pairs(slot0:getMaps()) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-15, warpins: 1 ---
		if slot7:getMapType() == Map.ELITE and slot7:isEliteEnabled() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-23, warpins: 1 ---
			slot2[#slot2 + 1] = slot7
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 24-25, warpins: 4 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 26-26, warpins: 1 ---
	return slot2
	--- END OF BLOCK #2 ---



end

function slot0.getUseableActivityMap(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot2 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-20, warpins: 0 ---
	for slot6, slot7 in pairs(slot0:getMaps()) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-15, warpins: 1 ---
		if slot7:getMapType() == Map.ACTIVITY_HARD then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-18, warpins: 1 ---
			slot2[#slot2 + 1] = slot7
			--- END OF BLOCK #0 ---



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
	return slot2
	--- END OF BLOCK #2 ---



end

function slot0.getUseableMaxEliteMap(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	if #slot0:getUseableEliteMap() == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-8, warpins: 1 ---
		return false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-16, warpins: 1 ---
	table.sort(slot1, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 2 ---
		return slot1.configId < slot0.configId
		--- END OF BLOCK #0 ---



	end)

	return slot1[1]
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-17, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

function slot0.eliteFleetRecommend(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot3 = getProxy(BayProxy)
	slot4 = slot1:getEliteFleetList()[slot2]
	slot6 = {}
	slot7 = {}
	slot8 = {
		0,
		0,
		0
	}

	if slot1:getConfig("limitation")[slot2] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-25, warpins: 1 ---
		slot6 = Clone(slot5[1])
		slot7 = Clone(slot5[2])
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 26-38, warpins: 2 ---
	slot9 = getProxy(BayProxy)
	slot9 = slot9:getRawData()
	slot10 = {}

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 39-49, warpins: 0 ---
	for slot14, slot15 in ipairs(slot1:getEliteFleetList()) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-42, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 43-47, warpins: 0 ---
		for slot19, slot20 in ipairs(slot15) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 43-45, warpins: 1 ---
			slot10[#slot10 + 1] = slot20
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 46-47, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 48-49, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 50-63, warpins: 1 ---
	slot11 = {}
	slot11[TeamType.Main] = slot6
	slot11[TeamType.Vanguard] = slot7
	slot11[TeamType.Submarine] = slot8

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 64-100, warpins: 0 ---
	for slot15, slot16 in ipairs(slot4) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 85-88, warpins: 2 ---
		slot18 = slot9[slot16]:getShipType()
		slot20 = 0
		slot21 = nil
		slot20 = table.contains(slot11[pg.ship_data_by_type[slot18].team_type], slot18) and slot18 or 0

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 89-98, warpins: 0 ---
		for slot25, slot26 in ipairs(slot21) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 89-90, warpins: 1 ---
			if slot26 == slot20 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 91-96, warpins: 1 ---
				table.remove(slot21, slot25)

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 97-97, warpins: 1 ---
				break
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 97-98, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 99-100, warpins: 3 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 101-104, warpins: 1 ---
	function slot12(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot1 = uv0

		if slot1:getEliteRecommendShip(slot0, uv1) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-19, warpins: 1 ---
			slot2 = slot1.id
			uv1[#uv1 + 1] = slot2
			uv2[#uv2 + 1] = slot2
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
		--- BLOCK #0 108-111, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 112-142, warpins: 0 ---
		for slot16, slot17 in ipairs(slot6) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 112-117, warpins: 1 ---
			slot18 = nil

			if type(slot17) == "string" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 118-124, warpins: 1 ---
				slot18 = Clone(ShipType.BundleList[slot17])
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 125-129, warpins: 1 ---
				if type(slot17) == "number" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 130-131, warpins: 1 ---
					if slot17 == 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 132-134, warpins: 1 ---
						slot18 = TeamType.MainShipType
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 135-137, warpins: 1 ---
						slot19[1] = slot17
						slot18 = {}
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 138-140, warpins: 4 ---
			slot12(slot18)
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 141-142, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 143-146, warpins: 1 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 147-177, warpins: 0 ---
		for slot16, slot17 in ipairs(slot7) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 147-152, warpins: 1 ---
			slot18 = nil

			if type(slot17) == "string" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 153-159, warpins: 1 ---
				slot18 = Clone(ShipType.BundleList[slot17])
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 160-164, warpins: 1 ---
				if type(slot17) == "number" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 165-166, warpins: 1 ---
					if slot17 == 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 167-169, warpins: 1 ---
						slot18 = TeamType.VanguardShipType
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 170-172, warpins: 1 ---
						slot19[1] = slot17
						slot18 = {}
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 173-175, warpins: 4 ---
			slot12(slot18)
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 176-177, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 178-178, warpins: 1 ---
		--- END OF BLOCK #4 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 179-182, warpins: 2 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 183-213, warpins: 0 ---
		for slot16, slot17 in ipairs(slot8) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 183-188, warpins: 1 ---
			slot18 = nil

			if type(slot17) == "string" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 189-195, warpins: 1 ---
				slot18 = Clone(ShipType.BundleList[slot17])
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 196-200, warpins: 1 ---
				if type(slot17) == "number" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 201-202, warpins: 1 ---
					if slot17 == 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 203-205, warpins: 1 ---
						slot18 = TeamType.SubShipType
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 206-208, warpins: 1 ---
						slot19[1] = slot17
						slot18 = {}
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 209-211, warpins: 4 ---
			slot12(slot18)
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 212-213, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 214-215, warpins: 2 ---
	return
	--- END OF BLOCK #6 ---



end

function slot0.isClear(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 10-10, warpins: 2 ---
	return slot0:getChapterById(slot1) and slot2:isClear()
	--- END OF BLOCK #0 ---



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
	slot3 = slot0.facade
	slot6.shamChapter = slot1:clone()
	slot6.dirty = defaultValue(slot2, 0)

	slot3:sendNotification(uv0.SHAM_CHAPTER_UPDATED, {})

	slot3 = slot0.shamChapter.fleet

	slot3:clearShipHpChange()

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateShamChapterShips(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = slot0.shamChapter

	slot1:flushShips()

	return
	--- END OF BLOCK #0 ---



end

function slot0.localSaveShamChapter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = slot0.shamChapter

	slot1:localSaveChapter()

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
	slot1 = slot0.shamChapter

	slot1:localLoadChapter()

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
	slot1 = slot0.guildChapter

	slot1:localLoadChapter()

	return
	--- END OF BLOCK #0 ---



end

function slot0.localSaveGuildChapter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = slot0.guildChapter

	slot1:localSaveChapter()

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateGuildChapter(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	slot0.guildChapter = slot1
	slot3 = slot0.facade
	slot6.guildChapter = slot1:clone()
	slot6.dirty = defaultValue(slot2, 0)

	slot3:sendNotification(uv0.GUILD_CHAPTER_UPDATED, {})

	slot3 = slot0.guildChapter.fleet

	slot3:clearShipHpChange()

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateGuildChapterShips(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.guildChapter then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot1 = slot0.guildChapter

		slot1:flushShips()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-8, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.recordLastMap(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = false

	if slot1 == uv0.LAST_MAP_FOR_ACTIVITY then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-9, warpins: 1 ---
		Map.lastMapForActivity = slot2
		slot3 = true
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-13, warpins: 1 ---
		if slot1 == uv0.LAST_MAP and slot2 ~= Map.lastMap then

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
		slot4 = getProxy(PlayerProxy)

		PlayerPrefs.SetInt(slot1 .. slot4:getRawData().id, slot2)
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
	slot2 = getProxy(PlayerProxy)

	if PlayerPrefs.GetInt(slot1 .. slot2:getRawData().id) ~= 0 then

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

	if slot1 == uv0.LAST_MAP_FOR_ACTIVITY then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-9, warpins: 1 ---
		Map.lastMapForActivity = slot2
		slot3 = true
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-13, warpins: 1 ---
		if slot1 == uv0.LAST_MAP and slot2 ~= Map.lastMap then

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
		slot4 = getProxy(PlayerProxy)

		PlayerPrefs.SetInt(slot1 .. slot4:getRawData().id, slot2)
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
	slot2 = getProxy(PlayerProxy)

	if PlayerPrefs.GetInt(slot1 .. slot2:getRawData().id) ~= 0 then

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
		for slot11, slot12 in pairs(slot6:getEliteFleetCommanders()) do

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
			for slot12, slot13 in pairs(slot7:getEliteFleetCommanders()) do

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
			for slot13, slot14 in pairs(slot8:getEliteFleetCommanders()) do

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
		--- BLOCK #0 15-15, warpins: 3 ---
		return slot0:getFleetType() == FleetType.Submarine and slot0:isValid()
		--- END OF BLOCK #0 ---



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
				--- BLOCK #0 9-9, warpins: 2 ---
				return slot0.id == ChapterConst.StrategyCallSubOutofRange
				--- END OF BLOCK #0 ---



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
		slot5 = getProxy(PlayerProxy)
		slot6 = slot5:getRawData()
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
	--- BLOCK #1 17-17, warpins: 2 ---
	return slot0.skipPrecombat > 0 and true or false
	--- END OF BLOCK #1 ---



end

function slot0.UpdateSkipPrecombat(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 9-13, warpins: 2 ---
	if (tobool(slot1) and 1 or 0) ~= slot0:GetSkipPrecombat() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-19, warpins: 1 ---
		PlayerPrefs.SetInt("chapter_skip_precombat", slot2)

		slot0.skipPrecombat = slot2
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
