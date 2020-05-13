slot0 = class("ShamPreCombatMediator", import("..base.ContextMediator"))
slot0.OP = "ShamPreCombatMediator.OP"
slot0.SAVE = "ShamPreCombatMediator.SAVE"
slot0.RESET = "ShamPreCombatMediator.RESET"
slot0.START = "ShamPreCombatMediator:START"
slot0.CHANGE_FLEET_SHIP = "ShamPreCombatMediator:CHANGE_FLEET_SHIP"
slot0.OPEN_SHIP_INFO = "ShamPreCombatMediator:OPEN_SHIP_INFO"

function slot0.register(slot0)
	getProxy(BayProxy):setSelectShipId(nil)
	slot0:bind(uv0.SAVE, function (slot0, slot1)
		uv0:save(slot1)
	end)
	slot0:bind(uv0.START, function (slot0)
		uv0:enter()
	end)
	slot0:bind(uv0.RESET, function (slot0)
		uv0:reset()
	end)
	slot0:bind(uv0.OP, function (slot0, slot1)
		uv0:save(function ()
			uv0:sendNotification(GAME.SHAM_OP, uv1)
		end)
	end)
	slot0:bind(uv0.CHANGE_FLEET_SHIP, function (slot0, slot1)
		uv0:openDockYard(slot1.type, slot1.shipVO, slot1.team)
	end)
	slot0:bind(uv0.OPEN_SHIP_INFO, function (slot0, slot1)
		if getProxy(BayProxy):getShipById(slot1) then
			uv0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				shipId = slot1,
				shipVOs = uv0.contextData.shamChapter:getShips()
			})
		end
	end)
	slot0.viewComponent:setPlayerInfo(getProxy(PlayerProxy):getData())

	slot3 = slot0.contextData.shamChapter

	slot0.viewComponent:updateChapter(slot3)

	if slot3.active or slot0.contextData.confirmed then
		slot0.viewComponent:displayFormation()
	else
		slot0.viewComponent:displayFleetPanel()
	end
end

function slot0.listNotificationInterests(slot0)
	return {
		PlayerProxy.UPDATED,
		ChapterProxy.SHAM_CHAPTER_UPDATED,
		GAME.SHAM_ENTER_DONE,
		GAME.SHAM_OP_DONE,
		GAME.SHAM_ENTER_ERROR
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayerInfo(getProxy(PlayerProxy):getData())
	elseif slot2 == GAME.SHAM_ENTER_DONE then
		slot0.viewComponent:emit(BaseUI.ON_CLOSE)
	elseif slot2 == GAME.SHAM_ENTER_ERROR then
		if slot3 == 3 then
			slot0:display()
		end
	elseif slot2 == GAME.SHAM_OP_DONE and (slot3.type == ChapterConst.OpStrategy or slot3.type == ChapterConst.OpRepair or slot3.type == ChapterConst.OpRequest) then
		slot0:display()
	end
end

function slot0.display(slot0)
	slot2 = getProxy(ChapterProxy):getShamChapter()
	slot0.contextData.shamChapter = slot2

	slot0.viewComponent:updateChapter(slot2)
	slot0.viewComponent:displayFormation()
end

function slot0.save(slot0, slot1)
	slot3 = getProxy(ChapterProxy):getShamChapter()
	slot4 = slot0.contextData.shamChapter
	slot5 = nil
	slot5 = coroutine.create(function ()
		if uv1.active then
			if uv0.fleet:isFormationDiffWith(uv1.fleet) then
				uv2:sendNotification(GAME.SHAM_CHANGE_FORMATION, {
					fleetShipIds = uv0.fleet:getShipIds(),
					callback = uv3
				})
				coroutine.yield()

				uv1 = uv4:getShamChapter()
			end
		else
			uv1:updateFriendShip(uv0:getFriendShip())
			uv1:updateRawShips(uv0:getRawShips())
			uv1:updateFleetShips(slot0)
			uv4:updateShamChapter(uv1)
			uv4:localSaveShamChapter()
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
	if not slot0.contextData.shamChapter:isOpen() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_not_start"))
	elseif not slot1:isValid() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("sham_team_limit"))
	elseif not slot1.fleet:isValid() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("sham_formation_invalid"))
	else
		if not (slot1.id or (not ChapterConst.ActivateMirror or ChapterConst.MirrorShamId) and pg.sim_battle_template[slot1.simId] and slot3.sham_chapter_id) then
			return
		end

		if slot1.active then
			slot0:save(function ()
				slot0 = uv0.fleet

				if uv0:getChapterCell(slot0.line.row, slot0.line.column) and slot1.attachment == ChapterConst.AttachRival and slot1.flag == 0 then
					uv1:sendNotification(GAME.BEGIN_STAGE, {
						system = SYSTEM_SHAM
					})
				else
					uv1:save(function ()
						uv0.viewComponent:emit(BaseUI.ON_CLOSE)
					end)
				end
			end)
		else
			slot3 = _.keys(slot1:getRawShips())
			slot4 = slot1.fleet:getShipIds()
			slot5 = 0
			slot6 = 0

			if slot1:getFriendShip() then
				for slot13, slot14 in pairs(getProxy(PlayerProxy).playerAssists) do
					if slot14.ship and slot14.ship.id == slot7.id then
						slot5 = slot13
						slot6 = slot7.id

						break
					end
				end
			end

			if slot5 > 0 then
				function ()
					uv0:sendNotification(GAME.SHAM_ENTER, {
						id = uv1,
						group_id_list = uv2,
						formation_list = uv3,
						friend_id = uv4,
						friend_ship_id = uv5
					})
				end()
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

function slot0.reset(slot0)
	slot0:sendNotification(GAME.SHAM_OP, {
		type = ChapterConst.OpRetreat
	})
end

function slot0.openDockYard(slot0, slot1, slot2, slot3)
	slot4 = slot0.contextData.shamChapter
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
					slot0[slot8].shamInFleet = true
				end
			end

			slot1 = uv2 and {
				uv2.id
			} or {}
			slot2 = 1
			slot3 = 1
			slot4 = true
		elseif uv0 == 1 then
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
		elseif uv0 == 2 then
			slot8 = getProxy(PlayerProxy).playerAssists
			slot9 = {}

			for slot13, slot14 in pairs(getProxy(FriendProxy):getRawData()) do
				if not slot8[slot13] or pg.TimeMgr.GetInstance():GetServerTime() - slot8[slot13].timeStamp > 60 then
					table.insert(slot9, slot13)
				end
			end

			if #slot9 > 0 then
				uv4:sendNotification(GAME.REQ_PLAYER_ASSIST_SHIP, {
					playerIds = slot9,
					type = Player.ASSISTS_TYPE_SHAM,
					callback = uv5
				})
				coroutine.yield()
			end

			for slot13, slot14 in pairs(slot8) do
				if slot6[slot13] then
					slot14.ship.playerId = slot13

					table.insert({}, slot14.ship)
				end
			end

			slot1 = uv1:getFriendShip() and {
				slot10.id
			} or {}
			slot2 = 1
			slot3 = 1
			slot4 = true
		end

		slot5, slot6, slot7 = uv4:getDockCallbackFuncs(uv0, uv2, uv3)

		uv4:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			shipVOs = slot0,
			selectedIds = slot1,
			selectedMin = slot2,
			selectedMax = slot3,
			leastLimitMsg = i18n("ship_formationMediator_leastLimit"),
			quitTeam = slot4,
			teamFilter = uv3,
			leftTopInfo = i18n("word_formation"),
			onShip = slot5,
			confirmSelect = slot6,
			onSelected = slot7,
			flags = uv6,
			selectFriend = uv0 == 2
		})
	end)

	function ()
		if coroutine.status(uv0) == "suspended" then
			slot0, slot1 = coroutine.resume(uv0)
		end
	end()
end

function slot0.getDockCallbackFuncs(slot0, slot1, slot2, slot3)
	slot5 = slot0.contextData.shamChapter.fleet

	return function (slot0, slot1, slot2)
		if uv0 == 0 then
			if not uv1.fleet:containsShip(slot0.id) and slot3:containsSameKind(slot0) and (not uv2 or not uv2:isSameKind(slot0)) then
				return false, i18n("event_same_type_not_allowed")
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

			if not (uv1:getFriendShip() and slot3.id == slot0[1] and slot3 or uv1:getShip(slot0[1])) then
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
					uv3:replaceShip(uv2.id, {
						id = slot2.id,
						hp_rant = slot2.hpRant,
						strategies = slot2.strategies
					})
				end
			else
				uv3:addShip({
					id = slot2.id,
					hp_rant = slot2.hpRant,
					strategies = slot2.strategies
				})
			end
		elseif uv0 == 1 then
			if not uv1.active then
				_.each(slot0, function (slot0)
					uv0[slot0] = {
						hp_rant = 10000,
						id = slot0,
						strategies = {}
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

			for slot9, slot10 in pairs(getProxy(PlayerProxy).playerAssists) do
				if slot10.ship and slot10.ship.id == slot0[1] then
					slot3 = Clone(slot10.ship)
					slot3.hpRant = 10000
					slot3.strategies = {}

					break
				end
			end

			uv1:updateFriendShip(slot3)

			if slot2 and uv3:containsShip(slot2.id) then
				if slot3 then
					uv3:replaceShip(slot2.id, {
						id = slot3.id,
						hp_rant = slot3.hpRant,
						strategies = slot3.strategies
					})
				else
					uv3:removeShip(slot2.id)
				end
			end
		end
	end
end

return slot0
