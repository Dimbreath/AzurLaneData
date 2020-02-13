slot0 = class("BackYardView", import(".BackYardBaseView"))

function slot0.Ctor(slot0, slot1, slot2, slot3, slot4)
	slot0.super.Ctor(slot0, slot1, slot2, slot3, slot4)

	slot0.shipsView = BackYardShipsView.New(slot0)
end

function slot0.setHouse(slot0, slot1)
	slot0.houseVO = slot1

	slot0.shipsView:UpdateHouse(slot1)

	slot0.furnitureVOs = slot0.houseVO.furnitures
	slot0.boatVOs = slot0.houseVO.ships
	slot0.wallPaperVO = slot0.houseVO.wallPaper
	slot0.floorPaperVO = slot0.houseVO.floorPaper
end

function slot0.updateExtendItemVO(slot0, slot1)
	slot0.itemVO = slot1:getItemById(ITEM_BACKYARD_AREA_EXTEND) or Item.New({
		count = 0,
		id = ITEM_BACKYARD_AREA_EXTEND
	})
end

function slot0.OnInit(slot0)
	slot0.furnitureModals = {}
	slot0.floorContain = slot0:findTF("bg/furContain/floor")
	slot0.floorGrid = slot0:findTF("bg/floorGrid")
	slot0.furContain = slot0:findTF("bg/furContain")
	slot0.wallContain = slot0:findTF("bg/furContain/wall")
	slot0.carpetContain = slot0:findTF("bg/furContain/carpet")
	slot0.decorationBtn = slot0:findTF("decorateBtn")
	slot0.warn = slot0:findTF("bg/warn")
	slot0.backBtn = findTF(slot0._tf, "back")
	slot0.mainTFCG = findTF(slot0._tf.parent, "main"):GetComponent(typeof(CanvasGroup))
	slot0.eyeBtn = findTF(slot0._tf.parent, "main/eye_btn")
	slot0.warnCG = slot0.warn:GetComponent("CanvasGroup")
	slot0.road = slot0:findTF("bg/road"):GetComponent(typeof(Image))
	slot0.wallPaperModel = BackYardPaperModel.New(slot0:findTF("bg/wall"), BackYardPaperModel.PAPER_TYPE_WALL)
	slot0.baseWallPaperModel = BackYardPaperModel.New(slot0:findTF("bg/wall_base"), BackYardPaperModel.PAPER_TYPE_BASEWALL)
	slot0.floorPaperModel = BackYardPaperModel.New(slot0:findTF("bg/floor"), BackYardPaperModel.PAPER_TYPE_FLOOR)
	slot0.msgBoxWindow = BackYardMsgBox.New(slot0:findTF("msg_box"))
	slot0.furnitureDescWindow = FurnitureDescWindow.New(slot0:findTF("desc_panel"))

	setActive(slot0.decorationBtn, not slot0:IsVisitMode())

	slot0:findTF("bg"):GetComponent(typeof(CanvasGroup)).blocksRaycasts = not slot0.IsVisitMode()
end

function slot0.enableDecorateMode(slot0, slot1)
	if defaultValue(slot0.decorateMode, false) == slot1 then
		return
	end

	slot0.decorateMode = slot1

	setActive(slot0.backBtn, slot1)
	SetActive(slot0.floorGrid, slot1)
	setActive(slot0.eyeBtn, not slot1)
	slot0.shipsView:EnableTouch(slot1)

	slot2 = pairs
	slot3 = slot0.furnitureModals or {}

	for slot5, slot6 in slot2(slot3) do
		if not slot0.furnitureVOs[slot5]:canBeTouch() then
			slot6:EnableTouch(slot1)
		end
	end

	slot0.warnCG.blocksRaycasts = not slot1
	slot0.mainTFCG.blocksRaycasts = not slot1

	slot0:EnableMultiTouch(not slot1)

	if not slot1 then
		slot0:closePreFurnSelected()
		slot0:emit(BackyardMainMediator.BOAT_POSITION_RESET)
		slot0:emit(BackyardMainMediator.CLOSE_GARNITURE)
		slot0.map.afterSortFunc(slot0.map.sortedItems)
	end
end

function slot0.OnDidEnter(slot0)
	onButton(slot0, slot0.floorGrid, function ()
		if slot0.isDraging then
			return
		end

		slot0:closePreFurnSelected()
	end, SFX_PANEL)
	onButton(slot0, slot0.decorationBtn, function ()
		if slot0.inInitFurnitrues then
			pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_is_loading"))

			return
		end

		if slot0.shipsView:AnyShipInTransPort() or slot0.blockEvent then
			return
		end

		slot0.shipsView:StopAllBoatMove(function ()
			slot0:emit(BackyardMainMediator.OPEN_DECORATION)
		end)
	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()
		if slot0.isDraging then
			return
		end

		if slot0.houseVO:hasChangeFurnitures() then
			slot0:closePreFurnSelected()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("backyard_backyardScene_quest_saveFurniture"),
				onYes = function ()
					slot0:save()
				end,
				yesSound = SFX_FURNITRUE_SAVE,
				onNo = function ()
					slot0:emit(BackyardMainMediator.RESTORE_FURNITURES)
				end
			})
		else
			slot0:enableDecorateMode(false)
		end
	end, SFX_CANCEL)
	slot0:initHouse()
end

function slot0.save(slot0)
	if slot0.houseVO:hasChangeFurnitures() then
		slot0:emit(BackyardMainMediator.SAVE_FURNITURE)
	else
		slot0:enableDecorateMode(false)
	end
end

function slot0.initHouse(slot0)
	slot0.maps = {}
	slot0.map = slot0:createMap(slot0.houseVO.endX + 1, slot0.houseVO.endY + 1)

	slot0:updateHouseArea(slot0.houseVO.level)
	slot0:initFurnitures()
	slot0:emit(BackyardMainMediator.ON_CHECK_EFFECT)
end

function slot0.updateHouseArea(slot0, slot1)
	if not slot0.roadPositions then
		slot0.roadPositions = {
			-920,
			-1080,
			-1230,
			-1230
		}
	end

	slot0.road.sprite = GetSpriteFromAtlas("furniture/base/road_" .. slot1, "")

	slot0.road:SetNativeSize()
	setActive(slot0.road, true)

	tf(go(slot0.road)).anchoredPosition = Vector3(0, slot0.roadPositions[slot1], 0)
	slot0:findTF("bg").sizeDelta = Vector2(slot0.findTF("bg").sizeDelta.x, slot3)

	scrollTo(slot0._tf, 0.5, 0.5)

	if slot1 <= 0 or slot1 > 3 then
		SetActive(slot0.warn, false)
	else
		slot0.warn.localPosition = BackYardConst.level2WarnPos(slot1)
	end

	onButton(slot0, slot0.warn, function ()
		triggerButton(go(slot0.road))
	end, SFX_PANEL)
	onButton(slot0, go(slot0.road), function ()
		if slot0 > 3 then
			return
		end

		slot3 = pg.item_data_statistics[id2ItemId(pg.shop_template[slot1.houseVO:getExpandId()].resource_type)].name

		function slot4()
			if slot0.itemVO.count <= 0 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("backyard_buyExtendItem_question", slot1.resource_num .. ),
					onYes = function ()
						slot0:emit(BackyardMainMediator.BUY_EXTEND_BACKYARD_ITEM, slot0, 1)
						slot0.emit.msgBoxWindow:Close()
					end
				})
			else
				slot0:emit(BackyardMainMediator.EXTEND_BACKYARD_AREA)
				slot0.emit.msgBoxWindow:Close()
			end
		end

		slot6 = {}

		for slot10, slot11 in ipairs(string.split(slot5, "||")) do
			slot6["text" .. slot10] = slot11
		end

		slot1.msgBoxWindow:Show(slot6, slot1.itemVO, slot4)
	end, SFX_PANEL)
	slot0:loadWallPaper(slot0.wallPaperVO, Furniture.TYPE_WALLPAPER)
	slot0:loadWallPaper(slot0.floorPaperVO, Furniture.TYPE_FLOORPAPER)
end

function slot0.createMap(slot0, slot1, slot2)
	slot3 = pg.IsometricMap.New(slot1, slot2)

	slot3:SetAfterFunc(function (slot0)
		slot1 = 0

		for slot5, slot6 in ipairs(slot0) do
			if not slot6.ob.isBoat then
				slot0.furnitureModals[slot6.ob.id]:SetSiblingIndex(slot1)
			end

			slot1 = slot1 + 1
		end

		slot0.shipsView:ReSort()
	end)

	return slot3
end

function slot0.getMap(slot0, slot1)
	if slot1.parent ~= 0 and slot0.maps[slot1.parent] then
		return slot0.maps[slot1.parent]
	elseif slot1.parent ~= 0 and not slot0.maps[slot1.parent] then
		slot8, slot9 = slot0.furnitureVOs[slot1.parent]:getMapSize()
		slot0.maps[slot1.parent] = slot0:createMap(slot2, slot3)

		return slot0.maps[slot1.parent]
	else
		return slot0.map
	end
end

function slot0.createItem(slot0, slot1)
	slot0.furnitureModals[slot1.id]:AddItem(slot0:getMap(slot1))
end

function slot0.removeItem(slot0, slot1)
	slot2 = nil
	slot2 = (slot1:hasParent() or slot0.map) and slot0.maps[slot1.parent]

	if slot0.furnitureModals[slot1.id] then
		slot3:RemoveItem(slot2)
	end
end

function slot0.initFurnitures(slot0)
	slot0.inInitFurnitrues = true
	slot1 = {
		{},
		{},
		{},
		{}
	}
	slot2 = {
		{},
		{},
		{},
		{}
	}

	for slot6, slot7 in pairs(slot0.furnitureVOs) do
		if slot7:hasParent() and slot7:hasChild() then
			table.insert(slot1[3], slot7)
		elseif slot7:hasParent() then
			table.insert(slot1[4], slot7)
		elseif slot7:isStageFurniture() then
			table.insert(slot1[1], slot7)
		else
			table.insert(slot1[2], slot7)
		end
	end

	for slot6, slot7 in ipairs(slot1) do
		for slot11, slot12 in ipairs(slot7) do
			table.insert(slot2[slot6], function (slot0)
				slot0:loadFurnitureModel(slot0.loadFurnitureModel, true, slot0)
			end)
		end
	end

	seriesAsync({
		function (slot0)
			slot0.shipsView:LoadAllShip(slot0)
		end,
		function (slot0)
			limitedParallelAsync(slot0[1], 5, slot0)
		end,
		function (slot0)
			limitedParallelAsync(slot0[2], 5, slot0)
		end,
		function (slot0)
			limitedParallelAsync(slot0[3], 5, slot0)
		end,
		function (slot0)
			seriesAsync(slot0[4], slot0)
		end,
		function (slot0)
			slot0.shipsView:StartMoveShips(slot0)
		end
	}, function ()
		slot0.inInitFurnitrues = nil

		slot0:sortWallFurns()
		slot0.sortWallFurns:sortAllMat()
	end)
end

function slot0.loadWallPaper(slot0, slot1, slot2)
	if slot2 == Furniture.TYPE_WALLPAPER then
		slot0.wallPaperModel:update(slot1, slot0.houseVO.level)
		slot0.baseWallPaperModel:update(slot1, slot0.houseVO.level)
	elseif slot2 == Furniture.TYPE_FLOORPAPER then
		slot0.floorPaperModel:update(slot1, slot0.houseVO.level)
	end
end

function slot0.loadFurnitureModel(slot0, slot1, slot2, slot3)
	slot0.factory:Make(slot1, function (slot0)
		if slot0.isExist then
			if slot1 then
				slot1()
			end

			return
		end

		if not slot0 then
			if slot1 then
				slot1()
			end

			return
		end

		slot1 = slot2:isFloor()
		slot2 = BackYardFurnitureModel.New(slot0, BackYardFurnitureModel.New, slot0.backyardPoolMgr)
		slot0.furnitureModals[slot2.id] = slot2

		slot2:SetParent(slot0.furContain)
		slot0:updateFurnitruePos(slot2)
		slot0:registerFurnitureEvent(slot2)

		if slot2:getPosition() then
			slot2:LoadingAnim(slot1)
		elseif slot1 then
			slot1()
		end
	end)
end

function slot0.registerFurnitureEvent(slot0, slot1)
	slot2:EnableTouch(slot1:canBeTouch() or slot0.decorateMode)
	slot2.iconEvent:AddPointClickFunc(slot6)
	slot0.furnitureModals[slot1.id].dragEvent:AddBeginDragFunc(function ()
		slot0:furnitureBeginDrag(slot0)
		slot0.furnitureBeginDrag:enableZoom(false)
	end)
	slot0.furnitureModals[slot1.id].dragEvent:AddDragFunc(function (slot0, slot1)
		slot0:furnitureDrag(slot0:change2ScrPos(slot0.floorGrid, slot1.position), slot1)
	end)
	slot0.furnitureModals[slot1.id].dragEvent:AddDragEndFunc(function (slot0, slot1)
		slot0:enableZoom(true)
		slot0:furnitureEndDrag(slot0:getMapPos(slot2), slot1)
	end)
	onButton(slot0, slot0:findTF("ok", slot0.furnitureModals[slot1.id].dragTF), function ()
		if slot0.isDraging then
			return
		end

		slot0:closePreFurnSelected()
	end, SFX_CONFIRM)
	onButton(slot0, slot0:findTF("cancel", slot0.furnitureModals[slot1.id].dragTF), function ()
		if slot0.isDraging then
			return
		end

		slot0:closePreFurnSelected()
		slot0.closePreFurnSelected:emit(BackyardMainMediator.REMOVE_FURNITURE, slot1.id)
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("rotation", slot0.furnitureModals[slot1.id].dragTF), function ()
		if slot0.isDraging then
			return
		end

		slot0:UpdateFurnitrueDir(slot1.id)
	end, SFX_PANEL)

	if slot0.decorateMode then
		if slot0.curFurnModal then
			slot0:closePreFurnSelected()
		end

		slot6()
	end
end

function slot0.UpdateFurnitrueDir(slot0, slot1)
	slot0.rotateId = slot1

	slot0:emit(BackyardMainMediator.FURNITURE_DIR_CHANGE, slot1)
end

function slot0.updateFurnitruePos(slot0, slot1)
	if not slot0.furnitureModals[slot1.id] then
		return
	end

	slot2:UpdateFurnitureVO(slot1)
	slot0:setFurnitureParent(slot1)

	slot3 = nil

	if slot1:hasParent() then
		slot3 = slot0.furnitureVOs[slot1.parent]
	end

	slot2:SetPosition(slot3)

	if slot3 then
		slot2:SetParent(slot0.furnitureModals[slot1.parent].childsTF, true)

		if slot0.maps[slot1.parent] then
			slot0.maps[slot4].afterSortFunc(slot0.maps[slot4].sortedItems)
		end
	end

	slot0:createItem(slot1)
end

function slot0.updateFurnitureWithAnim(slot0, slot1, slot2, slot3)
	if slot2 == 0 then
		slot0:updateFurnitruePos(slot1)
	else
		slot0.furnitureModals[slot1.id].UpdateFurnitureVO(slot4, slot1)
		slot0.furnitureModals[slot1.id]:MoveToTarget(slot2, function ()
			slot0:removeItem(slot0)
			slot0.removeItem:createItem(slot0.removeItem)
		end)
	end
end

function slot0.removeFurn(slot0, slot1)
	if slot1:hasInterActionShipId() then
		for slot6, slot7 in ipairs(slot2) do
			slot0.shipsView:CancelInterAction(slot7)
			slot0.shipsView:CloseBodyMask(slot7)
		end
	end

	if slot1:getSpineId() then
		slot0.shipsView:CancelInterAction(slot2)
		slot0.shipsView:ClearSpine(slot1:getSpineId())
	end

	if slot1:hasStageShip() then
		slot3 = pairs
		slot4 = slot1:getStageShip() or {}

		for slot6, slot7 in slot3(slot4) do
			slot0.shipsView:CancelInterAction(slot7)
			slot0.shipsView:ClearStageInterAction(slot7)
		end
	end

	if slot1:hasSpineExtra() then
		for slot5, slot6 in pairs(slot1:getShipExtra()) do
			slot0.shipsView:CancelInterAction(slot6)
		end
	end

	slot0.furnitureModals[slot1.id].Clear(slot2)

	slot0.curFurnModal = nil
	slot0.furnitureModals[slot1.id] = nil
	slot0.furnitureVOs[slot1.id] = nil

	if slot0.maps[slot1.id] then
		slot0.maps[slot1.id] = nil
	end
end

function slot0.furnitureBeginDrag(slot0, slot1)
	if slot0.isDraging then
		return
	end

	slot0.isDraging = true

	if IsNil(slot0.decoratePanelCG) then
		slot0.decoratePanelCG = GetOrAddComponent(GameObject.Find("/UICamera/Canvas/UIMain/BackYardGarnitureUI(Clone)/decoratePanel"), typeof(CanvasGroup))
	end

	slot0.decoratePanelCG.blocksRaycasts = false


	-- Decompilation error in this vicinity:
	function (slot0)
		slot0:setPreSelectedParent(slot0.furnitureModals[slot0.id]._tf)
		slot0.furnitureModals[slot0.id].SetAsLastSibling(slot1)

		if not slot0:isMapItem() then
			return
		end

		slot1:SetParent(slot0.floorContain, true)
	end(slot1)
end

function slot0.furnitureDrag(slot0, slot1, slot2)
	if not slot0.isDraging then
		return
	end

	slot4 = slot0.houseVO:limitWallFurnWidth(slot3, slot2)

	if not slot2:isFloor() and not slot0.houseVO:isLimitWallBound(slot2, slot4) then
		return
	end

	slot6, slot11 = slot0.houseVO:isLegalPos(slot2, slot4)

	slot0.furnitureModals[slot2.id].changeGridColor(slot5, slot7, slot8)
	slot0:setWallModalDir(slot2, slot3)
	slot0.furnitureModals[slot2.id]:SetTargetPosition(slot0.houseVO:isLocaledAndPutOn(slot2, slot4), slot4)
end

function slot0.furnitureEndDrag(slot0, slot1, slot2)
	if not slot0.isDraging then
		return
	end

	slot4 = slot0.houseVO:limitWallFurnWidth(slot1, slot2)

	slot0.furnitureModals[slot2.id].changeGridColor(slot3, {})

	if not slot2:isFloor() and not slot0.houseVO:isLimitWallBound(slot2, slot4) then
		slot4 = slot0.houseVO:getWallBound(slot1, slot2)
	end

	function slot5()
		slot0:setPreSelectedParent(slot0.furContain)

		if not slot0:isFloor() then
			slot0:sortWallFurns()
		end

		if slot1:isMat() then
			slot0:sortAllMat()
		end

		slot0.decoratePanelCG.blocksRaycasts = true
		slot0.decoratePanelCG.isDraging = nil
	end

	function slot7(slot0)
		slot2 = slot0.furnitureModals[slot0.id]

		slot0:setWallModalDir(slot0, slot0.furnitureVOs[slot0.id]:getPosition())

		slot3 = nil

		if slot0:hasParent() then
			slot3 = slot0.furnitureVOs[slot0.parent]
		end

		slot2:FallBackAnim(function ()
			if slot0 then
				slot3:SetParent(slot1.furnitureModals[slot2.parent].childsTF, true)
				slot3.SetParent.maps[slot3.parent].afterSortFunc(slot1.maps[slot2.parent].sortedItems)
			end

			slot1.map.afterSortFunc(slot1.map.sortedItems)
			slot4()
		end, slot3)
	end

	function slot8()
		slot1(slot2, BackyardMainMediator.FURNITURE_POS_CHNAGE, slot1.id, slot0, (slot0.houseVO:isLocaledAndPutOn() and slot0.id) or slot0)
		BackyardMainMediator.FURNITURE_POS_CHNAGE()
	end

	if slot6(slot2, slot4) then
		slot8()
	else
		slot7(slot2)
	end
end

function slot0.sortAllMat(slot0)
	_.each(slot0.houseVO:getMats(), function (slot0)
		if slot0.furnitureModals[slot0.id] then
			slot1:SetAsLastSibling()
		end
	end)
end

function slot0.sortWallFurns(slot0)
	slot1, slot5, slot3 = slot0.houseVO:sortWallFurns()

	for slot7, slot8 in ipairs(slot2) do
		if slot0.furnitureModals[slot8.id] then
			slot9:SetAsLastSibling()
		end
	end

	for slot7, slot8 in ipairs(slot1) do
		if slot0.furnitureModals[slot8.id] then
			slot9:SetAsLastSibling()
		end
	end

	for slot7, slot8 in ipairs(slot3) do
		if slot0.furnitureModals[slot8.id] then
			slot9:SetAsFirstSibling()
		end
	end
end

function slot0.rotateFurn(slot0, slot1)
	slot2 = slot0.furnitureModals[slot1.id]

	for slot6, slot7 in pairs(slot1.child) do
		slot0:setFurnitureParent(slot0.furnitureVOs[slot6])
	end

	slot2:UpdateFurnitureVO(slot1)
	slot2:ReserseDir()

	if slot0.rotateId == slot1.id then
		slot0:createItem(slot1)

		if slot0.preFurnSelected then
			slot0:setPreSelectedParent(slot2._tf)

			slot0.preFurnSelected.anchoredPosition3D = Vector3(0, 0, 0)

			slot0:setPreSelectedParent(slot0.furContain)
		end

		slot0.rotateId = nil
	end
end

function slot0.closePreFurnSelected(slot0)
	if not IsNil(slot0.preFurnSelected) and slot0.curFurnModal then
		slot0:setPreSelectedParent(slot0.curFurnModal._tf)

		slot0.preFurnSelected.anchoredPosition3D = Vector3(0, 0, 0)

		SetActive(slot0.preFurnSelected, false)
		SetActive(slot0.curFurnModal.gridsTF, false)

		slot0.preFurnSelected = nil
		slot0.curFurnModal = nil
	end
end

function slot0.setPreSelectedParent(slot0, slot1)
	if not IsNil(slot0.preFurnSelected) and not IsNil(slot1) then
		slot0.preFurnSelected:SetParent(slot1, true)
	end
end

function slot0.setWallModalDir(slot0, slot1, slot2)
	if slot1:isFloor() then
		return
	end

	slot3 = slot0.furnitureModals[slot1.id]

	if not IsNil(slot0.preFurnSelected) then
		slot0:setPreSelectedParent(slot0.furContain)
	end

	slot3:UpdateScale(slot2)

	if not IsNil(slot0.preFurnSelected) then
		slot0:setPreSelectedParent(slot3._tf)

		slot0.preFurnSelected.anchoredPosition3D = Vector3(0, 0, 0)
	end
end

function slot0.setFurnitureParent(slot0, slot1)
	slot0.furnitureModals[slot1.id]:SetParent((slot1:isFloor() and ((slot1:isMat() and slot0.carpetContain) or slot0.floorContain)) or slot0.wallContain, true)
end

function slot0.loadBoatModal(slot0, slot1, slot2)
	slot0.shipsView:LoadShip(slot1, slot2)
end

function slot0.exitBoat(slot0, slot1)
	slot0.shipsView:ExitShip(slot1)
end

function slot0.InterActionTransport(slot0, slot1, slot2)
	slot0.shipsView:InterActionTransport(slot1, slot2)
end

function slot0.InterActionTransportAgain(slot0, slot1, slot2)
	slot0.shipsView:InterActionTransportAgain(slot1, slot2)
end

function slot0.InterActionTransportEnd(slot0, slot1)
	slot0.shipsView:InterActionTransportEnd(slot1)
end

function slot0.setInterAction(slot0, slot1, slot2, slot3, slot4)
	slot0.shipsView:SetInterAction(slot1, slot2, slot3, slot4)
end

function slot0.setStageInterAction(slot0, slot1, slot2)
	slot0.shipsView:SetStageInterAction(slot1, slot2)
end

function slot0.clearStageInterAction(slot0, slot1)
	slot0.shipsView:ClearStageInterAction(slot1)
end

function slot0.updateArchInteraction(slot0, slot1, slot2)
	slot0.shipsView:UpdateArchInteraction(slot1, slot2)
end

function slot0.clearArchInteration(slot0, slot1)
	slot0.shipsView:ClearArchInteration(slot1)
end

function slot0.clearSpineInteraction(slot0, slot1, slot2, slot3)
	slot0.shipsView:ClearSpineInteraction(slot1, slot2, slot3)
end

function slot0.addSpineExtra(slot0, slot1, slot2, slot3)
	slot0.shipsView:AddSpineExtra(slot1, slot2, slot3)
end

function slot0.clearSpineExtra(slot0, slot1, slot2, slot3)
	slot0.shipsView:ClearSpineExtra(slot1, slot2, slot3)
end

function slot0.boatMove(slot0, slot1, slot2, slot3)
	slot0.shipsView:BoatMove(slot1, slot2, slot3)
end

function slot0.boatMoveOnFurniture(slot0, slot1, slot2, slot3)
	slot0.shipsView:BoatMoveOnFurniture(slot1, slot2, slot3)
end

function slot0.cancelShipMove(slot0, slot1)
	slot0.shipsView:CancelShipMove(slot1)
end

function slot0.updateShipPos(slot0, slot1)
	slot0.shipsView:UpdateShipPos(slot1)
end

function slot0.acquireEffect(slot0, slot1, slot2, slot3)
	slot0.shipsView:AcquireEffect(slot1, slot2, slot3)
end

function slot0.addBoatInimacyAndMoney(slot0, slot1)
	slot0.shipsView:AddBoatInimacyAndMoney(slot1)
end

function slot0.applyEffect(slot0, slot1)
	slot0.effectMgr:applyEffect(slot1)
end

function slot0.disableEffect(slot0, slot1)
	slot0.effectMgr:disableEffect(slot1)
end

function slot0.GetFurnitureGo(slot0, slot1)
	return slot0.furnitureModals[slot1]._tf
end

function slot0.OnWillExit(slot0)
	slot0.shipsView:Destroy()

	slot1 = {
		{},
		{},
		{}
	}

	for slot5, slot6 in pairs(slot0.furnitureModals) do
		if slot0.furnitureVOs[slot5]:hasParent() and not slot7:hasChild() then
			table.insert(slot1[1], slot6)
		elseif slot7:hasParent() and slot7:hasChild() then
			table.insert(slot1[2], slot6)
		else
			table.insert(slot1[3], slot6)
		end
	end

	for slot5, slot6 in ipairs(slot1) do
		for slot10, slot11 in ipairs(slot6) do
			slot11:Clear()
		end
	end

	slot0.furnitureModals = nil

	if not IsNil(slot0.furContain) then
		removeAllChildren(slot0.furContain:Find("shadow"))
		setActive(slot0.furContain:Find("ship_grid"), false)
	end

	if not IsNil(slot0.carpetContain) then
		removeAllChildren(slot0.carpetContain)
	end

	if not IsNil(slot0.wallContain) then
		removeAllChildren(slot0.wallContain)
	end

	if not IsNil(slot0.floorContain) then
		removeAllChildren(slot0.floorContain)
	end

	if not IsNil(slot0.baseBG) then
		Destroy(slot0.baseBG)
	end

	if not IsNil(slot0.floorGrid) then
		setActive(slot0.floorGrid, false)
	end

	slot0.wallPaperModel:dispose()
	slot0.floorPaperModel:dispose()
	slot0.msgBoxWindow:Destroy()
	slot0.furnitureDescWindow:Destroy()
end

return slot0
