slot0 = class
slot1 = "LevelGrid"
slot2 = import
slot3 = "..base.BasePanel"
slot0 = slot0(slot1, slot2(slot3))
slot1 = require
slot2 = "Mgr/Pool/PoolPlural"
slot1 = slot1(slot2)
slot2 = require
slot3 = "Mgr/Pool/PoolUtil"
slot2 = slot2(slot3)
slot3 = Vector3
slot4 = 420
slot5 = -1000
slot6 = -1000
slot3 = slot3(slot4, slot5, slot6)
slot0.MapDefaultPos = slot3
slot3 = Vector2
slot4 = -60
slot5 = 84.8
slot3 = slot3(slot4, slot5)
slot4 = Vector2
slot5 = -50
slot6 = 20
slot4 = slot4(slot5, slot6)

function slot5(slot0)
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.init
	slot2 = slot0

	slot1(slot2)

	slot1 = GameObject
	slot1 = slot1.Find
	slot2 = "LevelCamera"
	slot1 = slot1(slot2)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Camera
	slot1 = slot1(slot2, slot3(slot4))
	slot0.levelCam = slot1
	slot1 = {}
	slot0.quadTws = slot1
	slot1 = {}
	slot0.attachTws = slot1
	slot1 = {}
	slot0.shiningTws = slot1
	slot1 = {}
	slot0.presentTws = slot1
	slot1 = {}
	slot0.markTws = slot1
	slot1 = {}
	slot0.championTws = slot1
	slot1 = {}
	slot0.markQuads = slot1
	slot1 = {}
	slot0.rivals = slot1
	slot1 = {}
	slot0.pools = slot1
	slot1 = GameObject
	slot1 = slot1.Find
	slot2 = "__Pool__"
	slot1 = slot1(slot2)
	slot0.poolParent = slot1
	slot1 = {}
	slot0.opBtns = slot1
	slot1 = {}
	slot0.attachmentCells = slot1
	slot1 = {}
	slot0.extraAttachmentCells = slot1
	slot1 = nil
	slot0.onCellClick = slot1
	slot1 = nil
	slot0.onShipStepChange = slot1
	slot1 = nil
	slot0.onShipArrived = slot1
	slot1 = -1
	slot0.lastSelectedId = slot1
	slot1 = -1
	slot0.quadState = slot1
	slot1 = nil
	slot0.quadClickProxy = slot1
	slot1 = {}
	slot0.endAniFlag = slot1
	slot1 = nil
	slot0.subTeleportTargetLine = slot1
	slot1 = false
	slot0.subTeleportMode = slot1
	slot1 = {}
	slot0.cellEdges = slot1
	slot1 = {}
	slot0.tweens = slot1
	slot1 = LoadAny
	slot2 = "ui/commonUI_atlas"
	slot3 = "add"
	slot4 = typeof
	slot5 = Material
	slot1 = slot1(slot2, slot3, slot4(slot5))
	slot0.material_Add = slot1
	slot1 = LoadSprite
	slot2 = "ui/commonui_atlas"
	slot3 = "white_dot"
	slot1 = slot1(slot2, slot3)
	slot0.sprite_whiteDot = slot1
end

slot0.init = slot5

function slot5(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15)
	slot0.shipTpl = slot1
	slot0.subTpl = slot2
	slot0.transportTpl = slot3
	slot0.transportTargetTpl = slot4
	slot0.enemyTpl = slot5
	slot0.deadTpl = slot6
	slot0.boxTpl = slot7
	slot0.supplyTpl = slot8
	slot0.rivalTpl = slot9
	slot0.championTpl = slot10
	slot0.spineTpl = slot11
	slot0.oniTpl = slot12
	slot0.oniTargetTpl = slot13
	slot0.bombEnemyTpl = slot14
	slot0.arrowTpl = slot15
end

slot0.setItems = slot5

function slot5(slot0, slot1, slot2)
	slot3 = IsNil
	slot4 = slot0[slot1]
	slot3 = slot3(slot4)

	if slot3 then
		slot0[slot1] = slot2
	end
end

slot0.ExtendItem = slot5

function slot5(slot0, slot1)
	slot2 = "fleet_"
	slot3 = slot1
	slot2 = slot2 .. slot3
	slot3 = slot0.pools
	slot3 = slot3[slot2]

	if not slot3 then
		slot4 = slot0.shipTpl
		slot5 = FleetType
		slot5 = slot5.Submarine

		if slot1 == slot5 then
			slot4 = slot0.subTpl
		else
			slot5 = FleetType
			slot5 = slot5.Transport

			if slot1 == slot5 then
				slot4 = slot0.transportTpl
			end
		end

		slot5 = slot0
		slot5 = slot5.New
		slot6 = slot4.gameObject
		slot7 = 2
		slot5 = slot5(slot6, slot7)
		slot3 = slot5
		slot5 = slot0.pools
		slot5[slot2] = slot3
	end

	return slot3
end

slot0.getFleetPool = slot5

function slot5(slot0, slot1)
	slot2 = "champion_"
	slot3 = slot1
	slot2 = slot2 .. slot3
	slot3 = slot0.pools
	slot3 = slot3[slot2]

	if not slot3 then
		slot4 = slot0.championTpl

		if slot1 == "oni" then
			slot4 = slot0.oniTpl
		elseif slot1 == "enemy" then
			slot4 = slot0.enemyTpl
		end

		slot5 = slot0
		slot5 = slot5.New
		slot6 = slot4.gameObject
		slot7 = 1
		slot5 = slot5(slot6, slot7)
		slot3 = slot5
		slot5 = slot0.pools
		slot5[slot2] = slot3
	end

	return slot3
end

slot0.getChampionPool = slot5

function slot5(slot0)
	slot1 = "CellEdges"
	slot2 = slot0.pools
	slot2 = slot2[slot1]

	if not slot2 then
		slot3 = GameObject
		slot3 = slot3.New
		slot4 = "CellEdge"
		slot3 = slot3(slot4)
		slot5 = slot3
		slot4 = slot3.AddComponent
		slot6 = typeof
		slot7 = Image
		slot4 = slot4(slot5, slot6(slot7))
		slot5 = Color
		slot5 = slot5.New
		slot6 = 1
		slot7 = 0
		slot8 = 0
		slot9 = 1
		slot5 = slot5(slot6, slot7, slot8, slot9)
		slot4.color = slot5
		slot5 = slot0.sprite_whiteDot
		slot4.sprite = slot5
		slot5 = slot0.material_Add
		slot4.material = slot5
		slot5 = slot0
		slot5 = slot5.New
		slot6 = slot3
		slot7 = 8
		slot5 = slot5(slot6, slot7)
		slot2 = slot5
		slot5 = slot0.pools
		slot5[slot1] = slot2
	end

	return slot2
end

slot0.getEdgePool = slot5

function slot5(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = slot0.cellAttachments

	if not slot2 then
		slot2 = {}
		slot0.cellAttachments = slot2
	end

	slot3 = slot0
	slot2 = slot0.initPlane

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.initDrag

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.initTargetArrow

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.InitDestinationMark

	slot2(slot3)

	slot2 = 0
	slot3 = ChapterConst
	slot3 = slot3.MaxRow
	slot3 = slot3 - 1
	slot4 = 1

	for slot5 = slot2, slot3, slot4 do
		slot6 = 0
		slot7 = ChapterConst
		slot7 = slot7.MaxColumn
		slot7 = slot7 - 1
		slot8 = 1

		for slot9 = slot6, slot7, slot8 do
			slot11 = slot0
			slot10 = slot0.initCell
			slot12 = slot5
			slot13 = slot9

			slot10(slot11, slot12, slot13)
		end
	end

	slot3 = slot0
	slot2 = slot0.updateAttachments

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.UpdateIdolsAnim

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.updateCellFlagList

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.initFleets

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.initChampions

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.updateQuadCells
	slot4 = ChapterConst
	slot4 = slot4.QuadStateFrozen

	slot2(slot3, slot4)

	slot3 = slot1
	slot2 = slot1.existOni
	slot2 = slot2(slot3)

	if slot2 then
		slot3 = slot0
		slot2 = slot0.displayEscapeGrid

		slot2(slot3)
	end

	slot2 = 0
	slot0.TeleportSubmarineMode = slot2
end

slot0.initAll = slot5

function slot5(slot0)
	slot1 = slot0.spotlighteffect

	if slot1 then
		slot1 = pg
		slot1 = slot1.PoolMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.ReturnPrefab
		slot3 = "effect/juguangdeng_SLG"
		slot4 = ""
		slot5 = slot0.spotlighteffect

		slot1(slot2, slot3, slot4, slot5)
	end

	slot1 = pairs
	slot2 = slot0.tweens
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = LeanTween
		slot6 = slot6.cancel
		slot7 = slot4

		slot6(slot7)
	end

	slot1 = table
	slot1 = slot1.clear
	slot2 = slot0.tweens

	slot1(slot2)

	slot1 = IsNil
	slot2 = slot0.cellRoot
	slot1 = slot1(slot2)

	if not slot1 then
		slot2 = slot0
		slot1 = slot0.clearFleets

		slot1(slot2)

		slot2 = slot0
		slot1 = slot0.clearChampions

		slot1(slot2)

		slot2 = slot0
		slot1 = slot0.clearTargetArrow

		slot1(slot2)

		slot2 = slot0
		slot1 = slot0.ClearDestinationMark

		slot1(slot2)

		slot2 = slot0
		slot1 = slot0.ClearIdolsAnim

		slot1(slot2)

		slot1 = pairs
		slot2 = slot0.attachmentCells
		slot1, slot2, slot3 = slot1(slot2)

		for slot4, slot5 in slot1, slot2, slot3 do
			slot7 = slot5
			slot6 = slot5.Clear

			slot6(slot7)
		end

		slot1 = table
		slot1 = slot1.clear
		slot2 = slot0.attachmentCells

		slot1(slot2)

		slot1 = pairs
		slot2 = slot0.extraAttachmentCells
		slot1, slot2, slot3 = slot1(slot2)

		for slot4, slot5 in slot1, slot2, slot3 do
			slot7 = slot5
			slot6 = slot5.Clear

			slot6(slot7)
		end

		slot1 = table
		slot1 = slot1.clear
		slot2 = slot0.extraAttachmentCells

		slot1(slot2)

		slot1 = 0
		slot2 = ChapterConst
		slot2 = slot2.MaxRow
		slot2 = slot2 - 1
		slot3 = 1

		for slot4 = slot1, slot2, slot3 do
			slot5 = 0
			slot6 = ChapterConst
			slot6 = slot6.MaxColumn
			slot6 = slot6 - 1
			slot7 = 1

			for slot8 = slot5, slot6, slot7 do
				slot10 = slot0
				slot9 = slot0.clearCell
				slot11 = slot4
				slot12 = slot8

				slot9(slot10, slot11, slot12)
			end
		end

		slot2 = slot0
		slot1 = slot0.clearPlane

		slot1(slot2)
	end

	slot1 = nil
	slot0.material_Add = slot1
	slot1 = nil
	slot0.sprite_whiteDot = slot1
	slot1 = slot0.pools
	slot1 = slot1.CellEdges

	if slot1 then
		slot1 = slot0.pools
		slot1 = slot1.CellEdges
		slot2 = slot1
		slot1 = slot1.Clear

		slot1(slot2)

		slot1 = slot0.pools
		slot2 = nil
		slot1.CellEdges = slot2
	end

	slot1 = pairs
	slot2 = slot0.pools
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot7 = slot5
		slot6 = slot5.ClearItems

		slot6(slot7)
	end

	slot1 = {}
	slot0.pools = slot1
	slot1 = GetOrAddComponent
	slot2 = slot0._tf
	slot3 = "EventTriggerListener"
	slot1 = slot1(slot2, slot3)
	slot2 = false
	slot1.enabled = slot2
	slot2 = slot0.dragTrigger

	if slot2 then
		slot2 = ClearEventTrigger
		slot3 = slot0.dragTrigger

		slot2(slot3)

		slot2 = nil
		slot0.dragTrigger = slot2
	end

	slot2 = {}
	slot0.endAniFlag = slot2
end

slot0.clearAll = slot5

function slot5(slot0)
	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot1 = slot1.UIMain
	slot1 = slot1.transform
	slot2 = slot1.rect
	slot2 = slot2.width
	slot3 = slot1.rect
	slot3 = slot3.height
	slot4 = Vector2
	slot4 = slot4.one
	slot5 = slot0.contextData
	slot5 = slot5.chapterVO
	slot6 = slot5.theme
	slot7 = slot3 * 0.5
	slot8 = math
	slot8 = slot8.tan
	slot9 = math
	slot9 = slot9.pi
	slot9 = slot9 / 180
	slot10 = slot6.fov
	slot9 = slot9 * slot10
	slot9 = slot9 * 0.5
	slot8 = slot8(slot9)
	slot7 = slot7 / slot8
	slot8 = math
	slot8 = slot8.pi
	slot8 = slot8 / 180
	slot9 = slot6.angle
	slot8 = slot8 * slot9
	slot9 = Vector3
	slot10 = 0
	slot11 = math
	slot11 = slot11.sin
	slot12 = slot8
	slot11 = slot11(slot12)
	slot11 = -slot11
	slot12 = math
	slot12 = slot12.cos
	slot13 = slot8
	slot12 = slot12(slot13)
	slot12 = -slot12
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = Vector3
	slot11 = 0
	slot12 = slot6.offsety
	slot13 = slot0
	slot13 = slot13.MapDefaultPos
	slot13 = slot13.y
	slot12 = slot12 + slot13
	slot13 = slot6.offsetz
	slot14 = slot0
	slot14 = slot14.MapDefaultPos
	slot14 = slot14.z
	slot13 = slot13 + slot14
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = Vector3
	slot11 = slot11.Dot
	slot12 = slot9
	slot13 = slot10
	slot11 = slot11(slot12, slot13)
	slot12 = math
	slot12 = slot12.clamp
	slot13 = slot7 - slot11
	slot13 = slot13 / slot7
	slot14 = 0
	slot15 = 1
	slot12 = slot12(slot13, slot14, slot15)
	slot4 = slot4 * slot12
	slot13 = slot5
	slot12 = slot5.getDragExtend
	slot12, slot13, slot14, slot15 = slot12(slot13)
	slot0.bottomExtend = slot15
	slot0.topExtend = slot14
	slot0.rightExtend = slot13
	slot0.leftExtend = slot12
	slot12 = slot0._tf
	slot13 = Vector2
	slot14 = slot2 * 2
	slot15 = slot3 * 2
	slot13 = slot13(slot14, slot15)
	slot12.sizeDelta = slot13
	slot12 = GetOrAddComponent
	slot13 = slot0._tf
	slot14 = "EventTriggerListener"
	slot12 = slot12(slot13, slot14)
	slot0.dragTrigger = slot12
	slot12 = slot0.dragTrigger
	slot13 = true
	slot12.enabled = slot13
	slot12 = slot0.dragTrigger
	slot13 = slot12
	slot12 = slot12.AddDragFunc

	function slot14(slot0, slot1)
		slot2 = slot0
		slot2 = slot2._tf
		slot2 = slot2.localPosition
		slot3 = math
		slot3 = slot3.clamp
		slot4 = slot2.x
		slot5 = slot1.delta
		slot5 = slot5.x
		slot6 = slot1
		slot6 = slot6.x
		slot5 = slot5 * slot6
		slot4 = slot4 + slot5
		slot5 = slot0
		slot5 = slot5.rightExtend
		slot5 = -slot5
		slot6 = slot0
		slot6 = slot6.leftExtend
		slot3 = slot3(slot4, slot5, slot6)
		slot2.x = slot3
		slot3 = math
		slot3 = slot3.clamp
		slot4 = slot2.y
		slot5 = slot1.delta
		slot5 = slot5.y
		slot6 = slot1
		slot6 = slot6.y
		slot5 = slot5 * slot6
		slot6 = math
		slot6 = slot6.cos
		slot7 = slot2
		slot6 = slot6(slot7)
		slot5 = slot5 / slot6
		slot4 = slot4 + slot5
		slot5 = slot0
		slot5 = slot5.topExtend
		slot5 = -slot5
		slot6 = slot0
		slot6 = slot6.bottomExtend
		slot3 = slot3(slot4, slot5, slot6)
		slot2.y = slot3
		slot3 = slot0
		slot3 = slot3._tf
		slot3.localPosition = slot2
	end

	slot12(slot13, slot14)
end

slot0.initDrag = slot5

function slot5(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = slot1.theme
	slot3 = slot0.levelCam
	slot4 = slot2.fov
	slot3.fieldOfView = slot4
	slot3 = nil
	slot4 = PoolMgr
	slot4 = slot4.GetInstance
	slot4 = slot4()
	slot5 = slot4
	slot4 = slot4.GetPrefab
	slot6 = "chapter/plane"
	slot7 = ""
	slot8 = false

	function slot9(slot0)
		slot1 = slot0.transform
		slot0 = slot1
	end

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot0.plane = slot3
	slot4 = ChapterConst
	slot4 = slot4.PlaneName
	slot3.name = slot4
	slot5 = slot3
	slot4 = slot3.SetParent
	slot6 = slot0._tf
	slot7 = false

	slot4(slot5, slot6, slot7)

	slot4 = Vector3
	slot5 = 0
	slot6 = slot2.offsety
	slot7 = slot2.offsetz
	slot4 = slot4(slot5, slot6, slot7)
	slot5 = Vector3
	slot6 = 0
	slot7 = slot0
	slot7 = slot7.MapDefaultPos
	slot7 = slot7.y
	slot8 = slot0
	slot8 = slot8.MapDefaultPos
	slot8 = slot8.z
	slot5 = slot5(slot6, slot7, slot8)
	slot4 = slot4 + slot5
	slot3.anchoredPosition3D = slot4
	slot5 = slot3
	slot4 = slot3.Find
	slot6 = "cells"
	slot4 = slot4(slot5, slot6)
	slot0.cellRoot = slot4
	slot5 = slot3
	slot4 = slot3.Find
	slot6 = "quads"
	slot4 = slot4(slot5, slot6)
	slot0.quadRoot = slot4
	slot5 = slot3
	slot4 = slot3.Find
	slot6 = "buttomMarks"
	slot4 = slot4(slot5, slot6)
	slot0.bottomMarkRoot = slot4
	slot5 = slot3
	slot4 = slot3.Find
	slot6 = "topMarks"
	slot4 = slot4(slot5, slot6)
	slot0.topMarkRoot = slot4
	slot5 = slot3
	slot4 = slot3.Find
	slot6 = "restrictMap"
	slot4 = slot4(slot5, slot6)
	slot0.restrictMap = slot4
	slot5 = slot3
	slot4 = slot3.Find
	slot6 = "UI_FX_list"
	slot4 = slot4(slot5, slot6)
	slot0.UIFXList = slot4
	slot4 = 1
	slot5 = slot0.UIFXList
	slot5 = slot5.childCount
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		slot8 = slot0.UIFXList
		slot9 = slot8
		slot8 = slot8.GetChild
		slot10 = slot7 - 1
		slot8 = slot8(slot9, slot10)
		slot9 = setActive
		slot10 = slot8
		slot11 = false

		slot9(slot10, slot11)
	end

	slot4 = slot0.UIFXList
	slot5 = slot4
	slot4 = slot4.Find
	slot7 = slot1
	slot6 = slot1.getConfig
	slot8 = "uifx"
	slot4 = slot4(slot5, slot6(slot7, slot8))

	if slot4 then
		slot5 = setActive
		slot6 = slot4
		slot7 = true

		slot5(slot6, slot7)
	end

	slot6 = slot3
	slot5 = slot3.Find
	slot7 = "display"
	slot5 = slot5(slot6, slot7)
	slot7 = slot5
	slot6 = slot5.Find
	slot8 = "mask/sea"
	slot6 = slot6(slot7, slot8)
	slot7 = GetImageSpriteFromAtlasAsync
	slot8 = "chapter/pic/"
	slot9 = slot2.assetSea
	slot8 = slot8 .. slot9
	slot9 = slot2.assetSea
	slot10 = slot6

	slot7(slot8, slot9, slot10)

	slot7 = Vector2
	slot8 = 10000
	slot9 = 10000
	slot7 = slot7(slot8, slot9)
	slot8 = Vector2
	slot8 = slot8.zero
	slot9 = slot1.indexMin
	slot10 = slot1.indexMax
	slot0.indexMax = slot10
	slot0.indexMin = slot9
	slot9 = 0
	slot10 = ChapterConst
	slot10 = slot10.MaxRow
	slot10 = slot10 - 1
	slot11 = 1

	for slot12 = slot9, slot10, slot11 do
		slot13 = 0
		slot14 = ChapterConst
		slot14 = slot14.MaxColumn
		slot14 = slot14 - 1
		slot15 = 1

		for slot16 = slot13, slot14, slot15 do
			slot17 = ChapterCell
			slot17 = slot17.Line2Name
			slot18 = slot12
			slot19 = slot16
			slot17 = slot17(slot18, slot19)
			slot19 = slot1
			slot18 = slot1.getChapterCell
			slot20 = slot12
			slot21 = slot16
			slot18 = slot18(slot19, slot20, slot21)

			if slot18 then
				slot19 = math
				slot19 = slot19.min
				slot20 = slot7.x
				slot21 = slot16
				slot19 = slot19(slot20, slot21)
				slot7.x = slot19
				slot19 = math
				slot19 = slot19.min
				slot20 = slot7.y
				slot21 = ChapterConst
				slot21 = slot21.MaxRow
				slot21 = slot21 * 0.5
				slot21 = slot21 - slot12
				slot21 = slot21 - 1
				slot19 = slot19(slot20, slot21)
				slot7.y = slot19
			end
		end
	end

	slot9 = slot2.cellSize
	slot10 = slot2.cellSpace
	slot9 = slot9 + slot10
	slot10 = slot7.x
	slot11 = slot9.x
	slot10 = slot10 * slot11
	slot7.x = slot10
	slot10 = slot7.y
	slot11 = slot9.y
	slot10 = slot10 * slot11
	slot7.y = slot10
	slot10 = slot0.indexMax
	slot10 = slot10.y
	slot11 = slot0.indexMin
	slot11 = slot11.y
	slot10 = slot10 - slot11
	slot10 = slot10 + 1
	slot11 = slot9.x
	slot10 = slot10 * slot11
	slot8.x = slot10
	slot10 = slot0.indexMax
	slot10 = slot10.x
	slot11 = slot0.indexMin
	slot11 = slot11.x
	slot10 = slot10 - slot11
	slot10 = slot10 + 1
	slot11 = slot9.y
	slot10 = slot10 * slot11
	slot8.y = slot10
	slot10 = slot8 * 0.5
	slot10 = slot7 + slot10
	slot5.anchoredPosition = slot10
	slot5.sizeDelta = slot8
	slot10 = slot0.restrictMap
	slot11 = slot8 * 0.5
	slot11 = slot7 + slot11
	slot10.anchoredPosition = slot11
	slot10 = slot0.restrictMap
	slot10.sizeDelta = slot8
	slot10 = Vector2
	slot11 = math
	slot11 = slot11.floor
	slot12 = slot5.sizeDelta
	slot12 = slot12.x
	slot13 = slot9.x
	slot12 = slot12 / slot13
	slot11 = slot11(slot12)
	slot12 = math
	slot12 = slot12.floor
	slot13 = slot5.sizeDelta
	slot13 = slot13.y
	slot14 = slot9.y
	slot13 = slot13 / slot14
	slot10 = slot10(slot11, slot12(slot13))
	slot12 = slot5
	slot11 = slot5.Find
	slot13 = "ABC"
	slot11 = slot11(slot12, slot13)
	slot13 = slot11
	slot12 = slot11.GetChild
	slot14 = 0
	slot12 = slot12(slot13, slot14)
	slot14 = slot11
	slot13 = slot11.GetComponent
	slot15 = typeof
	slot16 = GridLayoutGroup
	slot13 = slot13(slot14, slot15(slot16))
	slot14 = Vector2
	slot15 = slot2.cellSize
	slot15 = slot15.x
	slot16 = slot2.cellSize
	slot16 = slot16.y
	slot14 = slot14(slot15, slot16)
	slot13.cellSize = slot14
	slot14 = Vector2
	slot15 = slot2.cellSpace
	slot15 = slot15.x
	slot16 = slot2.cellSpace
	slot16 = slot16.y
	slot14 = slot14(slot15, slot16)
	slot13.spacing = slot14
	slot14 = slot13.padding
	slot15 = slot2.cellSpace
	slot15 = slot15.x
	slot14.left = slot15
	slot14 = slot11.childCount
	slot14 = slot14 - 1
	slot15 = slot10.x
	slot16 = -1

	for slot17 = slot14, slot15, slot16 do
		slot18 = Destroy
		slot20 = slot11
		slot19 = slot11.GetChild
		slot21 = slot17

		slot18(slot19(slot20, slot21))
	end

	slot14 = slot11.childCount
	slot15 = slot10.x
	slot15 = slot15 - 1
	slot16 = 1

	for slot17 = slot14, slot15, slot16 do
		slot18 = Instantiate
		slot19 = slot12
		slot18 = slot18(slot19)
		slot18 = slot18.transform
		slot19 = slot18
		slot18 = slot18.SetParent
		slot20 = slot11
		slot21 = false

		slot18(slot19, slot20, slot21)
	end

	slot14 = 0
	slot15 = slot10.x
	slot15 = slot15 - 1
	slot16 = 1

	for slot17 = slot14, slot15, slot16 do
		slot18 = setText
		slot20 = slot11
		slot19 = slot11.GetChild
		slot21 = slot17
		slot19 = slot19(slot20, slot21)
		slot20 = string
		slot20 = slot20.char
		slot21 = string
		slot21 = slot21.byte
		slot22 = "A"
		slot21 = slot21(slot22)
		slot21 = slot21 + slot17

		slot18(slot19, slot20(slot21))
	end

	slot15 = slot5
	slot14 = slot5.Find
	slot16 = "123"
	slot14 = slot14(slot15, slot16)
	slot16 = slot14
	slot15 = slot14.GetChild
	slot17 = 0
	slot15 = slot15(slot16, slot17)
	slot17 = slot14
	slot16 = slot14.GetComponent
	slot18 = typeof
	slot19 = GridLayoutGroup
	slot16 = slot16(slot17, slot18(slot19))
	slot17 = Vector2
	slot18 = slot2.cellSize
	slot18 = slot18.x
	slot19 = slot2.cellSize
	slot19 = slot19.y
	slot17 = slot17(slot18, slot19)
	slot16.cellSize = slot17
	slot17 = Vector2
	slot18 = slot2.cellSpace
	slot18 = slot18.x
	slot19 = slot2.cellSpace
	slot19 = slot19.y
	slot17 = slot17(slot18, slot19)
	slot16.spacing = slot17
	slot17 = slot16.padding
	slot18 = slot2.cellSpace
	slot18 = slot18.y
	slot17.top = slot18
	slot17 = slot14.childCount
	slot17 = slot17 - 1
	slot18 = slot10.y
	slot19 = -1

	for slot20 = slot17, slot18, slot19 do
		slot21 = Destroy
		slot23 = slot14
		slot22 = slot14.GetChild
		slot24 = slot20

		slot21(slot22(slot23, slot24))
	end

	slot17 = slot14.childCount
	slot18 = slot10.y
	slot18 = slot18 - 1
	slot19 = 1

	for slot20 = slot17, slot18, slot19 do
		slot21 = Instantiate
		slot22 = slot15
		slot21 = slot21(slot22)
		slot21 = slot21.transform
		slot22 = slot21
		slot21 = slot21.SetParent
		slot23 = slot14
		slot24 = false

		slot21(slot22, slot23, slot24)
	end

	slot17 = 0
	slot18 = slot10.y
	slot18 = slot18 - 1
	slot19 = 1

	for slot20 = slot17, slot18, slot19 do
		slot21 = setText
		slot23 = slot14
		slot22 = slot14.GetChild
		slot24 = slot20
		slot22 = slot22(slot23, slot24)
		slot23 = 1 + slot20

		slot21(slot22, slot23)
	end

	slot18 = slot5
	slot17 = slot5.Find
	slot19 = "linev"
	slot17 = slot17(slot18, slot19)
	slot19 = slot17
	slot18 = slot17.GetChild
	slot20 = 0
	slot18 = slot18(slot19, slot20)
	slot20 = slot17
	slot19 = slot17.GetComponent
	slot21 = typeof
	slot22 = GridLayoutGroup
	slot19 = slot19(slot20, slot21(slot22))
	slot20 = Vector2
	slot21 = ChapterConst
	slot21 = slot21.LineCross
	slot22 = slot5.sizeDelta
	slot22 = slot22.y
	slot20 = slot20(slot21, slot22)
	slot19.cellSize = slot20
	slot20 = Vector2
	slot21 = slot9.x
	slot22 = ChapterConst
	slot22 = slot22.LineCross
	slot21 = slot21 - slot22
	slot22 = 0
	slot20 = slot20(slot21, slot22)
	slot19.spacing = slot20
	slot20 = slot19.padding
	slot21 = math
	slot21 = slot21.floor
	slot22 = slot19.spacing
	slot22 = slot22.x
	slot21 = slot21(slot22)
	slot20.left = slot21
	slot20 = slot17.childCount
	slot20 = slot20 - 1
	slot21 = math
	slot21 = slot21.max
	slot22 = slot10.x
	slot22 = slot22 - 1
	slot23 = 0
	slot21 = slot21(slot22, slot23)
	slot22 = -1

	for slot23 = slot20, slot21, slot22 do
		slot24 = 0

		if slot23 > slot24 then
			slot24 = Destroy
			slot26 = slot17
			slot25 = slot17.GetChild
			slot27 = slot23

			slot24(slot25(slot26, slot27))
		end
	end

	slot20 = slot17.childCount
	slot21 = slot10.x
	slot21 = slot21 - 2
	slot22 = 1

	for slot23 = slot20, slot21, slot22 do
		slot24 = Instantiate
		slot25 = slot18
		slot24 = slot24(slot25)
		slot24 = slot24.transform
		slot25 = slot24
		slot24 = slot24.SetParent
		slot26 = slot17
		slot27 = false

		slot24(slot25, slot26, slot27)
	end

	slot21 = slot5
	slot20 = slot5.Find
	slot22 = "lineh"
	slot20 = slot20(slot21, slot22)
	slot22 = slot20
	slot21 = slot20.GetChild
	slot23 = 0
	slot21 = slot21(slot22, slot23)
	slot23 = slot20
	slot22 = slot20.GetComponent
	slot24 = typeof
	slot25 = GridLayoutGroup
	slot22 = slot22(slot23, slot24(slot25))
	slot23 = Vector2
	slot24 = slot5.sizeDelta
	slot24 = slot24.x
	slot25 = ChapterConst
	slot25 = slot25.LineCross
	slot23 = slot23(slot24, slot25)
	slot22.cellSize = slot23
	slot23 = Vector2
	slot24 = 0
	slot25 = slot9.y
	slot26 = ChapterConst
	slot26 = slot26.LineCross
	slot25 = slot25 - slot26
	slot23 = slot23(slot24, slot25)
	slot22.spacing = slot23
	slot23 = slot22.padding
	slot24 = math
	slot24 = slot24.floor
	slot25 = slot22.spacing
	slot25 = slot25.y
	slot24 = slot24(slot25)
	slot23.top = slot24
	slot23 = slot20.childCount
	slot23 = slot23 - 1
	slot24 = math
	slot24 = slot24.max
	slot25 = slot10.y
	slot25 = slot25 - 1
	slot26 = 0
	slot24 = slot24(slot25, slot26)
	slot25 = -1

	for slot26 = slot23, slot24, slot25 do
		slot27 = 0

		if slot26 > slot27 then
			slot27 = Destroy
			slot29 = slot20
			slot28 = slot20.GetChild
			slot30 = slot26

			slot27(slot28(slot29, slot30))
		end
	end

	slot23 = slot20.childCount
	slot24 = slot10.y
	slot24 = slot24 - 2
	slot25 = 1

	for slot26 = slot23, slot24, slot25 do
		slot27 = Instantiate
		slot28 = slot21
		slot27 = slot27(slot28)
		slot27 = slot27.transform
		slot28 = slot27
		slot27 = slot27.SetParent
		slot29 = slot20
		slot30 = false

		slot27(slot28, slot29, slot30)
	end

	slot23 = GetOrAddComponent
	slot25 = slot5
	slot24 = slot5.Find
	slot26 = "mask"
	slot24 = slot24(slot25, slot26)
	slot25 = "RawImage"
	slot23 = slot23(slot24, slot25)
	slot25 = slot5
	slot24 = slot5.Find
	slot26 = "seaBase/sea"
	slot24 = slot24(slot25, slot26)
	slot25 = slot2.seaBase

	if slot25 then
		slot25 = slot2.seaBase

		if slot25 ~= "" then
			slot25 = setActive
			slot26 = slot24
			slot27 = true

			slot25(slot26, slot27)

			slot25 = GetImageSpriteFromAtlasAsync
			slot26 = "chapter/pic/"
			slot27 = slot2.seaBase
			slot26 = slot26 .. slot27
			slot27 = slot2.seaBase
			slot28 = slot24

			slot25(slot26, slot27, slot28)

			slot25 = true
			slot23.enabled = slot25
			slot25 = UnityEngine
			slot25 = slot25.Rect
			slot25 = slot25.New
			slot26 = 0.005
			slot27 = 0.007
			slot28 = 1
			slot29 = -1
			slot25 = slot25(slot26, slot27, slot28, slot29)
			slot23.uvRect = slot25
		end
	else
		slot25 = setActive
		slot26 = slot24
		slot27 = false

		slot25(slot26, slot27)

		slot25 = false
		slot23.enabled = slot25
	end
end

slot0.initPlane = slot5

function slot5(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "plane/display/mask"
	slot1 = slot1(slot2, slot3)
	slot2 = GetOrAddComponent
	slot3 = slot1
	slot4 = "RawImage"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2.enabled

	if not slot3 then
		return
	end

	slot4 = slot0
	slot3 = slot0.getPoisonTex
	slot3 = slot3(slot4)
	slot2.texture = slot3
end

slot0.updatePoisonArea = slot5

function slot5(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "plane/display"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2.sizeDelta
	slot3 = slot3.x
	slot4 = slot2.sizeDelta
	slot4 = slot4.y
	slot3 = slot3 / slot4
	slot4 = 100
	slot5 = math
	slot5 = slot5.floor
	slot6 = slot4 / slot3
	slot5 = slot5(slot6)
	slot6 = nil
	slot7 = slot0.preChapterId
	slot8 = slot1.id

	if slot7 ~= slot8 then
		slot7 = UnityEngine
		slot7 = slot7.Texture2D
		slot7 = slot7.New
		slot8 = slot4
		slot9 = slot5
		slot7 = slot7(slot8, slot9)
		slot6 = slot7
		slot0.maskTexture = slot6
		slot7 = slot1.id
		slot0.preChapterId = slot7
	else
		slot6 = slot0.maskTexture
	end

	slot7 = {}
	slot9 = slot1
	slot8 = slot1.getPoisonArea
	slot10 = slot2.sizeDelta
	slot10 = slot10.x
	slot10 = slot4 / slot10
	slot8 = slot8(slot9, slot10)
	slot9 = slot0.poisonRectDir

	if slot9 == nil then
		slot7 = slot8
	else
		slot9 = pairs
		slot10 = slot8
		slot9, slot10, slot11 = slot9(slot10)

		for slot12, slot13 in slot9, slot10, slot11 do
			slot14 = slot0.poisonRectDir
			slot14 = slot14[slot12]

			if slot14 == nil then
				slot7[slot12] = slot13
			end
		end
	end

	function slot9(slot0)
		slot1 = slot0.x
		slot2 = slot0.w
		slot3 = slot0.x
		slot2 = slot2 + slot3
		slot3 = 1

		for slot4 = slot1, slot2, slot3 do
			slot5 = slot0.y
			slot6 = slot0.h
			slot7 = slot0.y
			slot6 = slot6 + slot7
			slot7 = 1

			for slot8 = slot5, slot6, slot7 do
				slot9 = slot0
				slot10 = slot9
				slot9 = slot9.SetPixel
				slot11 = slot4
				slot12 = slot8
				slot13 = Color
				slot13 = slot13.New
				slot14 = 1
				slot15 = 1
				slot16 = 1
				slot17 = 0

				slot9(slot10, slot11, slot12, slot13(slot14, slot15, slot16, slot17))
			end
		end
	end

	drawArea = slot9
	slot9 = pairs
	slot10 = slot7
	slot9, slot10, slot11 = slot9(slot10)

	for slot12, slot13 in slot9, slot10, slot11 do
		slot14 = drawArea
		slot15 = slot13

		slot14(slot15)
	end

	slot10 = slot6
	slot9 = slot6.Apply

	slot9(slot10)

	slot0.poisonRectDir = slot8

	return slot6
end

slot0.getPoisonTex = slot5

function slot5(slot0, slot1, slot2)
	slot3 = slot0.contextData
	slot3 = slot3.chapterVO
	slot4 = slot3.fleets
	slot4 = slot4[slot1]
	slot4 = slot4.id
	slot5 = slot0.cellFleets
	slot5 = slot5[slot4]

	if slot5 then
		slot7 = slot5
		slot6 = slot5.showPoisonDamage
		slot8 = slot2

		slot6(slot7, slot8)
	end
end

slot0.showFleetPoisonDamage = slot5

function slot5(slot0)
	slot2 = slot0
	slot1 = slot0.killQuadTws

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.killPresentTws

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.ClearEdges

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.hideQuadMark

	slot1(slot2)

	slot1 = removeAllChildren
	slot2 = slot0.cellRoot

	slot1(slot2)

	slot1 = removeAllChildren
	slot2 = slot0.quadRoot

	slot1(slot2)

	slot1 = removeAllChildren
	slot2 = slot0.bottomMarkRoot

	slot1(slot2)

	slot1 = removeAllChildren
	slot2 = slot0.topMarkRoot

	slot1(slot2)

	slot1 = removeAllChildren
	slot2 = slot0.restrictMap

	slot1(slot2)

	slot1 = nil
	slot0.cellRoot = slot1
	slot1 = nil
	slot0.quadRoot = slot1
	slot1 = nil
	slot0.bottomMarkRoot = slot1
	slot1 = nil
	slot0.topMarkRoot = slot1
	slot1 = nil
	slot0.restrictMap = slot1
	slot1 = slot0._tf
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = ChapterConst
	slot3 = slot3.PlaneName
	slot1 = slot1(slot2, slot3)
	slot3 = slot1
	slot2 = slot1.Find
	slot4 = "display/seaBase/sea"
	slot2 = slot2(slot3, slot4)
	slot3 = clearImageSprite
	slot4 = slot2

	slot3(slot4)

	slot3 = pg
	slot3 = slot3.PoolMgr
	slot3 = slot3.GetInstance
	slot3 = slot3()
	slot4 = slot3
	slot3 = slot3.ReturnPrefab
	slot5 = "chapter/plane"
	slot6 = ""
	slot7 = slot1.gameObject

	slot3(slot4, slot5, slot6, slot7)
end

slot0.clearPlane = slot5

function slot5(slot0)
	slot1 = slot0.cellFleets

	if slot1 then
		return
	end

	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = {}
	slot0.cellFleets = slot2
	slot2 = pairs
	slot3 = slot1.fleets
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot0
		slot7 = slot0.InitFleetCell
		slot9 = slot6.id

		slot7(slot8, slot9)
	end
end

slot0.initFleets = slot5

function slot5(slot0, slot1)
	slot2 = slot0.contextData
	slot2 = slot2.chapterVO
	slot4 = slot2
	slot3 = slot2.getFleetById
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot5 = slot3
	slot4 = slot3.isValid
	slot4 = slot4(slot5)

	if not slot4 then
		return
	end

	slot4 = nil
	slot6 = slot0
	slot5 = slot0.getFleetPool
	slot8 = slot3
	slot7 = slot3.getFleetType
	slot5 = slot5(slot6, slot7(slot8))
	slot7 = slot5
	slot6 = slot5.Dequeue
	slot6 = slot6(slot7)
	slot7 = slot6.transform
	slot8 = Vector3
	slot9 = slot2.theme
	slot9 = slot9.angle
	slot9 = -slot9
	slot10 = 0
	slot11 = 0
	slot8 = slot8(slot9, slot10, slot11)
	slot7.localEulerAngles = slot8
	slot7 = setParent
	slot8 = slot6
	slot9 = slot0.cellRoot
	slot10 = false

	slot7(slot8, slot9, slot10)

	slot7 = setActive
	slot8 = slot6
	slot9 = true

	slot7(slot8, slot9)

	slot7 = nil
	slot9 = slot3
	slot8 = slot3.getFleetType
	slot8 = slot8(slot9)
	slot9 = FleetType
	slot9 = slot9.Transport

	if slot8 == slot9 then
		slot8 = TransportCellView
		slot8 = slot8.New
		slot9 = slot6
		slot8 = slot8(slot9)
		slot4 = slot8
	else
		slot9 = slot3
		slot8 = slot3.getFleetType
		slot8 = slot8(slot9)
		slot9 = FleetType
		slot9 = slot9.Submarine

		if slot8 == slot9 then
			slot8 = SubCellView
			slot8 = slot8.New
			slot9 = slot6
			slot8 = slot8(slot9)
			slot4 = slot8

			function slot7()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.OnChangeSubAutoAttack

				slot0(slot1)
			end
		else
			slot8 = FleetCellView
			slot8 = slot8.New
			slot9 = slot6
			slot8 = slot8(slot9)
			slot4 = slot8
		end
	end

	slot9 = slot3
	slot8 = slot3.getFleetType
	slot8 = slot8(slot9)
	slot4.fleetType = slot8
	slot9 = slot4
	slot8 = slot4.setAction
	slot10 = ChapterConst
	slot10 = slot10.ShipIdleAction

	slot8(slot9, slot10)

	slot8 = slot4.tf
	slot9 = slot2.theme
	slot10 = slot9
	slot9 = slot9.GetLinePosition
	slot11 = slot3.line
	slot11 = slot11.row
	slot12 = slot3.line
	slot12 = slot12.column
	slot9 = slot9(slot10, slot11, slot12)
	slot8.localPosition = slot9
	slot8 = slot0.cellFleets
	slot8[slot1] = slot4
	slot9 = slot0
	slot8 = slot0.RefreshFleetCell
	slot10 = slot1
	slot11 = slot7

	slot8(slot9, slot10, slot11)
end

slot0.InitFleetCell = slot5

function slot5(slot0)
	slot1 = slot0.cellFleets

	if not slot1 then
		slot2 = slot0
		slot1 = slot0.initFleetCells

		slot1(slot2)

		return
	end

	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot3 = slot1
	slot2 = slot1.getDataType
	slot2 = slot2(slot3)
	slot3 = {}
	slot4 = pairs
	slot5 = slot0.cellFleets
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot10 = slot1
		slot9 = slot1.getFleetById
		slot11 = slot7
		slot9 = slot9(slot10, slot11)

		if not slot9 then
			slot9 = table
			slot9 = slot9.insert
			slot10 = slot3
			slot11 = slot7

			slot9(slot10, slot11)
		end
	end

	slot4 = pairs
	slot5 = slot3
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot10 = slot0
		slot9 = slot0.ClearFleetCell
		slot11 = slot8

		slot9(slot10, slot11)
	end

	slot4 = pairs
	slot5 = slot1.fleets
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = slot0.cellFleets
		slot10 = slot8.id
		slot9 = slot9[slot10]

		if not slot9 then
			slot10 = slot0
			slot9 = slot0.InitFleetCell
			slot11 = slot8.id

			slot9(slot10, slot11)
		else
			slot10 = slot0
			slot9 = slot0.RefreshFleetCell
			slot11 = slot8.id

			slot9(slot10, slot11)
		end
	end
end

slot0.RefreshFleetCells = slot5

function slot5(slot0, slot1, slot2)
	slot3 = slot0.contextData
	slot3 = slot3.chapterVO
	slot5 = slot3
	slot4 = slot3.getFleetById
	slot6 = slot1
	slot4 = slot4(slot5, slot6)
	slot5 = slot0.cellFleets
	slot5 = slot5[slot1]
	slot6, slot7 = nil
	slot9 = slot4
	slot8 = slot4.isValid
	slot8 = slot8(slot9)

	if slot8 then
		slot9 = slot4
		slot8 = slot4.getFleetType
		slot8 = slot8(slot9)
		slot9 = FleetType
		slot9 = slot9.Transport

		if slot8 == slot9 then
			slot9 = slot4
			slot8 = slot4.getPrefab
			slot8 = slot8(slot9)
			slot6 = slot8
		else
			slot9 = slot3
			slot8 = slot3.getMapShip
			slot10 = slot4
			slot8 = slot8(slot9, slot10)

			if slot8 then
				slot10 = slot8
				slot9 = slot8.getPrefab
				slot9 = slot9(slot10)
				slot6 = slot9
				slot10 = slot8
				slot9 = slot8.getAttachmentPrefab
				slot9 = slot9(slot10)
				slot7 = slot9
			end
		end
	end

	if not slot6 then
		slot9 = slot0
		slot8 = slot0.ClearFleetCell
		slot10 = slot1

		slot8(slot9, slot10)

		return
	end

	slot8 = slot5.go
	slot9 = "cell_fleet_"
	slot10 = slot6
	slot9 = slot9 .. slot10
	slot8.name = slot9
	slot10 = slot5
	slot9 = slot5.setLine
	slot11 = slot4.line

	slot9(slot10, slot11)

	slot10 = slot5
	slot9 = slot5.setPrefab
	slot11 = slot6

	slot9(slot10, slot11)

	slot10 = slot5
	slot9 = slot5.setAttachment
	slot11 = slot7

	slot9(slot10, slot11)

	slot10 = slot5
	slot9 = slot5.loadSpine

	function slot11()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.getModel
		slot0 = slot0(slot1)
		slot0 = slot0.transform
		slot1 = slot1
		slot1 = slot1.rotation
		slot0.localRotation = slot1
		slot0 = slot2
		slot1 = slot0
		slot0 = slot0.updateFleet
		slot2 = slot3

		slot0(slot1, slot2)

		slot0 = slot4

		if slot0 then
			slot0 = slot4

			slot0()
		end
	end

	slot9(slot10, slot11)
end

slot0.RefreshFleetCell = slot5

function slot5(slot0)
	slot1 = slot0.cellFleets

	if slot1 then
		slot1 = pairs
		slot2 = slot0.cellFleets
		slot1, slot2, slot3 = slot1(slot2)

		for slot4, slot5 in slot1, slot2, slot3 do
			slot7 = slot0
			slot6 = slot0.ClearFleetCell
			slot8 = slot4

			slot6(slot7, slot8)
		end

		slot1 = nil
		slot0.cellFleets = slot1
	end
end

slot0.clearFleets = slot5

function slot5(slot0, slot1)
	slot2 = slot0.cellFleets
	slot2 = slot2[slot1]

	if not slot2 then
		return
	end

	slot4 = slot2
	slot3 = slot2.clear

	slot3(slot4)

	slot3 = LeanTween
	slot3 = slot3.cancel
	slot4 = slot2.go

	slot3(slot4)

	slot3 = setActive
	slot4 = slot2.go
	slot5 = false

	slot3(slot4, slot5)

	slot3 = setParent
	slot4 = slot2.go
	slot5 = slot0.poolParent
	slot6 = false

	slot3(slot4, slot5, slot6)

	slot4 = slot0
	slot3 = slot0.getFleetPool
	slot5 = slot2.fleetType
	slot3 = slot3(slot4, slot5)
	slot5 = slot3
	slot4 = slot3.Enqueue
	slot6 = slot2.go
	slot7 = false

	slot4(slot5, slot6, slot7)

	slot4 = slot0.opBtns
	slot4 = slot4[slot1]

	if slot4 then
		slot4 = Destroy
		slot5 = slot0.opBtns
		slot5 = slot5[slot1]
		slot5 = slot5.gameObject

		slot4(slot5)

		slot4 = slot0.opBtns
		slot5 = nil
		slot4[slot1] = slot5
	end

	slot4 = slot0.cellFleets
	slot5 = nil
	slot4[slot1] = slot5
end

slot0.ClearFleetCell = slot5

function slot5(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = pairs
	slot3 = slot1.fleets
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot0
		slot7 = slot0.updateFleet
		slot9 = slot6.id

		slot7(slot8, slot9)
	end

	slot3 = slot0
	slot2 = slot0.sortItems

	slot2(slot3)
end

slot0.updateFleets = slot5

function slot5(slot0, slot1)
	slot2 = slot0.contextData
	slot2 = slot2.chapterVO
	slot4 = slot2
	slot3 = slot2.getDataType
	slot3 = slot3(slot4)
	slot4 = slot0.cellFleets
	slot4 = slot4[slot1]
	slot6 = slot2
	slot5 = slot2.getFleetById
	slot7 = slot1
	slot5 = slot5(slot6, slot7)

	if slot4 then
		slot6 = slot5.line
		slot8 = slot5
		slot7 = slot5.isValid
		slot7 = slot7(slot8)
		slot8 = setActive
		slot9 = slot4.go
		slot10 = slot7

		slot8(slot9, slot10)

		slot9 = slot5
		slot8 = slot5.getFleetType
		slot8 = slot8(slot9)
		slot9 = FleetType
		slot9 = slot9.Normal

		if slot8 == slot9 then
			slot9, slot10 = slot2:existEnemy(ChapterConst.SubjectPlayer, slot6.row, slot6.column)

			setActive(slot4.tfShadow, not slot9 and not slot2:existFleet(FleetType.Transport, slot6.row, slot6.column))
			slot0:SetSpineVisible(slot4.tfShip, not slot9 and not slot2.existFleet(FleetType.Transport, slot6.row, slot6.column))
			setActive(slot4.tfArrow, slot0.SetSpineVisible)
			setActive(slot4.tfOp, false)

			slot13 = slot0.opBtns[slot1]

			if not slot13 then
				slot14 = tf
				slot15 = Instantiate
				slot16 = slot4.tfOp
				slot14 = slot14(slot15(slot16))
				slot13 = slot14
				slot14 = "op"
				slot15 = slot1
				slot14 = slot14 .. slot15
				slot13.name = slot14
				slot15 = slot13
				slot14 = slot13.SetParent
				slot16 = slot0._tf
				slot17 = false

				slot14(slot15, slot16, slot17)

				slot14 = Vector3
				slot15 = slot2.theme
				slot15 = slot15.angle
				slot15 = -slot15
				slot16 = 0
				slot17 = 0
				slot14 = slot14(slot15, slot16, slot17)
				slot13.localEulerAngles = slot14
				slot14 = slot0.opBtns
				slot14[slot1] = slot13
			end

			slot14 = setActive
			slot15 = slot13
			slot16 = true

			slot14(slot15, slot16)

			slot14 = slot4.tfOp
			slot14 = slot14.position
			slot13.position = slot14

			if slot9 then
				slot14 = slot10 == ChapterConst.AttachBoss
				slot15 = false
			end

			if slot9 then
				slot16 = ChapterConst
				slot16 = slot16.AttachChampion

				if slot10 == slot16 then
					slot17 = slot2
					slot16 = slot2.getChampion
					slot18 = slot6.row
					slot19 = slot6.column
					slot16 = slot16(slot17, slot18, slot19)
					slot18 = slot16
					slot17 = slot16.GetLastID
					slot17 = slot17(slot18)
					slot18 = pg
					slot18 = slot18.expedition_data_template
					slot18 = slot18[slot17]

					if slot18 then
						slot14 = slot14 or slot18.ai == 6
						slot16 = _.any(slot2.fleets, function (slot0)
							return slot0.id ~= slot0.id and slot0:getFleetType() == FleetType.Normal and slot0:isValid()
						end)
						slot18 = setActive
						slot19 = slot13:Find("retreat"):Find("retreat")
					end
				end
			end

			if slot12 and slot7 then
				slot18(slot19, not slot0.subTeleportMode and slot9 and not slot14 and slot16)

				slot18 = setActive
			end

			slot20 = slot17
			slot19 = slot17.Find
			slot21 = "escape"
			slot19 = slot19(slot20, slot21)

			if slot12 and slot7 then
				slot18(slot19, not slot0.subTeleportMode and slot14)

				slot18 = setActive
				slot19 = slot17
				slot21 = slot17
			end

			slot20 = slot17.Find
			slot22 = "retreat"
			slot20 = slot20(slot21, slot22)
			slot20 = slot20.gameObject
			slot20 = slot20.activeSelf

			if not slot20 then
				slot21 = slot17
				slot20 = slot17.Find
				slot22 = "escape"
				slot20 = slot20(slot21, slot22)
				slot20 = slot20.gameObject
				slot20 = slot20.activeSelf
			end

			slot18(slot19, slot20)

			slot18 = slot17.gameObject
			slot18 = slot18.activeSelf

			if slot18 then
				slot18 = onButton
				slot19 = slot0
				slot20 = slot17

				function slot21()
					slot0 = slot0
					slot0 = slot0.parent
					slot1 = slot0
					slot0 = slot0.isfrozen
					slot0 = slot0(slot1)

					if not slot0 then
						slot0 = slot0
						slot0 = slot0.subTeleportMode

						if slot0 then
							return
						end
					end

					slot0 = slot1

					if slot0 then
						function slot0()
							slot0 = {}
							slot1 = {
								1,
								0
							}
							slot0[1] = slot1
							slot1 = {
								-1,
								0
							}
							slot0[2] = slot1
							slot1 = {
								0,
								1
							}
							slot0[3] = slot1
							slot1 = {
								0,
								-1
							}
							slot0[4] = slot1
							slot1 = ipairs
							slot2 = slot0
							slot1, slot2, slot3 = slot1(slot2)

							for slot4, slot5 in slot1, slot2, slot3 do
								slot6 = slot0
								slot7 = slot6
								slot6 = slot6.considerAsStayPoint
								slot8 = ChapterConst
								slot8 = slot8.SubjectPlayer
								slot9 = slot1
								slot9 = slot9.row
								slot10 = slot5[1]
								slot9 = slot9 + slot10
								slot10 = slot1
								slot10 = slot10.column
								slot11 = slot5[2]
								slot10 = slot10 + slot11
								slot6 = slot6(slot7, slot8, slot9, slot10)

								if slot6 then
									slot6 = slot0
									slot7 = slot6
									slot6 = slot6.existEnemy
									slot8 = ChapterConst
									slot8 = slot8.SubjectPlayer
									slot9 = slot1
									slot9 = slot9.row
									slot10 = slot5[1]
									slot9 = slot9 + slot10
									slot10 = slot1
									slot10 = slot10.column
									slot11 = slot5[2]
									slot10 = slot10 + slot11
									slot6 = slot6(slot7, slot8, slot9, slot10)

									if not slot6 then
										slot6 = slot2
										slot7 = slot6
										slot6 = slot6.emit
										slot8 = LevelMediator2
										slot8 = slot8.ON_OP
										slot9 = {}
										slot10 = ChapterConst
										slot10 = slot10.OpMove
										slot9.type = slot10
										slot10 = slot3
										slot10 = slot10.id
										slot9.id = slot10
										slot10 = slot1
										slot10 = slot10.row
										slot11 = slot5[1]
										slot10 = slot10 + slot11
										slot9.arg1 = slot10
										slot10 = slot1
										slot10 = slot10.column
										slot11 = slot5[2]
										slot10 = slot10 + slot11
										slot9.arg2 = slot10
										slot10 = slot3
										slot10 = slot10.line
										slot9.ordLine = slot10

										slot6(slot7, slot8, slot9)

										slot6 = false

										return slot6
									end
								end
							end

							slot1 = true

							return slot1
						end

						slot0 = slot0()

						if slot0 then
							slot0 = pg
							slot0 = slot0.TipsMgr
							slot0 = slot0.GetInstance
							slot0 = slot0()
							slot1 = slot0
							slot0 = slot0.ShowTips
							slot2 = i18n
							slot3 = "no_way_to_escape"

							slot0(slot1, slot2(slot3))
						end
					else
						slot0 = pg
						slot0 = slot0.MsgboxMgr
						slot0 = slot0.GetInstance
						slot0 = slot0()
						slot1 = slot0
						slot0 = slot0.ShowMsgBox
						slot2 = {}
						slot3 = i18n
						slot4 = "levelScene_who_to_retreat"
						slot5 = slot4
						slot5 = slot5.name
						slot3 = slot3(slot4, slot5)
						slot2.content = slot3

						function slot3()
							slot0 = slot0
							slot1 = slot0
							slot0 = slot0.emit
							slot2 = LevelMediator2
							slot2 = slot2.ON_OP
							slot3 = {}
							slot4 = ChapterConst
							slot4 = slot4.OpRetreat
							slot3.type = slot4
							slot4 = slot1
							slot4 = slot4.id
							slot3.id = slot4

							slot0(slot1, slot2, slot3)
						end

						slot2.onYes = slot3

						slot0(slot1, slot2)
					end
				end

				slot22 = SFX_UI_WEIGHANCHOR_WITHDRAW

				slot18(slot19, slot20, slot21, slot22)
			end

			setActive(slot18, false)
			setActive(slot4.tfAmmo, slot3 == ChapterConst.TypeNone and not slot11)

			slot19 = ChapterConst.TypeNone

			if slot3 == slot19 then
				slot20 = slot2
				slot19 = slot2.getFleetAmmo
				slot21 = slot5
				slot19, slot20 = slot19(slot20, slot21)
				slot21 = slot20
				slot22 = "/"
				slot23 = slot19
				slot21 = slot21 .. slot22 .. slot23

				if slot20 == 0 then
					slot22 = setColorStr
					slot23 = slot21
					slot24 = COLOR_RED
					slot22 = slot22(slot23, slot24)
					slot21 = slot22
				end

				slot22 = setText
				slot23 = slot4.tfAmmoText
				slot24 = slot21

				slot22(slot23, slot24)
			end

			if slot9 or slot11 then
				slot20 = slot2
				slot19 = slot2.getChampion
				slot21 = slot6.row
				slot22 = slot6.column
				slot19 = slot19(slot20, slot21, slot22)

				if slot9 then
					slot20 = ChapterConst
					slot20 = slot20.AttachChampion

					if slot10 == slot20 then
						slot21 = slot19
						slot20 = slot19.getPoolType
						slot20 = slot20(slot21)

						if slot20 == "common" then
							slot20 = slot4.tfArrow
							slot21 = Vector2
							slot22 = 0
							slot23 = 180
							slot21 = slot21(slot22, slot23)
							slot20.anchoredPosition = slot21
							slot20 = slot4.tfAmmo
							slot21 = Vector2
							slot22 = 60
							slot23 = 100
							slot21 = slot21(slot22, slot23)
							slot20.anchoredPosition = slot21
						end
					end
				else
					slot20 = slot4.tfArrow
					slot21 = Vector2
					slot22 = 0
					slot23 = 100
					slot21 = slot21(slot22, slot23)
					slot20.anchoredPosition = slot21
					slot20 = slot4.tfAmmo
					slot21 = Vector2
					slot22 = 22
					slot23 = 56
					slot21 = slot21(slot22, slot23)
					slot20.anchoredPosition = slot21
				end

				slot20 = slot4.tfAmmo
				slot21 = slot20
				slot20 = slot20.SetAsLastSibling

				slot20(slot21)
			else
				slot19 = slot4.tfArrow
				slot20 = Vector2
				slot21 = 0
				slot22 = 175
				slot20 = slot20(slot21, slot22)
				slot19.anchoredPosition = slot20
				slot19 = slot4.tfAmmo
				slot20 = Vector2
				slot21 = -60
				slot22 = 85
				slot20 = slot20(slot21, slot22)
				slot19.anchoredPosition = slot20
			end

			slot20 = slot4
			slot19 = slot4.getModel
			slot19 = slot19(slot20)
			slot20 = IsNil
			slot21 = slot19
			slot20 = slot20(slot21)

			if not slot20 and slot12 then
				slot20 = slot0.lastSelectedId
				slot21 = slot5.id

				if slot20 ~= slot21 then
					if not slot9 and not slot11 then
						slot20 = slot0.lastSelectedId

						if slot20 ~= -1 then
							slot21 = slot0
							slot20 = slot0.frozen

							slot20(slot21)

							slot21 = slot19
							slot20 = slot19.GetComponent
							slot22 = "SkeletonGraphic"
							slot20 = slot20(slot21, slot22)
							slot21 = slot20.material
							slot22 = Shader
							slot22 = slot22.Find
							slot23 = "Spine/SkeletonGraphic (Additive)"
							slot22 = slot22(slot23)
							slot23 = Material
							slot23 = slot23.New
							slot24 = slot22
							slot23 = slot23(slot24)
							slot24 = LeanTween
							slot24 = slot24.value
							slot25 = slot19
							slot26 = 0
							slot27 = 1
							slot28 = 0.2
							slot24 = slot24(slot25, slot26, slot27, slot28)
							slot25 = slot24
							slot24 = slot24.setEase
							slot26 = LeanTweenType
							slot26 = slot26.easeInOutSine
							slot24 = slot24(slot25, slot26)
							slot25 = slot24
							slot24 = slot24.setLoopPingPong
							slot26 = 2
							slot24 = slot24(slot25, slot26)
							slot25 = slot24
							slot24 = slot24.setOnUpdate
							slot26 = System
							slot26 = slot26.Action_float

							function slot27(slot0)
								slot1 = slot0
								slot2 = slot1
								slot1 = slot1.SetColor
								slot3 = "_Color"
								slot4 = Color
								slot4 = slot4.Lerp
								slot5 = Color
								slot5 = slot5.New
								slot6 = 0
								slot7 = 0
								slot8 = 0
								slot9 = 0
								slot5 = slot5(slot6, slot7, slot8, slot9)
								slot6 = Color
								slot6 = slot6.New
								slot7 = 0.5
								slot8 = 0.5
								slot9 = 0.5
								slot10 = 0
								slot6 = slot6(slot7, slot8, slot9, slot10)
								slot7 = slot0

								slot1(slot2, slot3, slot4(slot5, slot6, slot7))

								slot1 = slot1
								slot2 = slot0
								slot1.material = slot2
							end

							slot24 = slot24(slot25, slot26(slot27))
							slot25 = slot24
							slot24 = slot24.setOnComplete
							slot26 = System
							slot26 = slot26.Action

							function slot27()
								slot0 = slot0
								slot1 = slot1
								slot0.material = slot1
								slot0 = slot2
								slot1 = slot0
								slot0 = slot0.unfrozen

								slot0(slot1)
							end

							slot24(slot25, slot26(slot27))
						end
					end

					slot20 = slot5.id
					slot0.lastSelectedId = slot20
				end
			end
		else
			slot9 = FleetType
			slot9 = slot9.Submarine

			if slot8 == slot9 then
				slot10 = slot2
				slot9 = slot2.existEnemy
				slot11 = ChapterConst
				slot11 = slot11.SubjectPlayer
				slot12 = slot6.row
				slot13 = slot6.column
				slot9 = slot9(slot10, slot11, slot12, slot13)

				if not slot9 then
					slot10 = slot2
					slot9 = slot2.existAlly
					slot11 = slot5
					slot9 = slot9(slot10, slot11)
				end

				slot11 = slot4
				slot10 = slot4.SetActiveModel
				slot12 = not slot9

				slot10(slot11, slot12)

				slot10 = setActive
				slot11 = slot4.tfAmmo

				if not slot9 then
					slot10(slot11, slot3 == ChapterConst.TypeNone)

					slot11 = slot2
					slot10 = slot2.getFleetAmmo
					slot12 = slot5
					slot10, slot11 = slot10(slot11, slot12)
					slot12 = slot11
					slot13 = "/"
					slot14 = slot10
					slot12 = slot12 .. slot13 .. slot14

					if slot11 == 0 then
						slot13 = setColorStr
						slot14 = slot12
						slot15 = COLOR_RED
						slot13 = slot13(slot14, slot15)
						slot12 = slot13
					end
				end

				slot13 = setText
				slot14 = slot4.tfAmmoText
				slot15 = slot12

				slot13(slot14, slot15)
			else
				slot9 = FleetType
				slot9 = slot9.Transport

				if slot8 == slot9 then
					slot9 = setText
					slot10 = slot4.tfHpText
					slot12 = slot5
					slot11 = slot5.getRestHp
					slot11 = slot11(slot12)
					slot12 = "/"
					slot14 = slot5
					slot13 = slot5.getTotalHp
					slot13 = slot13(slot14)
					slot11 = slot11 .. slot12 .. slot13

					slot9(slot10, slot11)

					slot10 = slot2
					slot9 = slot2.existEnemy
					slot11 = ChapterConst
					slot11 = slot11.SubjectPlayer
					slot12 = slot6.row
					slot13 = slot6.column
					slot9 = slot9(slot10, slot11, slot12, slot13)
					slot10 = GetImageSpriteFromAtlasAsync
					slot11 = "enemies/"
					slot13 = slot5
					slot12 = slot5.getPrefab
					slot12 = slot12(slot13)
					slot11 = slot11 .. slot12
					slot12 = ""
					slot13 = slot4.tfIcon
					slot14 = true

					slot10(slot11, slot12, slot13, slot14)

					slot10 = setActive
					slot11 = slot4.tfFighting
					slot12 = slot9

					slot10(slot11, slot12)
				end
			end
		end

		slot9 = slot4.tf
		slot10 = slot2.theme
		slot11 = slot10
		slot10 = slot10.GetLinePosition
		slot12 = slot6.row
		slot13 = slot6.column
		slot10 = slot10(slot11, slot12, slot13)
		slot9.localPosition = slot10
		slot10 = slot4
		slot9 = slot4.setLine
		slot11 = {}
		slot12 = slot6.row
		slot11.row = slot12
		slot12 = slot6.column
		slot11.column = slot12

		slot9(slot10, slot11)
	end
end

slot0.updateFleet = slot5

function slot5(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = cloneTplTo
	slot3 = slot0.arrowTpl
	slot4 = slot0._tf
	slot2 = slot2(slot3, slot4)
	slot0.arrowTarget = slot2
	slot2 = slot0.arrowTarget
	slot3 = Vector3
	slot4 = slot1.theme
	slot4 = slot4.angle
	slot4 = -slot4
	slot5 = 0
	slot6 = 0
	slot3 = slot3(slot4, slot5, slot6)
	slot2.localEulerAngles = slot3
	slot2 = setActive
	slot3 = slot0.arrowTarget
	slot4 = false

	slot2(slot3, slot4)
end

slot0.initTargetArrow = slot5

function slot5(slot0, slot1)
	slot2 = slot0.contextData
	slot2 = slot2.chapterVO
	slot3 = ChapterCell
	slot3 = slot3.Line2Name
	slot4 = slot1.row
	slot5 = slot1.column
	slot3 = slot3(slot4, slot5)
	slot4 = slot0.cellRoot
	slot5 = slot4
	slot4 = slot4.Find
	slot6 = slot3
	slot4 = slot4(slot5, slot6)
	slot5 = slot0.arrowTarget
	slot6 = slot5
	slot5 = slot5.SetParent
	slot7 = slot4

	slot5(slot6, slot7)

	slot6 = slot2
	slot5 = slot2.existEnemy
	slot7 = ChapterConst
	slot7 = slot7.SubjectPlayer
	slot8 = slot1.row
	slot9 = slot1.column
	slot5, slot6 = slot5(slot6, slot7, slot8, slot9)
	slot8 = slot2
	slot7 = slot2.getChampion
	slot9 = slot1.row
	slot10 = slot1.column
	slot7 = slot7(slot8, slot9, slot10)

	if slot5 then
		slot8 = ChapterConst
		slot8 = slot8.AttachChampion

		if slot6 == slot8 then
			slot9 = slot7
			slot8 = slot7.getPoolType
			slot8 = slot8(slot9)

			if slot8 == "common" then
				slot9 = slot2
				slot8 = slot2.getChampion
				slot10 = slot1.row
				slot11 = slot1.column
				slot8 = slot8(slot9, slot10, slot11)
				slot9 = slot8
				slot8 = slot8.getScale
				slot8 = slot8(slot9)
				slot8 = slot8 / 100
				slot9 = slot0.arrowTarget
				slot10 = Vector3
				slot11 = 0
				slot12 = 80 * slot8
				slot12 = 20 + slot12
				slot13 = -80 * slot8
				slot10 = slot10(slot11, slot12, slot13)
				slot9.localPosition = slot10
			end
		end
	else
		slot8 = slot0.arrowTarget
		slot9 = Vector3
		slot10 = 0
		slot11 = 20
		slot12 = 0
		slot9 = slot9(slot10, slot11, slot12)
		slot8.localPosition = slot9
	end
end

slot0.updateTargetArrow = slot5

function slot5(slot0)
	slot1 = IsNil
	slot2 = slot0.arrowTarget
	slot1 = slot1(slot2)

	if not slot1 then
		slot1 = Destroy
		slot2 = slot0.arrowTarget

		slot1(slot2)

		slot1 = nil
		slot0.arrowTarget = slot1
	end
end

slot0.clearTargetArrow = slot5

function slot5(slot0)
	slot1 = cloneTplTo
	slot2 = slot0.destinationMarkTpl
	slot3 = slot0._tf
	slot1 = slot1(slot2, slot3)
	slot2 = SetActive
	slot3 = slot1
	slot4 = false

	slot2(slot3, slot4)

	slot2 = slot0.contextData
	slot2 = slot2.chapterVO
	slot3 = tf
	slot4 = slot1
	slot3 = slot3(slot4)
	slot4 = Vector3
	slot5 = slot2.theme
	slot5 = slot5.angle
	slot5 = -slot5
	slot6 = 0
	slot7 = 0
	slot4 = slot4(slot5, slot6, slot7)
	slot3.localEulerAngles = slot4
	slot3 = tf
	slot4 = slot1
	slot3 = slot3(slot4)
	slot0.destinationMark = slot3
end

slot0.InitDestinationMark = slot5

function slot5(slot0, slot1)
	if not slot1 then
		slot2 = slot0.destinationMark
		slot3 = slot2
		slot2 = slot2.SetParent
		slot4 = slot0._tf

		slot2(slot3, slot4)

		slot2 = go
		slot3 = slot0.destinationMark
		slot2 = slot2(slot3)
		slot3 = slot2
		slot2 = slot2.SetActive
		slot4 = false

		slot2(slot3, slot4)

		return
	end

	slot2 = go
	slot3 = slot0.destinationMark
	slot2 = slot2(slot3)
	slot3 = slot2
	slot2 = slot2.SetActive
	slot4 = true

	slot2(slot3, slot4)

	slot2 = slot0.contextData
	slot2 = slot2.chapterVO
	slot3 = ChapterCell
	slot3 = slot3.Line2Name
	slot4 = slot1.row
	slot5 = slot1.column
	slot3 = slot3(slot4, slot5)
	slot4 = slot0.cellRoot
	slot5 = slot4
	slot4 = slot4.Find
	slot6 = slot3
	slot4 = slot4(slot5, slot6)
	slot5 = slot0.destinationMark
	slot6 = slot5
	slot5 = slot5.SetParent
	slot7 = slot4

	slot5(slot6, slot7)

	slot5 = slot0.destinationMark
	slot6 = Vector3
	slot7 = 0
	slot8 = 40
	slot9 = -40
	slot6 = slot6(slot7, slot8, slot9)
	slot5.localPosition = slot6
end

slot0.UpdateDestinationMark = slot5

function slot5(slot0)
	slot1 = IsNil
	slot2 = slot0.destinationMark
	slot1 = slot1(slot2)

	if not slot1 then
		slot1 = Destroy
		slot2 = slot0.destinationMark

		slot1(slot2)

		slot1 = nil
		slot0.destinationMark = slot1
	end
end

slot0.ClearDestinationMark = slot5

function slot5(slot0)
	slot1 = slot0.cellChampions

	if slot1 then
		return
	end

	slot1 = {}
	slot0.cellChampions = slot1
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot3 = slot1
	slot2 = slot1.getDataType
	slot2 = slot2(slot3)
	slot3 = ipairs
	slot4 = slot1.champions
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot0.cellChampions
		slot9 = false
		slot8[slot6] = slot9
		slot8 = slot7.flag

		if slot8 ~= 1 then
			slot9 = slot7
			slot8 = slot7.getPoolType
			slot8 = slot8(slot9)
			slot10 = slot0
			slot9 = slot0.getChampionPool
			slot11 = slot8
			slot9 = slot9(slot10, slot11)
			slot11 = slot9
			slot10 = slot9.Dequeue
			slot10 = slot10(slot11)
			slot11 = "cell_champion_"
			slot13 = slot7
			slot12 = slot7.getPrefab
			slot12 = slot12(slot13)
			slot11 = slot11 .. slot12
			slot10.name = slot11
			slot11 = slot10.transform
			slot12 = Vector3
			slot13 = slot1.theme
			slot13 = slot13.angle
			slot13 = -slot13
			slot14 = 0
			slot15 = 0
			slot12 = slot12(slot13, slot14, slot15)
			slot11.localEulerAngles = slot12
			slot11 = setParent
			slot12 = slot10
			slot13 = slot0.cellRoot
			slot14 = false

			slot11(slot12, slot13, slot14)

			slot11 = setActive
			slot12 = slot10
			slot13 = true

			slot11(slot12, slot13)

			slot11 = slot7.attachment
			slot12 = ChapterConst
			slot12 = slot12.AttachOni

			if slot11 == slot12 then
				slot11 = slot0.cellChampions
				slot12 = OniCellView
				slot12 = slot12.New
				slot13 = slot10
				slot12 = slot12(slot13)
				slot11[slot6] = slot12
			elseif slot8 == "common" then
				slot11 = slot0.cellChampions
				slot12 = ChampionCellView
				slot12 = slot12.New
				slot13 = slot10
				slot12 = slot12(slot13)
				slot11[slot6] = slot12
			else
				slot11 = slot0.cellChampions
				slot12 = EggCellView
				slot12 = slot12.New
				slot13 = slot10
				slot12 = slot12(slot13)
				slot11[slot6] = slot12
			end

			slot11 = slot0.cellChampions
			slot11 = slot11[slot6]
			slot11.poolType = slot8
			slot13 = slot11
			slot12 = slot11.setLine
			slot14 = {}
			slot15 = slot7.row
			slot14.row = slot15
			slot15 = slot7.column
			slot14.column = slot15

			slot12(slot13, slot14)

			slot13 = slot11
			slot12 = slot11.setPrefab
			slot15 = slot7
			slot14 = slot7.getPrefab

			slot12(slot13, slot14(slot15))

			slot13 = slot11
			slot12 = slot11.setAction
			slot14 = ChapterConst
			slot14 = slot14.ShipIdleAction

			slot12(slot13, slot14)

			if slot8 == "enemy" then
				slot13 = slot11
				slot12 = slot11.setLevel
				slot15 = slot7
				slot14 = slot7.getConfig
				slot16 = "level"

				slot12(slot13, slot14(slot15, slot16))

				slot13 = slot11
				slot12 = slot11.setEnemyType
				slot15 = slot7
				slot14 = slot7.getConfig
				slot16 = "type"

				slot12(slot13, slot14(slot15, slot16))
			elseif slot8 == "common" then
				slot12 = slot7.flag

				if slot12 == 5 then
					slot13 = slot11
					slot12 = slot11.setAction
					slot14 = ChapterConst
					slot14 = slot14.ShipSwimAction

					slot12(slot13, slot14)
				end
			end

			slot13 = slot11
			slot12 = slot11.SetExtraEffect
			slot15 = slot7
			slot14 = slot7.getConfig
			slot16 = "effect_prefab"

			slot12(slot13, slot14(slot15, slot16))

			slot13 = slot11
			slot12 = slot11.loadSpine

			function slot14()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.getModel
				slot0 = slot0(slot1)
				slot0 = slot0.transform
				slot1 = slot1
				slot1 = slot1.rotation
				slot0.localRotation = slot1
				slot1 = slot2

				if slot1 == "common" then
					slot1 = slot1
					slot2 = slot1
					slot1 = slot1.getScale
					slot1 = slot1(slot2)
					slot1 = slot1 / 100
					slot2 = Vector3
					slot3 = 0.4 * slot1
					slot4 = 0.4 * slot1
					slot5 = 1
					slot2 = slot2(slot3, slot4, slot5)
					slot0.localScale = slot2
				end

				slot1 = slot3
				slot2 = slot1
				slot1 = slot1.updateChampion
				slot3 = slot4

				slot1(slot2, slot3)
			end

			slot12(slot13, slot14)
		end
	end

	slot4 = slot0
	slot3 = slot0.sortItems

	slot3(slot4)
end

slot0.initChampions = slot5

function slot5(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = ipairs
	slot3 = slot0.cellChampions
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot0
		slot7 = slot0.updateChampion
		slot9 = slot5

		slot7(slot8, slot9)
	end

	slot3 = slot0
	slot2 = slot0.sortItems

	slot2(slot3)
end

slot0.updateChampions = slot5

function slot5(slot0, slot1)
	slot2 = slot0.contextData
	slot2 = slot2.chapterVO
	slot3 = slot0.cellChampions
	slot3 = slot3[slot1]
	slot4 = slot2.champions
	slot4 = slot4[slot1]

	if slot3 and slot4 then
		slot5 = slot4.trait
		slot6 = ChapterConst
		slot6 = slot6.TraitLurk

		if slot5 ~= slot6 then
			slot6 = slot2
			slot5 = slot2.getChampionVisibility
			slot7 = slot4
			slot5 = slot5(slot6, slot7)

			if slot5 then
				slot6 = slot2
				slot5 = slot2.existFleet
				slot7 = FleetType
				slot7 = slot7.Transport
				slot8 = slot4.row
				slot9 = slot4.column
				slot5 = slot5(slot6, slot7, slot8, slot9)
				slot5 = not slot5
			end
		else
			slot5 = false

			if false then
				slot5 = true
			end
		end

		slot6 = slot4.attachment
		slot7 = ChapterConst
		slot7 = slot7.AttachOni

		if slot6 == slot7 then
			slot6 = 1
			slot7 = _
			slot7 = slot7.each
			slot8 = slot2.fleets

			function slot9(slot0)
				slot1 = slot0
				slot2 = slot1
				slot1 = slot1.inAlertRange
				slot3 = slot0.line
				slot3 = slot3.row
				slot4 = slot0.line
				slot4 = slot4.column
				slot1 = slot1(slot2, slot3, slot4)

				if slot1 then
					slot1 = slot1
					slot1 = slot1 + 1
					slot1 = slot1
				end
			end

			slot7(slot8, slot9)

			slot7 = GetImageSpriteFromAtlasAsync
			slot8 = "enemies/sp_"
			slot9 = slot6
			slot8 = slot8 .. slot9
			slot9 = ""
			slot10 = slot3.tfIcon
			slot11 = true

			slot7(slot8, slot9, slot10, slot11)

			slot7 = slot3.tfBufficons

			if slot7 then
				slot8 = setActive
				slot9 = slot7
				slot10 = false

				slot8(slot9, slot10)
			end
		else
			setActive(slot3.tfFighting, slot5 and slot2:existEnemy(ChapterConst.SubjectChampion, slot4.row, slot4.column))

			slot7 = setActive
			slot8 = slot3.tfEffectFound

			if slot5 then
				slot7(slot8, slot4.trait == ChapterConst.TraitVirgin)

				slot7 = setActive
				slot8 = slot3.tfDamageCount
			end

			if slot5 then
				slot7(slot8, slot4.data > 0)

				slot7 = setActive
				slot9 = slot3.tf
				slot8 = slot3.tf.Find
			end

			slot10 = "huoqiubaozha"
			slot8 = slot8(slot9, slot10)
			slot9 = false

			slot7(slot8, slot9)

			slot7 = slot4.trait
			slot8 = ChapterConst
			slot8 = slot8.TraitVirgin

			if slot7 == slot8 then
				slot7 = playSoundEffect
				slot8 = SFX_UI_WEIGHANCHOR_ENEMY

				slot7(slot8)
			end

			slot8 = slot3
			slot7 = slot3.getModel
			slot7 = slot7(slot8)

			if slot7 then
				slot8 = slot3.poolType

				if slot8 == "common" then
					slot9 = slot7
					slot8 = slot7.GetComponent
					slot10 = "SkeletonGraphic"
					slot8 = slot8(slot9, slot10)
					slot10 = slot0
					slot9 = slot0.isHuntingRangeVisible
					slot9 = slot9(slot10)

					if slot9 then
						slot9 = _
						slot9 = slot9.any
						slot10 = slot2.fleets

						function slot11(slot0)
							slot2 = slot0
							slot1 = slot0.getFleetType
							slot1 = slot1(slot2)
							slot2 = FleetType
							slot2 = slot2.Submarine

							if slot1 == slot2 then
								slot2 = slot0
								slot1 = slot0.isValid
								slot1 = slot1(slot2)

								if slot1 then
									slot2 = slot0
									slot1 = slot0.inHuntingRange
									slot3 = slot0
									slot3 = slot3.row
									slot4 = slot0
									slot4 = slot4.column
									slot1 = slot1(slot2, slot3, slot4)
								end
							else
								slot1 = false

								if false then
									slot1 = true
								end
							end

							return slot1
						end

						slot9 = slot9(slot10, slot11)
					end

					if slot9 then
						slot10 = slot0.championTws
						slot10 = slot10[slot1]

						if not slot10 then
						end
					else
						slot10 = slot0.championTws
						slot10 = slot10[slot1]

						if slot10 then
							slot10 = LeanTween
							slot10 = slot10.cancel
							slot11 = slot0.championTws
							slot11 = slot11[slot1]
							slot11 = slot11.uniqueId

							slot10(slot11)

							slot10 = slot0.championTws
							slot11 = nil
							slot10[slot1] = slot11
							slot10 = Color
							slot10 = slot10.white
							slot8.color = slot10
						end
					end
				end
			end
		end

		slot6 = slot3.tfShadow

		if slot6 then
			slot7 = Vector3
			slot8 = slot2.theme
			slot8 = slot8.angle
			slot9 = 0
			slot10 = 0
			slot7 = slot7(slot8, slot9, slot10)
			slot6.localEulerAngles = slot7
		end

		slot7 = pg
		slot7 = slot7.expedition_data_template
		slot8 = slot4.attachmentId
		slot7 = slot7[slot8]
		slot8 = slot3.tfBufficons

		if slot8 and slot7 then
			slot9 = slot7.bufficon
			slot9 = #slot9
			slot10 = 0

			if slot9 > slot10 and slot5 then
				slot9 = setActive
				slot10 = slot8
				slot11 = true

				slot9(slot10, slot11)

				slot10 = slot0
				slot9 = slot0.AlignListContainer
				slot11 = slot8
				slot12 = slot7.bufficon
				slot12 = #slot12

				slot9(slot10, slot11, slot12)

				slot9 = 1
				slot10 = ipairs
				slot11 = slot7.bufficon
				slot10, slot11, slot12 = slot10(slot11)

				for slot13, slot14 in slot10, slot11, slot12 do
					slot15 = #slot14
					slot16 = 0

					if slot15 > slot16 then
						slot16 = slot8
						slot15 = slot8.GetChild
						slot17 = slot9 - 1
						slot15 = slot15(slot16, slot17)
						slot16 = GetImageSpriteFromAtlasAsync
						slot17 = "ui/levelmainscene_atlas"
						slot18 = slot14
						slot19 = slot15

						slot16(slot17, slot18, slot19)

						slot9 = slot9 + 1
					end
				end
			end
		elseif slot8 then
			slot9 = setActive
			slot10 = slot8
			slot11 = false

			slot9(slot10, slot11)
		end

		slot9 = slot3.tf
		slot10 = slot2.theme
		slot11 = slot10
		slot10 = slot10.GetLinePosition
		slot12 = slot4.row
		slot13 = slot4.column
		slot10 = slot10(slot11, slot12, slot13)
		slot9.localPosition = slot10
		slot10 = slot3
		slot9 = slot3.setLine
		slot11 = {}
		slot12 = slot4.row
		slot11.row = slot12
		slot12 = slot4.column
		slot11.column = slot12

		slot9(slot10, slot11)

		slot10 = slot3
		slot9 = slot3.SetActive
		slot11 = slot5

		slot9(slot10, slot11)
	end
end

slot0.updateChampion = slot5

function slot5(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = nil
	slot3 = ipairs
	slot4 = slot1.champions
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot7.attachment
		slot9 = ChapterConst
		slot9 = slot9.AttachOni

		if slot8 == slot9 then
			slot2 = slot6

			break
		end
	end

	if slot2 then
		slot4 = slot0
		slot3 = slot0.updateChampion
		slot5 = slot2

		slot3(slot4, slot5)
	end
end

slot0.updateOni = slot5

function slot5(slot0)
	slot1 = slot0.cellChampions

	if slot1 then
		slot1 = ipairs
		slot2 = slot0.cellChampions
		slot1, slot2, slot3 = slot1(slot2)

		for slot4, slot5 in slot1, slot2, slot3 do
			if slot5 then
				slot6 = slot0.championTws
				slot6 = slot6[slot4]

				if slot6 then
					slot6 = LeanTween
					slot6 = slot6.cancel
					slot7 = slot0.championTws
					slot7 = slot7[slot4]
					slot7 = slot7.uniqueId

					slot6(slot7)

					slot6 = slot0.championTws
					slot7 = nil
					slot6[slot4] = slot7
					slot7 = slot5
					slot6 = slot5.getModel
					slot6 = slot6(slot7)

					if slot6 then
						slot8 = slot6
						slot7 = slot6.GetComponent
						slot9 = "SkeletonGraphic"
						slot7 = slot7(slot8, slot9)
						slot8 = Color
						slot8 = slot8.white
						slot7.color = slot8
					end
				end

				slot7 = slot5
				slot6 = slot5.clear

				slot6(slot7)

				slot6 = LeanTween
				slot6 = slot6.cancel
				slot7 = slot5.go

				slot6(slot7)

				slot6 = setActive
				slot7 = slot5.go
				slot8 = false

				slot6(slot7, slot8)

				slot6 = setParent
				slot7 = slot5.go
				slot8 = slot0.poolParent
				slot9 = false

				slot6(slot7, slot8, slot9)

				slot7 = slot0
				slot6 = slot0.getChampionPool
				slot8 = slot5.poolType
				slot6 = slot6(slot7, slot8)
				slot8 = slot6
				slot7 = slot6.Enqueue
				slot9 = slot5.go
				slot10 = false

				slot7(slot8, slot9, slot10)
			end
		end

		slot1 = nil
		slot0.cellChampions = slot1
	end
end

slot0.clearChampions = slot5

function slot5(slot0)
	slot1 = slot0.sortFunc

	if not slot1 then
		slot1 = debounce

		function slot2()
			slot0 = slot0
			slot0 = slot0.exited

			if slot0 then
				return
			end

			slot0 = {}
			slot1 = slot0
			slot1 = slot1.cellFleets

			if slot1 then
				slot1 = pairs
				slot2 = slot0
				slot2 = slot2.cellFleets
				slot1, slot2, slot3 = slot1(slot2)

				for slot4, slot5 in slot1, slot2, slot3 do
					slot6 = table
					slot6 = slot6.insert
					slot7 = slot0
					slot8 = slot5

					slot6(slot7, slot8)
				end
			end

			slot1 = slot0
			slot1 = slot1.cellChampions

			if slot1 then
				slot1 = _
				slot1 = slot1.each
				slot2 = slot0
				slot2 = slot2.cellChampions

				function slot3(slot0)
					if slot0 then
						slot1 = table
						slot1 = slot1.insert
						slot2 = slot0
						slot3 = slot0

						slot1(slot2, slot3)
					end
				end

				slot1(slot2, slot3)
			end

			slot1 = slot0
			slot1 = slot1.cellAttachments

			if slot1 then
				slot1 = _
				slot1 = slot1.each
				slot2 = slot0
				slot2 = slot2.cellAttachments

				function slot3(slot0)
					if slot0 then
						slot1 = table
						slot1 = slot1.insert
						slot2 = slot0
						slot3 = slot0

						slot1(slot2, slot3)
					end
				end

				slot1(slot2, slot3)
			end

			slot1 = _
			slot1 = slot1.sort
			slot2 = slot0

			function slot3(slot0, slot1)
				return slot0:getLine().row * 10000 + (ChapterConst.MaxColumn - slot0.getLine().column) * 100 + slot0:getOrder() < slot1:getLine().row * 10000 + (ChapterConst.MaxColumn - slot1.getLine().column) * 100 + slot1:getOrder()
			end

			slot1(slot2, slot3)

			slot1 = nil
			slot2 = 0
			slot3 = ChapterConst
			slot3 = slot3.MaxRow
			slot3 = slot3 - 1
			slot4 = 1

			for slot5 = slot2, slot3, slot4 do
				slot6 = ChapterConst
				slot6 = slot6.MaxColumn
				slot6 = slot6 - 1
				slot7 = 0
				slot8 = -1

				for slot9 = slot6, slot7, slot8 do
					slot10 = ChapterCell
					slot10 = slot10.Line2Name
					slot11 = slot5
					slot12 = slot9
					slot10 = slot10(slot11, slot12)
					slot11 = slot0
					slot11 = slot11.cellRoot
					slot12 = slot11
					slot11 = slot11.Find
					slot13 = slot10
					slot11 = slot11(slot12, slot13)

					if slot11 then
						slot13 = slot11
						slot12 = slot11.SetAsLastSibling

						slot12(slot13)
					end

					slot12 = #slot0
					slot13 = 0

					while slot12 > slot13 do
						slot12 = slot0[1]
						slot13 = slot12
						slot12 = slot12.getLine
						slot12 = slot12(slot13)
						slot13 = slot12.row

						if slot13 <= slot5 and slot9 == 0 then
							slot13 = slot0[1]
							slot13 = slot13.tf
							slot14 = slot13
							slot13 = slot13.SetAsLastSibling

							slot13(slot14)

							slot13 = table
							slot13 = slot13.remove
							slot14 = slot0
							slot15 = 1

							slot13(slot14, slot15)
						else
							break
						end
					end
				end
			end
		end

		slot3 = 0.1
		slot4 = false
		slot1 = slot1(slot2, slot3, slot4)
		slot0.sortFunc = slot1
	end

	slot1 = slot0.sortFunc

	slot1()
end

slot0.sortItems = slot5

function slot5(slot0, slot1, slot2)
	slot3 = slot0.contextData
	slot3 = slot3.chapterVO
	slot5 = slot3
	slot4 = slot3.getChapterCell
	slot6 = slot1
	slot7 = slot2
	slot4 = slot4(slot5, slot6, slot7)

	if slot4 then
		slot5 = slot3.theme
		slot5 = slot5.cellSize
		slot6 = ChapterCell
		slot6 = slot6.Line2QuadName
		slot7 = slot1
		slot8 = slot2
		slot6 = slot6(slot7, slot8)
		slot7 = nil
		slot9 = slot4
		slot8 = slot4.IsWalkable
		slot8 = slot8(slot9)

		if slot8 then
			slot8 = PoolMgr
			slot8 = slot8.GetInstance
			slot8 = slot8()
			slot9 = slot8
			slot8 = slot8.GetPrefab
			slot10 = "chapter/cell_quad"
			slot11 = ""
			slot12 = false

			function slot13(slot0)
				slot1 = slot0.transform
				slot0 = slot1
			end

			slot8(slot9, slot10, slot11, slot12, slot13)

			slot7.name = slot6
			slot9 = slot7
			slot8 = slot7.SetParent
			slot10 = slot0.quadRoot
			slot11 = false

			slot8(slot9, slot10, slot11)

			slot7.sizeDelta = slot5
			slot8 = slot3.theme
			slot9 = slot8
			slot8 = slot8.GetLinePosition
			slot10 = slot1
			slot11 = slot2
			slot8 = slot8(slot9, slot10, slot11)
			slot7.anchoredPosition = slot8
			slot9 = slot7
			slot8 = slot7.SetAsLastSibling

			slot8(slot9)
		end

		slot8 = ChapterCell
		slot8 = slot8.Line2Name
		slot9 = slot1
		slot10 = slot2
		slot8 = slot8(slot9, slot10)
		slot9 = nil
		slot10 = PoolMgr
		slot10 = slot10.GetInstance
		slot10 = slot10()
		slot11 = slot10
		slot10 = slot10.GetPrefab
		slot12 = "chapter/cell"
		slot13 = ""
		slot14 = false

		function slot15(slot0)
			slot1 = slot0.transform
			slot0 = slot1
		end

		slot10(slot11, slot12, slot13, slot14, slot15)

		slot9.name = slot8
		slot11 = slot9
		slot10 = slot9.SetParent
		slot12 = slot0.cellRoot
		slot13 = false

		slot10(slot11, slot12, slot13)

		slot9.sizeDelta = slot5
		slot10 = slot3.theme
		slot11 = slot10
		slot10 = slot10.GetLinePosition
		slot12 = slot1
		slot13 = slot2
		slot10 = slot10(slot11, slot12, slot13)
		slot9.anchoredPosition = slot10
		slot11 = slot9
		slot10 = slot9.SetAsLastSibling

		slot10(slot11)

		slot11 = slot9
		slot10 = slot9.Find
		slot12 = ChapterConst
		slot12 = slot12.ChildItem
		slot10 = slot10(slot11, slot12)
		slot11 = Vector3
		slot12 = slot3.theme
		slot12 = slot12.angle
		slot12 = -slot12
		slot13 = 0
		slot14 = 0
		slot11 = slot11(slot12, slot13, slot14)
		slot10.localEulerAngles = slot11
		slot11 = setActive
		slot12 = slot10
		slot13 = slot4.item

		slot11(slot12, slot13)

		slot11 = slot4.item

		if slot11 then
			slot12 = slot0
			slot11 = slot0.frozen

			slot11(slot12)

			slot11 = PoolMgr
			slot11 = slot11.GetInstance
			slot11 = slot11()
			slot12 = slot11
			slot11 = slot11.GetPrefab
			slot13 = "chapter/"
			slot14 = slot4.item
			slot13 = slot13 .. slot14
			slot14 = slot4.item
			slot15 = true

			function slot16(slot0)
				slot2 = slot0
				slot1 = slot0.GetComponent
				slot3 = typeof
				slot4 = UnityEngine
				slot4 = slot4.UI
				slot4 = slot4.Graphic
				slot1 = slot1(slot2, slot3(slot4))
				slot2 = IsNil
				slot3 = slot1
				slot2 = slot2(slot3)

				if not slot2 then
					slot2 = false
					slot1.raycastTarget = slot2
				end

				slot3 = slot0
				slot2 = slot0.GetComponentsInChildren
				slot4 = typeof
				slot5 = UnityEngine
				slot5 = slot5.UI
				slot5 = slot5.Graphic
				slot4 = slot4(slot5)
				slot5 = true
				slot2 = slot2(slot3, slot4, slot5)
				slot3 = 0
				slot4 = slot2.Length
				slot4 = slot4 - 1
				slot5 = 1

				for slot6 = slot3, slot4, slot5 do
					slot7 = slot2[slot6]
					slot8 = false
					slot7.raycastTarget = slot8
				end

				slot3 = slot0.transform
				slot4 = slot0
				slot4 = slot4.item
				slot3.name = slot4
				slot5 = slot3
				slot4 = slot3.SetParent
				slot6 = slot1
				slot7 = false

				slot4(slot5, slot6, slot7)

				slot4 = slot0
				slot4 = slot4.itemOffset
				slot3.anchoredPosition = slot4
				slot4 = slot2
				slot5 = slot4
				slot4 = slot4.unfrozen

				slot4(slot5)
			end

			slot11(slot12, slot13, slot14, slot15, slot16)
		end

		slot12 = slot9
		slot11 = slot9.Find
		slot13 = ChapterConst
		slot13 = slot13.ChildAttachment
		slot11 = slot11(slot12, slot13)
		slot12 = Vector3
		slot13 = slot3.theme
		slot13 = slot13.angle
		slot13 = -slot13
		slot14 = 0
		slot15 = 0
		slot12 = slot12(slot13, slot14, slot15)
		slot11.localEulerAngles = slot12

		if slot7 then
			slot12 = onButton
			slot13 = slot0
			slot14 = slot7

			function slot15()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.isfrozen
				slot0 = slot0(slot1)

				if not slot0 then
					slot0 = slot0
					slot0 = slot0.quadState
					slot1 = ChapterConst
					slot1 = slot1.QuadStateStrategy

					if slot0 ~= slot1 then
						slot0 = slot0
						slot0 = slot0.quadState
						slot1 = ChapterConst
						slot1 = slot1.QuadStateTeleportSub

						if slot0 == slot1 then
							slot0 = slot0
							slot0 = slot0.quadClickProxy

							if slot0 then
								slot0 = slot0
								slot0 = slot0.quadClickProxy
								slot1 = slot1

								slot0(slot1)
							end
						else
							slot0 = slot0
							slot0 = slot0.onCellClick

							if slot0 then
								slot0 = slot0
								slot0 = slot0.onCellClick
								slot1 = slot1

								slot0(slot1)
							end
						end
					end
				end
			end

			slot16 = SFX_CONFIRM

			slot12(slot13, slot14, slot15, slot16)
		end
	end
end

slot0.initCell = slot5

function slot5(slot0, slot1, slot2)
	slot3 = slot0.contextData
	slot3 = slot3.chapterVO
	slot5 = slot3
	slot4 = slot3.getChapterCell
	slot6 = slot1
	slot7 = slot2
	slot4 = slot4(slot5, slot6, slot7)
	slot5 = ChapterCell
	slot5 = slot5.Line2Name
	slot6 = slot1
	slot7 = slot2
	slot5 = slot5(slot6, slot7)
	slot6 = ChapterCell
	slot6 = slot6.Line2QuadName
	slot7 = slot1
	slot8 = slot2
	slot6 = slot6(slot7, slot8)
	slot7 = slot0.cellRoot
	slot8 = slot7
	slot7 = slot7.Find
	slot9 = slot5
	slot7 = slot7(slot8, slot9)
	slot8 = slot0.quadRoot
	slot9 = slot8
	slot8 = slot8.Find
	slot10 = slot6
	slot8 = slot8(slot9, slot10)
	slot9 = IsNil
	slot10 = slot7
	slot9 = slot9(slot10)

	if not slot9 then
		function slot9(slot0, slot1)
			slot2 = slot0.childCount
			slot3 = 0

			if slot2 > slot3 then
				slot3 = slot0
				slot2 = slot0.GetChild
				slot4 = 0
				slot2 = slot2(slot3, slot4)
				slot3 = PoolMgr
				slot3 = slot3.GetInstance
				slot3 = slot3()
				slot4 = slot3
				slot3 = slot3.ReturnPrefab
				slot5 = "chapter/"
				slot6 = slot2.name
				slot5 = slot5 .. slot6
				slot6 = slot2.name
				slot7 = slot2.gameObject

				slot3(slot4, slot5, slot6, slot7)

				if slot1 then
					slot3 = PoolMgr
					slot3 = slot3.GetInstance
					slot3 = slot3()
					slot4 = slot3
					slot3 = slot3.DestroyPrefab
					slot5 = "chapter/"
					slot6 = slot2.name
					slot5 = slot5 .. slot6
					slot6 = slot2.name

					slot3(slot4, slot5, slot6)
				end
			end
		end

		slot10 = slot9
		slot12 = slot7
		slot11 = slot7.Find
		slot13 = ChapterConst
		slot13 = slot13.ChildItem
		slot11 = slot11(slot12, slot13)
		slot12 = true

		slot10(slot11, slot12)

		slot10 = slot0.attachTws
		slot10 = slot10[slot5]

		if slot10 then
			slot10 = LeanTween
			slot10 = slot10.cancel
			slot11 = slot0.attachTws
			slot11 = slot11[slot5]
			slot11 = slot11.uniqueId

			slot10(slot11)

			slot10 = slot0.attachTws
			slot11 = nil
			slot10[slot5] = slot11
		end

		slot10 = slot0.shiningTws
		slot10 = slot10[slot5]

		if slot10 then
			slot10 = LeanTween
			slot10 = slot10.cancel
			slot11 = slot0.shiningTws
			slot11 = slot11[slot5]
			slot11 = slot11.uniqueId

			slot10(slot11)

			slot10 = slot0.shiningTws
			slot11 = nil
			slot10[slot5] = slot11
		end

		slot11 = slot7
		slot10 = slot7.Find
		slot12 = ChapterConst
		slot12 = slot12.ChildAttachment
		slot10 = slot10(slot11, slot12)
		slot11 = slot4.attachment
		slot12 = ChapterConst
		slot12 = slot12.AttachRival

		if slot11 == slot12 then
			slot11 = ChapterConst
			slot11 = slot11.Line2RivalName
			slot12 = slot4.row
			slot13 = slot4.column
			slot11 = slot11(slot12, slot13)
			slot12 = slot0.rivals
			slot12 = slot12[slot11]

			if slot12 then
				slot12 = slot0.rivals
				slot12 = slot12[slot11]
				slot13 = slot12
				slot12 = slot12.clear

				slot12(slot13)

				slot12 = slot0.rivals
				slot13 = nil
				slot12[slot11] = slot13
			end
		else
			slot11 = slot4.attachment
			slot12 = ChapterConst
			slot12 = slot12.AttachBox

			if slot11 == slot12 then
				slot11 = slot10.childCount
				slot12 = 0

				if slot11 > slot12 then
					slot12 = slot10
					slot11 = slot10.GetChild
					slot13 = 0
					slot11 = slot11(slot12, slot13)
					slot12 = slot11
					slot11 = slot11.Find
					slot13 = "icon"
					slot11 = slot11(slot12, slot13)

					if slot11 then
						slot12 = slot11.childCount
						slot13 = 0

						if slot12 > slot13 then
							slot12 = pg
							slot12 = slot12.box_data_template
							slot13 = slot4.attachmentId
							slot12 = slot12[slot13]
							slot13 = PoolMgr
							slot13 = slot13.GetInstance
							slot13 = slot13()
							slot14 = slot13
							slot13 = slot13.ReturnPrefab
							slot15 = "boxprefab/"
							slot16 = slot12.icon
							slot15 = slot15 .. slot16
							slot16 = slot12.icon
							slot18 = slot11
							slot17 = slot11.GetChild
							slot19 = 0
							slot17 = slot17(slot18, slot19)
							slot17 = slot17.gameObject

							slot13(slot14, slot15, slot16, slot17)

							slot13 = PoolMgr
							slot13 = slot13.GetInstance
							slot13 = slot13()
							slot14 = slot13
							slot13 = slot13.DestroyPrefab
							slot15 = "boxprefab/"
							slot16 = slot12.icon
							slot15 = slot15 .. slot16
							slot16 = slot12.icon

							slot13(slot14, slot15, slot16)
						end
					end
				end
			else
				slot11 = slot4.attachment
				slot12 = ChapterConst
				slot12 = slot12.AttachLandbase

				if slot11 == slot12 then
					slot11 = slot4.attachmentId
					slot12 = ChapterConst
					slot12 = slot12.LBIDHarbor

					if slot11 == slot12 then
						slot11 = slot10.childCount
						slot12 = 0

						if slot11 > slot12 then
							slot12 = slot10
							slot11 = slot10.GetChild
							slot13 = 0
							slot11 = slot11(slot12, slot13)
							slot12 = slot11
							slot11 = slot11.Find
							slot13 = "icon"
							slot11 = slot11(slot12, slot13)

							if slot11 then
								slot12 = slot11.childCount
								slot13 = 0

								if slot12 > slot13 then
									slot12 = pg
									slot12 = slot12.box_data_template
									slot13 = slot4.attachmentId
									slot12 = slot12[slot13]
									slot13 = PoolMgr
									slot13 = slot13.GetInstance
									slot13 = slot13()
									slot14 = slot13
									slot13 = slot13.ReturnPrefab
									slot15 = "boxprefab/gangkou"
									slot16 = "gangkou"
									slot18 = slot11
									slot17 = slot11.GetChild
									slot19 = 0
									slot17 = slot17(slot18, slot19)
									slot17 = slot17.gameObject

									slot13(slot14, slot15, slot16, slot17)

									slot13 = PoolMgr
									slot13 = slot13.GetInstance
									slot13 = slot13()
									slot14 = slot13
									slot13 = slot13.DestroyPrefab
									slot15 = "boxprefab/gangkou"
									slot16 = "gangkou"

									slot13(slot14, slot15, slot16)
								end
							end
						end
					end
				end
			end
		end

		slot11 = UIUtil
		slot11 = slot11.ClearChildren
		slot12 = slot10.gameObject

		slot11(slot12)

		slot11 = PoolMgr
		slot11 = slot11.GetInstance
		slot11 = slot11()
		slot12 = slot11
		slot11 = slot11.ReturnPrefab
		slot13 = "chapter/cell"
		slot14 = ""
		slot15 = slot7.gameObject

		slot11(slot12, slot13, slot14, slot15)
	end

	slot9 = IsNil
	slot10 = slot8
	slot9 = slot9(slot10)

	if not slot9 then
		slot9 = slot0.quadTws
		slot9 = slot9[slot6]

		if slot9 then
			slot9 = LeanTween
			slot9 = slot9.cancel
			slot10 = slot0.quadTws
			slot10 = slot10[slot6]
			slot10 = slot10.uniqueId

			slot9(slot10)

			slot9 = slot0.quadTws
			slot10 = nil
			slot9[slot6] = slot10
		end

		slot10 = slot8
		slot9 = slot8.Find
		slot11 = "grid"
		slot9 = slot9(slot10, slot11)
		slot10 = slot9
		slot9 = slot9.GetComponent
		slot11 = typeof
		slot12 = Image
		slot9 = slot9(slot10, slot11(slot12))
		slot10 = GetSpriteFromAtlas
		slot11 = "chapter/pic/cellgrid"
		slot12 = "cell_grid"
		slot10 = slot10(slot11, slot12)
		slot9.sprite = slot10
		slot10 = nil
		slot9.material = slot10
		slot10 = PoolMgr
		slot10 = slot10.GetInstance
		slot10 = slot10()
		slot11 = slot10
		slot10 = slot10.ReturnPrefab
		slot12 = "chapter/cell_quad"
		slot13 = ""
		slot14 = slot8.gameObject

		slot10(slot11, slot12, slot13, slot14)
	end
end

slot0.clearCell = slot5

function slot5(slot0)
	slot1 = 0
	slot2 = ChapterConst
	slot2 = slot2.MaxRow
	slot2 = slot2 - 1
	slot3 = 1

	for slot4 = slot1, slot2, slot3 do
		slot5 = 0
		slot6 = ChapterConst
		slot6 = slot6.MaxColumn
		slot6 = slot6 - 1
		slot7 = 1

		for slot8 = slot5, slot6, slot7 do
			slot10 = slot0
			slot9 = slot0.updateAttachment
			slot11 = slot4
			slot12 = slot8

			slot9(slot10, slot11, slot12)
		end
	end

	slot2 = slot0
	slot1 = slot0.updateExtraAttachments

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.updateAreaAttachment
	slot3 = ChapterConst
	slot3 = slot3.AttachAreaBoss

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.updateCoastalGunAttachArea

	slot1(slot2)
end

slot0.updateAttachments = slot5

function slot5(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = slot1.cells
	slot3 = {}
	slot4 = pairs
	slot5 = slot2
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = slot8.flagList

		if slot9 then
			slot9 = slot8.flagList
			slot9 = #slot9
			slot10 = 0

			if slot9 > slot10 then
				slot9 = pairs
				slot10 = slot8.flagList
				slot9, slot10, slot11 = slot9(slot10)

				for slot12, slot13 in slot9, slot10, slot11 do
					slot3[slot13] = slot3[slot13] or {}
					slot14 = table
					slot14 = slot14.insert
					slot15 = slot3[slot13]
					slot16 = slot8

					slot14(slot15, slot16)
				end
			end
		end
	end

	slot4 = ChapterConst
	slot4 = slot4.FlagBanaiAirStrike
	slot4 = slot3[slot4]

	if slot4 then
		slot4 = next
		slot5 = ChapterConst
		slot5 = slot5.FlagBanaiAirStrike
		slot5 = slot3[slot5]
		slot4 = slot4(slot5)

		if slot4 then
			slot5 = slot0
			slot4 = slot0.hideQuadMark
			slot6 = ChapterConst
			slot6 = slot6.MarkBanaiAirStrike

			slot4(slot5, slot6)

			slot5 = slot0
			slot4 = slot0.showQuadMark
			slot6 = ChapterConst
			slot6 = slot6.FlagBanaiAirStrike
			slot6 = slot3[slot6]
			slot7 = ChapterConst
			slot7 = slot7.MarkBanaiAirStrike
			slot8 = "cell_coastal_gun"
			slot9 = Vector2
			slot10 = 110
			slot11 = 110
			slot9 = slot9(slot10, slot11)
			slot10 = nil
			slot11 = true

			slot4(slot5, slot6, slot7, slot8, slot9, slot10, slot11)
		end
	end

	slot5 = slot0
	slot4 = slot0.updatePoisonArea

	slot4(slot5)

	slot4 = ChapterConst
	slot4 = slot4.FlagLava
	slot4 = slot3[slot4]

	if slot4 then
		slot4 = next
		slot5 = ChapterConst
		slot5 = slot5.FlagLava
		slot5 = slot3[slot5]
		slot4 = slot4(slot5)

		if slot4 then
			slot5 = slot0
			slot4 = slot0.hideQuadMark
			slot6 = ChapterConst
			slot6 = slot6.MarkLava

			slot4(slot5, slot6)

			slot5 = slot0
			slot4 = slot0.showQuadMark
			slot6 = ChapterConst
			slot6 = slot6.FlagLava
			slot6 = slot3[slot6]
			slot7 = ChapterConst
			slot7 = slot7.MarkLava
			slot8 = "cell_lava"
			slot9 = Vector2
			slot10 = 110
			slot11 = 110
			slot9 = slot9(slot10, slot11)
			slot10 = nil
			slot11 = true

			slot4(slot5, slot6, slot7, slot8, slot9, slot10, slot11)
		end
	end

	slot4 = ChapterConst
	slot4 = slot4.FlagNightmare
	slot4 = slot3[slot4]

	if slot4 then
		slot4 = next
		slot5 = ChapterConst
		slot5 = slot5.FlagNightmare
		slot5 = slot3[slot5]
		slot4 = slot4(slot5)

		if slot4 then
			slot5 = slot0
			slot4 = slot0.hideQuadMark
			slot6 = ChapterConst
			slot6 = slot6.MarkNightMare

			slot4(slot5, slot6)

			slot5 = slot0
			slot4 = slot0.hideQuadMark
			slot6 = ChapterConst
			slot6 = slot6.MarkHideNight

			slot4(slot5, slot6)

			slot4 = slot1.extraFlagList
			slot4 = slot4[1]
			slot5 = ChapterConst
			slot5 = slot5.StatusDay

			if slot4 == slot5 then
				slot6 = slot0
				slot5 = slot0.showQuadMark
				slot7 = ChapterConst
				slot7 = slot7.FlagNightmare
				slot7 = slot3[slot7]
				slot8 = ChapterConst
				slot8 = slot8.MarkHideNight
				slot9 = "cell_hidden_nightmare"
				slot10 = Vector2
				slot11 = 110
				slot12 = 110
				slot10 = slot10(slot11, slot12)
				slot11 = nil
				slot12 = true

				slot5(slot6, slot7, slot8, slot9, slot10, slot11, slot12)
			else
				slot5 = ChapterConst
				slot5 = slot5.StatusNight

				if slot4 == slot5 then
					slot6 = slot0
					slot5 = slot0.showQuadMark
					slot7 = ChapterConst
					slot7 = slot7.FlagNightmare
					slot7 = slot3[slot7]
					slot8 = ChapterConst
					slot8 = slot8.MarkNightMare
					slot9 = "cell_nightmare"
					slot10 = Vector2
					slot11 = 110
					slot12 = 110
					slot10 = slot10(slot11, slot12)
					slot11 = nil
					slot12 = true

					slot5(slot6, slot7, slot8, slot9, slot10, slot11, slot12)
				end
			end
		end
	end
end

slot0.updateCellFlagList = slot5

function slot5(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = slot1.cellAttachments
	slot3 = ipairs
	slot4 = slot2
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot7.row
		slot9 = slot7.column
		slot10 = ChapterCell
		slot10 = slot10.Line2Name
		slot11 = slot8
		slot12 = slot9
		slot10 = slot10(slot11, slot12)
		slot11 = slot0.cellRoot
		slot12 = slot11
		slot11 = slot11.Find
		slot13 = slot10
		slot11 = slot11(slot12, slot13)
		slot13 = slot11
		slot12 = slot11.Find
		slot14 = ChapterConst
		slot14 = slot14.ChildAttachment
		slot12 = slot12(slot13, slot14)
		slot13 = slot7.data
		slot14 = pg
		slot14 = slot14.map_event_template
		slot15 = slot7.attachmentId
		slot14 = slot14[slot15]
		slot15 = slot14.icon
		slot16 = slot14.ship_prefab
		slot17 = "story_"
		slot18 = slot8
		slot19 = "_"
		slot20 = slot9
		slot21 = "_"
		slot22 = slot7.attachmentId
		slot17 = slot17 .. slot18 .. slot19 .. slot20 .. slot21 .. slot22
		slot18 = slot0.extraAttachmentCells
		slot18 = slot18[slot10]
		slot19 = ChapterConst
		slot19 = slot19.StoryTrigger

		if slot13 == slot19 then
			if slot18 then
				slot19 = slot18.__cname

				if slot19 ~= "MapEventStoryTriggerCellView" then
					slot20 = slot18
					slot19 = slot18.Clear

					slot19(slot20)

					slot18 = nil
				end
			end

			if not slot18 then
				slot19 = MapEventStoryTriggerCellView
				slot19 = slot19.New
				slot20 = slot12
				slot19 = slot19(slot20)
				slot18 = slot19
				slot19 = slot0.extraAttachmentCells
				slot19[slot10] = slot18
			end

			slot18.info = slot7
			slot18.chapter = slot1
			slot19 = slot0.cellRoot
			slot18.cellRoot = slot19
			slot19 = slot0.cellAttachments
			slot18.refattachments = slot19
			slot20 = slot18
			slot19 = slot18.Update

			slot19(slot20)
		end
	end
end

slot0.updateExtraAttachments = slot5

function slot5(slot0, slot1)
	slot2 = slot0.contextData
	slot2 = slot2.chapterVO
	slot4 = slot2
	slot3 = slot2.calcAttachmenArea
	slot5 = slot1
	slot3, slot4, slot5, slot6, slot7, slot8 = slot3(slot4, slot5)
	slot10 = slot2
	slot9 = slot2.getChapterCell
	slot11 = slot4
	slot12 = slot6
	slot9 = slot9(slot10, slot11, slot12)

	if slot9 then
		setActive(slot12, slot9.trait ~= ChapterConst.TraitLurk)

		slot13 = slot9.trait
		slot14 = ChapterConst.TraitLurk

		if slot13 == slot14 then
			return
		end

		slot13 = slot9.attachment
		slot14 = ChapterConst
		slot14 = slot14.AttachAreaBoss

		if slot13 == slot14 then
			slot13 = pg
			slot13 = slot13.expedition_data_template
			slot14 = slot9.attachmentId
			slot13 = slot13[slot14]
			slot14 = "enemy_"
			slot15 = slot9.attachmentId
			slot14 = slot14 .. slot15
			slot15 = "dead_"
			slot16 = slot9.attachmentId
			slot15 = slot15 .. slot16
			slot17 = slot12
			slot16 = slot12.Find
			slot18 = slot14
			slot16 = slot16(slot17, slot18)
			slot18 = slot12
			slot17 = slot12.Find
			slot19 = slot15
			slot17 = slot17(slot18, slot19)
			slot18 = slot9.flag

			if slot18 == 0 then
				slot18 = IsNil
				slot19 = slot16
				slot18 = slot18(slot19)

				if slot18 then
					slot18 = cloneTplTo
					slot19 = slot0.enemyTpl
					slot20 = slot12
					slot21 = slot14
					slot18 = slot18(slot19, slot20, slot21)
					slot16 = slot18
					slot16.anchoredPosition = slot7
					slot18 = GetImageSpriteFromAtlasAsync
					slot19 = "enemies/"
					slot20 = slot13.icon
					slot19 = slot19 .. slot20
					slot20 = ""
					slot21 = findTF
					slot22 = slot16
					slot23 = "icon"
					slot21 = slot21(slot22, slot23)
					slot22 = true

					slot18(slot19, slot20, slot21, slot22)

					slot18 = setText
					slot19 = findTF
					slot20 = slot16
					slot21 = "lv/Text"
					slot19 = slot19(slot20, slot21)
					slot20 = slot13.level

					slot18(slot19, slot20)

					slot18 = setActive
					slot19 = findTF
					slot20 = slot16
					slot21 = "titleContain/bg_s"
					slot19 = slot19(slot20, slot21)
					slot20 = ChapterConst
					slot20 = slot20.EnemySize
					slot21 = slot13.type
					slot20 = slot20[slot21]

					if slot20 ~= 1 then
						slot20 = ChapterConst
						slot20 = slot20.EnemySize
						slot21 = slot13.type
						slot20 = slot20[slot21]
						slot20 = not slot20

						if not slot20 then
							slot20 = false
						end
					else
						slot20 = true
					end

					slot18(slot19, slot20)
					setActive(findTF(slot16, "titleContain/bg_m"), ChapterConst.EnemySize[slot13.type] == 2)
					setActive(findTF(slot16, "titleContain/bg_h"), ChapterConst.EnemySize[slot13.type] == 3)
					setActive(findTF(slot16, "titleContain/bg_boss"), ChapterConst.EnemySize[slot13.type] == 99)
				end

				setActive(findTF(slot16, "huoqiubaozha"), false)
				setActive(findTF(slot16, "effect_found"), slot9.trait == ChapterConst.TraitVirgin)

				slot18 = slot9.trait
				slot19 = ChapterConst.TraitVirgin

				if slot18 == slot19 then
					slot18 = playSoundEffect
					slot19 = SFX_UI_WEIGHANCHOR_ENEMY

					slot18(slot19)
				end

				slot18 = setActive
				slot19 = findTF
				slot20 = slot16
				slot21 = "fighting"
				slot19 = slot19(slot20, slot21)
				slot20 = _
				slot20 = slot20.any
				slot21 = slot2.fleets

				function slot22(slot0)
					slot2 = slot0
					slot1 = slot0.isValid
					slot1 = slot1(slot2)

					if slot1 then
						slot1 = slot0.line
						slot1 = slot1.row
						slot2 = slot0

						if slot2 <= slot1 then
							slot1 = slot0.line
							slot1 = slot1.row
							slot2 = slot1

							if slot1 <= slot2 then
								slot1 = slot0.line
								slot1 = slot1.column
								slot2 = slot2

								if slot2 <= slot1 then
									return slot0.line.column <= slot3
								end
							end
						end
					end
				end

				slot18(slot19, slot20(slot21, slot22))
			else
				slot18 = slot9.flag

				if slot18 == 1 then
					slot18 = slot9.attachment
					slot19 = ChapterConst
					slot19 = slot19.AttachAmbush

					if slot18 ~= slot19 then
						slot18 = IsNil
						slot19 = slot16
						slot18 = slot18(slot19)

						if not slot18 then
							slot18 = slot16.gameObject
							slot18 = slot18.activeSelf
						else
							slot18 = false

							if false then
								slot18 = true
							end
						end

						slot19 = IsNil
						slot20 = slot17
						slot19 = slot19(slot20)

						if slot19 then
							slot19 = cloneTplTo
							slot20 = slot0.deadTpl
							slot21 = slot12
							slot22 = slot15
							slot19 = slot19(slot20, slot21, slot22)
							slot17 = slot19
							slot17.anchoredPosition = slot7
							slot19 = "blue"
							slot20 = GetImageSpriteFromAtlasAsync
							slot21 = "enemies/"
							slot22 = slot13.icon
							slot23 = "_d_"
							slot24 = slot19
							slot21 = slot21 .. slot22 .. slot23 .. slot24
							slot22 = ""
							slot24 = slot17
							slot23 = slot17.Find
							slot25 = "icon"
							slot23 = slot23(slot24, slot25)
							slot24 = true

							slot20(slot21, slot22, slot23, slot24)

							slot20 = setActive
							slot22 = slot17
							slot21 = slot17.Find
							slot23 = "effect_not_open"
							slot21 = slot21(slot22, slot23)
							slot22 = false

							slot20(slot21, slot22)

							slot20 = setActive
							slot22 = slot17
							slot21 = slot17.Find
							slot23 = "effect_open"
							slot21 = slot21(slot22, slot23)
							slot22 = false

							slot20(slot21, slot22)
						end

						slot19 = setActive
						slot21 = slot17
						slot20 = slot17.Find
						slot22 = "huoqiubaozha"
						slot20 = slot20(slot21, slot22)
						slot21 = slot18

						slot19(slot20, slot21)
					end
				end
			end

			slot18 = IsNil
			slot19 = slot16
			slot18 = slot18(slot19)

			if not slot18 then
				setActive(slot16, slot9.flag == 0)
			end

			slot18 = IsNil
			slot19 = slot17
			slot18 = slot18(slot19)

			if not slot18 then
				setActive(slot17, slot9.flag == 1)
			end
		end
	end
end

slot0.updateAreaAttachment = slot5

function slot5(slot0, slot1, slot2)
	slot3 = slot0.contextData
	slot3 = slot3.chapterVO
	slot5 = slot3
	slot4 = slot3.getChapterCell
	slot6 = slot1
	slot7 = slot2
	slot4 = slot4(slot5, slot6, slot7)

	if slot4 then
		slot5 = slot4.attachment
		slot6 = ChapterConst
		slot6 = slot6.AttachAreaBoss

		if slot5 == slot6 then
			return
		end

		slot7 = slot0.cellRoot:Find(slot5).Find(slot6, ChapterConst.ChildAttachment)
		slot8 = slot4.trait ~= ChapterConst.TraitLurk
		slot9 = slot4.attachment
		slot10 = ChapterConst.AttachEnemy

		if slot9 ~= slot10 then
			slot9 = slot4.attachment
			slot10 = ChapterConst
			slot10 = slot10.AttachElite

			if slot9 ~= slot10 then
				slot9 = slot4.attachment
				slot10 = ChapterConst
				slot10 = slot10.AttachAmbush

				if slot9 ~= slot10 then
					slot9 = slot4.attachment
					slot10 = ChapterConst
					slot10 = slot10.AttachBoss

					if slot9 == slot10 then
						slot9 = slot4.flag

						if slot9 ~= 1 then
							slot10 = slot3
							slot9 = slot3.existFleet
							slot11 = FleetType
							slot11 = slot11.Transport
							slot12 = slot4.row
							slot13 = slot4.column
							slot9 = slot9(slot10, slot11, slot12, slot13)

							if slot9 then
								slot8 = false
							end
						end
					end
				end
			end
		end

		slot9 = setActive
		slot10 = slot7
		slot11 = slot8

		slot9(slot10, slot11)

		if not slot8 then
			return
		end

		slot9 = slot4.attachment
		slot10 = ChapterConst
		slot10 = slot10.AttachEnemy

		if slot9 ~= slot10 then
			slot9 = slot4.attachment
			slot10 = ChapterConst
			slot10 = slot10.AttachElite

			if slot9 ~= slot10 then
				slot9 = slot4.attachment
				slot10 = ChapterConst
				slot10 = slot10.AttachAmbush

				if slot9 ~= slot10 then
					slot9 = slot4.attachment
					slot10 = ChapterConst
					slot10 = slot10.AttachBoss

					if slot9 == slot10 then
						slot9 = pg
						slot9 = slot9.expedition_data_template
						slot10 = slot4.attachmentId
						slot9 = slot9[slot10]
						slot10 = slot9.icon_type

						if slot10 == 1 then
							slot10 = EnemyEggCellView or EnemySpineCellView
							slot11 = slot0.attachmentCells[slot5]

							if slot11 then
								slot12 = slot10.__cname
								slot13 = slot11.__cname

								if slot12 ~= slot13 then
									slot13 = slot11
									slot12 = slot11.Clear

									slot12(slot13)

									slot11 = nil
								end
							end
						end

						if not slot11 then
							slot12 = slot10.New
							slot13 = slot7
							slot12 = slot12(slot13)
							slot11 = slot12
							slot13 = slot11
							slot12 = slot11.SetTpl
							slot14 = slot0.enemyTpl
							slot15 = slot0.deadTpl

							slot12(slot13, slot14, slot15)

							slot12 = slot0.attachmentCells
							slot12[slot5] = slot11
						end

						slot11.info = slot4
						slot11.config = slot9
						slot11.chapter = slot3
						slot13 = slot11
						slot12 = slot11.Update

						slot12(slot13)

						slot12 = false
						slot13 = slot4.flag

						if slot13 == 0 then
							slot14 = slot0
							slot13 = slot0.isHuntingRangeVisible
							slot13 = slot13(slot14)

							if slot13 then
								slot13 = _
								slot13 = slot13.any
								slot14 = slot3.fleets

								function slot15(slot0)
									slot2 = slot0
									slot1 = slot0.getFleetType
									slot1 = slot1(slot2)
									slot2 = FleetType
									slot2 = slot2.Submarine

									if slot1 == slot2 then
										slot2 = slot0
										slot1 = slot0.isValid
										slot1 = slot1(slot2)

										if slot1 then
											slot2 = slot0
											slot1 = slot0.inHuntingRange
											slot3 = slot0
											slot3 = slot3.row
											slot4 = slot0
											slot4 = slot4.column
											slot1 = slot1(slot2, slot3, slot4)
										end
									else
										slot1 = false

										if false then
											slot1 = true
										end
									end

									return slot1
								end

								slot13 = slot13(slot14, slot15)
								slot12 = slot13
							end
						end

						if slot12 then
							slot13 = slot0.attachTws
							slot13 = slot13[slot5]

							if not slot13 then
								slot13 = slot11.tf

								if slot13 then
									slot13 = LeanTween
									slot13 = slot13.color
									slot14 = findTF
									slot15 = slot11.tf
									slot16 = "icon"
									slot14 = slot14(slot15, slot16)
									slot15 = Color
									slot15 = slot15.New
									slot16 = 1
									slot17 = 0.6
									slot18 = 0.6
									slot15 = slot15(slot16, slot17, slot18)
									slot16 = 1
									slot13 = slot13(slot14, slot15, slot16)
									slot14 = slot13
									slot13 = slot13.setFromColor
									slot15 = Color
									slot15 = slot15.white
									slot13 = slot13(slot14, slot15)
									slot14 = slot13
									slot13 = slot13.setEase
									slot15 = LeanTweenType
									slot15 = slot15.easeInOutSine
									slot13 = slot13(slot14, slot15)
									slot14 = slot13
									slot13 = slot13.setLoopPingPong
									slot13 = slot13(slot14)
									slot14 = slot0.attachTws
									slot15 = {
										tw = slot13
									}
									slot16 = slot13.uniqueId
									slot15.uniqueId = slot16
									slot14[slot5] = slot15
								end
							end
						else
							slot13 = slot0.attachTws
							slot13 = slot13[slot5]

							if slot13 then
								slot13 = LeanTween
								slot13 = slot13.cancel
								slot14 = slot0.attachTws
								slot14 = slot14[slot5]
								slot14 = slot14.uniqueId

								slot13(slot14)

								slot13 = slot0.attachTws
								slot14 = nil
								slot13[slot5] = slot14
								slot13 = slot11.tf

								if slot13 then
									slot13 = setImageColor
									slot14 = findTF
									slot15 = slot11.tf
									slot16 = "icon"
									slot14 = slot14(slot15, slot16)
									slot15 = Color
									slot15 = slot15.white

									slot13(slot14, slot15)
								end
							end
						end
					else
						slot9 = slot4.attachment
						slot10 = ChapterConst
						slot10 = slot10.AttachBox

						if slot9 == slot10 then
							slot9 = pg
							slot9 = slot9.box_data_template
							slot10 = slot4.attachmentId
							slot9 = slot9[slot10]
							slot10 = "box_"
							slot11 = slot4.attachmentId
							slot10 = slot10 .. slot11
							slot12 = slot7
							slot11 = slot7.Find
							slot13 = slot10
							slot11 = slot11(slot12, slot13)
							slot12 = slot4.flag

							if slot12 == 0 then
								slot12 = IsNil
								slot13 = slot11
								slot12 = slot12(slot13)

								if slot12 then
									slot12 = cloneTplTo
									slot13 = slot0.boxTpl
									slot14 = slot7
									slot15 = slot10
									slot12 = slot12(slot13, slot14, slot15)
									slot11 = slot12
									slot12 = Vector2
									slot13 = 0
									slot14 = 30
									slot12 = slot12(slot13, slot14)
									slot11.anchoredPosition = slot12
									slot12 = PoolMgr
									slot12 = slot12.GetInstance
									slot12 = slot12()
									slot13 = slot12
									slot12 = slot12.GetPrefab
									slot14 = "boxprefab/"
									slot15 = slot9.icon
									slot14 = slot14 .. slot15
									slot15 = slot9.icon
									slot16 = false

									function slot17(slot0)
										slot1 = slot0.transform
										slot2 = slot1
										slot1 = slot1.SetParent
										slot3 = slot0
										slot4 = slot3
										slot3 = slot3.Find
										slot5 = "icon"
										slot3 = slot3(slot4, slot5)
										slot4 = false

										slot1(slot2, slot3, slot4)
									end

									slot12(slot13, slot14, slot15, slot16, slot17)

									slot12 = slot9.type
									slot13 = ChapterConst
									slot13 = slot13.BoxTorpedo

									if slot12 ~= slot13 then
										slot12 = LeanTween
										slot12 = slot12.moveY
										slot13 = slot11
										slot14 = 40
										slot15 = 1.5
										slot12 = slot12(slot13, slot14, slot15)
										slot13 = slot12
										slot12 = slot12.setEase
										slot14 = LeanTweenType
										slot14 = slot14.easeInOutSine
										slot12 = slot12(slot13, slot14)
										slot13 = slot12
										slot12 = slot12.setLoopPingPong
										slot12 = slot12(slot13)
										slot13 = slot0.attachTws
										slot14 = {
											tw = slot12
										}
										slot15 = slot12.uniqueId
										slot14.uniqueId = slot15
										slot13[slot5] = slot14
									end
								end

								setActive(findTF(slot11, "effect_found"), slot4.trait == ChapterConst.TraitVirgin)

								slot12 = slot4.trait
								slot13 = ChapterConst.TraitVirgin

								if slot12 == slot13 then
									slot12 = playSoundEffect
									slot13 = SFX_UI_WEIGHANCHOR_ENEMY

									slot12(slot13)
								end
							end

							slot12 = IsNil
							slot13 = slot11
							slot12 = slot12(slot13)

							if not slot12 then
								setActive(slot11, slot4.flag == 0)
							end

							return
						end

						slot9 = slot4.attachment
						slot10 = ChapterConst
						slot10 = slot10.AttachSupply

						if slot9 == slot10 then
							slot9 = "supply"
							slot11 = slot7
							slot10 = slot7.Find
							slot12 = slot9
							slot10 = slot10(slot11, slot12)
							slot11 = IsNil
							slot12 = slot10
							slot11 = slot11(slot12)

							if slot11 then
								slot11 = cloneTplTo
								slot12 = slot0.supplyTpl
								slot13 = slot7
								slot14 = slot9
								slot11 = slot11(slot12, slot13, slot14)
								slot10 = slot11
								slot11 = Vector2
								slot12 = 0
								slot13 = 30
								slot11 = slot11(slot12, slot13)
								slot10.anchoredPosition = slot11
								slot11 = LeanTween
								slot11 = slot11.moveY
								slot12 = slot10
								slot13 = 40
								slot14 = 1.5
								slot11 = slot11(slot12, slot13, slot14)
								slot12 = slot11
								slot11 = slot11.setEase
								slot13 = LeanTweenType
								slot13 = slot13.easeInOutSine
								slot11 = slot11(slot12, slot13)
								slot12 = slot11
								slot11 = slot11.setLoopPingPong
								slot11 = slot11(slot12)
								slot12 = slot0.attachTws
								slot13 = {
									tw = slot11
								}
								slot14 = slot11.uniqueId
								slot13.uniqueId = slot14
								slot12[slot5] = slot13
							end

							setActive(findTF(slot10, "normal"), slot4.attachmentId > 0)

							slot11 = setActive
							slot12 = findTF
							slot13 = slot10
							slot14 = "empty"
							slot12 = slot12(slot13, slot14)
							slot13 = false

							slot11(slot12, slot13)
						else
							slot9 = slot4.attachment
							slot10 = ChapterConst
							slot10 = slot10.AttachRival

							if slot9 == slot10 then
								slot9 = ChapterConst
								slot9 = slot9.Line2RivalName
								slot10 = slot4.row
								slot11 = slot4.column
								slot9 = slot9(slot10, slot11)
								slot10 = slot0.rivals
								slot10 = slot10[slot9]
								slot11 = slot4.flag

								if slot11 == 0 then
									if not slot10 then
										slot11 = cloneTplTo
										slot12 = slot0.rivalTpl
										slot13 = slot7
										slot14 = slot9
										slot11 = slot11(slot12, slot13, slot14)
										slot12 = Vector2
										slot13 = 0
										slot14 = 0
										slot12 = slot12(slot13, slot14)
										slot11.anchoredPosition = slot12
										slot12 = slot0.rivals
										slot13 = RivalCellView
										slot13 = slot13.New
										slot14 = slot11.gameObject
										slot13 = slot13(slot14)
										slot12[slot9] = slot13
										slot12 = slot0.rivals
										slot10 = slot12[slot9]
										slot13 = slot10
										slot12 = slot10.setLine
										slot14 = {}
										slot15 = slot4.row
										slot14.row = slot15
										slot15 = slot4.column
										slot14.column = slot15

										slot12(slot13, slot14)
									end

									slot10:setAction(ChapterConst.ShipIdleAction)
									slot10:setPrefab(slot4.rival.mainShips[1]:getPrefab())
									slot0:frozen()
									slot10:loadSpine(function ()
										slot0:unfrozen()
									end)
									setActive(slot10.tfEffectFound, slot4.trait == ChapterConst.TraitVirgin)

									slot11 = slot4.trait
									slot12 = ChapterConst.TraitVirgin

									if slot11 == slot12 then
										slot11 = playSoundEffect
										slot12 = SFX_UI_WEIGHANCHOR_ENEMY

										slot11(slot12)
									end

									setActive(slot10.tfFighting, slot3:existFleet(FleetType.Normal, slot1, slot2))
									setText(slot10.tfName, slot4.rival.name)
									setActive(slot10.tfDamageCount, slot4.data > 0)
								else
									slot11 = slot4.flag

									if slot11 == 1 and slot10 then
										slot12 = slot10
										slot11 = slot10.unloadSpine

										slot11(slot12)
									end
								end

								if slot10 then
									setActive(slot10.tf, slot4.flag == 0)
								end
							else
								slot9 = slot4.attachment
								slot10 = ChapterConst
								slot10 = slot10.AttachTransport_Target

								if slot9 == slot10 then
									slot9 = "transport_target"
									slot11 = slot7
									slot10 = slot7.Find
									slot12 = slot9
									slot10 = slot10(slot11, slot12)
									slot11 = IsNil
									slot12 = slot10
									slot11 = slot11(slot12)

									if slot11 then
										slot11 = cloneTplTo
										slot12 = slot0.transportTargetTpl
										slot13 = slot7
										slot14 = slot9
										slot11 = slot11(slot12, slot13, slot14)
										slot10 = slot11
										slot11 = Vector2
										slot12 = 0
										slot13 = 0
										slot11 = slot11(slot12, slot13)
										slot10.anchoredPosition = slot11
										slot11 = LeanTween
										slot11 = slot11.moveY
										slot12 = slot10
										slot13 = 10
										slot14 = 1.5
										slot11 = slot11(slot12, slot13, slot14)
										slot12 = slot11
										slot11 = slot11.setEase
										slot13 = LeanTweenType
										slot13 = slot13.easeInOutSine
										slot11 = slot11(slot12, slot13)
										slot12 = slot11
										slot11 = slot11.setLoopPingPong
										slot11 = slot11(slot12)
										slot12 = slot0.attachTws
										slot13 = {
											tw = slot11
										}
										slot14 = slot11.uniqueId
										slot13.uniqueId = slot14
										slot12[slot9] = slot13
									end
								else
									slot9 = slot4.attachment
									slot10 = ChapterConst
									slot10 = slot10.AttachStory

									if slot9 == slot10 then
										slot9 = slot0.attachmentCells
										slot9 = slot9[slot5]
										slot10 = slot4.data
										slot11 = ChapterConst
										slot11 = slot11.Story

										if slot10 == slot11 then
											if slot9 then
												slot10 = slot9.__cname

												if slot10 ~= "MapEventStoryCellView" then
													slot11 = slot9
													slot10 = slot9.Clear

													slot10(slot11)

													slot9 = nil
												end
											end

											if not slot9 then
												slot10 = MapEventStoryCellView
												slot10 = slot10.New
												slot11 = slot7
												slot10 = slot10(slot11)
												slot9 = slot10
												slot11 = slot9
												slot10 = slot9.SetTpl
												slot12 = slot0.boxTpl

												slot10(slot11, slot12)

												slot10 = slot0.attachmentCells
												slot10[slot5] = slot9
											end

											slot9.info = slot4
											slot11 = slot9
											slot10 = slot9.Update

											slot10(slot11)
										else
											slot10 = slot4.data
											slot11 = ChapterConst
											slot11 = slot11.StoryObstacle

											if slot10 == slot11 then
												if slot9 then
													slot10 = slot9.__cname

													if slot10 ~= "MapEventStoryObstacleCellView" then
														slot11 = slot9
														slot10 = slot9.Clear

														slot10(slot11)

														slot9 = nil
													end
												end

												if not slot9 then
													slot10 = MapEventStoryObstacleCellView
													slot10 = slot10.New
													slot11 = slot7
													slot10 = slot10(slot11)
													slot9 = slot10
													slot10 = slot0.attachmentCells
													slot10[slot5] = slot9
												end

												slot9.info = slot4
												slot11 = slot9
												slot10 = slot9.Update

												slot10(slot11)
											end
										end
									else
										slot9 = slot4.attachment
										slot10 = ChapterConst
										slot10 = slot10.AttachBomb_Enemy

										if slot9 == slot10 then
											slot9 = pg
											slot9 = slot9.specialunit_template
											slot10 = slot4.attachmentId
											slot9 = slot9[slot10]
											slot10 = "bomb_enemy_"
											slot11 = slot4.attachmentId
											slot10 = slot10 .. slot11
											slot11 = "bomb_dead_"
											slot12 = slot4.attachmentId
											slot11 = slot11 .. slot12
											slot13 = slot7
											slot12 = slot7.Find
											slot14 = slot10
											slot12 = slot12(slot13, slot14)
											slot14 = slot7
											slot13 = slot7.Find
											slot15 = slot11
											slot13 = slot13(slot14, slot15)
											slot14 = slot4.flag

											if slot14 == 0 then
												slot14 = IsNil
												slot15 = slot12
												slot14 = slot14(slot15)

												if slot14 then
													cloneTplTo(slot0.bombEnemyTpl, slot7, slot10).anchoredPosition = Vector2(0, 10)

													GetImageSpriteFromAtlasAsync("enemies/" .. slot9.prefab, "", findTF(cloneTplTo(slot0.bombEnemyTpl, slot7, slot10), "icon"))
													setActive(findTF(slot12, "titleContain/bg_s"), slot9.enemy_point == 5)
													setActive(findTF(cloneTplTo(slot0.bombEnemyTpl, slot7, slot10), "titleContain/bg_m"), slot9.enemy_point == 8)
													setActive(findTF(cloneTplTo(slot0.bombEnemyTpl, slot7, slot10), "titleContain/bg_h"), slot9.enemy_point == 10)
												end

												setActive(findTF(slot12, "effect_found"), slot4.trait == ChapterConst.TraitVirgin)

												slot14 = slot4.trait
												slot15 = ChapterConst.TraitVirgin

												if slot14 == slot15 then
													slot14 = playSoundEffect
													slot15 = SFX_UI_WEIGHANCHOR_ENEMY

													slot14(slot15)
												end
											else
												slot14 = slot4.flag

												if slot14 == 1 then
													slot14 = IsNil
													slot15 = slot12
													slot14 = slot14(slot15)

													if not slot14 then
														slot14 = slot12.gameObject
														slot14 = slot14.activeSelf
													else
														slot14 = false

														if false then
															slot14 = true
														end
													end

													slot15 = IsNil
													slot16 = slot13
													slot15 = slot15(slot16)

													if slot15 then
														slot15 = cloneTplTo
														slot16 = slot0.deadTpl
														slot17 = slot7
														slot18 = slot11
														slot15 = slot15(slot16, slot17, slot18)
														slot13 = slot15
														slot15 = Vector2
														slot16 = 0
														slot17 = 10
														slot15 = slot15(slot16, slot17)
														slot13.anchoredPosition = slot15
														slot15 = "blue"
														slot16 = GetImageSpriteFromAtlasAsync
														slot17 = "enemies/"
														slot18 = slot9.prefab
														slot19 = "_d_"
														slot20 = slot15
														slot17 = slot17 .. slot18 .. slot19 .. slot20
														slot18 = ""
														slot20 = slot13
														slot19 = slot13.Find
														slot21 = "icon"

														slot16(slot17, slot18, slot19(slot20, slot21))

														slot16 = setActive
														slot18 = slot13
														slot17 = slot13.Find
														slot19 = "effect_not_open"
														slot17 = slot17(slot18, slot19)
														slot18 = false

														slot16(slot17, slot18)

														slot16 = setActive
														slot18 = slot13
														slot17 = slot13.Find
														slot19 = "effect_open"
														slot17 = slot17(slot18, slot19)
														slot18 = false

														slot16(slot17, slot18)
													end

													slot15 = setActive
													slot17 = slot13
													slot16 = slot13.Find
													slot18 = "huoqiubaozha"
													slot16 = slot16(slot17, slot18)
													slot17 = slot14

													slot15(slot16, slot17)
												end
											end

											slot14 = IsNil
											slot15 = slot12
											slot14 = slot14(slot15)

											if not slot14 then
												setActive(slot12, slot4.flag == 0)
											end

											slot14 = IsNil
											slot15 = slot13
											slot14 = slot14(slot15)

											if not slot14 then
												setActive(slot13, slot4.flag == 1)
											end
										else
											slot9 = slot4.attachment
											slot10 = ChapterConst
											slot10 = slot10.AttachLandbase

											if slot9 == slot10 then
												slot9 = pg
												slot9 = slot9.land_based_template
												slot10 = slot4.attachmentId
												slot9 = slot9[slot10]
												slot10 = slot9.type
												slot11 = ChapterConst
												slot11 = slot11.LBCoastalGun

												if slot10 == slot11 then
													slot10 = "landbase_"
													slot11 = slot4.attachmentId
													slot10 = slot10 .. slot11
													slot11 = "landbase_dead_"
													slot12 = slot4.attachmentId
													slot11 = slot11 .. slot12
													slot13 = slot7
													slot12 = slot7.Find
													slot14 = slot10
													slot12 = slot12(slot13, slot14)
													slot14 = slot7
													slot13 = slot7.Find
													slot15 = slot11
													slot13 = slot13(slot14, slot15)
													slot14 = slot4.flag

													if slot14 == 0 then
														slot14 = IsNil
														slot15 = slot12
														slot14 = slot14(slot15)

														if slot14 then
															slot14 = cloneTplTo
															slot15 = slot0.enemyTpl
															slot16 = slot7
															slot17 = slot10
															slot14 = slot14(slot15, slot16, slot17)
															slot12 = slot14
															slot14 = GetImageSpriteFromAtlasAsync
															slot15 = "enemies/"
															slot16 = slot9.prefab
															slot15 = slot15 .. slot16
															slot16 = ""
															slot17 = findTF
															slot18 = slot12
															slot19 = "icon"

															slot14(slot15, slot16, slot17(slot18, slot19))

															slot14 = setActive
															slot15 = findTF
															slot16 = slot12
															slot17 = "lv"
															slot15 = slot15(slot16, slot17)
															slot16 = false

															slot14(slot15, slot16)

															slot14 = setActive
															slot15 = findTF
															slot16 = slot12
															slot17 = "titleContain"
															slot15 = slot15(slot16, slot17)
															slot16 = false

															slot14(slot15, slot16)

															slot14 = setActive
															slot15 = findTF
															slot16 = slot12
															slot17 = "damage_count"
															slot15 = slot15(slot16, slot17)
															slot16 = false

															slot14(slot15, slot16)

															slot14 = setActive
															slot15 = findTF
															slot16 = slot12
															slot17 = "fighting"
															slot15 = slot15(slot16, slot17)
															slot16 = false

															slot14(slot15, slot16)
														end

														setActive(findTF(slot12, "effect_found"), slot4.trait == ChapterConst.TraitVirgin)

														slot14 = slot4.trait
														slot15 = ChapterConst.TraitVirgin

														if slot14 == slot15 then
															slot14 = playSoundEffect
															slot15 = SFX_UI_WEIGHANCHOR_ENEMY

															slot14(slot15)
														end
													else
														slot14 = slot4.flag

														if slot14 == 1 then
															slot14 = IsNil
															slot15 = slot12
															slot14 = slot14(slot15)

															if not slot14 then
																slot14 = slot12.gameObject
																slot14 = slot14.activeSelf
															else
																slot14 = false

																if false then
																	slot14 = true
																end
															end

															slot15 = IsNil
															slot16 = slot13
															slot15 = slot15(slot16)

															if slot15 then
																slot15 = cloneTplTo
																slot16 = slot0.deadTpl
																slot17 = slot7
																slot18 = slot11
																slot15 = slot15(slot16, slot17, slot18)
																slot13 = slot15
																slot15 = Vector2
																slot16 = 0
																slot17 = 10
																slot15 = slot15(slot16, slot17)
																slot13.anchoredPosition = slot15
																slot15 = "blue"
																slot16 = GetImageSpriteFromAtlasAsync
																slot17 = "enemies/"
																slot18 = slot9.prefab
																slot19 = "_d_"
																slot20 = slot15
																slot17 = slot17 .. slot18 .. slot19 .. slot20
																slot18 = ""
																slot20 = slot13
																slot19 = slot13.Find
																slot21 = "icon"

																slot16(slot17, slot18, slot19(slot20, slot21))

																slot16 = setActive
																slot18 = slot13
																slot17 = slot13.Find
																slot19 = "effect_not_open"
																slot17 = slot17(slot18, slot19)
																slot18 = false

																slot16(slot17, slot18)

																slot16 = setActive
																slot18 = slot13
																slot17 = slot13.Find
																slot19 = "effect_open"
																slot17 = slot17(slot18, slot19)
																slot18 = false

																slot16(slot17, slot18)
															end

															slot15 = setActive
															slot17 = slot13
															slot16 = slot13.Find
															slot18 = "huoqiubaozha"
															slot16 = slot16(slot17, slot18)
															slot17 = slot14

															slot15(slot16, slot17)
														end
													end

													slot14 = IsNil
													slot15 = slot12
													slot14 = slot14(slot15)

													if not slot14 then
														setActive(slot12, slot4.flag == 0)
													end

													slot14 = IsNil
													slot15 = slot13
													slot14 = slot14(slot15)

													if not slot14 then
														setActive(slot13, slot4.flag == 1)
													end
												else
													slot10 = slot9.type
													slot11 = ChapterConst
													slot11 = slot11.LBHarbor

													if slot10 == slot11 then
														slot10 = "box_gangkou"
														slot12 = slot7
														slot11 = slot7.Find
														slot13 = slot10
														slot11 = slot11(slot12, slot13)
														slot12 = slot4.flag

														if slot12 == 0 then
															slot12 = IsNil
															slot13 = slot11
															slot12 = slot12(slot13)

															if slot12 then
																slot12 = cloneTplTo
																slot13 = slot0.boxTpl
																slot14 = slot7
																slot15 = slot10
																slot12 = slot12(slot13, slot14, slot15)
																slot11 = slot12
																slot12 = Vector2
																slot13 = 0
																slot14 = 30
																slot12 = slot12(slot13, slot14)
																slot11.anchoredPosition = slot12
																slot12 = PoolMgr
																slot12 = slot12.GetInstance
																slot12 = slot12()
																slot13 = slot12
																slot12 = slot12.GetPrefab
																slot14 = "boxprefab/gangkou"
																slot15 = "gangkou"
																slot16 = false

																function slot17(slot0)
																	slot1 = slot0.transform
																	slot2 = slot1
																	slot1 = slot1.SetParent
																	slot3 = slot0
																	slot4 = slot3
																	slot3 = slot3.Find
																	slot5 = "icon"
																	slot3 = slot3(slot4, slot5)
																	slot4 = false

																	slot1(slot2, slot3, slot4)
																end

																slot12(slot13, slot14, slot15, slot16, slot17)
															end

															setActive(findTF(slot11, "effect_found"), slot4.trait == ChapterConst.TraitVirgin)

															slot12 = slot4.trait
															slot13 = ChapterConst.TraitVirgin

															if slot12 == slot13 then
																slot12 = playSoundEffect
																slot13 = SFX_UI_WEIGHANCHOR_ENEMY

																slot12(slot13)
															end
														end

														slot12 = IsNil
														slot13 = slot11
														slot12 = slot12(slot13)

														if not slot12 then
															setActive(slot11, slot4.flag == 0)
														end
													else
														slot10 = slot9.type
														slot11 = ChapterConst
														slot11 = slot11.LBDock

														if slot10 == slot11 then
															slot10 = math
															slot10 = slot10.ceil
															slot11 = slot4.data
															slot11 = slot11 / 2
															slot10 = slot10(slot11)
															slot11 = "dock"
															slot13 = slot7
															slot12 = slot7.Find
															slot14 = slot11
															slot12 = slot12(slot13, slot14)
															slot13 = IsNil
															slot14 = slot12
															slot13 = slot13(slot14)

															if slot13 then
																slot13 = cloneTplTo
																slot14 = slot0.dockTpl
																slot15 = slot7
																slot16 = slot11
																slot13 = slot13(slot14, slot15, slot16)
																slot12 = slot13
																slot13 = Vector2
																slot14 = 0
																slot15 = 10
																slot13 = slot13(slot14, slot15)
																slot12.anchoredPosition = slot13
															end

															setActive(slot15, slot3:getRoundNum() < slot10)

															slot12:Find("Slider"):GetComponent(typeof(Slider)).value = math.max(slot3.getRoundNum() - slot10 + slot9.function_args[2], 0) / slot9.function_args[2]
														else
															slot10 = slot9.type
															slot11 = ChapterConst
															slot11 = slot11.LBAntiAir

															if slot10 == slot11 then
																slot10 = math
																slot10 = slot10.ceil
																slot11 = slot4.data
																slot11 = slot11 / 2
																slot10 = slot10(slot11)
																slot11 = "antiAir"
																slot13 = slot7
																slot12 = slot7.Find
																slot14 = slot11
																slot12 = slot12(slot13, slot14)
																slot13 = "chapter_cell_mark_"
																slot14 = slot4.row
																slot15 = "_"
																slot16 = slot4.column
																slot17 = "#AntiAirGunArea"
																slot13 = slot13 .. slot14 .. slot15 .. slot16 .. slot17
																slot14 = slot0.restrictMap
																slot15 = slot14
																slot14 = slot14.Find
																slot16 = slot13
																slot14 = slot14(slot15, slot16)
																slot15 = slot4.flag

																if slot15 ~= 1 then
																	slot15 = IsNil
																	slot16 = slot12
																	slot15 = slot15(slot16)

																	if slot15 then
																		slot15 = cloneTplTo
																		slot16 = slot0.antiairgunTpl
																		slot17 = slot7
																		slot18 = slot11
																		slot15 = slot15(slot16, slot17, slot18)
																		slot12 = slot15
																		slot15 = Vector2
																		slot16 = 0
																		slot17 = 10
																		slot15 = slot15(slot16, slot17)
																		slot12.anchoredPosition = slot15
																	end

																	slot15 = IsNil
																	slot16 = slot14
																	slot15 = slot15(slot16)

																	if slot15 then
																		slot15 = cloneTplTo
																		slot16 = slot0.antiairgunareaTpl
																		slot17 = slot0.restrictMap
																		slot18 = slot13
																		slot15 = slot15(slot16, slot17, slot18)
																		slot14 = slot15
																		slot15 = slot3.theme
																		slot16 = slot15
																		slot15 = slot15.GetLinePosition
																		slot17 = slot4.row
																		slot18 = slot4.column
																		slot15 = slot15(slot16, slot17, slot18)
																		slot16 = slot0.restrictMap
																		slot16 = slot16.anchoredPosition
																		slot17 = Vector2
																		slot18 = slot15.x
																		slot19 = slot16.x
																		slot18 = slot18 - slot19
																		slot19 = slot15.y
																		slot20 = slot16.y
																		slot19 = slot19 - slot20
																		slot17 = slot17(slot18, slot19)
																		slot14.anchoredPosition = slot17
																		slot17 = slot3.theme
																		slot18 = slot9.function_args
																		slot18 = slot18[1]
																		slot19 = slot18 * 2
																		slot19 = slot19 + 1
																		slot20 = slot17.cellSize
																		slot20 = slot20.x
																		slot19 = slot19 * slot20
																		slot20 = slot18 * 2
																		slot21 = slot17.cellSpace
																		slot21 = slot21.x
																		slot20 = slot20 * slot21
																		slot19 = slot19 + slot20
																		slot20 = slot18 * 2
																		slot20 = slot20 + 1
																		slot21 = slot17.cellSize
																		slot21 = slot21.y
																		slot20 = slot20 * slot21
																		slot21 = slot18 * 2
																		slot22 = slot17.cellSpace
																		slot22 = slot22.y
																		slot21 = slot21 * slot22
																		slot20 = slot20 + slot21
																		slot21 = Vector2
																		slot22 = slot19
																		slot23 = slot20
																		slot21 = slot21(slot22, slot23)
																		slot14.sizeDelta = slot21
																	end

																	setActive(slot12, true)
																	setActive(slot17, slot3:getRoundNum() < slot10)

																	slot12:Find("Slider"):GetComponent(typeof(Slider)).value = math.max(slot3.getRoundNum() - slot10 + slot9.function_args[2], 0) / slot9.function_args[2]
																else
																	slot15 = IsNil
																	slot16 = slot12
																	slot15 = slot15(slot16)

																	if not slot15 then
																		slot15 = setActive
																		slot16 = slot12
																		slot17 = false

																		slot15(slot16, slot17)
																	end
																end
															end
														end
													end
												end
											else
												slot9 = slot4.attachment
												slot10 = ChapterConst
												slot10 = slot10.AttachBarrier

												if slot9 == slot10 then
													slot9 = "zulanwangheng"
													slot11 = slot7
													slot10 = slot7.Find
													slot12 = slot9
													slot10 = slot10(slot11, slot12)
													slot11 = slot4.flag

													if slot11 == 0 then
														slot11 = IsNil
														slot12 = slot10
														slot11 = slot11(slot12)

														if slot11 then
															slot11 = cloneTplTo
															slot12 = slot0.barrierTpl
															slot13 = slot7
															slot14 = slot9
															slot11 = slot11(slot12, slot13, slot14)
															slot10 = slot11
														end

														slot11 = setActive
														slot12 = slot10
														slot13 = true

														slot11(slot12, slot13)
													else
														slot11 = slot4.flag

														if slot11 == 1 then
															slot11 = IsNil
															slot12 = slot10
															slot11 = slot11(slot12)

															if not slot11 then
																slot11 = setActive
																slot12 = slot10
																slot13 = false

																slot11(slot12, slot13)
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

slot0.updateAttachment = slot5

function slot5(slot0, slot1, ...)
	if not slot1 then
		slot2 = ChapterConst
		slot1 = slot2.QuadStateNormal
	end

	slot0.quadState = slot1
	slot3 = slot0
	slot2 = slot0.updateQuadBase

	slot2(slot3)

	slot2 = ChapterConst
	slot2 = slot2.QuadStateTeleportSub

	if slot1 == slot2 then
		slot3 = slot0
		slot2 = slot0.UpdateQuadStateTeleportSub

		slot2(slot3, ...)
	else
		slot2 = ChapterConst
		slot2 = slot2.QuadStateFrozen

		if slot1 == slot2 then
		else
			slot2 = ChapterConst
			slot2 = slot2.QuadStateNormal

			if slot1 == slot2 then
				slot3 = slot0
				slot2 = slot0.UpdateQuadStateNormal

				slot2(slot3)
			else
				slot2 = ChapterConst
				slot2 = slot2.QuadStateStrategy

				if slot1 == slot2 then
					slot3 = slot0
					slot2 = slot0.UpdateQuadStateStrategy

					slot2(slot3, ...)
				end
			end
		end
	end
end

slot0.updateQuadCells = slot5

function slot5(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = slot1.fleet

	if slot2 == nil then
		return
	end

	slot4 = slot0
	slot3 = slot0.killPresentTws

	slot3(slot4)

	function slot3(slot0)
		if slot0 then
			slot2 = slot0
			slot1 = slot0.IsWalkable
			slot1 = slot1(slot2)

			if slot1 then
				slot1 = slot0.row
				slot2 = slot0.column
				slot3 = slot0
				slot4 = slot3
				slot3 = slot3.GetObjectsInCell
				slot5 = slot1
				slot6 = slot2
				slot3 = slot3(slot4, slot5, slot6)
				slot4 = slot3.__pairs
				slot5 = slot3
				slot4, slot5, slot6 = slot4(slot5)
				slot7 = slot4
				slot8 = slot3
				slot9 = slot6
				slot7 = slot7(slot8, slot9)
				slot6 = slot7

				if slot6 then
					slot7 = slot3[slot6]
					slot8 = ChapterCell
					slot8 = slot8.Line2QuadName
					slot9 = slot1
					slot10 = slot2
					slot8 = slot8(slot9, slot10)
					slot9 = slot1
					slot9 = slot9.quadRoot
					slot10 = slot9
					slot9 = slot9.Find
					slot11 = slot8
					slot9 = slot9(slot10, slot11)
					slot10 = Vector3
					slot10 = slot10.one
					slot9.localScale = slot10
					slot11 = slot9
					slot10 = slot9.Find
					slot12 = "grid"
					slot10 = slot10(slot11, slot12)
					slot11 = slot10
					slot10 = slot10.GetComponent
					slot12 = typeof
					slot13 = Image
					slot10 = slot10(slot11, slot12(slot13))

					if slot6 == "champion" then
						slot11 = slot7
						slot12 = slot11.flag

						if slot12 == 0 then
							slot12 = slot11.trait
							slot13 = ChapterConst
							slot13 = slot13.TraitLurk

							if slot12 ~= slot13 then
								slot12 = slot0
								slot13 = slot12
								slot12 = slot12.getChampionVisibility
								slot14 = slot11
								slot12 = slot12(slot13, slot14)

								if slot12 then
									slot12 = slot0
									slot13 = slot12
									slot12 = slot12.existFleet
									slot14 = FleetType
									slot14 = slot14.Transport
									slot15 = slot11.row
									slot16 = slot11.column
									slot12 = slot12(slot13, slot14, slot15, slot16)

									if not slot12 then
										slot12 = slot1
										slot13 = slot12
										slot12 = slot12.startQuadTween
										slot14 = slot8
										slot15 = slot9

										slot12(slot13, slot14, slot15)

										slot12 = setImageSprite
										slot13 = slot9
										slot14 = GetSpriteFromAtlas
										slot15 = "chapter/pic/cellgrid"
										slot16 = "cell_enemy"

										slot12(slot13, slot14(slot15, slot16))

										slot12 = setImageSprite
										slot14 = slot9
										slot13 = slot9.Find
										slot15 = "grid"
										slot13 = slot13(slot14, slot15)
										slot14 = GetSpriteFromAtlas
										slot15 = "chapter/pic/cellgrid"
										slot16 = "cell_enemy_grid"

										slot12(slot13, slot14(slot15, slot16))

										slot12 = slot1
										slot12 = slot12.material_Add
										slot10.material = slot12

										return
									end
								end
							end
						end
					end

					if slot6 == "cell" then
						slot11 = ChapterCell
						slot11 = slot11.Line2QuadName
						slot12 = slot1
						slot13 = slot2
						slot11 = slot11(slot12, slot13)
						slot12 = slot0
						slot13 = slot12
						slot12 = slot12.getQuadCellPic
						slot14 = slot0
						slot12 = slot12(slot13, slot14)

						if slot12 then
							slot13 = slot1
							slot14 = slot13
							slot13 = slot13.startQuadTween
							slot15 = slot11
							slot16 = slot9

							slot13(slot14, slot15, slot16)

							if slot12 == "cell_enemy" then
								slot13 = setImageSprite
								slot15 = slot9
								slot14 = slot9.Find
								slot16 = "grid"
								slot14 = slot14(slot15, slot16)
								slot15 = GetSpriteFromAtlas
								slot16 = "chapter/pic/cellgrid"
								slot17 = "cell_enemy_grid"

								slot13(slot14, slot15(slot16, slot17))

								slot13 = slot1
								slot13 = slot13.material_Add
								slot10.material = slot13
							else
								slot13 = setImageSprite
								slot15 = slot9
								slot14 = slot9.Find
								slot16 = "grid"
								slot14 = slot14(slot15, slot16)
								slot15 = GetSpriteFromAtlas
								slot16 = "chapter/pic/cellgrid"
								slot17 = "cell_grid"

								slot13(slot14, slot15(slot16, slot17))

								slot13 = nil
								slot10.material = slot13
							end

							slot13 = setImageSprite
							slot14 = slot9
							slot15 = GetSpriteFromAtlas
							slot16 = "chapter/pic/cellgrid"
							slot17 = slot12

							slot13(slot14, slot15(slot16, slot17))

							return
						end
					end

					slot11 = slot1
					slot12 = slot11
					slot11 = slot11.cancelQuadTween
					slot13 = slot8
					slot14 = slot9

					slot11(slot12, slot13, slot14)

					slot11 = setImageAlpha
					slot12 = slot9
					slot13 = ChapterConst
					slot13 = slot13.CellEaseOutAlpha

					slot11(slot12, slot13)

					slot11 = setImageSprite
					slot12 = slot9
					slot13 = GetSpriteFromAtlas
					slot14 = "chapter/pic/cellgrid"
					slot15 = "cell_normal"

					slot11(slot12, slot13(slot14, slot15))

					slot11 = setImageSprite
					slot13 = slot9
					slot12 = slot9.Find
					slot14 = "grid"
					slot12 = slot12(slot13, slot14)
					slot13 = GetSpriteFromAtlas
					slot14 = "chapter/pic/cellgrid"
					slot15 = "cell_grid"

					slot11(slot12, slot13(slot14, slot15))

					slot11 = nil
					slot10.material = slot11
				end
			end
		end
	end

	slot4 = pairs
	slot5 = slot1.cells
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = slot3
		slot10 = slot8

		slot9(slot10)
	end

	slot4 = {}
	slot5 = ChapterConst
	slot5 = slot5.AttachAreaBoss
	slot4[1] = slot5
	slot5 = ipairs
	slot6 = slot4
	slot5, slot6, slot7 = slot5(slot6)

	for slot8, slot9 in slot5, slot6, slot7 do
		slot11 = slot1
		slot10 = slot1.calcAttachmenArea
		slot12 = slot9
		slot10, slot11, slot12, slot13, slot14, slot15 = slot10(slot11, slot12)
		slot17 = slot1
		slot16 = slot1.getChapterCell
		slot18 = slot11
		slot19 = slot13
		slot16 = slot16(slot17, slot18, slot19)

		if slot16 then
			slot18 = slot16
			slot17 = slot16.IsWalkable
			slot17 = slot17(slot18)

			if slot17 then
				slot17 = ChapterCell
				slot17 = slot17.MinMaxLine2QuadName
				slot18 = slot10
				slot19 = slot12
				slot20 = slot11
				slot21 = slot13
				slot17 = slot17(slot18, slot19, slot20, slot21)
				slot18 = slot0.quadRoot
				slot19 = slot18
				slot18 = slot18.Find
				slot20 = slot17
				slot18 = slot18(slot19, slot20)
				slot19 = IsNil
				slot20 = slot18
				slot19 = slot19(slot20)

				if slot19 then
					slot19 = PoolMgr
					slot19 = slot19.GetInstance
					slot19 = slot19()
					slot20 = slot19
					slot19 = slot19.GetPrefab
					slot21 = "chapter/cell_quad"
					slot22 = ""
					slot23 = false

					function slot24(slot0)
						slot1 = slot0.transform
						slot0 = slot1
					end

					slot19(slot20, slot21, slot22, slot23, slot24)

					slot18.name = slot17
					slot20 = slot18
					slot19 = slot18.SetParent
					slot21 = slot0.quadRoot
					slot22 = false

					slot19(slot20, slot21, slot22)

					slot19 = ChapterCell
					slot19 = slot19.Line2QuadName
					slot20 = slot11
					slot21 = slot13
					slot19 = slot19(slot20, slot21)
					slot20 = slot0.quadRoot
					slot21 = slot20
					slot20 = slot20.Find
					slot22 = slot19
					slot20 = slot20(slot21, slot22)
					slot22 = slot18
					slot21 = slot18.SetSiblingIndex
					slot24 = slot20
					slot23 = slot20.GetSiblingIndex

					slot21(slot22, slot23(slot24))
				end

				slot18.sizeDelta = slot15
				slot19 = slot1.theme
				slot20 = slot19
				slot19 = slot19.GetLinePosition
				slot21 = slot11
				slot22 = slot13
				slot19 = slot19(slot20, slot21, slot22)
				slot20 = Vector3
				slot21 = slot14.x
				slot22 = slot14.y
				slot23 = 0
				slot20 = slot20(slot21, slot22, slot23)
				slot19 = slot19 + slot20
				slot18.anchoredPosition = slot19
			end
		end
	end

	slot6 = slot1
	slot5 = slot1.isPlayingWithBombEnemy
	slot5 = slot5(slot6)

	if slot5 then
		slot6 = slot0
		slot5 = slot0.hideQuadMark
		slot7 = ChapterConst
		slot7 = slot7.MarkBomb

		slot5(slot6, slot7)
	end
end

slot0.updateQuadBase = slot5

function slot5(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = slot1.fleet
	slot3 = {}
	slot5 = slot1
	slot4 = slot1.existMoveLimit
	slot4 = slot4(slot5)

	if slot4 then
		slot5 = slot1
		slot4 = slot1.checkAnyInteractive
		slot4 = slot4(slot5)

		if not slot4 then
			slot5 = slot1
			slot4 = slot1.calcWalkableCells
			slot6 = ChapterConst
			slot6 = slot6.SubjectPlayer
			slot7 = slot2.line
			slot7 = slot7.row
			slot8 = slot2.line
			slot8 = slot8.column
			slot10 = slot2
			slot9 = slot2.getSpeed
			slot4 = slot4(slot5, slot6, slot7, slot8, slot9(slot10))
			slot3 = slot4
		end
	end

	slot4 = #slot3
	slot5 = 0

	if slot4 > slot5 then
		slot4 = _
		slot4 = slot4.min
		slot5 = slot3

		function slot6(slot0)
			slot1 = ManhattonDist
			slot2 = slot0
			slot3 = slot0
			slot3 = slot3.line

			return slot1(slot2, slot3)
		end

		slot4 = slot4(slot5, slot6)
		slot5 = ManhattonDist
		slot6 = slot4
		slot7 = slot2.line
		slot5 = slot5(slot6, slot7)
		slot6 = _
		slot6 = slot6.each
		slot7 = slot3

		function slot8(slot0)
			slot1 = ChapterCell.Line2QuadName(slot0.row, slot0.column)
			slot2 = slot0.quadRoot:Find(slot1)

			slot0:cancelQuadTween(slot1, slot2)
			setImageSprite(slot2, GetSpriteFromAtlas("chapter/pic/cellgrid", "cell_normal"))

			slot2:Find("grid"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("chapter/pic/cellgrid", "cell_grid")
			slot2.Find("grid").GetComponent(typeof(Image)).material = nil
			slot4 = slot1:getRound() == ChapterConst.RoundPlayer
			slot5 = setImageAlpha
			slot6 = slot2

			if slot4 then
				slot7 = 1
			else
				slot7 = ChapterConst
				slot7 = slot7.CellEaseOutAlpha
			end

			slot5(slot6, slot7)

			slot5 = Vector3
			slot5 = slot5.zero
			slot2.localScale = slot5
			slot5 = LeanTween
			slot5 = slot5.scale
			slot6 = slot2
			slot7 = Vector3
			slot7 = slot7.one
			slot8 = 0.2
			slot5 = slot5(slot6, slot7, slot8)
			slot6 = slot5
			slot5 = slot5.setFrom
			slot7 = Vector3
			slot7 = slot7.zero
			slot5 = slot5(slot6, slot7)
			slot6 = slot5
			slot5 = slot5.setEase
			slot7 = LeanTweenType
			slot7 = slot7.easeInOutSine
			slot5 = slot5(slot6, slot7)
			slot6 = slot5
			slot5 = slot5.setDelay
			slot7 = ManhattonDist
			slot8 = slot0
			slot9 = slot2
			slot9 = slot9.line
			slot7 = slot7(slot8, slot9)
			slot8 = slot3
			slot7 = slot7 - slot8
			slot7 = slot7 * 0.1
			slot5 = slot5(slot6, slot7)
			slot6 = slot0
			slot6 = slot6.presentTws
			slot7 = {}
			slot8 = slot5.uniqueId
			slot7.uniqueId = slot8
			slot6[slot1] = slot7
		end

		slot6(slot7, slot8)
	end

	slot5 = slot1
	slot4 = slot1.isPlayingWithBombEnemy
	slot4 = slot4(slot5)

	if slot4 then
		slot4 = slot1.fleet
		slot5 = _
		slot5 = slot5.map
		slot6 = {}
		slot7 = {
			-1,
			0
		}
		slot6[1] = slot7
		slot7 = {
			1,
			0
		}
		slot6[2] = slot7
		slot7 = {
			0,
			-1
		}
		slot6[3] = slot7
		slot7 = {
			0,
			1
		}
		slot6[4] = slot7

		function slot7(slot0)
			slot1 = {}
			slot2 = slot0[1]
			slot3 = slot0
			slot3 = slot3.line
			slot3 = slot3.row
			slot2 = slot2 + slot3
			slot1.row = slot2
			slot2 = slot0[2]
			slot3 = slot0
			slot3 = slot3.line
			slot3 = slot3.column
			slot2 = slot2 + slot3
			slot1.column = slot2

			return slot1
		end

		slot5 = slot5(slot6, slot7)
		slot7 = slot0
		slot6 = slot0.showQuadMark
		slot8 = slot5
		slot9 = ChapterConst
		slot9 = slot9.MarkBomb
		slot10 = "cell_bomb"
		slot11 = Vector2
		slot12 = 100
		slot13 = 100
		slot11 = slot11(slot12, slot13)
		slot12 = nil
		slot13 = true

		slot6(slot7, slot8, slot9, slot10, slot11, slot12, slot13)
	end
end

slot0.UpdateQuadStateNormal = slot5

function slot5(slot0, ...)
	slot2 = slot0.contextData.chapterVO.fleet
	slot0.quadClickProxy = ({
		...
	})[2]
	slot5 = #(()[1] or {})
	slot6 = 0

	if slot5 > slot6 then
		slot5 = _
		slot5 = slot5.min
		slot6 = slot4

		function slot7(slot0)
			slot1 = ManhattonDist
			slot2 = slot0
			slot3 = slot0
			slot3 = slot3.line

			return slot1(slot2, slot3)
		end

		slot5 = slot5(slot6, slot7)
		slot6 = ManhattonDist
		slot7 = slot5
		slot8 = slot2.line
		slot6 = slot6(slot7, slot8)
		slot7 = _
		slot7 = slot7.each
		slot8 = slot4

		function slot9(slot0)
			slot1 = ChapterCell
			slot1 = slot1.Line2QuadName
			slot2 = slot0.row
			slot3 = slot0.column
			slot1 = slot1(slot2, slot3)
			slot2 = slot0
			slot2 = slot2.quadRoot
			slot3 = slot2
			slot2 = slot2.Find
			slot4 = slot1
			slot2 = slot2(slot3, slot4)
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.cancelQuadTween
			slot5 = slot1
			slot6 = slot2

			slot3(slot4, slot5, slot6)

			slot3 = setImageSprite
			slot4 = slot2
			slot5 = GetSpriteFromAtlas
			slot6 = "chapter/pic/cellgrid"
			slot7 = "cell_barrier_select"

			slot3(slot4, slot5(slot6, slot7))

			slot4 = slot2
			slot3 = slot2.Find
			slot5 = "grid"
			slot3 = slot3(slot4, slot5)
			slot4 = slot3
			slot3 = slot3.GetComponent
			slot5 = typeof
			slot6 = Image
			slot3 = slot3(slot4, slot5(slot6))
			slot4 = GetSpriteFromAtlas
			slot5 = "chapter/pic/cellgrid"
			slot6 = "cell_grid"
			slot4 = slot4(slot5, slot6)
			slot3.sprite = slot4
			slot4 = nil
			slot3.material = slot4
			slot4 = setImageAlpha
			slot5 = slot2
			slot6 = 1

			slot4(slot5, slot6)

			slot4 = Vector3
			slot4 = slot4.zero
			slot2.localScale = slot4
			slot4 = LeanTween
			slot4 = slot4.scale
			slot5 = slot2
			slot6 = Vector3
			slot6 = slot6.one
			slot7 = 0.2
			slot4 = slot4(slot5, slot6, slot7)
			slot5 = slot4
			slot4 = slot4.setFrom
			slot6 = Vector3
			slot6 = slot6.zero
			slot4 = slot4(slot5, slot6)
			slot5 = slot4
			slot4 = slot4.setEase
			slot6 = LeanTweenType
			slot6 = slot6.easeInOutSine
			slot4 = slot4(slot5, slot6)
			slot5 = slot4
			slot4 = slot4.setDelay
			slot6 = ManhattonDist
			slot7 = slot0
			slot8 = slot1
			slot8 = slot8.line
			slot6 = slot6(slot7, slot8)
			slot7 = slot2
			slot6 = slot6 - slot7
			slot6 = slot6 * 0.1
			slot4 = slot4(slot5, slot6)
			slot5 = slot0
			slot5 = slot5.presentTws
			slot6 = {}
			slot7 = slot4.uniqueId
			slot6.uniqueId = slot7
			slot5[slot1] = slot6
		end

		slot7(slot8, slot9)
	end
end

slot0.UpdateQuadStateStrategy = slot5

function slot5(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = _
	slot2 = slot2.detect
	slot3 = slot1.fleets

	function slot4(slot0)
		return slot0:getFleetType() == FleetType.Submarine
	end

	slot2 = slot2(slot3, slot4)

	if not slot2 then
		return
	end

	slot4 = slot1
	slot3 = slot1.calcWalkableCells
	slot5 = nil
	slot6 = slot2.line
	slot6 = slot6.row
	slot7 = slot2.line
	slot7 = slot7.column
	slot8 = ChapterConst
	slot8 = slot8.MaxStep
	slot3 = slot3(slot4, slot5, slot6, slot7, slot8)
	slot4 = _
	slot4 = slot4.filter
	slot5 = slot3

	function slot6(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.getQuadCellPic
		slot3 = slot0
		slot4 = slot3
		slot3 = slot3.getChapterCell
		slot5 = slot0.row
		slot6 = slot0.column
		slot1 = slot1(slot2, slot3(slot4, slot5, slot6))
		slot1 = not slot1

		return slot1
	end

	slot4 = slot4(slot5, slot6)
	slot3 = slot4

	function slot4(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.OnTeleportConfirm
		slot3 = slot0

		slot1(slot2, slot3)
	end

	slot0.quadClickProxy = slot4
	slot5 = slot0
	slot4 = slot0.frozen

	slot4(slot5)

	slot4 = 0
	slot5 = _
	slot5 = slot5.each
	slot6 = slot3

	function slot7(slot0)
		slot1 = ChapterCell
		slot1 = slot1.Line2QuadName
		slot2 = slot0.row
		slot3 = slot0.column
		slot1 = slot1(slot2, slot3)
		slot2 = slot0
		slot2 = slot2.quadRoot
		slot3 = slot2
		slot2 = slot2.Find
		slot4 = slot1
		slot2 = slot2(slot3, slot4)
		slot3 = slot0
		slot4 = slot3
		slot3 = slot3.cancelQuadTween
		slot5 = slot1
		slot6 = slot2

		slot3(slot4, slot5, slot6)

		slot3 = setImageAlpha
		slot4 = slot2
		slot5 = 0.4

		slot3(slot4, slot5)

		slot3 = LeanTween
		slot3 = slot3.scale
		slot4 = slot2
		slot5 = Vector3
		slot5 = slot5.one
		slot6 = 0.2
		slot3 = slot3(slot4, slot5, slot6)
		slot4 = slot3
		slot3 = slot3.setFrom
		slot5 = Vector3
		slot5 = slot5.zero
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.setEase
		slot5 = LeanTweenType
		slot5 = slot5.easeInOutSine
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.setOnComplete
		slot5 = System
		slot5 = slot5.Action

		function slot6()
			slot0 = slot0
			slot0 = slot0 + 1
			slot0 = slot0
			slot0 = slot0
			slot1 = slot1
			slot1 = #slot1

			if slot0 == slot1 then
				slot0 = slot2
				slot1 = slot0
				slot0 = slot0.unfrozen

				slot0(slot1)
			end
		end

		slot3 = slot3(slot4, slot5(slot6))
		slot4 = slot0
		slot4 = slot4.presentTws
		slot5 = {}
		slot6 = slot3.uniqueId
		slot5.uniqueId = slot6
		slot4[slot1] = slot5
		slot4 = Vector3
		slot4 = slot4.zero
		slot2.localScale = slot4
	end

	slot5(slot6, slot7)
end

slot0.UpdateQuadStateTeleportSub = slot5

function slot5(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot3 = slot1
	slot2 = slot1.GetSubmarineFleet
	slot2, slot3 = slot2(slot3)
	slot4 = slot0.cellFleets
	slot5 = slot2.id
	slot4 = slot4[slot5]
	slot5 = slot2.startPos
	slot6 = true
	slot0.subTeleportMode = slot6
	slot6 = pairs
	slot7 = slot1.fleets
	slot6, slot7, slot8 = slot6(slot7)

	for slot9, slot10 in slot6, slot7, slot8 do
		slot12 = slot10
		slot11 = slot10.getFleetType
		slot11 = slot11(slot12)
		slot12 = FleetType
		slot12 = slot12.Normal

		if slot11 == slot12 then
			slot12 = slot0
			slot11 = slot0.updateFleet
			slot13 = slot10.id

			slot11(slot12, slot13)
		end
	end

	slot7 = slot1
	slot6 = slot1.existEnemy
	slot8 = ChapterConst
	slot8 = slot8.SubjectPlayer
	slot9 = slot5.row
	slot10 = slot5.column
	slot6 = slot6(slot7, slot8, slot9, slot10)

	if not slot6 then
		slot7 = slot1
		slot6 = slot1.existFleet
		slot8 = FleetType
		slot8 = slot8.Normal
		slot9 = slot5.row
		slot10 = slot5.column
		slot6 = slot6(slot7, slot8, slot9, slot10)
	end

	slot7 = setActive
	slot8 = slot4.tfAmmo

	if not slot6 then
		slot7(slot8, slot1:getDataType() == ChapterConst.TypeNone)
		slot4:SetActive(true)

		slot7 = slot1.subAutoAttack == 1

		if not slot7 then
			slot9 = slot0
			slot8 = slot0.PlaySubAnimation
			slot10 = slot4
			slot11 = false

			function slot12()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.SetActiveModel
				slot2 = slot1
				slot2 = not slot2

				slot0(slot1, slot2)
			end

			slot8(slot9, slot10, slot11, slot12)
		else
			slot9 = slot4
			slot8 = slot4.SetActiveModel
			slot10 = not slot6

			slot8(slot9, slot10)
		end
	end

	slot8 = slot4.tf
	slot9 = slot1.theme
	slot10 = slot9
	slot9 = slot9.GetLinePosition
	slot11 = slot5.row
	slot12 = slot5.column
	slot9 = slot9(slot10, slot11, slot12)
	slot8.localPosition = slot9
	slot9 = slot0
	slot8 = slot0.sortItems

	slot8(slot9)
end

slot0.PrepareSubTeleport = slot5

function slot5(slot0)
	slot0.subTeleportTargetLine = nil

	slot0:hideQuadMark(ChapterConst.MarkMovePathArrow)
	slot0:hideQuadMark(ChapterConst.MarkHuntingRange)
	slot0:ClearEdges()
	slot0:UpdateDestinationMark()

	slot0.subTeleportMode = false
	slot2, slot3 = slot0.contextData.chapterVO.GetSubmarineFleet(slot1)

	slot0.cellFleets[slot2.id]:SetActive(slot0.contextData.chapterVO.subAutoAttack == 1)

	if not slot5 then
		slot7 = slot0
		slot6 = slot0.PlaySubAnimation
		slot8 = slot4
		slot9 = true

		function slot10()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.updateFleet
			slot2 = slot1
			slot2 = slot2.id

			slot0(slot1, slot2)
		end

		slot6(slot7, slot8, slot9, slot10)
	else
		slot7 = slot0
		slot6 = slot0.updateFleet
		slot8 = slot2.id

		slot6(slot7, slot8)
	end

	slot7 = slot0
	slot6 = slot0.ShowHuntingRange

	slot6(slot7)
end

slot0.TurnOffSubTeleport = slot5

function slot5(slot0, slot1)
	slot2 = slot0.contextData
	slot2 = slot2.chapterVO
	slot4 = slot2
	slot3 = slot2.getChapterCell
	slot5 = slot1.row
	slot6 = slot1.column
	slot3 = slot3(slot4, slot5, slot6)

	if slot3 then
		slot5 = slot3
		slot4 = slot3.IsWalkable
		slot4 = slot4(slot5)

		if slot4 then
			slot5 = slot2
			slot4 = slot2.existBarrier
			slot6 = slot1.row
			slot7 = slot1.column
			slot4 = slot4(slot5, slot6, slot7)

			if not slot4 then
				slot5 = slot2
				slot4 = slot2.GetSubmarineFleet
				slot4, slot5 = slot4(slot5)
				slot6 = slot4.startPos
				slot6 = slot6.row
				slot7 = slot1.row

				if slot6 == slot7 then
					slot6 = slot4.startPos
					slot6 = slot6.column
					slot7 = slot1.column

					if slot6 == slot7 then
						return
					end
				end

				slot7 = slot2
				slot6 = slot2.findPath
				slot8 = nil
				slot9 = slot4.startPos
				slot10 = slot1
				slot6, slot7 = slot6(slot7, slot8, slot9, slot10)
				slot8 = slot1.row
				slot9 = #slot7
				slot9 = slot7[slot9]
				slot9 = slot9.row

				if slot8 == slot9 then
					slot8 = slot1.column
					slot9 = #slot7
					slot9 = slot7[slot9]
					slot9 = slot9.column

					if slot8 ~= slot9 then
						return
					end
				end

				slot9 = slot0
				slot8 = slot0.ShowTargetHuntingRange
				slot10 = slot1

				slot8(slot9, slot10)

				slot9 = slot0
				slot8 = slot0.UpdateDestinationMark
				slot10 = slot1

				slot8(slot9, slot10)

				slot9 = slot0
				slot8 = slot0.hideQuadMark
				slot10 = ChapterConst
				slot10 = slot10.MarkMovePathArrow

				slot8(slot9, slot10)

				slot8 = 0

				if slot6 > slot8 then
					slot9 = slot0
					slot8 = slot0.ShowPathInArrows
					slot10 = slot7

					slot8(slot9, slot10)

					slot0.subTeleportTargetLine = slot1
				end
			end
		end
	end
end

slot0.OnTeleportConfirm = slot5

function slot5(slot0, slot1)
	slot2 = slot0.contextData
	slot2 = slot2.chapterVO
	slot3, slot4 = nil
	slot5 = Clone
	slot6 = slot1
	slot5 = slot5(slot6)
	slot6 = table
	slot6 = slot6.remove
	slot7 = slot5
	slot8 = #slot5

	slot6(slot7, slot8)

	slot7 = slot2
	slot6 = slot2.GetSubmarineFleet
	slot6, slot7 = slot6(slot7)
	slot8 = slot0.cellFleets
	slot9 = slot6.id
	slot4 = slot8[slot9]
	slot8 = #slot5
	slot9 = 1
	slot10 = -1

	for slot11 = slot8, slot9, slot10 do
		slot12 = slot5[slot11]
		slot14 = slot2
		slot13 = slot2.existEnemy
		slot15 = ChapterConst
		slot15 = slot15.SubjectPlayer
		slot16 = slot12.row
		slot17 = slot12.column
		slot13 = slot13(slot14, slot15, slot16, slot17)

		if not slot13 then
			slot14 = slot2
			slot13 = slot2.getFleet
			slot15 = FleetType
			slot15 = slot15.Normal
			slot16 = slot12.row
			slot17 = slot12.column
			slot13 = slot13(slot14, slot15, slot16, slot17)
		end

		if slot13 then
			slot14 = table
			slot14 = slot14.remove
			slot15 = slot5
			slot16 = slot11

			slot14(slot15, slot16)
		end
	end

	slot9 = slot0
	slot8 = slot0.showQuadMark
	slot10 = slot5
	slot11 = ChapterConst
	slot11 = slot11.MarkMovePathArrow
	slot12 = "cell_path_arrow"
	slot13 = Vector2
	slot14 = 100
	slot15 = 100
	slot13 = slot13(slot14, slot15)
	slot14 = nil
	slot15 = true

	slot8(slot9, slot10, slot11, slot12, slot13, slot14, slot15)

	slot8 = #slot1
	slot9 = 1
	slot10 = -1

	for slot11 = slot8, slot9, slot10 do
		slot12 = slot1[slot11]
		slot13 = ChapterCell
		slot13 = slot13.Line2MarkName
		slot14 = slot12.row
		slot15 = slot12.column
		slot16 = ChapterConst
		slot16 = slot16.MarkMovePathArrow
		slot13 = slot13(slot14, slot15, slot16)
		slot14 = slot0.markQuads
		slot14 = slot14[slot13]

		if slot14 then
			slot14.localEulerAngles = Vector3(0, 0, Mathf.Acos(slot17) * Mathf.Rad2Deg * ((Vector3.Cross(Vector3.up, slot16).z > 0 and 1) or -1))
		end
	end
end

slot0.ShowPathInArrows = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0.presentTws
	slot5 = slot5[slot1]

	if slot5 then
		slot5 = LeanTween
		slot5 = slot5.cancel
		slot6 = slot0.presentTws
		slot6 = slot6[slot1]
		slot6 = slot6.uniqueId

		slot5(slot6)

		slot5 = slot0.presentTws
		slot6 = nil
		slot5[slot1] = slot6
	end

	slot5 = slot0.quadTws
	slot5 = slot5[slot1]

	if not slot5 then
		slot3 = slot3 or 1

		if not slot4 then
			slot5 = ChapterConst
			slot4 = slot5.CellEaseOutAlpha
		end

		slot5 = setImageAlpha
		slot6 = slot2
		slot7 = slot3

		slot5(slot6, slot7)

		slot5 = LeanTween
		slot5 = slot5.alpha
		slot6 = slot2
		slot7 = slot4
		slot8 = 1
		slot5 = slot5(slot6, slot7, slot8)
		slot6 = slot5
		slot5 = slot5.setLoopPingPong
		slot5 = slot5(slot6)
		slot6 = slot0.quadTws
		slot7 = {
			tw = slot5
		}
		slot8 = slot5.uniqueId
		slot7.uniqueId = slot8
		slot6[slot1] = slot7
	end
end

slot0.startQuadTween = slot5

function slot5(slot0, slot1, slot2)
	slot3 = slot0.quadTws
	slot3 = slot3[slot1]

	if slot3 then
		slot3 = LeanTween
		slot3 = slot3.cancel
		slot4 = slot0.quadTws
		slot4 = slot4[slot1]
		slot4 = slot4.uniqueId

		slot3(slot4)

		slot3 = slot0.quadTws
		slot4 = nil
		slot3[slot1] = slot4
	end

	slot3 = setImageAlpha
	slot4 = slot2
	slot5 = ChapterConst
	slot5 = slot5.CellEaseOutAlpha

	slot3(slot4, slot5)
end

slot0.cancelQuadTween = slot5

function slot5(slot0)
	slot1 = pairs
	slot2 = slot0.quadTws
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = LeanTween
		slot6 = slot6.cancel
		slot7 = slot5.uniqueId

		slot6(slot7)
	end

	slot1 = {}
	slot0.quadTws = slot1
end

slot0.killQuadTws = slot5

function slot5(slot0)
	slot1 = pairs
	slot2 = slot0.presentTws
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = LeanTween
		slot6 = slot6.cancel
		slot7 = slot5.uniqueId

		slot6(slot7)
	end

	slot1 = {}
	slot0.presentTws = slot1
end

slot0.killPresentTws = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0.markTws
	slot5 = slot5[slot1]

	if not slot5 then
		setImageAlpha(slot2, slot3 or 1)

		slot0.markTws[slot1] = {
			tw = LeanTween.alpha(slot2, slot4, 0.7):setLoopPingPong():setEase(LeanTweenType.easeInOutSine):setDelay(1),
			uniqueId = LeanTween.alpha(slot2, slot4, 0.7).setLoopPingPong().setEase(LeanTweenType.easeInOutSine).setDelay(1).uniqueId
		}
	end
end

slot0.startMarkTween = slot5

function slot5(slot0, slot1, slot2, slot3)
	slot4 = slot0.markTws
	slot4 = slot4[slot1]

	if slot4 then
		slot4 = LeanTween
		slot4 = slot4.cancel
		slot5 = slot0.markTws
		slot5 = slot5[slot1]
		slot5 = slot5.uniqueId

		slot4(slot5)

		slot4 = slot0.markTws
		slot5 = nil
		slot4[slot1] = slot5
	end

	slot4 = setImageAlpha
	slot5 = slot2

	if not slot3 then
		slot6 = ChapterConst
		slot6 = slot6.CellEaseOutAlpha
	end

	slot4(slot5, slot6)
end

slot0.cancelMarkTween = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0.contextData
	slot5 = slot5.chapterVO
	slot7 = slot5
	slot6 = slot5.getDataType
	slot6 = slot6(slot7)
	slot7 = slot5.fleet
	slot8 = slot5.fleets
	slot9 = slot5.findex
	slot8 = slot8[slot9]
	slot8 = slot8.id
	slot9 = slot0.cellFleets
	slot9 = slot9[slot8]
	slot11 = slot0
	slot10 = slot0.SetSpineVisible
	slot12 = slot9.tfShip
	slot13 = true

	slot10(slot11, slot12, slot13)

	slot10 = setActive
	slot11 = slot9.tfShadow
	slot12 = true

	slot10(slot11, slot12)

	slot10 = setActive
	slot11 = slot0.arrowTarget
	slot12 = true

	slot10(slot11, slot12)

	slot11 = slot0
	slot10 = slot0.updateTargetArrow
	slot12 = #slot2
	slot12 = slot2[slot12]

	slot10(slot11, slot12)

	if slot3 then
		slot11 = slot0
		slot10 = slot0.updateAttachment
		slot12 = slot3.row
		slot13 = slot3.column

		slot10(slot11, slot12, slot13)
	end

	function slot10(slot0)
		slot1 = slot0
		slot2 = ChapterConst
		slot2 = slot2.TypeNone

		if slot1 == slot2 then
			slot1 = slot1
			slot2 = slot1
			slot2 = slot2.step
			slot2 = slot2 + 1
			slot1.step = slot2
		end

		slot1 = slot2
		slot1 = slot1.onShipStepChange

		if slot1 then
			slot1 = slot2
			slot1 = slot1.onShipStepChange
			slot2 = slot0

			slot1(slot2)
		end
	end

	function slot11(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.sortItems

		slot1(slot2)
	end

	function slot12()
		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.arrowTarget
		slot2 = false

		slot0(slot1, slot2)

		slot0 = slot1
		slot0 = slot0.fleet
		slot0 = slot0.line
		slot1 = slot1
		slot2 = slot1
		slot1 = slot1.getChapterCell
		slot3 = slot0.row
		slot4 = slot0.column
		slot1 = slot1(slot2, slot3, slot4)
		slot2 = slot2
		slot3 = ChapterConst
		slot3 = slot3.TypeNone

		if slot2 == slot3 then
			slot2 = ChapterConst
			slot2 = slot2.NeedClearStep
			slot3 = slot1
			slot2 = slot2(slot3)

			if slot2 then
				slot2 = slot3
				slot3 = 0
				slot2.step = slot3
			end
		end

		slot2 = slot4
		slot3 = slot2
		slot2 = slot2.getModel
		slot2 = slot2(slot3)

		if slot2 then
			slot2 = slot3
			slot3 = slot4
			slot4 = slot3
			slot3 = slot3.getModel
			slot3 = slot3(slot4)
			slot3 = slot3.transform
			slot3 = slot3.localRotation
			slot2.rotation = slot3
		end

		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.updateAttachment
		slot4 = slot0.row
		slot5 = slot0.column

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.updateFleet
		slot4 = slot5

		slot2(slot3, slot4)

		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.updateOni

		slot2(slot3)

		slot2 = slot1
		slot3 = slot2
		slot2 = slot2.getChampionIndex
		slot4 = slot0.row
		slot5 = slot0.column
		slot2 = slot2(slot3, slot4, slot5)

		if slot2 then
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.updateChampion
			slot5 = slot2

			slot3(slot4, slot5)
		end

		slot3 = slot0
		slot3 = slot3.onShipArrived

		if slot3 then
			slot3 = slot0
			slot3 = slot3.onShipArrived

			slot3()
		end

		slot3 = slot6

		if slot3 then
			slot3 = slot6

			slot3()
		end
	end

	slot14 = slot0
	slot13 = slot0.updateQuadCells
	slot15 = ChapterConst
	slot15 = slot15.QuadStateFrozen

	slot13(slot14, slot15)

	slot14 = slot0
	slot13 = slot0.moveCellView
	slot15 = slot9
	slot16 = slot1
	slot17 = slot2
	slot18 = slot10
	slot19 = slot11
	slot20 = slot12

	slot13(slot14, slot15, slot16, slot17, slot18, slot19, slot20)
end

slot0.moveFleet = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0.contextData
	slot5 = slot5.chapterVO
	slot6 = slot5.fleets
	slot6 = slot6[slot1]
	slot7 = slot0.cellFleets
	slot8 = slot6.id
	slot7 = slot7[slot8]
	slot8 = #slot2
	slot8 = slot2[slot8]

	function slot9(slot0)
		return
	end

	function slot10(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.sortItems

		slot1(slot2)
	end

	function slot11()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.existEnemy
		slot2 = ChapterConst
		slot2 = slot2.SubjectPlayer
		slot3 = slot1
		slot3 = slot3.row
		slot4 = slot1
		slot4 = slot4.column
		slot0 = slot0(slot1, slot2, slot3, slot4)

		if not slot0 then
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.existAlly
			slot2 = slot2
			slot0 = slot0(slot1, slot2)
		end

		slot1 = slot3
		slot2 = slot1
		slot1 = slot1.SetActiveModel
		slot3 = not slot0

		slot1(slot2, slot3)

		slot1 = slot3
		slot2 = slot1
		slot1 = slot1.getModel
		slot1 = slot1(slot2)

		if slot1 then
			slot1 = slot2
			slot2 = slot3
			slot3 = slot2
			slot2 = slot2.getModel
			slot2 = slot2(slot3)
			slot2 = slot2.transform
			slot2 = slot2.localRotation
			slot1.rotation = slot2
		end

		slot1 = slot4

		if slot1 then
			slot1 = slot4

			slot1()
		end
	end

	slot13 = slot0
	slot12 = slot0.updateQuadCells
	slot14 = ChapterConst
	slot14 = slot14.QuadStateFrozen

	slot12(slot13, slot14)

	slot13 = slot0
	slot12 = slot0.teleportSubView
	slot14 = slot7
	slot16 = slot7
	slot15 = slot7.getLine
	slot15 = slot15(slot16)
	slot16 = slot8
	slot17 = slot9
	slot18 = slot10
	slot19 = slot11

	slot12(slot13, slot14, slot15, slot16, slot17, slot18, slot19)
end

slot0.moveSub = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0.contextData
	slot5 = slot5.chapterVO
	slot6 = slot5.champions
	slot6 = slot6[slot1]
	slot7 = slot0.cellChampions
	slot7 = slot7[slot1]

	function slot8(slot0)
		return
	end

	function slot9(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.sortItems

		slot1(slot2)
	end

	function slot10()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.getModel
		slot0 = slot0(slot1)

		if slot0 then
			slot0 = slot1
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.getModel
			slot1 = slot1(slot2)
			slot1 = slot1.transform
			slot1 = slot1.localRotation
			slot0.rotation = slot1
		end

		slot0 = slot2

		if slot0 then
			slot0 = slot2

			slot0()
		end
	end

	slot11 = slot0.championTws
	slot11 = slot11[slot1]

	if slot11 then
		slot11 = LeanTween
		slot11 = slot11.cancel
		slot12 = slot0.championTws
		slot12 = slot12[slot1]
		slot12 = slot12.uniqueId

		slot11(slot12)

		slot11 = slot0.championTws
		slot12 = nil
		slot11[slot1] = slot12
	end

	slot12 = slot5
	slot11 = slot5.getChampionVisibility
	slot13 = slot6
	slot11 = slot11(slot12, slot13)

	if slot11 then
		slot12 = slot7
		slot11 = slot7.SetActive
		slot13 = true

		slot11(slot12, slot13)

		slot12 = slot0
		slot11 = slot0.moveCellView
		slot13 = slot7
		slot14 = slot2
		slot15 = slot3
		slot16 = slot8
		slot17 = slot9
		slot18 = slot10

		slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18)
	else
		slot11 = #slot2
		slot11 = slot2[slot11]
		slot12 = slot5.theme
		slot13 = slot12
		slot12 = slot12.GetLinePosition
		slot14 = slot11.row
		slot15 = slot11.column
		slot12 = slot12(slot13, slot14, slot15)
		slot14 = slot7
		slot13 = slot7.setLine
		slot15 = slot11

		slot13(slot14, slot15)

		slot13 = slot7.tf
		slot13.localPosition = slot12
		slot13 = slot10

		slot13()
	end
end

slot0.moveChampion = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0.contextData
	slot5 = slot5.chapterVO
	slot6 = slot5.fleets
	slot6 = slot6[slot1]
	slot7 = slot0.cellFleets
	slot8 = slot6.id
	slot7 = slot7[slot8]

	function slot8(slot0)
		return
	end

	function slot9(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.sortItems

		slot1(slot2)
	end

	function slot10()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.getModel
		slot0 = slot0(slot1)

		if slot0 then
			slot0 = slot1
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.getModel
			slot1 = slot1(slot2)
			slot1 = slot1.transform
			slot1 = slot1.localRotation
			slot0.rotation = slot1
		end

		slot0 = slot2
		slot1 = slot0
		slot0 = slot0.updateFleet
		slot2 = slot1
		slot2 = slot2.id

		slot0(slot1, slot2)

		slot0 = slot3

		if slot0 then
			slot0 = slot3

			slot0()
		end
	end

	slot12 = slot0
	slot11 = slot0.updateQuadCells
	slot13 = ChapterConst
	slot13 = slot13.QuadStateFrozen

	slot11(slot12, slot13)

	slot12 = slot0
	slot11 = slot0.moveCellView
	slot13 = slot7
	slot14 = slot2
	slot15 = slot3
	slot16 = slot8
	slot17 = slot9
	slot18 = slot10

	slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18)
end

slot0.moveTransport = slot5

function slot5(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = slot0.contextData
	slot7 = slot7.chapterVO
	slot8 = nil
	slot9 = coroutine
	slot9 = slot9.wrap

	function slot10()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.frozen

		slot0(slot1)

		slot0 = slot0
		slot0 = slot0.contextData
		slot0 = slot0.chapterVO
		slot2 = slot0
		slot1 = slot0.GetQuickPlayFlag
		slot1 = slot1(slot2)

		if slot1 then
			slot4 = 0.1 * (ChapterConst.ShipStepQuickPlayScale or 1)
			slot5 = 0

			table.insert(slot1, 1, slot2:getLine())
			_.each(slot1, function (slot0)
				if ChapterConst.NeedEasePathCell(slot0:getChapterCell(slot0.row, slot0.column)) then
					slot2 = ChapterCell.Line2QuadName(slot1.row, slot1.column)
					slot3 = slot1.quadRoot:Find(slot2)

					slot1:cancelQuadTween(slot2, slot3)
					LeanTween.alpha(slot3, 1, slot2):setDelay(slot3)

					slot3 = slot3 + 
				end
			end)
			_.each(slot3, function (slot0)
				slot0:moveStep(slot0.moveStep, slot0, slot2[#slot2], function ()
					if ChapterConst.NeedEasePathCell(slot0:getChapterCell(slot0:getLine().row, slot0.getLine().column)) then
						LeanTween.scale(slot2.quadRoot:Find(slot2), Vector3.zero, )
					end

					slot4(slot5)
				end, function ()
					slot0:setLine(slot0)
					slot2(slot0)
					slot3()
				end)
				coroutine.yield()
			end)
			_.each(slot1, function (slot0)
				if ChapterConst.NeedEasePathCell(slot0:getChapterCell(slot0.row, slot0.column)) then
					slot3 = slot1.quadRoot:Find(slot2)

					LeanTween.cancel(slot3.gameObject)
					setImageAlpha(slot3, ChapterConst.CellEaseOutAlpha)

					slot3.localScale = Vector3.one
				end
			end)
			slot2:setAction(ChapterConst.ShipIdleAction)
			slot7()
			slot0:unfrozen()

			return
		end
	end

	slot9 = slot9(slot10)
	slot8 = slot9
	slot9 = slot8

	slot9()
end

slot0.moveCellView = slot5

function slot5(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot0.contextData
	slot6 = slot6.chapterVO
	slot8 = slot6
	slot7 = slot6.GetQuickPlayFlag
	slot7 = slot7(slot8)

	if slot7 then
		slot7 = ChapterConst.ShipStepQuickPlayScale or 1
		slot9 = slot1:getAction()
		slot10 = slot1:getLine()
		slot11 = IsNil(slot1:getModel())

		if not slot11 then
			slot11 = ChapterConst
			slot11 = slot11.ShipMoveAction

			if slot9 ~= slot11 then
				slot12 = slot1
				slot11 = slot1.setAction
				slot13 = ChapterConst
				slot13 = slot13.ShipMoveAction

				slot11(slot12, slot13)
			end

			slot11 = slot2.column
			slot12 = slot10.column

			if slot11 == slot12 then
				slot11 = slot3.column
				slot12 = slot10.column

				if slot11 ~= slot12 then
					slot11 = slot8.transform
					slot12 = Quaternion
					slot12 = slot12.identity
					slot11.localRotation = slot12
					slot11 = slot2.column
					slot12 = slot10.column

					if slot11 >= slot12 then
						slot11 = slot2.column
						slot12 = slot10.column

						if slot11 == slot12 then
							slot11 = slot3.column
							slot12 = slot10.column

							if slot11 < slot12 then
								slot11 = slot8.transform
								slot12 = Quaternion
								slot12 = slot12.Euler
								slot13 = 0
								slot14 = 180
								slot15 = 0
								slot12 = slot12(slot13, slot14, slot15)
								slot11.localRotation = slot12
							end
						end
					end
				end
			end
		end
	end

	slot11 = slot1.tf
	slot11 = slot11.localPosition
	slot12 = slot6.theme
	slot13 = slot12
	slot12 = slot12.GetLinePosition
	slot14 = slot2.row
	slot15 = slot2.column
	slot12 = slot12(slot13, slot14, slot15)
	slot13 = 0
	slot14 = LeanTween
	slot14 = slot14.value
	slot15 = slot1.go
	slot16 = 0
	slot17 = 1
	slot18 = ChapterConst
	slot18 = slot18.ShipStepDuration
	slot18 = slot18 * slot7
	slot14 = slot14(slot15, slot16, slot17, slot18)
	slot15 = slot14
	slot14 = slot14.setOnComplete
	slot16 = System
	slot16 = slot16.Action
	slot17 = slot5
	slot14 = slot14(slot15, slot16(slot17))
	slot15 = slot14
	slot14 = slot14.setOnUpdate
	slot16 = System
	slot16 = slot16.Action_float

	function slot17(slot0)
		slot1 = slot0
		slot1 = slot1.tf
		slot2 = Vector3
		slot2 = slot2.Lerp
		slot3 = slot1
		slot4 = slot2
		slot5 = slot0
		slot2 = slot2(slot3, slot4, slot5)
		slot1.localPosition = slot2
		slot1 = slot3
		slot2 = 0.5

		if slot1 <= slot2 then
			slot1 = 0.5

			if slot0 > slot1 then
				slot1 = slot4

				slot1()
			end
		end

		slot3 = slot0
	end

	slot14(slot15, slot16(slot17))
end

slot0.moveStep = slot5

function slot5(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = slot0.contextData
	slot7 = slot7.chapterVO

	function slot8()
		slot0 = slot0
		slot1 = slot1

		slot0(slot1)

		slot0 = slot2
		slot1 = slot0
		slot0 = slot0.setLine
		slot2 = slot1

		slot0(slot1, slot2)

		slot0 = slot3
		slot0 = slot0.theme
		slot1 = slot0
		slot0 = slot0.GetLinePosition
		slot2 = slot1
		slot2 = slot2.row
		slot3 = slot1
		slot3 = slot3.column
		slot0 = slot0(slot1, slot2, slot3)
		slot1 = slot2
		slot1 = slot1.tf
		slot1.localPosition = slot0
		slot1 = slot4
		slot2 = slot1

		slot1(slot2)

		slot1 = slot5
		slot2 = slot1
		slot1 = slot1.PlaySubAnimation
		slot3 = slot2
		slot4 = false
		slot5 = slot6

		slot1(slot2, slot3, slot4, slot5)
	end

	slot10 = slot0
	slot9 = slot0.PlaySubAnimation
	slot11 = slot1
	slot12 = true
	slot13 = slot8

	slot9(slot10, slot11, slot12, slot13)
end

slot0.teleportSubView = slot5

function slot5(slot0, slot1, slot2, slot3)
	slot4 = slot0.contextData
	slot4 = slot4.chapterVO
	slot6 = slot4
	slot5 = slot4.getChampionIndex
	slot7 = slot1.row
	slot8 = slot1.column
	slot5 = slot5(slot6, slot7, slot8)

	if slot5 then
		slot6 = 0

		if slot5 <= slot6 then
			if slot3 then
				slot6 = slot3

				slot6()
			end

			return
		end
	end

	slot6 = slot0.cellChampions
	slot6 = slot6[slot5]

	if not slot6 then
		if slot3 then
			slot7 = slot3

			slot7()
		end

		return
	end

	slot8 = slot0
	slot7 = slot0.PlaySubAnimation
	slot9 = slot6
	slot10 = slot2
	slot11 = slot3

	slot7(slot8, slot9, slot10, slot11)
end

slot0.PlayChampionSubmarineAnimation = slot5

function slot5(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-16, warpins: 1 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-31, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 35-36, warpins: 2 ---
	slot5 = slot1
	slot4 = slot1.getModel
	slot4 = slot4(slot5)

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot5 = slot0.contextData
	slot5 = slot5.chapterVO
	slot7 = slot4
	slot6 = slot4.GetComponent
	slot8 = "SkeletonGraphic"
	slot6 = slot6(slot7, slot8)
	slot8 = slot1
	slot7 = slot1.setAction

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-20, warpins: 1 ---
		slot9 = ChapterConst
		slot9 = slot9.ShipSwimAction

		if not slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-22, warpins: 2 ---
			slot9 = ChapterConst
			slot9 = slot9.ShipIdleAction
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot7(slot8, slot9)

	slot8 = slot1
	slot7 = slot1.PlayShuiHua

	slot7(slot8)

	slot8 = slot5
	slot7 = slot5.GetQuickPlayFlag
	slot7 = slot7(slot8)

	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-33, warpins: 1 ---
		slot7 = 0.1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-34, warpins: 1 ---
		slot7 = 0.3
		--- END OF BLOCK #0 ---



	end

	slot8 = (slot2 and 1) or 0
	slot0.tweens[LeanTween.value(slot4, (slot2 and 1) or 0, slot9, slot7):setEase(LeanTweenType.easeInOutSine):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-26, warpins: 1 ---
		slot0.color = Color.Lerp(Color.New(1, 1, 1, 0), Color.New(1, 1, 1, 1), slot0)

		if not IsNil(slot1.tfAmmo) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-35, warpins: 1 ---
			slot1.tfAmmo.anchoredPosition = Vector2.Lerp(Vector2.Lerp, , slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 36-36, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0:SetActiveModel(not slot1)

		if not slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-11, warpins: 1 ---
			slot2()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-12, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)).id] = true

	return

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #4 37-38, warpins: 1 ---
	slot8 = 1

	if 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-39, warpins: 1 ---
		slot8 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 40-41, warpins: 2 ---
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #6 42-43, warpins: 1 ---
	slot9 = 0

	if 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-44, warpins: 1 ---
		slot9 = 1
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 45-76, warpins: 2 ---
	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 77-77, warpins: 2 ---
	--- END OF BLOCK #8 ---



end

slot0.PlaySubAnimation = slot5

function slot5(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = slot1.fleets
	slot3 = slot1.findex
	slot2 = slot2[slot3]
	slot2 = slot2.id
	slot3 = slot0.cellFleets
	slot3 = slot3[slot2]

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-15, warpins: 1 ---
		slot5 = slot0
		slot4 = slot0.cameraFocus
		slot6 = slot3.tf
		slot6 = slot6.position

		slot4(slot5, slot6)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.adjustCameraFocus = slot5

function slot5(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot3 = ChapterCell
	slot3 = slot3.Line2Name
	slot4 = slot1.row
	slot5 = slot1.column
	slot3 = slot3(slot4, slot5)
	slot4 = slot0.cellRoot
	slot5 = slot4
	slot4 = slot4.Find
	slot6 = slot3
	slot4 = slot4(slot5, slot6)
	slot6 = slot0
	slot5 = slot0.cameraFocus
	slot7 = slot4.position
	slot8 = slot2

	slot5(slot6, slot7, slot8)

	return
	--- END OF BLOCK #0 ---



end

slot0.focusOnCell = slot5

function slot5(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-85, warpins: 1 ---
	slot3 = slot0.contextData
	slot3 = slot3.chapterVO
	slot4 = slot3.theme
	slot5 = slot0._tf
	slot6 = slot5
	slot5 = slot5.Find
	slot7 = ChapterConst
	slot7 = slot7.PlaneName
	slot5 = slot5(slot6, slot7)
	slot6 = slot0._tf
	slot6 = slot6.parent
	slot7 = slot6
	slot6 = slot6.InverseTransformVector
	slot8 = slot5.position
	slot8 = slot1 - slot8
	slot6 = slot6(slot7, slot8)
	slot7 = slot6.x
	slot8 = slot5.localPosition
	slot8 = slot8.x
	slot7 = slot7 + slot8
	slot6.x = slot7
	slot7 = slot6.y
	slot8 = slot5.localPosition
	slot8 = slot8.y
	slot7 = slot7 + slot8
	slot8 = slot5.localPosition
	slot8 = slot8.z
	slot9 = math
	slot9 = slot9.tan
	slot10 = math
	slot10 = slot10.pi
	slot10 = slot10 / 180
	slot11 = slot4.angle
	slot10 = slot10 * slot11
	slot9 = slot9(slot10)
	slot8 = slot8 * slot9
	slot7 = slot7 - slot8
	slot6.y = slot7
	slot7 = math
	slot7 = slot7.clamp
	slot8 = slot6.x
	slot8 = -slot8
	slot9 = slot0.rightExtend
	slot9 = -slot9
	slot10 = slot0.leftExtend
	slot7 = slot7(slot8, slot9, slot10)
	slot6.x = slot7
	slot7 = math
	slot7 = slot7.clamp
	slot8 = slot6.y
	slot8 = -slot8
	slot9 = slot0.topExtend
	slot9 = -slot9
	slot10 = slot0.bottomExtend
	slot7 = slot7(slot8, slot9, slot10)
	slot6.y = slot7
	slot7 = 0
	slot6.z = slot7
	slot8 = slot0
	slot7 = slot0.frozen

	slot7(slot8)

	slot7 = slot0.dragTrigger
	slot8 = false
	slot7.enabled = slot8
	slot7 = LeanTween
	slot7 = slot7.moveLocal
	slot8 = slot0._tf
	slot8 = slot8.gameObject
	slot9 = slot6
	slot10 = 0.4
	slot7 = slot7(slot8, slot9, slot10)
	slot8 = slot7
	slot7 = slot7.setEase
	slot9 = LeanTweenType
	slot9 = slot9.easeInOutSine
	slot7 = slot7(slot8, slot9)
	slot8 = slot7
	slot7 = slot7.setOnComplete
	slot9 = System
	slot9 = slot9.Action

	function slot10()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		slot0 = slot0
		slot0 = slot0.dragTrigger
		slot1 = true
		slot0.enabled = slot1
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.unfrozen

		slot0(slot1)

		slot0 = slot1

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-13, warpins: 1 ---
			slot0 = slot1

			slot0()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-14, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot7 = slot7(slot8, slot9(slot10))

	return
	--- END OF BLOCK #0 ---



end

slot0.cameraFocus = slot5

function slot5(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-66, warpins: 1 ---
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = ChapterConst
	slot5 = slot5.PlaneName
	slot6 = "/cells"
	slot5 = slot5 .. slot6
	slot3 = slot3(slot4, slot5)
	slot4 = slot0.contextData
	slot4 = slot4.chapterVO
	slot5 = slot4.theme
	slot7 = slot5
	slot6 = slot5.GetLinePosition
	slot8 = slot1
	slot9 = slot2
	slot6 = slot6(slot7, slot8, slot9)
	slot7 = slot6.y
	slot8 = math
	slot8 = slot8.cos
	slot9 = math
	slot9 = slot9.pi
	slot9 = slot9 / 180
	slot10 = slot5.angle
	slot9 = slot9 * slot10
	slot8 = slot8(slot9)
	slot8 = slot7 * slot8
	slot6.y = slot8
	slot8 = math
	slot8 = slot8.sin
	slot9 = math
	slot9 = slot9.pi
	slot9 = slot9 / 180
	slot10 = slot5.angle
	slot9 = slot9 * slot10
	slot8 = slot8(slot9)
	slot8 = slot7 * slot8
	slot6.z = slot8
	slot8 = slot0.levelCam
	slot8 = slot8.transform
	slot9 = slot8
	slot8 = slot8.GetChild
	slot10 = 0
	slot8 = slot8(slot9, slot10)
	slot9 = slot3.transform
	slot9 = slot9.lossyScale
	slot9 = slot9.x
	slot10 = slot3.position
	slot11 = slot6 * slot9
	slot10 = slot10 + slot11
	slot11 = slot0.levelCam
	slot12 = slot11
	slot11 = slot11.WorldToViewportPoint
	slot13 = slot10
	slot11 = slot11(slot12, slot13)
	slot12 = Vector3
	slot13 = slot8.rect
	slot13 = slot13.width
	slot14 = slot11.x
	slot14 = slot14 - 0.5
	slot13 = slot13 * slot14
	slot14 = slot8.rect
	slot14 = slot14.height
	slot15 = slot11.y
	slot15 = slot15 - 0.5
	slot14 = slot14 * slot15

	return slot12(slot13, slot14)
	--- END OF BLOCK #0 ---



end

slot0.CellToScreen = slot5
slot5 = {}
slot6 = {
	-1,
	0
}
slot5[1] = slot6
slot6 = {
	0,
	1
}
slot5[2] = slot6
slot6 = {
	1,
	0
}
slot5[3] = slot6
slot6 = {
	0,
	-1
}
slot5[4] = slot6

function slot6(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot5 = 0
	slot6 = 1
	slot7 = 1
	slot8 = 4
	slot9 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-34, warpins: 0 ---
	for slot10 = slot7, slot8, slot9 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-26, warpins: 2 ---
		slot11 = {}
		slot12 = slot2.row
		slot13 = slot0
		slot13 = slot13[slot10]
		slot13 = slot13[1]
		slot12 = slot12 + slot13
		slot11.row = slot12
		slot12 = slot2.column
		slot13 = slot0
		slot13 = slot13[slot10]
		slot13 = slot13[2]
		slot12 = slot12 + slot13
		slot11.column = slot12
		slot12 = table
		slot12 = slot12.containsdata
		slot13 = slot1
		slot14 = slot11
		slot12 = slot12(slot13, slot14)

		if not slot12 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-32, warpins: 1 ---
			slot12 = bit
			slot12 = slot12.bor
			slot13 = slot5
			slot14 = slot6
			slot12 = slot12(slot13, slot14)
			slot5 = slot12
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 33-34, warpins: 2 ---
		slot6 = slot6 * 2
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 35-42, warpins: 1 ---
	slot8 = slot0
	slot7 = slot0.CreateEdge
	slot9 = slot5
	slot10 = slot2
	slot11 = slot3
	slot12 = slot4

	slot7(slot8, slot9, slot10, slot11, slot12)

	return
	--- END OF BLOCK #2 ---



end

slot0.AddCellEdge = slot6

function slot6(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.huntingRangeVisibility
	slot1 = slot1 % 2

	if slot1 ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		slot1 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		slot1 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-9, warpins: 2 ---
	return slot1
	--- END OF BLOCK #1 ---



end

slot0.isHuntingRangeVisible = slot6

function slot6(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot2 = slot0
	slot1 = slot0.hideQuadMark
	slot3 = ChapterConst
	slot3 = slot3.MarkHuntingRange

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.ClearEdges

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.isHuntingRangeVisible
	slot1 = slot1(slot2)

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-16, warpins: 1 ---
		slot2 = slot0
		slot1 = slot0.ShowHuntingRange

		slot1(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-28, warpins: 2 ---
	slot1 = slot0.contextData
	slot2 = slot0.contextData
	slot2 = slot2.huntingRangeVisibility
	slot2 = slot2 + 1
	slot1.huntingRangeVisibility = slot2
	slot2 = slot0
	slot1 = slot0.updateAttachments

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.updateChampions

	slot1(slot2)

	return
	--- END OF BLOCK #1 ---



end

slot0.toggleHuntingRange = slot6

function slot6(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot3 = slot1
	slot2 = slot1.GetSubmarineFleet
	slot2, slot3 = slot2(slot3)

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-21, warpins: 1 ---
		slot5 = slot2
		slot4 = slot2.getHuntingRange
		slot4 = slot4(slot5)
		slot5 = _
		slot5 = slot5.filter
		slot6 = slot4

		function slot7(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.getChapterCell
			slot3 = slot0.row
			slot4 = slot0.column
			slot1 = slot1(slot2, slot3, slot4)

			if slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-11, warpins: 1 ---
				slot3 = slot1
				slot2 = slot1.IsWalkable
				slot2 = slot2(slot3)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 12-12, warpins: 2 ---
			return slot2
			--- END OF BLOCK #1 ---



		end

		slot5 = slot5(slot6, slot7)
		slot4 = slot5
		slot6 = slot0
		slot5 = slot0.RefreshHuntingRange
		slot7 = slot4
		slot8 = false

		slot5(slot6, slot7, slot8)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-23, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.ShowHuntingRange = slot6

function slot6(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	slot4 = slot0
	slot3 = slot0.showQuadMark
	slot5 = slot1
	slot6 = ChapterConst
	slot6 = slot6.MarkHuntingRange
	slot7 = "cell_hunting_range"
	slot8 = Vector2
	slot9 = 100
	slot10 = 100
	slot8 = slot8(slot9, slot10)
	slot9 = slot0.material_Add
	slot10 = slot2

	slot3(slot4, slot5, slot6, slot7, slot8, slot9, slot10)

	slot3 = _
	slot3 = slot3.each
	slot4 = slot1

	function slot5(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.AddCellEdge
		slot3 = slot1
		slot4 = slot0
		slot5 = slot2
		slot5 = not slot5
		slot6 = 0

		slot1(slot2, slot3, slot4, slot5, slot6)

		return
		--- END OF BLOCK #0 ---



	end

	slot3(slot4, slot5)

	return
	--- END OF BLOCK #0 ---



end

slot0.RefreshHuntingRange = slot6

function slot6(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	slot2 = slot0
	slot1 = slot0.hideQuadMark
	slot3 = ChapterConst
	slot3 = slot3.MarkHuntingRange

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.ClearEdges

	slot1(slot2)

	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot3 = slot1
	slot2 = slot1.GetSubmarineFleet
	slot2, slot3 = slot2(slot3)
	slot5 = slot0
	slot4 = slot0.isHuntingRangeVisible
	slot4 = slot4(slot5)

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-23, warpins: 1 ---
		slot4 = slot0.contextData
		slot5 = slot0.contextData
		slot5 = slot5.huntingRangeVisibility
		slot5 = slot5 + 1
		slot4.huntingRangeVisibility = slot5
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-39, warpins: 2 ---
	slot5 = slot2
	slot4 = slot2.getHuntingRange
	slot4 = slot4(slot5)
	slot5 = _
	slot5 = slot5.filter
	slot6 = slot4

	function slot7(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.getChapterCell
		slot3 = slot0.row
		slot4 = slot0.column
		slot1 = slot1(slot2, slot3, slot4)

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-11, warpins: 1 ---
			slot3 = slot1
			slot2 = slot1.IsWalkable
			slot2 = slot2(slot3)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-12, warpins: 2 ---
		return slot2
		--- END OF BLOCK #1 ---



	end

	slot5 = slot5(slot6, slot7)
	slot4 = slot5
	slot6 = slot0
	slot5 = slot0.RefreshHuntingRange
	slot7 = slot4
	slot8 = true

	slot5(slot6, slot7, slot8)

	return
	--- END OF BLOCK #1 ---



end

slot0.ShowStaticHuntingRange = slot6

function slot6(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-37, warpins: 1 ---
	slot3 = slot0
	slot2 = slot0.hideQuadMark
	slot4 = ChapterConst
	slot4 = slot4.MarkHuntingRange

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.ClearEdges

	slot2(slot3)

	slot2 = slot0.contextData
	slot2 = slot2.chapterVO
	slot4 = slot2
	slot3 = slot2.GetSubmarineFleet
	slot3, slot4 = slot3(slot4)
	slot6 = slot3
	slot5 = slot3.getHuntingRange
	slot7 = slot1
	slot5 = slot5(slot6, slot7)
	slot6 = _
	slot6 = slot6.filter
	slot7 = slot5

	function slot8(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.getChapterCell
		slot3 = slot0.row
		slot4 = slot0.column
		slot1 = slot1(slot2, slot3, slot4)

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-11, warpins: 1 ---
			slot3 = slot1
			slot2 = slot1.IsWalkable
			slot2 = slot2(slot3)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-12, warpins: 2 ---
		return slot2
		--- END OF BLOCK #1 ---



	end

	slot6 = slot6(slot7, slot8)
	slot5 = slot6
	slot7 = slot3
	slot6 = slot3.getHuntingRange
	slot6 = slot6(slot7)
	slot7 = _
	slot7 = slot7.filter
	slot8 = slot6

	function slot9(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.getChapterCell
		slot3 = slot0.row
		slot4 = slot0.column
		slot1 = slot1(slot2, slot3, slot4)

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-11, warpins: 1 ---
			slot3 = slot1
			slot2 = slot1.IsWalkable
			slot2 = slot2(slot3)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-12, warpins: 2 ---
		return slot2
		--- END OF BLOCK #1 ---



	end

	slot7 = slot7(slot8, slot9)
	slot6 = slot7
	slot7 = {}
	slot8 = pairs
	slot9 = slot6
	slot8, slot9, slot10 = slot8(slot9)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 38-51, warpins: 0 ---
	for slot11, slot12 in slot8, slot9, slot10 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-44, warpins: 1 ---
		slot13 = table
		slot13 = slot13.containsdata
		slot14 = slot5
		slot15 = slot12
		slot13 = slot13(slot14, slot15)

		if not slot13 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 45-49, warpins: 1 ---
			slot13 = table
			slot13 = slot13.insert
			slot14 = slot7
			slot15 = slot12

			slot13(slot14, slot15)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 50-51, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 52-69, warpins: 1 ---
	slot9 = slot0
	slot8 = slot0.RefreshHuntingRange
	slot10 = slot7
	slot11 = true

	slot8(slot9, slot10, slot11)

	slot9 = slot0
	slot8 = slot0.RefreshHuntingRange
	slot10 = slot5
	slot11 = false

	slot8(slot9, slot10, slot11)

	slot9 = slot0
	slot8 = slot0.updateAttachments

	slot8(slot9)

	slot9 = slot0
	slot8 = slot0.updateChampions

	slot8(slot9)

	return
	--- END OF BLOCK #2 ---



end

slot0.ShowTargetHuntingRange = slot6

function slot6(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot3 = slot1
	slot2 = slot1.GetSubmarineFleet
	slot2, slot3 = slot2(slot3)

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-14, warpins: 1 ---
	slot4 = slot0.cellFleets
	slot5 = slot2.id
	slot4 = slot4[slot5]
	slot5 = slot1.subAutoAttack

	if slot5 ~= 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-16, warpins: 1 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-17, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-34, warpins: 2 ---
	slot7 = slot4
	slot6 = slot4.SetActive
	slot8 = slot5

	slot6(slot7, slot8)

	slot7 = slot0
	slot6 = slot0.SetSpineVisible
	slot8 = slot4.tfShip
	slot9 = not slot5

	slot6(slot7, slot8, slot9)

	slot7 = slot0
	slot6 = slot0.PlaySubAnimation
	slot8 = slot4
	slot9 = not slot5

	function slot10()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.updateFleet
		slot2 = slot1
		slot2 = slot2.id

		slot0(slot1, slot2)

		return
		--- END OF BLOCK #0 ---



	end

	slot6(slot7, slot8, slot9, slot10)

	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 35-35, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

slot0.OnChangeSubAutoAttack = slot6

function slot6(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot3 = slot1
	slot2 = slot1.getOniChapterInfo
	slot2 = slot2(slot3)
	slot4 = slot0
	slot3 = slot0.hideQuadMark
	slot5 = ChapterConst
	slot5 = slot5.MarkEscapeGrid

	slot3(slot4, slot5)

	slot4 = slot0
	slot3 = slot0.showQuadMark
	slot5 = _
	slot5 = slot5.map
	slot6 = slot2.escape_grids

	function slot7(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot1 = {}
		slot2 = slot0[1]
		slot1.row = slot2
		slot2 = slot0[2]
		slot1.column = slot2

		return slot1
		--- END OF BLOCK #0 ---



	end

	slot5 = slot5(slot6, slot7)
	slot6 = ChapterConst
	slot6 = slot6.MarkEscapeGrid
	slot7 = "cell_escape_grid"
	slot8 = Vector2
	slot9 = 105
	slot10 = 105

	slot3(slot4, slot5, slot6, slot7, slot8(slot9, slot10))

	return
	--- END OF BLOCK #0 ---



end

slot0.displayEscapeGrid = slot6

function slot6(slot0, slot1, slot2, slot3, slot4, slot5, slot6)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot8 = slot0
	slot7 = slot0.ShowAnyQuadMark
	slot9 = slot1
	slot10 = slot2
	slot11 = slot3
	slot12 = slot4
	slot13 = slot5
	slot14 = false
	slot15 = slot6

	slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15)

	return
	--- END OF BLOCK #0 ---



end

slot0.showQuadMark = slot6

function slot6(slot0, slot1, slot2, slot3, slot4, slot5, slot6)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot8 = slot0
	slot7 = slot0.ShowAnyQuadMark
	slot9 = slot1
	slot10 = slot2
	slot11 = slot3
	slot12 = slot4
	slot13 = slot5
	slot14 = true
	slot15 = slot6

	slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15)

	return
	--- END OF BLOCK #0 ---



end

slot0.ShowTopQuadMark = slot6

function slot6(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot8 = slot0.contextData
	slot8 = slot8.chapterVO
	slot9 = pairs
	slot10 = slot1
	slot9, slot10, slot11 = slot9(slot10)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-104, warpins: 0 ---
	for slot12, slot13 in slot9, slot10, slot11 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-13, warpins: 1 ---
		slot15 = slot8
		slot14 = slot8.getChapterCell
		slot16 = slot13.row
		slot17 = slot13.column
		slot14 = slot14(slot15, slot16, slot17)

		if slot14 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-20, warpins: 1 ---
			slot16 = slot14
			slot15 = slot14.IsWalkable
			slot17 = ChapterConst
			slot17 = slot17.SubjectPlayer
			slot15 = slot15(slot16, slot17)

			if slot15 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-30, warpins: 1 ---
				slot15 = ChapterCell
				slot15 = slot15.Line2MarkName
				slot16 = slot13.row
				slot17 = slot13.column
				slot18 = slot2
				slot15 = slot15(slot16, slot17, slot18)
				slot16 = slot0.markQuads
				slot16 = slot16[slot15]

				if not slot16 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 31-41, warpins: 1 ---
					slot17 = PoolMgr
					slot17 = slot17.GetInstance
					slot17 = slot17()
					slot18 = slot17
					slot17 = slot17.GetPrefab
					slot19 = "chapter/cell_quad_mark"
					slot20 = ""
					slot21 = false

					function slot22(slot0)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-8, warpins: 1 ---
						slot1 = slot0.transform
						slot0 = slot1
						slot1 = slot1
						slot1 = slot1.markQuads
						slot2 = slot2
						slot3 = slot0
						slot1[slot2] = slot3

						return
						--- END OF BLOCK #0 ---



					end

					slot17(slot18, slot19, slot20, slot21, slot22)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 42-47, warpins: 1 ---
					slot18 = slot0
					slot17 = slot0.cancelMarkTween
					slot19 = slot15
					slot20 = slot16
					slot21 = 1

					slot17(slot18, slot19, slot20, slot21)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 48-52, warpins: 2 ---
				slot16.name = slot15
				slot18 = slot16
				slot17 = slot16.SetParent

				if slot6 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 53-55, warpins: 1 ---
					slot19 = slot0.topMarkRoot

					if not slot19 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 56-56, warpins: 2 ---
						slot19 = slot0.bottomMarkRoot
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 57-89, warpins: 2 ---
				slot20 = false

				slot17(slot18, slot19, slot20)

				slot17 = slot8.theme
				slot17 = slot17.cellSize
				slot16.sizeDelta = slot17
				slot17 = slot8.theme
				slot18 = slot17
				slot17 = slot17.GetLinePosition
				slot19 = slot13.row
				slot20 = slot13.column
				slot17 = slot17(slot18, slot19, slot20)
				slot16.anchoredPosition = slot17
				slot17 = Vector3
				slot17 = slot17.one
				slot16.localScale = slot17
				slot18 = slot16
				slot17 = slot16.SetAsLastSibling

				slot17(slot18)

				slot18 = slot16
				slot17 = slot16.GetComponent
				slot19 = typeof
				slot20 = Image
				slot17 = slot17(slot18, slot19(slot20))
				slot18 = GetSpriteFromAtlas
				slot19 = "chapter/pic/cellgrid"
				slot20 = slot3
				slot18 = slot18(slot19, slot20)
				slot17.sprite = slot18
				slot17.material = slot5
				slot16.sizeDelta = slot4

				if not slot7 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 90-95, warpins: 1 ---
					slot19 = slot0
					slot18 = slot0.startMarkTween
					slot20 = slot15
					slot21 = slot16

					slot18(slot19, slot20, slot21)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 96-101, warpins: 1 ---
					slot19 = slot0
					slot18 = slot0.cancelMarkTween
					slot20 = slot15
					slot21 = slot16
					slot22 = 1

					slot18(slot19, slot20, slot21, slot22)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 102-102, warpins: 2 ---
				--- END OF BLOCK #3 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 103-104, warpins: 4 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 105-106, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.ShowAnyQuadMark = slot6

function slot6(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot2 = pairs
	slot3 = slot0.markQuads
	slot2, slot3, slot4 = slot2(slot3)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-49, warpins: 0 ---
	for slot5, slot6 in slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-6, warpins: 1 ---
		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-20, warpins: 1 ---
			slot7 = tonumber
			slot8 = string
			slot8 = slot8.sub
			slot9 = slot5
			slot10 = string
			slot10 = slot10.find
			slot11 = slot5
			slot12 = "#"
			slot10 = slot10(slot11, slot12)
			slot10 = slot10 + 1
			slot7 = slot7(slot8(slot9, slot10))

			if slot7 == slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-47, warpins: 2 ---
				slot8 = slot0
				slot7 = slot0.cancelMarkTween
				slot9 = slot5
				slot10 = slot6

				slot7(slot8, slot9, slot10)

				slot7 = slot0.markQuads
				slot7 = slot7[slot5]
				slot8 = slot7
				slot7 = slot7.GetComponent
				slot9 = typeof
				slot10 = Image
				slot7 = slot7(slot8, slot9(slot10))
				slot8 = nil
				slot7.material = slot8
				slot7 = slot0.markQuads
				slot8 = nil
				slot7[slot5] = slot8
				slot7 = PoolMgr
				slot7 = slot7.GetInstance
				slot7 = slot7()
				slot8 = slot7
				slot7 = slot7.ReturnPrefab
				slot9 = "chapter/cell_quad_mark"
				slot10 = ""
				slot11 = slot6.gameObject

				slot7(slot8, slot9, slot10, slot11)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 48-49, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 50-50, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.hideQuadMark = slot6

function slot6(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot5 = 0

	if slot1 > slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-6, warpins: 1 ---
		slot5 = 16

		if slot1 >= slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 2 ---
			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-27, warpins: 2 ---
	slot6 = slot0
	slot5 = slot0.getEdgePool
	slot5 = slot5(slot6)
	slot6 = slot0.contextData
	slot6 = slot6.chapterVO
	slot7 = ChapterCell
	slot7 = slot7.Line2Name
	slot8 = slot2.row
	slot9 = slot2.column
	slot7 = slot7(slot8, slot9)
	slot8 = slot6.theme
	slot9 = slot8
	slot8 = slot8.GetLinePosition
	slot10 = slot2.row
	slot11 = slot2.column
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = slot6.theme
	slot9 = slot9.cellSize
	slot10 = 1
	slot11 = 0
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-30, warpins: 2 ---
	slot12 = 4

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 31-153, warpins: 0 ---
	while slot11 < slot12 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-31, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 32-40, warpins: 1 ---
		slot11 = slot11 + 1
		slot12 = bit
		slot12 = slot12.band
		slot13 = slot1
		slot14 = slot10
		slot12 = slot12(slot13, slot14)
		slot13 = 0

		if slot12 > slot13 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 41-50, warpins: 1 ---
			slot12 = slot7
			slot13 = "_edge_"
			slot14 = tostring
			slot15 = slot11
			slot14 = slot14(slot15)
			slot12 = slot12 .. slot13 .. slot14
			slot13 = slot0.cellEdges
			slot13 = slot13[slot12]

			if not slot13 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 51-57, warpins: 1 ---
				slot13 = slot0.cellEdges
				slot14 = tf
				slot16 = slot5
				slot15 = slot5.Dequeue
				slot14 = slot14(slot15(slot16))
				slot13[slot12] = slot14
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 58-70, warpins: 2 ---
			slot13 = slot0.cellEdges
			slot13 = slot13[slot12]
			slot13.name = slot12
			slot15 = slot13
			slot14 = slot13.SetParent
			slot16 = slot0.bottomMarkRoot
			slot17 = false

			slot14(slot15, slot16, slot17)

			slot15 = slot13
			slot14 = slot13.SetAsLastSibling

			slot14(slot15)

			if not slot4 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 71-71, warpins: 1 ---
				slot14 = 0
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 72-78, warpins: 2 ---
			slot15 = bit
			slot15 = slot15.band
			slot16 = slot11
			slot17 = 1
			slot15 = slot15(slot16, slot17)

			if slot15 ~= 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 79-80, warpins: 1 ---
				slot15 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 81-81, warpins: 1 ---
				slot15 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 82-84, warpins: 2 ---
			slot16 = 3

			if slot15 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 85-89, warpins: 1 ---
				slot17 = slot9.x
				slot18 = slot14 * 2
				slot17 = slot17 - slot18

				if not slot17 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 90-90, warpins: 2 ---
					slot17 = slot16
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 91-92, warpins: 2 ---
			if not slot15 or not slot16 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 95-97, warpins: 2 ---
				slot18 = slot9.y
				slot19 = slot14 * 2
				slot18 = slot18 - slot19
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #4 ---

			FLOW; TARGET BLOCK #5



			-- Decompilation error in this vicinity:
			--- BLOCK #5 98-138, warpins: 2 ---
			slot19 = Vector2
			slot19 = slot19.New
			slot20 = slot17
			slot21 = slot18
			slot19 = slot19(slot20, slot21)
			slot13.sizeDelta = slot19
			slot19 = math
			slot19 = slot19.pi
			slot19 = slot19 * 0.5
			slot20 = slot11 - 1
			slot19 = slot19 * slot20
			slot20 = math
			slot20 = slot20.sin
			slot21 = slot19
			slot20 = slot20(slot21)
			slot21 = slot9.x
			slot21 = slot21 * 0.5
			slot22 = slot16 * 0.5
			slot21 = slot21 - slot22
			slot21 = slot21 - slot14
			slot20 = slot20 * slot21
			slot21 = math
			slot21 = slot21.cos
			slot22 = slot19
			slot21 = slot21(slot22)
			slot22 = slot9.y
			slot22 = slot22 * 0.5
			slot23 = slot16 * 0.5
			slot22 = slot22 - slot23
			slot22 = slot22 - slot14
			slot21 = slot21 * slot22
			slot22 = Vector2
			slot22 = slot22.New
			slot23 = slot8.x
			slot23 = slot20 + slot23
			slot24 = slot8.y
			slot24 = slot21 + slot24
			slot22 = slot22(slot23, slot24)
			slot13.anchoredPosition = slot22

			if slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 139-144, warpins: 1 ---
				slot23 = slot0
				slot22 = slot0.startMarkTween
				slot24 = slot12
				slot25 = slot13

				slot22(slot23, slot24, slot25)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 145-150, warpins: 1 ---
				slot23 = slot0
				slot22 = slot0.cancelMarkTween
				slot24 = slot12
				slot25 = slot13
				slot26 = 1

				slot22(slot23, slot24, slot25, slot26)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #5 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 151-152, warpins: 3 ---
		slot10 = slot10 * 2
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 153-153, warpins: 3 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 153-153, warpins: 1 ---
	return
	--- END OF BLOCK #4 ---



end

slot0.CreateEdge = slot6

function slot6(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot2 = slot0.contextData
	slot2 = slot2.chapterVO
	slot3 = ChapterCell
	slot3 = slot3.Line2Name
	slot4 = slot1.row
	slot5 = slot1.column
	slot3 = slot3(slot4, slot5)
	slot4 = 1
	slot5 = 4
	slot6 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-42, warpins: 0 ---
	for slot7 = slot4, slot5, slot6 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-21, warpins: 2 ---
		slot8 = slot3
		slot9 = "_edge_"
		slot10 = tostring
		slot11 = slot7
		slot10 = slot10(slot11)
		slot8 = slot8 .. slot9 .. slot10
		slot9 = slot0.cellEdges
		slot9 = slot9[slot8]

		if slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-41, warpins: 1 ---
			slot10 = slot0
			slot9 = slot0.getEdgePool
			slot9 = slot9(slot10)
			slot10 = tf
			slot11 = slot0.cellEdges
			slot11 = slot11[slot8]
			slot10 = slot10(slot11)
			slot12 = slot0
			slot11 = slot0.cancelMarkTween
			slot13 = slot8
			slot14 = slot10

			slot11(slot12, slot13, slot14)

			slot12 = slot9
			slot11 = slot9.Enqueue
			slot13 = slot10
			slot14 = false

			slot11(slot12, slot13, slot14)

			slot11 = slot0.cellEdges
			slot12 = nil
			slot11[slot8] = slot12
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 42-42, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 43-43, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.ClearEdge = slot6

function slot6(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = table
	slot1 = slot1.getCount
	slot2 = slot0.cellEdges
	slot1 = slot1(slot2)
	slot2 = 0

	if slot1 <= slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-15, warpins: 2 ---
	slot2 = slot0
	slot1 = slot0.getEdgePool
	slot1 = slot1(slot2)
	slot2 = pairs
	slot3 = slot0.cellEdges
	slot2, slot3, slot4 = slot2(slot3)

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-31, warpins: 0 ---
	for slot5, slot6 in slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-17, warpins: 1 ---
		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-29, warpins: 1 ---
			slot8 = slot0
			slot7 = slot0.cancelMarkTween
			slot9 = slot5
			slot10 = slot6

			slot7(slot8, slot9, slot10)

			slot8 = slot1
			slot7 = slot1.Enqueue
			slot9 = go
			slot10 = slot6
			slot9 = slot9(slot10)
			slot10 = false

			slot7(slot8, slot9, slot10)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 30-31, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 32-34, warpins: 1 ---
	slot2 = {}
	slot0.cellEdges = slot2

	return
	--- END OF BLOCK #3 ---



end

slot0.ClearEdges = slot6

function slot6(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot4 = slot0.contextData
	slot4 = slot4.chapterVO
	slot6 = slot4
	slot5 = slot4.existEnemy
	slot7 = ChapterConst
	slot7 = slot7.SubjectPlayer
	slot8 = slot1
	slot9 = slot2
	slot5 = slot5(slot6, slot7, slot8, slot9)

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-37, warpins: 1 ---
		slot5 = nil
		slot7 = slot4
		slot6 = slot4.getChapterCell
		slot8 = slot1
		slot9 = slot2
		slot6 = slot6(slot7, slot8, slot9)
		slot7 = ChapterCell
		slot7 = slot7.Line2Name
		slot8 = slot1
		slot9 = slot2
		slot7 = slot7(slot8, slot9)
		slot8 = slot0.cellRoot
		slot9 = slot8
		slot8 = slot8.Find
		slot10 = slot7
		slot8 = slot8(slot9, slot10)
		slot10 = slot8
		slot9 = slot8.Find
		slot11 = ChapterConst
		slot11 = slot11.ChildAttachment
		slot9 = slot9(slot10, slot11)
		slot10 = slot6.attachment
		slot11 = ChapterConst
		slot11 = slot11.AttachEnemy

		if slot10 ~= slot11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-42, warpins: 1 ---
			slot10 = slot6.attachment
			slot11 = ChapterConst
			slot11 = slot11.AttachElite

			if slot10 ~= slot11 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 43-47, warpins: 1 ---
				slot10 = slot6.attachment
				slot11 = ChapterConst
				slot11 = slot11.AttachAmbush

				if slot10 ~= slot11 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 48-52, warpins: 1 ---
					slot10 = slot6.attachment
					slot11 = ChapterConst
					slot11 = slot11.AttachBoss

					if slot10 == slot11 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 53-56, warpins: 4 ---
						slot10 = slot9.childCount
						slot11 = 0

						if slot10 > slot11 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 57-66, warpins: 1 ---
							slot11 = slot9
							slot10 = slot9.GetChild
							slot12 = 0
							slot10 = slot10(slot11, slot12)
							slot11 = slot10
							slot10 = slot10.Find
							slot12 = "icon"
							slot10 = slot10(slot11, slot12)
							slot5 = slot10
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 67-71, warpins: 1 ---
						slot10 = slot6.attachment
						slot11 = ChapterConst
						slot11 = slot11.AttachRival

						if slot10 == slot11 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 72-75, warpins: 1 ---
							slot10 = slot9.childCount
							slot11 = 0

							if slot10 > slot11 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 76-87, warpins: 1 ---
								slot11 = slot9
								slot10 = slot9.GetChild
								slot12 = 0
								slot10 = slot10(slot11, slot12)
								slot11 = slot10
								slot10 = slot10.Find
								slot12 = "ship"
								slot10 = slot10(slot11, slot12)
								slot11 = slot10.childCount
								slot12 = 0

								if slot11 > slot12 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 88-92, warpins: 1 ---
									slot12 = slot10
									slot11 = slot10.GetChild
									slot13 = 0
									slot11 = slot11(slot12, slot13)
									slot5 = slot11
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 93-99, warpins: 6 ---
		slot11 = slot4
		slot10 = slot4.existChampion
		slot12 = slot1
		slot13 = slot2
		slot10 = slot10(slot11, slot12, slot13)

		if slot10 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 100-100, warpins: 1 ---
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 100-101, warpins: 2 ---
		if slot7 and slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 104-105, warpins: 1 ---
			if slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 106-109, warpins: 1 ---
				slot10 = slot0.shiningTws
				slot10 = slot10[slot7]

				if not slot10 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 110-151, warpins: 1 ---
					slot11 = slot5
					slot10 = slot5.GetComponent
					slot12 = "Image"
					slot10 = slot10(slot11, slot12)
					slot11 = Shader
					slot11 = slot11.Find
					slot12 = "Spine/SkeletonGraphic (Additive)"
					slot11 = slot11(slot12)
					slot12 = Material
					slot12 = slot12.New
					slot13 = slot11
					slot12 = slot12(slot13)
					slot13 = LeanTween
					slot13 = slot13.value
					slot14 = slot5.gameObject
					slot15 = 0
					slot16 = 1
					slot17 = 1
					slot13 = slot13(slot14, slot15, slot16, slot17)
					slot14 = slot13
					slot13 = slot13.setEase
					slot15 = LeanTweenType
					slot15 = slot15.easeInOutSine
					slot13 = slot13(slot14, slot15)
					slot14 = slot13
					slot13 = slot13.setLoopPingPong
					slot13 = slot13(slot14)
					slot14 = slot13
					slot13 = slot13.setOnUpdate
					slot15 = System
					slot15 = slot15.Action_float

					function slot16(slot0)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-17, warpins: 1 ---
						slot1 = slot0
						slot2 = slot1
						slot1 = slot1.SetColor
						slot3 = "_Color"
						slot4 = Color
						slot4 = slot4.Lerp
						slot5 = Color
						slot5 = slot5.black
						slot6 = Color
						slot6 = slot6.gray
						slot7 = slot0

						slot1(slot2, slot3, slot4(slot5, slot6, slot7))

						slot1 = slot1
						slot2 = slot0
						slot1.material = slot2

						return
						--- END OF BLOCK #0 ---



					end

					slot13 = slot13(slot14, slot15(slot16))
					slot14 = slot0.shiningTws
					slot15 = {}
					slot15.tw = slot13
					slot16 = slot13.uniqueId
					slot15.uniqueId = slot16
					slot14[slot7] = slot15
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 152-155, warpins: 1 ---
				slot10 = slot0.shiningTws
				slot10 = slot10[slot7]

				if slot10 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 156-170, warpins: 1 ---
					slot10 = LeanTween
					slot10 = slot10.cancel
					slot11 = slot0.shiningTws
					slot11 = slot11[slot7]
					slot11 = slot11.uniqueId

					slot10(slot11)

					slot10 = slot0.shiningTws
					slot11 = nil
					slot10[slot7] = slot11
					slot11 = slot5
					slot10 = slot5.GetComponent
					slot12 = "Image"
					slot10 = slot10(slot11, slot12)
					slot11 = nil
					slot10.material = slot11
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 171-171, warpins: 7 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.shiningTarget = slot6

function slot6(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot3 = slot0.contextData
	slot3 = slot3.chapterVO
	slot4, slot5 = nil
	slot7 = slot3
	slot6 = slot3.getChampion
	slot8 = slot1.row
	slot9 = slot1.column
	slot6 = slot6(slot7, slot8, slot9)
	slot8 = slot3
	slot7 = slot3.getChapterCell
	slot9 = slot1.row
	slot10 = slot1.column
	slot7 = slot7(slot8, slot9, slot10)

	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-18, warpins: 1 ---
		slot8 = slot6.flag

		if slot8 == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-32, warpins: 1 ---
			slot9 = slot3
			slot8 = slot3.getChampionIndex
			slot10 = slot1.row
			slot11 = slot1.column
			slot8 = slot8(slot9, slot10, slot11)
			slot9 = slot0.cellChampions
			slot9 = slot9[slot8]
			slot4 = slot9.tf
			slot10 = slot4
			slot9 = slot4.Find
			slot11 = "huoqiubaozha"
			slot9 = slot9(slot10, slot11)
			slot5 = slot9
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-40, warpins: 2 ---
		slot8 = table
		slot8 = slot8.contains
		slot9 = ChapterConst
		slot9 = slot9.AttachStaticEnemys
		slot10 = slot7.attachment
		slot8 = slot8(slot9, slot10)

		if slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 41-67, warpins: 1 ---
			slot8 = ChapterCell
			slot8 = slot8.Line2Name
			slot9 = slot1.row
			slot10 = slot1.column
			slot8 = slot8(slot9, slot10)
			slot9 = slot0.cellRoot
			slot10 = slot9
			slot9 = slot9.Find
			slot11 = slot8
			slot9 = slot9(slot10, slot11)
			slot4 = slot9
			slot10 = slot4
			slot9 = slot4.Find
			slot11 = "attachment"
			slot9 = slot9(slot10, slot11)
			slot10 = slot9
			slot9 = slot9.Find
			slot11 = "enemy_"
			slot12 = slot7.attachmentId
			slot11 = slot11 .. slot12
			slot9 = slot9(slot10, slot11)
			slot10 = slot9
			slot9 = slot9.Find
			slot11 = "huoqiubaozha"
			slot9 = slot9(slot10, slot11)
			slot5 = slot9
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 68-69, warpins: 1 ---
			if slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 70-71, warpins: 1 ---
				slot8 = slot2

				slot8()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 72-72, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 73-105, warpins: 2 ---
	slot8 = slot4.localPosition
	slot8 = slot8.x
	slot9 = slot4.localPosition
	slot10 = slot8 + 10
	slot9.x = slot10
	slot4.localPosition = slot9
	slot10 = LeanTween
	slot10 = slot10.moveX
	slot11 = slot4
	slot12 = slot8 - 10
	slot13 = 0.05
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = slot10
	slot10 = slot10.setEase
	slot12 = LeanTweenType
	slot12 = slot12.easeInOutSine
	slot10 = slot10(slot11, slot12)
	slot11 = slot10
	slot10 = slot10.setLoopPingPong
	slot12 = 3
	slot10 = slot10(slot11, slot12)
	slot11 = slot10
	slot10 = slot10.setOnComplete
	slot12 = System
	slot12 = slot12.Action

	function slot13()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0 = slot0
		slot0 = slot0.localPosition
		slot1 = slot1
		slot0.x = slot1
		slot1 = slot0
		slot1.localPosition = slot0
		slot1 = slot2

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-11, warpins: 1 ---
			slot1 = slot2

			slot1()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-12, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot10(slot11, slot12(slot13))

	slot10 = IsNil
	slot11 = slot5
	slot10 = slot10(slot11)

	if not slot10 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 106-109, warpins: 1 ---
		slot10 = setActive
		slot11 = slot5
		slot12 = true

		slot10(slot11, slot12)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 110-111, warpins: 2 ---
	return slot4
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 112-112, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

slot0.shakeCell = slot6

function slot6(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-24, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot3 = slot1
	slot2 = slot1.getCoastalGunArea
	slot2 = slot2(slot3)
	slot4 = slot0
	slot3 = slot0.hideQuadMark
	slot5 = ChapterConst
	slot5 = slot5.MarkCoastalGun

	slot3(slot4, slot5)

	slot4 = slot0
	slot3 = slot0.showQuadMark
	slot5 = slot2
	slot6 = ChapterConst
	slot6 = slot6.MarkCoastalGun
	slot7 = "cell_coastal_gun"
	slot8 = Vector2
	slot9 = 110
	slot10 = 110
	slot8 = slot8(slot9, slot10)
	slot9 = nil
	slot10 = false

	slot3(slot4, slot5, slot6, slot7, slot8, slot9, slot10)

	return
	--- END OF BLOCK #0 ---



end

slot0.updateCoastalGunAttachArea = slot6

function slot6(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = pg
	slot2 = slot2.chapter_pop_template
	slot3 = slot1.id
	slot2 = slot2[slot3]

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-15, warpins: 2 ---
	slot3 = slot2.sd_location
	slot4 = SpineAnimationGroup
	slot5 = ipairs
	slot6 = slot3
	slot5, slot6, slot7 = slot5(slot6)

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-55, warpins: 0 ---
	for slot8, slot9 in slot5, slot6, slot7 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-18, warpins: 1 ---
		slot10 = slot0.idols

		if not slot10 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-19, warpins: 1 ---
			slot10 = {}
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 20-53, warpins: 2 ---
		slot0.idols = slot10
		slot10 = ChapterCell
		slot10 = slot10.Line2Name
		slot11 = slot9[1]
		slot11 = slot11[1]
		slot12 = slot9[1]
		slot12 = slot12[2]
		slot10 = slot10(slot11, slot12)
		slot11 = slot0.cellRoot
		slot12 = slot11
		slot11 = slot11.Find
		slot13 = slot10
		slot14 = "/"
		slot15 = ChapterConst
		slot15 = slot15.ChildAttachment
		slot13 = slot13 .. slot14 .. slot15
		slot11 = slot11(slot12, slot13)
		slot12 = slot4.New
		slot13 = slot11
		slot12 = slot12(slot13)
		slot13 = table
		slot13 = slot13.insert
		slot14 = slot0.idols
		slot15 = slot12

		slot13(slot14, slot15)

		slot14 = slot12
		slot13 = slot12.Set
		slot15 = slot9[2]

		slot13(slot14, slot15)

		slot14 = slot12
		slot13 = slot12.SetRoutine
		slot15 = slot2.sd_act
		slot15 = slot15[slot8]

		slot13(slot14, slot15)
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 54-55, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 56-56, warpins: 1 ---
	return
	--- END OF BLOCK #3 ---



end

slot0.UpdateIdolsAnim = slot6

function slot6(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = slot0.idols

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-9, warpins: 1 ---
		slot2 = ipairs
		slot3 = slot0.idols
		slot2, slot3, slot4 = slot2(slot3)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-14, warpins: 0 ---
		for slot5, slot6 in slot2, slot3, slot4 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-12, warpins: 1 ---
			slot8 = slot6
			slot7 = slot6.ClearAll

			slot7(slot8)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 13-14, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 15-20, warpins: 1 ---
		slot2 = table
		slot2 = slot2.clear
		slot3 = slot0.idols

		slot2(slot3)

		slot2 = nil
		slot0.idols = slot2
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-21, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.ClearIdolsAnim = slot6

function slot6(slot0, slot1, slot2, slot3, slot4, slot5)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot6 = slot0.contextData
	slot6 = slot6.chapterVO
	slot7 = ChapterCell
	slot7 = slot7.Line2Name
	slot8 = slot1
	slot9 = slot2
	slot7 = slot7(slot8, slot9)
	slot8 = slot0.cellRoot
	slot9 = slot8
	slot8 = slot8.Find
	slot10 = slot7
	slot8 = slot8(slot9, slot10)

	if not slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-16, warpins: 1 ---
		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-18, warpins: 1 ---
			slot9 = slot5

			slot9()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 19-19, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-32, warpins: 2 ---
	slot10 = slot8
	slot9 = slot8.Find
	slot11 = ChapterConst
	slot11 = slot11.ChildAttachment
	slot9 = slot9(slot10, slot11)
	slot11 = slot0
	slot10 = slot0.PlayParticleSystem
	slot12 = slot3
	slot13 = slot9
	slot14 = slot4
	slot15 = slot5

	slot10(slot11, slot12, slot13, slot14, slot15)

	return
	--- END OF BLOCK #1 ---



end

slot0.PlayAttachmentEffect = slot6

function slot6(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot5 = PoolMgr
	slot5 = slot5.GetInstance
	slot5 = slot5()
	slot6 = slot5
	slot5 = slot5.GetPrefab
	slot7 = "effect/"
	slot8 = slot1
	slot7 = slot7 .. slot8
	slot8 = slot1
	slot9 = false

	function slot10(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-29, warpins: 1 ---
		slot1 = setParent
		slot2 = slot0
		slot3 = slot0

		slot1(slot2, slot3)

		slot1 = tf
		slot2 = slot0
		slot1 = slot1(slot2)
		slot2 = slot1
		slot1.localPosition = slot2
		slot2 = slot0
		slot1 = slot0.GetComponent
		slot3 = typeof
		slot4 = ParticleSystem
		slot1 = slot1(slot2, slot3(slot4))
		slot2 = slot1
		slot1 = slot1.Play

		slot1(slot2)

		slot2 = slot0
		slot1 = slot0.GetComponent
		slot3 = typeof
		slot4 = ParticleSystemEvent
		slot1 = slot1(slot2, slot3(slot4))
		slot2 = IsNil
		slot3 = slot1
		slot2 = slot2(slot3)

		if not slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-33, warpins: 1 ---
			slot3 = slot1
			slot2 = slot1.SetEndEvent

			function slot4(slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-14, warpins: 1 ---
				slot1 = PoolMgr
				slot1 = slot1.GetInstance
				slot1 = slot1()
				slot2 = slot1
				slot1 = slot1.ReturnPrefab
				slot3 = "effect/"
				slot4 = slot0
				slot3 = slot3 .. slot4
				slot4 = slot0
				slot5 = slot1

				slot1(slot2, slot3, slot4, slot5)

				slot1 = slot2

				if slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 15-16, warpins: 1 ---
					slot1 = slot2

					slot1()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 17-17, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end

			slot2(slot3, slot4)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 34-35, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot5(slot6, slot7, slot8, slot9, slot10)

	return
	--- END OF BLOCK #0 ---



end

slot0.PlayParticleSystem = slot6

function slot6(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot5 = nil
	slot6 = slot0.contextData
	slot6 = slot6.chapterVO
	slot7 = nil
	slot8 = ipairs
	slot9 = slot6.champions
	slot8, slot9, slot10 = slot8(slot9)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-21, warpins: 0 ---
	for slot11, slot12 in slot8, slot9, slot10 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-11, warpins: 1 ---
		slot13 = slot12.row

		if slot13 == slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-14, warpins: 1 ---
			slot13 = slot12.column

			if slot13 == slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-17, warpins: 1 ---
				slot13 = slot12.flag

				if slot13 ~= 1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 18-19, warpins: 1 ---
					slot7 = slot11

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 20-20, warpins: 1 ---
					break
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 20-21, warpins: 4 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 22-23, warpins: 2 ---
	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-26, warpins: 1 ---
		slot8 = slot0.cellChampions
		slot8 = slot8[slot7]
		slot5 = slot8.tf
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 27-28, warpins: 2 ---
	if not slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-31, warpins: 1 ---
		slot8 = slot4

		slot8()

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 32-38, warpins: 2 ---
	slot9 = slot0
	slot8 = slot0.PlayInsideParticleSystem
	slot10 = slot3
	slot11 = slot5
	slot12 = slot4

	slot8(slot9, slot10, slot11, slot12)

	return
	--- END OF BLOCK #4 ---



end

slot0.PlayChampionInsideEffect = slot6

function slot6(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot4 = go
	slot5 = tf
	slot6 = slot2
	slot5 = slot5(slot6)
	slot6 = slot5
	slot5 = slot5.Find
	slot7 = slot1
	slot4 = slot4(slot5(slot6, slot7))
	slot5 = IsNil
	slot6 = slot4
	slot5 = slot5(slot6)

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-17, warpins: 1 ---
		slot5 = slot3

		slot5()

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-41, warpins: 1 ---
	slot6 = slot4
	slot5 = slot4.SetActive
	slot7 = true

	slot5(slot6, slot7)

	slot6 = slot4
	slot5 = slot4.GetComponent
	slot7 = typeof
	slot8 = ParticleSystem
	slot5 = slot5(slot6, slot7(slot8))
	slot6 = slot5
	slot5 = slot5.Play

	slot5(slot6)

	slot6 = slot4
	slot5 = slot4.GetComponent
	slot7 = typeof
	slot8 = ParticleSystemEvent
	slot5 = slot5(slot6, slot7(slot8))
	slot6 = IsNil
	slot7 = slot5
	slot6 = slot6(slot7)

	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 42-44, warpins: 1 ---
		slot6 = slot3

		slot6()

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 45-50, warpins: 1 ---
	slot7 = slot5
	slot6 = slot5.SetEndEvent

	function slot8(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.SetActive
		slot3 = false

		slot1(slot2, slot3)

		slot1 = slot1

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-10, warpins: 1 ---
			slot1 = slot1

			slot1()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-11, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot6(slot7, slot8)

	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 51-51, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 52-52, warpins: 2 ---
	--- END OF BLOCK #4 ---



end

slot0.PlayInsideParticleSystem = slot6

function slot6(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-4, warpins: 1 ---
		slot3 = slot2

		slot3()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-5, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.PlaySonarDetectAnim = slot6

function slot6(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = pg
	slot2 = slot2.chapter_pop_template
	slot3 = slot1.id
	slot2 = slot2[slot3]

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		slot3 = slot2.slg_effect
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-11, warpins: 2 ---
	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-15, warpins: 1 ---
		slot4 = #slot3
		slot5 = 0

		if slot4 <= slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-16, warpins: 2 ---
			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-21, warpins: 1 ---
	function slot4()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-56, warpins: 1 ---
		slot0 = slot0
		slot0 = slot0.spotlighteffect
		slot1 = setParent
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3.plane
		slot4 = false

		slot1(slot2, slot3, slot4)

		slot1 = slot1
		slot1 = slot1.indexMin
		slot2 = slot1
		slot2 = slot2.indexMax
		slot1 = slot1 + slot2
		slot1 = slot1 / 2
		slot2 = slot1
		slot2 = slot2.theme
		slot3 = slot2
		slot2 = slot2.GetLinePosition
		slot4 = slot1.x
		slot5 = slot1.y
		slot5 = slot5 - 1
		slot2 = slot2(slot3, slot4, slot5)
		slot3 = slot2.x
		slot4 = slot0
		slot4 = slot4.plane
		slot4 = slot4.rect
		slot4 = slot4.width
		slot4 = slot4 / 2
		slot3 = slot3 - slot4
		slot2.x = slot3
		slot3 = slot0.transform
		slot3.localPosition = slot2
		slot3 = slot0.transform
		slot4 = Quaternion
		slot4 = slot4.Euler
		slot5 = 0
		slot6 = 0
		slot7 = 0
		slot4 = slot4(slot5, slot6, slot7)
		slot3.rotation = slot4
		slot3 = slot0.transform
		slot4 = Vector3
		slot5 = 68.05538
		slot6 = 68.05538
		slot7 = 68.05538
		slot4 = slot4(slot5, slot6, slot7)
		slot3.localScale = slot4
		slot3 = setActive
		slot4 = slot0
		slot5 = false

		slot3(slot4, slot5)

		slot3 = setActive
		slot4 = slot0
		slot5 = true

		slot3(slot4, slot5)

		return
		--- END OF BLOCK #0 ---



	end

	onLoaded = slot4
	slot4 = slot0.spotlighteffect

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-24, warpins: 1 ---
		slot4 = onLoaded

		slot4()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-27, warpins: 1 ---
		slot4 = slot0.spotlighteffectLoading

		if slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-28, warpins: 1 ---
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-43, warpins: 1 ---
			slot4 = pg
			slot4 = slot4.PoolMgr
			slot4 = slot4.GetInstance
			slot4 = slot4()
			slot5 = slot4
			slot4 = slot4.GetPrefab
			slot6 = "effect/"
			slot7 = slot3
			slot6 = slot6 .. slot7
			slot7 = slot3
			slot8 = true

			function slot9(slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot1 = slot0
				slot1.spotlighteffect = slot0
				slot1 = onLoaded

				slot1()

				slot1 = slot0
				slot2 = nil
				slot1.spotlighteffectLoading = slot2

				return
				--- END OF BLOCK #0 ---



			end

			slot4(slot5, slot6, slot7, slot8, slot9)

			slot4 = true
			slot0.spotlighteffectLoading = slot4
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 44-45, warpins: 3 ---
	return
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 46-46, warpins: 2 ---
	--- END OF BLOCK #4 ---



end

slot0.PlaySpotLigthsEffect = slot6

function slot6(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "model"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-14, warpins: 2 ---
	slot5 = slot3
	slot4 = slot3.GetComponent
	slot6 = "SkeletonGraphic"
	slot4 = slot4(slot5, slot6)

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-23, warpins: 1 ---
		slot5 = Color
		slot5 = slot5.New
		slot6 = 1
		slot7 = 1
		slot8 = 1
		slot9 = 1
		slot5 = slot5(slot6, slot7, slot8, slot9)
		slot4.color = slot5
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-31, warpins: 1 ---
		slot5 = Color
		slot5 = slot5.New
		slot6 = 1
		slot7 = 1
		slot8 = 1
		slot9 = 0
		slot5 = slot5(slot6, slot7, slot8, slot9)
		slot4.color = slot5
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 32-32, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.SetSpineVisible = slot6

function slot6(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	slot2 = string
	slot2 = slot2.char
	slot3 = string
	slot3 = slot3.byte
	slot4 = "A"
	slot3 = slot3(slot4)
	slot4 = slot1.column
	slot3 = slot3 + slot4
	slot4 = slot0.indexMin
	slot4 = slot4.y
	slot3 = slot3 - slot4
	slot2 = slot2(slot3)
	slot3 = string
	slot3 = slot3.char
	slot4 = string
	slot4 = slot4.byte
	slot5 = "1"
	slot4 = slot4(slot5)
	slot5 = slot1.row
	slot4 = slot4 + slot5
	slot5 = slot0.indexMin
	slot5 = slot5.x
	slot4 = slot4 - slot5
	slot3 = slot3(slot4)
	slot4 = slot2
	slot5 = slot3
	slot4 = slot4 .. slot5

	return slot4
	--- END OF BLOCK #0 ---



end

slot0.TransformLine2PlanePos = slot6

function slot6(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = slot1.childCount
	slot4 = slot2
	slot5 = slot3 - 1
	slot6 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-14, warpins: 0 ---
	for slot7 = slot4, slot5, slot6 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-14, warpins: 2 ---
		slot9 = slot1
		slot8 = slot1.GetChild
		slot10 = slot7
		slot8 = slot8(slot9, slot10)
		slot9 = setActive
		slot10 = slot8
		slot11 = false

		slot9(slot10, slot11)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-18, warpins: 1 ---
	slot4 = slot3
	slot5 = slot2 - 1
	slot6 = 1

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 19-26, warpins: 0 ---
	for slot7 = slot4, slot5, slot6 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-26, warpins: 2 ---
		slot8 = cloneTplTo
		slot10 = slot1
		slot9 = slot1.GetChild
		slot11 = 0
		slot9 = slot9(slot10, slot11)
		slot10 = slot1
		slot8 = slot8(slot9, slot10)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 27-30, warpins: 1 ---
	slot4 = 0
	slot5 = slot2 - 1
	slot6 = 1

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 31-39, warpins: 0 ---
	for slot7 = slot4, slot5, slot6 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-39, warpins: 2 ---
		slot9 = slot1
		slot8 = slot1.GetChild
		slot10 = slot7
		slot8 = slot8(slot9, slot10)
		slot9 = setActive
		slot10 = slot8
		slot11 = true

		slot9(slot10, slot11)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 40-40, warpins: 1 ---
	return
	--- END OF BLOCK #6 ---



end

slot0.AlignListContainer = slot6

function slot6(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = slot0.parent
	slot3 = slot2
	slot2 = slot2.frozen
	slot4 = slot1

	slot2(slot3, slot4)

	return
	--- END OF BLOCK #0 ---



end

slot0.frozen = slot6

function slot6(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0.exited

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 2 ---
	slot1 = slot0.parent
	slot2 = slot1
	slot1 = slot1.unfrozen

	slot1(slot2)

	return
	--- END OF BLOCK #1 ---



end

slot0.unfrozen = slot6

function slot6(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = slot0.parent
	slot1 = slot1.frozenCount
	slot2 = 0

	if slot1 <= slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		slot1 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		slot1 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-9, warpins: 2 ---
	return slot1
	--- END OF BLOCK #1 ---



end

slot0.isfrozen = slot6

function slot6(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot2 = slot0
	slot1 = slot0.clearAll

	slot1(slot2)

	return
	--- END OF BLOCK #0 ---



end

slot0.clear = slot6

return slot0
