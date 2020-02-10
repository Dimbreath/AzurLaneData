slot0 = class("CommanderInfoMediator", import("..base.ContextMediator"))
slot0.FETCH_NOT_LEARNED_TALENT = "CommanderInfoMediator:FETCH_NOT_LEARNED_TALENT"
slot0.RESET_TALENTS = "CommanderInfoMediator:RESET_TALENTS"
slot0.ON_LEARN_TALENT = "CommanderInfoMediator:ON_LEARN_TALENT"
slot0.ON_SELECT = "CommanderInfoMediator:ON_SELECT"
slot0.ON_UPGRADE = "CommanderInfoMediator:ON_UPGRADE"
slot0.ON_NEXT = "CommanderInfoMediator:ON_NEXT"
slot0.ON_PREV = "CommanderInfoMediator:ON_PREV"
slot0.ON_RENAME = "CommanderInfoMediator:ON_RENAME"

function slot0.register(slot0)
	slot0:bind(CommandRoomMediator.OPEN_RENAME_PANEL, function (slot0, slot1)
		uv0.viewComponent:opeRenamePanel(slot1)
	end)
	slot0:bind(CommandRoomMediator.SHOW_MSGBOX, function (slot0, slot1)
		uv0.viewComponent:openMsgBox(slot1)
	end)
	slot0:bind(CommandRoomMediator.ON_TREE_MSGBOX, function (slot0, slot1)
		uv0.viewComponent:openTreePanel(slot1)
	end)
	slot0:bind(CommandRoomMediator.ON_CMD_SKILL, function (slot0, slot1)
		slot5.mediator = CommanderSkillMediator
		slot5.viewComponent = CommanderSkillLayer
		slot6.skill = slot1
		slot5.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.ON_RENAME, function (slot0, slot1, slot2)
		slot6.commanderId = slot1
		slot6.name = slot2

		uv0:sendNotification(GAME.COMMANDER_RENAME, {})
	end)
	slot0:bind(uv0.ON_NEXT, function (slot0)
		uv0.contextData.materialIds = {}
		slot1 = uv0.contextData.displayIds or {}

		if table.indexof(slot1, uv0.contextData.commanderId) + 1 <= #slot1 then
			slot4 = slot1[slot3 + 1]
			uv0.contextData.commanderId = slot4

			uv0:setCommander()

			CommandRoomScene.commanderId = slot4
		end
	end)
	slot0:bind(uv0.ON_PREV, function (slot0)
		uv0.contextData.materialIds = {}

		if table.indexof(uv0.contextData.displayIds or {}, uv0.contextData.commanderId) - 1 > 0 then
			slot4 = slot1[slot3 - 1]
			uv0.contextData.commanderId = slot4

			uv0:setCommander()

			CommandRoomScene.commanderId = slot4
		end
	end)
	slot0:bind(CommandRoomMediator.ON_LOCK, function (slot0, slot1, slot2)
		slot6.commanderId = slot1
		slot6.flag = slot2

		uv0:sendNotification(GAME.COMMANDER_LOCK, {})
	end)
	slot0:bind(uv0.FETCH_NOT_LEARNED_TALENT, function (slot0, slot1)
		slot5.id = slot1

		uv0:sendNotification(GAME.COMMANDER_FETCH_NOT_LEARNED_TALENT, {})
	end)
	slot0:bind(uv0.RESET_TALENTS, function (slot0, slot1)
		slot5.id = slot1

		uv0:sendNotification(GAME.COMMANDER_RESET_TALENTS, {})
	end)
	slot0:bind(uv0.ON_LEARN_TALENT, function (slot0, slot1, slot2, slot3)
		slot7.id = slot1
		slot7.talentId = slot2
		slot7.replaceid = slot3

		uv0:sendNotification(GAME.COMMANDER_LEARN_TALENTS, {})
	end)
	slot0:bind(uv0.ON_SELECT, function (slot0)
		uv0.contextData.page = CommanderInfoScene.PAGE_PLAY
		slot1 = getProxy(CommanderProxy):getCommanderById(uv0.contextData.commanderId)

		for slot7, slot8 in pairs(getProxy(CommanderProxy):getData()) do
			if slot8:isLocked() then
				table.insert({}, slot8.id)
			end
		end

		slot4 = getProxy(ChapterProxy)

		if slot4:getActiveChapter() then
			_.each(slot4.fleets, function (slot0)
				for slot5, slot6 in pairs(slot0:getCommanders()) do
					table.insert(uv0, slot6.id)
				end
			end)
		end

		table.insert(slot3, uv0.contextData.commanderId)

		slot6 = getProxy(FleetProxy):getCommanders()
		slot11.mode = CommandRoomScene.MODE_SELECT
		slot11.activeCommander = slot1
		slot11.activeGroupId = slot1.groupId
		slot11.selectedIds = uv0.contextData.materialIds
		slot11.ignoredIds = slot3

		function slot11.onCommander(slot0, slot1, slot2, slot3)
			slot4 = nil

			return function ()
				if uv0:isMaxLevel() then
					if not uv0:isSameGroup(uv1.groupId) then
						return false, i18n("commander_select_matiral_erro")
					end
				end

				if _.detect(uv2, function (slot0)
					return uv0.id == slot0.commanderId
				end) then
					slot3.content = i18n("commander_material_is_in_fleet_tip")

					function slot3.onYes()
						slot3.fleetId = uv1.fleetId
						slot3.pos = uv1.pos

						function slot3.callback()
							uv0 = uv1:getCommanders()

							if uv2 then
								uv2()
							end
						end

						uv0:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
							commanderId = 0
						})
					end

					function slot3.onNo()
						if uv0 then
							uv0()
						end
					end

					function slot3.onClose()
						if uv0 then
							uv0()
						end
					end

					uv3:openMsgBox({})
				end

				return true
			end()
		end

		function slot11.onSelected(slot0, slot1)
			uv0.contextData.materialIds = slot0

			slot1()
		end

		uv0:sendNotification(GAME.GO_SCENE, SCENE.COMMANDROOM, {
			maxCount = 10
		})
	end)
	slot0:bind(uv0.ON_UPGRADE, function (slot0, slot1, slot2, slot3)
		slot7.id = slot1
		slot7.materialIds = slot2
		slot7.skillId = slot3

		uv0:sendNotification(GAME.COMMANDER_UPGRADE, {})
	end)
	slot0:setCommander()
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
	slot0.viewComponent:setPools(getProxy(CommanderProxy):getPools())
end

function slot0.setCommander(slot0)
	slot2 = getProxy(CommanderProxy):getCommanderById(slot0.contextData.commanderId)

	slot0:markFleet(slot2)
	slot0.viewComponent:setCommander(slot2)
end

function slot0.markFleet(slot0, slot1)
	for slot7, slot8 in pairs(getProxy(FleetProxy):getData()) do
		for slot12, slot13 in pairs(slot8:getCommanders()) do
			if slot13.id == slot1.id then
				slot14 = slot8.id

				if slot8.id > 10 then
					slot14 = slot8.id - 10
				end

				slot1.fleetId = slot14
				slot1.inFleet = true

				break
			end
		end
	end

	slot4 = getProxy(ChapterProxy)

	if slot4:getActiveChapter() then
		_.each(slot4.fleets, function (slot0)
			if _.any(_.values(slot0:getCommanders()), function (slot0)
				return slot0.id == uv0.id
			end) then
				uv0.inBattle = true
			end
		end)
	end
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.COMMANDER_FETCH_NOT_LEARNED_TALENT_DONE
	slot1[2] = CommanderProxy.COMMANDER_UPDATED
	slot1[3] = GAME.COMMANDER_LEARN_TALENTS_DONE
	slot1[4] = GAME.COMMANDER_UPGRADE_DONE
	slot1[5] = GAME.COMMANDER_LOCK_DONE
	slot1[6] = PlayerProxy.UPDATED
	slot1[7] = GAME.COMMANDER_RENAME_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if GAME.COMMANDER_FETCH_NOT_LEARNED_TALENT_DONE == slot1:getName() then
		slot4 = slot0.viewComponent.panels[CommanderInfoScene.PAGE_TALENT]

		slot4:update(slot1:getBody().commander)
		slot4:openUseagePanel()
	elseif slot2 == CommanderProxy.COMMANDER_UPDATED then
		if slot0.viewComponent.commanderVO.id == slot3.id then
			slot0:markFleet(slot3)
			slot0.viewComponent:setCommander(slot3)
		end
	elseif slot2 == GAME.COMMANDER_LEARN_TALENTS_DONE then
		slot4 = slot0.viewComponent.panels[CommanderInfoScene.PAGE_TALENT]

		slot4:update(slot3.commander)
		slot4:closeUsagePanel()
	elseif slot2 == GAME.COMMANDER_UPGRADE_DONE then
		for slot7 = #slot0.contextData.displayIds, 1, -1 do
			slot8 = slot0.contextData.displayIds[slot7]

			if _.any(slot0.contextData.materialIds, function (slot0)
				return uv0 == slot0
			end) then
				table.remove(slot0.contextData.displayIds, slot7)
			end
		end

		slot0.contextData.materialIds = {}

		pg.UIMgr.GetInstance():LoadingOn(false)
		slot0.viewComponent.panels[CommanderInfoScene.PAGE_PLAY]:playAnim(slot3.oldCommander, slot3.commander, function ()
			pg.UIMgr.GetInstance():LoadingOff(false)
		end)
	elseif slot2 == GAME.COMMANDER_LOCK_DONE then
		if slot3.flag == 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_lock_done"))
		elseif slot3.flag == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_unlock_done"))
		end
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	elseif slot2 == GAME.COMMANDER_RENAME_DONE then
		pg.TipsMgr.GetInstance():ShowTips(i18n("commander_rename_success_tip"))
	end
end

return slot0
