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

	slot0:bind(slot0.ON_LOCK, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.COMMANDER_LOCK, {
			commanderId = slot1,
			flag = slot2
		})
	end)
	slot0:bind(slot0.OPEN_RENAME_PANEL, function (slot0, slot1)
		slot0.viewComponent:opeRenamePanel(slot1)
	end)
	slot0:bind(slot0.SHOW_MSGBOX, function (slot0, slot1)
		slot0.viewComponent:openMsgBox(slot1)
	end)
	slot0:bind(slot0.ON_TREE_MSGBOX, function (slot0, slot1)
		slot0.viewComponent:openTreePanel(slot1)
	end)
	slot0:bind(slot0.ON_RENAME, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.COMMANDER_RENAME, {
			commanderId = slot1,
			name = slot2
		})
	end)
	slot0:bind(slot0.ON_CMD_SKILL, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			mediator = CommanderSkillMediator,
			viewComponent = CommanderSkillLayer,
			data = {
				skill = slot1
			}
		}))
	end)
	slot0:bind(slot0.ON_REMARK, function ()
		slot0.viewComponent:setCommanders(slot0:markFleet())
	end)
	slot0:bind(slot0.ON_RESERVE_BOX, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.COMMANDER_RESERVE_BOX, {
			count = slot1
		})
	end)
	slot0:bind(slot0.ON_GET, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.COMMANDER_ON_OPEN_BOX, {
			id = slot1,
			callback = slot2
		})
	end)
	slot0:bind(slot0.ON_BATCH_GET, function (slot0, slot1)
		slot2 = {}

		for slot6, slot7 in pairs(slot1) do
			if slot7:getState() == CommanderBox.STATE_FINISHED then
				table.insert(slot2, slot7.id)
			end
		end

		slot0:sendNotification(GAME.COMMANDER_ON_BATCH, {
			boxIds = slot2
		})
	end)
	slot0:bind(slot0.ON_BUILD, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.COMMANDER_ON_BUILD, {
			id = slot1,
			callback = slot2
		})
	end)
	slot0:bind(slot0.ON_BATCH_BUILD, function (slot0, slot1)
		slot2 = {}

		for slot6 = 1, #slot1, 1 do
			slot7 = slot1[slot6]

			table.insert(slot2, function (slot0)
				slot0.viewComponent:emit(slot1.ON_BUILD, slot0.viewComponent, slot0)
			end)
		end

		seriesAsync(slot2)
	end)
	slot0:bind(slot0.ON_DETAIL, function (slot0, slot1, slot2)
		slot3 = {}
		slot4 = slot0.viewComponent.disPlayCommanderVOs or {}

		for slot8, slot9 in ipairs(slot4) do
			table.insert(slot3, slot9.id)
		end

		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMMANDERINFO, {
			commanderId = slot1,
			mode = slot0.viewComponent.mode,
			displayIds = slot3,
			page = slot2
		})
	end)
	slot0:bind(slot0.ON_FETCH, function (slot0, slot1)
		if Application.isEditor then
			slot0:addSubLayers(Context.New({
				viewComponent = NewCommanderScene,
				mediator = NewCommanderMediator,
				data = {
					commander = getProxy(CommanderProxy).getCommanderById(slot2, slot1)
				}
			}))
		end
	end)
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy).getData(slot1))
	slot0.viewComponent:setBoxes(slot2:getBoxes())
	slot0.viewComponent:setCommanders(slot3)
	slot0.viewComponent:setReserveBoxCnt(slot2:getBoxUseCnt())
	slot0.viewComponent:setPools(slot2:getPools())
end

function slot0.markFleet(slot0)
	slot2 = getProxy(CommanderProxy).getData(slot1)

	for slot8, slot9 in pairs(slot4) do
		for slot13, slot14 in pairs(slot9:getCommanders()) do
			slot15 = slot9.id

			if slot9.id > 10 then
				slot15 = slot9.id - 10
			end

			slot2[slot14.id].fleetId = slot15
			slot2[slot14.id].inFleet = true
		end
	end

	if getProxy(ChapterProxy):getActiveChapter() then
		_.each(slot5.fleets, function (slot0)
			slot1 = slot0:getCommanders()

			for slot5, slot6 in pairs(slot0:getCommanders()) do
				slot0[slot6.id].inBattle = true
			end
		end)
	end

	return slot2
end

function slot0.listNotificationInterests(slot0)
	return {
		CommanderProxy.COMMANDER_ADDED,
		CommanderProxy.COMMANDER_UPDATED,
		CommanderProxy.COMMANDER_DELETED,
		PlayerProxy.UPDATED,
		GAME.COMMANDER_ON_OPEN_BOX_DONE,
		GAME.COMMANDER_ON_BUILD_DONE,
		CommanderProxy.RESERVE_CNT_UPDATED,
		GAME.COMMANDER_RESERVE_BOX_DONE,
		GAME.COMMANDER_RENAME_DONE,
		GAME.COMMANDER_LOCK_DONE,
		GAME.COMMANDER_ON_BATCH_DONE
	}
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
				pg.UIMgr.GetInstance().LoadingOff:addSubLayers(Context.New({
					viewComponent = NewCommanderScene,
					mediator = NewCommanderMediator,
					data = {
						commander = slot1.commander,
						onExit = slot1.callback
					}
				}))

				slot0 = getProxy(CommanderProxy)

				slot0.viewComponent:setBoxes(slot0:getBoxes())
				slot0.viewComponent:updateBoxes()
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
				pg.UIMgr.GetInstance().LoadingOff.viewComponent:updateBoxes()

				slot0 = {}

				for slot4, slot5 in ipairs(slot1.commanders) do
					table.insert(slot0, function (slot0)
						slot0:addSubLayers(Context.New({
							viewComponent = NewCommanderScene,
							mediator = NewCommanderMediator,
							data = {
								commander = slot0.addSubLayers,
								onExit = slot0
							}
						}))
					end)
				end

				seriesAsync(slot0)
			end

			slot6 = {}

			pg.UIMgr.GetInstance():LoadingOn(false)

			for slot10, slot11 in ipairs(slot3.boxIds) do
				table.insert(slot6, function (slot0)
					slot0.viewComponent.boxesPanel:playFinshedAnim(slot0.viewComponent.boxesPanel.playFinshedAnim, function ()
						slot0()
					end)
				end)
			end

			parallelAsync(slot6, slot5)
		end
	end
end

return slot0
