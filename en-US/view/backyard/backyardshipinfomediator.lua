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

	slot0:bind(uv0.EXTEND, function (slot0, slot1, slot2)
		slot6.id = slot1
		slot6.count = slot2

		uv0:sendNotification(GAME.SHOPPING, {})
	end)
	slot0:bind(uv0.OPEN_CHUANWU, function (slot0, slot1, slot2, slot3)
		uv0:onSelecte(slot1, slot2, slot3)
	end)
	slot0:bind(uv0.OPEN_NOFOOD, function (slot0)
		uv0:sendNotification(BackYardMediator.OPEN_NOFOOD)
	end)

	slot0.playerProxy = getProxy(PlayerProxy)

	slot0.viewComponent:setPlayerVO(slot0.playerProxy:getData())
	slot0.viewComponent:setDormVO(slot0.dormProxy:getData())
	slot0.viewComponent:setTrainShipVOs(slot0.dormProxy:getShipsByState(Ship.STATE_TRAIN))
	slot0.viewComponent:setResetShipVOs(slot0.dormProxy:getShipsByState(Ship.STATE_REST))

	slot1 = getProxy(BayProxy)
	slot2 = getProxy(NavalAcademyProxy)

	slot0.viewComponent:setResClassVO(slot2:GetClassVO())

	slot4 = slot2:getCourse()

	_.each(slot4.students, function (slot0)
		if uv0:getShipById(slot0) then
			uv1[slot1.id] = slot1
		end
	end)
	slot0.viewComponent:setCourseVO(slot4)
	slot0.viewComponent:setClassShipVOs({})
end

function slot0.onSelecte(slot0, slot1, slot2, slot3)
	slot4 = 0

	if slot1 == BackYardShipInfoLayer.SHIP_TRAIN_TYPE or slot1 == BackYardShipInfoLayer.SHIP_REST_TYPE then
		slot4 = getBackYardProxy(BackYardHouseProxy):getData():getEmptyGridCount()
	end

	slot5 = false
	slot6, slot7 = nil

	if slot3 then
		slot5 = true
		slot6 = slot3.id
	end

	slot11 = getProxy(NavalAcademyProxy):getCourse().students
	slot13, slot14, slot15, slot16 = nil

	if slot1 == BackYardShipInfoLayer.SHIP_TRAIN_TYPE then
		slot14 = slot0.dormProxy:getTrainShipIds()
		slot15 = slot0.dormProxy:getRestShipIds()
		slot13 = getProxy(BayProxy):getBlackBlackShipIds(slot0.__cname)
	elseif slot1 == BackYardShipInfoLayer.SHIP_REST_TYPE then
		slot14 = slot9
		slot15 = slot8
		slot13 = slot12:getBlackBlackShipIds(slot0.__cname)
	elseif slot1 == BackYardShipInfoLayer.SHIP_CLASS_TYPE then
		slot6 = nil
		slot5 = false
		slot7 = 0
		slot14 = slot11
		slot19 = slot10:getCourse():getConfig("type")
		slot16 = _.filter(_.values(slot12:getData()), function (slot0)
			return slot0.level < pg.gameset.level_get_proficency.key_value and table.contains(uv0, slot0:getShipType())
		end)
		slot13 = slot12:getBlackBlackShipIds(ClassMediator.__cname)
	end

	for slot21, slot22 in pairs(slot14) do
		if slot22 ~= slot6 then
			table.insert({}, slot22)
		end
	end

	for slot23, slot24 in pairs(slot12:getRawData()) do
		if slot24:isActivityNpc() then
			table.insert({}, slot24.id)
		end
	end

	slot20.activeShipId = slot6
	slot20.selectedMin = slot7
	slot20.selectedMax = slot2
	slot20.quitTeam = slot5
	slot20.shipVOs = slot16
	slot20.blackBlockShipIds = slot13
	slot20.ignoredIds = slot18
	slot20.selectedIds = slot17
	slot20.preView = slot0.viewComponent.__cname
	slot20.flags = {
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
	}

	function slot20.onShip(slot0, slot1, slot2)
		slot3 = "inBackyard"
		slot4 = nil

		if uv0 == BackYardShipInfoLayer.SHIP_TRAIN_TYPE or uv0 == BackYardShipInfoLayer.SHIP_REST_TYPE then
			if uv1 < #slot2 + 1 then
				return false, i18n("backyard_no_pos_for_ship")
			end

			if table.contains(uv2, slot0.id) then
				return false, i18n("backyard_backyardShipInfoMediator_shipState_rest")
			end
		elseif uv0 == BackYardShipInfoLayer.SHIP_CLASS_TYPE then
			if slot0:getEnergy() <= AcademyCourse.MinEnergy then
				return false, i18n("course_energy_not_enough", slot0:getName())
			end

			if slot0.inBackyard then
				function slot4(slot0)
					slot4.content = i18n("exit_backyard_exp_display", uv0:getName(), slot0)

					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						hideNo = true
					})

					uv1 = nil
				end
			end

			slot3 = "inClass"
		end

		slot5, slot6 = Ship.ShipStateConflict(slot3, slot0)

		if slot5 == Ship.STATE_CHANGE_FAIL then
			return false, i18n(slot6)
		elseif slot5 == Ship.STATE_CHANGE_CHECK then
			return Ship.ChangeStateCheckBox(slot6, slot0, function (slot0)
				if uv0 then
					uv0(slot0)
				end

				uv1()
			end)
		end

		return true
	end

	function slot20.onSelected(slot0, slot1)
		if uv0 == BackYardShipInfoLayer.SHIP_CLASS_TYPE then
			slot2 = uv1:getCourse()
			slot2.students = slot0

			uv1:setCourse(slot2)
			slot1()

			return
		end

		pg.UIMgr.GetInstance():LoadingOn()

		if slot0 == nil or #slot0 == 0 then
			slot5.shipId = uv3
			slot5.callback = slot1

			uv2:sendNotification(GAME.EXIT_SHIP, {})
			pg.UIMgr.GetInstance():LoadingOff()

			return
		end

		for slot6, slot7 in ipairs(uv4) do
			if not table.contains(slot0, slot7) then
				table.insert({}, function (slot0)
					slot4.shipId = uv1
					slot4.callback = slot0

					uv0:sendNotification(GAME.EXIT_SHIP, {})
				end)
			end
		end

		uv2.contextData.shipIdToAdd = {}

		for slot6, slot7 in ipairs(slot0) do
			if not table.contains(uv5, slot7) and uv3 ~= slot7 then
				slot10[1] = slot7
				slot10[2] = uv0

				table.insert(uv2.contextData.shipIdToAdd, {})
			end
		end

		if uv2.contextData.shipIdToAdd and table.getCount(uv2.contextData.shipIdToAdd) > 0 then
			for slot6, slot7 in ipairs(uv2.contextData.shipIdToAdd) do
				table.insert(slot2, function (slot0)
					slot4.id = uv1[1]
					slot4.type = uv1[2]
					slot4.callBack = slot0

					uv0:sendNotification(GAME.ADD_SHIP, {})
				end)
			end
		end

		if #slot2 > 0 then
			seriesAsync(slot2, function ()
				uv0.contextData.shipIdToAdd = nil

				uv1()
				pg.UIMgr.GetInstance():LoadingOff()
			end)
		else
			pg.UIMgr.GetInstance():LoadingOff()
			slot1()
		end
	end

	if slot1 == BackYardShipInfoLayer.SHIP_TRAIN_TYPE or slot1 == BackYardShipInfoLayer.SHIP_REST_TYPE then
		slot20.isLayer = true
		slot24.viewComponent = DockyardScene
		slot24.mediator = DockyardMediator
		slot24.data = {
			callbackQuit = true
		}

		slot0:addSubLayers(Context.New({}))
		slot0.viewComponent:EnableUI(false)
	else
		slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, slot20)
	end
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.EXTEND_BACKYARD_DONE
	slot1[2] = DormProxy.DORM_UPDATEED
	slot1[3] = GAME.ADD_SHIP_DONE
	slot1[4] = GAME.EXIT_SHIP_DONE
	slot1[5] = PlayerProxy.UPDATED
	slot1[6] = GAME.REMOVE_LAYERS

	return {}
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
