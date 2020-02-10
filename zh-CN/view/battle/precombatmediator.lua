slot0 = class("PreCombatMediator", import("..base.ContextMediator"))
slot0.ON_START = "PreCombatMediator:ON_START"
slot0.ON_CHANGE_FLEET = "PreCombatMediator:ON_CHANGE_FLEET"
slot0.ON_COMMIT_EDIT = "PreCombatMediator:ON_COMMIT_EDIT"
slot0.ON_ABORT_EDIT = "PreCombatMediator:ON_ABORT_EDIT"
slot0.OPEN_SHIP_INFO = "PreCombatMediator:OPEN_SHIP_INFO"
slot0.REMOVE_SHIP = "PreCombatMediator:REMOVE_SHIP"
slot0.CHANGE_FLEET_SHIPS_ORDER = "PreCombatMediator:CHANGE_FLEET_SHIPS_ORDER"
slot0.CHANGE_FLEET_SHIP = "PreCombatMediator:CHANGE_FLEET_SHIP"
slot0.ON_AUTO = "PreCombatMediator:ON_AUTO"
slot0.ON_SUB_AUTO = "PreCombatMediator:ON_SUB_AUTO"

function slot0.register(slot0)
	slot1 = getProxy(BayProxy)

	slot1:setSelectShipId(nil)

	slot0.ships = slot1:getRawData()
	slot2 = slot0.viewComponent

	slot2:SetShips(slot0.ships)

	slot3 = getProxy(FleetProxy)
	slot4 = nil

	if slot0.contextData.system == SYSTEM_HP_SHARE_ACT_BOSS or slot2 == SYSTEM_BOSS_EXPERIMENT or slot2 == SYSTEM_ACT_BOSS then
		slot4 = slot0.contextData.fleets
	elseif slot3.EdittingFleet ~= nil then
		slot3:getData()[slot3.EdittingFleet.id] = slot3.EdittingFleet
	end

	slot0.viewComponent:SetFleets(slot4)
	slot0.viewComponent:SetPlayerInfo(getProxy(PlayerProxy):getData())
	slot0:bind(uv0.ON_ABORT_EDIT, function (slot0)
		uv0:abortEditting()
		uv0:syncFleet()
	end)

	if slot2 == SYSTEM_DUEL then
		slot0.viewComponent:SetCurrentFleet(FleetProxy.PVP_FLEET_ID)
	elseif slot2 == SYSTEM_HP_SHARE_ACT_BOSS or slot2 == SYSTEM_BOSS_EXPERIMENT or slot2 == SYSTEM_ACT_BOSS then
		slot0.viewComponent:SetCurrentFleet(slot4[1].id)

		for slot11, slot12 in ipairs(slot4) do
			if slot12:isSubmarineFleet() and slot12:isLegalToFight() then
				slot0.viewComponent:SetSubFlag(true)

				break
			end
		end

		if pg.activity_event_worldboss[getProxy(ActivityProxy):getActivityById(slot0.contextData.actID):getConfig("config_id")] then
			slot0.viewComponent:SetTicketItemID(slot11.ticket)
		end
	elseif slot2 == SYSTEM_SUB_ROUTINE then
		slot0.viewComponent:SetStageID(slot0.contextData.stageId)
		slot0.viewComponent:SetCurrentFleet(slot0.contextData.fleetID)
	else
		slot0.viewComponent:SetStageID(slot0.contextData.stageId)
		slot0.viewComponent:SetCurrentFleet(slot5.combatFleetId)
	end

	slot0:bind(uv0.ON_CHANGE_FLEET, function (slot0, slot1)
		uv0:changeFleet(slot1)
	end)
	slot0:bind(uv0.ON_AUTO, function (slot0, slot1)
		uv0:onAutoBtn(slot1)
	end)
	slot0:bind(uv0.ON_SUB_AUTO, function (slot0, slot1)
		uv0:onAutoSubBtn(slot1)
	end)
	slot0:bind(uv0.CHANGE_FLEET_SHIPS_ORDER, function (slot0, slot1)
		uv0:refreshEdit(slot1)
		uv0.viewComponent:MarkEdited()
	end)
	slot0:bind(uv0.REMOVE_SHIP, function (slot0, slot1, slot2)
		FormationMediator.removeShipFromFleet(slot2, slot1)
		uv0:refreshEdit(slot2)
		uv0.viewComponent:MarkEdited()
	end)
	slot0:bind(uv0.OPEN_SHIP_INFO, function (slot0, slot1, slot2)
		uv0.contextData.form = PreCombatLayer.FORM_EDIT
		uv0.contextData.fleetID = slot2.id

		for slot7, slot8 in ipairs(slot2:getShipIds()) do
			table.insert({}, uv0.ships[slot8])
		end

		uv0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = slot1,
			shipVOs = slot3
		})
	end)
	slot0:bind(uv0.CHANGE_FLEET_SHIP, function (slot0, slot1, slot2, slot3)
		uv0.contextData.form = PreCombatLayer.FORM_EDIT
		uv0.contextData.fleetID = slot2.id
		slot4 = {}

		FormationMediator.saveEdit()

		slot5, slot6 = nil

		if slot1 == nil then
			slot5 = false
			slot6 = nil
		else
			slot5 = #slot2.ships > 1
			slot6 = slot1.id
		end

		slot7 = uv1 == SYSTEM_DUEL

		if slot2.id == FleetProxy.PVP_FLEET_ID then
			for slot12, slot13 in pairs(getProxy(BayProxy):getRawData()) do
				if slot13:isActivityNpc() then
					table.insert(slot4, slot13.id)
				end
			end
		end

		slot8 = slot7 and {
			inExercise = true,
			inChapter = false,
			inPvp = false,
			inFleet = false,
			inClass = false,
			inTactics = false,
			inBackyard = false,
			inSham = false,
			inEvent = true,
			inAdmiral = true
		} or {
			inExercise = true,
			inChapter = true,
			inPvp = false,
			inFleet = true,
			inClass = false,
			inTactics = false,
			inBackyard = false,
			inSham = true,
			inEvent = true,
			inAdmiral = true
		}
		slot9, slot10, slot11 = nil

		if slot2.id == FleetProxy.PVP_FLEET_ID then
			slot9, slot10, slot11 = FormationMediator.getDockCallbackFuncsForExercise(uv0, slot1, slot2, slot3)
		else
			slot9, slot10, slot11 = FormationMediator.getDockCallbackFuncs(uv0, slot1, slot2, slot3)
		end

		uv0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMin = 0,
			selectedMax = 1,
			ignoredIds = slot4,
			activeShipId = slot6,
			leastLimitMsg = i18n("battle_preCombatMediator_leastLimit"),
			quitTeam = slot5,
			blackBlockShipIds = getProxy(BayProxy):getBlackBlackShipIds(uv0.__cname, {
				fleetId = slot2.id,
				team = slot3,
				activeShipId = slot6
			}),
			teamFilter = slot3,
			onShip = slot9,
			confirmSelect = slot10,
			onSelected = slot11,
			flags = slot8
		})
	end)
	slot0:bind(uv0.ON_COMMIT_EDIT, function (slot0, slot1)
		uv0:commitEdit(slot1)
	end)
	slot0:bind(uv0.ON_START, function (slot0, slot1)
		if uv1 == SYSTEM_DUEL then
			function ()
				if uv0.contextData.customFleet then
					uv0.contextData.func()
				else
					slot0 = nil
					slot0 = (not uv0.contextData.rivalId or uv0.contextData.rivalId) and uv0.contextData.stageId

					seriesAsync({
						function (slot0)
							if uv0.contextData.OnConfirm then
								uv0.contextData.OnConfirm(slot0)
							else
								slot0()
							end
						end,
						function ()
							uv0:sendNotification(GAME.BEGIN_STAGE, {
								stageId = uv1,
								mainFleetId = uv2,
								system = uv0.contextData.system,
								actID = uv0.contextData.actID,
								rivalId = uv0.contextData.rivalId
							})
						end
					})
				end
			end()
		else
			slot3, slot4 = nil

			if uv1 == SYSTEM_HP_SHARE_ACT_BOSS or uv1 == SYSTEM_BOSS_EXPERIMENT or uv1 == SYSTEM_ACT_BOSS then
				slot3 = uv2[1]
				slot4 = "ship_energy_low_warn_no_exp"
			else
				slot3 = uv3:getFleetById(slot1)
			end

			for slot9, slot10 in ipairs(slot3.ships) do
				table.insert({}, uv4:getShipById(slot10))
			end

			if slot3.name == "" or slot6 == nil then
				slot6 = Fleet.DEFAULT_NAME[slot1]
			end

			if Fleet.EnergyCheck(slot5, slot6, slot2, slot4) then
				slot2()
			end
		end
	end)
end

function slot0.changeFleet(slot0, slot1)
	if slot0.contextData.system ~= SYSTEM_SUB_ROUTINE then
		getProxy(PlayerProxy).combatFleetId = slot1
	end

	slot0.viewComponent:SetCurrentFleet(slot1)
	slot0.viewComponent:UpdateFleetView(true)
	slot0.viewComponent:SetFleetStepper()
end

function slot0.refreshEdit(slot0, slot1)
	getProxy(FleetProxy).EdittingFleet = slot1

	if slot0.contextData.system ~= SYSTEM_SUB_ROUTINE then
		slot3 = nil
		slot3 = (slot0.contextData.system ~= SYSTEM_HP_SHARE_ACT_BOSS or slot2:getActivityFleets()[slot0.contextData.actID]) and slot2:getData()
		slot3[slot1.id] = slot1

		slot0.viewComponent:SetFleets(slot3)
	end

	slot0.viewComponent:UpdateFleetView(false)
end

function slot0.commitEdit(slot0, slot1)
	if getProxy(FleetProxy).EdittingFleet == nil or slot3:isFirstFleet() or slot3:isLegalToFight() == true then
		if slot0.contextData.system == SYSTEM_HP_SHARE_ACT_BOSS or slot0.contextData.system == SYSTEM_ACT_BOSS or slot0.contextData.system == SYSTEM_BOSS_EXPERIMENT then
			slot2:commitActivityFleet(slot0.contextData.actID)
			slot1()
		else
			slot2:commitEdittingFleet(slot1)
		end
	elseif #slot3.ships == 0 then
		slot2:commitEdittingFleet(slot1)

		if slot0.contextData.system == SYSTEM_SUB_ROUTINE then
			-- Nothing
		else
			slot0:changeFleet(1)
		end
	else
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("ship_formationMediaror_trash_warning", slot3.defaultName),
			onYes = function ()
				for slot6 = #uv0.ships, 1, -1 do
					uv0:removeShip(getProxy(BayProxy):getRawData()[slot2[slot6]])
				end

				if uv0.id == FleetProxy.PVP_FLEET_ID then
					uv1:commitEdittingFleet()
					uv2:changeFleet(FleetProxy.PVP_FLEET_ID)
					uv2.viewComponent:swtichToPreviewMode()
				else
					uv1:commitEdittingFleet(uv3)
					uv2:changeFleet(1)
				end
			end,
			onNo = function ()
			end
		})
	end
end

function slot0.onAutoBtn(slot0, slot1)
	slot0:sendNotification(GAME.AUTO_BOT, {
		isActiveBot = slot1.isOn,
		toggle = slot1.toggle
	})
end

function slot0.onAutoSubBtn(slot0, slot1)
	slot0:sendNotification(GAME.AUTO_SUB, {
		isActiveSub = slot1.isOn,
		toggle = slot1.toggle
	})
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.BEGIN_STAGE_DONE,
		PlayerProxy.UPDATED,
		GAME.BEGIN_STAGE_ERRO
	}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == GAME.BEGIN_STAGE_DONE then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot1:getBody())
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:SetPlayerInfo(getProxy(PlayerProxy):getData())
	elseif slot2 == GAME.BEGIN_STAGE_ERRO and slot3 == 3 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = i18n("battle_preCombatMediator_timeout"),
			onYes = function ()
				uv0.viewComponent:emit(BaseUI.ON_CLOSE)
			end
		})
	end
end

return slot0
