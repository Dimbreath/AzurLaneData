slot0 = class("LevelMediator2", import("..base.ContextMediator"))
slot0.ON_TRACKING = "LevelMediator2:ON_TRACKING"
slot0.ON_ELITE_TRACKING = "LevelMediator2:ON_ELITE_TRACKING"
slot0.ON_UPDATE_CUSTOM_FLEET = "LevelMediator2:ON_UPDATE_CUSTOM_FLEET"
slot0.ON_OP = "LevelMediator2:ON_OP"
slot0.ON_STAGE = "LevelMediator2:ON_STAGE"
slot0.ON_PVP = "LevelMediator2:ON_PVP"
slot0.ON_GO_TO_TASK_SCENE = "LevelMediator2:ON_GO_TO_TASK_SCENE"
slot0.ON_OPEN_EVENT_SCENE = "LevelMediator2:ON_OPEN_EVENT_SCENE"
slot0.ON_DAILY_LEVEL = "LevelMediator2:ON_DAILY_LEVEL"
slot0.ON_OPEN_MILITARYEXERCISE = "LevelMediator2:ON_OPEN_MILLITARYEXERCISE"
slot0.ON_OVERRIDE_CHAPTER = "LevelMediator2:ON_OVERRIDE_CHAPTER"
slot0.ON_TIME_UP = "LevelMediator2:ON_TIME_UP"
slot0.ON_EVENT_LIST_UPDATE = "LevelMediator2:ON_EVENT_LIST_UPDATE"
slot0.ON_OPEN_SHAM = "LevelMediator2:ON_OPEN_SHAM"
slot0.ON_OPEN_SHAM_PRE_COMABT = "LevelMediator2:ON_OPEN_SHAM_PRE_COMABT"
slot0.ON_OPEN_SHAM_SHOP = "LevelMediator2.ON_OPEN_SHAM_SHOP"
slot0.ON_START = "ON_START"
slot0.ON_PERFORM_COMBAT = "LevelMediator2.ON_PERFORM_COMBAT"
slot0.ON_ELITE_OEPN_DECK = "LevelMediator2:ON_ELITE_OEPN_DECK"
slot0.ON_ELITE_CLEAR = "LevelMediator2:ON_ELITE_CLEAR"
slot0.ON_ELITE_RECOMMEND = "LevelMediator2:ON_ELITE_RECOMMEND"
slot0.ON_ACTIVITY_MAP = "LevelMediator2:ON_ACTIVITY_MAP"
slot0.ON_SWITCH_ACT_MAP = "LevelMediator2:ON_SWITCH_ACT_MAP"
slot0.ON_SWITCH_BIND_ACT_MAP = "LevelMediator2 ON_SWITCH_BIND_ACT_MAP"
slot0.GO_ACT_SHOP = "LevelMediator2:GO_ACT_SHOP"
slot0.ON_SWITCH_NORMAL_MAP = "LevelMediator2:ON_SWITCH_NORMAL_MAP"
slot0.NOTICE_AUTOBOT_ENABLED = "LevelMediator2:NOTICE_AUTOBOT_ENABLED"
slot0.ON_OPEN_GUILD_PRE_COMABT = "LevelMediator2:ON_OPEN_GUILD_PRE_COMABT"
slot0.ON_ENTER_EXTRA_CHAPTER = "LevelMediator2:ON_ENTER_EXTRA_CHAPTER"
slot0.ON_EXTRA_RANK = "LevelMediator2:ON_EXTRA_RANK"
slot0.ON_FETCH_SUB_CHAPTER = "LevelMediator2:ON_FETCH_SUB_CHAPTER"
slot0.ON_REFRESH_SUB_CHAPTER = "LevelMediator2:ON_REFRESH_SUB_CHAPTER"
slot0.ON_STRATEGYING_CHAPTER = "LevelMediator2:ON_STRATEGYING_CHAPTER"
slot0.ON_SELECT_COMMANDER = "LevelMediator2:ON_SELECT_COMMANDER"
slot0.ON_STOP_REMIND_OPERATION = "LevelMediator2:ON_STOP_REMIND_OPERATION"
slot0.ON_SELECT_ELITE_COMMANDER = "LevelMediator2:ON_SELECT_ELITE_COMMANDER"
slot0.ON_COMMANDER_SKILL = "LevelMediator2:ON_COMMANDER_SKILL"
slot0.ON_ACTIVATE_REMASTER = "LevelMediator2:ON_ACTIVATE_REMASTER"
slot0.ON_SHIP_DETAIL = "LevelMediator2:ON_SHIP_DETAIL"
slot0.ON_CLICK_RECEIVE_REMASTER_TICKETS_BTN = "LevelMediator2:ON_CLICK_RECEIVE_REMASTER_TICKETS_BTN"
slot0.GET_REMASTER_TICKETS_DONE = "LevelMediator2:GET_REMASTER_TICKETS_DONE"
slot0.ON_FLEET_SHIPINFO = "LevelMediator2:ON_FLEET_SHIPINFO"
slot0.ON_COMMANDER_OP = "LevelMediator2:ON_COMMANDER_OP"
slot0.CLICK_CHALLENGE_BTN = "LevelMediator2:CLICK_CHALLENGE_BTN"
slot0.ON_SUBMIT_TASK = "LevelMediator2:ON_SUBMIT_TASK"
slot0.ON_VOTE_BOOK = "LevelMediator2:ON_VOTE_BOOK"
slot0.GET_CHAPTER_DROP_SHIP_LIST = "LevelMediator2:GET_CHAPTER_DROP_SHIP_LIST"

function slot0.register(slot0)
	slot1 = getProxy(PlayerProxy)

	slot0:bind(slot0.GET_CHAPTER_DROP_SHIP_LIST, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.GET_CHAPTER_DROP_SHIP_LIST, {
			chapterId = slot1,
			callback = slot2
		})
	end)
	slot0:bind(slot0.ON_VOTE_BOOK, function (slot0)
		slot0:addSubLayers(Context.New({
			mediator = VoteOrderBookMediator,
			viewComponent = VoteOrderBookLayer
		}))
	end)
	slot0:bind(slot0.ON_COMMANDER_OP, function (slot0, slot1, slot2)
		slot0.contextData.commanderOPChapter = slot2

		slot0:sendNotification(GAME.COMMANDER_FORMATION_OP, {
			data = slot1
		})
	end)
	slot0:bind(slot0.ON_SELECT_COMMANDER, function (slot0, slot1, slot2, slot3)
		FormationMediator.onSelectCommander(slot1, slot2)

		slot0.contextData.selectedChapterVO = slot3
	end)
	slot0:bind(slot0.ON_SELECT_ELITE_COMMANDER, function (slot0, slot1, slot2, slot3)
		slot4 = getProxy(ChapterProxy)
		slot5 = slot3.id
		slot0.contextData.editEliteChapter = slot3
		slot6 = slot3:getEliteFleetCommanders()[slot1] or {}
		slot7 = nil

		if slot6[slot2] then
			slot7 = getProxy(CommanderProxy):getCommanderById(slot6[slot2])
		end

		function slot8()
			if slot0.contextData.editEliteChapter then
				slot1.eliteCommanderList = slot1:getChapterById(slot0).eliteCommanderList
				slot0.contextData.editEliteChapter = slot0.contextData
			end
		end

		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMMANDROOM, {
			maxCount = 1,
			mode = CommandRoomScene.MODE_SELECT,
			activeCommander = slot7,
			ignoredIds = {},
			onCommander = function (slot0)
				return true
			end,
			onSelected = function (slot0, slot1)
				slot0:sendNotification(GAME.SELECT_ELIT_CHAPTER_COMMANDER, {
					chapterId = slot1,
					index = slot2,
					pos = slot3,
					commanderId = slot0[1],
					callback = function ()
						slot0()
						slot1()
					end
				})
			end,
			onQuit = function (slot0)
				slot0:sendNotification(GAME.SELECT_ELIT_CHAPTER_COMMANDER, {
					chapterId = slot1,
					index = slot2,
					pos = slot3,
					callback = function ()
						slot0()
						slot1()
					end
				})
			end
		})
	end)
	slot0:bind(slot0.ON_TRACKING, function (slot0, slot1, slot2, slot3)
		slot0:setFlag("lastFleetIndex", slot2)
		slot1:sendNotification(GAME.TRACKING, {
			chapterId = slot1,
			fleetIds = slot2,
			operationItem = itemID,
			loopFlag = slot3
		})
		slot1.viewComponent:updateLastFleet(slot0:getFlag("lastFleetIndex"))
	end)
	slot0:bind(slot0.ON_UPDATE_CUSTOM_FLEET, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.UPDATE_CUSTOM_FLEET, {
			chapterId = slot1,
			callback = slot2
		})
	end)
	slot0:bind(slot0.ON_ELITE_TRACKING, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.TRACKING, {
			chapterId = slot1,
			loopFlag = slot2
		})
	end)
	slot0:bind(slot0.ON_OP, function (slot0, slot1)
		if slot0.contextData.chapterVO.getDataType(slot2) == ChapterConst.TypeSham then
			slot0:sendNotification(GAME.SHAM_OP, slot1)
		elseif slot3 == ChapterConst.TypeNone then
			slot0:sendNotification(GAME.CHAPTER_OP, slot1)
		elseif slot3 == ChapterConst.TypeGuild then
			slot0:sendNotification(GAME.GUILD_OP, slot1)
		end
	end)
	slot0:bind(slot0.ON_SWITCH_NORMAL_MAP, function (slot0)
		slot1 = nil

		if Map.lastMap and slot0.viewComponent.maps[Map.lastMap] and not slot0.viewComponent.maps[Map.lastMap]:isEscort() then
			slot1 = Map.lastMap
		else
			for slot5, slot6 in pairs(slot0.viewComponent.maps) do
				if slot6:isUnlock() and slot6:getMapType() == Map.SCENARIO then
					slot1 = slot6.id
				end
			end
		end

		if slot1 then
			slot0.viewComponent:setMap(slot1)
		end
	end)
	slot0:bind(slot0.ON_STAGE, function (slot0)
		slot0:addSubLayers(Context.New({
			mediator = ChapterPreCombatMediator,
			viewComponent = ChapterPreCombatLayer,
			onRemoved = function ()
				slot0.viewComponent:onSubLayerClose()
			end
		}), false, function ()
			slot0.viewComponent:onSubLayerOpen()
		end)
	end)
	slot0:bind(slot0.ON_PVP, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			mediator = RivalInfoMediator,
			viewComponent = RivalInfoLayer,
			data = {
				rival = slot1,
				type = RivalInfoLayer.TYPE_SHAM
			},
			onRemoved = function ()
				slot0.viewComponent:onSubLayerClose()
			end
		}), false, function ()
			slot0.viewComponent:onSubLayerOpen()
		end)
	end)
	slot0:bind(slot0.ON_OPEN_MILITARYEXERCISE, function ()
		if getProxy(ActivityProxy):getMilitaryExerciseActivity() then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.MILITARYEXERCISE)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_notStartOrEnd"))
		end
	end)
	slot0:bind(slot0.CLICK_CHALLENGE_BTN, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.CHALLENGE_MAIN_SCENE)
	end)
	slot0:bind(slot0.ON_DAILY_LEVEL, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.DAILYLEVEL)
	end)
	slot0:bind(slot0.ON_GO_TO_TASK_SCENE, function ()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.TASK)
	end)
	slot0:bind(slot0.ON_OPEN_EVENT_SCENE, function ()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.EVENT)
	end)
	slot0:bind(slot0.ON_OPEN_SHAM, function ()
		if getProxy(ChapterProxy).getShamChapter(slot0).active then
			slot0.viewComponent:switchToChapter(slot1)
		else
			slot0.viewComponent:emit(slot1.ON_OPEN_SHAM_PRE_COMABT)
		end
	end)
	slot0:bind(slot0.ON_OPEN_SHAM_PRE_COMABT, function (slot0)
		slot0:addSubLayers(Context.New({
			mediator = ShamPreCombatMediator,
			viewComponent = ShamPreCombatLayer,
			data = {
				shamChapter = getProxy(ChapterProxy).getShamChapter(slot1)
			},
			onRemoved = function ()
				slot0.viewComponent:onSubLayerClose()
			end
		}), false, function ()
			slot0.viewComponent:onSubLayerOpen()
		end)
	end)
	slot0:bind(slot0.ON_OVERRIDE_CHAPTER, function ()
		slot2 = getProxy(ChapterProxy)

		if slot0.contextData.chapterVO.getDataType(slot0) == ChapterConst.TypeSham then
			slot2:updateShamChapter(slot0)
		elseif slot1 == ChapterConst.TypeNone then
			slot2:updateChapter(slot0)
		elseif slot1 == ChapterConst.TypeGuild then
			slot2:updateGuildChapter(slot0)
		end
	end)
	slot0:bind(slot0.ON_TIME_UP, function ()
		slot0:onTimeUp()
	end)
	slot0:bind(slot0.ON_EVENT_LIST_UPDATE, function ()
		slot0:OnEventUpdate()
	end)
	slot0:bind(slot0.ON_ELITE_CLEAR, function (slot0, slot1)
		slot1.chapterVO.clearEliterFleetByIndex(slot3, slot2)

		slot4 = getProxy(ChapterProxy)

		slot4:updateChapter(slot3)
		slot4:duplicateEliteFleet(slot3, true)
		slot0:duplicateEliteFleet(slot3)
		slot0.viewComponent.levelFleetView:setOnHard(slot1.chapterVO)
	end)
	slot0:bind(slot0.NOTICE_AUTOBOT_ENABLED, function (slot0, slot1)
		slot0:sendNotification(GAME.COMMON_FLAG, {
			flagID = BATTLE_AUTO_ENABLED
		})
	end)
	slot0:bind(slot0.ON_ELITE_RECOMMEND, function (slot0, slot1)
		slot4 = getProxy(ChapterProxy)

		slot4:eliteFleetRecommend(slot3, slot2)
		slot4:updateChapter(slot3)
		slot4:duplicateEliteFleet(slot3, true)
		slot0:duplicateEliteFleet(slot3)
		slot0.viewComponent.levelFleetView:setOnHard(slot1.chapterVO)
	end)
	slot0:bind(slot0.ON_ELITE_OEPN_DECK, function (slot0, slot1)
		slot2 = slot1.shipType
		slot3 = slot1.fleetIndex
		slot4 = slot1.shipVO
		slot5 = slot1.fleet
		slot6 = slot1.chapter
		slot7 = slot1.teamType
		slot10 = {}

		for slot14, slot15 in pairs(slot9) do
			if slot15:getTeamType() ~= slot7 then
				table.insert(slot10, slot14)
			elseif type(slot2) == "number" then
				if slot2 ~= 0 and not table.contains({
					slot2
				}, slot15:getShipType()) then
					table.insert(slot10, slot14)
				end
			elseif type(slot2) == "string" and not table.contains(Clone(ShipType.BundleList[slot2]), slot15:getShipType()) then
				table.insert(slot10, slot14)
			end
		end

		slot11, slot12 = nil

		if slot4 == nil then
			slot11 = false
			slot12 = nil
		else
			slot11 = true
			slot12 = slot4.id
		end

		slot0.contextData.editEliteChapter = slot6
		slot21.onShip, slot21.confirmSelect, slot21.onSelected = slot0:getDockCallbackFuncs(slot5, slot4, slot6, slot3)

		slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMin = 0,
			skipSelect = true,
			selectedMax = 1,
			ignoredIds = slot10,
			activeShipId = slot12,
			leastLimitMsg = i18n("ship_formationMediator_leastLimit"),
			quitTeam = slot11,
			leftTopInfo = i18n("word_formation"),
			onShip = slot14,
			confirmSelect = slot15,
			onSelected = slot16,
			flags = {
				inAdmiral = false,
				inEvent = true,
				inFleet = false,
				inClass = false,
				inTactics = false,
				inBackyard = false,
				inElite = slot6.id
			}
		})
	end)
	slot0:bind(slot0.ON_ACTIVITY_MAP, function ()
		slot1, slot2 = getProxy(ChapterProxy).getLastMapForActivity(slot0)
		slot3 = slot1 and getProxy(ActivityProxy):getActivityById(pg.expedition_data_by_map[slot1].on_activity)

		if not slot3 or slot3:isEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		slot0.viewComponent:setMap(slot1)

		if slot2 then
			slot0.viewComponent:switchToChapter(slot0:getChapterById(slot2))
		end
	end)
	slot0:bind(slot0.ON_SWITCH_ACT_MAP, function (slot0, slot1, slot2)
		if getProxy(ChapterProxy):getUnlockActMapBytype(slot2, slot1) then
			slot0.viewComponent:setMap(slot3.id)
		end
	end)
	slot0:bind(slot0.ON_SWITCH_BIND_ACT_MAP, function (slot0, slot1, slot2)
		if getProxy(ChapterProxy):getBindActMapBytype(slot0.contextData.map, slot2, slot1) then
			slot0.viewComponent:setMap(slot3.id)
		end
	end)
	slot0:bind(slot0.ON_OPEN_SHAM_SHOP, function ()
		if getProxy(ShopsProxy).getShamShop(slot0):isOpen() then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, {
				warp = NewShopsScene.TYPE_SHAM_SHOP
			})
		end
	end)
	slot0:bind(slot0.ON_OPEN_GUILD_PRE_COMABT, function ()
		slot0 = getProxy(ChapterProxy)

		slot0:addSubLayers(Context.New({
			mediator = GuildPreCombatMediator,
			viewComponent = GuildPreCombatLayer,
			data = {
				guildChapter = slot0:getGuildChapter()
			},
			onRemoved = function ()
				slot0.viewComponent:onSubLayerClose()
			end
		}), false, function ()
			slot0.viewComponent:onSubLayerOpen()
		end)
	end)
	slot0:bind(slot0.GO_ACT_SHOP, function ()
		slot0, slot1 = nil
		slot2 = {}
		slot3 = pg.gameset.activity_res_id.key_value

		if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY) and slot4:getConfig("config_client").resId == slot3 and not slot4:isEnd() then
			slot0:addSubLayers(Context.New({
				mediator = LotteryMediator,
				viewComponent = LotteryLayer,
				data = {
					activityId = slot4.id
				},
				onRemoved = function ()
					slot0.viewComponent:onSubLayerClose()
				end
			}), false, function ()
				slot0.viewComponent:onSubLayerOpen()
			end)
		else
			slot0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, {
				warp = NewShopsScene.TYPE_ACTIVITY,
				actId = _.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP), function (slot0)
					return slot0:getConfig("config_client").pt_id == slot0
				end).id
			})
		end
	end)
	slot0:bind(slot0.ON_SHIP_DETAIL, function (slot0, slot1)
		slot0.contextData.selectedChapterVO = slot1.chapter

		slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = slot1.id
		})
	end)
	slot0:bind(slot0.ON_FLEET_SHIPINFO, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = slot1.shipId,
			shipVOs = slot1.shipVOs
		})

		slot0.contextData.editEliteChapter = slot1.chapter
	end)
	slot0:bind(slot0.ON_ENTER_EXTRA_CHAPTER, function (slot0)
		if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT) and not slot1:isEnd() then
			slot2 = getProxy(ChapterProxy)

			if ActivityLevelConst.hasExtraMap(ActivityLevelConst.getMapsByActivityType(slot0.viewComponent.maps, slot1:getConfig("type"))) and ActivityLevelConst.canSwitchToEx(slot2:getMaps(), slot4) then
				slot0.viewComponent:setMap(slot2:getUnlockActMapBytype(Map.ACT_EXTRA, slot4:getConfig("on_activity"), PlayerPrefs.HasKey("ex_mapId") and PlayerPrefs.GetInt("ex_mapId")).id)

				if slot6:getActiveChapter() then
					slot0.viewComponent:switchToChapter(slot7)
				end
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock"))
			end
		end
	end)
	slot0:bind(slot0.ON_EXTRA_RANK, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {
			page = PowerRank.TYPE_EXTRA_CHAPTER
		})
	end)
	slot0:bind(slot0.ON_REFRESH_SUB_CHAPTER, function (slot0)
		slot0:sendNotification(GAME.SUB_CHAPTER_REFRESH)
	end)
	slot0:bind(slot0.ON_FETCH_SUB_CHAPTER, function (slot0)
		if not LOCK_SUBMARINE then
			slot0:sendNotification(GAME.SUB_CHAPTER_FETCH)
		end
	end)
	slot0:bind(slot0.ON_STOP_REMIND_OPERATION, function (slot0)
		PlayerPrefs.SetInt("stop_remind_operation", 1)
		PlayerPrefs.Save()
	end)
	slot0:bind(slot0.ON_STRATEGYING_CHAPTER, function (slot0)
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			yesText = "text_forward",
			content = i18n("levelScene_chapter_is_activation", string.split(getProxy(ChapterProxy):getActiveChapter().getConfig(slot1, "chapter_name"), "|")[1]),
			onYes = function ()
				slot0.viewComponent:switchToChapter(slot0.viewComponent)
			end,
			onNo = function ()
				slot0.contextData.chapterVO = slot1

				slot0.contextData.viewComponent:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpRetreat,
					exittype = ChapterConst.ExitFromMap
				})
			end,
			onClose = function ()
				return
			end,
			noBtnType = pg.MsgboxMgr.BUTTON_RETREAT
		})
	end)
	slot0:bind(slot0.ON_COMMANDER_SKILL, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			mediator = CommanderSkillMediator,
			viewComponent = CommanderSkillLayer,
			data = {
				skill = slot1
			}
		}))
	end)
	slot0:bind(slot0.ON_ACTIVATE_REMASTER, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.ACTIVATE_REMASTER, {
			id = slot1,
			callback = slot2
		})
	end)
	slot0:bind(slot0.ON_PERFORM_COMBAT, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_PERFORM,
			stageId = slot1,
			exitCallback = slot2
		})
	end)
	slot0:bind(slot0.ON_CLICK_RECEIVE_REMASTER_TICKETS_BTN, function (slot0)
		slot0:sendNotification(GAME.GET_REMASTER_TICKETS)
	end)
	slot0:bind(slot0.ON_SUBMIT_TASK, function (slot0, slot1)
		slot0:sendNotification(GAME.SUBMIT_TASK, slot1)
	end)
	slot0:bind(slot0.ON_START, function (slot0)
		slot1 = getProxy(ChapterProxy):getActiveChapter()
		slot3 = slot1:getStageId(slot1.fleet.line.row, slot1.fleet.line.column)

		seriesAsync({
			function (slot0)
				slot1 = {}

				for slot5, slot6 in pairs(slot0.ships) do
					table.insert(slot1, slot6)
				end

				if Fleet.EnergyCheck(slot1, slot0.name, slot0) then
					slot0()
				end
			end,
			function (slot0)
				if getProxy(PlayerProxy):getRawData():GoldMax(1) then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("gold_max_tip_title") .. i18n("resource_max_tip_battle"),
						onYes = slot0,
						weight = LayerWeightConst.SECOND_LAYER
					})
				else
					slot0()
				end
			end,
			function (slot0)
				slot0:sendNotification(GAME.BEGIN_STAGE, {
					system = SYSTEM_SCENARIO,
					stageId = slot0.sendNotification
				})
			end
		})
	end)

	slot0.player = slot1:getData()

	slot0.viewComponent:updateRes(slot0.player)
	slot0.viewComponent:updateLastFleet(slot1:getFlag("lastFleetIndex"))
	slot0.viewComponent:updateEvent(slot2)
	slot0.viewComponent:updateFleet(slot4)
	slot0:sendNotification(GAME.SET_SHIP_FLAG, {
		shipsById = getProxy(BayProxy).getRawData(slot5),
		flags = {
			inEvent = true
		}
	})

	slot7 = getProxy(ActivityProxy)

	slot0.viewComponent:updateVoteBookBtn(getProxy(VoteProxy):GetOrderBook())
	slot0.viewComponent:setCommanderPrefabs(slot8)
	slot0.viewComponent:updateBattleActivitys(slot9)

	for slot14, slot15 in ipairs(slot10) do
		if slot15:getConfig("config_id") == pg.gameset.activity_res_id.key_value then
			slot0.viewComponent:updatePtActivity(slot15)

			break
		end
	end

	slot0.viewComponent:setEliteQuota(getProxy(DailyLevelProxy).eliteCount, pg.gameset.elite_quota.key_value)

	slot12 = getProxy(ChapterProxy)

	slot12:updateActiveChapterShips()
	slot12:updateShamChapterShips()
	slot12:updateGuildChapterShips()
	slot0.viewComponent:updateSubInfo(slot12.subRefreshCount, slot12.subProgress)

	slot13 = getProxy(ChapterProxy):getMaps()
	slot14 = slot0.contextData.mapIdx
	slot15 = slot0.contextData.chapterId
	slot17 = ChapterConst.TypeNone

	if slot0.contextData.chapterVO then
		slot17 = slot16:getDataType()
	end

	if slot17 == ChapterConst.TypeSham then
		slot0.contextData.chapterVO = slot12:getShamChapter()
	elseif slot17 == ChapterConst.TypeGuild then
		slot0.contextData.chapterVO = slot12:getGuildChapter()
	elseif slot17 == ChapterConst.TypeNone and slot15 and slot13[slot14] then
		slot0.contextData.chapterVO = slot18:getChapter(slot15)
	end

	slot0.viewComponent:setMaps(slot13)

	if slot0.contextData.chapterVO and slot16.active then
		slot0.viewComponent:setMap(slot16:getConfig("map"))

		slot0.contextData.isSwitchToChapter = true

		slot0.viewComponent:switchToChapter(slot16, function ()
			slot0:OnSwitchChapterDone()
		end)

		return
	end

	slot18 = nil

	if slot0.contextData.targetChapter and slot0.contextData.targetMap then
		slot0.contextData.openChapterId = slot0.contextData.targetChapter
		slot18 = slot0.contextData.targetMap.id
		slot0.contextData.targetChapter = nil
		slot0.contextData.targetMap = nil
	elseif slot0.contextData.eliteDefault then
		slot18 = slot12:getUseableMaxEliteMap() and slot19.id
		slot0.contextData.eliteDefault = nil
	end

	slot0.viewComponent:setMap(slot18 or slot0.viewComponent:selectMap(slot13))

	if slot0.contextData.map:isSkirmish() then
		slot0.viewComponent:ShowCurtains(true)
		slot0.viewComponent:doPlayAnim("TV01", function (slot0)
			go(slot0):SetActive(false)
			slot0.viewComponent:ShowCurtains(false)
		end)
	end
end

function slot0.NoticeVoteBook(slot0, slot1)
	if getProxy(VoteProxy):IsNewOrderBook() then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			yesText = "text_forward",
			noText = "text_iknow",
			content = i18n("vote_get_book"),
			onYes = function ()
				if getProxy(VoteProxy):GetOrderBook() and not slot0:IsExpired() then
					slot0.viewComponent:emit(slot1.ON_VOTE_BOOK)
				end

				slot2()
			end
		})
	else
		slot1()
	end
end

function slot0.OnSwitchChapterDone(slot0)
	slot0.viewComponent:tryPlaySubGuide()
end

function slot0.listNotificationInterests(slot0)
	return {
		ChapterProxy.CHAPTER_ADDED,
		ChapterProxy.CHAPTER_UPDATED,
		ChapterProxy.CHAPTER_TIMESUP,
		ChapterProxy.SHAM_CHAPTER_UPDATED,
		ChapterProxy.GUILD_CHAPTER_UPDATED,
		ChapterProxy.CHAPTER_EXTAR_FLAG_UPDATED,
		PlayerProxy.UPDATED,
		DailyLevelProxy.ELITE_QUOTA_UPDATE,
		GAME.TRACKING_DONE,
		GAME.CHAPTER_OP_DONE,
		GAME.EVENT_LIST_UPDATE,
		GAME.SET_SHIP_FLAG_DONE,
		GAME.SHAM_ENTER_DONE,
		GAME.SHAM_OP_DONE,
		GAME.GUILD_OP_DONE,
		GAME.MILITARY_STARTED,
		GAME.BEGIN_STAGE_DONE,
		ActivityProxy.ACTIVITY_OPERATION_DONE,
		ActivityProxy.ACTIVITY_UPDATED,
		GAME.SUB_CHAPTER_REFRESH_DONE,
		GAME.SUB_CHAPTER_FETCH_DONE,
		CommanderProxy.PREFAB_FLEET_UPDATE,
		GAME.COOMMANDER_EQUIP_TO_FLEET_DONE,
		GAME.COMMANDER_ELIT_FORMATION_OP_DONE,
		GAME.SUBMIT_TASK_DONE,
		GAME.GET_REMASTER_TICKETS_DONE,
		VoteProxy.VOTE_ORDER_BOOK_DELETE,
		VoteProxy.VOTE_ORDER_BOOK_UPDATE,
		GAME.VOTE_BOOK_BE_UPDATED_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.BEGIN_STAGE_DONE then
		slot0.viewComponent:emit(LevelUIConst.DESTROY_LEVEL_STAGE_VIEW)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
	elseif slot2 == VoteProxy.VOTE_ORDER_BOOK_DELETE or VoteProxy.VOTE_ORDER_BOOK_UPDATE == slot2 then
		slot0.viewComponent:updateVoteBookBtn(slot3)
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:updateRes(slot3)
	elseif slot2 == GAME.TRACKING_DONE or slot2 == GAME.SHAM_ENTER_DONE then
		slot0.viewComponent:resetLevelGrid()

		slot0.viewComponent.FirstEnterChapter = slot3.id

		slot0.viewComponent:switchToChapter(slot3, function ()
			slot0:loadSubState(slot1.subAutoAttack)
		end)
	elseif slot2 == ChapterProxy.CHAPTER_UPDATED then
		slot0.viewComponent:updateChapterVO(slot3.chapter, slot3.dirty)
	elseif slot2 == GAME.COMMANDER_ELIT_FORMATION_OP_DONE then
		if slot0.contextData.commanderOPChapter then
			slot0.contextData.commanderOPChapter.eliteCommanderList = getProxy(ChapterProxy):getChapterById(slot3.chapterId).eliteCommanderList

			slot0.viewComponent:updateFleetEdit(slot0.contextData.commanderOPChapter, slot3.index)
		end
	elseif slot2 == ChapterProxy.CHAPTER_ADDED then
		slot0.viewComponent:updateChapterVO(slot3.chapter, 0)
	elseif slot2 == ChapterProxy.CHAPTER_EXTAR_FLAG_UPDATED then
		slot0.viewComponent.levelStageView:ActionInvoke("PopBar", slot3)
	elseif slot2 == ChapterProxy.SHAM_CHAPTER_UPDATED then
		slot0.viewComponent:updateChapterVO(slot3.shamChapter, slot3.dirty)
	elseif slot2 == ChapterProxy.GUILD_CHAPTER_UPDATED then
		slot0.viewComponent:updateChapterVO(slot3.guildChapter, slot3.dirty)
	else
		if slot2 == GAME.CHAPTER_OP_DONE or slot2 == GAME.SHAM_OP_DONE or slot2 == GAME.GUILD_OP_DONE then
			slot4 = nil
			slot4 = coroutine.create(function ()
				slot2 = slot1.contextData.chapterVO

				if slot0.type == ChapterConst.OpRetreat and slot2:existOni() and slot2:checkOniState() then
					slot1.viewComponent:displaySpResult(slot3, slot2)
					coroutine.yield()
				end

				if slot0 == ChapterConst.OpRetreat and slot2:isPlayingWithBombEnemy() then
					slot1.viewComponent:displayBombResult(slot2)
					coroutine.yield()
				end

				if slot0.items and #slot3 > 0 then
					if slot0 == ChapterConst.OpRetreat and slot1.contextData.map:isEscort() then
						slot1.viewComponent:emit(BaseUI.ON_AWARD, {
							items = slot3
						}, AwardInfoLayer.TITLE.ESCORT, slot2)
					else
						slot1.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3, function ()
							if _.any(_.any, function (slot0)
								return slot0.type == DROP_TYPE_STRATEGY
							end) then
								slot1.viewComponent:popStageStrategy()
							end

							slot2()
						end)
					end

					coroutine.yield()
				end

				if slot0 == ChapterConst.OpRetreat and slot0.exittype and slot0.exittype == ChapterConst.ExitFromMap then
					slot1.contextData.chapterVO = nil

					slot1.viewComponent:updateChapterTF(slot2.id)

					return
				end

				if slot0 == ChapterConst.OpSkipBattle then
					slot1.viewComponent.levelStageView:tryAutoTrigger()
				elseif slot0 == ChapterConst.OpRetreat then
					if slot2:getDataType() == ChapterConst.TypeGuild then
						slot1.viewComponent:emit(BaseUI.ON_BACK)

						return
					end

					if getProxy(ContextProxy):getContextByMediator(LevelMediator2) then
						slot5 = {}

						if slot4:getContextByMediator(ChapterPreCombatMediator) then
							table.insert(slot5, slot6)
						end

						if slot4:getContextByMediator(RivalInfoMediator) then
							table.insert(slot5, slot7)
						end

						_.each(slot5, function (slot0)
							slot0:sendNotification(GAME.REMOVE_LAYERS, {
								context = slot0
							})
						end)
					end

					if slot0.id then
						return
					end

					if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN) and not slot6.autoActionForbidden and not slot6.achieved and slot6.data1 == 7 and slot2.id == 204 and slot2:isClear() then
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							modal = true,
							hideNo = true,
							content = "有新的签到奖励可以领取，点击确定前往",
							onYes = function ()
								slot0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY)
							end,
							onNo = function ()
								slot0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY)
							end
						})

						return
					end

					if slot1 then
						slot1:OnExitChapter(slot2)
					end

					slot1.viewComponent:switchToMap()

					if slot3 == GAME.SHAM_OP_DONE and not slot4:getContextByMediator(ShamPreCombatMediator) then
						slot1.viewComponent:emit(slot4.ON_OPEN_SHAM_PRE_COMABT)
					end

					if Map.autoNextPage then
						Map.autoNextPage = nil

						triggerButton(slot1.viewComponent.btnNext)
					end
				elseif slot0 == ChapterConst.OpMove then
					seriesAsync({
						function (slot0)
							slot0.viewComponent.grid:moveFleet(slot1.path, slot1.fullpath, slot1.oldLine, slot0)
						end,
						function (slot0)
							if slot0.aiActs then
								slot1:playAIActions(slot0.aiActs, slot0.extraFlag, slot0)
							else
								slot0()
							end
						end
					}, function ()
						if _.any(slot1.contextData.chapterVO:getFleetStgs(slot0.fleet), function (slot0)
							return slot0.id == ChapterConst.StrategyExchange and slot0.count > 0
						end) then
							slot1.viewComponent:popStageStrategy()
						end

						slot1.viewComponent.grid:updateFleets()
						slot1.viewComponent.grid.updateFleets.viewComponent.levelStageView:updateBombPanel()
						slot1.viewComponent.grid.updateFleets.viewComponent.levelStageView.updateBombPanel.viewComponent.levelStageView:tryAutoTrigger()
					end)
				elseif slot0 == ChapterConst.OpAmbush then
					slot1.viewComponent.levelStageView:tryAutoTrigger()
				elseif slot0 == ChapterConst.OpBox then
					if pg.box_data_template[slot2:getChapterCell(slot2.fleet.line.row, slot2.fleet.line.column).attachmentId].type == ChapterConst.BoxAirStrike then
						slot1.viewComponent:doPlayAirStrike(ChapterConst.SubjectChampion, false, slot2)
						coroutine.yield()

						if slot0.aiActs and #slot0.aiActs > 0 then
							slot1.viewComponent:doPlayCommander(slot8, slot2)
							coroutine.yield()
							slot1.viewComponent:easeAvoid(slot1.viewComponent.grid.cellFleets[slot2.fleets[slot2.findex].id].tf.position, slot2)
							coroutine.yield()
						end
					elseif slot6.type == ChapterConst.BoxTorpedo then
						if slot2.fleet:canClearTorpedo() then
							pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_destroy_torpedo"))
						else
							slot1.viewComponent:doPlayTorpedo(slot2)
							coroutine.yield()
						end
					elseif slot6.type == ChapterConst.BoxBanaiDamage then
						slot1.viewComponent:doPlayAnim("AirStrikeBanai", function (slot0)
							setActive(slot0, false)
							slot0()
						end)
						coroutine.yield()
					elseif slot6.type == ChapterConst.BoxLavaDamage then
						slot1.viewComponent:doPlayAnim("AirStrikeLava", function (slot0)
							setActive(slot0, false)
							slot0()
						end)
						pg.CriMgr.GetInstance():PlaySE("ui-magma")
						coroutine.yield()
					end

					slot1.viewComponent.levelStageView:tryAutoTrigger()
				elseif slot0 == ChapterConst.OpStory then
					slot1.viewComponent.levelStageView:tryAutoTrigger()
				elseif slot0 == ChapterConst.OpSwitch then
					slot1.viewComponent.grid:adjustCameraFocus()
				elseif slot0 == ChapterConst.OpEnemyRound then
					slot1:playAIActions(slot0.aiActs, slot0.extraFlag, function ()
						slot0.viewComponent.levelStageView:updateBombPanel(true)
						slot0.viewComponent.levelStageView.updateBombPanel.viewComponent.levelStageView:tryAutoTrigger()
						slot0.viewComponent.levelStageView.updateBombPanel.viewComponent.levelStageView.tryAutoTrigger.viewComponent:updatePoisonAreaTip()
					end)
				elseif slot0 == ChapterConst.OpSubState then
					slot1:saveSubState(slot2.subAutoAttack)
					slot1.viewComponent.grid:OnChangeSubAutoAttack()
				elseif slot0 == ChapterConst.OpStrategy then
					if slot0.arg1 == ChapterConst.StrategyExchange then
						for slot9, slot10 in ipairs(slot5) do
							if slot10:GetType() == FleetSkill.TypeStrategy and slot10:GetArgs()[1] == ChapterConst.StrategyExchange then
								slot1.viewComponent:doPlayCommander(slot2.fleet:findCommanderBySkillId(slot10.id))

								break
							end
						end
					end
				elseif slot0 == ChapterConst.OpBarrier then
					slot1.viewComponent.levelStageView:tryAutoTrigger()
				elseif slot0 == ChapterConst.OpSubTeleport then
					slot4 = _.detect(slot2.fleets, function (slot0)
						return slot0.id == slot0.id
					end)
					slot7, slot8 = slot2:findPath(nil, slot5, slot6)
					slot11 = getProxy(PlayerProxy)
					slot12 = slot11:getData()

					slot12:consume({
						oil = math.ceil(pg.strategy_data_template[ChapterConst.StrategySubTeleport].arg[2] * #slot4:getShips(false) * slot7 - 1e-05)
					})
					slot1.viewComponent:updateRes(slot12)
					slot11:updatePlayer(slot12)

					slot1.viewComponent.grid.subTeleportMode = false

					slot1.viewComponent.grid:moveSub(table.indexof(slot2.fleets, slot4), slot0.fullpath, nil, function ()
						slot0.viewComponent.grid:TurnOffSubTeleport()
						slot0.viewComponent.grid.TurnOffSubTeleport.viewComponent.levelStageView:SwitchBottomStage(false)
						slot0.viewComponent.grid.TurnOffSubTeleport.viewComponent.levelStageView.SwitchBottomStage.viewComponent.grid:updateQuadCells(ChapterConst.QuadStateNormal)
					end)
				end
			end)


			-- Decompilation error in this vicinity:
			function ()
				if coroutine.status(coroutine.status) == "suspended" then
					slot0, slot1 = coroutine.resume(coroutine.resume)
				end
			end()

			return
		end

		if slot2 == ChapterProxy.CHAPTER_TIMESUP then
			slot0:onTimeUp()
		elseif slot2 == GAME.EVENT_LIST_UPDATE then
			slot0.viewComponent:addbubbleMsgBox(function (slot0)
				slot0:OnEventUpdate(slot0)
			end)
		elseif slot2 == GAME.VOTE_BOOK_BE_UPDATED_DONE then
			slot0.viewComponent:addbubbleMsgBox(function (slot0)
				slot0:NoticeVoteBook(slot0)
			end)
		elseif slot2 == GAME.SET_SHIP_FLAG_DONE then
			slot0.viewComponent:setShips(slot3.shipsById)
		elseif slot2 == DailyLevelProxy.ELITE_QUOTA_UPDATE then
			slot0.viewComponent:setEliteQuota(getProxy(DailyLevelProxy).eliteCount, pg.gameset.elite_quota.key_value)
		elseif slot2 == GAME.MILITARY_STARTED then
			slot0.viewComponent:emit(slot0.ON_OPEN_SHAM_PRE_COMABT)
		elseif slot2 == ActivityProxy.ACTIVITY_OPERATION_DONE then
			slot0.viewComponent:updateMapItems()
		elseif slot2 == ActivityProxy.ACTIVITY_UPDATED then
			if slot3 and slot3:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_RANK then
				slot0.viewComponent:updatePtActivity(slot3)
			end
		elseif slot2 == GAME.SUB_CHAPTER_REFRESH_DONE then
			slot4 = slot3
			slot5 = nil
			slot5 = coroutine.create(function ()
				slot0 = getProxy(ChapterProxy)

				slot0.viewComponent:updateSubInfo(slot0.subRefreshCount, slot0.subProgress)
				slot0.viewComponent:doSignalSearch(slot0.viewComponent.doSignalSearch)
				coroutine.yield()

				if slot0:getChapterById(slot2.id) then
					slot1.expireTime = slot2.expireTime
					slot1.awardIndex = slot2.expireTime.awardIndex

					slot0:updateChapter(slot1)
				else
					slot0:addChapter(slot0.addChapter)
				end

				if slot0.contextData.map.id ~= slot2:getConfig("map") then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("levelScene_jump_to_sub_confirm", pg.expedition_data_by_map[slot2].name, slot2),
						onYes = function ()
							slot0.viewComponent:setMap(slot0.viewComponent)
						end
					})
				end
			end)


			-- Decompilation error in this vicinity:
			function ()
				if coroutine.status(coroutine.status) == "suspended" then
					slot0, slot1 = coroutine.resume(coroutine.resume)
				end
			end()
		elseif slot2 == GAME.SUB_CHAPTER_FETCH_DONE then
			if slot0.contextData.chapterVO then
				slot0.viewComponent:switchToMap()
			else
				slot0.viewComponent:updateMap()
			end
		elseif slot2 == GAME.GET_REMASTER_TICKETS_DONE then
			slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3, function ()
				if getProxy(ChapterProxy).remasterDailyCount > 1 then
					SetActive(slot0.viewComponent.levelRemasterView.getRemasterTF, false)
					SetActive(slot0.viewComponent.levelRemasterView.gotRemasterTF, true)
					removeOnButton(slot0.viewComponent.levelRemasterView.getRemasterTF)
					setText(slot0.viewComponent.levelRemasterView.numsTxt, slot0.remasterTickets .. "/" .. pg.gameset.reactivity_ticket_max.key_value)
				end
			end)
		elseif slot2 == CommanderProxy.PREFAB_FLEET_UPDATE then
			slot0.viewComponent:setCommanderPrefabs(getProxy(CommanderProxy):getPrefabFleet())
			slot0.viewComponent:updateCommanderPrefab()
		elseif slot2 == GAME.COOMMANDER_EQUIP_TO_FLEET_DONE then
			slot0.viewComponent:updateFleet(getProxy(FleetProxy).getData(slot4))
			slot0.viewComponent:updateFleetSelect()
		elseif slot2 == GAME.SUBMIT_TASK_DONE then
			if slot0.contextData.map:isSkirmish() then
				slot0.viewComponent:updateMapItems()
			end

			slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3, function ()
				if slot0.contextData.map:isSkirmish() and slot0.contextData.TaskToSubmit then
					slot0.contextData.TaskToSubmit = nil

					slot0:sendNotification(GAME.SUBMIT_TASK, slot0.contextData.TaskToSubmit)
				end
			end)
		end
	end
end

function slot0.OnExitChapter(slot0, slot1)
	seriesAsync({
		function (slot0)
			slot1 = pg.TimeMgr.GetInstance()

			if slot0:getConfig("type") == Chapter.CustomFleet and not slot0:isActivity() and slot1:IsSameDay(slot0:getStartTime(), slot1:GetServerTime()) then
				getProxy(DailyLevelProxy):EliteCountPlus()
			end

			slot2 = getProxy(PlayerProxy):getData()

			if slot0.id == 103 and not slot2:GetCommonFlag(BATTLE_AUTO_ENABLED) then
				slot1.viewComponent:HandleShowMsgBox({
					modal = true,
					hideNo = true,
					content = i18n("battle_autobot_unlock")
				})
				slot1.viewComponent:emit(LevelMediator2.NOTICE_AUTOBOT_ENABLED, {})
			end

			slot0()
		end,
		function (slot0)
			if Map.IsType(slot0:getConfig("map"), Map.SKIRMISH) then
				slot1 = slot0.id

				if not _.detect(getProxy(SkirmishProxy).getRawData(slot2), function (slot0)
					return tonumber(slot0:getConfig("event")) == slot0
				end) then
					slot0()

					return
				end

				if getProxy(TaskProxy):getTaskVO(slot4:getConfig("task_id")) and slot7:getTaskStatus() == 1 then
					slot1:sendNotification(GAME.SUBMIT_TASK, slot6)

					if slot4 == slot3[#slot3] and slot5:getTaskVO(getProxy(ActivityProxy).getActivityById(slot8, ActivityConst.ACTIVITY_ID_US_SKIRMISH).getConfig(slot9, "config_data")[#getProxy(ActivityProxy).getActivityById(slot8, ActivityConst.ACTIVITY_ID_US_SKIRMISH).getConfig(slot9, "config_data")][2]) and slot12:getTaskStatus() < 2 then
						slot1.contextData.TaskToSubmit = slot11
					end
				end
			end

			slot0()
		end
	})
end

function slot0.OnEventUpdate(slot0, slot1)
	slot0.viewComponent:updateEvent(slot2)

	slot3, slot4 = pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "EventMediator")

	if slot3 and slot2.eventForMsg then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = false,
			hideNo = true,
			content = i18n("event_special_update", (pg.collection_template[slot2.eventForMsg.id or 0] and pg.collection_template[slot2.eventForMsg.id or 0].title) or ""),
			weight = LayerWeightConst.SECOND_LAYER,
			onYes = function ()
				if slot0 then
					slot0()
				end
			end
		})

		slot2.eventForMsg = nil
	elseif slot1 then
		slot1()
	end
end

function slot0.onTimeUp(slot0)
	if getProxy(ChapterProxy):getActiveChapter() and not slot2:inWartime() then
		function slot3()
			slot0:sendNotification(GAME.CHAPTER_OP, {
				type = ChapterConst.OpRetreat
			})
		end

		if slot0.contextData.chapterVO then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("battle_preCombatMediator_timeout"),
				onYes = slot3,
				onNo = slot3
			})
		else
			slot3()
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_chapter_timeout"))
		end
	end
end

function slot0.getDockCallbackFuncs(slot0, slot1, slot2, slot3, slot4)
	slot5 = getProxy(BayProxy)
	slot6 = getProxy(ChapterProxy)

	return function (slot0, slot1)
		slot2, slot3 = Ship.ShipStateConflict("inElite", slot0)

		if slot2 == Ship.STATE_CHANGE_FAIL then
			return false, i18n(slot3)
		elseif slot2 == Ship.STATE_CHANGE_CHECK then
			return Ship.ChangeStateCheckBox(slot3, slot0, slot1)
		end

		if slot0 and slot0:isSameKind(slot0) then
			return true
		end

		for slot7, slot8 in pairs(slot1) do
			if slot0:isSameKind(slot7) then
				return false, i18n("event_same_type_not_allowed")
			end
		end

		return true
	end, function (slot0, slot1, slot2)
		slot1()
	end, function (slot0)
		slot1 = slot0:getEliteFleetList()[]

		if slot0.getEliteFleetList() then
			table.remove(slot1, table.indexof(slot1, slot2.id))
		end

		table.insert(slot1, slot0[1])
		slot1:updateChapter(slot0)
		slot1:duplicateEliteFleet(slot0)
	end
end

function slot0.playAIActions(slot0, slot1, slot2, slot3)
	if not slot0.viewComponent.grid then
		slot3()

		return
	end

	slot4 = getProxy(ChapterProxy)
	slot5 = nil
	slot5 = coroutine.create(function ()
		({})["viewComponent"]:frozen()

		slot1 = ()["viewComponent"] or 0

		for slot5, slot6 in ipairs(ipairs) do
			slot8, slot9 = slot6:applyTo(slot7, true)

			slot6:PlayAIAction(slot0.contextData.chapterVO, slot0, function ()
				slot0, slot1, slot2 = slot0:applyTo(slot0, false)

				if slot0 then
					slot2:updateChapter(slot1, slot1)

					slot3 = slot3(bit.bor, slot2 or 0)
				end

				onNextTick(slot4)
			end)
			coroutine.yield()

			if isa(slot6, FleetAIAction) and slot6.actType == ChapterConst.ActType_Poison and slot7:existFleet(FleetType.Normal, slot6.line.row, slot6.line.column) then
				table.insert(slot0, slot7:getFleetIndex(FleetType.Normal, slot6.line.row, slot6.line.column))
			end
		end

		slot2 = bit.band(slot1, ChapterConst.DirtyAutoAction)

		if bit.band(slot1, bit.bnot(ChapterConst.DirtyAutoAction)) ~= 0 then
			slot3:updateChapter(slot0.contextData.chapterVO, slot1)
		end

		seriesAsync({
			function (slot0)
				if slot0 ~= 0 then
					slot1.viewComponent.levelStageView:tryAutoAction(slot0)
				else
					slot0()
				end
			end,
			function (slot0)
				if #slot0 > 0 then
					slot1 = 0

					for slot5 = 1, #slot0, 1 do
						slot1.viewComponent.grid:showFleetPoisonDamage(slot0[slot5], function ()
							if slot0 + 1 >= #slot1 then
								slot2()
							end
						end)
					end

					return
				end

				slot0()
			end,
			function (slot0)
				slot0()
				slot0.viewComponent:unfrozen()
			end
		})
	end)


	-- Decompilation error in this vicinity:
	function ()
		if coroutine.status(coroutine.status) == "suspended" then
			slot0, slot1 = coroutine.resume(coroutine.resume)

			if not slot0 then
				slot1.viewComponent:unfrozen(-1)
				slot1:sendNotification(GAME.CHAPTER_OP, {
					type = ChapterConst.OpRequest
				})
			end
		end
	end()
end

function slot0.saveSubState(slot0, slot1)
	PlayerPrefs.SetInt("chapter_submarine_ai_type_" .. slot2, slot1 + 1)
	PlayerPrefs.Save()
end

function slot0.loadSubState(slot0, slot1)
	if PlayerPrefs.GetInt("chapter_submarine_ai_type_" .. getProxy(PlayerProxy):getRawData().id) - 1 >= 0 and slot3 ~= slot1 then
		slot0.viewComponent:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpSubState,
			arg1 = slot3
		})
	end
end

function slot0.duplicateEliteFleet(slot0, slot1)
	slot2 = getProxy(ChapterProxy)

	for slot7, slot8 in pairs(slot0.viewComponent.maps[slot1:getConfig("map")].chapters) do
		if not slot2:getRawData()[slot8.id] then
			slot8:setEliteFleetList(slot1:getEliteFleetList())
			slot8:setEliteCommanders(slot1:getEliteFleetCommanders())
		end
	end
end

return slot0
