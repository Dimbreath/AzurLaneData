slot0 = class
slot1 = "BackYardShipModel"
slot0 = slot0(slot1)
slot1 = 0.5
slot2 = 15
slot3 = require
slot4 = "Mod/BackYard/view/BackYardTool"
slot3 = slot3(slot4)
slot4 = {}
slot5 = {
	"tuozhuai2",
	1.4,
	39126
}
slot4[1] = slot5
slot5 = {
	"walk",
	1.5,
	100005
}
slot4[2] = slot5
slot5 = {
	"dance",
	10,
	100005
}
slot4[3] = slot5
slot5 = {
	"walk",
	2,
	100006
}
slot4[4] = slot5
slot5 = {
	"stand2",
	2,
	100006
}
slot4[5] = slot5
slot5 = {
	"dance",
	2,
	100006
}
slot4[6] = slot5
slot5 = {
	"sit",
	1.33,
	46129
}
slot4[7] = slot5
slot5 = {
	"sit",
	4.333,
	50124
}
slot4[8] = slot5
slot5 = {
	"dance",
	2,
	100009
}
slot4[9] = slot5
slot5 = {
	"sit",
	3.33,
	60118
}
slot4[10] = slot5
slot5 = {
	"yun",
	5.17,
	60118
}
slot4[11] = slot5

function slot5(slot0, slot1, slot2)
	slot3 = pg
	slot3 = slot3.DelegateInfo
	slot3 = slot3.New
	slot4 = slot0

	slot3(slot4)

	slot0.go = slot1
	slot3 = tf
	slot4 = slot1
	slot3 = slot3(slot4)
	slot0.tf = slot3
	slot4 = slot0
	slot3 = slot0.updateBoatVO
	slot5 = slot2

	slot3(slot4, slot5)

	slot3 = pg
	slot3 = slot3.ship_data_statistics
	slot4 = slot0.boatVO
	slot4 = slot4.configId
	slot3 = slot3[slot4]
	slot0.cfg = slot3
	slot3 = slot0.cfg
	slot3 = slot3.backyard_speed
	slot0.speed = slot3
	slot3 = slot0.tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "_effect_"
	slot3 = slot3(slot4, slot5)
	slot0.effectContainer = slot3
	slot3 = slot0.tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "bodyMask"
	slot3 = slot3(slot4, slot5)
	slot0.bodyMask = slot3
end

slot0.Ctor = slot5

function slot5(slot0, slot1)
	slot0.boatVO = slot1
end

slot0.updateBoatVO = slot5

function slot5(slot0, slot1)
	slot0.viewComponent = slot1
	slot2 = pg
	slot2 = slot2.ViewUtils
	slot2 = slot2.SetLayer
	slot3 = slot0.tf
	slot4 = Layer
	slot4 = slot4.UI

	slot2(slot3, slot4)

	slot2 = slot0.tf
	slot3 = Vector3
	slot4 = slot0
	slot5 = slot0
	slot6 = 1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.localScale = slot3
	slot2 = slot0.tf
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "model"
	slot2 = slot2(slot3, slot4)
	slot0.model = slot2
	slot2 = slot0.model
	slot3 = Vector3
	slot4 = 1
	slot5 = 1
	slot6 = 1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.localScale = slot3
	slot2 = slot1.floorContain
	slot0.floorGrid = slot2
	slot2 = slot1.floorContain
	slot2 = slot2.parent
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "ship_grid"
	slot2 = slot2(slot3, slot4)
	slot0.shipGridContainer = slot2
	slot2 = slot0.shipGridContainer
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "grid"
	slot2 = slot2(slot3, slot4)
	slot0.shipGrid = slot2
	slot2 = slot0.shipGrid
	slot3 = slot2
	slot2 = slot2.GetComponent
	slot4 = typeof
	slot5 = Image
	slot2 = slot2(slot3, slot4(slot5))
	slot0.shipGridImg = slot2
	slot2 = slot0.model
	slot3 = slot2
	slot2 = slot2.GetComponent
	slot4 = "SpineAnimUI"
	slot2 = slot2(slot3, slot4)
	slot0.spineAnimUI = slot2
	slot2 = slot0.spineAnimUI
	slot3 = slot2
	slot2 = slot2.SetAction
	slot4 = "stand2"
	slot5 = 0

	slot2(slot3, slot4, slot5)

	slot2 = GetOrAddComponent
	slot3 = slot0.go
	slot4 = "CanvasGroup"
	slot2 = slot2(slot3, slot4)
	slot0.canvasGroup = slot2
	slot2 = slot0.tf
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "chat"
	slot2 = slot2(slot3, slot4)
	slot0.chatTF = slot2
	slot3 = slot0
	slot2 = slot0.loadClick

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.loadExp

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.loadInimacy

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.loadMoeny

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.loadShadow
	slot5 = slot1
	slot4 = slot1.findTF
	slot6 = "bg/furContain/shadow"

	slot2(slot3, slot4(slot5, slot6))

	slot2 = slot0.tf
	slot3 = slot2
	slot2 = slot2.SetParent
	slot4 = slot1.floorContain
	slot5 = false

	slot2(slot3, slot4, slot5)

	slot2 = slot0.boatVO
	slot3 = slot2
	slot2 = slot2.getPosition
	slot2 = slot2(slot3)
	slot4 = slot0
	slot3 = slot0.updateShadowTF
	slot5 = true

	slot3(slot4, slot5)

	slot4 = slot0
	slot3 = slot0.updatePosition
	slot5 = slot2

	slot3(slot4, slot5)

	slot4 = slot0
	slot3 = slot0.updateShadowPos

	slot3(slot4)

	slot4 = slot0
	slot3 = slot0.addBoatDragListenter

	slot3(slot4)

	slot3 = {}
	slot0.actionCallback = slot3
end

slot0.onLoadSlotModel = slot5

function slot5(slot0)
	slot1 = SetParent
	slot2 = slot0.tf
	slot3 = slot0.floorGrid

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.setAction
	slot3 = "stand2"

	slot1(slot2, slot3)
end

slot0.CancelInterAction = slot5

function slot5(slot0, slot1)
	slot2 = slot0.tf
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "shadow"
	slot2 = slot2(slot3, slot4)
	slot0.shadowTF = slot2
	slot2 = setParent
	slot3 = slot0.shadowTF
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = slot0.shadowTF
	slot3 = slot0.tf
	slot3 = slot3.localPosition
	slot2.localPosition = slot3
end

slot0.loadShadow = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)
	slot5 = LeanTween
	slot5 = slot5.scale
	slot6 = tf
	slot7 = slot1
	slot6 = slot6(slot7)
	slot7 = slot2
	slot8 = 0.5
	slot5 = slot5(slot6, slot7, slot8)
	slot6 = slot5
	slot5 = slot5.setEase
	slot7 = LeanTweenType
	slot7 = slot7.easeOutBack
	slot5 = slot5(slot6, slot7)
	slot6 = slot5
	slot5 = slot5.setDelay
	slot7 = slot3
	slot5 = slot5(slot6, slot7)
	slot6 = slot5
	slot5 = slot5.setOnComplete
	slot7 = System
	slot7 = slot7.Action

	function slot8()
		slot0 = slot0

		slot0()
	end

	slot5(slot6, slot7(slot8))
end

slot0.showChat = slot5

function slot5(slot0)
	slot1 = slot0.tf
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "click"
	slot1 = slot1(slot2, slot3)
	slot0.clickTF = slot1
	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.clickTF

	function slot4()
		slot0 = slot0
		slot0 = slot0.boatVO
		slot1 = slot0
		slot0 = slot0.hasInterActionFurnitrue
		slot0 = slot0(slot1)

		if slot0 then
			return
		end

		slot0 = slot0
		slot0 = slot0.boatVO
		slot1 = slot0
		slot0 = slot0.hasSpineInterAction
		slot0 = slot0(slot1)

		if slot0 then
			return
		end

		slot0 = slot0
		slot0 = slot0.stageId

		if not slot0 then
			slot0 = slot0
			slot0 = slot0.archId

			if slot0 then
				return
			end
		end

		slot0 = slot0
		slot0 = slot0.boatVO
		slot1 = slot0
		slot0 = slot0.hasSpineExtra
		slot0 = slot0(slot1)

		if slot0 then
			return
		end

		slot0 = playSoundEffect
		slot1 = SFX_BOAT_CLICK

		slot0(slot1)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.switchAnimation
		slot2 = "touch"

		slot0(slot1, slot2)

		slot0 = slot0
		slot0 = slot0.inimacyTF
		slot0 = slot0.gameObject
		slot0 = slot0.activeSelf

		if slot0 ~= true then
			slot0 = slot0
			slot0 = slot0.moneyTF
			slot0 = slot0.gameObject
			slot0 = slot0.activeSelf

			if slot0 == true then
				return
			end
		end

		slot0 = setButtonEnabled
		slot1 = slot0
		slot1 = slot1.clickTF
		slot2 = false

		slot0(slot1, slot2)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.showChat
		slot2 = slot0
		slot2 = slot2.chatTF
		slot3 = Vector3
		slot4 = slot1
		slot4 = 1 / slot4
		slot5 = slot1
		slot5 = 1 / slot5
		slot3 = slot3(slot4, slot5)
		slot4 = 0

		function slot5()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.showChat
			slot2 = slot0
			slot2 = slot2.chatTF
			slot3 = Vector3
			slot4 = 0
			slot5 = 0
			slot6 = 0
			slot3 = slot3(slot4, slot5, slot6)
			slot4 = 2

			function slot5()
				slot0 = setButtonEnabled
				slot1 = slot0
				slot1 = slot1.clickTF
				slot2 = true

				slot0(slot1, slot2)
			end

			slot0(slot1, slot2, slot3, slot4, slot5)
		end

		slot0(slot1, slot2, slot3, slot4, slot5)
	end

	slot1(slot2, slot3, slot4)
end

slot0.loadClick = slot5

function slot5(slot0)
	slot1 = slot0.tf
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "addition"
	slot1 = slot1(slot2, slot3)
	slot0.expTF = slot1
	slot1 = findTF
	slot2 = slot0.expTF
	slot3 = "money"
	slot1 = slot1(slot2, slot3)
	slot0.moneyAdditionTF = slot1
	slot1 = findTF
	slot2 = slot0.expTF
	slot3 = "intimacy"
	slot1 = slot1(slot2, slot3)
	slot0.inimacyAdditionTF = slot1
	slot1 = findTF
	slot2 = slot0.expTF
	slot3 = "exp"
	slot1 = slot1(slot2, slot3)
	slot0.expAdditionTF = slot1
	slot2 = slot0
	slot1 = slot0.changeInnerDir
	slot3 = 1

	slot1(slot2, slot3)
end

slot0.loadExp = slot5

function slot5(slot0)
	slot1 = slot0.spineFurniture

	if slot1 then
		slot1 = slot0.spineFurniture
		slot2 = slot1
		slot1 = slot1.getSpineAniScale
		slot1 = slot1(slot2)
		slot2 = slot0.spineFurniture
		slot3 = slot2
		slot2 = slot2.hasSpineShipBodyMask
		slot2 = slot2(slot3)

		if slot1 then
			if slot2 then
				slot3 = slot0.spineFurniture
				slot3 = slot3.dir

				if slot3 == 2 then
					slot0.model.localScale = Vector3(slot1 * -1 or slot1, 1, 1)
				end
			end
		end

		if slot2 then
			slot4 = slot0
			slot3 = slot0.showBodyMask
			slot5 = slot0.spineFurniture
			slot6 = slot5
			slot5 = slot5.getSpineShipBodyMask
			slot5 = slot5(slot6)
			slot6 = slot0.spineFurniture
			slot6 = slot6.dir

			slot3(slot4, slot5, slot6)
		end
	end
end

slot0.updateModelDir = slot5

function slot5(slot0, slot1)
	slot2 = slot0.bodyMask

	if slot2 then
		slot2 = go
		slot3 = slot0.bodyMask
		slot2 = slot2(slot3)
		slot2 = slot2.activeSelf

		if slot2 then
			slot2 = tf
			slot3 = slot0.bodyMask
			slot2 = slot2(slot3)
			slot3 = Vector3
			slot4 = slot1
			slot5 = 1
			slot6 = 1
			slot3 = slot3(slot4, slot5, slot6)
			slot2.localScale = slot3
		end
	end
end

slot0.changeInnerDir = slot5

function slot5(slot0)
	slot1 = slot0.tf
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "intimacy"
	slot1 = slot1(slot2, slot3)
	slot0.inimacyTF = slot1
	slot1 = floatAni
	slot2 = slot0.inimacyTF
	slot3 = 20
	slot4 = 1

	slot1(slot2, slot3, slot4)

	slot2 = slot0
	slot1 = slot0.updateInimacy
	slot3 = slot0.boatVO
	slot4 = slot3
	slot3 = slot3.hasInimacy

	slot1(slot2, slot3(slot4))
end

slot0.loadInimacy = slot5

function slot5(slot0)
	slot1 = slot0.tf
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "money"
	slot1 = slot1(slot2, slot3)
	slot0.moneyTF = slot1
	slot1 = slot0.moneyTF
	slot2 = Vector2
	slot3 = 145
	slot4 = 290
	slot2 = slot2(slot3, slot4)
	slot1.localPosition = slot2
	slot1 = slot0.moneyTF
	slot2 = Vector2
	slot3 = slot0
	slot3 = 1 / slot3
	slot4 = slot0
	slot4 = 1 / slot4
	slot2 = slot2(slot3, slot4)
	slot1.localScale = slot2
	slot1 = floatAni
	slot2 = slot0.moneyTF
	slot3 = 20
	slot4 = 1

	slot1(slot2, slot3, slot4)

	slot2 = slot0
	slot1 = slot0.updateMoney
	slot3 = slot0.boatVO
	slot4 = slot3
	slot3 = slot3.hasMoney

	slot1(slot2, slot3(slot4))
end

slot0.loadMoeny = slot5

function slot5(slot0)
	slot1 = IsNil
	slot2 = slot0.shadowTF
	slot1 = slot1(slot2)

	if slot1 then
		return
	end

	slot1 = slot0.archId

	if slot1 then
		slot1 = slot0.viewComponent
		slot2 = slot1
		slot1 = slot1.GetFurnitureGo
		slot3 = slot0.archId
		slot1 = slot1(slot2, slot3)
		slot2 = slot0
		slot2 = slot2.turnTransformLocalPos
		slot3 = slot0.tf
		slot3 = slot3.localPosition
		slot5 = slot1
		slot4 = slot1.Find
		slot6 = "childs"
		slot4 = slot4(slot5, slot6)
		slot5 = slot0.floorGrid
		slot2 = slot2(slot3, slot4, slot5)
		slot3 = slot0.shadowTF
		slot3.localPosition = slot2
	else
		slot1 = slot0.shadowTF
		slot2 = slot0.tf
		slot2 = slot2.localPosition
		slot1.localPosition = slot2
	end
end

slot0.updateShadowPos = slot5

function slot5(slot0, slot1)
	slot2 = IsNil
	slot3 = slot0.shadowTF
	slot2 = slot2(slot3)

	if slot2 then
		return
	end

	slot2 = slot0.boatVO
	slot3 = slot2
	slot2 = slot2.hasInterActionFurnitrue
	slot2 = slot2(slot3)

	if not slot2 then
		slot2 = slot0.boatVO
		slot3 = slot2
		slot2 = slot2.hasSpineInterAction
		slot2 = slot2(slot3)

		if not slot2 then
			slot2 = slot0.boatVO
			slot3 = slot2
			slot2 = slot2.inStageFurniture
			slot2 = slot2(slot3)

			if slot2 then
				slot2 = setActive
				slot3 = slot0.shadowTF
				slot4 = false

				slot2(slot3, slot4)
			else
				slot2 = setActive
				slot3 = slot0.shadowTF
				slot4 = slot1

				slot2(slot3, slot4)
			end
		end
	end
end

slot0.updateShadowTF = slot5

function slot5(slot0, slot1)
	if slot1 then
		slot2 = SetActive
		slot3 = slot0.shipGridContainer
		slot4 = true

		slot2(slot3, slot4)

		slot2 = slot0
		slot2 = slot2.getLocalPos
		slot3 = slot1
		slot2 = slot2(slot3)
		slot3 = slot0.shipGrid
		slot3.localPosition = slot2
	end
end

slot0.updateBottomGridPos = slot5

function slot5(slot0)
	slot1 = GetOrAddComponent
	slot2 = slot0.go
	slot3 = "EventTriggerListener"
	slot1 = slot1(slot2, slot3)
	slot0.dragTrigger = slot1
	slot2 = nil
	slot4 = slot1
	slot3 = slot1.AddBeginDragFunc

	function slot5(slot0, slot1)
		slot2 = slot0
		slot2 = slot2.isInTransport

		if slot2 then
			return
		end

		slot2 = slot0
		slot2 = slot2.viewComponent
		slot2 = slot2.zoom
		slot2 = slot2.pinching

		if slot2 then
			return
		end

		slot2 = Input
		slot2 = slot2.touchCount
		slot3 = 1

		if slot2 > slot3 then
			return
		end

		slot2 = slot0
		slot2 = slot2.viewComponent
		slot2.dragShip = slot0
		slot2 = slot0
		slot2 = slot2.viewComponent
		slot3 = slot2
		slot2 = slot2.enableZoom
		slot4 = false

		slot2(slot3, slot4)

		slot2 = playSoundEffect
		slot3 = SFX_BOAT_DRAG

		slot2(slot3)

		slot2 = slot0
		slot2 = slot2.boatVO
		slot3 = slot2
		slot2 = slot2.getPosition
		slot2 = slot2(slot3)
		slot1 = slot2
		slot2 = slot0
		slot3 = nil
		slot2.isMove = slot3
		slot2 = slot0
		slot2 = slot2.boatVO
		slot3 = slot2
		slot2 = slot2.hasSpineInterAction
		slot2 = slot2(slot3)

		if slot2 then
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.breakSpineAnim

			slot2(slot3)
		end

		slot2 = slot0
		slot2 = slot2.boatVO
		slot3 = slot2
		slot2 = slot2.hasSpineExtra
		slot2 = slot2(slot3)

		if slot2 then
			slot2 = slot0
			slot2 = slot2.viewComponent
			slot3 = slot2
			slot2 = slot2.emit
			slot4 = BackyardMainMediator
			slot4 = slot4.ON_CLEAR_SPINR_EXTRA
			slot5 = slot0
			slot5 = slot5.boatVO
			slot5 = slot5.id
			slot6 = slot0
			slot6 = slot6.boatVO
			slot6 = slot6.spineExtra

			slot2(slot3, slot4, slot5, slot6)
		end

		slot2 = slot0
		slot2 = slot2.boatVO
		slot3 = slot2
		slot2 = slot2.hasInterActionFurnitrue
		slot2 = slot2(slot3)

		if slot2 then
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.clearInterAction

			slot2(slot3)
		end

		slot2 = slot0
		slot2 = slot2.spineAnimUI
		slot3 = slot2
		slot2 = slot2.SetAction
		slot4 = "tuozhuai2"
		slot5 = 0

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.closeBodyMask

		slot2(slot3)

		slot2 = slot0
		slot2 = slot2.viewComponent
		slot3 = slot2
		slot2 = slot2.emit
		slot4 = BackyardMainMediator
		slot4 = slot4.CANCEL_SHIP_MOVE
		slot5 = slot0
		slot5 = slot5.boatVO
		slot5 = slot5.id

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.removeItem

		slot2(slot3)

		slot2 = SetParent
		slot3 = slot0
		slot3 = slot3.tf
		slot4 = slot0
		slot4 = slot4.floorGrid

		slot2(slot3, slot4)

		slot2 = tf
		slot3 = slot0
		slot3 = slot3.go
		slot2 = slot2(slot3)
		slot3 = slot2
		slot2 = slot2.SetAsLastSibling

		slot2(slot3)

		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.changeInnerDir
		slot4 = Mathf
		slot4 = slot4.Sign
		slot5 = slot0
		slot5 = slot5.tf
		slot5 = slot5.localScale
		slot5 = slot5.x

		slot2(slot3, slot4(slot5))

		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.changeGridColor
		slot4 = BackYardConst
		slot4 = slot4.BACKYARD_GREEN

		slot2(slot3, slot4)

		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.updateBottomGridPos
		slot4 = slot0
		slot4 = slot4.boatVO
		slot5 = slot4
		slot4 = slot4.getPosition

		slot2(slot3, slot4(slot5))

		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.updateShadowPos

		slot2(slot3)
	end

	slot3(slot4, slot5)

	slot4 = slot1
	slot3 = slot1.AddDragFunc

	function slot5(slot0, slot1)
		slot2 = slot0
		slot2 = slot2.viewComponent
		slot2 = slot2.dragShip

		if slot2 == slot0 then
			slot2 = slot1
			slot2 = slot2.change2ScrPos
			slot3 = slot0
			slot3 = slot3.floorGrid
			slot4 = slot1.position
			slot2 = slot2(slot3, slot4)
			slot3 = slot1
			slot3 = slot3.getMapPos
			slot4 = slot2
			slot3 = slot3(slot4)
			slot4 = slot1
			slot4 = slot4.getLocalPos
			slot5 = slot3
			slot4 = slot4(slot5)
			slot5 = tf
			slot6 = slot0
			slot6 = slot6.go
			slot5 = slot5(slot6)
			slot6 = Vector3
			slot7 = slot4.x
			slot8 = slot4.y
			slot9 = slot2
			slot8 = slot8 + slot9
			slot9 = 0
			slot6 = slot6(slot7, slot8, slot9)
			slot5.localPosition = slot6
			slot5 = slot0
			slot6 = slot5
			slot5 = slot5.updateShadowPos

			slot5(slot6)

			slot5 = slot0
			slot5 = slot5.viewComponent
			slot5 = slot5.houseVO
			slot6 = slot5
			slot5 = slot5.canMoveBoat
			slot7 = slot0
			slot7 = slot7.boatVO
			slot7 = slot7.id
			slot8 = slot3
			slot5, slot6 = slot5(slot6, slot7, slot8)
			slot7 = slot0
			slot7 = slot7.viewComponent
			slot7 = slot7.furnitureVOs
			slot7 = slot7[slot6]

			if not slot5 and slot7 then
				slot9 = slot7
				slot8 = slot7.canTriggerInteraction
				slot8 = slot8(slot9)
			end

			if slot8 then
				slot9 = BackYardConst
				slot9 = slot9.BACKYARD_GREEN

				if not slot9 then
					slot9 = BackYardConst
					slot9 = slot9.BACKYARD_RED
				end
			end

			slot10 = slot0
			slot11 = slot10
			slot10 = slot10.changeGridColor
			slot12 = slot9

			slot10(slot11, slot12)

			slot10 = slot0
			slot11 = slot10
			slot10 = slot10.updateBottomGridPos
			slot12 = slot3

			slot10(slot11, slot12)
		end
	end

	slot3(slot4, slot5)

	slot4 = slot1
	slot3 = slot1.AddDragEndFunc

	function slot5(slot0, slot1)
		slot2 = slot0
		slot2 = slot2.viewComponent
		slot2 = slot2.dragShip

		if slot2 == slot0 then
			slot2 = slot0
			slot2 = slot2.viewComponent
			slot3 = nil
			slot2.dragShip = slot3
			slot2 = slot0
			slot2 = slot2.viewComponent
			slot3 = slot2
			slot2 = slot2.enableZoom
			slot4 = true

			slot2(slot3, slot4)

			slot2 = slot1
			slot2 = slot2.change2ScrPos
			slot3 = slot0
			slot3 = slot3.floorGrid
			slot4 = slot1.position
			slot2 = slot2(slot3, slot4)
			slot3 = slot1
			slot3 = slot3.getMapPos
			slot4 = slot2
			slot3 = slot3(slot4)
			slot4 = slot0
			slot5 = slot4
			slot4 = slot4.endDrag
			slot6 = slot2
			slot7 = slot3

			slot4(slot5, slot6, slot7)

			slot4 = slot0
			slot5 = slot4
			slot4 = slot4.updateShadowPos

			slot4(slot5)

			slot4 = playSoundEffect
			slot5 = SFX_BOAT_DRAG

			slot4(slot5)
		end
	end

	slot3(slot4, slot5)
end

slot0.addBoatDragListenter = slot5

function slot5(slot0, slot1, slot2)
	slot3 = slot0.viewComponent
	slot3 = slot3.houseVO
	slot5 = slot3
	slot4 = slot3.canPutShip
	slot6 = slot0.boatVO
	slot6 = slot6.id
	slot7 = slot2
	slot4, slot5 = slot4(slot5, slot6, slot7)
	slot7 = slot3
	slot6 = slot3.getArchByPos
	slot8 = slot2
	slot6 = slot6(slot7, slot8)

	if slot6 then
		slot8 = slot6
		slot7 = slot6.canInterAction
		slot7 = slot7(slot8)

		if not slot7 then
			slot8 = slot6
			slot7 = slot6.canInterActionSpine
			slot7 = slot7(slot8)

			if slot7 then
				slot8 = slot6
				slot7 = slot6.canInterActionShipGroup
				slot9 = slot0.boatVO
				slot9 = slot9.gruopId
				slot7 = slot7(slot8, slot9)

				if slot7 then
					slot8 = slot0
					slot7 = slot0.triggerInterAction
					slot9 = slot1
					slot10 = slot6.id

					slot7(slot8, slot9, slot10)
				end
			end
		end
	elseif not slot4 then
		slot8 = slot0
		slot7 = slot0.triggerInterAction
		slot9 = slot1
		slot10 = slot5

		slot7(slot8, slot9, slot10)
	else
		slot8 = slot0
		slot7 = slot0.clearStage

		slot7(slot8)

		slot7 = slot0
		slot7 = slot7.getLocalPos
		slot8 = slot2
		slot7 = slot7(slot8)
		slot8 = tf
		slot9 = slot0.go
		slot8 = slot8(slot9)
		slot9 = Vector3
		slot10 = slot7.x
		slot11 = slot7.y
		slot12 = slot1
		slot11 = slot11 + slot12
		slot12 = 0
		slot9 = slot9(slot10, slot11, slot12)
		slot8.localPosition = slot9
		slot8 = nil
		slot0.isMove = slot8
		slot8 = SetActive
		slot9 = slot0.shipGridContainer
		slot10 = false

		slot8(slot9, slot10)

		slot8 = slot0.spineAnimUI
		slot9 = slot8
		slot8 = slot8.SetAction
		slot10 = "stand2"
		slot11 = 0

		slot8(slot9, slot10, slot11)

		slot9 = slot0
		slot8 = slot0.changeInnerDir
		slot10 = Mathf
		slot10 = slot10.Sign
		slot11 = slot0.tf
		slot11 = slot11.localScale
		slot11 = slot11.x

		slot8(slot9, slot10(slot11))

		slot8 = slot0.viewComponent
		slot9 = slot8
		slot8 = slot8.emit
		slot10 = BackyardMainMediator
		slot10 = slot10.END_DRAG_SHIP
		slot11 = slot0.boatVO
		slot11 = slot11.id
		slot12 = slot2

		slot8(slot9, slot10, slot11, slot12)

		slot9 = slot0
		slot8 = slot0.updateShadowTF
		slot10 = true

		slot8(slot9, slot10)
	end

	slot7 = slot0.save

	if slot7 then
		slot7 = slot0.viewComponent
		slot8 = slot7
		slot7 = slot7.emit
		slot9 = BackyardMainMediator
		slot9 = slot9.SAVE_FURNITURE
		slot10 = false

		slot7(slot8, slot9, slot10)
	end

	slot7 = nil
	slot0.save = slot7
end

slot0.endDrag = slot5

function slot5(slot0, slot1, slot2)
	slot3 = slot0.viewComponent
	slot3 = slot3.furnitureVOs
	slot4 = slot0.boatVO
	slot5 = slot3[slot2]

	if slot2 then
		slot7 = slot5
		slot6 = slot5.isTransPort
		slot6 = slot6(slot7)

		if slot6 then
			slot7 = slot5
			slot6 = slot5.canInterActionShipGroup
			slot8 = slot4.gruopId
			slot6 = slot6(slot7, slot8)

			if slot6 then
				slot7 = slot5
				slot6 = slot5.isLock
				slot6 = slot6(slot7)

				if not slot6 then
					slot7 = slot0
					slot6 = slot0.clearStage

					slot6(slot7)

					slot6 = slot0.viewComponent
					slot7 = slot6
					slot6 = slot6.emit
					slot8 = BackyardMainMediator
					slot8 = slot8.INTERACTION_TRANSPORT
					slot9 = slot0.boatVO
					slot9 = slot9.id
					slot10 = slot5.id

					slot6(slot7, slot8, slot9, slot10)
				end
			end
		end
	elseif slot2 then
		slot7 = slot5
		slot6 = slot5.canInterActionShipGroup
		slot8 = slot4.gruopId
		slot6 = slot6(slot7, slot8)

		if slot6 then
			slot7 = slot5
			slot6 = slot5.isInterActionSpine
			slot6 = slot6(slot7)

			if slot6 then
				slot7 = slot5
				slot6 = slot5.canInterActionSpine
				slot6 = slot6(slot7)

				if slot6 then
					slot7 = slot5
					slot6 = slot5.isTransPort
					slot6 = slot6(slot7)

					if not slot6 then
						slot7 = slot0
						slot6 = slot0.clearStage

						slot6(slot7)

						slot6 = slot0.viewComponent
						slot7 = slot6
						slot6 = slot6.emit
						slot8 = BackyardMainMediator
						slot8 = slot8.INTERACTION_SPINE
						slot9 = slot0.boatVO
						slot9 = slot9.id
						slot10 = slot5.id

						slot6(slot7, slot8, slot9, slot10)
					end
				end
			end
		end
	elseif slot2 then
		slot7 = slot5
		slot6 = slot5.canInterActionShipGroup
		slot8 = slot4.gruopId
		slot6 = slot6(slot7, slot8)

		if slot6 then
			slot7 = slot5
			slot6 = slot5.isInterActionSpine
			slot6 = slot6(slot7)

			if slot6 then
				slot7 = slot5
				slot6 = slot5.canInterActionSpineExtra
				slot6 = slot6(slot7)

				if slot6 then
					slot7 = slot5
					slot6 = slot5.isTransPort
					slot6 = slot6(slot7)

					if not slot6 then
						slot7 = slot0
						slot6 = slot0.clearStage

						slot6(slot7)

						slot6 = slot0.viewComponent
						slot7 = slot6
						slot6 = slot6.emit
						slot8 = BackyardMainMediator
						slot8 = slot8.ON_SPINE_EXTRA
						slot9 = slot4.id
						slot10 = slot2

						slot6(slot7, slot8, slot9, slot10)
					end
				end
			end
		end
	elseif slot2 then
		slot7 = slot5
		slot6 = slot5.canInterActionShipGroup
		slot8 = slot4.gruopId
		slot6 = slot6(slot7, slot8)

		if slot6 then
			slot7 = slot5
			slot6 = slot5.canInterAction
			slot6 = slot6(slot7)

			if slot6 then
				slot7 = slot0
				slot6 = slot0.clearStage

				slot6(slot7)

				slot7 = slot4
				slot6 = slot4.hasInterActionFurnitrue
				slot6 = slot6(slot7)

				if slot6 then
					slot7 = slot4
					slot6 = slot4.getInterActionFurnitrueId
					slot6 = slot6(slot7)

					if slot2 == slot6 then
						slot7 = slot5
						slot6 = slot5.getOrderByShipId
						slot8 = slot4.id
						slot6 = slot6(slot7, slot8)
						slot8 = slot0
						slot7 = slot0.updateInterActionPos
						slot9 = slot5
						slot10 = slot6

						slot7(slot8, slot9, slot10)

						slot8 = slot0
						slot7 = slot0.InterActionSortSibling
						slot9 = slot2

						slot7(slot8, slot9)
					end
				else
					slot6 = slot0.viewComponent
					slot7 = slot6
					slot6 = slot6.emit
					slot8 = BackyardMainMediator
					slot8 = slot8.INTERACTION
					slot9 = slot4.id
					slot10 = slot2

					slot6(slot7, slot8, slot9, slot10)
				end
			end
		end
	elseif slot2 then
		slot7 = slot5
		slot6 = slot5.canInterActionShipGroup
		slot8 = slot4.gruopId
		slot6 = slot6(slot7, slot8)

		if slot6 then
			slot7 = slot5
			slot6 = slot5.isStageFurniture
			slot6 = slot6(slot7)

			if slot6 then
				slot7 = slot0
				slot6 = slot0.clearStage

				slot6(slot7)

				slot6 = slot0.spineAnimUI
				slot7 = slot6
				slot6 = slot6.SetAction
				slot8 = "stand2"
				slot9 = 0

				slot6(slot7, slot8, slot9)

				slot6 = slot0.viewComponent
				slot7 = slot6
				slot6 = slot6.emit
				slot8 = BackyardMainMediator
				slot8 = slot8.INTERACTION_STAGE
				slot9 = slot0.boatVO
				slot9 = slot9.id
				slot10 = slot5.id

				slot6(slot7, slot8, slot9, slot10)

				slot6 = SetActive
				slot7 = slot0.shipGridContainer
				slot8 = false

				slot6(slot7, slot8)
			end
		end
	else
		slot7 = slot4
		slot6 = slot4.hasInterActionFurnitrue
		slot6 = slot6(slot7)

		if slot6 then
			slot7 = slot0
			slot6 = slot0.clearStage

			slot6(slot7)

			slot7 = slot4
			slot6 = slot4.getInterActionFurnitrueId
			slot6 = slot6(slot7)
			slot7 = slot3[slot6]
			slot8 = slot7
			slot7 = slot7.getOrderByShipId
			slot9 = slot4.id
			slot7 = slot7(slot8, slot9)
			slot9 = slot0
			slot8 = slot0.updateInterActionPos
			slot10 = slot3[slot6]
			slot11 = slot7

			slot8(slot9, slot10, slot11)

			slot9 = slot0
			slot8 = slot0.InterActionSortSibling
			slot10 = slot6

			slot8(slot9, slot10)
		else
			slot7 = slot4
			slot6 = slot4.inStageFurniture
			slot6 = slot6(slot7)

			if slot6 then
				slot7 = slot0
				slot6 = slot0.updateStageInterAction
				slot9 = slot4
				slot8 = slot4.getPosition

				slot6(slot7, slot8(slot9))

				slot6 = SetActive
				slot7 = slot0.shipGridContainer
				slot8 = false

				slot6(slot7, slot8)
			else
				slot6 = nil
				slot7 = pairs
				slot8 = slot3
				slot7, slot8, slot9 = slot7(slot8)

				for slot10, slot11 in slot7, slot8, slot9 do
					slot13 = slot11
					slot12 = slot11.getOccupyGrid
					slot15 = slot11
					slot14 = slot11.getPosition
					slot12 = slot12(slot13, slot14(slot15))
					slot13 = pairs
					slot14 = slot12
					slot13, slot14, slot15 = slot13(slot14)

					for slot16, slot17 in slot13, slot14, slot15 do
						slot18 = slot17.x
						slot19 = slot1.x

						if slot18 == slot19 then
							slot18 = slot17.y
							slot19 = slot1.y

							if slot18 == slot19 then
								slot6 = slot11

								break
							end
						end
					end

					if slot6 then
						break
					end
				end

				if slot6 then
					slot8 = slot6
					slot7 = slot6.canInterActionShipGroup
					slot9 = slot4.gruopId
					slot7 = slot7(slot8, slot9)

					if slot7 then
						slot8 = slot6
						slot7 = slot6.isInterActionSpine
						slot7 = slot7(slot8)

						if slot7 then
							slot8 = slot6
							slot7 = slot6.canInterActionSpine
							slot7 = slot7(slot8)

							if slot7 then
								slot8 = slot6
								slot7 = slot6.isMoveable
								slot7 = slot7(slot8)

								if slot7 then
									slot7 = nil
									slot0.save = slot7
								end

								slot7 = slot0.viewComponent
								slot8 = slot7
								slot7 = slot7.emit
								slot9 = BackyardMainMediator
								slot9 = slot9.INTERACTION_SPINE
								slot10 = slot0.boatVO
								slot10 = slot10.id
								slot11 = slot6.id

								slot7(slot8, slot9, slot10, slot11)
							end
						end
					end
				else
					slot7 = slot0
					slot7 = slot7.getLocalPos
					slot8 = slot1
					slot7 = slot7(slot8)
					slot8 = LeanTween
					slot8 = slot8.moveLocal
					slot9 = slot0.go
					slot10 = Vector3
					slot11 = slot7.x
					slot12 = slot7.y
					slot13 = slot1
					slot12 = slot12 + slot13
					slot13 = 0
					slot10 = slot10(slot11, slot12, slot13)
					slot11 = 0
					slot8 = slot8(slot9, slot10, slot11)
					slot9 = slot8
					slot8 = slot8.setOnComplete
					slot10 = System
					slot10 = slot10.Action

					function slot11()
						slot0 = slot0
						slot1 = nil
						slot0.isMove = slot1
						slot0 = SetActive
						slot1 = slot0
						slot1 = slot1.shipGridContainer
						slot2 = false

						slot0(slot1, slot2)

						slot0 = slot0
						slot1 = slot0
						slot0 = slot0.changeGridColor
						slot2 = BackYardConst
						slot2 = slot2.BACKYARD_GREEN

						slot0(slot1, slot2)

						slot0 = slot0
						slot0 = slot0.spineAnimUI
						slot1 = slot0
						slot0 = slot0.SetAction
						slot2 = "stand2"
						slot3 = 0

						slot0(slot1, slot2, slot3)

						slot0 = slot0
						slot0 = slot0.viewComponent
						slot1 = slot0
						slot0 = slot0.emit
						slot2 = BackyardMainMediator
						slot2 = slot2.END_DRAG_SHIP
						slot3 = slot1
						slot3 = slot3.id
						slot4 = slot2

						slot0(slot1, slot2, slot3, slot4)
					end

					slot8(slot9, slot10(slot11))
				end
			end
		end
	end
end

slot0.triggerInterAction = slot5

function slot5(slot0, slot1)
	slot2 = slot0.viewComponent
	slot3 = slot2
	slot2 = slot2.GetFurnitureGo
	slot4 = slot1
	slot2 = slot2(slot3, slot4)
	slot3 = slot0.viewComponent
	slot3 = slot3.furnitureVOs
	slot3 = slot3[slot1]
	slot5 = slot3
	slot4 = slot3.getInterActionShipIds
	slot4 = slot4(slot5)
	slot6 = slot3
	slot5 = slot3.getConfig
	slot7 = "interAction"
	slot5 = slot5(slot6, slot7)
	slot6 = {}
	slot7 = false
	slot8 = pairs
	slot9 = slot4
	slot8, slot9, slot10 = slot8(slot9)

	for slot11, slot12 in slot8, slot9, slot10 do
		slot13 = nil
		slot14 = slot5[slot11]
		slot14 = slot14[5]

		if slot14 then
			slot14 = slot5[slot11]
			slot14 = slot14[5]
			slot15 = BackyardBoatVO
			slot15 = slot15.INTERACTION_TYPE_AFTER

			if slot14 == slot15 then
				slot15 = slot2
				slot14 = slot2.Find
				slot16 = "icon/char_"
				slot17 = slot12
				slot16 = slot16 .. slot17
				slot14 = slot14(slot15, slot16)
				slot13 = slot14
				slot7 = true
			end
		else
			slot15 = slot2
			slot14 = slot2.Find
			slot16 = "char_"
			slot17 = slot12
			slot16 = slot16 .. slot17
			slot14 = slot14(slot15, slot16)
			slot13 = slot14
		end

		if slot13 then
			table.insert(slot6, {
				go = slot13,
				order = slot3:getOrderByShipId(slot12) or "",
				x = slot11
			})
		end
	end

	slot8 = table
	slot8 = slot8.sort
	slot9 = slot6

	function slot10(slot0, slot1)
		return slot0.x < slot1.x
	end

	slot8(slot9, slot10)

	slot8 = pairs
	slot9 = slot6
	slot8, slot9, slot10 = slot8(slot9)

	for slot11, slot12 in slot8, slot9, slot10 do
		slot13 = slot12.go
		slot14 = slot13
		slot13 = slot13.SetAsLastSibling

		slot13(slot14)

		slot14 = slot2
		slot13 = slot2.Find
		slot15 = BackYardConst
		slot15 = slot15.FURNITRUE_MASK_ORDER_NAME
		slot16 = slot12.order
		slot15 = slot15 .. slot16
		slot13 = slot13(slot14, slot15)

		if slot13 then
			if slot7 then
				slot15 = slot13
				slot14 = slot13.SetSiblingIndex
				slot16 = 2

				slot14(slot15, slot16)
			else
				slot15 = slot13
				slot14 = slot13.SetAsLastSibling

				slot14(slot15)
			end
		end
	end
end

slot0.InterActionSortSibling = slot5

function slot5(slot0, slot1)
	slot2 = slot0.shipGridImg
	slot2.color = slot1
end

slot0.changeGridColor = slot5

function slot5(slot0, slot1)
	slot2 = IsNil
	slot3 = slot0.tf
	slot2 = slot2(slot3)

	if not slot2 then
		slot2 = nil
		slot3 = slot0.archId

		if slot3 then
			slot3 = slot0.viewComponent
			slot4 = slot3
			slot3 = slot3.getMap
			slot5 = {}
			slot6 = slot0.archId
			slot5.parent = slot6
			slot3 = slot3(slot4, slot5)
			slot2 = slot3
		else
			slot3 = slot0.stageId

			if slot3 then
				slot3 = slot0.viewComponent
				slot4 = slot3
				slot3 = slot3.getMap
				slot5 = {}
				slot6 = slot0.stageId
				slot5.parent = slot6
				slot3 = slot3(slot4, slot5)
				slot2 = slot3
			else
				slot3 = slot0.viewComponent
				slot2 = slot3.map
			end
		end

		slot4 = slot2
		slot3 = slot2.CreateItem
		slot5 = 1
		slot6 = 1
		slot7 = {
			isBoat = true
		}
		slot8 = slot0.boatVO
		slot8 = slot8.id
		slot7.id = slot8
		slot3 = slot3(slot4, slot5, slot6, slot7)
		slot5 = slot3
		slot4 = slot3.SetPos
		slot6 = slot1.x
		slot6 = slot6 + 1
		slot7 = slot1.y
		slot7 = slot7 + 1

		slot4(slot5, slot6, slot7)

		slot5 = slot2
		slot4 = slot2.InsertChar
		slot6 = slot3
		slot4 = slot4(slot5, slot6)
		slot5 = slot0.tf
		slot6 = slot5
		slot5 = slot5.SetSiblingIndex
		slot7 = slot4

		slot5(slot6, slot7)

		slot0.item = slot3
	end
end

slot0.createItem = slot5

function slot5(slot0)
	slot1 = slot0.item

	if slot1 then
		slot1 = nil
		slot2 = slot0.archId

		if slot2 then
			slot2 = slot0.viewComponent
			slot3 = slot2
			slot2 = slot2.getMap
			slot4 = {}
			slot5 = slot0.archId
			slot4.parent = slot5
			slot2 = slot2(slot3, slot4)
			slot1 = slot2
		else
			slot2 = slot0.stageId

			if slot2 then
				slot2 = slot0.viewComponent
				slot3 = slot2
				slot2 = slot2.getMap
				slot4 = {}
				slot5 = slot0.stageId
				slot4.parent = slot5
				slot2 = slot2(slot3, slot4)
				slot1 = slot2
			else
				slot2 = slot0.viewComponent
				slot1 = slot2.map
			end
		end

		slot3 = slot1
		slot2 = slot1.RemoveChar
		slot4 = slot0.item

		slot2(slot3, slot4)

		slot2 = nil
		slot0.item = slot2
		slot2 = slot0.tf
		slot3 = slot2
		slot2 = slot2.SetAsLastSibling

		slot2(slot3)
	end
end

slot0.removeItem = slot5

function slot5(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.removeItem

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.createItem
	slot4 = slot0.boatVO
	slot5 = slot4
	slot4 = slot4.getPosition

	slot2(slot3, slot4(slot5))

	slot2 = nil
	slot3 = slot0.archId

	if slot3 then
		slot4 = slot0
		slot3 = slot0.calcOnFurnitureLPos
		slot5 = slot1
		slot6 = slot0.archId
		slot3 = slot3(slot4, slot5, slot6)
		slot2 = slot3
	else
		slot3 = slot0.stageId

		if slot3 then
			slot4 = slot0
			slot3 = slot0.calcOnFurnitureLPos
			slot5 = slot1
			slot6 = slot0.stageId
			slot3 = slot3(slot4, slot5, slot6)
			slot2 = slot3
		else
			slot3 = slot0
			slot3 = slot3.getLocalPos
			slot4 = slot1
			slot3 = slot3(slot4)
			slot2 = slot3
		end
	end

	slot3 = slot0.tf
	slot4 = Vector3
	slot5 = slot2.x
	slot6 = slot2.y
	slot7 = slot1
	slot6 = slot6 + slot7
	slot7 = 0
	slot4 = slot4(slot5, slot6, slot7)
	slot3.localPosition = slot4
	slot4 = slot0
	slot3 = slot0.updateShadowTF
	slot5 = true

	slot3(slot4, slot5)

	slot4 = slot0
	slot3 = slot0.updateShadowPos

	slot3(slot4)
end

slot0.updatePosition = slot5

function slot5(slot0, slot1)
	slot2 = slot0.spineAnimUI
	slot3 = slot2
	slot2 = slot2.SetAction
	slot4 = slot1
	slot5 = 0

	slot2(slot3, slot4, slot5)
end

slot0.setAction = slot5

function slot5(slot0, slot1, slot2)
	slot3 = slot0
	slot3 = slot3.print
	slot4 = "start interaction.................."

	slot3(slot4)

	slot4 = slot0
	slot3 = slot0.removeItem

	slot3(slot4)

	slot3 = slot0.viewComponent
	slot4 = slot3
	slot3 = slot3.GetFurnitureGo
	slot5 = slot1.id
	slot3 = slot3(slot4, slot5)
	slot5 = slot1
	slot4 = slot1.getInterActionData
	slot6 = slot2
	slot4, slot5, slot6, slot7, slot8, slot9 = slot4(slot5, slot6)

	if slot8 then
		slot10 = BackyardBoatVO
		slot10 = slot10.INTERACTION_TYPE_AFTER

		if slot8 == slot10 then
			SetParent(slot0.tf, slot3:Find("icon") or slot3)

			slot12 = slot6 or {
				1,
				1
			}[3]

			if slot12 then
				slot12 = slot3.localScale
				slot12 = slot12.x
				slot12 = slot12 * -1
				slot13 = slot0.tf
				slot14 = Vector3
				slot15 = slot1
				slot15 = slot12 * slot15
				slot16 = slot1
				slot17 = 1
				slot14 = slot14(slot15, slot16, slot17)
				slot13.localScale = slot14
			else
				slot13 = slot1
				slot12 = slot1.getConfig
				slot14 = "dir"
				slot12 = slot12(slot13, slot14)

				if slot12 == 1 then
					slot12 = slot3.localScale
					slot12 = slot12.x
					slot13 = 0

					if slot12 < slot13 then
						slot12 = slot0.tf
						slot13 = Vector3
						slot14 = slot1
						slot14 = 1 * slot14
						slot15 = slot1
						slot16 = slot11[2]
						slot15 = slot15 * slot16
						slot16 = 1
						slot13 = slot13(slot14, slot15, slot16)
						slot12.localScale = slot13
					end
				else
					slot12 = slot0.tf
					slot13 = Vector3
					slot14 = slot1
					slot15 = slot11[1]
					slot14 = slot14 * slot15
					slot15 = slot1
					slot16 = slot11[2]
					slot15 = slot15 * slot16
					slot16 = 1
					slot13 = slot13(slot14, slot15, slot16)
					slot12.localScale = slot13
				end
			end
		end
	end

	if slot9 then
		slot13 = slot0
		slot12 = slot0.showBodyMask
		slot14 = slot9

		slot12(slot13, slot14)
	end

	if slot7 then
		slot13 = slot3
		slot12 = slot3.Find
		slot14 = BackYardConst
		slot14 = slot14.FURNITRUE_MASK_ORDER_NAME
		slot15 = slot2
		slot14 = slot14 .. slot15
		slot12 = slot12(slot13, slot14)
		slot13 = setActive
		slot14 = slot12
		slot15 = true

		slot13(slot14, slot15)

		slot14 = slot12
		slot13 = slot12.SetAsLastSibling

		slot13(slot14)
	end

	slot12 = slot0.tf
	slot13 = Vector3
	slot14 = slot5[1]
	slot15 = slot5[2]
	slot16 = 0
	slot13 = slot13(slot14, slot15, slot16)
	slot12.anchoredPosition = slot13
	slot12 = slot0.spineAnimUI
	slot13 = slot12
	slot12 = slot12.SetAction
	slot14 = slot4
	slot15 = 0

	slot12(slot13, slot14, slot15)

	slot13 = slot0
	slot12 = slot0.updateShadowTF
	slot14 = false

	slot12(slot13, slot14)

	slot13 = slot0
	slot12 = slot0.updateShadowPos

	slot12(slot13)

	slot12 = nil
	slot0.isMove = slot12
	slot12 = SetActive
	slot13 = slot0.shipGridContainer
	slot14 = false

	slot12(slot13, slot14)
end

slot0.updateInterActionPos = slot5

function slot5(slot0)
	slot1 = slot0
	slot1 = slot1.print
	slot2 = "clear interaction............."

	slot1(slot2)

	slot1 = slot0.boatVO
	slot2 = slot1
	slot1 = slot1.getInterActionFurnitrueId
	slot1 = slot1(slot2)
	slot2 = slot0.viewComponent
	slot3 = slot2
	slot2 = slot2.GetFurnitureGo
	slot4 = slot1
	slot2 = slot2(slot3, slot4)
	slot3 = slot0.viewComponent
	slot3 = slot3.furnitureVOs
	slot3 = slot3[slot1]
	slot5 = slot3
	slot4 = slot3.getOrderByShipId
	slot6 = slot0.boatVO
	slot6 = slot6.id
	slot4 = slot4(slot5, slot6)
	slot6 = slot2
	slot5 = slot2.Find
	slot7 = BackYardConst
	slot7 = slot7.FURNITRUE_MASK_ORDER_NAME
	slot8 = slot4
	slot7 = slot7 .. slot8
	slot5 = slot5(slot6, slot7)

	if slot5 then
		slot6 = setActive
		slot7 = slot5
		slot8 = false

		slot6(slot7, slot8)
	end
end

slot0.clearInterAction = slot5

function slot5(slot0, slot1)
	slot2 = SetActive
	slot3 = slot0.shipGridContainer
	slot4 = false

	slot2(slot3, slot4)

	slot2 = slot0
	slot2 = slot2.print
	slot3 = " start spine interaciton..............."

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.removeItem

	slot2(slot3)

	slot0.spineFurniture = slot1
	slot2 = slot0.viewComponent
	slot3 = slot2
	slot2 = slot2.GetFurnitureGo
	slot4 = slot1.id
	slot2 = slot2(slot3, slot4)
	slot4 = slot0
	slot3 = slot0.updateModelDir

	slot3(slot4)

	slot4 = slot0
	slot3 = slot0.updateShadowTF
	slot5 = false

	slot3(slot4, slot5)

	slot3 = SetParent
	slot4 = slot0.tf
	slot5 = slot2
	slot6 = true

	slot3(slot4, slot5, slot6)

	slot3 = slot0.tf
	slot4 = Vector3
	slot5 = slot1
	slot6 = slot1
	slot7 = 1
	slot4 = slot4(slot5, slot6, slot7)
	slot3.localScale = slot4
	slot4 = slot1
	slot3 = slot1.getSpineAniPos
	slot3 = slot3(slot4)

	if slot3 then
		slot4 = slot0.tf
		slot4.anchoredPosition = slot3
	end

	slot5 = slot1
	slot4 = slot1.getSpineAnims
	slot4 = slot4(slot5)
	slot6 = slot2
	slot5 = slot2.Find
	slot7 = BackYardConst
	slot7 = slot7.FURNITRUE_MASK_NAME
	slot5 = slot5(slot6, slot7)
	slot7 = slot1
	slot6 = slot1.hasSpineMask
	slot6 = slot6(slot7)
	slot7 = {}
	slot0.roles = slot7
	slot8 = slot1
	slot7 = slot1.getBreakAnim
	slot7 = slot7(slot8)
	slot0.breakActionName = slot7
	slot7 = table
	slot7 = slot7.insert
	slot8 = slot0.roles
	slot9 = slot0.spineAnimUI

	slot7(slot8, slot9)

	slot7 = GetOrAddComponent
	slot9 = slot2
	slot8 = slot2.Find
	slot10 = "icon/spine"
	slot8 = slot8(slot9, slot10)
	slot9 = typeof
	slot10 = SpineAnimUI
	slot7 = slot7(slot8, slot9(slot10))
	slot8 = table
	slot8 = slot8.insert
	slot9 = slot0.roles
	slot10 = slot7

	slot8(slot9, slot10)

	if slot6 then
		slot8 = SetActive
		slot9 = slot5
		slot10 = true

		slot8(slot9, slot10)

		slot9 = slot5
		slot8 = slot5.SetAsLastSibling

		slot8(slot9)

		slot8 = GetOrAddComponent
		slot10 = slot5
		slot9 = slot5.Find
		slot11 = "spine"
		slot9 = slot9(slot10, slot11)
		slot10 = typeof
		slot11 = SpineAnimUI
		slot8 = slot8(slot9, slot10(slot11))
		slot9 = table
		slot9 = slot9.insert
		slot10 = slot0.roles
		slot11 = slot8

		slot9(slot10, slot11)
	end

	slot8 = pairs
	slot9 = slot0.roles
	slot8, slot9, slot10 = slot8(slot9)

	for slot11, slot12 in slot8, slot9, slot10 do
		slot14 = slot0
		slot13 = slot0.getSpineNormalAction
		slot15 = slot12
		slot13 = slot13(slot14, slot15)
		slot15 = slot12
		slot14 = slot12.SetAction
		slot16 = slot13
		slot17 = 0

		slot14(slot15, slot16, slot17)

		slot14 = setActive
		slot15 = slot12.gameObject
		slot16 = false

		slot14(slot15, slot16)

		slot14 = setActive
		slot15 = slot12.gameObject
		slot16 = true

		slot14(slot15, slot16)
	end

	slot9 = slot1
	slot8 = slot1.hasTailAction
	slot8 = slot8(slot9)

	if slot8 then
		slot8 = slot0.viewComponent
		slot9 = true
		slot8.blockEvent = slot9
	end

	function slot8()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.hasAnimator
		slot0 = slot0(slot1)

		if slot0 then
			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.startSpineAnimator
			slot2 = slot0

			slot0(slot1, slot2)
		end

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.isFollowFurnitrueAnim
		slot0 = slot0(slot1)

		if slot0 then
			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.playAnimsFollowFurniture
			slot2 = slot0

			slot0(slot1, slot2)
		else
			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.playAnims
			slot2 = slot0

			slot0(slot1, slot2)
		end
	end

	slot10 = slot1
	slot9 = slot1.getPreheatAnim
	slot9 = slot9(slot10)

	if slot9 then
		slot11 = slot0
		slot10 = slot0.playPreHeatAnim
		slot12 = slot1
		slot13 = slot9
		slot14 = slot8

		slot10(slot11, slot12, slot13, slot14)
	else
		slot10 = slot8

		slot10()
	end
end

slot0.updateSpineInterAction = slot5

function slot5(slot0, slot1, slot2, slot3)
	slot4 = slot0.roles
	slot4 = slot4[2]
	slot5 = setActive
	slot6 = slot0.tf
	slot7 = false

	slot5(slot6, slot7)

	slot6 = slot4
	slot5 = slot4.SetActionCallBack

	function slot7(slot0)
		if slot0 == "finish" then
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.SetActionCallBack
			slot3 = nil

			slot1(slot2, slot3)

			slot1 = slot1

			slot1()

			slot1 = setActive
			slot2 = slot2
			slot2 = slot2.tf
			slot3 = true

			slot1(slot2, slot3)
		end
	end

	slot5(slot6, slot7)

	slot6 = slot4
	slot5 = slot4.SetAction
	slot7 = slot2
	slot8 = 0

	slot5(slot6, slot7, slot8)
end

slot0.playPreHeatAnim = slot5

function slot5(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.getSpineAnims
	slot2 = slot2(slot3)
	slot3 = slot0.roles
	slot3 = slot3[2]
	slot4 = nil

	function slot5(slot0)
		slot1 = slot0
		slot1 = #slot1

		if slot0 > slot1 then
			slot1 = slot1
			slot2 = slot1
			slot1 = slot1.SetActionCallBack
			slot3 = nil

			slot1(slot2, slot3)

			slot1 = slot2
			slot2 = slot1
			slot1 = slot1.isLoopSpineInterAction
			slot1, slot2 = slot1(slot2)

			if slot1 then
				slot3 = BackyardFurnitureVO
				slot3 = slot3.INTERACTION_LOOP_TYPE_ALL

				if slot2 == slot3 then
					slot3 = slot3

					slot3()
				else
					slot3 = BackyardFurnitureVO
					slot3 = slot3.INTERACTION_LOOP_TYPE_LAST_ONE

					if slot2 == slot3 then
						slot3 = slot2
						slot4 = slot3
						slot3 = slot3.hasAnimator
						slot3 = slot3(slot4)

						if slot3 then
							slot3 = slot4
							slot4 = slot3
							slot3 = slot3.endSpineAnimator
							slot5 = slot2

							slot3(slot4, slot5)

							slot3 = slot4
							slot4 = slot3
							slot3 = slot3.setSpineAnimtorParent
							slot5 = slot2

							slot3(slot4, slot5)
						end
					end
				end
			else
				slot3 = slot2
				slot4 = slot3
				slot3 = slot3.hasTailAction
				slot3 = slot3(slot4)

				if slot3 then
					slot3 = slot4
					slot3 = slot3.viewComponent
					slot4 = nil
					slot3.blockEvent = slot4
					slot3 = slot4
					slot4 = slot3
					slot3 = slot3.playTailActions
					slot5 = slot2

					slot3(slot4, slot5)
				else
					slot3 = slot4
					slot4 = slot3
					slot3 = slot3.clearSpine

					slot3(slot4)

					slot3 = slot4
					slot4 = slot3
					slot3 = slot3.updateShadowTF
					slot5 = true

					slot3(slot4, slot5)

					slot3 = slot4
					slot4 = slot3
					slot3 = slot3.updateShadowPos

					slot3(slot4)

					slot3 = slot4
					slot3 = slot3.viewComponent
					slot4 = slot3
					slot3 = slot3.emit
					slot5 = BackyardMainMediator
					slot5 = slot5.RESET_BOAT_POS
					slot6 = slot4
					slot6 = slot6.boatVO
					slot6 = slot6.id

					slot3(slot4, slot5, slot6)
				end
			end
		else
			slot1 = slot0
			slot1 = slot1[slot0]
			slot1 = slot1[1]
			slot2 = type
			slot3 = slot1
			slot2 = slot2(slot3)

			if slot2 == "table" then
				slot2 = math
				slot2 = slot2.random
				slot3 = 1
				slot4 = #slot1
				slot2 = slot2(slot3, slot4)
				slot1 = slot1[slot2]
			end

			slot2 = slot1
			slot3 = slot2
			slot2 = slot2.SetAction
			slot4 = slot1
			slot5 = 0

			slot2(slot3, slot4, slot5)

			slot2 = slot4
			slot2 = slot2.roles
			slot2 = slot2[1]

			if slot2 then
				slot2 = slot4
				slot2 = slot2.roles
				slot2 = slot2[1]
				slot3 = slot2
				slot2 = slot2.SetAction
				slot4 = slot1
				slot5 = 0

				slot2(slot3, slot4, slot5)
			end

			slot2 = slot4
			slot2 = slot2.roles
			slot2 = slot2[3]

			if slot2 then
				slot2 = slot4
				slot2 = slot2.roles
				slot2 = slot2[3]
				slot3 = slot2
				slot2 = slot2.SetAction
				slot4 = slot1
				slot5 = 0

				slot2(slot3, slot4, slot5)
			end

			slot2 = slot4
			slot2 = slot2.bodyMask

			if slot2 then
				slot2 = slot4
				slot2 = slot2.bodyMask
				slot3 = slot2
				slot2 = slot2.GetComponent
				slot4 = typeof
				slot5 = Image
				slot2 = slot2(slot3, slot4(slot5))
				slot3 = slot0
				slot3 = slot3[slot0]
				slot3 = slot3[2]
				slot3 = not slot3
				slot2.enabled = slot3
			end

			slot2 = slot4
			slot3 = slot2
			slot2 = slot2.callActionCB
			slot4 = "update"
			slot5 = slot1

			slot2(slot3, slot4, slot5)
		end
	end

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.hasAnimator
		slot0 = slot0(slot1)

		if slot0 then
			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.endSpineAnimator
			slot2 = slot0

			slot0(slot1, slot2)

			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.startSpineAnimator
			slot2 = slot0

			slot0(slot1, slot2)
		end

		slot0 = slot1
		slot1 = slot0
		slot0 = slot0.callActionCB
		slot2 = "end"

		slot0(slot1, slot2)

		slot0 = 1
		slot1 = slot2
		slot2 = slot1
		slot1 = slot1.SetActionCallBack

		function slot3(slot0)
			if slot0 == "finish" then
				slot1 = slot0
				slot1 = slot1 + 1
				slot0 = slot1
				slot1 = slot1
				slot2 = slot0

				slot1(slot2)
			end
		end

		slot1(slot2, slot3)

		slot1 = slot3
		slot2 = 1

		slot1(slot2)
	end

	slot6 = slot4

	slot6()
end

slot0.playAnimsFollowFurniture = slot5

function slot5(slot0, slot1)
	slot2 = pairs
	slot3 = slot0.roles or {}
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot0
		slot7 = slot0.getSpineNormalAction
		slot9 = slot6
		slot7 = slot7(slot8, slot9)
		slot9 = slot6
		slot8 = slot6.SetActionCallBack
		slot10 = nil

		slot8(slot9, slot10)

		slot9 = slot6
		slot8 = slot6.SetAction
		slot10 = slot7
		slot11 = 0

		slot8(slot9, slot10, slot11)
	end

	slot3 = slot0
	slot2 = slot0.endSpineAnimator
	slot4 = slot0.spineFurniture
	slot5 = slot1

	slot2(slot3, slot4, slot5)
end

slot0.pauseAnim = slot5

function slot5(slot0, slot1, slot2, slot3)
	slot4 = slot0.actionCallback
	slot5 = {}
	slot4[slot1] = slot5
	slot4 = slot0.actionCallback
	slot4 = slot4[slot1]
	slot4.updateCb = slot2
	slot4 = slot0.actionCallback
	slot4 = slot4[slot1]
	slot4.endCb = slot3
end

slot0.registerActionCB = slot5

function slot5(slot0)
	slot1 = {}
	slot0.actionCallback = slot1
end

slot0.removeAllActionCB = slot5

function slot5(slot0, slot1)
	slot2 = slot0.actionCallback
	slot3 = nil
	slot2[slot1] = slot3
end

slot0.removeActionCB = slot5

function slot5(slot0, slot1, slot2)
	slot3 = pairs
	slot4 = slot0.actionCallback
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		if slot1 == "update" then
			slot8 = slot7.updateCb
			slot9 = slot2

			slot8(slot9)
		elseif slot1 == "end" then
			slot8 = slot7.endCb
			slot9 = slot2

			slot8(slot9)
		end
	end
end

slot0.callActionCB = slot5

function slot5(slot0)
	slot1 = slot0.spineFurniture
	slot3 = slot1
	slot2 = slot1.isFollowFurnitrueAnim
	slot2 = slot2(slot3)

	if slot2 then
		slot3 = slot0
		slot2 = slot0.playAnimsFollowFurniture
		slot4 = slot1

		slot2(slot3, slot4)
	else
		slot3 = slot0
		slot2 = slot0.playAnims
		slot4 = slot1

		slot2(slot3, slot4)
	end
end

slot0.resumeAnim = slot5

function slot5(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.getSpineAnims
	slot2 = slot2(slot3)
	slot3 = 0
	slot4, slot5, slot6, slot7 = nil

	function slot7(slot0)
		slot2 = slot0
		slot1 = slot0.SetActionCallBack
		slot3 = nil

		slot1(slot2, slot3)

		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.isLoopSpineInterAction
		slot1, slot2 = slot1(slot2)

		if not slot1 then
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.hasEndAnimName
			slot3 = slot3(slot4)

			if slot3 then
				slot3 = slot0
				slot4 = slot3
				slot3 = slot3.getEndAnimName
				slot3 = slot3(slot4)
				slot5 = slot0
				slot4 = slot0.SetAction
				slot6 = slot3
				slot7 = 0

				slot4(slot5, slot6, slot7)

				return
			else
				slot3 = slot1
				slot4 = slot3
				slot3 = slot3.getSpineNormalAction
				slot5 = slot0
				slot3 = slot3(slot4, slot5)
				slot5 = slot0
				slot4 = slot0.SetAction
				slot6 = slot3
				slot7 = 0

				slot4(slot5, slot6, slot7)
			end
		end

		slot3 = slot2
		slot4 = slot1
		slot4 = slot4.roles
		slot4 = #slot4

		if slot3 == slot4 then
			if slot1 then
				slot3 = slot1
				slot4 = slot3
				slot3 = slot3.callActionCB
				slot5 = "end"

				slot3(slot4, slot5)

				slot3 = BackyardFurnitureVO
				slot3 = slot3.INTERACTION_LOOP_TYPE_ALL

				if slot2 == slot3 then
					slot3 = slot3

					slot3()
				else
					slot3 = BackyardFurnitureVO
					slot3 = slot3.INTERACTION_LOOP_TYPE_LAST_ONE

					if slot2 == slot3 then
						slot3 = slot0
						slot4 = slot3
						slot3 = slot3.hasAnimator
						slot3 = slot3(slot4)

						if slot3 then
							slot3 = slot1
							slot4 = slot3
							slot3 = slot3.endSpineAnimator
							slot5 = slot0

							slot3(slot4, slot5)

							slot3 = slot1
							slot4 = slot3
							slot3 = slot3.setSpineAnimtorParent
							slot5 = slot0

							slot3(slot4, slot5)
						end
					end
				end
			else
				slot3 = slot0
				slot4 = slot3
				slot3 = slot3.hasTailAction
				slot3 = slot3(slot4)

				if slot3 then
					slot3 = slot1
					slot3 = slot3.viewComponent
					slot4 = nil
					slot3.blockEvent = slot4
					slot3 = slot1
					slot4 = slot3
					slot3 = slot3.playTailActions
					slot5 = slot0

					slot3(slot4, slot5)
				else
					slot3 = slot1
					slot4 = slot3
					slot3 = slot3.clearSpine

					slot3(slot4)

					slot3 = slot1
					slot4 = slot3
					slot3 = slot3.updateShadowTF
					slot5 = true

					slot3(slot4, slot5)

					slot3 = slot1
					slot4 = slot3
					slot3 = slot3.updateShadowPos

					slot3(slot4)

					slot3 = slot1
					slot3 = slot3.viewComponent
					slot4 = slot3
					slot3 = slot3.emit
					slot5 = BackyardMainMediator
					slot5 = slot5.RESET_BOAT_POS
					slot6 = slot1
					slot6 = slot6.boatVO
					slot6 = slot6.id

					slot3(slot4, slot5, slot6)
				end
			end
		end
	end

	function slot6(slot0, slot1)
		slot2 = slot0
		slot2 = #slot2

		if slot1 > slot2 then
			slot2 = slot1
			slot2 = slot2 + 1
			slot1 = slot2
			slot2 = slot2
			slot3 = slot0

			slot2(slot3)
		else
			slot2 = slot3
			slot3 = slot0
			slot4 = slot1

			function slot5()
				slot0 = slot0
				slot0 = slot0 + 1
				slot0 = slot0
				slot0 = slot1
				slot1 = slot2
				slot2 = slot0

				slot0(slot1, slot2)
			end

			slot2(slot3, slot4, slot5)
		end
	end

	function slot5(slot0, slot1, slot2)
		slot3 = slot0
		slot3 = slot3[slot1]
		slot3 = slot3[1]
		slot4 = type
		slot5 = slot3
		slot4 = slot4(slot5)

		if slot4 == "table" then
			slot4 = math
			slot4 = slot4.random
			slot5 = 1
			slot6 = #slot3
			slot4 = slot4(slot5, slot6)
			slot3 = slot3[slot4]
		end

		slot4 = slot1
		slot5 = slot4
		slot4 = slot4.callActionCB
		slot6 = "update"
		slot7 = slot3

		slot4(slot5, slot6, slot7)

		slot4 = slot1
		slot4 = slot4.roles
		slot4 = slot4[1]

		if slot0 == slot4 then
			slot4 = slot0
			slot4 = slot4[slot1]
			slot4 = slot4[3]

			if slot4 then
				slot4 = slot0
				slot4 = slot4[slot1]
				slot3 = slot4[3]
			end
		end

		slot4 = slot2
		slot5 = slot4
		slot4 = slot4.getUniqueShipAction
		slot6 = slot3
		slot7 = slot1
		slot7 = slot7.boatVO
		slot7 = slot7.skinId
		slot4 = slot4(slot5, slot6, slot7)

		if slot4 then
			slot3 = slot4
		end

		slot6 = slot0
		slot5 = slot0.SetAction
		slot7 = slot3
		slot8 = 0

		slot5(slot6, slot7, slot8)

		slot5 = _
		slot5 = slot5.detect
		slot6 = slot3

		function slot7(slot0)

			-- Decompilation error in this vicinity:
			slot1 = slot0[1]
			slot2 = slot0

			return slot1.id == slot0[3]
		end

		slot5 = slot5(slot6, slot7)

		if slot5 then
			slot6 = slot5[2]
			slot7 = slot1
			slot7 = slot7.timer
			slot7 = slot7[slot0]

			if slot7 then
				slot7 = slot1
				slot7 = slot7.timer
				slot7 = slot7[slot0]
				slot8 = slot7
				slot7 = slot7.Stop

				slot7(slot8)

				slot7 = slot1
				slot7 = slot7.timer
				slot8 = nil
				slot7[slot0] = slot8
			end

			slot7 = slot1
			slot7 = slot7.timer
			slot8 = Timer
			slot8 = slot8.New

			function slot9()
				slot0 = slot0
				slot0 = slot0.timer
				slot1 = slot1
				slot0 = slot0[slot1]
				slot1 = slot0
				slot0 = slot0.Stop

				slot0(slot1)

				slot0 = slot0
				slot0 = slot0.timer
				slot1 = slot1
				slot2 = nil
				slot0[slot1] = slot2
				slot0 = slot2

				slot0()
			end

			slot10 = slot6
			slot11 = 1
			slot8 = slot8(slot9, slot10, slot11)
			slot7[slot0] = slot8
			slot7 = slot1
			slot7 = slot7.timer
			slot7 = slot7[slot0]
			slot8 = slot7
			slot7 = slot7.Start

			slot7(slot8)
		else
			slot7 = slot0
			slot6 = slot0.SetActionCallBack

			function slot8(slot0)
				if slot0 == "finish" then
					slot1 = slot0
					slot2 = slot1
					slot1 = slot1.SetActionCallBack
					slot3 = nil

					slot1(slot2, slot3)

					slot1 = slot1

					slot1()
				end
			end

			slot6(slot7, slot8)
		end
	end

	slot8 = {}
	slot0.timer = slot8

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.hasAnimator
		slot0 = slot0(slot1)

		if slot0 then
			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.endSpineAnimator
			slot2 = slot0

			slot0(slot1, slot2)

			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.startSpineAnimator
			slot2 = slot0

			slot0(slot1, slot2)
		end

		slot2 = 0
		slot0 = pairs
		slot1 = slot1
		slot1 = slot1.roles
		slot0, slot1, slot2 = slot0(slot1)

		for slot3, slot4 in slot0, slot1, slot2 do
			slot5 = 1
			slot6 = slot3
			slot7 = slot4
			slot8 = slot5

			function slot9()
				slot0 = slot0
				slot0 = slot0 + 1
				slot0 = slot0
				slot0 = slot1
				slot1 = slot2
				slot2 = slot0

				slot0(slot1, slot2)
			end

			slot6(slot7, slot8, slot9)
		end
	end

	slot8 = slot4

	slot8()
end

slot0.playAnims = slot5

function slot5(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.getTailAction
	slot2 = slot2(slot3)
	slot3 = pairs
	slot4 = slot0.roles
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot9 = slot7
		slot8 = slot7.SetAction
		slot10 = slot2
		slot11 = 0

		slot8(slot9, slot10, slot11)
	end
end

slot0.playTailActions = slot5

function slot5(slot0, slot1, slot2)
	slot3 = slot0.viewComponent:GetFurnitureGo(slot1.id)
	slot4 = slot1:getAnimtorControlName(slot2 or 0)
	slot5 = slot0.animtorNameIndex

	if not slot5 then
		slot5 = math
		slot5 = slot5.random
		slot6 = 1
		slot7 = #slot4
		slot5 = slot5(slot6, slot7)
	end

	slot0.animtorNameIndex = slot5
	slot6 = slot1
	slot5 = slot1.getAnimtorControlGoName
	slot7 = slot2
	slot8 = slot0.animtorNameIndex
	slot5 = slot5(slot6, slot7, slot8)
	slot7 = slot3
	slot6 = slot3.Find
	slot8 = slot5
	slot6 = slot6(slot7, slot8)
	slot8 = slot6
	slot7 = slot6.GetComponent
	slot9 = typeof
	slot10 = Animator
	slot7 = slot7(slot8, slot9(slot10))
	slot8 = SetParent
	slot9 = slot0.tf
	slot10 = slot6

	slot8(slot9, slot10)

	slot9 = slot1
	slot8 = slot1.hasAnimatorMask
	slot8 = slot8(slot9)

	if slot8 then
		slot9 = slot1
		slot8 = slot1.getAnimatorMaskConfig
		slot8 = slot8(slot9)
		slot10 = slot3
		slot9 = slot3.Find
		slot11 = "mask"
		slot9 = slot9(slot10, slot11)
		slot10 = Vector2
		slot11 = slot8[1]
		slot11 = slot11[1]
		slot12 = slot8[1]
		slot12 = slot12[2]
		slot10 = slot10(slot11, slot12)
		slot9.sizeDelta = slot10
		slot10 = Vector3
		slot11 = slot8[2]
		slot11 = slot11[1]
		slot12 = slot8[2]
		slot12 = slot12[2]
		slot13 = 0
		slot10 = slot10(slot11, slot12, slot13)
		slot9.anchoredPosition = slot10
		slot10 = setActive
		slot11 = slot9
		slot12 = true

		slot10(slot11, slot12)

		slot10 = SetParent
		slot11 = slot6
		slot12 = slot9

		slot10(slot11, slot12)
	end

	slot9 = slot6
	slot8 = slot6.GetComponent
	slot10 = typeof
	slot11 = DftAniEvent
	slot8 = slot8(slot9, slot10(slot11))

	if slot8 then
		slot9 = 1
		slot11 = slot8
		slot10 = slot8.SetTriggerEvent

		function slot12(slot0)
			slot1 = slot0
			slot1 = slot1.localScale
			slot1 = slot1.x
			slot2 = 0

			if slot1 < slot2 then
				slot1 = -1
				slot1 = slot2
				slot2 = slot1
				slot1 = slot1.changeInnerDir
				slot3 = 1

				slot1(slot2, slot3)
			end
		end

		slot10(slot11, slot12)

		slot11 = slot8
		slot10 = slot8.SetEndEvent

		function slot12(slot0)
			slot1 = slot0

			if slot1 == -1 then
				slot1 = slot1
				slot2 = slot1
				slot1 = slot1.changeInnerDir
				slot3 = -1

				slot1(slot2, slot3)

				slot0 = 1
			end
		end

		slot10(slot11, slot12)
	end

	slot9 = true
	slot0.inAnimator = slot9
	slot9 = setActive
	slot10 = slot6
	slot11 = true

	slot9(slot10, slot11)
end

slot0.startSpineAnimator = slot5

function slot5(slot0, slot1, slot2, slot3)
	slot4 = slot0.animtorNameIndex

	if not slot4 then
		return
	end

	slot2 = slot2 or 0

	if slot1 then
		slot5 = slot1
		slot4 = slot1.hasAnimator
		slot4 = slot4(slot5)

		if slot4 then
			slot4 = slot0.viewComponent
			slot5 = slot4
			slot4 = slot4.GetFurnitureGo
			slot6 = slot1.id
			slot4 = slot4(slot5, slot6)

			if slot4 then
				slot5 = nil
				slot7 = slot1
				slot6 = slot1.getAnimtorControlGoName
				slot8 = slot2
				slot9 = slot0.animtorNameIndex
				slot6 = slot6(slot7, slot8, slot9)
				slot8 = slot1
				slot7 = slot1.hasAnimatorMask
				slot7 = slot7(slot8)

				if slot7 then
					slot8 = slot4
					slot7 = slot4.Find
					slot9 = "mask/"
					slot10 = slot6
					slot9 = slot9 .. slot10
					slot7 = slot7(slot8, slot9)
					slot5 = slot7
					slot8 = slot4
					slot7 = slot4.Find
					slot9 = "mask"
					slot7 = slot7(slot8, slot9)

					if not slot3 then
						slot8 = setActive
						slot9 = slot7
						slot10 = false

						slot8(slot9, slot10)
					end

					slot8 = SetParent
					slot9 = slot5
					slot10 = slot4

					slot8(slot9, slot10)
				else
					slot8 = slot4
					slot7 = slot4.Find
					slot9 = slot6
					slot7 = slot7(slot8, slot9)
					slot5 = slot7
				end

				slot8 = slot5
				slot7 = slot5.GetComponent
				slot9 = typeof
				slot10 = DftAniEvent
				slot7 = slot7(slot8, slot9(slot10))

				if slot7 then
					slot9 = slot7
					slot8 = slot7.SetTriggerEvent
					slot10 = nil

					slot8(slot9, slot10)

					slot9 = slot7
					slot8 = slot7.SetTriggerEvent
					slot10 = nil

					slot8(slot9, slot10)
				end

				slot8 = setActive
				slot9 = slot5
				slot10 = false

				slot8(slot9, slot10)
			end
		end
	end

	slot4 = nil
	slot0.animtorNameIndex = slot4
	slot4 = nil
	slot0.inAnimator = slot4
end

slot0.endSpineAnimator = slot5

function slot5(slot0, slot1)
	if slot1 then
		slot3 = slot1
		slot2 = slot1.hasAnimator
		slot2 = slot2(slot3)

		if slot2 then
			slot2 = slot0.viewComponent
			slot3 = slot2
			slot2 = slot2.GetFurnitureGo
			slot4 = slot1.id
			slot2 = slot2(slot3, slot4)

			if slot2 then
				slot3 = SetParent
				slot4 = slot0.tf
				slot5 = slot2
				slot6 = true

				slot3(slot4, slot5, slot6)
			end
		end
	end
end

slot0.setSpineAnimtorParent = slot5

function slot5(slot0, slot1)
	slot2 = slot0.roles

	if slot2 then
		slot2 = slot0.roles
		slot2 = #slot2
		slot3 = 0

		if slot2 > slot3 then
			slot2 = 0

			function slot3(slot0)
				slot1 = slot0
				slot1 = slot1 + 1
				slot0 = slot1
				slot1 = slot1
				slot2 = slot1
				slot1 = slot1.getSpineNormalAction
				slot3 = slot0
				slot1 = slot1(slot2, slot3)
				slot3 = slot0
				slot2 = slot0.SetAction
				slot4 = slot1
				slot5 = 0

				slot2(slot3, slot4, slot5)

				slot3 = slot0
				slot2 = slot0.SetActionCallBack
				slot4 = nil

				slot2(slot3, slot4)

				slot2 = slot0
				slot3 = slot1
				slot3 = slot3.roles
				slot3 = #slot3

				if slot2 == slot3 then
					slot2 = slot1
					slot3 = slot2
					slot2 = slot2.clearSpine

					slot2(slot3)

					slot2 = slot2

					if slot2 then
						slot2 = slot2

						slot2()
					end
				end
			end

			slot4 = pairs
			slot5 = slot0.roles
			slot4, slot5, slot6 = slot4(slot5)

			for slot7, slot8 in slot4, slot5, slot6 do
				slot10 = slot8
				slot9 = slot8.SetActionCallBack
				slot11 = nil

				slot9(slot10, slot11)

				slot9 = slot0.breakActionName

				if slot9 then
					slot10 = slot8
					slot9 = slot8.SetAction
					slot11 = slot0.breakActionName
					slot12 = 0

					slot9(slot10, slot11, slot12)

					slot10 = slot8
					slot9 = slot8.SetActionCallBack

					function slot11(slot0)
						if slot0 == "finish" then
							slot1 = slot0
							slot2 = slot1

							slot1(slot2)
						end
					end

					slot9(slot10, slot11)
				else
					slot9 = slot3
					slot10 = slot8

					slot9(slot10)
				end
			end

			return
		end
	end

	if slot1 then
		slot2 = slot1

		slot2()
	end
end

slot0.breakSpineAnim = slot5

function slot5(slot0, slot1)
	slot2 = slot0.spineAnimUI

	if slot1 == slot2 then
		slot2 = "stand2"

		return slot2
	else
		slot2 = slot0.spineFurniture

		if slot2 then
			slot2, slot3 = slot0.spineFurniture:getSpineName()

			return (slot3 and slot3) or "normal"
		end
	end

	slot2 = "stand2"

	return slot2
end

slot0.getSpineNormalAction = slot5

function slot5(slot0)
	slot1 = slot0.viewComponent
	slot2 = slot1
	slot1 = slot1.emit
	slot3 = BackyardMainMediator
	slot3 = slot3.CLEAR_SPINE
	slot4 = slot0.boatVO
	slot4 = slot4.id

	slot1(slot2, slot3, slot4)
end

slot0.clearSpine = slot5

function slot5(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.print
	slot3 = "clear spine interaction............."

	slot2(slot3)

	slot2 = pairs
	slot3 = slot0.roles
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot0
		slot7 = slot0.getSpineNormalAction
		slot9 = slot6
		slot7 = slot7(slot8, slot9)
		slot9 = slot6
		slot8 = slot6.SetActionCallBack
		slot10 = nil

		slot8(slot9, slot10)

		slot9 = slot6
		slot8 = slot6.SetAction
		slot10 = slot7
		slot11 = 0

		slot8(slot9, slot10, slot11)

		if slot5 == 3 then
			slot8 = setActive
			slot9 = tf
			slot10 = go
			slot11 = slot6
			slot9 = slot9(slot10(slot11))
			slot9 = slot9.parent
			slot10 = false

			slot8(slot9, slot10)
		end

		slot8 = slot0.timer

		if slot8 then
			slot8 = slot0.timer
			slot8 = slot8[slot6]

			if slot8 then
				slot8 = slot0.timer
				slot8 = slot8[slot6]
				slot9 = slot8
				slot8 = slot8.Stop

				slot8(slot9)

				slot8 = slot0.timer
				slot9 = nil
				slot8[slot6] = slot9
			end
		end
	end

	slot2 = {}
	slot0.roles = slot2
	slot2 = slot0.model
	slot3 = Vector3
	slot4 = 1
	slot5 = 1
	slot6 = 1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.localScale = slot3
	slot3 = slot0
	slot2 = slot0.endSpineAnimator
	slot4 = slot0.spineFurniture

	slot2(slot3, slot4)

	slot2 = SetParent
	slot3 = slot0.tf
	slot4 = slot0.viewComponent
	slot4 = slot4.floorContain
	slot5 = true

	slot2(slot3, slot4, slot5)

	slot2 = slot0.spineFurniture

	if slot2 then
		slot2 = slot0.spineFurniture
		slot3 = slot2
		slot2 = slot2.getSpineAniPos
		slot2 = slot2(slot3)

		if slot2 then
			slot2 = slot0.spineFurniture
			slot3 = slot2
			slot2 = slot2.getSpineAinTriggerPos
			slot2 = slot2(slot3)
			slot3 = slot0.tf
			slot4 = slot0
			slot4 = slot4.getLocalPos
			slot5 = slot2
			slot4 = slot4(slot5)
			slot3.localPosition = slot4
		end
	end

	slot3 = slot0
	slot2 = slot0.closeBodyMask

	slot2(slot3)

	slot2 = nil
	slot0.spineFurniture = slot2
	slot2 = nil
	slot0.breakActionName = slot2
	slot2 = slot0.tf
	slot3 = Vector3
	slot4 = slot1
	slot5 = slot1
	slot6 = 1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.localScale = slot3
	slot2 = slot0.tf
	slot3 = Vector3
	slot4 = 0
	slot5 = 0
	slot6 = 0
	slot3 = slot3(slot4, slot5, slot6)
	slot2.eulerAngles = slot3
	slot0.save = slot1
end

slot0.clearSpineInteraction = slot5

function slot5(slot0, slot1)
	slot2 = slot0.boatVO
	slot3 = slot2
	slot2 = slot2.getStageId
	slot2 = slot2(slot3)

	if slot1 and slot2 then
		slot3 = false
		slot0.isMove = slot3
		slot3 = slot2
		slot4 = slot0.viewComponent
		slot5 = slot4
		slot4 = slot4.GetFurnitureGo
		slot6 = slot3
		slot4 = slot4(slot5, slot6)
		slot6 = slot4
		slot5 = slot4.Find
		slot7 = "childs"
		slot5 = slot5(slot6, slot7)
		slot7 = slot0
		slot6 = slot0.removeItem

		slot6(slot7)

		slot0.stageId = slot2
		slot6 = SetParent
		slot7 = slot0.tf
		slot8 = slot5

		slot6(slot7, slot8)

		slot7 = slot0
		slot6 = slot0.createItem
		slot8 = slot0.boatVO
		slot9 = slot8
		slot8 = slot8.getPosition

		slot6(slot7, slot8(slot9))

		slot7 = slot0
		slot6 = slot0.calcOnFurnitureLPos
		slot8 = slot1
		slot9 = slot0.stageId
		slot6 = slot6(slot7, slot8, slot9)
		slot7 = slot0.tf
		slot7.localPosition = slot6
		slot7 = slot0.spineAnimUI
		slot8 = slot7
		slot7 = slot7.SetAction
		slot9 = "stand2"
		slot10 = 0

		slot7(slot8, slot9, slot10)

		slot7 = slot0.viewComponent
		slot7 = slot7.maps
		slot7 = slot7[slot3]

		if slot7 then
			slot7 = slot0.viewComponent
			slot7 = slot7.maps
			slot7 = slot7[slot3]
			slot7 = slot7.afterSortFunc
			slot8 = slot0.viewComponent
			slot8 = slot8.maps
			slot8 = slot8[slot3]
			slot8 = slot8.sortedItems

			slot7(slot8)
		end

		slot7 = slot0.viewComponent
		slot8 = slot7
		slot7 = slot7.emit
		slot9 = BackyardMainMediator
		slot9 = slot9.ADD_MOVE_FURNITURE
		slot10 = slot0.boatVO
		slot10 = slot10.id
		slot11 = slot3

		slot7(slot8, slot9, slot10, slot11)

		slot8 = slot0
		slot7 = slot0.updateShadowTF
		slot9 = false

		slot7(slot8, slot9)
	end
end

slot0.updateStageInterAction = slot5

function slot5(slot0)
	slot1 = nil
	slot0.stageId = slot1
	slot1 = SetParent
	slot2 = slot0.tf
	slot3 = slot0.floorGrid

	slot1(slot2, slot3)
end

slot0.clearStageInterAction = slot5

function slot5(slot0)
	slot1 = slot0.stageId

	if slot1 then
		slot1 = slot0.viewComponent
		slot2 = slot1
		slot1 = slot1.emit
		slot3 = BackyardMainMediator
		slot3 = slot3.CLEAR_STAGE_INTERACTION
		slot4 = slot0.boatVO
		slot4 = slot4.id

		slot1(slot2, slot3, slot4)
	end
end

slot0.clearStage = slot5

function slot5(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.removeItem

	slot2(slot3)

	slot2 = slot0.nextPosition

	if slot2 then
		slot3 = slot0
		slot2 = slot0.calcOnFurnitureLPos
		slot4 = slot0.nextPosition
		slot5 = slot1
		slot2 = slot2(slot3, slot4, slot5)
		slot0.targetLPosition = slot2
	end

	slot0.archId = slot1
	slot2 = slot0.viewComponent
	slot3 = slot2
	slot2 = slot2.GetFurnitureGo
	slot4 = slot1
	slot2 = slot2(slot3, slot4)
	slot3 = SetParent
	slot4 = slot0.tf
	slot6 = slot2
	slot5 = slot2.Find
	slot7 = "childs"
	slot5 = slot5(slot6, slot7)
	slot6 = true

	slot3(slot4, slot5, slot6)

	slot4 = slot2
	slot3 = slot2.Find
	slot5 = BackYardConst
	slot5 = slot5.ARCH_MASK_NAME
	slot3 = slot3(slot4, slot5)

	if slot3 then
		slot5 = slot3
		slot4 = slot3.SetAsLastSibling

		slot4(slot5)

		slot4 = setActive
		slot5 = slot3
		slot6 = true

		slot4(slot5, slot6)
	end

	slot5 = slot0
	slot4 = slot0.createItem
	slot6 = slot0.boatVO
	slot7 = slot6
	slot6 = slot6.getPosition

	slot4(slot5, slot6(slot7))
end

slot0.updateArchInterAction = slot5

function slot5(slot0)
	slot2 = slot0
	slot1 = slot0.removeItem

	slot1(slot2)

	slot1 = slot0.nextPosition

	if slot1 then
		slot1 = slot0.stageId

		if slot1 then
			slot2 = slot0
			slot1 = slot0.calcOnFurnitureLPos
			slot3 = slot0.nextPosition
			slot4 = slot0.stageId
			slot1 = slot1(slot2, slot3, slot4)
			slot0.targetLPosition = slot1
		else
			slot1 = slot0
			slot1 = slot1.getLocalPos
			slot2 = slot0.nextPosition
			slot1 = slot1(slot2)
			slot0.targetLPosition = slot1
		end
	end

	slot1 = slot0.stageId

	if slot1 then
		slot1 = slot0.viewComponent
		slot2 = slot1
		slot1 = slot1.GetFurnitureGo
		slot3 = slot0.stageId
		slot1 = slot1(slot2, slot3)
		slot2 = SetParent
		slot3 = slot0.tf
		slot5 = slot1
		slot4 = slot1.Find
		slot6 = "childs"
		slot4 = slot4(slot5, slot6)
		slot5 = true

		slot2(slot3, slot4, slot5)
	else
		slot1 = SetParent
		slot2 = slot0.tf
		slot3 = slot0.floorGrid
		slot4 = true

		slot1(slot2, slot3, slot4)
	end

	slot1 = slot0.viewComponent
	slot2 = slot1
	slot1 = slot1.GetFurnitureGo
	slot3 = slot0.archId
	slot1 = slot1(slot2, slot3)
	slot3 = slot1
	slot2 = slot1.Find
	slot4 = BackYardConst
	slot4 = slot4.ARCH_MASK_NAME
	slot2 = slot2(slot3, slot4)

	if slot2 then
		slot3 = setActive
		slot4 = slot2
		slot5 = false

		slot3(slot4, slot5)
	end

	slot3 = nil
	slot0.archId = slot3
	slot4 = slot0
	slot3 = slot0.createItem
	slot5 = slot0.boatVO
	slot6 = slot5
	slot5 = slot5.getPosition

	slot3(slot4, slot5(slot6))
end

slot0.clearArchInterAction = slot5

function slot5(slot0, slot1, slot2)
	slot3 = slot0.viewComponent
	slot4 = slot3
	slot3 = slot3.GetFurnitureGo
	slot5 = slot2
	slot3 = slot3(slot4, slot5)
	slot5 = slot3
	slot4 = slot3.Find
	slot6 = "childs"
	slot4 = slot4(slot5, slot6)
	slot5 = slot0
	slot5 = slot5.getLocalPos
	slot6 = slot1
	slot5 = slot5(slot6)
	slot6 = slot0
	slot6 = slot6.turnTransformLocalPos
	slot7 = slot5
	slot8 = slot0.floorGrid
	slot9 = slot4

	return slot6(slot7, slot8, slot9)
end

slot0.calcOnFurnitureLPos = slot5

function slot5(slot0, slot1, slot2, slot3)
	slot4 = slot0.stageId
	slot5 = nil
	slot6 = slot0.archId

	if slot6 then
		slot7 = slot0
		slot6 = slot0.calcOnFurnitureLPos
		slot8 = slot1
		slot9 = slot0.archId
		slot6 = slot6(slot7, slot8, slot9)
		slot5 = slot6
	else
		slot7 = slot0
		slot6 = slot0.calcOnFurnitureLPos
		slot8 = slot1
		slot9 = slot0.stageId
		slot6 = slot6(slot7, slot8, slot9)
		slot5 = slot6
	end

	slot7 = slot0
	slot6 = slot0.startMove
	slot8 = slot5
	slot9 = slot1
	slot10 = slot2
	slot11 = slot3

	slot6(slot7, slot8, slot9, slot10, slot11)
end

slot0.moveOnFurniture = slot5

function slot5(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot5 = slot0.archId

	if slot5 then
		slot6 = slot0
		slot5 = slot0.calcOnFurnitureLPos
		slot7 = slot1
		slot8 = slot0.archId
		slot5 = slot5(slot6, slot7, slot8)
		slot4 = slot5
	else
		slot5 = slot0
		slot5 = slot5.getLocalPos
		slot6 = slot1
		slot5 = slot5(slot6)
		slot4 = slot5
	end

	slot6 = slot0
	slot5 = slot0.startMove
	slot7 = slot4
	slot8 = slot1
	slot9 = slot2
	slot10 = slot3

	slot5(slot6, slot7, slot8, slot9, slot10)
end

slot0.move = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)
	slot5 = math
	slot5 = slot5.floor
	slot6 = slot0.speed
	slot6 = 1 / slot6
	slot5 = slot5(slot6)
	slot0.nextPosition = slot2
	slot0.targetLPosition = slot1
	slot6 = slot0.isMove

	if not slot6 then
		slot6 = slot0.spineAnimUI
		slot7 = slot6
		slot6 = slot6.SetAction
		slot8 = "walk"
		slot9 = 0

		slot6(slot7, slot8, slot9)

		slot6 = true
		slot0.isMove = slot6
	end

	slot6 = slot0.boatVO
	slot7 = slot6
	slot6 = slot6.getPosition
	slot6 = slot6(slot7)
	slot7 = slot0
	slot7 = slot7.getSign
	slot8 = slot2.x
	slot9 = slot6.x

	if slot8 < slot9 then
		slot8 = slot2.y
		slot9 = slot6.y

		if slot8 ~= slot9 then
			slot8 = slot2.x
			slot9 = slot6.x

			if slot8 == slot9 then
				slot7 = slot7(slot6.y < slot2.y)
				slot8 = 1
				slot9 = slot0.stageId

				if slot9 then
					slot9 = slot0.viewComponent
					slot10 = slot9
					slot9 = slot9.GetFurnitureGo
					slot11 = slot0.stageId
					slot9 = slot9(slot10, slot11)
					slot10 = slot9.localScale
					slot8 = slot10.x
				end
			end
		end
	end

	slot9 = slot0.tf
	slot10 = Vector3
	slot11 = slot1
	slot11 = slot11 * slot7
	slot11 = slot11 * slot8
	slot12 = slot1
	slot13 = 1
	slot10 = slot10(slot11, slot12, slot13)
	slot9.localScale = slot10
	slot10 = slot0
	slot9 = slot0.changeInnerDir
	slot11 = slot7

	slot9(slot10, slot11)

	function slot9(slot0)
		slot1 = slot0
		slot1 = slot1.shadowTF
		slot2 = Vector2
		slot3 = slot1
		slot4 = 1
		slot2 = slot2(slot3, slot4)
		slot1.localScale = slot2
		slot1 = LeanTween
		slot1 = slot1.moveLocal
		slot2 = slot0
		slot2 = slot2.go
		slot3 = Vector3
		slot4 = slot0.x
		slot5 = slot0.y
		slot6 = slot2
		slot5 = slot5 + slot6
		slot6 = 0
		slot3 = slot3(slot4, slot5, slot6)
		slot4 = slot3
		slot1 = slot1(slot2, slot3, slot4)
		slot2 = slot1
		slot1 = slot1.setOnUpdate
		slot3 = System
		slot3 = slot3.Action_float

		function slot4(slot0)
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.updateShadowPos

			slot1(slot2)
		end

		slot1 = slot1(slot2, slot3(slot4))
		slot2 = slot1
		slot1 = slot1.setOnComplete
		slot3 = System
		slot3 = slot3.Action

		function slot4()
			slot0 = slot0

			if slot0 then
				slot0 = slot1
				slot0 = slot0.spineAnimUI
				slot1 = slot0
				slot0 = slot0.SetAction
				slot2 = "stand2"
				slot3 = 0

				slot0(slot1, slot2, slot3)

				slot0 = slot1
				slot1 = nil
				slot0.isMove = slot1
			end

			slot0 = slot2

			if slot0 then
				slot0 = slot2

				slot0()
			end
		end

		slot1(slot2, slot3(slot4))
	end

	slot10 = Timer
	slot10 = slot10.New

	function slot11()
		slot0 = slot0
		slot0 = slot0.moveNextTimer

		if slot0 then
			slot0 = slot0
			slot0 = slot0.moveNextTimer
			slot1 = slot0
			slot0 = slot0.Stop

			slot0(slot1)

			slot0 = slot0
			slot1 = nil
			slot0.moveNextTimer = slot1
		end

		slot0 = slot0
		slot0 = slot0.viewComponent
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = BackyardMainMediator
		slot2 = slot2.ON_HALF_MOVE
		slot3 = slot0
		slot3 = slot3.boatVO
		slot3 = slot3.id
		slot4 = slot1

		slot0(slot1, slot2, slot3, slot4)

		slot0 = slot0
		slot0 = slot0.targetLPosition
		slot1 = slot2

		if slot0 ~= slot1 then
			slot0 = LeanTween
			slot0 = slot0.cancel
			slot1 = slot0
			slot1 = slot1.go

			slot0(slot1)

			slot0 = slot3
			slot1 = slot0
			slot1 = slot1.targetLPosition

			slot0(slot1)
		end

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.removeItem

		slot0(slot1)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.createItem
		slot2 = slot1

		slot0(slot1, slot2)
	end

	slot12 = slot5 / 2
	slot13 = 1
	slot10 = slot10(slot11, slot12, slot13)
	slot0.moveNextTimer = slot10
	slot10 = slot0.moveNextTimer
	slot11 = slot10
	slot10 = slot10.Start

	slot10(slot11)

	slot10 = slot0.shadowTF
	slot11 = Vector2
	slot12 = slot7
	slot13 = 1
	slot11 = slot11(slot12, slot13)
	slot10.localScale = slot11
	slot10 = slot9
	slot11 = slot1

	slot10(slot11)
end

slot0.startMove = slot5

function slot5(slot0)
	slot1 = slot0.moveNextTimer

	if slot1 then
		slot1 = slot0.moveNextTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.moveNextTimer = slot1
	end

	slot1 = LeanTween
	slot1 = slot1.isTweening
	slot2 = slot0.go
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = LeanTween
		slot1 = slot1.cancel
		slot2 = slot0.go

		slot1(slot2)
	end

	slot1 = slot0.isMove

	if slot1 then
		slot1 = slot0.spineAnimUI
		slot2 = slot1
		slot1 = slot1.SetAction
		slot3 = "stand2"
		slot4 = 0

		slot1(slot2, slot3, slot4)

		slot1 = nil
		slot0.isMove = slot1
	end

	slot2 = slot0
	slot1 = slot0.updateShadowPos

	slot1(slot2)
end

slot0.cancelMove = slot5

function slot5(slot0, slot1, slot2)
	if slot1 == 0 then
		return
	end

	slot3 = IsNil
	slot4 = slot0.expTF
	slot3 = slot3(slot4)

	if slot3 then
		return
	end

	slot3 = nil
	slot4 = BackYardConst
	slot4 = slot4.ADDITION_TYPE_MONEY

	if slot2 == slot4 then
		slot3 = slot0.moneyAdditionTF
	else
		slot4 = BackYardConst
		slot4 = slot4.ADDITION_TYPE_INTIMACY

		if slot2 == slot4 then
			slot3 = slot0.inimacyAdditionTF
			slot1 = ""
			slot5 = slot0
			slot4 = slot0.playIntimacyEffect

			slot4(slot5)
		else
			slot4 = BackYardConst
			slot4 = slot4.ADDITION_TYPE_EXP

			if slot2 == slot4 then
				slot3 = slot0.expAdditionTF
				slot1 = ""
			end
		end
	end

	function slot4()
		slot0 = slot0
		slot0 = slot0.tf
		slot1 = slot0.localScale
		slot1 = slot1.x
		slot2 = go
		slot3 = slot0
		slot2 = slot2(slot3)
		slot2 = slot2.name

		while slot2 ~= "floor" do
			slot0 = slot0.parent
			slot2 = slot0.localScale
			slot2 = slot2.x
			slot1 = slot1 * slot2
		end

		return slot1
	end

	slot5 = slot4
	slot5 = slot5()
	slot6 = slot0.expTF
	slot7 = Vector3
	slot8 = Mathf
	slot8 = slot8.Sign
	slot9 = slot5
	slot8 = slot8(slot9)
	slot8 = slot8 * 2
	slot9 = 2
	slot10 = 2
	slot7 = slot7(slot8, slot9, slot10)
	slot6.localScale = slot7
	slot6 = 0
	slot7 = slot0.expTF
	slot7 = slot7.childCount
	slot7 = slot7 - 1
	slot8 = 1

	for slot9 = slot6, slot7, slot8 do
		slot10 = SetActive
		slot11 = slot0.expTF
		slot12 = slot11
		slot11 = slot11.GetChild
		slot13 = slot9
		slot11 = slot11(slot12, slot13)
		slot12 = false

		slot10(slot11, slot12)
	end

	slot6 = setActive
	slot7 = slot3
	slot8 = true

	slot6(slot7, slot8)

	slot6 = setText
	slot7 = findTF
	slot8 = slot3
	slot9 = "Text"
	slot7 = slot7(slot8, slot9)
	slot8 = slot1

	slot6(slot7, slot8)

	slot6 = slot0.expTF
	slot6 = slot6.localPosition
	slot7 = LeanTween
	slot7 = slot7.cancel
	slot8 = slot0.expTF
	slot8 = slot8.gameObject

	slot7(slot8)

	slot7 = LeanTween
	slot7 = slot7.moveY
	slot8 = rtf
	slot9 = slot0.expTF
	slot8 = slot8(slot9)
	slot9 = slot6.y
	slot9 = slot9 + 110
	slot10 = 1.2
	slot7 = slot7(slot8, slot9, slot10)
	slot8 = slot7
	slot7 = slot7.setOnUpdate
	slot9 = System
	slot9 = slot9.Action_float

	function slot10()
		slot0 = IsNil
		slot1 = slot0
		slot1 = slot1.go
		slot0 = slot0(slot1)

		if not slot0 then
			slot0 = slot1
			slot0 = slot0()
			slot1 = slot2

			if slot1 ~= slot0 then
				slot1 = slot0
				slot1 = slot1.expTF
				slot2 = Vector3
				slot3 = Mathf
				slot3 = slot3.Sign
				slot4 = slot0
				slot3 = slot3(slot4)
				slot3 = slot3 * 2
				slot4 = 2
				slot5 = 2
				slot2 = slot2(slot3, slot4, slot5)
				slot1.localScale = slot2
			end
		end
	end

	slot7 = slot7(slot8, slot9(slot10))
	slot8 = slot7
	slot7 = slot7.setOnComplete
	slot9 = System
	slot9 = slot9.Action

	function slot10()
		slot0 = setActive
		slot1 = slot0
		slot2 = false

		slot0(slot1, slot2)

		slot0 = slot1
		slot0 = slot0.expTF
		slot1 = slot2
		slot0.localPosition = slot1
	end

	slot7(slot8, slot9(slot10))
end

slot0.acquireEffect = slot5

function slot5(slot0)
	slot1 = slot0.hasEffect

	if slot1 then
		return
	end

	slot1 = true
	slot0.hasEffect = slot1
	slot1 = ResourceMgr
	slot1 = slot1.Inst
	slot2 = slot1
	slot1 = slot1.getAssetAsync
	slot3 = "Effect/Heart"
	slot4 = ""
	slot5 = UnityEngine
	slot5 = slot5.Events
	slot5 = slot5.UnityAction_UnityEngine_Object

	function slot6(slot0)
		slot1 = Instantiate
		slot2 = slot0
		slot1 = slot1(slot2)
		slot2 = pg
		slot2 = slot2.ViewUtils
		slot2 = slot2.SetLayer
		slot3 = tf
		slot4 = slot1
		slot3 = slot3(slot4)
		slot4 = Layer
		slot4 = slot4.UI

		slot2(slot3, slot4)

		slot2 = tf
		slot3 = slot1
		slot2 = slot2(slot3)
		slot3 = slot2
		slot2 = slot2.SetParent
		slot4 = slot0
		slot4 = slot4.tf
		slot5 = false

		slot2(slot3, slot4, slot5)

		slot2 = tf
		slot3 = slot1
		slot2 = slot2(slot3)
		slot3 = Vector3
		slot4 = 0
		slot5 = 200
		slot6 = -100
		slot3 = slot3(slot4, slot5, slot6)
		slot2.localPosition = slot3
		slot2 = tf
		slot3 = slot1
		slot2 = slot2(slot3)
		slot3 = Vector3
		slot4 = 100
		slot5 = 100
		slot6 = 100
		slot3 = slot3(slot4, slot5, slot6)
		slot2.localScale = slot3
		slot2 = slot0
		slot3 = Timer
		slot3 = slot3.New

		function slot4()
			slot0 = Destroy
			slot1 = slot0

			slot0(slot1)

			slot0 = nil
			slot0 = slot1
			slot0 = slot0.removeEffectTimer
			slot1 = slot0
			slot0 = slot0.Stop

			slot0(slot1)

			slot0 = slot1
			slot1 = nil
			slot0.removeEffectTimer = slot1
			slot0 = slot1
			slot1 = nil
			slot0.hasEffect = slot1
		end

		slot5 = 2
		slot6 = 1
		slot3 = slot3(slot4, slot5, slot6)
		slot2.removeEffectTimer = slot3
		slot2 = slot0
		slot2 = slot2.removeEffectTimer
		slot3 = slot2
		slot2 = slot2.Start

		slot2(slot3)
	end

	slot5 = slot5(slot6)
	slot6 = true
	slot7 = true

	slot1(slot2, slot3, slot4, slot5, slot6, slot7)
end

slot0.playIntimacyEffect = slot5

function slot5(slot0, slot1)
	slot2 = SetActive
	slot3 = slot0.inimacyTF
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = onButton
	slot3 = slot0
	slot4 = slot0.inimacyTF

	function slot5()
		slot0 = slot0
		slot0 = slot0.boatVO
		slot1 = slot0
		slot0 = slot0.hasInterActionFurnitrue
		slot0 = slot0(slot1)

		if not slot0 then
			slot0 = slot0
			slot0 = slot0.boatVO
			slot1 = slot0
			slot0 = slot0.hasSpineInterAction
			slot0 = slot0(slot1)

			if not slot0 then
				slot0 = slot0
				slot0 = slot0.boatVO
				slot1 = slot0
				slot0 = slot0.hasSpineExtra
				slot0 = slot0(slot1)

				if not slot0 then
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.switchAnimation
					slot2 = "motou"

					slot0(slot1, slot2)
				end
			end
		end

		slot0 = slot0
		slot0 = slot0.viewComponent
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = BackyardMainMediator
		slot2 = slot2.ADD_INTIMACY
		slot3 = slot0
		slot3 = slot3.boatVO
		slot3 = slot3.id

		slot0(slot1, slot2, slot3)
	end

	slot6 = SFX_PANEL

	slot2(slot3, slot4, slot5, slot6)
end

slot0.updateInimacy = slot5

function slot5(slot0, slot1)
	slot2 = SetActive
	slot3 = slot0.moneyTF
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = onButton
	slot3 = slot0
	slot4 = slot0.moneyTF

	function slot5()
		slot0 = slot0
		slot0 = slot0.boatVO
		slot1 = slot0
		slot0 = slot0.hasInterActionFurnitrue
		slot0 = slot0(slot1)

		if not slot0 then
			slot0 = slot0
			slot0 = slot0.boatVO
			slot1 = slot0
			slot0 = slot0.hasSpineInterAction
			slot0 = slot0(slot1)

			if not slot0 then
				slot0 = slot0
				slot0 = slot0.boatVO
				slot1 = slot0
				slot0 = slot0.hasSpineExtra
				slot0 = slot0(slot1)

				if not slot0 then
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.switchAnimation
					slot2 = "motou"

					slot0(slot1, slot2)
				end
			end
		end

		slot0 = slot0
		slot0 = slot0.viewComponent
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = BackyardMainMediator
		slot2 = slot2.ADD_MONEY
		slot3 = slot0
		slot3 = slot3.boatVO
		slot3 = slot3.id

		slot0(slot1, slot2, slot3)
	end

	slot6 = SFX_PANEL

	slot2(slot3, slot4, slot5, slot6)
end

slot0.updateMoney = slot5

function slot5(slot0, slot1)
	slot2 = slot0.isAnim

	if slot2 then
		return
	end

	slot2 = true
	slot0.isAnim = slot2
	slot2 = slot0.canvasGroup
	slot3 = false
	slot2.blocksRaycasts = slot3
	slot2 = slot0.viewComponent
	slot3 = slot2
	slot2 = slot2.emit
	slot4 = BackyardMainMediator
	slot4 = slot4.CANCEL_SHIP_MOVE
	slot5 = slot0.boatVO
	slot5 = slot5.id

	slot2(slot3, slot4, slot5)

	slot2 = slot0.spineAnimUI
	slot3 = slot2
	slot2 = slot2.SetAction
	slot4 = slot1
	slot5 = 0

	slot2(slot3, slot4, slot5)

	slot2 = nil
	slot0.isMove = slot2
	slot2 = slot0.spineAnimUI
	slot3 = slot2
	slot2 = slot2.SetActionCallBack

	function slot4(slot0)
		if slot0 == "finish" then
			slot1 = slot0
			slot1 = slot1.spineAnimUI
			slot2 = slot1
			slot1 = slot1.SetAction
			slot3 = "stand2"
			slot4 = 0

			slot1(slot2, slot3, slot4)

			slot1 = slot0
			slot1 = slot1.viewComponent
			slot2 = slot1
			slot1 = slot1.emit
			slot3 = BackyardMainMediator
			slot3 = slot3.ADD_BOAT_MOVE
			slot4 = slot0
			slot4 = slot4.boatVO
			slot4 = slot4.id

			slot1(slot2, slot3, slot4)

			slot1 = slot0
			slot2 = false
			slot1.isAnim = slot2
			slot1 = slot0
			slot1 = slot1.canvasGroup
			slot2 = true
			slot1.blocksRaycasts = slot2
			slot1 = slot0
			slot1 = slot1.spineAnimUI
			slot2 = slot1
			slot1 = slot1.SetActionCallBack
			slot3 = nil

			slot1(slot2, slot3)
		end
	end

	slot2(slot3, slot4)
end

slot0.switchAnimation = slot5

function slot5(slot0, slot1, slot2)
	slot3 = SetActive
	slot4 = slot0.shipGridContainer
	slot5 = false

	slot3(slot4, slot5)

	slot3 = slot0.viewComponent
	slot4 = slot3
	slot3 = slot3.GetFurnitureGo
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot4 = slot0.viewComponent
	slot4 = slot4.furnitureVOs
	slot4 = slot4[slot1]
	slot6 = slot0
	slot5 = slot0.removeItem

	slot5(slot6)

	slot6 = slot0
	slot5 = slot0.updateShadowTF
	slot7 = false

	slot5(slot6, slot7)

	slot6 = slot4
	slot5 = slot4.getSpineExtraConfig
	slot7 = slot2
	slot5 = slot5(slot6, slot7)
	slot6 = SetParent
	slot7 = slot0.tf
	slot8 = slot3
	slot9 = true

	slot6(slot7, slot8, slot9)

	slot6 = slot0.tf
	slot7 = Vector3
	slot8 = slot0
	slot9 = slot5[3]
	slot9 = slot9[1]
	slot8 = slot8 * slot9
	slot9 = slot0
	slot10 = slot5[3]
	slot10 = slot10[2]
	slot9 = slot9 * slot10
	slot10 = 1
	slot7 = slot7(slot8, slot9, slot10)
	slot6.localScale = slot7
	slot6 = slot0.tf
	slot7 = Vector3
	slot8 = slot5[2]
	slot8 = slot8[1]
	slot9 = slot5[2]
	slot9 = slot9[2]
	slot10 = 0
	slot7 = slot7(slot8, slot9, slot10)
	slot6.anchoredPosition = slot7
	slot7 = slot4
	slot6 = slot4.hasAnimator
	slot6 = slot6(slot7)

	if slot6 then
		slot7 = slot0
		slot6 = slot0.startSpineAnimator
		slot8 = slot4
		slot9 = slot2

		slot6(slot7, slot8, slot9)
	end

	slot7 = slot4
	slot6 = slot4.getSpineExtraBodyMask
	slot8 = slot2
	slot6 = slot6(slot7, slot8)

	if slot6 ~= nil then
		slot7 = #slot6
		slot8 = 0

		if slot7 > slot8 then
			slot8 = slot0
			slot7 = slot0.showBodyMask
			slot9 = slot6

			slot7(slot8, slot9)
		end
	end

	slot0.spineFurniture = slot4
end

slot0.addSpineExtra = slot5

function slot5(slot0, slot1, slot2)
	slot3 = SetParent
	slot4 = slot0.tf
	slot5 = slot0.viewComponent
	slot5 = slot5.floorContain
	slot6 = true

	slot3(slot4, slot5, slot6)

	slot3 = slot0.viewComponent
	slot4 = slot3
	slot3 = slot3.GetFurnitureGo
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot4 = slot0.viewComponent
	slot4 = slot4.furnitureVOs
	slot4 = slot4[slot1]
	slot6 = slot0
	slot5 = slot0.endSpineAnimator
	slot7 = slot4
	slot8 = slot2
	slot9 = true

	slot5(slot6, slot7, slot8, slot9)

	slot6 = slot4
	slot5 = slot4.getSpineExtraBodyMask
	slot7 = slot2
	slot5 = slot5(slot6, slot7)

	if slot5 ~= nil then
		slot6 = #slot5
		slot7 = 0

		if slot6 > slot7 then
			slot7 = slot0
			slot6 = slot0.closeBodyMask

			slot6(slot7)
		end
	end

	slot6 = slot0.tf
	slot7 = Vector3
	slot8 = 0
	slot9 = 0
	slot10 = 0
	slot7 = slot7(slot8, slot9, slot10)
	slot6.eulerAngles = slot7
	slot6 = nil
	slot0.spineFurniture = slot6
end

slot0.clearSpineExtra = slot5

function slot5(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.removeItem

	slot2(slot3)

	slot2 = true
	slot0.isInTransport = slot2
	slot2 = slot0.viewComponent
	slot3 = slot2
	slot2 = slot2.GetFurnitureGo
	slot4 = slot1
	slot2 = slot2(slot3, slot4)
	slot3 = SetParent
	slot4 = slot0.tf
	slot5 = slot2
	slot6 = true

	slot3(slot4, slot5, slot6)

	slot3 = slot0.viewComponent
	slot3 = slot3.furnitureVOs
	slot3 = slot3[slot1]
	slot4 = GetOrAddComponent
	slot6 = slot2
	slot5 = slot2.Find
	slot7 = "icon/spine"
	slot5 = slot5(slot6, slot7)
	slot6 = typeof
	slot7 = SpineAnimUI
	slot4 = slot4(slot5, slot6(slot7))

	function slot5(slot0, slot1)
		slot2 = 0

		if slot0 <= slot2 then
			slot2 = slot1

			slot2()

			return
		end

		slot2 = Timer
		slot2 = slot2.New
		slot3 = slot1
		slot4 = slot0
		slot5 = 1
		slot2 = slot2(slot3, slot4, slot5)
		slot4 = slot2
		slot3 = slot2.Start

		slot3(slot4)
	end

	slot6 = slot0.tf
	slot6 = slot6.localScale
	slot7 = setActive
	slot8 = slot0.shadowTF
	slot9 = false

	slot7(slot8, slot9)

	slot7 = setActive
	slot8 = slot0.shipGridContainer
	slot9 = false

	slot7(slot8, slot9)

	slot7 = seriesAsync
	slot8 = {}

	function slot9(slot0)
		slot1 = slot0
		slot1 = slot1.tf
		slot2 = Vector3
		slot3 = math
		slot3 = slot3.abs
		slot4 = slot1
		slot4 = slot4.x
		slot3 = slot3(slot4)
		slot3 = -1 * slot3
		slot4 = slot1
		slot4 = slot4.y
		slot5 = slot1
		slot5 = slot5.z
		slot2 = slot2(slot3, slot4, slot5)
		slot1.localScale = slot2
		slot1 = {}
		slot2 = slot2
		slot3 = slot2
		slot2 = slot2.getTransportAnims
		slot4 = 1
		slot2 = slot2(slot3, slot4)
		slot3 = ipairs
		slot4 = slot2
		slot3, slot4, slot5 = slot3(slot4)

		for slot6, slot7 in slot3, slot4, slot5 do
			slot8 = slot7[1]
			slot8 = slot8[1]
			slot9 = slot7[1]
			slot9 = slot9[2]
			slot10 = slot7[2]
			slot11 = table
			slot11 = slot11.insert
			slot12 = slot1

			function slot13(slot0)
				slot1 = parallelAsync
				slot2 = {}

				function slot3(slot0)
					slot1 = slot0
					slot1 = slot1.spineAnimUI
					slot2 = slot1
					slot1 = slot1.SetAction
					slot3 = slot1
					slot4 = 0

					slot1(slot2, slot3, slot4)

					slot1 = slot2
					slot2 = slot3
					slot3 = slot0

					slot1(slot2, slot3)
				end

				slot2[1] = slot3

				function slot3(slot0)
					slot1 = slot0
					slot2 = slot1
					slot1 = slot1.SetAction
					slot3 = slot1
					slot4 = 0

					slot1(slot2, slot3, slot4)

					slot1 = slot2
					slot2 = slot3
					slot3 = slot0

					slot1(slot2, slot3)
				end

				slot2[2] = slot3
				slot3 = slot0

				slot1(slot2, slot3)
			end

			slot11(slot12, slot13)
		end

		slot3 = seriesAsync
		slot4 = slot1
		slot5 = slot0

		slot3(slot4, slot5)
	end

	slot8[1] = slot9

	function slot9(slot0)
		slot1 = slot0
		slot1 = slot1.tf
		slot2 = Vector3
		slot3 = math
		slot3 = slot3.abs
		slot4 = slot1
		slot4 = slot4.x
		slot3 = slot3(slot4)
		slot4 = slot1
		slot4 = slot4.y
		slot5 = slot1
		slot5 = slot5.z
		slot2 = slot2(slot3, slot4, slot5)
		slot1.localScale = slot2
		slot1 = slot2
		slot2 = slot1
		slot1 = slot1.Find
		slot3 = "Animator01"
		slot1 = slot1(slot2, slot3)
		slot2 = SetParent
		slot3 = slot0
		slot3 = slot3.tf
		slot4 = slot1

		slot2(slot3, slot4)

		slot2 = slot0
		slot2 = slot2.tf
		slot3 = Vector3
		slot4 = 0
		slot5 = 0
		slot6 = 0
		slot3 = slot3(slot4, slot5, slot6)
		slot2.localPosition = slot3
		slot3 = slot1
		slot2 = slot1.GetComponent
		slot4 = typeof
		slot5 = DftAniEvent
		slot2 = slot2(slot3, slot4(slot5))
		slot4 = slot2
		slot3 = slot2.SetEndEvent

		function slot5(slot0)
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.getSpineName
			slot1, slot2 = slot1(slot2)
			slot3 = slot1
			slot4 = slot3
			slot3 = slot3.SetAction
			slot5 = slot2
			slot6 = 0

			slot3(slot4, slot5, slot6)

			slot3 = setActive
			slot4 = slot2
			slot5 = false

			slot3(slot4, slot5)

			slot3 = slot3

			slot3()
		end

		slot3(slot4, slot5)

		slot3 = setActive
		slot4 = slot1
		slot5 = true

		slot3(slot4, slot5)
	end

	slot8[2] = slot9

	function slot9()
		slot0 = slot0
		slot0 = slot0.viewComponent
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = BackyardMainMediator
		slot2 = slot2.INTERACTION_TRANSPORT_AGAIN
		slot3 = slot0
		slot3 = slot3.boatVO
		slot3 = slot3.id
		slot4 = slot1

		slot0(slot1, slot2, slot3, slot4)
	end

	slot7(slot8, slot9)
end

slot0.InterActionTransport = slot5

function slot5(slot0, slot1)
	slot2 = slot0.viewComponent
	slot3 = slot2
	slot2 = slot2.GetFurnitureGo
	slot4 = slot1
	slot2 = slot2(slot3, slot4)
	slot3 = slot0.viewComponent
	slot3 = slot3.furnitureVOs
	slot3 = slot3[slot1]
	slot4 = GetOrAddComponent
	slot6 = slot2
	slot5 = slot2.Find
	slot7 = "icon/spine"
	slot5 = slot5(slot6, slot7)
	slot6 = typeof
	slot7 = SpineAnimUI
	slot4 = slot4(slot5, slot6(slot7))

	function slot5(slot0, slot1)
		slot2 = 0

		if slot0 <= slot2 then
			slot2 = slot1

			slot2()

			return
		end

		slot2 = Timer
		slot2 = slot2.New
		slot3 = slot1
		slot4 = slot0
		slot5 = 1
		slot2 = slot2(slot3, slot4, slot5)
		slot4 = slot2
		slot3 = slot2.Start

		slot3(slot4)
	end

	slot6 = seriesAsync
	slot7 = {}

	function slot8(slot0)
		slot1 = {}
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.getTransportAnims
		slot4 = 2
		slot2 = slot2(slot3, slot4)
		slot3 = ipairs
		slot4 = slot2
		slot3, slot4, slot5 = slot3(slot4)

		for slot6, slot7 in slot3, slot4, slot5 do
			slot8 = slot7[1]
			slot8 = slot8[1]
			slot9 = slot7[1]
			slot9 = slot9[2]
			slot10 = slot7[2]
			slot11 = table
			slot11 = slot11.insert
			slot12 = slot1

			function slot13(slot0)
				slot1 = slot0
				slot2 = slot1
				slot1 = slot1.SetAction
				slot3 = slot1
				slot4 = 0

				slot1(slot2, slot3, slot4)

				slot1 = slot2
				slot2 = slot3
				slot3 = slot0

				slot1(slot2, slot3)
			end

			slot11(slot12, slot13)
		end

		slot3 = seriesAsync
		slot4 = slot1
		slot5 = slot0

		slot3(slot4, slot5)
	end

	slot7[1] = slot8

	function slot8(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.Find
		slot3 = "Animator11"
		slot1 = slot1(slot2, slot3)
		slot2 = SetParent
		slot3 = slot1
		slot3 = slot3.tf
		slot4 = slot1

		slot2(slot3, slot4)

		slot2 = slot1
		slot2 = slot2.tf
		slot3 = Vector3
		slot4 = 0
		slot5 = 0
		slot6 = 0
		slot3 = slot3(slot4, slot5, slot6)
		slot2.localPosition = slot3
		slot3 = slot1
		slot2 = slot1.GetComponent
		slot4 = typeof
		slot5 = DftAniEvent
		slot2 = slot2(slot3, slot4(slot5))
		slot4 = slot2
		slot3 = slot2.SetEndEvent

		function slot5(slot0)
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.getSpineName
			slot1, slot2 = slot1(slot2)
			slot3 = slot1
			slot4 = slot3
			slot3 = slot3.SetAction
			slot5 = slot2
			slot6 = 0

			slot3(slot4, slot5, slot6)

			slot3 = setActive
			slot4 = slot2
			slot5 = false

			slot3(slot4, slot5)

			slot3 = slot3

			slot3()
		end

		slot3(slot4, slot5)

		slot3 = setActive
		slot4 = slot1
		slot5 = true

		slot3(slot4, slot5)
	end

	slot7[2] = slot8

	function slot8()
		slot0 = slot0
		slot0 = slot0.viewComponent
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = BackyardMainMediator
		slot2 = slot2.INTERACTION_TRANSPORT_END
		slot3 = slot0
		slot3 = slot3.boatVO
		slot3 = slot3.id
		slot4 = slot1

		slot0(slot1, slot2, slot3, slot4)
	end

	slot6(slot7, slot8)
end

slot0.InterActionTransportAgain = slot5

function slot5(slot0)
	slot1 = nil
	slot0.isInTransport = slot1
	slot1 = slot0.spineAnimUI
	slot2 = slot1
	slot1 = slot1.SetAction
	slot3 = "stand2"
	slot4 = 0

	slot1(slot2, slot3, slot4)

	slot1 = SetParent
	slot2 = slot0.tf
	slot3 = slot0.floorGrid

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.shadowTF
	slot3 = true

	slot1(slot2, slot3)
end

slot0.InterActionTransportEnd = slot5

function slot5(slot0)
	slot1 = slot0.isInTransport

	return slot1
end

slot0.inTransport = slot5

function slot5(slot0, slot1)
	slot2 = slot1[1]
	slot3 = slot1[2]
	slot3 = slot3[1]
	slot4 = slot1[2]
	slot4 = slot4[2]
	slot5 = slot1[3]

	if slot5 then
		slot5 = slot0.bodyMask
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot6 = LoadSprite
		slot7 = "furniture/"
		slot8 = slot1[3]
		slot7 = slot7 .. slot8
		slot6 = slot6(slot7)
		slot5.sprite = slot6
	else
		slot5 = slot0.bodyMask
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot6 = nil
		slot5.sprite = slot6
	end

	slot5 = true
	slot0.isShowBodyMask = slot5
	slot5 = setActive
	slot6 = slot0.bodyMask
	slot7 = true

	slot5(slot6, slot7)

	slot5 = tf
	slot6 = slot0.bodyMask
	slot5 = slot5(slot6)
	slot6 = Vector3
	slot7 = slot2[1]
	slot8 = slot2[2]
	slot9 = 0
	slot6 = slot6(slot7, slot8, slot9)
	slot5.localPosition = slot6
	slot5 = rtf
	slot6 = slot0.bodyMask
	slot5 = slot5(slot6)
	slot6 = Vector2
	slot7 = slot3
	slot8 = slot4
	slot6 = slot6(slot7, slot8)
	slot5.sizeDelta = slot6
	slot5 = SetParent
	slot6 = slot0.model
	slot7 = slot0.bodyMask

	slot5(slot6, slot7)

	slot5 = slot0.bodyMask
	slot6 = slot5.parent
	slot7 = slot6.parent
	slot8 = slot6.localScale
	slot8 = slot8.x
	slot9 = slot7.localScale
	slot9 = slot9.x
	slot8 = slot8 * slot9
	slot9 = slot6.localScale
	slot9 = slot9.x
	slot9 = slot8 * slot9
	slot10 = slot7.localScale
	slot10 = slot10.x
	slot9 = slot9 * slot10
	slot10 = Mathf
	slot10 = slot10.Sign
	slot11 = slot9
	slot10 = slot10(slot11)
	slot9 = slot10
	slot10 = slot0.model
	slot11 = Vector3
	slot12 = slot9
	slot13 = 1
	slot14 = 1
	slot11 = slot11(slot12, slot13, slot14)
	slot10.localScale = slot11
	slot10 = tf
	slot11 = slot0.model
	slot10 = slot10(slot11)
	slot11 = Vector3
	slot12 = slot2[1]
	slot12 = -slot12
	slot13 = slot2[2]
	slot13 = -slot13
	slot14 = 0
	slot11 = slot11(slot12, slot13, slot14)
	slot10.localPosition = slot11
end

slot0.showBodyMask = slot5

function slot5(slot0, slot1)
	slot2 = slot0.bodyMask

	if slot2 then
		slot2 = slot0.isShowBodyMask

		if not slot2 then
			return
		end
	end

	slot2 = setActive
	slot3 = slot0.bodyMask
	slot4 = false

	slot2(slot3, slot4)

	slot2 = SetParent
	slot3 = slot0.model
	slot4 = slot0.tf

	slot2(slot3, slot4)

	slot2 = slot0.model
	slot3 = slot2
	slot2 = slot2.SetSiblingIndex
	slot4 = 1

	slot2(slot3, slot4)

	slot2 = tf
	slot3 = slot0.model
	slot2 = slot2(slot3)
	slot3 = Vector3
	slot4 = 0
	slot5 = 0
	slot6 = 0
	slot3 = slot3(slot4, slot5, slot6)
	slot2.localPosition = slot3
	slot2 = tf
	slot3 = slot0.bodyMask
	slot2 = slot2(slot3)
	slot3 = Vector3
	slot4 = 1
	slot5 = 1
	slot6 = 1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.localScale = slot3

	if slot1 then
		slot2 = Destroy
		slot3 = slot0.bodyMask

		slot2(slot3)
	end

	slot2 = slot0.bodyMask
	slot3 = slot2
	slot2 = slot2.GetComponent
	slot4 = typeof
	slot5 = Image
	slot2 = slot2(slot3, slot4(slot5))
	slot3 = slot2.enabled

	if slot3 == false then
		slot3 = true
		slot2.enabled = slot3
	end

	slot3 = nil
	slot0.isShowBodyMask = slot3
end

slot0.closeBodyMask = slot5

function slot5(slot0)
	slot1 = removeAllChildren
	slot2 = slot0.effectContainer

	slot1(slot2)

	slot1 = slot0.timer

	if slot1 then
		slot1 = pairs
		slot2 = slot0.timer
		slot1, slot2, slot3 = slot1(slot2)

		for slot4, slot5 in slot1, slot2, slot3 do
			slot7 = slot5
			slot6 = slot5.Stop

			slot6(slot7)
		end

		slot1 = nil
		slot0.timer = slot1
	end

	slot1 = slot0.dragTrigger

	if slot1 then
		slot1 = ClearEventTrigger
		slot2 = slot0.dragTrigger

		slot1(slot2)

		slot1 = nil
		slot0.dragTrigger = slot1
	end

	slot1 = pg
	slot1 = slot1.DelegateInfo
	slot1 = slot1.Dispose
	slot2 = slot0

	slot1(slot2)

	slot1 = slot0.moveNextTimer

	if slot1 then
		slot1 = slot0.moveNextTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.moveNextTimer = slot1
	end

	slot1 = slot0.removeEffectTimer

	if slot1 then
		slot1 = slot0.removeEffectTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.removeEffectTimer = slot1
	end

	slot1 = LeanTween
	slot1 = slot1.isTweening
	slot2 = slot0.go
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = LeanTween
		slot1 = slot1.cancel
		slot2 = slot0.go

		slot1(slot2)
	end

	slot1 = slot0.canvasGroup
	slot2 = true
	slot1.blocksRaycasts = slot2
	slot1 = slot0.spineAnimUI

	if slot1 then
		slot1 = slot0.spineAnimUI
		slot2 = slot1
		slot1 = slot1.SetActionCallBack
		slot3 = nil

		slot1(slot2, slot3)
	end

	slot1 = slot0.shadowTF

	if slot1 then
		slot1 = Destroy
		slot2 = slot0.shadowTF

		slot1(slot2)
	end

	slot2 = slot0
	slot1 = slot0.closeBodyMask
	slot3 = true

	slot1(slot2, slot3)

	slot1 = PoolMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.ReturnSpineChar
	slot3 = slot0.boatVO
	slot4 = slot3
	slot3 = slot3.getPrefab
	slot3 = slot3(slot4)
	slot4 = go
	slot5 = slot0.model

	slot1(slot2, slot3, slot4(slot5))

	slot1 = Destroy
	slot2 = slot0.go

	slot1(slot2)
end

slot0.dispose = slot5

function slot5(slot0, slot1)
	slot0.canvasGroup.alpha = (not slot1 and 1) or 0
	slot2 = slot0.canvasGroup
	slot3 = not slot1
	slot2.blocksRaycasts = slot3
	slot3 = slot0
	slot2 = slot0.updateShadowTF
	slot4 = not slot1

	slot2(slot3, slot4)
end

slot0.enableTouch = slot5

return slot0
