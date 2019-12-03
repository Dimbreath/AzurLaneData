slot0 = class("ActivityBossBattleMediator", import("view.base.ContextMediator"))
slot0.ON_STAGE = "ActivityBossBattleMediator:ON_STAGE"
slot0.ON_GET = "ActivityBossBattleMediator:ON_GET"
slot0.ON_RANK = "ActivityBossBattleMediator:ON_RANK"

slot0.register = function (slot0)
	slot0:bind(slot0.ON_RANK, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {
			index = PowerRank.TYPE_ACT_BOSS_BATTLE
		})
	end)
	slot0:bind(slot0.ON_GET, function (slot0, slot1)
		slot0:sendNotification(GAME.SUBMIT_TASK, slot1)
	end)
	slot0:bind(slot0.ON_STAGE, function (slot0, slot1, slot2)
		function slot3()
			slot0:addSubLayers(Context.New({
				mediator = PreCombatMediator,
				viewComponent = PreCombatLayer,
				data = {
					stageId = slot1,
					system = SYSTEM_ACT_BOSS
				}
			}))
		end

		if slot2 then
			slot4 = pg.StoryMgr.GetInstance()

			if slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE) and not slot5:isEnd() then
				slot4:Play(slot5:getConfig("config_client").story_init, slot3)
			else
				slot3()
			end
		else
			slot3()
		end
	end)
	slot0.viewComponent:setPlayer(slot1)
	slot0.viewComponent:setFleet(getProxy(FleetProxy):getData()[1])

	slot0.activityProxy = getProxy(ActivityProxy)

	slot0.viewComponent:setTaskAct(slot3)
	slot0:sendNotification(GAME.ACTIVITY_OPERATION, {
		cmd = 1,
		activity_id = slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE).id
	})
end

slot0.listNotificationInterests = function (slot0)
	return {
		ActivityProxy.ACTIVITY_OPERATION_DONE,
		GAME.SUBMIT_TASK_DONE,
		PlayerProxy.UPDATED,
		ActivityProxy.ACTIVITY_UPDATED
	}
end

slot0.handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == ActivityProxy.ACTIVITY_OPERATION_DONE then
		slot0:playStroys(slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE), function ()
			slot0.viewComponent:setActivity(slot0.viewComponent)
		end)

		return
	end

	if slot2 == GAME.SUBMIT_TASK_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3, function ()
			slot0.viewComponent:showAwards()
		end)
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	elseif slot2 == ActivityProxy.ACTIVITY_UPDATED then
		slot0:playStroys(slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE), function ()
			slot0.viewComponent:setActivity(slot0.viewComponent)
		end)
	end
end

slot0.playStroys = function (slot0, slot1, slot2)
	slot3 = {}
	slot4 = pg.expedition_data_template

	if table.contains(slot1.data1_list, table.remove(slot6, 1).config.id) then
		slot9 = pg.StoryMgr.GetInstance()
		slot10 = slot1:getConfig("config_client").story
		slot12 = pg.extraenemy_template[slot1.data1]

		if slot1.data4 - slot1.data2 <= 0 then
			slot13 = 0
		end

		slot14 = math.floor(slot13 / slot1.data4 * 10000)

		for slot18, slot19 in pairs(slot10) do
			if slot19[1] < slot14 then
				break
			end

			if slot19[2] and slot20 ~= "" and not slot9:IsPlayed(slot20) then
				table.insert(slot3, function (slot0)
					slot0:Play(slot0.Play, slot0, true, true)
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
