slot0 = class("BackYardShipsView")

slot0.emit = function (slot0, ...)
	slot0.view:emit(...)
end

slot0.Ctor = function (slot0, slot1)
	slot0.view = slot1
	slot0.factory = slot1.factory
	slot0.shipModels = {}
end

slot0.UpdateHouse = function (slot0, slot1)
	slot0.houseVO = slot1
	slot0.furnitureVOs = slot0.houseVO.furnitures
	slot0.boatVOs = slot0.houseVO.ships
end

slot0.LoadAllShip = function (slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.boatVOs) do
		table.insert(slot2, function (slot0)
			onNextTick(function ()
				if slot0.isExist then
					slot1()

					return
				end

				slot0:LoadShip(slot2, slot0)
			end)
		end)
	end

	seriesAsync(slot2, slot1)
end

slot0.StartMoveShips = function (slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.boatVOs) do
		if not slot7:hasInterActionFurnitrue() then
			table.insert(slot2, function (slot0)
				slot0:emit(BackyardMainMediator.ADD_BOAT_MOVE, slot1.id)
				slot0()
			end)
		end
	end

	seriesAsync(slot2, slot1)
end

slot0.LoadShip = function (slot0, slot1, slot2)
	slot0.factory:MakeBoat(slot1, function (slot0)
		slot1 = BackYardShipModel.New(slot0, slot0)
		slot1.shipModels[slot0.id] = slot1

		slot1:onLoadSlotModel(slot1.view)

		if slot1.onLoadSlotModel then
			slot2()
		end
	end)
end

slot0.ExitShip = function (slot0, slot1)
	slot0.shipModels[slot1.id].dispose(slot2)

	slot0.shipModels[slot1.id] = nil
	slot0.boatVOs[slot1.id] = nil
end

slot0.StopAllBoatMove = function (slot0, slot1)
	pg.UIMgr.GetInstance():LoadingOn()

	slot2 = {}

	table.sort(slot3, function (slot0, slot1)
		return ((slot0.boatVO:hasSpineInterAction() and 1) or 0) > ((slot1.boatVO:hasSpineInterAction() and 1) or 0)
	end)

	function slot4(slot0, slot1)
		if not slot0.boatVO:hasSpineInterAction() then
			slot0:emit(BackyardMainMediator.CANCEL_SHIP_MOVE, slot0.boatVO.id)
			slot0:removeItem()
			slot0:updateShadowTF(false)

			if not slot0.boatVO:hasInterActionFurnitrue() then
				slot0.tf:SetAsLastSibling()
			end

			slot1()
		elseif slot0.furnitureVOs[slot0.boatVO:getSpineId()]:isTransPort() or slot4:isLoopSpineInterAction() then
			slot1()
		else
			slot0:breakSpineAnim(slot1)
		end
	end

	for slot8, slot9 in pairs(slot3) do
		table.insert(slot2, function (slot0)
			slot0(slot0, slot0)
		end)
	end

	seriesAsync(slot2, function ()
		pg.UIMgr.GetInstance():LoadingOff()

		if pg.UIMgr.GetInstance().LoadingOff then
			slot0()
		end
	end)
end

slot0.EnableTouch = function (slot0, slot1)
	slot2 = pairs
	slot3 = slot0.shipModels or {}

	for slot5, slot6 in slot2(slot3) do
		if not IsNil(slot6.go) then
			slot6:enableTouch(slot1)
		end
	end
end

slot0.AnyShipInTransPort = function (slot0)
	for slot4, slot5 in pairs(slot0.shipModels) do
		if slot5:inTransport() then
			return true
		end
	end

	return false
end

slot0.ReSort = function (slot0)
	for slot4, slot5 in pairs(slot0.shipModels) do
		if slot0.boatVOs[slot4]:getPosition() and not slot0.boatVOs[slot4]:hasInterActionFurnitrue() and not slot0.boatVOs[slot4]:hasSpineInterAction() and not slot0.boatVOs[slot4]:hasSpineExtra() then
			slot5:removeItem()
			slot5:createItem(slot6)
		end
	end
end

slot0.CancelInterAction = function (slot0, slot1)
	slot0.shipModels[slot1]:CancelInterAction()
end

slot0.CloseBodyMask = function (slot0, slot1)
	slot0.shipModels[slot1]:closeBodyMask()
end

slot0.ClearSpine = function (slot0, slot1)
	slot0.shipModels[slot1]:clearSpine()
end

slot0.ClearStageInterAction = function (slot0, slot1)
	slot0.shipModels[slot1]:clearStageInterAction()
end

slot0.InterActionTransport = function (slot0, slot1, slot2)
	slot0.shipModels[slot1]:InterActionTransport(slot2)
end

slot0.InterActionTransportAgain = function (slot0, slot1, slot2)
	slot0.shipModels[slot1]:InterActionTransportAgain(slot2)
end

slot0.InterActionTransportEnd = function (slot0, slot1)
	slot0.shipModels[slot1]:InterActionTransportEnd(furnId)
end

slot0.SetInterAction = function (slot0, slot1, slot2, slot3, slot4)
	if slot0.shipModels[slot2] then
		slot5:updateBoatVO(slot0.boatVOs[slot2])

		slot6 = slot0.furnitureVOs[slot3]

		if slot1 then
			slot5:updateSpineInterAction(slot6)
		else
			slot5:updateInterActionPos(slot6, slot4)
			slot5:InterActionSortSibling(slot3)
		end
	end
end

slot0.SetStageInterAction = function (slot0, slot1, slot2)
	if slot0.shipModels[slot1] then
		slot3:updateStageInterAction(slot2)
	end
end

slot0.ClearStageInterAction = function (slot0, slot1)
	if slot0.shipModels[slot1] then
		slot2:clearStageInterAction()
	end
end

slot0.UpdateArchInteraction = function (slot0, slot1, slot2)
	if slot0.shipModels[slot1] then
		slot3:updateArchInterAction(slot2)
	end
end

slot0.ClearArchInteration = function (slot0, slot1)
	if slot0.shipModels[slot1] then
		slot2:clearArchInterAction()
	end
end

slot0.ClearSpineInteraction = function (slot0, slot1, slot2, slot3)
	if slot0.shipModels[slot2] then
		slot4:clearSpineInteraction(slot3)
		slot4:removeAllActionCB()
	end
end

slot0.AddSpineExtra = function (slot0, slot1, slot2, slot3)
	if slot0.shipModels[slot2] then
		if slot0.furnitureVOs[slot1]:hasTailAction() then
			slot4:endSpineAnimator(slot5, slot3)
			slot4:startSpineAnimator(slot5, slot3)
			slot4:setAction(slot6, 0)
			slot4:addSpineExtra(slot1, slot3)
		else
			slot0.shipModels[slot5:getSpineId()].pauseAnim(slot7)

			for slot11, slot12 in ipairs(slot5:getShipExtra()) do
				slot13 = slot0.shipModels[slot12]

				if slot12 == slot2 then
					slot13:addSpineExtra(slot1, slot11)
					slot7:registerActionCB(slot12, function (slot0)
						slot0:setAction(slot0, 0)
					end, function ()
						slot0:endSpineAnimator(slot0, )
						slot0.endSpineAnimator:startSpineAnimator(slot0.endSpineAnimator, )
					end)
				end
			end

			slot7:resumeAnim()
		end
	end
end

slot0.ClearSpineExtra = function (slot0, slot1, slot2, slot3)
	if slot0.shipModels[slot2] and slot0.furnitureVOs[slot1]:getSpineId() then
		slot4:clearSpineExtra(slot1, slot3)
		slot0.shipModels[slot6]:removeActionCB(slot2)
	end
end

slot0.BoatMove = function (slot0, slot1, slot2, slot3)
	slot0.shipModels[slot1]:move(slot2, slot3)
end

slot0.BoatMoveOnFurniture = function (slot0, slot1, slot2, slot3)
	slot0.shipModels[slot1]:moveOnFurniture(slot2, slot3)
end

slot0.CancelShipMove = function (slot0, slot1)
	slot0.shipModels[slot1]:cancelMove()
end

slot0.UpdateShipPos = function (slot0, slot1)
	slot0.boatVOs[slot1.id]:setPosition(slot1:getPosition())

	if slot0.shipModels[slot1.id] then
		slot3:updateBoatVO(slot0.boatVOs[slot1.id])
		slot3:updatePosition(slot2)
	end
end

slot0.AcquireEffect = function (slot0, slot1, slot2, slot3)
	if slot0.shipModels[slot1] then
		slot4:acquireEffect(slot2, slot3)
	end
end

slot0.AddBoatInimacyAndMoney = function (slot0, slot1)
	if slot0.shipModels[slot1.id] then
		slot2:updateInimacy(slot1:hasInimacy())
		slot2:updateMoney(slot1:hasMoney())
	else
		slot0.boatVOs[slot1.id].setInimacy(slot3, slot1.inimacy)
		slot0.boatVOs[slot1.id]:setMoney(slot1.money)
	end
end

slot0.Destroy = function (slot0)
	for slot4, slot5 in pairs(slot0.shipModels) do
		slot5:dispose()
	end

	slot0.shipModels = nil
	slot0.isExist = true
end

return slot0
