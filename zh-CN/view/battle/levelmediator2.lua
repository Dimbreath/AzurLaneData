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

function slot0.register(slot0)
	slot1 = getProxy(PlayerProxy)

	slot0:bind(uv0.ON_VOTE_BOOK, function (slot0)
		uv0:addSubLayers(Context.New({
			mediator = VoteOrderBookMediator,
			viewComponent = VoteOrderBookLayer
		}))
	end)
	slot0:bind(uv0.ON_COMMANDER_OP, function (slot0, slot1, slot2)
		uv0.contextData.commanderOPChapter = slot2

		uv0:sendNotification(GAME.COMMANDER_FORMATION_OP, {
			data = slot1
		})
	end)
	slot0:bind(uv0.ON_SELECT_COMMANDER, function (slot0, slot1, slot2, slot3)
		FormationMediator.onSelectCommander(slot1, slot2)

		uv0.contextData.selectedChapterVO = slot3
	end)
	slot0:bind(uv0.ON_SELECT_ELITE_COMMANDER, function (slot0, slot1, slot2, slot3)
		slot4 = getProxy(ChapterProxy)
		slot5 = slot3.id
		uv0.contextData.editEliteChapter = slot3
		slot7 = nil

		if slot3:getEliteFleetCommanders()[slot1] or {}[slot2] then
			slot7 = getProxy(CommanderProxy):getCommanderById(slot6[slot2])
		end

		function slot8()
			if uv0.contextData.editEliteChapter then
				uv2.eliteCommanderList = uv1:getChapterById(uv0.contextData.editEliteChapter.id).eliteCommanderList
				uv0.contextData.editEliteChapter = uv2
			end
		end

		uv0:sendNotification(GAME.GO_SCENE, SCENE.COMMANDROOM, {
			maxCount = 1,
			mode = CommandRoomScene.MODE_SELECT,
			activeCommander = slot7,
			ignoredIds = {},
			onCommander = function (slot0)
				return true
			end,
			onSelected = function (slot0, slot1)
				uv0:sendNotification(GAME.SELECT_ELIT_CHAPTER_COMMANDER, {
					chapterId = uv1,
					index = uv2,
					pos = uv3,
					commanderId = slot0[1],
					callback = function ()
						uv0()
						uv1()
					end
				})
			end,
			onQuit = function (slot0)
				uv0:sendNotification(GAME.SELECT_ELIT_CHAPTER_COMMANDER, {
					chapterId = uv1,
					index = uv2,
					pos = uv3,
					callback = function ()
						uv0()
						uv1()
					end
				})
			end
		})
	end)
	slot0:bind(uv0.ON_TRACKING, function (slot0, slot1, slot2, slot3)
		uv0:setFlag("lastFleetIndex", slot2)
		uv1:sendNotification(GAME.TRACKING, {
			chapterId = slot1,
			fleetIds = slot2,
			operationItem = itemID,
			loopFlag = slot3
		})
		uv1.viewComponent:updateLastFleet(uv0:getFlag("lastFleetIndex"))
	end)
	slot0:bind(uv0.ON_UPDATE_CUSTOM_FLEET, function (slot0, slot1, slot2)
		uv0:sendNotification(GAME.UPDATE_CUSTOM_FLEET, {
			chapterId = slot1,
			callback = slot2
		})
	end)
	slot0:bind(uv0.ON_ELITE_TRACKING, function (slot0, slot1, slot2)
		uv0:sendNotification(GAME.TRACKING, {
			chapterId = slot1,
			loopFlag = slot2
		})
	end)
	slot0:bind(uv0.ON_OP, function (slot0, slot1)
		if uv0.contextData.chapterVO:getDataType() == ChapterConst.TypeSham then
			uv0:sendNotification(GAME.SHAM_OP, slot1)
		elseif slot3 == ChapterConst.TypeNone then
			uv0:sendNotification(GAME.CHAPTER_OP, slot1)
		elseif slot3 == ChapterConst.TypeGuild then
			uv0:sendNotification(GAME.GUILD_OP, slot1)
		end
	end)
	slot0:bind(uv0.ON_SWITCH_NORMAL_MAP, function (slot0)
		slot1 = nil

		if Map.lastMap and uv0.viewComponent.maps[Map.lastMap] then
			if not uv0.viewComponent.maps[Map.lastMap]:isEscort() then
				slot1 = Map.lastMap
			end
		else
			for slot5, slot6 in pairs(uv0.viewComponent.maps) do
				if slot6:isUnlock() and slot6:getMapType() == Map.SCENARIO then
					slot1 = slot6.id
				end
			end
		end

		if slot1 then
			uv0.viewComponent:setMap(slot1)
		end
	end)
	slot0:bind(uv0.ON_STAGE, function (slot0)
		uv0:addSubLayers(Context.New({
			mediator = ChapterPreCombatMediator,
			viewComponent = ChapterPreCombatLayer,
			onRemoved = function ()
				uv0.viewComponent:onSubLayerClose()
			end
		}), false, function ()
			uv0.viewComponent:onSubLayerOpen()
		end)
	end)
	slot0:bind(uv0.ON_PVP, function (slot0, slot1)
		uv0:addSubLayers(Context.New({
			mediator = RivalInfoMediator,
			viewComponent = RivalInfoLayer,
			data = {
				rival = slot1,
				type = RivalInfoLayer.TYPE_SHAM
			},
			onRemoved = function ()
				uv0.viewComponent:onSubLayerClose()
			end
		}), false, function ()
			uv0.viewComponent:onSubLayerOpen()
		end)
	end)
	slot0:bind(uv0.ON_OPEN_MILITARYEXERCISE, function ()
		if getProxy(ActivityProxy):getMilitaryExerciseActivity() then
			uv0:sendNotification(GAME.GO_SCENE, SCENE.MILITARYEXERCISE)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_notStartOrEnd"))
		end
	end)
	slot0:bind(uv0.CLICK_CHALLENGE_BTN, function (slot0)
		uv0:sendNotification(GAME.GO_SCENE, SCENE.CHALLENGE_MAIN_SCENE)
	end)
	slot0:bind(uv0.ON_DAILY_LEVEL, function (slot0)
		uv0:sendNotification(GAME.GO_SCENE, SCENE.DAILYLEVEL)
	end)
	slot0:bind(uv0.ON_GO_TO_TASK_SCENE, function ()
		uv0:sendNotification(GAME.GO_SCENE, SCENE.TASK)
	end)
	slot0:bind(uv0.ON_OPEN_EVENT_SCENE, function ()
		uv0:sendNotification(GAME.GO_SCENE, SCENE.EVENT)
	end)
	slot0:bind(uv0.ON_OPEN_SHAM, function ()
		if getProxy(ChapterProxy):getShamChapter().active then
			uv0.viewComponent:switchToChapter(slot1)
		else
			uv0.viewComponent:emit(uv1.ON_OPEN_SHAM_PRE_COMABT)
		end
	end)
	slot0:bind(uv0.ON_OPEN_SHAM_PRE_COMABT, function (slot0)
		uv0:addSubLayers(Context.New({
			mediator = ShamPreCombatMediator,
			viewComponent = ShamPreCombatLayer,
			data = {
				shamChapter = getProxy(ChapterProxy):getShamChapter()
			},
			onRemoved = function ()
				uv0.viewComponent:onSubLayerClose()
			end
		}), false, function ()
			uv0.viewComponent:onSubLayerOpen()
		end)
	end)
	slot0:bind(uv0.ON_OVERRIDE_CHAPTER, function ()
		slot0 = uv0.contextData.chapterVO

		if slot0:getDataType() == ChapterConst.TypeSham then
			getProxy(ChapterProxy):updateShamChapter(slot0)
		elseif slot1 == ChapterConst.TypeNone then
			slot2:updateChapter(slot0)
		elseif slot1 == ChapterConst.TypeGuild then
			slot2:updateGuildChapter(slot0)
		end
	end)
	slot0:bind(uv0.ON_TIME_UP, function ()
		uv0:onTimeUp()
	end)
	slot0:bind(uv0.ON_EVENT_LIST_UPDATE, function ()
		slot0 = getProxy(EventProxy)

		uv0:OnEventUpdate()
	end)
	slot0:bind(uv0.ON_ELITE_CLEAR, function (slot0, slot1)
		slot3 = slot1.chapterVO

		slot3:clearEliterFleetByIndex(slot1.index)

		slot4 = getProxy(ChapterProxy)

		slot4:updateChapter(slot3)
		slot4:duplicateEliteFleet(slot3, true)
		uv0:duplicateEliteFleet(slot3)
		uv0.viewComponent.levelFleetView:setOnHard(slot3)
	end)
	slot0:bind(uv0.NOTICE_AUTOBOT_ENABLED, function (slot0, slot1)
		uv0:sendNotification(GAME.COMMON_FLAG, {
			flagID = BATTLE_AUTO_ENABLED
		})
	end)
	slot0:bind(uv0.ON_ELITE_RECOMMEND, function (slot0, slot1)
		slot3 = slot1.chapterVO
		slot4 = getProxy(ChapterProxy)

		slot4:eliteFleetRecommend(slot3, slot1.index)
		slot4:updateChapter(slot3)
		slot4:duplicateEliteFleet(slot3, true)
		uv0:duplicateEliteFleet(slot3)
		uv0.viewComponent.levelFleetView:setOnHard(slot3)
	end)
	slot0:bind(uv0.ON_ELITE_OEPN_DECK, function (slot0, slot1)
		slot2 = slot1.shipType
		slot3 = slot1.fleetIndex
		slot4 = slot1.shipVO
		slot5 = slot1.fleet
		slot6 = slot1.chapter

		for slot14, slot15 in pairs(getProxy(BayProxy):getRawData()) do
			if slot15:getTeamType() ~= slot1.teamType then
				table.insert({}, slot14)
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

		uv0.contextData.editEliteChapter = slot6
		slot14 = uv0
		slot21.onShip, slot21.confirmSelect, slot21.onSelected = slot14:getDockCallbackFuncs(slot5, slot4, slot6, slot3)

		uv0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
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
	slot0:bind(uv0.ON_ACTIVITY_MAP, function ()
		slot1, slot2 = getProxy(ChapterProxy):getLastMapForActivity()

		if slot1 then
			slot3 = getProxy(ActivityProxy):getActivityById(pg.expedition_data_by_map[slot1].on_activity)
		end

		if not slot3 or slot3:isEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		uv0.viewComponent:setMap(slot1)

		if slot2 then
			uv0.viewComponent:switchToChapter(slot0:getChapterById(slot2))
		end
	end)
	slot0:bind(uv0.ON_SWITCH_ACT_MAP, function (slot0, slot1, slot2)
		slot3 = getProxy(ChapterProxy)

		if slot3:getUnlockActMapBytype(slot2, slot1) then
			uv0.viewComponent:setMap(slot3.id)
		end
	end)
	slot0:bind(uv0.ON_OPEN_SHAM_SHOP, function ()
		if getProxy(ShopsProxy):getShamShop():isOpen() then
			uv0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, {
				warp = ShopsLayer.TYPE_SHAM_SHOP
			})
		end
	end)
	slot0:bind(uv0.ON_OPEN_GUILD_PRE_COMABT, function ()
		uv0:addSubLayers(Context.New({
			mediator = GuildPreCombatMediator,
			viewComponent = GuildPreCombatLayer,
			data = {
				guildChapter = getProxy(ChapterProxy):getGuildChapter()
			},
			onRemoved = function ()
				uv0.viewComponent:onSubLayerClose()
			end
		}), false, function ()
			uv0.viewComponent:onSubLayerOpen()
		end)
	end)
	slot0:bind(uv0.GO_ACT_SHOP, function ()
		slot0, slot1 = nil
		slot2 = {}
		slot3 = getProxy(ActivityProxy)

		if slot3:getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY) and not slot3:isEnd() then
			slot0 = LotteryMediator
			slot1 = LotteryLayer
			slot2 = {
				activityId = slot3.id
			}
		else
			slot0 = ShopsMediator
			slot1 = ShopsLayer
			slot2 = {
				warp = ShopsLayer.TYPE_ACTIVITY,
				actId = _.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP), function (slot0)
					return slot0:getConfig("config_client").pt_id == pg.gameset.activity_res_id.key_value
				end).id
			}
		end

		uv0:addSubLayers(Context.New({
			mediator = slot0,
			viewComponent = slot1,
			data = slot2,
			onRemoved = function ()
				uv0.viewComponent:onSubLayerClose()
			end
		}), false, function ()
			uv0.viewComponent:onSubLayerOpen()
		end)
	end)
	slot0:bind(uv0.ON_SHIP_DETAIL, function (slot0, slot1)
		uv0.contextData.selectedChapterVO = slot1.chapter

		uv0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = slot1.id
		})
	end)
	slot0:bind(uv0.ON_FLEET_SHIPINFO, function (slot0, slot1)
		uv0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = slot1.shipId,
			shipVOs = slot1.shipVOs
		})

		uv0.contextData.editEliteChapter = slot1.chapter
	end)
	slot0:bind(uv0.ON_ENTER_EXTRA_CHAPTER, function (slot0)
		slot1 = getProxy(ActivityProxy)

		if slot1:getActivityByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT) and not slot1:isEnd() then
			slot2 = getProxy(ChapterProxy)

			if ActivityLevelConst.hasExtraMap(ActivityLevelConst.getMapsByActivityType(uv0.viewComponent.maps, slot1:getConfig("type"))) and ActivityLevelConst.canSwitchToEx(slot2:getMaps(), slot4) then
				slot6 = slot2:getUnlockActMapBytype(Map.ACT_EXTRA, slot4:getConfig("on_activity"), PlayerPrefs.HasKey("ex_mapId") and PlayerPrefs.GetInt("ex_mapId"))

				uv0.viewComponent:setMap(slot6.id)

				if slot6:getActiveChapter() then
					uv0.viewComponent:switchToChapter(slot7)
				end
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock"))
			end
		end
	end)
	slot0:bind(uv0.ON_EXTRA_RANK, function (slot0)
		uv0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {
			page = PowerRank.TYPE_EXTRA_CHAPTER
		})
	end)
	slot0:bind(uv0.ON_REFRESH_SUB_CHAPTER, function (slot0)
		uv0:sendNotification(GAME.SUB_CHAPTER_REFRESH)
	end)
	slot0:bind(uv0.ON_FETCH_SUB_CHAPTER, function (slot0)
		if not LOCK_SUBMARINE then
			uv0:sendNotification(GAME.SUB_CHAPTER_FETCH)
		end
	end)
	slot0:bind(uv0.ON_STOP_REMIND_OPERATION, function (slot0)
		PlayerPrefs.SetInt("stop_remind_operation", 1)
		PlayerPrefs.Save()
	end)
	slot0:bind(uv0.ON_STRATEGYING_CHAPTER, function (slot0)
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			yesText = "text_forward",
			content = i18n("levelScene_chapter_is_activation", string.split(getProxy(ChapterProxy):getActiveChapter():getConfig("chapter_name"), "|")[1]),
			onYes = function ()
				uv0.viewComponent:switchToChapter(uv1)
			end,
			onNo = function ()
				uv0.contextData.chapterVO = uv1

				uv0.viewComponent:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpRetreat,
					exittype = ChapterConst.ExitFromMap
				})
			end,
			onClose = function ()
			end,
			noBtnType = pg.MsgboxMgr.BUTTON_RETREAT
		})
	end)
	slot0:bind(uv0.ON_COMMANDER_SKILL, function (slot0, slot1)
		uv0:addSubLayers(Context.New({
			mediator = CommanderSkillMediator,
			viewComponent = CommanderSkillLayer,
			data = {
				skill = slot1
			}
		}))
	end)
	slot0:bind(uv0.ON_ACTIVATE_REMASTER, function (slot0, slot1, slot2)
		uv0:sendNotification(GAME.ACTIVATE_REMASTER, {
			id = slot1,
			callback = slot2
		})
	end)
	slot0:bind(uv0.ON_PERFORM_COMBAT, function (slot0, slot1, slot2)
		uv0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_PERFORM,
			stageId = slot1,
			exitCallback = slot2
		})
	end)
	slot0:bind(uv0.ON_CLICK_RECEIVE_REMASTER_TICKETS_BTN, function (slot0)
		uv0:sendNotification(GAME.GET_REMASTER_TICKETS)
	end)
	slot0:bind(uv0.ON_SUBMIT_TASK, function (slot0, slot1)
		uv0:sendNotification(GAME.SUBMIT_TASK, slot1)
	end)
	slot0:bind(uv0.ON_START, function (slot0)
		slot1 = getProxy(ChapterProxy):getActiveChapter()
		slot2 = slot1.fleet
		slot3 = slot1:getStageId(slot2.line.row, slot2.line.column)

		seriesAsync({
			function (slot0)
				for slot5, slot6 in pairs(uv0.ships) do
					table.insert({}, slot6)
				end

				if Fleet.EnergyCheck(slot1, uv0.name, slot0) then
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
				uv0:sendNotification(GAME.BEGIN_STAGE, {
					system = SYSTEM_SCENARIO,
					stageId = uv1
				})
			end
		})
	end)

	slot0.player = slot1:getData()

	slot0.viewComponent:updateRes(slot0.player)
	slot0.viewComponent:updateLastFleet(slot1:getFlag("lastFleetIndex"))
	slot0.viewComponent:updateEvent(getProxy(EventProxy))
	slot0.viewComponent:updateFleet(getProxy(FleetProxy):getData())
	slot0:sendNotification(GAME.SET_SHIP_FLAG, {
		shipsById = getProxy(BayProxy):getRawData(),
		flags = {
			inEvent = true
		}
	})
	slot0.viewComponent:updateVoteBookBtn(getProxy(VoteProxy):GetOrderBook())
	slot0.viewComponent:setCommanderPrefabs(getProxy(CommanderProxy):getPrefabFleet())
	slot0.viewComponent:updateBattleActivitys(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT))

	for slot14, slot15 in ipairs(slot7:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_RANK)) do
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

	slot13 = slot0.viewComponent.maps
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
		slot0.contextData.isSwitchToChapter = true

		slot0.viewComponent:switchToChapter(slot16, function ()
			uv0:OnSwitchChapterDone()
		end)
	elseif slot0.contextData.map:isSkirmish() then
		slot0.viewComponent:ShowCurtains(true)
		slot0.viewComponent:doPlayAnim("TV01", function (slot0)
			go(slot0):SetActive(false)
			uv0.viewComponent:ShowCurtains(false)
		end, function (slot0)
			setParent(slot0, uv0.viewComponent._tf)
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
				slot0 = getProxy(VoteProxy)

				if slot0:GetOrderBook() and not slot0:IsExpired() then
					uv0.viewComponent:emit(uv1.ON_VOTE_BOOK)
				end

				uv2()
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
	if slot1:getName() == GAME.BEGIN_STAGE_DONE then
		slot0.viewComponent:emit(LevelUIConst.DESTROY_LEVEL_STAGE_VIEW)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot1:getBody())
	elseif slot2 == VoteProxy.VOTE_ORDER_BOOK_DELETE or VoteProxy.VOTE_ORDER_BOOK_UPDATE == slot2 then
		slot0.viewComponent:updateVoteBookBtn(slot3)
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:updateRes(slot3)
	elseif slot2 == GAME.TRACKING_DONE or slot2 == GAME.SHAM_ENTER_DONE then
		slot0.viewComponent:resetLevelGrid()

		slot0.viewComponent.FirstEnterChapter = slot3.id

		slot0.viewComponent:switchToChapter(slot3, function ()
			uv0:loadSubState(uv1.subAutoAttack)
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
				slot1 = uv0.win
				slot2 = uv1.contextData.chapterVO

				if uv0.type == ChapterConst.OpRetreat and slot2:existOni() and slot2:checkOniState() then
					uv1.viewComponent:displaySpResult(slot3, uv2)
					coroutine.yield()
				end

				if slot0 == ChapterConst.OpRetreat and slot2:isPlayingWithBombEnemy() then
					uv1.viewComponent:displayBombResult(uv2)
					coroutine.yield()
				end

				if uv0.items and #slot3 > 0 then
					if slot0 == ChapterConst.OpRetreat then
						if uv1.contextData.map:isEscort() then
							uv1.viewComponent:emit(BaseUI.ON_AWARD, {
								items = slot3
							}, AwardInfoLayer.TITLE.ESCORT, uv2)
						end
					else
						uv1.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3, function ()
							if _.any(uv0, function (slot0)
								return slot0.type == DROP_TYPE_STRATEGY
							end) then
								uv1.viewComponent:popStageStrategy()
							end

							uv2()
						end)
					end

					coroutine.yield()
				end

				if slot0 == ChapterConst.OpRetreat and uv0.exittype and uv0.exittype == ChapterConst.ExitFromMap then
					uv1.contextData.chapterVO = nil

					uv1.viewComponent:updateChapterTF(uv1.contextData.chapterVO.id)

					return
				end

				if slot0 == ChapterConst.OpSkipBattle then
					uv1.viewComponent.levelStageView:tryAutoTrigger()
				elseif slot0 == ChapterConst.OpRetreat then
					if slot4:getDataType() == ChapterConst.TypeGuild then
						uv1.viewComponent:emit(BaseUI.ON_BACK)

						return
					end

					slot5 = getProxy(ContextProxy)

					if slot5:getContextByMediator(LevelMediator2) then
						if slot5:getContextByMediator(ChapterPreCombatMediator) then
							table.insert({}, slot7)
						end

						if slot5:getContextByMediator(RivalInfoMediator) then
							table.insert(slot6, slot8)
						end

						_.each(slot6, function (slot0)
							uv0:sendNotification(GAME.REMOVE_LAYERS, {
								context = slot0
							})
						end)
					end

					if uv0.id then
						return
					end

					if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN) and not slot7.autoActionForbidden and not slot7.achieved and slot7.data1 == 7 and slot4.id == 204 and slot4:isClear() then
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							modal = true,
							hideNo = true,
							content = "有新的签到奖励可以领取，点击确定前往",
							onYes = function ()
								uv0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY)
							end,
							onNo = function ()
								uv0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY)
							end
						})

						return
					end

					if slot1 then
						uv1:OnExitChapter(slot4)
					end

					uv1.viewComponent:switchToMap()

					if uv3 == GAME.SHAM_OP_DONE and not slot5:getContextByMediator(ShamPreCombatMediator) then
						uv1.viewComponent:emit(uv4.ON_OPEN_SHAM_PRE_COMABT)
					end

					if Map.autoNextPage then
						Map.autoNextPage = nil

						triggerButton(uv1.viewComponent.btnNext)
					end
				elseif slot0 == ChapterConst.OpMove then
					seriesAsync({
						function (slot0)
							uv0.viewComponent.grid:moveFleet(uv1.path, uv1.fullpath, uv1.oldLine, slot0)
						end,
						function (slot0)
							if uv0.aiActs then
								uv1:playAIActions(uv0.aiActs, uv0.extraFlag, slot0)
							else
								slot0()
							end
						end
					}, function ()
						uv0 = uv1.contextData.chapterVO

						if _.any(uv0:getFleetStgs(uv0.fleet), function (slot0)
							return slot0.id == ChapterConst.StrategyExchange and slot0.count > 0
						end) then
							uv1.viewComponent:popStageStrategy()
						end

						uv1.viewComponent.grid:updateFleets()
						uv1.viewComponent.levelStageView:updateBombPanel()
						uv1.viewComponent.levelStageView:tryAutoTrigger()
					end)
				elseif slot0 == ChapterConst.OpAmbush then
					uv1.viewComponent.levelStageView:tryAutoTrigger()
				elseif slot0 == ChapterConst.OpBox then
					slot5 = slot4.fleet.line

					if pg.box_data_template[slot4:getChapterCell(slot5.row, slot5.column).attachmentId].type == ChapterConst.BoxAirStrike then
						uv1.viewComponent:doPlayAirStrike(ChapterConst.SubjectChampion, false, uv2)
						coroutine.yield()

						if uv0.aiActs and #uv0.aiActs > 0 then
							uv1.viewComponent:doPlayCommander(slot4.fleet:findCommanderBySkillId(uv0.aiActs[1].commanderSkillEffectId), uv2)
							coroutine.yield()
							uv1.viewComponent:easeAvoid(uv1.viewComponent.grid.cellFleets[slot4.fleets[slot4.findex].id].tf.position, uv2)
							coroutine.yield()
						end
					elseif slot7.type == ChapterConst.BoxTorpedo then
						if slot4.fleet:canClearTorpedo() then
							pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_destroy_torpedo"))
						else
							uv1.viewComponent:doPlayTorpedo(uv2)
							coroutine.yield()
						end
					elseif slot7.type == ChapterConst.BoxBanaiDamage then
						uv1.viewComponent:doPlayAnim("AirStrikeBanai", function (slot0)
							setActive(slot0, false)
							uv0()
						end)
						coroutine.yield()
					elseif slot7.type == ChapterConst.BoxLavaDamage then
						uv1.viewComponent:doPlayAnim("AirStrikeLava", function (slot0)
							setActive(slot0, false)
							uv0()
						end)
						pg.CriMgr.GetInstance():PlaySE("ui-magma")
						coroutine.yield()
					end

					uv1.viewComponent.levelStageView:tryAutoTrigger()
				elseif slot0 == ChapterConst.OpStory then
					uv1.viewComponent.levelStageView:tryAutoTrigger()
				elseif slot0 == ChapterConst.OpSwitch then
					uv1.viewComponent.grid:adjustCameraFocus()
				elseif slot0 == ChapterConst.OpEnemyRound then
					uv1:playAIActions(uv0.aiActs, uv0.extraFlag, function ()
						uv0.viewComponent.levelStageView:updateBombPanel(true)
						uv0.viewComponent.levelStageView:tryAutoTrigger()
						uv0.viewComponent:updatePoisonAreaTip()
					end)
				elseif slot0 == ChapterConst.OpSubState then
					uv1:saveSubState(slot4.subAutoAttack)
					uv1.viewComponent.grid:OnChangeSubAutoAttack()
				elseif slot0 == ChapterConst.OpStrategy then
					if uv0.arg1 == ChapterConst.StrategyExchange then
						for slot10, slot11 in ipairs(slot4.fleet:findSkills(FleetSkill.TypeStrategy)) do
							if slot11:GetType() == FleetSkill.TypeStrategy and slot11:GetArgs()[1] == ChapterConst.StrategyExchange then
								uv1.viewComponent:doPlayCommander(slot4.fleet:findCommanderBySkillId(slot11.id))

								break
							end
						end
					end
				elseif slot0 == ChapterConst.OpBarrier then
					uv1.viewComponent.levelStageView:tryAutoTrigger()
				elseif slot0 == ChapterConst.OpSubTeleport then
					slot5 = _.detect(slot4.fleets, function (slot0)
						return slot0.id == uv0.id
					end)
					slot8, slot9 = slot4:findPath(nil, uv0.fullpath[1], uv0.fullpath[#uv0.fullpath])
					slot12 = getProxy(PlayerProxy)
					slot13 = slot12:getData()

					slot13:consume({
						oil = math.ceil(pg.strategy_data_template[ChapterConst.StrategySubTeleport].arg[2] * #slot5:getShips(false) * slot8 - 1e-05)
					})
					uv1.viewComponent:updateRes(slot13)
					slot12:updatePlayer(slot13)

					uv1.viewComponent.grid.subTeleportMode = false

					uv1.viewComponent.grid:moveSub(table.indexof(slot4.fleets, slot5), uv0.fullpath, nil, function ()
						uv0.viewComponent.grid:TurnOffSubTeleport()
						uv0.viewComponent.levelStageView:SwitchBottomStage(false)
						uv0.viewComponent.grid:updateQuadCells(ChapterConst.QuadStateNormal)
					end)
				end
			end)

			function ()
				if coroutine.status(uv0) == "suspended" then
					slot0, slot1 = coroutine.resume(uv0)
				end
			end()

			return
		end

		if slot2 == ChapterProxy.CHAPTER_TIMESUP then
			slot0:onTimeUp()
		elseif slot2 == GAME.EVENT_LIST_UPDATE then
			slot0.viewComponent:addbubbleMsgBox(function (slot0)
				uv0:OnEventUpdate(slot0)
			end)
		elseif slot2 == GAME.VOTE_BOOK_BE_UPDATED_DONE then
			slot0.viewComponent:addbubbleMsgBox(function (slot0)
				uv0:NoticeVoteBook(slot0)
			end)
		elseif slot2 == GAME.SET_SHIP_FLAG_DONE then
			slot0.viewComponent:setShips(slot3.shipsById)
		elseif slot2 == DailyLevelProxy.ELITE_QUOTA_UPDATE then
			slot0.viewComponent:setEliteQuota(getProxy(DailyLevelProxy).eliteCount, pg.gameset.elite_quota.key_value)
		elseif slot2 == GAME.MILITARY_STARTED then
			slot0.viewComponent:emit(uv0.ON_OPEN_SHAM_PRE_COMABT)
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

				uv0.viewComponent:updateSubInfo(slot0.subRefreshCount, slot0.subProgress)

				slot1 = uv0.viewComponent

				slot1:doSignalSearch(uv1)
				coroutine.yield()

				if slot0:getChapterById(uv2.id) then
					slot1.expireTime = uv2.expireTime
					slot1.awardIndex = uv2.awardIndex

					slot0:updateChapter(slot1)
				else
					slot0:addChapter(uv2)
				end

				slot2 = uv2

				if uv0.contextData.map.id ~= slot2:getConfig("map") then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("levelScene_jump_to_sub_confirm", pg.expedition_data_by_map[slot2].name, slot2),
						onYes = function ()
							uv0.viewComponent:setMap(uv1)
						end
					})
				end
			end)

			function ()
				if coroutine.status(uv0) == "suspended" then
					slot0, slot1 = coroutine.resume(uv0)
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
					SetActive(uv0.viewComponent.levelRemasterView.getRemasterTF, false)
					SetActive(uv0.viewComponent.levelRemasterView.gotRemasterTF, true)
					removeOnButton(uv0.viewComponent.levelRemasterView.getRemasterTF)
					setText(uv0.viewComponent.levelRemasterView.numsTxt, slot0.remasterTickets .. "/" .. pg.gameset.reactivity_ticket_max.key_value)
				end
			end)
		elseif slot2 == CommanderProxy.PREFAB_FLEET_UPDATE then
			slot0.viewComponent:setCommanderPrefabs(getProxy(CommanderProxy):getPrefabFleet())
			slot0.viewComponent:updateCommanderPrefab()
		elseif slot2 == GAME.COOMMANDER_EQUIP_TO_FLEET_DONE then
			slot0.viewComponent:updateFleet(getProxy(FleetProxy):getData())
			slot0.viewComponent:updateFleetSelect()
		elseif slot2 == GAME.SUBMIT_TASK_DONE then
			if slot0.contextData.map:isSkirmish() then
				slot0.viewComponent:updateMapItems()
			end

			slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3, function ()
				if uv0.contextData.map:isSkirmish() and uv0.contextData.TaskToSubmit then
					uv0.contextData.TaskToSubmit = nil

					uv0:sendNotification(GAME.SUBMIT_TASK, uv0.contextData.TaskToSubmit)
				end
			end)
		end
	end
end

function slot0.OnExitChapter(slot0, slot1)
	seriesAsync({
		function (slot0)
			slot1 = pg.TimeMgr.GetInstance()

			if uv0:getConfig("type") == Chapter.CustomFleet then
				if not uv0:isActivity() then
					if slot1:IsSameDay(uv0:getStartTime(), slot1:GetServerTime()) then
						getProxy(DailyLevelProxy):EliteCountPlus()
					end
				end
			end

			if uv0.id == 103 and not getProxy(PlayerProxy):getData():GetCommonFlag(BATTLE_AUTO_ENABLED) then
				uv1.viewComponent:HandleShowMsgBox({
					modal = true,
					hideNo = true,
					content = i18n("battle_autobot_unlock")
				})
				uv1.viewComponent:emit(LevelMediator2.NOTICE_AUTOBOT_ENABLED, {})
			end

			slot0()
		end,
		function (slot0)
			if Map.IsType(uv0:getConfig("map"), Map.SKIRMISH) then
				slot1 = uv0.id

				if not _.detect(getProxy(SkirmishProxy):getRawData(), function (slot0)
					return tonumber(slot0:getConfig("event")) == uv0
				end) then
					slot0()

					return
				end

				slot5 = getProxy(TaskProxy)

				if slot5:getTaskVO(slot4:getConfig("task_id")) and slot7:getTaskStatus() == 1 then
					uv1:sendNotification(GAME.SUBMIT_TASK, slot6)

					if slot4 == slot3[#slot3] then
						slot10 = getProxy(ActivityProxy):getActivityById(ActivityConst.ACTIVITY_ID_US_SKIRMISH):getConfig("config_data")

						if slot5:getTaskVO(slot10[#slot10][2]) and slot12:getTaskStatus() < 2 then
							uv1.contextData.TaskToSubmit = slot11
						end
					end
				end
			end

			slot0()
		end
	})
end

function slot0.OnEventUpdate(slot0, slot1)
	slot0.viewComponent:updateEvent(getProxy(EventProxy))

	slot3, slot4 = pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "EventMediator")

	if slot3 and slot2.eventForMsg then
		slot5 = slot2.eventForMsg.id or 0

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = false,
			hideNo = true,
			content = i18n("event_special_update", pg.collection_template[slot5] and pg.collection_template[slot5].title or ""),
			weight = LayerWeightConst.SECOND_LAYER,
			onYes = function ()
				if uv0 then
					uv0()
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
			uv0:sendNotification(GAME.CHAPTER_OP, {
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

		if uv0 then
			if uv0:isSameKind(slot0) then
				return true
			end
		end

		for slot7, slot8 in pairs(uv1) do
			if slot0:isSameKind(slot7) then
				return false, i18n("event_same_type_not_allowed")
			end
		end

		return true
	end, function (slot0, slot1, slot2)
		slot1()
	end, function (slot0)
		slot1 = uv0:getEliteFleetList()[uv1]

		if uv2 then
			table.remove(slot1, table.indexof(slot1, uv2.id))
		end

		table.insert(slot1, slot0[1])
		uv3:updateChapter(uv0)
		uv3:duplicateEliteFleet(uv0)
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
		uv0.viewComponent:frozen()

		slot1 = uv1 or 0

		for slot5, slot6 in ipairs(uv2) do
			slot8, slot9 = slot6:applyTo(uv0.contextData.chapterVO, true)

			slot6:PlayAIAction(uv0.contextData.chapterVO, uv0, function ()
				slot0, slot1, slot2 = uv0:applyTo(uv1, false)

				if slot0 then
					uv2:updateChapter(uv1, slot1)

					uv3 = bit.bor(uv3, slot2 or 0)
				end

				onNextTick(uv4)
			end)
			coroutine.yield()

			if isa(slot6, FleetAIAction) and slot6.actType == ChapterConst.ActType_Poison and slot7:existFleet(FleetType.Normal, slot6.line.row, slot6.line.column) then
				table.insert({}, slot7:getFleetIndex(FleetType.Normal, slot6.line.row, slot6.line.column))
			end
		end

		slot2 = bit.band(slot1, ChapterConst.DirtyAutoAction)

		if bit.band(slot1, bit.bnot(ChapterConst.DirtyAutoAction)) ~= 0 then
			uv3:updateChapter(uv0.contextData.chapterVO, slot1)
		end

		seriesAsync({
			function (slot0)
				if uv0 ~= 0 then
					uv1.viewComponent.levelStageView:tryAutoAction(slot0)
				else
					slot0()
				end
			end,
			function (slot0)
				if #uv0 > 0 then
					slot1 = 0

					for slot5 = 1, #uv0, 1 do
						uv1.viewComponent.grid:showFleetPoisonDamage(uv0[slot5], function ()
							uv0 = uv0 + 1

							if uv0 >= #uv1 then
								uv2()
							end
						end)
					end

					return
				end

				slot0()
			end,
			function (slot0)
				uv0()
				uv1.viewComponent:unfrozen()
			end
		})
	end)

	function ()
		if coroutine.status(uv0) == "suspended" then
			slot0, slot1 = coroutine.resume(uv0)

			if not slot0 then
				uv1.viewComponent:unfrozen(-1)
				uv1:sendNotification(GAME.CHAPTER_OP, {
					type = ChapterConst.OpRequest
				})
			end
		end
	end()
end

function slot0.saveSubState(slot0, slot1)
	PlayerPrefs.SetInt("chapter_submarine_ai_type_" .. getProxy(PlayerProxy):getRawData().id, slot1 + 1)
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
	for slot7, slot8 in pairs(slot0.viewComponent.maps[slot1:getConfig("map")].chapters) do
		if not getProxy(ChapterProxy):getRawData()[slot8.id] then
			slot8:setEliteFleetList(slot1:getEliteFleetList())
			slot8:setEliteCommanders(slot1:getEliteFleetCommanders())
		end
	end
end

return slot0
