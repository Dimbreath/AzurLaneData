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
		uv0:sendNotification(GAME.SHOPPING, {
			id = slot1,
			count = slot2
		})
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

	slot5 = nil
	slot9 = getProxy(NavalAcademyProxy):getCourse().students
	slot10 = getProxy(BayProxy)
	slot11 = {}
	slot12, slot13 = nil

	if slot1 == BackYardShipInfoLayer.SHIP_TRAIN_TYPE then
		slot11 = slot0.dormProxy:getTrainShipIds()
		slot12 = slot0.dormProxy:getRestShipIds()
	elseif slot1 == BackYardShipInfoLayer.SHIP_REST_TYPE then
		slot11 = slot7
		slot12 = slot6
	elseif slot1 == BackYardShipInfoLayer.SHIP_CLASS_TYPE then
		slot5 = 0
		slot11 = slot9
		slot16 = slot8:getCourse():getConfig("type")
		slot13 = _.filter(_.values(slot10:getData()), function (slot0)
			return slot0.level < pg.gameset.level_get_proficency.key_value and table.contains(uv0, slot0:getShipType())
		end)
	end

	slot14 = nil

	if slot3 and slot1 ~= BackYardShipInfoLayer.SHIP_CLASS_TYPE then
		for slot18 = #slot11, 1, -1 do
			if slot11[slot18] ~= slot3.id then
				table.insert({}, slot11[slot18])
			end
		end
	else
		slot14 = Clone(slot11)
	end

	if slot1 == BackYardShipInfoLayer.SHIP_TRAIN_TYPE or slot1 == BackYardShipInfoLayer.SHIP_REST_TYPE then
		for slot19, slot20 in pairs(slot0.viewComponent.trainShipVOs) do
			table.insert(slot15.priorEquipUpShipIDList, slot19)
		end

		for slot19, slot20 in pairs(slot0.viewComponent.restShipVOs) do
			table.insert(slot15.priorEquipUpShipIDList, slot19)
		end

		slot0:addSubLayers(Context.New({
			viewComponent = DockyardScene,
			mediator = DockyardMediator,
			data = {
				callbackQuit = true,
				selectedMin = slot5,
				selectedMax = slot2,
				quitTeam = slot1 ~= BackYardShipInfoLayer.SHIP_CLASS_TYPE and slot3 ~= nil,
				shipVOs = slot13,
				ignoredIds = pg.ShipFlagMgr.GetInstance():FilterShips({
					isActivityNpc = true
				}),
				selectedIds = slot14,
				preView = slot0.viewComponent.__cname,
				hideTagFlags = ShipStatus.TAG_HIDE_BACKYARD,
				blockTagFlags = slot1 ~= BackYardShipInfoLayer.SHIP_CLASS_TYPE and ShipStatus.TAG_BLOCK_BACKYARD or nil,
				onShip = function (slot0, slot1, slot2)
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

						if slot0:getFlag("inBackyard") then
							function slot4(slot0)
								pg.MsgboxMgr.GetInstance():ShowMsgBox({
									hideNo = true,
									content = i18n("exit_backyard_exp_display", uv0:getName(), slot0)
								})

								uv1 = nil
							end
						end

						slot3 = "inClass"
					end

					slot5, slot6 = ShipStatus.ShipStatusCheck(slot3, slot0, function (slot0)
						if uv0 then
							uv0(slot0)
						end

						uv1()
					end)

					return slot5, slot6
				end,
				onSelected = function (slot0, slot1)
					if uv0 == BackYardShipInfoLayer.SHIP_CLASS_TYPE then
						slot2 = uv1:getCourse()
						slot2.students = slot0

						uv1:setCourse(slot2)
						slot1()

						return
					end

					pg.UIMgr.GetInstance():LoadingOn()

					if slot0 == nil or #slot0 == 0 then
						uv2:sendNotification(GAME.EXIT_SHIP, {
							shipId = uv3.id,
							callback = slot1
						})
						pg.UIMgr.GetInstance():LoadingOff()

						return
					end

					for slot6, slot7 in ipairs(uv4) do
						if not table.contains(slot0, slot7) then
							table.insert({}, function (slot0)
								uv0:sendNotification(GAME.EXIT_SHIP, {
									shipId = uv1,
									callback = slot0
								})
							end)
						end
					end

					uv2.contextData.shipIdToAdd = {}

					for slot6, slot7 in ipairs(slot0) do
						if not table.contains(uv4, slot7) then
							table.insert(uv2.contextData.shipIdToAdd, {
								slot7,
								uv0
							})
						end
					end

					if uv2.contextData.shipIdToAdd and #uv2.contextData.shipIdToAdd > 0 then
						for slot6, slot7 in ipairs(uv2.contextData.shipIdToAdd) do
							table.insert(slot2, function (slot0)
								uv0:sendNotification(GAME.ADD_SHIP, {
									id = uv1[1],
									type = uv1[2],
									callBack = slot0
								})
							end)
						end
					end

					if #slot2 > 0 then
						seriesAsync(slot2, function ()
							uv0.contextData.shipIdToAdd = nil

							pg.UIMgr.GetInstance():LoadingOff()
							uv1()
						end)
					else
						pg.UIMgr.GetInstance():LoadingOff()
						slot1()
					end
				end,
				priorEquipUpShipIDList = {},
				isLayer = true
			}
		}))
		slot0.viewComponent:EnableUI(false)
	else
		slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, slot15)
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
