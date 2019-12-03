slot0 = class("BackYardShipInfoMediator", import("..base.ContextMediator"))
slot0.EXTEND = "BackYardShipInfoMediator:EXTEND"
slot0.EXIT_YARD = "BackYardShipInfoMediator:EXIT_YARD"
slot0.SPEED_UP = "BackYardShipInfoMediator:SPEED_UP"
slot0.OPEN_CHUANWU = "BackYardShipInfoMediator:OPEN_CHUANWU"
slot0.BUY_QUICKITEM = "BackYardShipInfoMediator:BUY_QUICKITEM"
slot0.OPEN_NOFOOD = "BackYardShipInfoMediator:OPEN_NOFOOD"

function slot0.register(slot0)
	slot0.contextData.type = slot0.contextData.type or BackYardShipInfoLayer.SHIP_TRAIN_TYPE
	slot0.dormProxy = getProxy(DormProxy)

	slot0:bind(slot0.EXTEND, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.SHOPPING, {
			id = slot1,
			count = slot2
		})
	end)
	slot0:bind(slot0.OPEN_CHUANWU, function (slot0, slot1, slot2, slot3)
		slot0:onSelecte(slot1, slot2, slot3)
	end)
	slot0:bind(slot0.OPEN_NOFOOD, function (slot0)
		slot0:sendNotification(BackYardMediator.OPEN_NOFOOD)
	end)

	slot0.playerProxy = getProxy(PlayerProxy)

	slot0.viewComponent:setPlayerVO(slot0.playerProxy:getData())
	slot0.viewComponent:setDormVO(slot0.dormProxy:getData())
	slot0.viewComponent:setTrainShipVOs(slot0.dormProxy:getShipsByState(Ship.STATE_TRAIN))
	slot0.viewComponent:setResetShipVOs(slot0.dormProxy:getShipsByState(Ship.STATE_REST))

	slot1 = getProxy(BayProxy)
	slot2 = getProxy(NavalAcademyProxy)

	slot0.viewComponent:setResClassVO(slot3)
	_.each(slot2:getCourse().students, function (slot0)
		if slot0:getShipById(slot0) then
			slot1[slot1.id] = slot1
		end
	end)
	slot0.viewComponent:setCourseVO(slot4)
	slot0.viewComponent:setClassShipVOs({})
end

function slot0.onSelecte(slot0, slot1, slot2, slot3)
	slot4 = 0

	if slot1 == BackYardShipInfoLayer.SHIP_TRAIN_TYPE or slot1 == BackYardShipInfoLayer.SHIP_REST_TYPE then
		slot4 = getBackYardProxy(BackYardHouseProxy).getData(slot5):getEmptyGridCount()
	end

	slot5 = false
	slot6, slot7 = nil

	if slot3 then
		slot5 = true
		slot6 = slot3.id
	end

	slot8 = slot0.dormProxy:getTrainShipIds()
	slot9 = slot0.dormProxy:getRestShipIds()
	slot11 = getProxy(NavalAcademyProxy).getCourse(slot10).students
	slot12 = getProxy(BayProxy)
	slot13, slot14, slot15, slot16 = nil

	if slot1 == BackYardShipInfoLayer.SHIP_TRAIN_TYPE then
		slot14 = slot8
		slot15 = slot9
		slot13 = slot12:getBlackBlackShipIds(slot0.__cname)
	elseif slot1 == BackYardShipInfoLayer.SHIP_REST_TYPE then
		slot14 = slot9
		slot15 = slot8
		slot13 = slot12:getBlackBlackShipIds(slot0.__cname)
	elseif slot1 == BackYardShipInfoLayer.SHIP_CLASS_TYPE then
		slot6 = nil
		slot5 = false
		slot7 = 0
		slot14 = slot11
		slot19 = slot10:getCourse().getConfig(slot18, "type")
		slot16 = _.filter(_.values(slot17), function (slot0)
			return slot0.level < pg.gameset.level_get_proficency.key_value and table.contains(slot0, slot0:getShipType())
		end)
		slot13 = slot12:getBlackBlackShipIds(ClassMediator.__cname)
	end

	slot17 = {}

	for slot21, slot22 in pairs(slot14) do
		if slot22 ~= slot6 then
			table.insert(slot17, slot22)
		end
	end

	slot18 = {}

	for slot23, slot24 in pairs(slot19) do
		if slot24:isActivityNpc() then
			table.insert(slot18, slot24.id)
		end
	end

	slot20 = {
		callbackQuit = true,
		activeShipId = slot6,
		selectedMin = slot7,
		selectedMax = slot2,
		quitTeam = slot5,
		shipVOs = slot16,
		blackBlockShipIds = slot13,
		ignoredIds = slot18,
		selectedIds = slot17,
		preView = slot0.viewComponent.__cname,
		flags = {
			inExercise = true,
			inChapter = false,
			inPvp = false,
			inFleet = false,
			inClass = true,
			inTactics = false,
			inBackyard = true,
			inSham = false,
			inEvent = false,
			inAdmiral = true
		},
		onShip = function (slot0, slot1, slot2)
			slot3 = "inBackyard"
			slot4 = nil

			if slot0 == BackYardShipInfoLayer.SHIP_TRAIN_TYPE or slot0 == BackYardShipInfoLayer.SHIP_REST_TYPE then
				if slot1 < #slot2 + 1 then
					return false, i18n("backyard_no_pos_for_ship")
				end

				if table.contains(slot2, slot0.id) then
					return false, i18n("backyard_backyardShipInfoMediator_shipState_rest")
				end
			elseif slot0 == BackYardShipInfoLayer.SHIP_CLASS_TYPE then
				if slot0:getEnergy() <= AcademyCourse.MinEnergy then
					return false, i18n("course_energy_not_enough", slot0:getName())
				end

				if slot0.inBackyard then
					function slot4(slot0)
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							hideNo = true,
							content = i18n("exit_backyard_exp_display", slot0:getName(), slot0)
						})

						slot1 = nil
					end
				end

				slot3 = "inClass"
			end

			slot5, slot6 = Ship.ShipStateConflict(slot3, slot0)

			if slot5 == Ship.STATE_CHANGE_FAIL then
				return false, i18n(slot6)
			elseif slot5 == Ship.STATE_CHANGE_CHECK then
				return Ship.ChangeStateCheckBox(slot6, slot0, function (slot0)
					if slot0 then
						slot0(slot0)
					end

					slot1()
				end)
			end

			return true
		end,
		onSelected = function (slot0, slot1)
			if slot0 == BackYardShipInfoLayer.SHIP_CLASS_TYPE then
				slot1:getCourse().students = slot0

				slot1:setCourse(slot1.getCourse())
				slot1()

				return
			end

			pg.UIMgr.GetInstance():LoadingOn()

			if slot0 == nil or #slot0 == 0 then
				slot2:sendNotification(GAME.EXIT_SHIP, {
					shipId = slot2,
					callback = slot1
				})
				pg.UIMgr.GetInstance():LoadingOff()

				return
			end

			slot2 = {}

			for slot6, slot7 in ipairs(slot4) do
				if not table.contains(slot0, slot7) then
					table.insert(slot2, function (slot0)
						slot0:sendNotification(GAME.EXIT_SHIP, {
							shipId = slot0.sendNotification,
							callback = slot0
						})
					end)
				end
			end

			slot2.contextData.shipIdToAdd = {}

			for slot6, slot7 in ipairs(slot0) do
				if not table.contains(slot5, slot7) and slot3 ~= slot7 then
					table.insert(slot2.contextData.shipIdToAdd, {
						slot7,
						slot0
					})
				end
			end

			if slot2.contextData.shipIdToAdd and table.getCount(slot2.contextData.shipIdToAdd) > 0 then
				for slot6, slot7 in ipairs(slot2.contextData.shipIdToAdd) do
					table.insert(slot2, function (slot0)
						slot0:sendNotification(GAME.ADD_SHIP, {
							id = slot1[1],
							type = slot1[2],
							callBack = slot0
						})
					end)
				end
			end

			if #slot2 > 0 then
				seriesAsync(slot2, function ()
					slot0.contextData.shipIdToAdd = nil

					slot1()
					pg.UIMgr.GetInstance():LoadingOff()
				end)
			else
				pg.UIMgr.GetInstance():LoadingOff()
				slot1()
			end
		end
	}

	if slot1 == BackYardShipInfoLayer.SHIP_TRAIN_TYPE or slot1 == BackYardShipInfoLayer.SHIP_REST_TYPE then
		slot20.isLayer = true

		slot0:addSubLayers(Context.New({
			viewComponent = DockyardScene,
			mediator = DockyardMediator,
			data = slot20
		}))
		slot0.viewComponent:EnableUI(false)
	else
		slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, slot20)
	end
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.EXTEND_BACKYARD_DONE,
		DormProxy.DORM_UPDATEED,
		GAME.ADD_SHIP_DONE,
		GAME.EXIT_SHIP_DONE,
		PlayerProxy.UPDATED,
		GAME.REMOVE_LAYERS
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.EXTEND_BACKYARD_DONE then
		pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_backyardShipInfoMediator_ok_unlock"))
		slot0.viewComponent:updateSlots()
	elseif slot2 == DormProxy.DORM_UPDATEED then
		slot0.viewComponent:setDormVO(slot0.dormProxy:getData())
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayerVO(slot3)
	elseif slot2 == GAME.REMOVE_LAYERS and slot3.context.mediator == DockyardMediator then
		slot0.viewComponent:blurPanel()
		slot0.viewComponent:setTrainShipVOs(slot0.dormProxy:getShipsByState(Ship.STATE_TRAIN))
		slot0.viewComponent:setResetShipVOs(slot0.dormProxy:getShipsByState(Ship.STATE_REST))
		slot0.viewComponent:updateSlots()
		slot0.viewComponent:EnableUI(true)
	end
end

return slot0
