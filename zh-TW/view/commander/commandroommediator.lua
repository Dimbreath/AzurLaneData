slot0 = class("CommandRoomMediator", import("..base.ContextMediator"))
slot0.ON_GET = "CommandRoomMediator:ON_GET"
slot0.ON_BUILD = "CommandRoomMediator:ON_BUILD"
slot0.ON_BATCH_BUILD = "CommandRoomMediator:ON_BATCH_BUILD"
slot0.ON_BATCH_GET = "CommandRoomMediator:ON_BATCH_GET"
slot0.ON_FETCH = "CommandRoomMediator:ON_FETCH"
slot0.ON_RESERVE_BOX = "CommandRoomMediator:ON_RESERVE_BOX"
slot0.ON_REMARK = "CommandRoomMediator:ON_REMARK"
slot0.ON_RENAME = "CommandRoomMediator:ON_RENAME"
slot0.ON_CMD_SKILL = "CommandRoomMediator:ON_CMD_SKILL"
slot0.SHOW_MSGBOX = "CommandRoomMediator:SHOW_MSGBOX"
slot0.ON_TREE_MSGBOX = "CommandRoomMediator:ON_TREE_MSGBOX"
slot0.ON_DETAIL = "CommandRoomMediator:ON_DETAIL"
slot0.OPEN_RENAME_PANEL = "CommandRoomMediator:OPEN_RENAME_PANEL"
slot0.ON_LOCK = "CommandRoomMediator:ON_LOCK"

function slot0.register(slot0)
	slot2 = getProxy(CommanderProxy)

	slot0:bind(uv0.ON_LOCK, function (slot0, slot1, slot2)
		slot6.commanderId = slot1
		slot6.flag = slot2

		uv0:sendNotification(GAME.COMMANDER_LOCK, {})
	end)
	slot0:bind(uv0.OPEN_RENAME_PANEL, function (slot0, slot1)
		uv0.viewComponent:opeRenamePanel(slot1)
	end)
	slot0:bind(uv0.SHOW_MSGBOX, function (slot0, slot1)
		uv0.viewComponent:openMsgBox(slot1)
	end)
	slot0:bind(uv0.ON_TREE_MSGBOX, function (slot0, slot1)
		uv0.viewComponent:openTreePanel(slot1)
	end)
	slot0:bind(uv0.ON_RENAME, function (slot0, slot1, slot2)
		slot6.commanderId = slot1
		slot6.name = slot2

		uv0:sendNotification(GAME.COMMANDER_RENAME, {})
	end)
	slot0:bind(uv0.ON_CMD_SKILL, function (slot0, slot1)
		slot5.mediator = CommanderSkillMediator
		slot5.viewComponent = CommanderSkillLayer
		slot6.skill = slot1
		slot5.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.ON_REMARK, function ()
		uv0.viewComponent:setCommanders(uv0:markFleet())
	end)
	slot0:bind(uv0.ON_RESERVE_BOX, function (slot0, slot1, slot2)
		slot6.count = slot1

		uv0:sendNotification(GAME.COMMANDER_RESERVE_BOX, {})
	end)
	slot0:bind(uv0.ON_GET, function (slot0, slot1, slot2)
		slot6.id = slot1
		slot6.callback = slot2

		uv0:sendNotification(GAME.COMMANDER_ON_OPEN_BOX, {})
	end)
	slot0:bind(uv0.ON_BATCH_GET, function (slot0, slot1)
		for slot6, slot7 in pairs(slot1) do
			if slot7:getState() == CommanderBox.STATE_FINISHED then
				table.insert({}, slot7.id)
			end
		end

		slot6.boxIds = slot2

		uv0:sendNotification(GAME.COMMANDER_ON_BATCH, {})
	end)
	slot0:bind(uv0.ON_BUILD, function (slot0, slot1, slot2)
		slot6.id = slot1
		slot6.callback = slot2

		uv0:sendNotification(GAME.COMMANDER_ON_BUILD, {})
	end)
	slot0:bind(uv0.ON_BATCH_BUILD, function (slot0, slot1)
		for slot6 = 1, #slot1, 1 do
			slot7 = slot1[slot6]

			table.insert({}, function (slot0)
				uv0.viewComponent:emit(uv1.ON_BUILD, uv2, slot0)
			end)
		end

		seriesAsync(slot2)
	end)
	slot0:bind(uv0.ON_DETAIL, function (slot0, slot1, slot2)
		for slot8, slot9 in ipairs(uv0.viewComponent.disPlayCommanderVOs or {}) do
			table.insert({}, slot9.id)
		end

		slot9.commanderId = slot1
		slot9.mode = uv0.viewComponent.mode
		slot9.displayIds = slot3
		slot9.page = slot2

		uv0:sendNotification(GAME.GO_SCENE, SCENE.COMMANDERINFO, {})
	end)
	slot0:bind(uv0.ON_FETCH, function (slot0, slot1)
		if Application.isEditor then
			slot7.viewComponent = NewCommanderScene
			slot7.mediator = NewCommanderMediator
			slot8.commander = getProxy(CommanderProxy):getCommanderById(slot1)
			slot7.data = {}

			uv0:addSubLayers(Context.New({}))
		end
	end)
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
	slot0.viewComponent:setBoxes(slot2:getBoxes())
	slot0.viewComponent:setCommanders(slot0:markFleet())
	slot0.viewComponent:setReserveBoxCnt(slot2:getBoxUseCnt())
	slot0.viewComponent:setPools(slot2:getPools())
end

function slot0.markFleet(slot0)
	slot2 = getProxy(CommanderProxy):getData()

	for slot8, slot9 in pairs(getProxy(FleetProxy):getData()) do
		for slot13, slot14 in pairs(slot9:getCommanders()) do
			slot15 = slot9.id

			if slot9.id > 10 then
				slot15 = slot9.id - 10
			end

			slot2[slot14.id].fleetId = slot15
			slot2[slot14.id].inFleet = true
		end
	end

	slot5 = getProxy(ChapterProxy)

	if slot5:getActiveChapter() then
		_.each(slot5.fleets, function (slot0)
			slot1 = slot0:getCommanders()

			for slot5, slot6 in pairs(slot0:getCommanders()) do
				uv0[slot6.id].inBattle = true
			end
		end)
	end

	return slot2
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = CommanderProxy.COMMANDER_ADDED
	slot1[2] = CommanderProxy.COMMANDER_UPDATED
	slot1[3] = CommanderProxy.COMMANDER_DELETED
	slot1[4] = PlayerProxy.UPDATED
	slot1[5] = GAME.COMMANDER_ON_OPEN_BOX_DONE
	slot1[6] = GAME.COMMANDER_ON_BUILD_DONE
	slot1[7] = CommanderProxy.RESERVE_CNT_UPDATED
	slot1[8] = GAME.COMMANDER_RESERVE_BOX_DONE
	slot1[9] = GAME.COMMANDER_RENAME_DONE
	slot1[10] = GAME.COMMANDER_LOCK_DONE
	slot1[11] = GAME.COMMANDER_ON_BATCH_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.COMMANDER_ON_BUILD_DONE then
		slot0.viewComponent:setBoxes(getProxy(CommanderProxy):getBoxes())
		slot0.viewComponent:updateBoxes()
		slot0.viewComponent:updateRes()
	elseif slot2 == CommanderProxy.COMMANDER_ADDED or slot2 == CommanderProxy.COMMANDER_UPDATED or slot2 == CommanderProxy.COMMANDER_DELETED then
		slot0.viewComponent:setCommanders(slot0:markFleet())
		slot0.viewComponent:updateCommanders()
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	elseif slot2 == GAME.COMMANDER_ON_OPEN_BOX_DONE then
		if slot0.viewComponent.boxesPanel then
			pg.UIMgr.GetInstance():LoadingOn(false)
			slot0.viewComponent.boxesPanel:playFinshedAnim(slot3.boxId, function ()
				pg.UIMgr.GetInstance():LoadingOff()

				slot3.viewComponent = NewCommanderScene
				slot3.mediator = NewCommanderMediator
				slot4.commander = uv1.commander
				slot4.onExit = uv1.callback
				slot3.data = {}

				uv0:addSubLayers(Context.New({}))
				uv0.viewComponent:setBoxes(getProxy(CommanderProxy):getBoxes())
				uv0.viewComponent:updateBoxes()
			end)
		end
	elseif slot2 == CommanderProxy.RESERVE_CNT_UPDATED then
		slot0.viewComponent:setReserveBoxCnt(slot3)
	elseif slot2 == GAME.COMMANDER_RESERVE_BOX_DONE then
		slot0.viewComponent:OnReserveDone(slot3.awards)
	elseif slot2 == GAME.COMMANDER_RENAME_DONE then
		pg.TipsMgr.GetInstance():ShowTips(i18n("commander_rename_success_tip"))
	elseif slot2 == GAME.COMMANDER_LOCK_DONE then
		if slot3.flag == 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_lock_done"))
		elseif slot3.flag == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_unlock_done"))
		end
	elseif slot2 == GAME.COMMANDER_ON_BATCH_DONE then
		slot0.viewComponent:setBoxes(getProxy(CommanderProxy):getBoxes())

		if slot0.viewComponent.boxesPanel then
			function slot5()
				pg.UIMgr.GetInstance():LoadingOff()
				uv0.viewComponent:updateBoxes()

				for slot4, slot5 in ipairs(uv1.commanders) do
					table.insert({}, function (slot0)
						slot4.viewComponent = NewCommanderScene
						slot4.mediator = NewCommanderMediator
						slot5.commander = uv1
						slot5.onExit = slot0
						slot4.data = {}

						uv0:addSubLayers(Context.New({}))
					end)
				end

				seriesAsync(slot0)
			end

			pg.UIMgr.GetInstance():LoadingOn(false)

			for slot10, slot11 in ipairs(slot3.boxIds) do
				table.insert({}, function (slot0)
					uv0.viewComponent.boxesPanel:playFinshedAnim(uv1, function ()
						uv0()
					end)
				end)
			end

			parallelAsync(slot6, slot5)
		end
	end
end

return slot0
