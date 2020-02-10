slot0 = class("ActivityMediator", import("..base.ContextMediator"))
slot0.EVENT_GO_SCENE = "event go scene"
slot0.EVENT_OPERATION = "event operation"
slot0.GO_SHOPS_LAYER = "event go shop layer"
slot0.GO_SHOPS_LAYER_STEEET = "event go shop layer in shopstreet"
slot0.BATTLE_OPERA = "event difficult sel"
slot0.REQUEST_VOTE_INFO = "event request vote info"
slot0.GO_VOTE_LAYER = "event go vote layer"
slot0.GO_FISRT_VOTE = "event go first vote"
slot0.GO_BACKYARD = "event go backyard"
slot0.GO_LOTTERY = "event go lottery"
slot0.EVENT_COLORING_ACHIEVE = "event coloring achieve"
slot0.ON_TASK_SUBMIT = "event on task submit"
slot0.ON_TASK_GO = "event on task go"
slot0.OPEN_LAYER = "event OPEN_LAYER"
slot0.CLOSE_LAYER = "event CLOSE_LAYER"
slot0.EVENT_PT_OPERATION = "event pt op"
slot0.BLACKWHITEGRID = "black white grid"
slot0.MEMORYBOOK = "memory book"
slot0.RETURN_AWARD_OP = "event return award op"
slot0.SHOW_AWARD_WINDOW = "event show award window"
slot0.GO_DODGEM = "event go dodgem"
slot0.GO_SUBMARINE_RUN = "event go sumbarine run"
slot0.SPECIAL_BATTLE_OPERA = "special battle opera"
slot0.GO_PRAY_POOL = "go pray pool"
slot0.SELECT_ACTIVITY = "event select activity"
slot0.OPEN_VOTEBOOK = "event open vote book"
slot0.FETCH_INSTARGRAM = "fetch instagram"
slot0.MUSIC_GAME_OPERATOR = "get music game final prize"
slot0.SHOW_NEXT_ACTIVITY = "show next activity"
slot0.SHARE_TASK_DONE = "share task done"
slot0.OPEN_RED_PACKET_LAYER = "ActivityMediator:OPEN_RED_PACKET_LAYER"
slot0.GO_MINI_GAME = "ActivityMediator.GO_MINI_GAME"

function slot0.register(slot0)
	slot0.UIAvalibleCallbacks = {}

	slot0:bind(uv0.GO_MINI_GAME, function (slot0, slot1)
		pg.m02:sendNotification(GAME.GO_MINI_GAME, slot1)
	end)
	slot0:bind(uv0.OPEN_VOTEBOOK, function (slot0)
		slot4.mediator = VoteOrderBookMediator
		slot4.viewComponent = VoteOrderBookLayer

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.GO_SUBMARINE_RUN, function (slot0, slot1)
		slot5.system = SYSTEM_SUBMARINE_RUN
		slot5.stageId = slot1

		uv0:sendNotification(GAME.BEGIN_STAGE, {})
	end)
	slot0:bind(uv0.GO_DODGEM, function (slot0)
		slot5.system = SYSTEM_DODGEM
		slot5.stageId = ys.Battle.BattleConfig.BATTLE_DODGEM_STAGES[math.random(#ys.Battle.BattleConfig.BATTLE_DODGEM_STAGES)]

		uv0:sendNotification(GAME.BEGIN_STAGE, {})
	end)
	slot0:bind(uv0.RETURN_AWARD_OP, function (slot0, slot1)
		if slot1.cmd == ActivityConst.RETURN_AWARD_OP_SHOW_AWARD_OVERVIEW then
			uv0.viewComponent:ShowWindow(ReturnerAwardWindow, slot1.arg1)
		elseif slot1.cmd == ActivityConst.RETURN_AWARD_OP_SHOW_RETURNER_AWARD_OVERVIEW then
			uv0.viewComponent:ShowWindow(TaskAwardWindow, slot1.arg1)
		else
			uv0:sendNotification(GAME.RETURN_AWARD_OP, slot1)
		end
	end)
	slot0:bind(uv0.SHOW_AWARD_WINDOW, function (slot0, slot1, slot2)
		uv0.viewComponent:ShowWindow(slot1, slot2)
	end)
	slot0:bind(uv0.EVENT_PT_OPERATION, function (slot0, slot1)
		uv0:sendNotification(GAME.ACT_NEW_PT, slot1)
	end)
	slot0:bind(uv0.OPEN_LAYER, function (slot0, slot1)
		uv0:addSubLayers(slot1)
	end)
	slot0:bind(uv0.OPEN_RED_PACKET_LAYER, function (slot0)
		slot4.mediator = RedPacketMediator
		slot4.viewComponent = RedPacketLayer

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.CLOSE_LAYER, function (slot0, slot1)
		if getProxy(ContextProxy):getCurrentContext():getContextByMediator(slot1) then
			slot8.context = slot4

			uv0:sendNotification(GAME.REMOVE_LAYERS, {})
		end
	end)
	slot0:bind(uv0.EVENT_OPERATION, function (slot0, slot1)
		uv0:sendNotification(GAME.ACTIVITY_OPERATION, slot1)
	end)
	slot0:bind(uv0.EVENT_GO_SCENE, function (slot0, slot1, slot2)
		if slot1 == SCENE.SUMMER_FEAST then
			if not pg.StoryMgr:IsPlayed("TIANHOUYUYI1") then
				pg.StoryMgr.GetInstance():Play("TIANHOUYUYI1", function ()
					uv0:sendNotification(GAME.GO_SCENE, SCENE.SUMMER_FEAST)
				end, true)
			else
				uv0:sendNotification(GAME.GO_SCENE, SCENE.SUMMER_FEAST)
			end
		else
			uv0:sendNotification(GAME.GO_SCENE, slot1, slot2)
		end
	end)
	slot0:bind(uv0.BLACKWHITEGRID, function ()
		if not getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BLACKWHITE) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		slot4.viewComponent = BlackWhiteGridLayer
		slot4.mediator = BlackWhiteGridMediator

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.MEMORYBOOK, function ()
		if not getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		slot4.viewComponent = MemoryBookLayer
		slot4.mediator = MemoryBookMediator

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.GO_SHOPS_LAYER, function (slot0, slot1)
		if not getProxy(ActivityProxy):getActivityById(slot1.actId) then
			pg.TipsMgr:GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		slot3 = uv0
		slot4 = slot3
		slot3 = slot3.addSubLayers
		slot5 = Context.New
		slot6 = {
			mediator = ShopsMediator,
			viewComponent = ShopsLayer
		}

		if not slot1 then
			slot7 = {
				warp = ShopsLayer.TYPE_ACTIVITY
			}
		end

		slot6.data = slot7

		slot3(slot4, slot5(slot6))
	end)
	slot0:bind(uv0.GO_SHOPS_LAYER_STEEET, function (slot0, slot1)
		slot2 = uv0
		slot3 = slot2
		slot2 = slot2.addSubLayers
		slot4 = Context.New
		slot5 = {
			mediator = ShopsMediator,
			viewComponent = ShopsLayer
		}

		if not slot1 then
			slot6 = {
				warp = ShopsLayer.TYPE_SHOP_STREET
			}
		end

		slot5.data = slot6

		slot2(slot3, slot4(slot5))
	end)
	slot0:bind(uv0.BATTLE_OPERA, function ()
		slot0, slot1 = getProxy(ChapterProxy):getLastMapForActivity()

		if slot0 then
			slot2 = getProxy(ActivityProxy):getActivityById(pg.expedition_data_by_map[slot0].on_activity)
		end

		if not slot2 or slot2:isEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		slot7.chapterId = slot1
		slot7.mapIdx = slot0

		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {})
	end)
	slot0:bind(uv0.SPECIAL_BATTLE_OPERA, function ()
		slot0, slot1 = getProxy(ChapterProxy):getLastMapForActivity()

		if slot0 then
			slot2 = getProxy(ActivityProxy):getActivityById(pg.expedition_data_by_map[slot0].on_activity)
		end

		if not slot2 or slot2:isEnd() then
			slot5 = pg.m02
			slot9.chapterId = getProxy(ChapterProxy):getActiveChapter() and slot4.id
			slot9.mapIdx = slot4 and slot4:getConfig("map")

			slot5.sendNotification(slot5, GAME.GO_SCENE, SCENE.LEVEL, {})

			return
		end

		slot7.chapterId = slot1
		slot7.mapIdx = slot0

		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {})
	end)
	slot0:bind(uv0.REQUEST_VOTE_INFO, function (slot0, slot1)
		uv0:sendNotification(GAME.REQUEST_VOTE_INFO, slot1)
	end)
	slot0:bind(uv0.GO_VOTE_LAYER, function (slot0, slot1)
		if not _.detect(pg.activity_vote.all, function (slot0)
			return pg.TimeMgr.GetInstance():inTime(pg.activity_vote[slot0].time_show) and slot1.is_in_game == 1
		end) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_not_start"))

			return
		end

		slot6.configId = slot2

		function slot6.callback()
			uv0:sendNotification(GAME.GO_SCENE, SCENE.VOTE)
		end

		uv0:sendNotification(GAME.REQUEST_VOTE_INFO, {})
	end)
	slot0:bind(uv0.GO_FISRT_VOTE, function (slot0, slot1)
		slot5.mediator = VoteFameHallMediator
		slot5.viewComponent = VoteFameHallLayer

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.GO_LOTTERY, function (slot0)
		slot5.mediator = LotteryMediator
		slot5.viewComponent = LotteryLayer
		slot6.activityId = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY).id
		slot5.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.GO_BACKYARD, function (slot0)
		uv0:sendNotification(GAME.GO_SCENE, SCENE.BACKYARD)
	end)
	slot0:bind(uv0.EVENT_COLORING_ACHIEVE, function (slot0, slot1)
		uv0:sendNotification(GAME.COLORING_ACHIEVE, slot1)
	end)
	slot0:bind(uv0.ON_TASK_SUBMIT, function (slot0, slot1)
		uv0:sendNotification(GAME.SUBMIT_TASK, slot1.id)
	end)
	slot0:bind(uv0.ON_TASK_GO, function (slot0, slot1)
		slot5.taskVO = slot1

		uv0:sendNotification(GAME.TASK_GO, {})
	end)
	slot0:bind(uv0.GO_PRAY_POOL, function (slot0)
		uv0:sendNotification(GAME.GO_SCENE, SCENE.GETBOAT, {
			goToPray = true
		})
	end)
	slot0:bind(uv0.FETCH_INSTARGRAM, function (slot0, ...)
		uv0:sendNotification(GAME.ACT_INSTAGRAM_FETCH, ...)
	end)
	slot0:bind(uv0.MUSIC_GAME_OPERATOR, function (slot0, ...)
		uv0:sendNotification(GAME.SEND_MINI_GAME_OP, ...)
	end)
	slot0:bind(uv0.SELECT_ACTIVITY, function (slot0, slot1)
		uv0.viewComponent:verifyTabs(slot1)
	end)
	slot0:bind(uv0.SHOW_NEXT_ACTIVITY, function (slot0)
		uv0:showNextActivity()
	end)
	slot0:bind(uv0.SHARE_TASK_DONE, function (slot0, slot1)
		slot5.taskId = slot1

		uv0:sendNotification(GAME.UPDATE_TASK_PROGRESS, {})
	end)

	slot1 = getProxy(ActivityProxy)

	slot0.viewComponent:setActivities(slot1:getPanelActivities())
	slot0.viewComponent:setAllActivity(slot1:getData())

	slot4 = getProxy(PlayerProxy):getRawData()

	slot0.viewComponent:setPlayer(slot4)
	slot0.viewComponent:setFlagShip(getProxy(BayProxy):getShipById(slot4.character))
end

function slot0.onUIAvalible(slot0)
	slot0.UIAvalible = true

	_.each(slot0.UIAvalibleCallbacks, function (slot0)
		slot0()
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = ActivityProxy.ACTIVITY_ADDED
	slot1[2] = ActivityProxy.ACTIVITY_UPDATED
	slot1[3] = ActivityProxy.ACTIVITY_OPERATION_DONE
	slot1[4] = ActivityProxy.ACTIVITY_SHOW_AWARDS
	slot1[5] = ActivityProxy.ACTIVITY_SHOW_BB_RESULT
	slot1[6] = ActivityProxy.ACTIVITY_SHOW_LOTTERY_AWARD_RESULT
	slot1[7] = GAME.COLORING_ACHIEVE_DONE
	slot1[8] = GAME.SUBMIT_TASK_DONE
	slot1[9] = GAME.SHARE_TASK_FINISHED
	slot1[10] = GAME.ACT_NEW_PT_DONE
	slot1[11] = GAME.BEGIN_STAGE_DONE
	slot1[12] = GAME.RETURN_AWARD_OP_DONE
	slot1[13] = VoteProxy.VOTE_ORDER_BOOK_DELETE
	slot1[14] = VoteProxy.VOTE_ORDER_BOOK_UPDATE
	slot1[15] = GAME.REMOVE_LAYERS
	slot1[16] = GAME.SEND_MINI_GAME_OP_DONE
	slot1[17] = GAME.MONOPOLY_AWARD_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == ActivityProxy.ACTIVITY_ADDED or slot2 == ActivityProxy.ACTIVITY_UPDATED then
		if slot1:getBody():getConfig("type") == ActivityConst.ACTIVITY_TYPE_LOTTERY then
			return
		end

		slot0.viewComponent:updateActivity(slot3)

		if ActivityConst.AOERLIANG_TASK_ID == slot3.id then
			slot0.viewComponent:update_task_list_auto_aoerliang(slot3)
		end
	elseif slot2 == ActivityProxy.ACTIVITY_OPERATION_DONE then
		if ActivityConst.AOERLIANG_TASK_ID == slot3 then
			return
		end

		if ActivityConst.HOLOLIVE_MORNING_ID == slot3 then
			slot4 = slot0.viewComponent.pageDic[ActivityConst.HOLOLIVE_MORNING_ID]
		end

		slot0:showNextActivity()
	elseif slot2 == ActivityProxy.ACTIVITY_SHOW_AWARDS then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards, slot3.callback)
	elseif slot2 == ActivityProxy.ACTIVITY_SHOW_BB_RESULT then
		slot0.viewComponent:displayBBResult(slot3.numbers, slot3.callback)
	elseif slot2 == ActivityProxy.ACTIVITY_SHOW_LOTTERY_AWARD_RESULT then
		slot0.viewComponent.pageDic[slot3.activityID]:showLotteryAwardResult(slot3.awards, slot3.number, slot3.callback)
	elseif slot2 == GAME.COLORING_ACHIEVE_DONE then
		slot0.viewComponent:playBonusAnim(function ()
			uv0.viewComponent:emit(BaseUI.ON_ACHIEVE, uv1.drops, function ()
				uv0.viewComponent:flush_coloring()
			end)
		end)
	elseif slot2 == GAME.SUBMIT_TASK_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3, function ()
			uv0.viewComponent:updateTaskLayers()
		end)
	elseif slot2 == GAME.SHARE_TASK_FINISHED then
		slot0.viewComponent:updateTaskLayers()
	elseif slot2 == GAME.ACT_NEW_PT_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards)
	elseif slot2 == GAME.BEGIN_STAGE_DONE then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
	elseif slot2 == GAME.RETURN_AWARD_OP_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards)
	elseif slot2 == VoteProxy.VOTE_ORDER_BOOK_DELETE or slot2 == VoteProxy.VOTE_ORDER_BOOK_UPDATE then
		slot4 = slot0.viewComponent.pageDic or {}

		if slot4[ActivityConst.VOTE_ORDER_BOOK_PHASE_1] or slot4[ActivityConst.VOTE_ORDER_BOOK_PHASE_2] or slot4[ActivityConst.VOTE_ORDER_BOOK_PHASE_3] or slot4[ActivityConst.VOTE_ORDER_BOOK_PHASE_4] or slot4[ActivityConst.VOTE_ORDER_BOOK_PHASE_5] or slot4[ActivityConst.VOTE_ORDER_BOOK_PHASE_6] or slot4[ActivityConst.VOTE_ORDER_BOOK_PHASE_7] or slot4[ActivityConst.VOTE_ORDER_BOOK_PHASE_8] then
			slot5:UpdateOrderBookBtn(slot3)
		end
	elseif slot2 == GAME.REMOVE_LAYERS then
		if slot3.context.mediator == VoteFameHallMediator then
			slot0.viewComponent:updateEntrances()
		end
	elseif slot2 == GAME.MONOPOLY_AWARD_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards, slot3.callback)
	elseif slot2 == GAME.SEND_MINI_GAME_OP_DONE then
		slot4[1] = function (slot0)
			if #uv0.awards > 0 then
				if uv1.viewComponent then
					uv1.viewComponent:emit(BaseUI.ON_ACHIEVE, slot1, slot0)
				else
					uv1:emit(BaseUI.ON_ACHIEVE, slot1, slot0)
				end
			else
				slot0()
			end
		end

		slot4[2] = function (slot0)
		end

		seriesAsync({})
	end
end

function slot0.showNextActivity(slot0)
	if not getProxy(ActivityProxy) then
		return
	end

	if slot1:findNextAutoActivity() then
		slot3 = slot0.viewComponent

		slot3:verifyTabs(slot2.id)

		if slot2:getConfig("type") == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN or slot3 == ActivityConst.ACTIVITY_TYPE_MONTHSIGN then
			slot7.activity_id = slot2.id

			slot0:sendNotification(GAME.ACTIVITY_OPERATION, {
				cmd = 1
			})
		elseif slot3 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
			slot7.activity_id = slot2.id
			slot7.cmd = slot2.data1 < 7 and 1 or 2

			slot0.sendNotification(slot0, GAME.ACTIVITY_OPERATION, {})
		elseif slot2.id == ActivityConst.SHADOW_PLAY_ID then
			slot2.clientData1 = 1

			slot0:showNextActivity()
		end
	elseif not slot0.viewComponent.activity then
		slot0.viewComponent:verifyTabs(slot0.contextData.id or slot0.contextData.type and checkExist(_.detect(slot1:getPanelActivities(), function (slot0)
			return slot0:getConfig("type") == uv0.contextData.type
		end), {
			"id"
		}) or 0)
	end
end

return slot0
