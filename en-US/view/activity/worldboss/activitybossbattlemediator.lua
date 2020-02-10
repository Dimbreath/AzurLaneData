slot0 = class("ActivityBossBattleMediator", import("view.base.ContextMediator"))
slot0.ON_STAGE = "ActivityBossBattleMediator:ON_STAGE"
slot0.ON_GET = "ActivityBossBattleMediator:ON_GET"
slot0.ON_RANK = "ActivityBossBattleMediator:ON_RANK"

function slot0.register(slot0)
	slot0:bind(uv0.ON_RANK, function (slot0)
		slot5.index = PowerRank.TYPE_ACT_BOSS_BATTLE

		uv0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {})
	end)
	slot0:bind(uv0.ON_GET, function (slot0, slot1)
		uv0:sendNotification(GAME.SUBMIT_TASK, slot1)
	end)
	slot0:bind(uv0.ON_STAGE, function (slot0, slot1, slot2)
		if slot2 then
			slot5 = uv0.activityProxy

			if slot5:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE) and not slot5:isEnd() then
				pg.StoryMgr.GetInstance():Play(slot5:getConfig("config_client").story_init, function ()
					slot3.mediator = PreCombatMediator
					slot3.viewComponent = PreCombatLayer
					slot4.stageId = uv1
					slot4.system = SYSTEM_ACT_BOSS
					slot3.data = {}

					uv0:addSubLayers(Context.New({}))
				end)
			else
				slot3()
			end
		else
			slot3()
		end
	end)
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
	slot0.viewComponent:setFleet(getProxy(FleetProxy):getData()[1])

	slot0.activityProxy = getProxy(ActivityProxy)

	slot0.viewComponent:setTaskAct(slot0.activityProxy:getActivityById(ActivityConst.ACT_BOSS_TASK_LIST))

	slot8.activity_id = slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE).id

	slot0:sendNotification(GAME.ACTIVITY_OPERATION, {
		cmd = 1
	})
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = ActivityProxy.ACTIVITY_OPERATION_DONE
	slot1[2] = GAME.SUBMIT_TASK_DONE
	slot1[3] = PlayerProxy.UPDATED
	slot1[4] = ActivityProxy.ACTIVITY_UPDATED

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == ActivityProxy.ACTIVITY_OPERATION_DONE then
		slot0:playStroys(slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE), function ()
			uv0.viewComponent:setActivity(uv1)
		end)

		return
	end

	if slot2 == GAME.SUBMIT_TASK_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3, function ()
			uv0.viewComponent:showAwards()
		end)
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	elseif slot2 == ActivityProxy.ACTIVITY_UPDATED then
		slot0:playStroys(slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE), function ()
			uv0.viewComponent:setActivity(uv1)
		end)
	end
end

function slot0.playStroys(slot0, slot1, slot2)
	slot3 = {}
	slot4 = pg.expedition_data_template

	if table.contains(slot1.data1_list, table.remove(_.map(slot1:getConfig("config_data")[4], function (slot0)
		slot2.config = uv0[slot0[1]]
		slot2.count = slot0[2]

		return {}
	end), 1).config.id) then
		slot9 = pg.StoryMgr.GetInstance()
		slot10 = slot1:getConfig("config_client").story
		slot12 = pg.extraenemy_template[slot1.data1]

		if slot1.data4 - slot1.data2 <= 0 then
			slot13 = 0
		end

		for slot18, slot19 in pairs(slot10) do
			if slot19[1] < math.floor(slot13 / slot1.data4 * 10000) then
				break
			end

			if slot19[2] and slot20 ~= "" and not slot9:IsPlayed(slot20) then
				table.insert(slot3, function (slot0)
					uv0:Play(uv1, slot0, true, true)
				end)
			end
		end
	end

	if #slot3 > 0 then
		seriesAsync(slot3, slot2)
	else
		onNextTick(slot2)
	end
end

return slot0
