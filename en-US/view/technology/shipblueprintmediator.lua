slot0 = class("ShipBluePrintMediator", import("..base.ContextMediator"))
slot0.ON_START = "ShipBluePrintMediator:ON_START"
slot0.ON_FINISHED = "ShipBluePrintMediator:ON_FINISHED"
slot0.ON_FINISH_TASK = "ShipBluePrintMediator:ON_FINISH_TASK"
slot0.ON_MOD = "ShipBluePrintMediator:ON_MOD"
slot0.ON_TASK_OPEN = "ShipBluePrintMediator:ON_TASK_OPEN"
slot0.ON_MAIN = "ShipBluePrintMediator:ON_MAIN"
slot0.ON_CHECK_TAKES = "ShipBluePrintMediator:ON_CHECK_TAKES"
slot0.SHOW_SKILL_INFO = "ShipBluePrintMediator:SHOW_SKILL_INFO"
slot0.SET_TECHNOLOGY_VERSION = "ShipBluePrintMediator:SET_TECHNOLOGY_VERSION"
slot0.SIMULATION_BATTLE = "ShipBluePrintMediator:SIMULATION_BATTLE"

function slot0.register(slot0)
	if slot0.contextData.shipId then
		slot0.contextData.shipBluePrintVO = getProxy(TechnologyProxy):getBluePrintById(getProxy(BayProxy):getShipById(slot0.contextData.shipId).groupId)
	elseif slot0.contextData.shipGroupId then
		slot0.contextData.shipBluePrintVO = slot1:getBluePrintById(slot0.contextData.shipGroupId)
	end

	slot0:bind(uv0.ON_MAIN, function ()
		if getProxy(ContextProxy):getContextByMediator(EquipmentMediator) and slot1:getContextByMediator(ItemInfoMediator) then
			slot1:removeChild(slot2)
		end

		uv0.viewComponent:emit(BaseUI.ON_BACK)
	end)
	slot0:bind(uv0.ON_START, function (slot0, slot1)
		slot5.id = slot1

		uv0:sendNotification(GAME.BUILD_SHIP_BLUEPRINT, {})
	end)
	slot0:bind(uv0.ON_FINISHED, function (slot0, slot1)
		slot5.id = slot1

		uv0:sendNotification(GAME.FINISH_SHIP_BLUEPRINT, {})
	end)
	slot0:bind(uv0.ON_FINISH_TASK, function (slot0, slot1)
		slot3.id = slot1
		slot2 = Task.New({})

		if slot2:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
			slot5[1] = DROP_TYPE_ITEM
			slot5[2] = slot2:getConfig("target_id_for_client")
			slot5[MULTRES] = slot2:getConfig("target_num")
			slot4[1] = {}
			slot6.content = i18n("blueprint_commit_tip", getDropInfo({}))

			function slot6.onYes()
				uv0:sendNotification(GAME.SUBMIT_TASK, uv1)
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({})
		elseif slot2:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
			slot5[1] = DROP_TYPE_RESOURCE
			slot5[2] = slot2:getConfig("target_id_for_client")
			slot5[MULTRES] = slot2:getConfig("target_num")
			slot4[1] = {}
			slot6.content = i18n("blueprint_commit_tip", getDropInfo({}))

			function slot6.onYes()
				uv0:sendNotification(GAME.SUBMIT_TASK, uv1)
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({})
		else
			uv0:sendNotification(GAME.SUBMIT_TASK, slot1)
		end
	end)
	slot0:bind(uv0.ON_MOD, function (slot0, slot1, slot2)
		slot6.id = slot1
		slot6.count = slot2

		uv0:sendNotification(GAME.MOD_BLUEPRINT, {})
	end)
	slot0:bind(uv0.ON_TASK_OPEN, function (slot0, slot1)
		if not getProxy(TaskProxy):isFinishPrevTasks(slot1) then
			return
		end

		uv0:sendNotification(GAME.TRIGGER_TASK, slot1)
	end)
	slot0:bind(uv0.ON_CHECK_TAKES, function (slot0, slot1)
		slot2 = getProxy(TechnologyProxy)
		slot3 = slot2:getBluePrintById(slot1)

		if slot3:isFinishedAllTasks() then
			slot3:finish()
			slot2:updateBluePrint(slot3)
		end
	end)
	slot0:bind(uv0.SHOW_SKILL_INFO, function (slot0, slot1, slot2, slot3)
		slot7.mediator = SkillInfoMediator
		slot7.viewComponent = SkillInfoLayer
		slot8.skillOnShip = slot2
		slot8.skillId = slot1
		slot8.onExit = slot3
		slot7.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.SET_TECHNOLOGY_VERSION, function (slot0, slot1)
		uv0:setVersion(slot1)
	end)
	slot0:bind(uv0.SIMULATION_BATTLE, function (slot0, slot1)
		slot5.system = SYSTEM_SIMULATION
		slot5.stageId = slot1

		uv0:sendNotification(GAME.BEGIN_STAGE, {})
	end)
	slot0.viewComponent:setShipBluePrints(slot1:getBluePrints())
	slot0.viewComponent:setItemVOs(getProxy(BagProxy):getItemsByType(Item.BLUEPRINT_TYPE))
	slot0.viewComponent:setShipVOs(getProxy(BayProxy):getRawData())
	slot0.viewComponent:setVersion(slot1:getVersion())
	slot0.viewComponent:setTaskVOs(getProxy(TaskProxy):getTasksForBluePrint())
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.BUILD_SHIP_BLUEPRINT_DONE
	slot1[2] = TechnologyProxy.BLUEPRINT_UPDATED
	slot1[3] = BagProxy.ITEM_UPDATED
	slot1[4] = BagProxy.ITEM_ADDED
	slot1[5] = TaskProxy.TASK_ADDED
	slot1[6] = TaskProxy.TASK_UPDATED
	slot1[7] = TaskProxy.TASK_REMOVED
	slot1[8] = GAME.SUBMIT_TASK_DONE
	slot1[9] = GAME.FINISH_SHIP_BLUEPRINT_DONE
	slot1[10] = GAME.STOP_BLUEPRINT_DONE
	slot1[11] = GAME.MOD_BLUEPRINT_DONE
	slot1[12] = BayProxy.SHIP_ADDED
	slot1[13] = BayProxy.SHIP_UPDATED
	slot1[14] = GAME.BEGIN_STAGE_DONE
	slot1[15] = GAME.MOD_BLUEPRINT_ANIM_LOCK

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == TechnologyProxy.BLUEPRINT_UPDATED then
		slot0.viewComponent:updateShipBluePrintVO(slot1:getBody())
	elseif slot2 == BagProxy.ITEM_UPDATED or slot2 == BagProxy.ITEM_ADDED then
		slot0.viewComponent:setItemVOs(getProxy(BagProxy):getItemsByType(Item.BLUEPRINT_TYPE))
	elseif slot2 == GAME.EXCHANG_BLUEPRINT_DONE then
		slot0.viewComponent:clearSelected()
		slot0.viewComponent:updateExchangeItems()
		slot0.viewComponent:updateBuildInfo()
	elseif slot2 == TaskProxy.TASK_ADDED or TaskProxy.TASK_UPDATED == slot2 or TaskProxy.TASK_REMOVED == slot2 then
		slot0.viewComponent:setTaskVOs(getProxy(TaskProxy):getTasksForBluePrint())
		slot0.viewComponent:updateTaskList()
		slot0.viewComponent:updateTasksProgress()
	elseif slot2 == GAME.SUBMIT_TASK_DONE then
		if slot0.contextData.shipBluePrintVO and slot4:isDeving() and slot4:isFinishedAllTasks() then
			slot5 = getProxy(TechnologyProxy)
			slot6 = slot5:getBluePrintById(slot4.id)

			slot6:finish()
			slot5:updateBluePrint(slot6)
		end
	elseif GAME.FINISH_SHIP_BLUEPRINT_DONE == slot2 then
		slot7.mediator = NewShipMediator
		slot7.viewComponent = NewShipLayer
		slot8.ship = slot3.ship
		slot8.quitCallBack = slot3.quitCallBack
		slot8.canSkipBatch = slot3.canSkipBatch
		slot7.data = {}

		function slot7.onRemoved()
			pg.StoryMgr.GetInstance():Play("FANGAN2")
		end

		slot0:addSubLayers(Context.New({}))
	elseif GAME.STOP_BLUEPRINT_DONE == slot2 then
		slot0.viewComponent:clearTimers(slot3.id)
	elseif GAME.MOD_BLUEPRINT_DONE == slot2 then
		slot0.viewComponent:doModAnim(slot3.oldBluePrint, slot3.newBluePrint)
	elseif slot2 == BayProxy.SHIP_ADDED or BayProxy.SHIP_UPDATED == slot2 then
		slot0.viewComponent:setShipVOs(getProxy(BayProxy):getRawData())
	elseif GAME.BUILD_SHIP_BLUEPRINT_DONE == slot2 then
		slot0.viewComponent:buildStartAni("researchStartWindow")
	elseif slot2 == GAME.BEGIN_STAGE_DONE then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
	elseif slot2 == GAME.MOD_BLUEPRINT_ANIM_LOCK then
		slot0.viewComponent.noUpdateMod = true
	end
end

return slot0
