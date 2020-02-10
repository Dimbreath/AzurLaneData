slot0 = class("GuildPreCombatMediator", import("..base.ContextMediator"))
slot0.OP = "GuildPreCombatMediator.OP"
slot0.SAVE = "GuildPreCombatMediator.SAVE"
slot0.START = "GuildPreCombatMediator:START"
slot0.CHANGE_FLEET_SHIP = "GuildPreCombatMediator:CHANGE_FLEET_SHIP"
slot0.OPEN_SHIP_INFO = "GuildPreCombatMediator:OPEN_SHIP_INFO"

function slot0.register(slot0)
	getProxy(BayProxy):setSelectShipId(nil)
	slot0:bind(uv0.SAVE, function (slot0, slot1)
		uv0:save(slot1)
	end)
	slot0:bind(uv0.START, function (slot0)
		uv0:enter()
	end)
	slot0:bind(uv0.OP, function (slot0, slot1)
		uv0:save(function ()
			uv0:sendNotification(GAME.GUILD_OP, uv1)
		end)
	end)
	slot0:bind(uv0.CHANGE_FLEET_SHIP, function (slot0, slot1)
		uv0:openDockYard(slot1.type, slot1.shipVO, slot1.team)
	end)
	slot0:bind(uv0.OPEN_SHIP_INFO, function (slot0, slot1)
		if getProxy(BayProxy):getShipById(slot1) then
			slot8.shipId = slot1
			slot8.shipVOs = uv0.contextData.guildChapter:getShips()

			uv0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {})
		end
	end)
	slot0.viewComponent:setPlayerInfo(getProxy(PlayerProxy):getData())

	slot3 = slot0.contextData.guildChapter

	slot0.viewComponent:updateChapter(slot3)

	if slot3.active or slot0.contextData.confirmed then
		slot0.viewComponent:displayFormation()
	else
		slot0.viewComponent:displayFleetPanel()
	end
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = PlayerProxy.UPDATED
	slot1[2] = GAME.GUILD_ENTER_DONE
	slot1[3] = GAME.GUILD_OP_DONE
	slot1[4] = GAME.GUILD_ENTER_ERROR

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayerInfo(getProxy(PlayerProxy):getData())
	elseif slot2 == GAME.GUILD_ENTER_DONE then
		slot4 = slot0.viewComponent

		slot4:emit(BaseUI.ON_CLOSE)

		slot9.chapterId = slot3 and slot4.id
		slot9.mapIdx = slot4 and slot4:getConfig("map")
		slot9.chapterVO = slot4

		slot0.sendNotification(slot0, GAME.GO_SCENE, SCENE.LEVEL, {})
	elseif slot2 == GAME.GUILD_ENTER_ERROR then
		if slot3 == 3 then
			slot0:display()
		end
	elseif slot2 == GAME.GUILD_OP_DONE and (slot3.type == ChapterConst.OpStrategy or slot3.type == ChapterConst.OpRepair or slot3.type == ChapterConst.OpRequest) then
		slot0:display()
	end
end

function slot0.display(slot0)
	slot2 = getProxy(ChapterProxy):getGuildChapter()
	slot0.contextData.guildChapter = slot2

	slot0.viewComponent:updateChapter(slot2)
	slot0.viewComponent:displayFormation()
end

function slot0.save(slot0, slot1)
	slot3 = getProxy(ChapterProxy):getGuildChapter()
	slot4 = slot0.contextData.guildChapter
	slot5 = nil
	slot5 = coroutine.create(function ()
		if uv1.active then
			if uv0.fleet:isFormationDiffWith(uv1.fleet) then
				slot4.fleetShipIds = uv0.fleet:getShipIds()
				slot4.callback = uv3

				uv2:sendNotification(GAME.GUILD_CHANGE_FORMATION, {})
				coroutine.yield()

				uv1 = uv4:getGuildChapter()
			end
		else
			uv1:updateFriendShip(uv0:getFriendShip())
			uv1:updateRawShips(uv0:getRawShips())
			uv1:updateFleetShips(slot0)
			uv4:updateGuildChapter(uv1)
			uv4:localSaveGuildChapter()
		end

		if uv5 then
			uv5()
		end
	end)

	function ()
		if coroutine.status(uv0) == "suspended" then
			slot0, slot1 = coroutine.resume(uv0)
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
					slot0 = uv0.fleet
					slot1 = uv0:getChapterCell(slot0.line.row, slot0.line.column)
					slot5.system = SYSTEM_GUILD
					slot5.stageId = uv2.bossId

					uv1:sendNotification(GAME.BEGIN_STAGE, {})
				end)
			end
		else
			slot3 = _.keys(slot1:getRawShips())
			slot4 = slot1.fleet:getShipIds()
			slot5 = 0
			slot6 = 0

			if slot1:getFriendShip() then
				for slot13, slot14 in pairs(getProxy(PlayerProxy).playerGuildAssists) do
					if slot14.ship and slot14.ship.id == slot7.id then
						slot5 = slot13
						slot6 = slot7.id

						break
					end
				end
			end

			if slot5 > 0 then
				function ()
					slot3.id = uv1
					slot3.group_id_list = uv2
					slot3.formation_list = uv3
					slot3.friend_id = uv4
					slot3.friend_ship_id = uv5

					uv0:sendNotification(GAME.GUILD_ENTER, {})
				end()
			else
				slot11.content = i18n("sham_friend_ship_tip")
				slot11.onYes = slot8

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					hideNo = false
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
		slot0, slot1, slot2, slot3, slot4 = nil

		if uv0 == 0 then
			for slot8 = #uv1:getShips(true), 1, -1 do
				if slot0[slot8].hpRant <= 0 then
					table.remove(slot0, slot8)
				elseif uv1.fleet:containsShip(slot0[slot8].id) then
					slot0[slot8].guildInFleet = true
				end
			end

			if uv2 then
				slot5[1] = uv2.id
				slot1 = {} or {}
				slot2 = 1
				slot3 = 1
				slot4 = true
			end
		else
			slot5 = uv1:getShips()
			slot2 = 0
			slot3 = math.min(ChapterConst.ShamShipLimit - (#slot5 - #_(slot5):chain():filter(function (slot0)
				return slot0:getTeamType() == uv0
			end):map(function (slot0)
				return slot0.id
			end):value()), ChapterConst.ShamTeamShipLimit)
			slot0 = _.filter(_.values(getProxy(BayProxy):getData()), function (slot0)
				return slot0:getTeamType() == uv0
			end)
			slot4 = false
			slot8 = getProxy(PlayerProxy).playerGuildAssists

			for slot13, slot14 in pairs(getProxy(FriendProxy):getRawData()) do
				if slot8[slot13] then
					if pg.TimeMgr.GetInstance():GetServerTime() - slot8[slot13].timeStamp > 60 then
						table.insert({}, slot13)
					end
				end
			end

			if #slot9 > 0 then
				slot13.playerIds = slot9
				slot13.type = Player.ASSISTS_TYPE_GUILD
				slot13.callback = uv5

				uv4:sendNotification(GAME.REQ_PLAYER_ASSIST_SHIP, {})
				coroutine.yield()
			end

			for slot13, slot14 in pairs(slot8) do
				if slot6[slot13] then
					slot14.ship.playerId = slot13

					table.insert({}, slot14.ship)
				end
			end

			slot11[1] = uv1.id
			slot1 = {} or {}
			slot2 = 1
			slot3 = 1
			slot4 = true
		end

		slot12.onShip, slot12.confirmSelect, slot12.onSelected = uv4:getDockCallbackFuncs(uv0, uv2, uv3)
		slot8 = uv4
		slot12.shipVOs = slot0
		slot12.selectedIds = slot1
		slot12.selectedMin = slot2
		slot12.selectedMax = slot3
		slot12.leastLimitMsg = i18n("ship_formationMediator_leastLimit")
		slot12.quitTeam = slot4
		slot12.teamFilter = uv3
		slot12.leftTopInfo = i18n("word_formation")
		slot12.flags = uv6
		slot12.selectFriend = uv0 == 2

		slot8.sendNotification(slot8, GAME.GO_SCENE, SCENE.DOCKYARD, {})
	end)

	function ()
		if coroutine.status(uv0) == "suspended" then
			slot0, slot1 = coroutine.resume(uv0)
		end
	end()
end

function slot0.getDockCallbackFuncs(slot0, slot1, slot2, slot3)
	slot5 = slot0.contextData.guildChapter.fleet

	return function (slot0, slot1, slot2)
		if uv0 == 0 then
			slot3 = uv1.fleet

			if not slot3:containsShip(slot0.id) and slot3:containsSameKind(slot0) then
				if uv2 then
					if not uv2:isSameKind(slot0) then
						return false, i18n("event_same_type_not_allowed")
					end
				end
			end
		elseif uv0 == 1 then
			if slot0.level < ChapterConst.ShamShipLevelLimit then
				return false, i18n("sham_ship_level_limit", ChapterConst.ShamShipLevelLimit)
			end

			for slot7, slot8 in ipairs(slot2) do
				if getProxy(BayProxy):getShipById(slot8) and slot0:isSameKind(slot9) then
					return false, i18n("event_same_type_not_allowed")
				end
			end
		elseif uv0 == 2 and slot0.level < ChapterConst.ShamShipLevelLimit then
			return false, i18n("sham_ship_level_limit", ChapterConst.ShamShipLevelLimit)
		end

		return true
	end, function (slot0, slot1, slot2)
		slot1()
	end, function (slot0)
		slot1 = getProxy(BayProxy)

		if uv0 == 0 then
			slot2 = nil
			slot3 = uv1

			if slot3:getFriendShip() and slot3.id == slot0[1] then
				slot2 = slot3
			else
				slot2 = uv1:getShip(slot0[1])
			end

			if not slot2 then
				if uv2 then
					slot4 = uv2:getTeamType()

					if uv1.active and #uv3[slot4] == 1 then
						pg.TipsMgr.GetInstance():ShowTips(i18n("ship_formationUI_removeError_onlyShip", uv2:getName(), "", Fleet.C_TEAM_NAME[slot4]))
					else
						uv3:removeShip(uv2.id)
					end
				end
			elseif uv2 then
				if uv3:containsShip(slot2.id) then
					uv3:switchShip(uv2.id, slot2.id)
				else
					slot7.id = slot2.id
					slot7.hp_rant = slot2.hpRant
					slot7.strategies = slot2.strategies

					uv3:replaceShip(uv2.id, {})
				end
			else
				slot6.id = slot2.id
				slot6.hp_rant = slot2.hpRant
				slot6.strategies = slot2.strategies

				uv3:addShip({})
			end
		elseif uv0 == 1 then
			if not uv1.active then
				_.each(slot0, function (slot0)
					slot2.id = slot0
					slot2.strategies = {}
					uv0[slot0] = {
						hp_rant = 10000
					}
				end)
				uv1:updateRawShipsByTeam({}, uv4)
				_.each(_.keys(uv3.ships), function (slot0)
					if not uv0:containsShip(slot0) then
						uv1:removeShip(slot0)
					end
				end)
			end
		elseif uv0 == 2 and not uv1.active then
			slot2, slot3 = uv1:getFriendShip()

			for slot9, slot10 in pairs(getProxy(PlayerProxy).playerGuildAssists) do
				if slot10.ship and slot10.ship.id == slot0[1] then
					slot3 = Clone(slot10.ship)
					slot3.hpRant = 10000
					slot3.strategies = {}

					break
				end
			end

			uv1:updateFriendShip(slot3)

			if slot2 then
				if uv3:containsShip(slot2.id) then
					if slot3 then
						slot9.id = slot3.id
						slot9.hp_rant = slot3.hpRant
						slot9.strategies = slot3.strategies

						uv3:replaceShip(slot2.id, {})
					else
						uv3:removeShip(slot2.id)
					end
				end
			end
		end
	end
end

return slot0
