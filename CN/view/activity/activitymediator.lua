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

function slot0.register(slot0)
	slot0.UIAvalibleCallbacks = {}

	slot0:bind(slot0.OPEN_VOTEBOOK, function (slot0)
		slot0:addSubLayers(Context.New({
			mediator = VoteOrderBookMediator,
			viewComponent = VoteOrderBookLayer
		}))
	end)
	slot0:bind(slot0.GO_SUBMARINE_RUN, function (slot0, slot1)
		slot0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_SUBMARINE_RUN,
			stageId = slot1
		})
	end)
	slot0:bind(slot0.GO_DODGEM, function (slot0)
		slot0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_DODGEM,
			stageId = ys.Battle.BattleConfig.BATTLE_DODGEM_STAGES[math.random(#ys.Battle.BattleConfig.BATTLE_DODGEM_STAGES)]
		})
	end)
	slot0:bind(slot0.RETURN_AWARD_OP, function (slot0, slot1)
		if slot1.cmd == ActivityConst.RETURN_AWARD_OP_SHOW_AWARD_OVERVIEW then
			slot0.viewComponent:ShowWindow(ReturnerAwardWindow, slot1.arg1)
		elseif slot1.cmd == ActivityConst.RETURN_AWARD_OP_SHOW_RETURNER_AWARD_OVERVIEW then
			slot0.viewComponent:ShowWindow(TaskAwardWindow, slot1.arg1)
		else
			slot0:sendNotification(GAME.RETURN_AWARD_OP, slot1)
		end
	end)
	slot0:bind(slot0.SHOW_AWARD_WINDOW, function (slot0, slot1, slot2)
		slot0.viewComponent:ShowWindow(slot1, slot2)
	end)
	slot0:bind(slot0.EVENT_PT_OPERATION, function (slot0, slot1)
		slot0:sendNotification(GAME.ACT_NEW_PT, slot1)
	end)
	slot0:bind(slot0.OPEN_LAYER, function (slot0, slot1)
		slot0:addSubLayers(slot1)
	end)
	slot0:bind(slot0.CLOSE_LAYER, function (slot0, slot1)
		if getProxy(ContextProxy).getCurrentContext(slot2):getContextByMediator(slot1) then
			slot0:sendNotification(GAME.REMOVE_LAYERS, {
				context = slot4
			})
		end
	end)
	slot0:bind(slot0.EVENT_OPERATION, function (slot0, slot1)
		slot0:sendNotification(GAME.ACTIVITY_OPERATION, slot1)
	end)
	slot0:bind(slot0.EVENT_GO_SCENE, function (slot0, slot1, slot2)
		if slot1 == SCENE.SUMMER_FEAST then
			if not pg.StoryMgr:IsPlayed("TIANHOUYUYI1") then
				pg.StoryMgr.GetInstance():Play("TIANHOUYUYI1", function ()
					slot0:sendNotification(GAME.GO_SCENE, SCENE.SUMMER_FEAST)
				end, true)
			else
				slot0:sendNotification(GAME.GO_SCENE, SCENE.SUMMER_FEAST)
			end
		else
			slot0:sendNotification(GAME.GO_SCENE, slot1, slot2)
		end
	end)
	slot0:bind(slot0.BLACKWHITEGRID, function ()
		if not getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BLACKWHITE) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		slot0:addSubLayers(Context.New({
			viewComponent = BlackWhiteGridLayer,
			mediator = BlackWhiteGridMediator
		}))
	end)
	slot0:bind(slot0.MEMORYBOOK, function ()
		if not getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		slot0:addSubLayers(Context.New({
			viewComponent = MemoryBookLayer,
			mediator = MemoryBookMediator
		}))
	end)
	slot0:bind(slot0.GO_SHOPS_LAYER, function (slot0, slot1)
		if not getProxy(ActivityProxy):getActivityById(slot1.actId) then
			pg.TipsMgr:GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		slot0:addSubLayers(Context.New({
			mediator = ShopsMediator,
			viewComponent = ShopsLayer,
			data = slot1 or {
				warp = ShopsLayer.TYPE_ACTIVITY
			}
		}))
	end)
	slot0:bind(slot0.GO_SHOPS_LAYER_STEEET, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			mediator = ShopsMediator,
			viewComponent = ShopsLayer,
			data = slot1 or {
				warp = ShopsLayer.TYPE_SHOP_STREET
			}
		}))
	end)
	slot0:bind(slot0.BATTLE_OPERA, function ()
		slot0, slot1 = getProxy(ChapterProxy):getLastMapForActivity()
		slot2 = slot0 and getProxy(ActivityProxy):getActivityById(pg.expedition_data_by_map[slot0].on_activity)

		if not slot2 or slot2:isEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
			chapterId = slot1,
			mapIdx = slot0
		})
	end)
	slot0:bind(slot0.SPECIAL_BATTLE_OPERA, function ()
		slot0, slot1 = getProxy(ChapterProxy):getLastMapForActivity()
		slot2 = slot0 and getProxy(ActivityProxy):getActivityById(pg.expedition_data_by_map[slot0].on_activity)

		if not slot2 or slot2:isEnd() then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = getProxy(ChapterProxy).getActiveChapter(slot3) and slot4.id,
				mapIdx = slot4 and slot4:getConfig("map")
			})

			return
		end

		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
			chapterId = slot1,
			mapIdx = slot0
		})
	end)
	slot0:bind(slot0.REQUEST_VOTE_INFO, function (slot0, slot1)
		slot0:sendNotification(GAME.REQUEST_VOTE_INFO, slot1)
	end)
	slot0:bind(slot0.GO_VOTE_LAYER, function (slot0, slot1)
		if not _.detect(pg.activity_vote.all, function (slot0)
			return pg.TimeMgr.GetInstance():inTime(pg.activity_vote[slot0].time_show) and slot1.is_in_game == 1
		end) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_not_start"))

			return
		end

		slot0:sendNotification(GAME.REQUEST_VOTE_INFO, {
			configId = slot2,
			callback = function ()
				slot0:sendNotification(GAME.GO_SCENE, SCENE.VOTE)
			end
		})
	end)
	slot0:bind(slot0.GO_FISRT_VOTE, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			mediator = VoteFameHallMediator,
			viewComponent = VoteFameHallLayer
		}))
	end)
	slot0:bind(slot0.GO_LOTTERY, function (slot0)
		slot0:addSubLayers(Context.New({
			mediator = LotteryMediator,
			viewComponent = LotteryLayer,
			data = {
				activityId = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY).id
			}
		}))
	end)
	slot0:bind(slot0.GO_BACKYARD, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.BACKYARD)
	end)
	slot0:bind(slot0.EVENT_COLORING_ACHIEVE, function (slot0, slot1)
		slot0:sendNotification(GAME.COLORING_ACHIEVE, slot1)
	end)
	slot0:bind(slot0.ON_TASK_SUBMIT, function (slot0, slot1)
		slot0:sendNotification(GAME.SUBMIT_TASK, slot1.id)
	end)
	slot0:bind(slot0.ON_TASK_GO, function (slot0, slot1)
		slot0:sendNotification(GAME.TASK_GO, {
			taskVO = slot1
		})
	end)
	slot0:bind(slot0.GO_PRAY_POOL, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.GETBOAT, {
			goToPray = true
		})
	end)
	slot0:bind(slot0.FETCH_INSTARGRAM, function (slot0, ...)
		slot0:sendNotification(GAME.ACT_INSTAGRAM_FETCH, ...)
	end)
	slot0:bind(slot0.MUSIC_GAME_OPERATOR, function (slot0, ...)
		slot0:sendNotification(GAME.SEND_MINI_GAME_OP, ...)
	end)
	slot0:bind(slot0.SELECT_ACTIVITY, function (slot0, slot1)
		slot0.viewComponent:verifyTabs(slot1)
	end)
	slot0:bind(slot0.SHOW_NEXT_ACTIVITY, function (slot0)
		slot0:showNextActivity()
	end)

	slot1 = getProxy(ActivityProxy)

	slot0.viewComponent:setActivities(slot2)
	slot0.viewComponent:setAllActivity(slot1:getData())
	slot0.viewComponent:setPlayer(slot4)
	slot0.viewComponent:setFlagShip(getProxy(BayProxy).getShipById(slot5, getProxy(PlayerProxy).getRawData(slot3).character))
end

function slot0.onUIAvalible(slot0)
	slot0.UIAvalible = true

	_.each(slot0.UIAvalibleCallbacks, function (slot0)
		slot0()
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		ActivityProxy.ACTIVITY_ADDED,
		ActivityProxy.ACTIVITY_UPDATED,
		ActivityProxy.ACTIVITY_OPERATION_DONE,
		ActivityProxy.ACTIVITY_SHOW_AWARDS,
		ActivityProxy.ACTIVITY_SHOW_BB_RESULT,
		ActivityProxy.ACTIVITY_SHOW_LOTTERY_AWARD_RESULT,
		GAME.COLORING_ACHIEVE_DONE,
		GAME.SUBMIT_TASK_DONE,
		GAME.ACT_NEW_PT_DONE,
		GAME.BEGIN_STAGE_DONE,
		GAME.RETURN_AWARD_OP_DONE,
		VoteProxy.VOTE_ORDER_BOOK_DELETE,
		VoteProxy.VOTE_ORDER_BOOK_UPDATE,
		GAME.REMOVE_LAYERS,
		GAME.SEND_MINI_GAME_OP_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == ActivityProxy.ACTIVITY_ADDED or slot2 == ActivityProxy.ACTIVITY_UPDATED then
		if slot3:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LOTTERY then
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
			slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot1.drops, function ()
				slot0.viewComponent:flush_coloring()
			end)
		end)
	elseif slot2 == GAME.SUBMIT_TASK_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3, function ()
			slot0.viewComponent:updateTaskLayers()
		end)
	elseif slot2 == GAME.ACT_NEW_PT_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards)
	elseif slot2 == GAME.BEGIN_STAGE_DONE then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
	elseif slot2 == GAME.RETURN_AWARD_OP_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.awards)
	elseif slot2 == VoteProxy.VOTE_ORDER_BOOK_DELETE or slot2 == VoteProxy.VOTE_ORDER_BOOK_UPDATE then
		if slot0.viewComponent.pageDic or {}[ActivityConst.VOTE_ORDER_BOOK_PHASE_1] or slot0.viewComponent.pageDic or [ActivityConst.VOTE_ORDER_BOOK_PHASE_2] or slot0.viewComponent.pageDic or [ActivityConst.VOTE_ORDER_BOOK_PHASE_3] or slot0.viewComponent.pageDic or [ActivityConst.VOTE_ORDER_BOOK_PHASE_4] or slot0.viewComponent.pageDic or [ActivityConst.VOTE_ORDER_BOOK_PHASE_5] or slot0.viewComponent.pageDic or [ActivityConst.VOTE_ORDER_BOOK_PHASE_6] or slot0.viewComponent.pageDic or [ActivityConst.VOTE_ORDER_BOOK_PHASE_7] or slot0.viewComponent.pageDic or [ActivityConst.VOTE_ORDER_BOOK_PHASE_8] then
			slot5:UpdateOrderBookBtn(slot3)
		end
	elseif slot2 == GAME.REMOVE_LAYERS then
		if slot3.context.mediator == VoteFameHallMediator then
			slot0.viewComponent:updateEntrances()
		end
	elseif slot2 == GAME.SEND_MINI_GAME_OP_DONE then
		seriesAsync({
			function (slot0)
				if #slot0.awards > 0 then
					if slot1.viewComponent then
						slot1.viewComponent:emit(BaseUI.ON_ACHIEVE, slot1, slot0)
					else
						slot1:emit(BaseUI.ON_ACHIEVE, slot1, slot0)
					end
				else
					slot0()
				end
			end,
			function (slot0)
				return
			end
		})
	end
end

function slot0.showNextActivity(slot0)
	if not getProxy(ActivityProxy) then
		return
	end

	if slot1:findNextAutoActivity() then
		slot0.viewComponent:verifyTabs(slot2.id)

		if slot2:getConfig("type") == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN or slot3 == ActivityConst.ACTIVITY_TYPE_MONTHSIGN then
			slot0:sendNotification(GAME.ACTIVITY_OPERATION, {
				cmd = 1,
				activity_id = slot2.id
			})
		elseif slot3 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
			slot0:sendNotification(GAME.ACTIVITY_OPERATION, {
				activity_id = slot2.id,
				cmd = (slot2.data1 < 7 and 1) or 2
			})
		elseif slot2.id == ActivityConst.SHADOW_PLAY_ID then
			slot2.clientData1 = 1

			slot0:showNextActivity()
		end
	elseif not slot0.viewComponent.activity then
		slot0.viewComponent:verifyTabs(slot0.contextData.id or (slot0.contextData.type and checkExist(_.detect(slot1:getPanelActivities(), function (slot0)
			return slot0:getConfig("type") == slot0.contextData.type
		end), {
			"id"
		})) or 0)
	end
end

return slot0
