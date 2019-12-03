slot0 = class("BackYardFurnitureModel")
slot1 = require("Mod/BackYard/view/BackYardTool")

slot0.Ctor = function (slot0, slot1, slot2, slot3)
	slot0._go = slot1
	slot0._tf = tf(slot1)
	slot0.poolmgr = slot3

	slot0:UpdateFurnitureVO(slot2)

	slot0._go.name = slot2.id
	slot0.dragTF = slot0._tf:Find("drag")

	setActive(slot0.dragTF, false)

	slot0.dragTF.anchoredPosition3D = Vector3(0, 0, 0)
	slot0.dragEvent = GetOrAddComponent(slot0.dragTF, "EventTriggerListener")
	slot0.rotationTF = slot0.dragTF:Find("rotation")

	SetActive(slot0.rotationTF, slot2:isFloor() and slot2:canRotate())

	slot0.iconTF = slot0._tf:Find("icon")
	slot0.iconImg = slot0.iconTF:GetComponent(typeof(Image))
	slot0.iconEvent = GetOrAddComponent(slot0.iconTF, "EventTriggerListener")

	slot0:UpdateScale(slot2.position)

	slot0.childsTF = slot0._tf:Find("childs")
	slot0.gridsTF = slot0._tf:Find("grids")
	slot0.grids = {}

	if slot2:isSpine() then
		slot0.spineAnimUI = GetOrAddComponent(slot0._tf:Find("icon/spine"), typeof(SpineAnimUI))
	end

	slot0.touchSwitch = false

	setActive(slot0._go, true)

	slot0.item = nil
	slot0.effects = {}
end

slot0.PlayAnim = function (slot0, slot1)
	if slot0.furnitureVO:isSpine() then
		slot0.spineAnimUI:SetAction(slot1, 0)
	end
end

slot0.PlayEffect = function (slot0, slot1)
	if slot1 == slot0.loading then
		return
	end

	if slot0.effects[slot1] then
		setActive(slot2, true)
	else
		slot0.loading = slot1

		PoolMgr.GetInstance():GetUI(slot1, true, function (slot0)
			if IsNil(slot0._tf) or not slot0.loading then
				return
			end

			slot0.effects[] = slot0

			SetParent(slot0, slot0.iconTF)
			setActive(slot0, true)

			slot0.loading = nil
		end)
	end
end

slot0.StopEffect = function (slot0, slot1)
	if slot0.loading == slot1 then
		slot0.loading = nil
	end

	if slot0.effects[slot1] then
		setActive(slot2, false)
	end
end

slot0.UpdateScale = function (slot0, slot1)
	slot2 = 1

	if slot0.furnitureVO:isFloor() then
		slot2 = slot0.getSign(slot0.furnitureVO.dir == 2)
	else
		slot2 = slot0.getSign(BackyardFurnitureVO.isRightWall(slot1))
	end

	slot0._tf.localScale = Vector3(slot2, 1, 1)
end

slot0.UpdateFurnitureVO = function (slot0, slot1)
	slot0.furnitureVO = slot1
end

slot0.SetParent = function (slot0, slot1, slot2)
	slot0._tf:SetParent(slot1, slot2)
end

slot0.SetPosition = function (slot0, slot1)
	slot2 = slot0.furnitureVO
	slot0._tf.localPosition = slot0.getLocalPos(slot0.furnitureVO:getPosition())

	if #slot0.grids == 0 then
		slot0:initGrids()
	end

	if slot1 then
		slot0._tf.localPosition = Vector2(slot0._tf.localPosition.x + (slot1:getConfig("offset")[1] or 0), slot4.y + (slot5[2] or 0))
	end
end

slot0.SetTargetPosition = function (slot0, slot1, slot2)
	slot3 = slot0.getLocalPos(slot2)

	if slot1 then
		slot0._tf.localPosition = Vector2(slot3.x + slot1:getConfig("offset")[1], slot3.y + slot1.getConfig("offset")[2])
	else
		slot0._tf.localPosition = slot3
	end
end

slot0.FallBackAnim = function (slot0, slot1, slot2)
	LeanTween.moveLocal(go(slot0._tf), Vector3(slot0.getLocalPos(slot3).x, slot0.getLocalPos(slot3).y, 0), 0.1):setOnComplete(System.Action(function ()
		if slot0 then
			slot1._tf.localPosition = Vector2(slot0._tf.localPosition.x + slot0:getConfig("offset")[1], slot0._tf.localPosition.y + slot0.getConfig("offset")[2])
		end

		slot2()
	end))
end

slot0.initGrids = function (slot0)
	slot3 = slot0.gridsTF
	slot4 = slot0.furnitureVO.isFloor(slot1)

	for slot9, slot10 in ipairs(slot5) do
		slot11 = slot3:GetChild(0)

		SetParent(slot11, slot0._tf.parent)

		slot0.grids[slot9] = slot11
		slot11.localPosition = slot0.getLocalPos(slot10)

		if not slot4 and BackyardFurnitureVO.isRightWall(slot2) then
			slot11.localScale = Vector3(1, 1, 1)
		end

		slot11:SetParent(slot3, true)
		setActive(slot11, true)
	end
end

slot0.changeGridColor = function (slot0, slot1, slot2)
	for slot7, slot8 in pairs(slot3) do
		slot0.changeGridColor(slot8, BackYardConst.BACKYARD_GREEN)
	end

	if slot2 then
		for slot7, slot8 in ipairs(slot3) do
			slot0.changeGridColor(slot8, BackYardConst.BACKYARD_BLUE)
		end
	end

	for slot7, slot8 in pairs(slot1) do
		slot0.changeGridColor(slot3[slot8], BackYardConst.BACKYARD_RED)
	end
end

slot0.SetAsLastSibling = function (slot0)
	slot0._tf:SetAsLastSibling()
end

slot0.SetAsFirstSibling = function (slot0)
	slot0._tf:SetAsFirstSibling()
end

slot0.SetSiblingIndex = function (slot0, slot1)
	slot0._tf:SetSiblingIndex(slot1)
end

slot0.ReserseDir = function (slot0)
	slot0._tf.localScale = Vector3(-slot0._tf.localScale.x, slot0._tf.localScale.y, slot0._tf.localScale.z)
end

slot0.EnableTouch = function (slot0, slot1)
	slot0.iconImg.raycastTarget = slot1
end

slot0.TouchAnim = function (slot0)
	if not LeanTween.isTweening(go(slot0._tf)) then
		LeanTween.scale(slot0._tf, Vector3(slot0._tf.localScale.x - 0.05, slot0._tf.localScale.y - 0.05, slot0._tf.localScale.z - 0.05), 0.01):setOnComplete(System.Action(function ()
			LeanTween.scale(slot0._tf, , 0.1)
		end))
	end
end

slot0.LoadingAnim = function (slot0, slot1)
	LeanTween.scale(rtf(slot0._tf), Vector3(slot0._tf.localScale.x + 0.2, slot0._tf.localScale.y + 0.2, 1), 0.2):setFrom(0):setOnComplete(System.Action(function ()
		LeanTween.scale(rtf(slot0._tf), Vector3(slot1, Vector3, 1), 0.1):setOnComplete(System.Action(0.1))
	end))
end

slot0.TouchSpineAnim = function (slot0, slot1, slot2)
	slot4 = slot0.spineAnimUI
	slot5, slot6, slot7 = slot0.furnitureVO.getTouchSpineConfig(slot3)

	if not slot6 and slot0.touchSwitch then
		return
	end

	if slot0.touchSwitch and slot6 then
		slot4:SetAction("normal", 0)

		if slot3:isMoveable() then
			slot1()
		end

		slot0.touchSwitch = false

		return
	end

	slot4:SetActionCallBack(function (slot0)
		if slot0 == "finish" and not slot0 then
			slot1:SetAction("normal", 0)

			if slot1:isMoveable() then
				slot3()
			end

			slot1:SetActionCallBack(nil)

			slot4.touchSwitch = false
		end
	end)

	if slot5 then
		slot4:SetAction(slot5, 0)

		slot0.touchSwitch = true

		if slot3:isMoveable() then
			slot2()
		end
	end

	if slot7 then
		slot0:playFurnitureVoice(slot7)
	end
end

slot0.playFurnitureVoice = function (slot0, slot1)
	function slot2()
		slot0:stopCV()

		slot0.stopCV.currVoice = playSoundEffect(playSoundEffect)
	end

	if slot0.loadedBank then
		slot2()
	else
		pg.CriMgr.GetInstance():LoadCV("furniture", function ()
			slot0 = pg.CriMgr.GetCVBankName(pg.CriMgr.GetCVBankName)

			if pg.CriMgr.GetCVBankName.exited then
				pg.CriMgr.UnloadCVBank(slot0)
			else
				slot2()

				if slot2.currVoice then
					slot1.loadedBank = slot0
				end
			end
		end)
	end
end

slot0.stopCV = function (slot0)
	if slot0.currVoice then
		slot0.currVoice:Stop(true)
	end

	slot0.currVoice = nil
end

slot0.MoveToTarget = function (slot0, slot1, slot2)
	function slot3(slot0, slot1)
		return slot0 - slot1.normalized * Vector2.Distance(slot1, slot0) * 0.5 + slot1
	end

	slot4 = slot0.furnitureVO

	if LeanTween.isTweening(go(slot0._tf)) then
		LeanTween.cancel(go(slot0._tf))
	end

	LeanTween.moveLocal(go(slot0._tf), slot7, slot1 / 2):setOnComplete(System.Action(function ()
		slot0()
		LeanTween.moveLocal(go(slot1._tf), slot1._tf, slot3 / 2)
	end))
end

slot0.AddItem = function (slot0, slot1)
	if not slot0.furnitureVO:isMapItem() then
		return
	end

	slot8, slot9 = slot2:getSize()

	slot1:PlaceItem(slot2:getPosition().x + 1, slot2.getPosition().y + 1, slot1:CreateItem(slot4, slot5, {
		isBoat = false,
		id = slot2.id
	}))

	slot0.item = slot1.CreateItem(slot4, slot5, )
end

slot0.RemoveItem = function (slot0, slot1)
	if not slot0.furnitureVO:isMapItem() then
		return
	end

	if not slot0.item then
		return
	end

	slot1:RemoveItem(slot3)

	slot0.item = nil
end

slot0.Clear = function (slot0)
	for slot4, slot5 in pairs(slot0.effects) do
		PoolMgr.GetInstance():ReturnUI(slot4, slot5)
	end

	slot0:stopCV()

	if LeanTween.isTweening(go(slot0._tf)) then
		LeanTween.cancel(go(slot0._tf))
	end

	slot2 = (slot0.furnitureVO:isFloor() and BackyardPoolMgr.POOL_NAME.GRID) or BackyardPoolMgr.POOL_NAME.WALL
	slot3 = pairs
	slot4 = slot0.grids or {}

	for slot6, slot7 in slot3(slot4) do
		slot0.poolmgr:Enqueue(slot2, slot7.gameObject)
	end

	slot4 = _.flatten(slot3)

	eachChild(slot0._tf, function (slot0)
		if not table.contains(slot0, go(slot0).name) then
			Destroy(slot0)
		end

		if table.contains(slot1[1], go(slot0).name) then
			removeAllChildren(slot0)
		end
	end)
	slot0.poolmgr:Enqueue(BackyardPoolMgr.POOL_NAME.FURNITURE, slot0._go)
	ClearEventTrigger(slot0.dragEvent)
end

return slot0
