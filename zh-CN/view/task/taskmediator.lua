slot0 = class("TaskMediator", import("..base.ContextMediator"))
slot0.ON_TASK_SUBMIT = "TaskMediator:ON_TASK_SUBMIT"
slot0.ON_TASK_GO = "TaskMediator:ON_TASK_GO"
slot0.TASK_FILTER = "TaskMediator:TASK_FILTER"
slot0.CLICK_GET_ALL = "TaskMediator:CLICK_GET_ALL"

function slot0.register(slot0)
	slot0:bind(slot0.ON_TASK_SUBMIT, function (slot0, slot1)
		if getProxy(ActivityProxy):getActivityById(ActivityConst.JYHZ_ACTIVITY_ID) and slot1.id == _.flatten(slot4)[#_.flatten(slot4)] then
			pg.StoryMgr.GetInstance():Play("YIXIAN8", function ()
				slot0:sendNotification(GAME.SUBMIT_TASK, slot1.id)
			end)

			return
		end

		if slot1.index then
			slot0:sendNotification(GAME.SUBMIT_TASK, {
				taskId = slot1.id,
				index = slot1.index
			})
		else
			slot0:sendNotification(GAME.SUBMIT_TASK, slot1.id)
		end
	end)
	slot0:bind(slot0.ON_TASK_GO, function (slot0, slot1)
		slot0:sendNotification(GAME.TASK_GO, {
			taskVO = slot1
		})
	end)
	slot0:bind(slot0.CLICK_GET_ALL, function (slot0, slot1, slot2)
		slot3 = {}

		function slot4(slot0, slot1)
			slot3 = nil

			if slot0[slot0]:isSelectable() then
				slot3 = {
					type = slot2:getConfig("award_choice")[slot2.index][1],
					id = slot2.getConfig("award_choice")[slot2.index][2],
					number = slot2.getConfig("award_choice")[slot2.index][3]
				}
			end

			slot1[#slot1 + 1] = {
				id = slot2.id,
				award_choice = slot3
			}

			if slot0 <= #slot0 then
				slot1()
			end
		end

		function slot5(slot0, slot1, slot2)
			function slot1.overFlow.onYes()
				slot0(slot1, slot2)
			end

			function slot1.overFlow.onNo()
				slot0()
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox(slot1.overFlow)
		end

		function slot6(slot0, slot1, slot2)
			function slot1.choice.onYes()
				if not taskVO.index then
					pg.TipsMgr.GetInstance():ShowTips(i18n("no_item_selected_tip"))
					pg.TipsMgr.GetInstance().ShowTips()

					return
				end

				if slot1.overFlow then
					slot2()
				else
					slot3(slot4, slot3)
				end
			end

			function slot1.choice.onNo()
				slot0()
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox(slot1.choice)
		end

		function slot7(slot0, slot1, slot2)
			function slot1.sub.onYes()
				if slot0.choice then
					slot1()
				elseif slot0.overFlow then
					slot2()
				else
					slot3(slot4, slot5)
				end
			end

			function slot1.sub.onNo()
				slot0()
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox(slot1.sub)
		end

		slot8 = {}

		for slot12, slot13 in ipairs(slot1) do
			slot8[slot12] = function ()
				if slot0.sub then
					slot1(slot2, slot1, slot3[slot2 + 1])
				elseif slot0.choice then
					slot4(slot2, slot4, slot3[slot2 + 1])
				elseif slot0.overFlow then
					slot5(slot2, slot5, slot3[slot2 + 1])
				else
					slot6(slot2, slot3[slot2 + 1])
				end
			end
		end

		slot8[#slot8 + 1] = function ()
			if #slot0 > 0 then
				slot1:sendNotification(GAME.SUBMIT_TASK_ONESTEP, slot1.sendNotification)
			end
		end

		slot8[1]()
	end)

	slot3 = getProxy(BagProxy)

	for slot7, slot8 in pairs(slot2) do
		if slot8:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
			slot8.progress = slot3:getItemCountById(tonumber(slot8:getConfig("target_id_for_client")))
		elseif slot8:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
			slot8.progress = getProxy(ActivityProxy):getVirtualItemNumber(slot8:getConfig("target_id_for_client"))
		end
	end

	slot0.viewComponent:setTaskVOs(slot2)
end

function slot0.enterLevel(slot0, slot1)
	if getProxy(ChapterProxy):getChapterById(slot1) then
		slot4 = {
			mapIdx = slot3:getConfig("map")
		}

		if slot3.active then
			slot4.chapterId = slot3.id
		else
			slot4.openChapterId = slot1
		end

		slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot4)
	end
end

function slot0.remove(slot0)
	return
end

function slot0.listNotificationInterests(slot0)
	return {
		TaskProxy.TASK_ADDED,
		TaskProxy.TASK_UPDATED,
		TaskProxy.TASK_REMOVED,
		GAME.SUBMIT_TASK_DONE,
		slot0.TASK_FILTER,
		GAME.BEGIN_STAGE_DONE,
		GAME.CHAPTER_OP_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == TaskProxy.TASK_ADDED then
		if slot3:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
			slot3.progress = getProxy(BagProxy):getItemCountById(tonumber(slot3:getConfig("target_id_for_client")))
		elseif slot3:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
			slot3.progress = getProxy(ActivityProxy):getVirtualItemNumber(slot3:getConfig("target_id_for_client"))
		end

		slot0.viewComponent:addTask(slot3)
	elseif slot2 == GAME.CHAPTER_OP_DONE then
		if slot0.chapterId then
			slot0:enterLevel(slot0.chapterId)

			slot0.chapterId = nil
		end
	elseif slot2 == TaskProxy.TASK_UPDATED then
		if slot3:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
			slot3.progress = getProxy(BagProxy):getItemCountById(tonumber(slot3:getConfig("target_id_for_client")))
		elseif slot3:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
			slot3.progress = getProxy(ActivityProxy):getVirtualItemNumber(slot3:getConfig("target_id_for_client"))
		end

		slot0.viewComponent:updateTask(slot3)
	elseif slot2 == TaskProxy.TASK_REMOVED then
		slot0.viewComponent:removeTask(slot3)
	elseif slot2 == slot0.TASK_FILTER then
		slot0.viewComponent:GoToFilter(slot3)
	elseif slot2 == GAME.SUBMIT_TASK_DONE then
		slot4 = getProxy(TaskProxy)
		slot0.viewComponent.onShowAwards = true

		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3, function ()
			slot0.viewComponent.onShowAwards = nil

			slot0.viewComponent:accepetActivityTask()
			slot0.viewComponent.accepetActivityTask.viewComponent:updateOneStepBtn()
		end)
	elseif slot2 == GAME.BEGIN_STAGE_DONE then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
	end
end

function slot0.accepetActivityTask(slot0)
	slot0:sendNotification(GAME.ACCEPT_ACTIVITY_TASK)
end

return slot0
