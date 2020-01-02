slot0 = class("GuildPreCombatMediator", import("..base.ContextMediator"))
slot0.OP = "GuildPreCombatMediator.OP"
slot0.SAVE = "GuildPreCombatMediator.SAVE"
slot0.START = "GuildPreCombatMediator:START"
slot0.CHANGE_FLEET_SHIP = "GuildPreCombatMediator:CHANGE_FLEET_SHIP"
slot0.OPEN_SHIP_INFO = "GuildPreCombatMediator:OPEN_SHIP_INFO"

function slot0.register(slot0)
	getProxy(BayProxy).setSelectShipId(slot1, nil)
	slot0:bind(slot0.SAVE, function (slot0, slot1)
		slot0:save(slot1)
	end)
	slot0:bind(slot0.START, function (slot0)
		slot0:enter()
	end)
	slot0:bind(slot0.OP, function (slot0, slot1)
		slot0:save(function ()
			slot0:sendNotification(GAME.GUILD_OP, slot0)
		end)
	end)
	slot0:bind(slot0.CHANGE_FLEET_SHIP, function (slot0, slot1)
		slot0:openDockYard(slot1.type, slot1.shipVO, slot1.team)
	end)
	slot0:bind(slot0.OPEN_SHIP_INFO, function (slot0, slot1)
		if getProxy(BayProxy):getShipById(slot1) then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				shipId = slot1,
				shipVOs = slot0.contextData.guildChapter:getShips()
			})
		end
	end)
	slot0.viewComponent:setPlayerInfo(getProxy(PlayerProxy).getData(slot2))
	slot0.viewComponent:updateChapter(slot0.contextData.guildChapter)

	if slot0.contextData.guildChapter.active or slot0.contextData.confirmed then
		slot0.viewComponent:displayFormation()
	else
		slot0.viewComponent:displayFleetPanel()
	end
end

function slot0.listNotificationInterests(slot0)
	return {
		PlayerProxy.UPDATED,
		GAME.GUILD_ENTER_DONE,
		GAME.GUILD_OP_DONE,
		GAME.GUILD_ENTER_ERROR
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayerInfo(getProxy(PlayerProxy):getData())
	elseif slot2 == GAME.GUILD_ENTER_DONE then
		slot0.viewComponent:emit(BaseUI.ON_CLOSE)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
			chapterId = slot3 and slot4.id,
			mapIdx = slot4 and slot4:getConfig("map"),
			chapterVO = slot4
		})
	elseif slot2 == GAME.GUILD_ENTER_ERROR then
		if slot3 == 3 then
			slot0:display()
		end
	elseif slot2 == GAME.GUILD_OP_DONE and (slot3.type == ChapterConst.OpStrategy or slot3.type == ChapterConst.OpRepair or slot3.type == ChapterConst.OpRequest) then
		slot0:display()
	end
end

function slot0.display(slot0)
	slot0.contextData.guildChapter = getProxy(ChapterProxy).getGuildChapter(slot1)

	slot0.viewComponent:updateChapter(getProxy(ChapterProxy).getGuildChapter(slot1))
	slot0.viewComponent:displayFormation()
end

function slot0.save(slot0, slot1)
	slot3 = getProxy(ChapterProxy).getGuildChapter(slot2)
	slot4 = slot0.contextData.guildChapter
	slot5 = nil
	slot5 = coroutine.create(function ()
		slot0 = slot0.fleet:getShipIds()

		if slot0.fleet.active then
			if slot0.fleet:isFormationDiffWith(slot1.fleet) then
				slot2:sendNotification(GAME.GUILD_CHANGE_FORMATION, {
					fleetShipIds = slot0,
					callback = GAME.GUILD_CHANGE_FORMATION
				})
				coroutine.yield()

				slot1 = slot4:getGuildChapter()
			end
		else
			slot1:updateFriendShip(slot0:getFriendShip())
			slot1.updateFriendShip:updateRawShips(slot0:getRawShips())
			slot1.updateFriendShip.updateRawShips:updateFleetShips(slot0)
			slot4:updateGuildChapter(slot4.updateGuildChapter)
			slot4:localSaveGuildChapter()
		end

		if slot5 then
			slot5()
		end
	end)

	function ()
		if coroutine.status(coroutine.status) == "suspended" then
			slot0, slot1 = coroutine.resume(coroutine.resume)
		end
	end()
end

function slot0.enter(slot0)
	if not slot0.contextData.guildChapter:isValid() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("sham_team_limit"))
	elseif not slot1.fleet:isValid() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("sham_formation_invalid"))
	else
		slot2 = slot1.id

		if slot1.active then
			if getProxy(GuildProxy):getGuildEvent() and not slot4:isEnd() then
				slot0:save(function ()
					slot1:sendNotification(GAME.BEGIN_STAGE, {
						system = SYSTEM_GUILD,
						stageId = slot2.bossId
					})
				end)
			end
		else
			slot3 = _.keys(slot1:getRawShips())
			slot4 = slot1.fleet:getShipIds()
			slot5 = 0
			slot6 = 0

			if slot1:getFriendShip() then
				for slot13, slot14 in pairs(slot9) do
					if slot14.ship and slot14.ship.id == slot7.id then
						slot5 = slot13
						slot6 = slot7.id

						break
					end
				end
			end

			function slot8()
				slot0:sendNotification(GAME.GUILD_ENTER, {
					id = slot1,
					group_id_list = slot2,
					formation_list = slot3,
					friend_id = slot3,
					friend_ship_id = slot5
				})
			end

			if slot5 > 0 then
				slot8()
			else
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					hideNo = false,
					content = i18n("sham_friend_ship_tip"),
					onYes = slot8
				})
			end
		end
	end
end

function slot0.openDockYard(slot0, slot1, slot2, slot3)
	slot4 = slot0.contextData.guildChapter
	slot5 = {
		inSham = false,
		inChapter = false,
		inAdmiral = false,
		inFleet = false,
		inClass = false,
		inEvent = false,
		inTactics = false,
		inBackyard = false
	}
	slot6 = nil
	slot6 = coroutine.create(function ()
		slot5, slot1, slot2, slot3, slot4 = nil

		if slot0 == 0 then
			for slot8 = #slot1:getShips(true), 1, -1 do
				if slot0[slot8].hpRant <= 0 then
					table.remove(slot0, slot8)
				elseif slot1.fleet:containsShip(slot0[slot8].id) then
					slot0[slot8].guildInFleet = true
				end
			end

			slot1 = (slot2 and {
				slot2.id
			}) or {}
			slot2 = 1
			slot3 = 1
			slot4 = true
		elseif slot0 == 1 then
			slot2 = 0
			slot3 = math.min(ChapterConst.ShamShipLimit - (#slot1:getShips() - #_(slot5):chain():filter(function (slot0)
				return slot0:getTeamType() == slot0
			end):map(function (slot0)
				return slot0.id
			end):value()), ChapterConst.ShamTeamShipLimit)
			slot0 = _.filter(_.values(slot7), function (slot0)
				return slot0:getTeamType() == slot0
			end)
			slot4 = false
		elseif slot0 == 2 then
			slot8 = getProxy(PlayerProxy).playerGuildAssists
			slot9 = {}

			for slot13, slot14 in pairs(slot6) do
				if not slot8[slot13] or pg.TimeMgr.GetInstance():GetServerTime() - slot8[slot13].timeStamp > 60 then
					table.insert(slot9, slot13)
				end
			end

			if #slot9 > 0 then
				slot4:sendNotification(GAME.REQ_PLAYER_ASSIST_SHIP, {
					playerIds = slot9,
					type = Player.ASSISTS_TYPE_GUILD,
					callback = slot5
				})
				coroutine.yield()
			end

			slot0 = {}

			for slot13, slot14 in pairs(slot8) do
				if slot6[slot13] then
					slot14.ship.playerId = slot13

					table.insert(slot0, slot14.ship)
				end
			end

			slot1 = (slot1:getFriendShip() and {
				slot10.id
			}) or {}
			slot2 = 1
			slot3 = 1
			slot4 = true
		end

		slot12.onShip, slot12.confirmSelect, slot12.onSelected = slot4:getDockCallbackFuncs(slot0, slot2, slot3)

		slot4:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			shipVOs = slot0,
			selectedIds = slot1,
			selectedMin = slot2,
			selectedMax = slot3,
			leastLimitMsg = i18n("ship_formationMediator_leastLimit"),
			quitTeam = slot4,
			teamFilter = slot3,
			leftTopInfo = i18n("word_formation"),
			onShip = slot5,
			confirmSelect = slot6,
			onSelected = slot7,
			flags = slot6,
			selectFriend = slot0 == 2
		})
	end)

	function ()
		if coroutine.status(coroutine.status) == "suspended" then
			slot0, slot1 = coroutine.resume(coroutine.resume)
		end
	end()
end

function slot0.getDockCallbackFuncs(slot0, slot1, slot2, slot3)
	slot5 = slot0.contextData.guildChapter.fleet

	return function (slot0, slot1, slot2)
		if slot0 == 0 then
			if not slot1.fleet:containsShip(slot0.id) and slot3:containsSameKind(slot0) and (not slot2 or not slot2:isSameKind(slot0)) then
				return false, i18n("event_same_type_not_allowed")
			end
		elseif slot0 == 1 then
			if slot0.level < ChapterConst.ShamShipLevelLimit then
				return false, i18n("sham_ship_level_limit", ChapterConst.ShamShipLevelLimit)
			end

			slot3 = getProxy(BayProxy)

			for slot7, slot8 in ipairs(slot2) do
				if slot3:getShipById(slot8) and slot0:isSameKind(slot9) then
					return false, i18n("event_same_type_not_allowed")
				end
			end
		elseif slot0 == 2 and slot0.level < ChapterConst.ShamShipLevelLimit then
			return false, i18n("sham_ship_level_limit", ChapterConst.ShamShipLevelLimit)
		end

		return true
	end, function (slot0, slot1, slot2)
		slot1()
	end, function (slot0)
		slot1 = getProxy(BayProxy)

		if slot0 == 0 then
			slot2 = nil

			if not ((slot1:getFriendShip() and slot3.id == slot0[1] and slot3) or slot1:getShip(slot0[1])) then
				if slot2 then
					slot4 = slot2:getTeamType()

					if slot1.active and #slot3[slot4] == 1 then
						pg.TipsMgr.GetInstance():ShowTips(i18n("ship_formationUI_removeError_onlyShip", slot2:getName(), "", Fleet.C_TEAM_NAME[slot4]))
					else
						slot3:removeShip(slot2.id)
					end
				end
			elseif slot2 then
				if slot3:containsShip(slot2.id) then
					slot3:switchShip(slot2.id, slot2.id)
				else
					slot3:replaceShip(slot2.id, {
						id = slot2.id,
						hp_rant = slot2.hpRant,
						strategies = slot2.strategies
					})
				end
			else
				slot3:addShip({
					id = slot2.id,
					hp_rant = slot2.hpRant,
					strategies = slot2.strategies
				})
			end
		elseif slot0 == 1 then
			if not slot1.active then
				_.each(slot0, function (slot0)
					slot0[slot0] = {
						hp_rant = 10000,
						id = slot0,
						strategies = {}
					}
				end)
				slot1:updateRawShipsByTeam(slot2, slot1)
				_.each(_.keys(slot3.ships), function (slot0)
					if not slot0:containsShip(slot0) then
						slot1:removeShip(slot0)
					end
				end)
			end
		elseif slot0 == 2 and not slot1.active then
			slot2, slot3 = slot1:getFriendShip()

			for slot9, slot10 in pairs(slot5) do
				if slot10.ship and slot10.ship.id == slot0[1] then
					Clone(slot10.ship).hpRant = 10000
					Clone(slot10.ship).strategies = {}

					break
				end
			end

			slot1:updateFriendShip(slot3)

			if slot2 and slot3:containsShip(slot2.id) then
				if slot3 then
					slot3:replaceShip(slot2.id, {
						id = slot3.id,
						hp_rant = slot3.hpRant,
						strategies = slot3.strategies
					})
				else
					slot3:removeShip(slot2.id)
				end
			end
		end
	end
end

return slot0
