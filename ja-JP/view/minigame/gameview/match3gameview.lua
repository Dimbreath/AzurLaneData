slot0 = class
slot1 = "Match3GameView"
slot2 = import
slot3 = "..BaseMiniGameView"
slot0 = slot0(slot1, slot2(slot3))
slot1 = 6
slot2 = 7
slot3 = -405
slot4 = -275
slot5 = 135
slot6 = 110
slot7 = false
slot8 = 0.1
slot9 = 0
slot10 = 0.3
slot11 = 0.5
slot12 = 100
slot13 = 0.2
slot14 = 0.4
slot15 = 180
slot16 = 60
slot17 = 3
slot18 = 2
slot19 = 0.3
slot20 = 0.3
slot21 = 2.5
slot22 = "event:/ui/ddldaoshu2"
slot23 = "event:/ui/boat_drag"
slot24 = "event:/ui/break_out_full"
slot25 = "event:/ui/sx-good"
slot26 = "event:/ui/sx-perfect"
slot27 = "event:/ui/sx-jishu"
slot28 = "event:/ui/furnitrue_save"

function slot29(slot0)
	slot1 = "Match3GameUI"

	return slot1
end

slot0.getUIName = slot29

function slot29(slot0)
	slot1 = "backyard"

	return slot1
end

slot0.getBGM = slot29

function slot29(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "effects/sanxiaoxiaoshi"
	slot1 = slot1(slot2, slot3)
	slot0.matchEffect = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "effects/sanxiaoGood"
	slot1 = slot1(slot2, slot3)
	slot0.goodEffect = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "effects/sanxiaoGreat"
	slot1 = slot1(slot2, slot3)
	slot0.greatEffect = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "effects/sanxiaoPerfect"
	slot1 = slot1(slot2, slot3)
	slot0.perfectEffect = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "effects/hint"
	slot1 = slot1(slot2, slot3)
	slot0.hintEffect = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "effects/selected"
	slot1 = slot1(slot2, slot3)
	slot0.selectedEffect = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "effects/whiten"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = "Image"
	slot1 = slot1(slot2, slot3)
	slot1 = slot1.material
	slot0.whitenMat = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "button/back"
	slot1 = slot1(slot2, slot3)
	slot0.backBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main"
	slot1 = slot1(slot2, slot3)
	slot0.mainPage = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/start"
	slot1 = slot1(slot2, slot3)
	slot0.startBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/rule"
	slot1 = slot1(slot2, slot3)
	slot0.helpBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "countdown"
	slot1 = slot1(slot2, slot3)
	slot0.countdownPage = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "countdown"
	slot1 = slot1(slot2, slot3)
	slot0.countdownAnim = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "game"
	slot1 = slot1(slot2, slot3)
	slot0.gamePage = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "game/mask"
	slot1 = slot1(slot2, slot3)
	slot0.gameMask = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "game/warning"
	slot1 = slot1(slot2, slot3)
	slot0.warning = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "game/countdown"
	slot1 = slot1(slot2, slot3)
	slot0.countdownTf = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "game/countdown/Text"
	slot1 = slot1(slot2, slot3)
	slot0.countdownText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "game/countdown/inf"
	slot1 = slot1(slot2, slot3)
	slot0.inf = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "game/score/Text"
	slot1 = slot1(slot2, slot3)
	slot0.scoreText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "game/floatText"
	slot1 = slot1(slot2, slot3)
	slot0.floatText = slot1
	slot1 = {}
	slot0.floatChar = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "game/pause"
	slot1 = slot1(slot2, slot3)
	slot0.pausePage = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "game/pause/yes"
	slot1 = slot1(slot2, slot3)
	slot0.pauseYes = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "game/pause/no"
	slot1 = slot1(slot2, slot3)
	slot0.pauseNo = slot1
	slot1 = 0
	slot2 = 9
	slot3 = 1

	for slot4 = slot1, slot2, slot3 do
		slot5 = slot0.floatChar
		slot7 = slot0
		slot6 = slot0.findTF
		slot8 = "game/floatText/"
		slot9 = slot4
		slot8 = slot8 .. slot9
		slot6 = slot6(slot7, slot8)
		slot5[slot4] = slot6
	end

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "game/tiles"
	slot1 = slot1(slot2, slot3)
	slot0.tilesRoot = slot1
	slot1 = slot0.tilesRoot
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = "EventTriggerListener"
	slot1 = slot1(slot2, slot3)
	slot0.gameListener = slot1
	slot1 = slot0.tilesRoot
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = "UILongPressTrigger"
	slot1 = slot1(slot2, slot3)
	slot0.longPressListener = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "end"
	slot1 = slot1(slot2, slot3)
	slot0.endPage = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "end/end_btn"
	slot1 = slot1(slot2, slot3)
	slot0.endBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "end/score/Text"
	slot1 = slot1(slot2, slot3)
	slot0.endScore = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "end/score/Text/new"
	slot1 = slot1(slot2, slot3)
	slot0.newSign = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "end/highest/Text"
	slot1 = slot1(slot2, slot3)
	slot0.bestScore = slot1
	slot1 = {}
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "tiles/Akashi"
	slot2 = slot2(slot3, slot4)
	slot1[1] = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "tiles/Ayanami"
	slot2 = slot2(slot3, slot4)
	slot1[2] = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "tiles/Javelin"
	slot2 = slot2(slot3, slot4)
	slot1[3] = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "tiles/Laffey"
	slot2 = slot2(slot3, slot4)
	slot1[4] = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "tiles/Z23"
	slot1[MULTRES] = slot2(slot3, slot4)
	slot0.tiles = slot1
end

slot0.init = slot29

function slot29(slot0)
	slot1 = isActive
	slot2 = slot0.mainPage
	slot1 = slot1(slot2)

	if slot1 then
		slot2 = slot0
		slot1 = slot0.emit
		slot3 = slot0
		slot3 = slot3.ON_BACK

		slot1(slot2, slot3)
	else
		slot1 = isActive
		slot2 = slot0.pausePage
		slot1 = slot1(slot2)

		if slot1 then
			slot1 = triggerButton
			slot2 = slot0.pauseNo

			slot1(slot2)
		else
			slot1 = isActive
			slot2 = slot0.gamePage
			slot1 = slot1(slot2)

			if slot1 then
				slot2 = slot0
				slot1 = slot0.pause

				slot1(slot2)
			else
				slot1 = isActive
				slot2 = slot0.endPage
				slot1 = slot1(slot2)

				if slot1 then
					slot1 = slot0.endBtn
					slot2 = slot1
					slot1 = slot1.GetComponent
					slot3 = "Button"
					slot1 = slot1(slot2, slot3)
					slot1 = slot1.enabled

					if slot1 then
						slot1 = triggerButton
						slot2 = slot0.endBtn

						slot1(slot2)
					end
				end
			end
		end
	end
end

slot0.onBackPressed = slot29

function slot29(slot0)
	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.backBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.onBackPressed

		slot0(slot1)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.startBtn

	function slot4()
		slot0 = slot0

		if slot0 then
			slot0 = setActive
			slot1 = slot1
			slot1 = slot1.mainPage
			slot2 = false

			slot0(slot1, slot2)

			slot0 = setActive
			slot1 = slot1
			slot1 = slot1.gamePage
			slot2 = true

			slot0(slot1, slot2)

			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.startGame

			slot0(slot1)
		else
			slot0 = slot1
			slot0 = slot0.mainPage
			slot1 = slot0
			slot0 = slot0.GetComponent
			slot2 = "CanvasGroup"
			slot0 = slot0(slot1, slot2)
			slot1 = false
			slot0.blocksRaycasts = slot1
			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.managedTween
			slot2 = LeanTween
			slot2 = slot2.value

			function slot3()
				slot0 = slot0
				slot0 = slot0.mainPage
				slot1 = slot0
				slot0 = slot0.GetComponent
				slot2 = "CanvasGroup"
				slot0 = slot0(slot1, slot2)
				slot1 = 1
				slot0.alpha = slot1
				slot0 = slot0
				slot0 = slot0.mainPage
				slot1 = slot0
				slot0 = slot0.GetComponent
				slot2 = "CanvasGroup"
				slot0 = slot0(slot1, slot2)
				slot1 = true
				slot0.blocksRaycasts = slot1
				slot0 = setActive
				slot1 = slot0
				slot1 = slot1.mainPage
				slot2 = false

				slot0(slot1, slot2)

				slot0 = setActive
				slot1 = slot0
				slot1 = slot1.countdownPage
				slot2 = true

				slot0(slot1, slot2)

				slot0 = playSoundEffect
				slot1 = slot1

				slot0(slot1)
			end

			slot4 = go
			slot5 = slot1
			slot5 = slot5.mainPage
			slot4 = slot4(slot5)
			slot5 = 1
			slot6 = 0
			slot7 = slot3
			slot0 = slot0(slot1, slot2, slot3, slot4, slot5, slot6, slot7)
			slot1 = slot0
			slot0 = slot0.setOnUpdate
			slot2 = System
			slot2 = slot2.Action_float

			function slot3(slot0)
				slot1 = slot0
				slot1 = slot1.mainPage
				slot2 = slot1
				slot1 = slot1.GetComponent
				slot3 = "CanvasGroup"
				slot1 = slot1(slot2, slot3)
				slot1.alpha = slot0
			end

			slot0(slot1, slot2(slot3))
		end
	end

	slot1(slot2, slot3, slot4)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.helpBtn

	function slot4()
		slot0 = pg
		slot0 = slot0.MsgboxMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.ShowMsgBox
		slot2 = {}
		slot3 = MSGBOX_TYPE_HELP
		slot2.type = slot3
		slot3 = i18n
		slot4 = "3match_tip"
		slot3 = slot3(slot4)
		slot2.helps = slot3

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = slot0.countdownAnim
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = DftAniEvent
	slot1 = slot1(slot2, slot3(slot4))
	slot3 = slot1
	slot2 = slot1.SetEndEvent

	function slot4(slot0)
		slot1 = setActive
		slot2 = slot0
		slot2 = slot2.countdownPage
		slot3 = false

		slot1(slot2, slot3)

		slot1 = setActive
		slot2 = slot0
		slot2 = slot2.gamePage
		slot3 = true

		slot1(slot2, slot3)

		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.startGame

		slot1(slot2)
	end

	slot2(slot3, slot4)

	slot2 = onButton
	slot3 = slot0
	slot4 = slot0.endBtn

	function slot5()
		slot0 = slot0
		slot0 = slot0.mainPage
		slot1 = slot0
		slot0 = slot0.GetComponent
		slot2 = "CanvasGroup"
		slot0 = slot0(slot1, slot2)
		slot1 = false
		slot0.blocksRaycasts = slot1
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.managedTween
		slot2 = LeanTween
		slot2 = slot2.value

		function slot3()
			slot0 = slot0
			slot0 = slot0.mainPage
			slot1 = slot0
			slot0 = slot0.GetComponent
			slot2 = "CanvasGroup"
			slot0 = slot0(slot1, slot2)
			slot1 = 1
			slot0.alpha = slot1
			slot0 = slot0
			slot0 = slot0.mainPage
			slot1 = slot0
			slot0 = slot0.GetComponent
			slot2 = "CanvasGroup"
			slot0 = slot0(slot1, slot2)
			slot1 = true
			slot0.blocksRaycasts = slot1
		end

		slot4 = go
		slot5 = slot0
		slot5 = slot5.endPage
		slot4 = slot4(slot5)
		slot5 = 0
		slot6 = 1
		slot7 = slot1
		slot0 = slot0(slot1, slot2, slot3, slot4, slot5, slot6, slot7)
		slot1 = slot0
		slot0 = slot0.setOnUpdate
		slot2 = System
		slot2 = slot2.Action_float

		function slot3(slot0)
			slot1 = slot0
			slot1 = slot1.mainPage
			slot2 = slot1
			slot1 = slot1.GetComponent
			slot3 = "CanvasGroup"
			slot1 = slot1(slot2, slot3)
			slot1.alpha = slot0
		end

		slot0(slot1, slot2(slot3))

		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.mainPage
		slot2 = true

		slot0(slot1, slot2)

		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.countdownPage
		slot2 = false

		slot0(slot1, slot2)

		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.gamePage
		slot2 = false

		slot0(slot1, slot2)

		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.endPage
		slot2 = false

		slot0(slot1, slot2)
	end

	slot2(slot3, slot4, slot5)

	slot2 = onButton
	slot3 = slot0
	slot4 = slot0.pauseYes

	function slot5()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.stopGame

		slot0(slot1)
	end

	slot2(slot3, slot4, slot5)

	slot2 = onButton
	slot3 = slot0
	slot4 = slot0.pauseNo

	function slot5()
		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.pausePage
		slot2 = false

		slot0(slot1, slot2)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.resumeGame

		slot0(slot1)
	end

	slot2(slot3, slot4, slot5)

	slot2 = false
	slot3 = slot0.gameListener
	slot4 = slot3
	slot3 = slot3.AddPointClickFunc

	function slot5(slot0, slot1)
		slot2 = slot0

		if slot2 then
			slot0 = false

			return
		end

		slot2 = slot1
		slot2 = slot2.updating

		if slot2 then
			return
		end

		slot2 = slot1
		slot2 = slot2.inGame

		if not slot2 then
			return
		end

		slot2 = LuaHelper
		slot2 = slot2.ScreenToLocal
		slot3 = slot1
		slot3 = slot3.tilesRoot
		slot4 = slot1.position
		slot5 = GameObject
		slot5 = slot5.Find
		slot6 = "UICamera"
		slot5 = slot5(slot6)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Camera
		slot2 = slot2(slot3, slot4, slot5(slot6, slot7(slot8)))
		slot3 = slot1
		slot4 = slot3
		slot3 = slot3.pos2index
		slot5 = slot2
		slot3, slot4 = slot3(slot4, slot5)
		slot5 = slot1
		slot5 = slot5.selected

		if slot5 then
			slot5 = slot1
			slot5 = slot5.selected
			slot6 = slot1
			slot6 = slot6.tileTfs
			slot6 = slot6[slot3]
			slot6 = slot6[slot4]

			if slot5 == slot6 then
				slot5 = slot1
				slot6 = slot5
				slot5 = slot5.unselect

				slot5(slot6)
			else
				slot5 = math
				slot5 = slot5.abs
				slot6 = slot1
				slot6 = slot6.selectedIndex
				slot6 = slot6.i
				slot6 = slot3 - slot6
				slot5 = slot5(slot6)
				slot6 = math
				slot6 = slot6.abs
				slot7 = slot1
				slot7 = slot7.selectedIndex
				slot7 = slot7.j
				slot7 = slot4 - slot7
				slot6 = slot6(slot7)
				slot5 = slot5 + slot6

				if slot5 == 1 then
					slot5 = slot1
					slot6 = slot5
					slot5 = slot5.tryMoveTo
					slot7 = {
						i = slot3,
						j = slot4
					}

					slot5(slot6, slot7)
				else
					slot5 = slot1
					slot6 = slot5
					slot5 = slot5.select
					slot7 = slot3
					slot8 = slot4

					slot5(slot6, slot7, slot8)
				end
			end
		else
			slot5 = slot1
			slot6 = slot5
			slot5 = slot5.select
			slot7 = slot3
			slot8 = slot4

			slot5(slot6, slot7, slot8)
		end
	end

	slot3(slot4, slot5)

	slot3 = slot0.longPressListener
	slot3 = slot3.onLongPressed
	slot4 = slot3
	slot3 = slot3.AddListener

	function slot5()
		slot0 = slot0
		slot0 = slot0.updating

		if slot0 then
			return
		end

		slot0 = slot0
		slot0 = slot0.inGame

		if not slot0 then
			return
		end

		slot0 = LuaHelper
		slot0 = slot0.ScreenToLocal
		slot1 = slot0
		slot1 = slot1.tilesRoot
		slot2 = Input
		slot2 = slot2.mousePosition
		slot3 = GameObject
		slot3 = slot3.Find
		slot4 = "UICamera"
		slot3 = slot3(slot4)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = Camera
		slot0 = slot0(slot1, slot2, slot3(slot4, slot5(slot6)))
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.pos2index
		slot3 = slot0
		slot1, slot2 = slot1(slot2, slot3)
		slot3 = slot0
		slot4 = slot3
		slot3 = slot3.unselect

		slot3(slot4)

		slot3 = slot0
		slot4 = slot3
		slot3 = slot3.animate
		slot5 = slot1
		slot6 = slot2
		slot7 = true

		slot3(slot4, slot5, slot6, slot7)
	end

	slot3(slot4, slot5)

	slot3 = slot0.gameListener
	slot4 = slot3
	slot3 = slot3.AddBeginDragFunc

	function slot5(slot0, slot1)
		slot2 = slot0
		slot2 = slot2.updating

		if slot2 then
			return
		end

		slot2 = slot0
		slot2 = slot2.inGame

		if not slot2 then
			return
		end

		slot1 = true
		slot2 = slot1.delta
		slot3 = LuaHelper
		slot3 = slot3.ScreenToLocal
		slot4 = slot0
		slot4 = slot4.tilesRoot
		slot5 = slot1.position
		slot6 = GameObject
		slot6 = slot6.Find
		slot7 = "UICamera"
		slot6 = slot6(slot7)
		slot7 = slot6
		slot6 = slot6.GetComponent
		slot8 = typeof
		slot9 = Camera
		slot3 = slot3(slot4, slot5, slot6(slot7, slot8(slot9)))
		slot4 = slot0
		slot5 = slot4
		slot4 = slot4.pos2index
		slot6 = slot3
		slot4, slot5 = slot4(slot5, slot6)
		slot6 = slot0
		slot7 = slot6
		slot6 = slot6.animate
		slot8 = slot4
		slot9 = slot5
		slot10 = false

		slot6(slot7, slot8, slot9, slot10)

		slot6 = slot0
		slot7 = slot6
		slot6 = slot6.unselect

		slot6(slot7)

		slot6 = slot0
		slot7 = slot0
		slot7 = slot7.tileTfs
		slot7 = slot7[slot4]
		slot7 = slot7[slot5]
		slot6.selected = slot7
		slot6 = slot0
		slot7 = {
			i = slot4,
			j = slot5
		}
		slot6.selectedIndex = slot7
		slot6 = math
		slot6 = slot6.abs
		slot7 = slot2.x
		slot6 = slot6(slot7)
		slot7 = math
		slot7 = slot7.abs
		slot8 = slot2.y
		slot7 = slot7(slot8)

		if slot7 < slot6 then
			slot4 = 0
			slot5 = (slot2.x > 0 and 1) or -1
		else
			slot4 = (slot2.y > 0 and 1) or -1
			slot5 = 0
		end

		slot6 = slot0
		slot7 = slot6
		slot6 = slot6.tryMoveTo
		slot8 = {}
		slot9 = slot0
		slot9 = slot9.selectedIndex
		slot9 = slot9.i
		slot9 = slot9 + slot4
		slot8.i = slot9
		slot9 = slot0
		slot9 = slot9.selectedIndex
		slot9 = slot9.j
		slot9 = slot9 + slot5
		slot8.j = slot9

		slot6(slot7, slot8)
	end

	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = slot0.mainPage
	slot5 = true

	slot3(slot4, slot5)

	slot4 = slot0
	slot3 = slot0.updateData

	slot3(slot4)
end

slot0.didEnter = slot29

function slot29(slot0)

	-- Decompilation error in this vicinity:
	slot0.infinite = slot0:GetMGHubData().count == 0
	slot2 = slot0:GetMGData():GetRuntimeData("elements")
	slot0.best = slot2[1] or 0
end

slot0.updateData = slot29

function slot29(slot0, slot1, slot2)
	slot3 = Vector3
	slot3 = slot3.New
	slot4 = slot0
	slot5 = slot2 - 1
	slot6 = slot1
	slot5 = slot5 * slot6
	slot4 = slot4 + slot5
	slot5 = slot2
	slot6 = slot1 - 1
	slot7 = slot3
	slot6 = slot6 * slot7
	slot5 = slot5 + slot6

	return slot3(slot4, slot5)
end

slot0.index2pos = slot29

function slot29(slot0, slot1)
	slot2 = slot0
	slot3 = slot1
	slot3 = slot3 / 2
	slot2 = slot2 - slot3
	slot3 = slot2
	slot4 = slot3
	slot4 = slot4 / 2
	slot3 = slot3 - slot4
	slot4 = math
	slot4 = slot4.ceil
	slot5 = slot1.y
	slot5 = slot5 - slot3
	slot6 = slot3
	slot5 = slot5 / slot6
	slot4 = slot4(slot5)
	slot5 = math
	slot5 = slot5.ceil
	slot6 = slot1.x
	slot6 = slot6 - slot2
	slot7 = slot1
	slot6 = slot6 / slot7

	return slot4, slot5(slot6)
end

slot0.pos2index = slot29

function slot29(slot0)
	slot1 = math
	slot1 = slot1.max
	slot2 = slot0
	slot2 = slot0 * slot2
	slot3 = slot1

	return slot1(slot2, slot3)
end

slot0.dropTime = slot29

function slot29(slot0)
	slot1 = slot0.hint

	if slot1 then
		slot1 = Destroy
		slot2 = slot0.hint

		slot1(slot2)

		slot1 = slot0.hint1
		slot2 = slot1
		slot1 = slot1.GetComponent
		slot3 = "Animator"
		slot1 = slot1(slot2, slot3)
		slot2 = slot1
		slot1 = slot1.SetBool
		slot3 = "selected"
		slot4 = false

		slot1(slot2, slot3, slot4)

		slot1 = slot0.hint2
		slot2 = slot1
		slot1 = slot1.GetComponent
		slot3 = "Animator"
		slot1 = slot1(slot2, slot3)
		slot2 = slot1
		slot1 = slot1.SetBool
		slot3 = "selected"
		slot4 = false

		slot1(slot2, slot3, slot4)

		slot1 = nil
		slot0.hint = slot1
		slot1 = nil
		slot0.hint1 = slot1
		slot1 = nil
		slot0.hint2 = slot1
	end
end

slot0.cancelHint = slot29
slot29 = {}
slot30 = {
	0,
	1
}
slot29[1] = slot30
slot30 = {
	0,
	-1
}
slot29[2] = slot30
slot30 = {
	-1,
	0
}
slot29[3] = slot30
slot30 = {
	1,
	0
}
slot29[4] = slot30

function slot30(slot0)
	slot1 = slot0.selectedEffectTf

	if slot1 then
		slot1 = Destroy
		slot2 = slot0.selectedEffectTf

		slot1(slot2)

		slot1 = nil
		slot0.selectedEffectTf = slot1
	end

	slot1 = slot0.selected

	if slot1 then
		slot2 = slot0
		slot1 = slot0.animate
		slot3 = slot0.selectedIndex
		slot3 = slot3.i
		slot4 = slot0.selectedIndex
		slot4 = slot4.j
		slot5 = false

		slot1(slot2, slot3, slot4, slot5)

		slot1 = nil
		slot0.selected = slot1
		slot1 = nil
		slot0.selectedIndex = slot1
		slot2 = slot0
		slot1 = slot0.reorderTiles

		slot1(slot2)
	end
end

slot0.unselect = slot30

function slot30(slot0, slot1, slot2)
	slot4 = slot0
	slot3 = slot0.unselect

	slot3(slot4)

	slot3 = slot0.tileTfs
	slot3 = slot3[slot1]
	slot3 = slot3[slot2]
	slot0.selected = slot3
	slot3 = {
		i = slot1,
		j = slot2
	}
	slot0.selectedIndex = slot3
	slot3 = rtf
	slot4 = cloneTplTo
	slot5 = slot0.selectedEffect
	slot6 = slot0.tilesRoot
	slot3 = slot3(slot4(slot5, slot6))
	slot0.selectedEffectTf = slot3
	slot3 = slot0.selectedEffectTf
	slot4 = slot0.selected
	slot4 = slot4.anchoredPosition
	slot3.anchoredPosition = slot4
	slot3 = slot0.selected
	slot4 = slot3
	slot3 = slot3.SetAsLastSibling

	slot3(slot4)

	slot4 = slot0
	slot3 = slot0.animate
	slot5 = slot1
	slot6 = slot2
	slot7 = true

	slot3(slot4, slot5, slot6, slot7)
end

slot0.select = slot30

function slot30(slot0, slot1, slot2, slot3)
	slot4 = slot0.tileTfs
	slot4 = slot4[slot1]
	slot4 = slot4[slot2]

	if not slot4 then
		slot4 = warning
		slot5 = "bad position"
		slot6 = slot1
		slot7 = slot2

		slot4(slot5, slot6, slot7)
	end

	slot4 = slot0.tileTfs
	slot4 = slot4[slot1]
	slot4 = slot4[slot2]
	slot5 = slot4
	slot4 = slot4.GetComponent
	slot6 = "Animator"
	slot4 = slot4(slot5, slot6)
	slot5 = slot4
	slot4 = slot4.SetBool
	slot6 = "selected"
	slot7 = slot3

	slot4(slot5, slot6, slot7)

	slot4 = pairs
	slot5 = slot0
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = slot0.tileTfs
		slot10 = slot8[1]
		slot10 = slot1 + slot10
		slot9 = slot9[slot10]
		slot10 = slot8[2]
		slot10 = slot2 + slot10
		slot9 = slot9[slot10]

		if slot9 then
			slot11 = slot9
			slot10 = slot9.GetComponent
			slot12 = "Animator"
			slot10 = slot10(slot11, slot12)
			slot11 = slot10
			slot10 = slot10.SetBool
			slot12 = "selected"
			slot13 = slot3

			slot10(slot11, slot12, slot13)
		end
	end

	slot4 = slot0.hint

	if slot4 then
		slot4 = slot0.hint1
		slot5 = slot4
		slot4 = slot4.GetComponent
		slot6 = "Animator"
		slot4 = slot4(slot5, slot6)
		slot5 = slot4
		slot4 = slot4.SetBool
		slot6 = "selected"
		slot7 = true

		slot4(slot5, slot6, slot7)

		slot4 = slot0.hint2
		slot5 = slot4
		slot4 = slot4.GetComponent
		slot6 = "Animator"
		slot4 = slot4(slot5, slot6)
		slot5 = slot4
		slot4 = slot4.SetBool
		slot6 = "selected"
		slot7 = true

		slot4(slot5, slot6, slot7)
	end
end

slot0.animate = slot30

function slot30(slot0, slot1)
	slot2 = slot0.selectedIndex

	if slot2 == nil then
		return
	end

	slot2 = slot0.hintTimer

	if slot2 then
		slot2 = slot0.hintTimer
		slot3 = slot2
		slot2 = slot2.Pause

		slot2(slot3)
	end

	slot2 = slot0.tileIndicies
	slot3 = slot1.i
	slot2 = slot2[slot3]
	slot3 = slot1.j
	slot2 = slot2[slot3]

	if not slot2 then
		return
	end

	slot2 = playSoundEffect
	slot3 = slot0

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.moveValid
	slot4 = slot0.selectedIndex
	slot5 = slot1
	slot2 = slot2(slot3, slot4, slot5)

	if slot2 then
		slot2 = slot0.selectedIndex
		slot4 = slot0
		slot3 = slot0.unselect

		slot3(slot4)

		slot3 = true
		slot0.updating = slot3
		slot4 = slot0
		slot3 = slot0.swap
		slot5 = slot2
		slot6 = slot1

		slot3(slot4, slot5, slot6)

		slot4 = slot0
		slot3 = slot0.managedTween
		slot5 = LeanTween
		slot5 = slot5.delayedCall

		function slot6()
			slot0 = slot0
			slot0 = slot0.inGame

			if not slot0 then
				return
			end

			slot0 = slot0
			slot1 = 0
			slot0.combo = slot1
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.update

			slot0(slot1)
		end

		slot7 = slot1
		slot8 = nil

		slot3(slot4, slot5, slot6, slot7, slot8)
	else
		slot2 = slot0.tileTfs
		slot3 = slot0.selectedIndex
		slot3 = slot3.i
		slot2 = slot2[slot3]
		slot3 = slot0.selectedIndex
		slot3 = slot3.j
		slot2 = slot2[slot3]
		slot3 = slot0.tileTfs
		slot4 = slot1.i
		slot3 = slot3[slot4]
		slot4 = slot1.j
		slot3 = slot3[slot4]
		slot5 = slot0
		slot4 = slot0.index2pos
		slot6 = slot0.selectedIndex
		slot6 = slot6.i
		slot7 = slot0.selectedIndex
		slot7 = slot7.j
		slot4 = slot4(slot5, slot6, slot7)
		slot6 = slot0
		slot5 = slot0.index2pos
		slot7 = slot1.i
		slot8 = slot1.j
		slot5 = slot5(slot6, slot7, slot8)
		slot7 = slot0
		slot6 = slot0.managedTween
		slot8 = LeanTween
		slot8 = slot8.move
		slot9 = nil
		slot10 = slot2
		slot11 = slot5
		slot12 = slot1
		slot6 = slot6(slot7, slot8, slot9, slot10, slot11, slot12)
		slot7 = slot6
		slot6 = slot6.setLoopPingPong
		slot8 = 1

		slot6(slot7, slot8)

		slot7 = slot0
		slot6 = slot0.managedTween
		slot8 = LeanTween
		slot8 = slot8.move
		slot9 = nil
		slot10 = slot3
		slot11 = slot4
		slot12 = slot1
		slot6 = slot6(slot7, slot8, slot9, slot10, slot11, slot12)
		slot7 = slot6
		slot6 = slot6.setLoopPingPong
		slot8 = 1

		slot6(slot7, slot8)

		slot6 = true
		slot0.updating = slot6
		slot7 = slot0
		slot6 = slot0.managedTween
		slot8 = LeanTween
		slot8 = slot8.delayedCall

		function slot9()
			slot0 = slot0
			slot1 = false
			slot0.updating = slot1
			slot0 = slot0
			slot0 = slot0.hintTimer
			slot1 = slot0
			slot0 = slot0.Resume

			slot0(slot1)
		end

		slot10 = slot1
		slot10 = slot10 * 2
		slot10 = slot10 + 0.1
		slot11 = nil

		slot6(slot7, slot8, slot9, slot10, slot11)

		slot7 = slot0
		slot6 = slot0.unselect

		slot6(slot7)
	end
end

slot0.tryMoveTo = slot30
slot30 = {}
slot31 = {}
slot32 = {
	0,
	-2
}
slot31[1] = slot32
slot32 = {
	0,
	-1
}
slot31[2] = slot32
slot30[1] = slot31
slot31 = {}
slot32 = {
	0,
	-1
}
slot31[1] = slot32
slot32 = {
	0,
	1
}
slot31[2] = slot32
slot30[2] = slot31
slot31 = {}
slot32 = {
	0,
	1
}
slot31[1] = slot32
slot32 = {
	0,
	2
}
slot31[2] = slot32
slot30[3] = slot31

function slot31(slot0, slot1)
	slot2 = pairs
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7, slot8, slot9 = nil
		slot10 = slot0.tileIndicies
		slot11 = slot1.i
		slot10 = slot10[slot11]
		slot11 = slot1.j
		slot7 = slot10[slot11]
		slot10 = slot0.tileIndicies
		slot11 = slot1.i
		slot12 = slot6[1]
		slot12 = slot12[1]
		slot11 = slot11 + slot12
		slot10 = slot10[slot11]
		slot11 = slot1.j
		slot12 = slot6[1]
		slot12 = slot12[2]
		slot11 = slot11 + slot12
		slot8 = slot10[slot11]
		slot10 = slot0.tileIndicies
		slot11 = slot1.i
		slot12 = slot6[2]
		slot12 = slot12[1]
		slot11 = slot11 + slot12
		slot10 = slot10[slot11]
		slot11 = slot1.j
		slot12 = slot6[2]
		slot12 = slot12[2]
		slot11 = slot11 + slot12
		slot9 = slot10[slot11]

		if slot7 == slot8 and slot7 == slot9 then
			slot10 = true

			return slot10
		end

		slot10 = slot0.tileIndicies
		slot11 = slot1.i
		slot12 = slot6[1]
		slot12 = slot12[2]
		slot11 = slot11 + slot12
		slot10 = slot10[slot11]
		slot11 = slot1.j
		slot12 = slot6[1]
		slot12 = slot12[1]
		slot11 = slot11 + slot12
		slot8 = slot10[slot11]
		slot10 = slot0.tileIndicies
		slot11 = slot1.i
		slot12 = slot6[2]
		slot12 = slot12[2]
		slot11 = slot11 + slot12
		slot10 = slot10[slot11]
		slot11 = slot1.j
		slot12 = slot6[2]
		slot12 = slot12[1]
		slot11 = slot11 + slot12
		slot9 = slot10[slot11]

		if slot7 == slot8 and slot7 == slot9 then
			slot10 = true

			return slot10
		end
	end

	slot2 = false

	return slot2
end

slot0.isConnected = slot31

function slot31(slot0, slot1, slot2)
	slot3 = slot0.tileIndicies
	slot4 = slot1.i
	slot3 = slot3[slot4]
	slot4 = slot1.j
	slot5 = slot0.tileIndicies
	slot6 = slot2.i
	slot5 = slot5[slot6]
	slot6 = slot2.j
	slot7 = slot0.tileIndicies
	slot8 = slot2.i
	slot7 = slot7[slot8]
	slot8 = slot2.j
	slot7 = slot7[slot8]
	slot8 = slot0.tileIndicies
	slot9 = slot1.i
	slot8 = slot8[slot9]
	slot9 = slot1.j
	slot8 = slot8[slot9]
	slot5[slot6] = slot8
	slot3[slot4] = slot7
	slot4 = slot0
	slot3 = slot0.isConnected
	slot5 = slot1
	slot3 = slot3(slot4, slot5)

	if not slot3 then
		slot4 = slot0
		slot3 = slot0.isConnected
		slot5 = slot2
		slot3 = slot3(slot4, slot5)
	end

	slot4 = slot0.tileIndicies
	slot5 = slot1.i
	slot4 = slot4[slot5]
	slot5 = slot1.j
	slot6 = slot0.tileIndicies
	slot7 = slot2.i
	slot6 = slot6[slot7]
	slot7 = slot2.j
	slot8 = slot0.tileIndicies
	slot9 = slot2.i
	slot8 = slot8[slot9]
	slot9 = slot2.j
	slot8 = slot8[slot9]
	slot9 = slot0.tileIndicies
	slot10 = slot1.i
	slot9 = slot9[slot10]
	slot10 = slot1.j
	slot9 = slot9[slot10]
	slot6[slot7] = slot9
	slot4[slot5] = slot8

	return slot3
end

slot0.moveValid = slot31

function slot31(slot0, slot1, slot2, slot3)
	slot0:managedTween(LeanTween.move, nil, slot1, slot0:index2pos(slot2.i, slot2.j), slot3 or 0):setEase(LeanTweenType.easeInQuad)
end

slot0.moveTile = slot31

function slot31(slot0, slot1, slot2)
	slot3 = slot0.tileTfs
	slot4 = slot1.i
	slot3 = slot3[slot4]
	slot4 = slot1.j
	slot3 = slot3[slot4]
	slot4 = slot0.tileTfs
	slot5 = slot2.i
	slot4 = slot4[slot5]
	slot5 = slot2.j
	slot4 = slot4[slot5]
	slot6 = slot0
	slot5 = slot0.moveTile
	slot7 = slot3
	slot8 = slot2
	slot9 = slot0

	slot5(slot6, slot7, slot8, slot9)

	slot6 = slot0
	slot5 = slot0.moveTile
	slot7 = slot4
	slot8 = slot1
	slot9 = slot0

	slot5(slot6, slot7, slot8, slot9)

	slot5 = slot0.tileTfs
	slot6 = slot1.i
	slot5 = slot5[slot6]
	slot6 = slot1.j
	slot7 = slot0.tileTfs
	slot8 = slot2.i
	slot7 = slot7[slot8]
	slot8 = slot2.j
	slot9 = slot0.tileTfs
	slot10 = slot2.i
	slot9 = slot9[slot10]
	slot10 = slot2.j
	slot9 = slot9[slot10]
	slot10 = slot0.tileTfs
	slot11 = slot1.i
	slot10 = slot10[slot11]
	slot11 = slot1.j
	slot10 = slot10[slot11]
	slot7[slot8] = slot10
	slot5[slot6] = slot9
	slot5 = slot0.tileIndicies
	slot6 = slot1.i
	slot5 = slot5[slot6]
	slot6 = slot1.j
	slot7 = slot0.tileIndicies
	slot8 = slot2.i
	slot7 = slot7[slot8]
	slot8 = slot2.j
	slot9 = slot0.tileIndicies
	slot10 = slot2.i
	slot9 = slot9[slot10]
	slot10 = slot2.j
	slot9 = slot9[slot10]
	slot10 = slot0.tileIndicies
	slot11 = slot1.i
	slot10 = slot10[slot11]
	slot11 = slot1.j
	slot10 = slot10[slot11]
	slot7[slot8] = slot10
	slot5[slot6] = slot9
end

slot0.swap = slot31

function slot31(slot0, slot1)
	slot2 = math
	slot2 = slot2.floor
	slot3 = slot1 / 60
	slot2 = slot2(slot3)
	slot3 = slot2 * 60
	slot1 = slot1 - slot3
	slot3 = math
	slot3 = slot3.floor
	slot4 = slot1
	slot3 = slot3(slot4)
	slot4 = slot2
	slot5 = ":"
	slot6 = slot3
	slot4 = slot4 .. slot5 .. slot6

	return slot4
end

slot0.formatTime = slot31

function slot31(slot0)
	slot1 = slot0[1]

	if slot1 == 1 then
		slot1 = -90

		return slot1
	else
		slot1 = slot0[1]

		if slot1 == -1 then
			slot1 = 90

			return slot1
		else
			slot1 = slot0[2]

			if slot1 == 1 then
				slot1 = 180

				return slot1
			else
				slot1 = slot0[2]

				if slot1 == -1 then
					slot1 = 0

					return slot1
				end
			end
		end
	end
end

dir2Angle = slot31

function slot31(slot0)
	slot2 = slot0
	slot1 = slot0.updateData

	slot1(slot2)

	slot1 = Timer
	slot1 = slot1.New

	function slot2()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.managedTween
		slot2 = LeanTween
		slot2 = slot2.value

		function slot3()
			slot0 = slot0
			slot0 = slot0.gamePage
			slot1 = slot0
			slot0 = slot0.GetComponent
			slot2 = "CanvasGroup"
			slot0 = slot0(slot1, slot2)
			slot1 = 1
			slot0.alpha = slot1
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.stopGame

			slot0(slot1)
		end

		slot4 = go
		slot5 = slot0
		slot5 = slot5.gamePage
		slot4 = slot4(slot5)
		slot5 = 1
		slot6 = 0
		slot7 = slot1
		slot0 = slot0(slot1, slot2, slot3, slot4, slot5, slot6, slot7)
		slot1 = slot0
		slot0 = slot0.setOnUpdate
		slot2 = System
		slot2 = slot2.Action_float

		function slot3(slot0)
			slot1 = slot0
			slot1 = slot1.gamePage
			slot2 = slot1
			slot1 = slot1.GetComponent
			slot3 = "CanvasGroup"
			slot1 = slot1(slot2, slot3)
			slot1.alpha = slot0
		end

		slot0(slot1, slot2(slot3))

		slot0 = UpdateBeat
		slot1 = slot0
		slot0 = slot0.RemoveListener
		slot2 = slot0
		slot2 = slot2.handle

		slot0(slot1, slot2)
	end

	slot3 = slot0.infinite

	if slot3 then
		slot1 = slot1(slot2, slot1 or slot2)
		slot2 = UpdateBeat
		slot3 = slot2
		slot2 = slot2.CreateListener

		function slot4()
			slot0 = setText
			slot1 = slot0
			slot1 = slot1.countdownText
			slot2 = math
			slot2 = slot2.floor
			slot3 = slot1
			slot3 = slot3.time

			slot0(slot1, slot2(slot3))

			slot0 = slot1
			slot0 = slot0.time
			slot1 = slot2

			if slot0 <= slot1 then
				slot0 = isActive
				slot1 = slot0
				slot1 = slot1.warning
				slot0 = slot0(slot1)

				if not slot0 then
					slot0 = setActive
					slot1 = slot0
					slot1 = slot1.warning
					slot2 = true

					slot0(slot1, slot2)
				end
			end
		end

		slot5 = slot0
		slot2 = slot2(slot3, slot4, slot5)
		slot0.handle = slot2
		slot3 = slot1
		slot2 = slot1.Start

		slot2(slot3)

		slot2 = UpdateBeat
		slot3 = slot2
		slot2 = slot2.AddListener
		slot4 = slot0.handle

		slot2(slot3, slot4)

		slot0.timer = slot1
		slot2 = setActive
		slot3 = slot0.inf
		slot4 = false

		slot2(slot3, slot4)

		slot2 = setActive
		slot3 = slot0.countdownText
		slot4 = true

		slot2(slot3, slot4)

		slot2 = {}
		slot0.tileIndicies = slot2
		slot2 = -1
		slot3 = slot4
		slot3 = slot3 + 2
		slot4 = 1

		for slot5 = slot2, slot3, slot4 do
			slot6 = slot0.tileIndicies
			slot7 = {}
			slot6[slot5] = slot7
		end

		slot2 = {}
		slot0.tileTfs = slot2
		slot2 = -1
		slot3 = slot4
		slot3 = slot3 + 2
		slot4 = 1

		for slot5 = slot2, slot3, slot4 do
			slot6 = slot0.tileTfs
			slot7 = {}
			slot6[slot5] = slot7
		end
	end

	slot3 = slot0
	slot2 = slot0.fillTileIndicies

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.fillTiles
	slot4 = true

	slot2(slot3, slot4)

	slot2 = nil
	slot0.selected = slot2
	slot2 = false
	slot0.updating = slot2
	slot2 = 0
	slot0.score = slot2
	slot2 = 0
	slot0.combo = slot2
	slot2 = true
	slot0.inGame = slot2
	slot2 = setText
	slot3 = slot0.scoreText
	slot4 = slot0.score

	slot2(slot3, slot4)

	function slot2()
		slot0 = slot0
		slot0 = slot0.hint

		if slot0 then
			return
		end

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.findMove
		slot0, slot1, slot2 = slot0(slot1)
		slot3 = slot0
		slot4 = slot3
		slot3 = slot3.index2pos
		slot5 = slot0
		slot6 = slot1
		slot3 = slot3(slot4, slot5, slot6)
		slot4 = slot0
		slot5 = slot4
		slot4 = slot4.index2pos
		slot6 = slot2[1]
		slot6 = slot0 + slot6
		slot7 = slot2[2]
		slot7 = slot1 + slot7
		slot4 = slot4(slot5, slot6, slot7)
		slot3 = slot3 + slot4
		slot3 = slot3 / 2
		slot4 = rtf
		slot5 = cloneTplTo
		slot6 = slot0
		slot6 = slot6.hintEffect
		slot7 = slot0
		slot7 = slot7.tilesRoot
		slot4 = slot4(slot5(slot6, slot7))
		slot4.anchoredPosition = slot3
		slot5 = Vector3
		slot5 = slot5.New
		slot6 = 0
		slot7 = 0
		slot8 = dir2Angle
		slot9 = slot2
		slot5 = slot5(slot6, slot7, slot8(slot9))
		slot4.localEulerAngles = slot5
		slot5 = slot0
		slot5.hint = slot4
		slot5 = slot0
		slot6 = slot0
		slot6 = slot6.tileTfs
		slot6 = slot6[slot0]
		slot6 = slot6[slot1]
		slot5.hint1 = slot6
		slot5 = slot0
		slot6 = slot0
		slot6 = slot6.tileTfs
		slot7 = slot2[1]
		slot7 = slot0 + slot7
		slot6 = slot6[slot7]
		slot7 = slot2[2]
		slot7 = slot1 + slot7
		slot6 = slot6[slot7]
		slot5.hint2 = slot6
		slot5 = slot0
		slot5 = slot5.hint1
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = "Animator"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.SetBool
		slot7 = "selected"
		slot8 = true

		slot5(slot6, slot7, slot8)

		slot5 = slot0
		slot5 = slot5.hint2
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = "Animator"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.SetBool
		slot7 = "selected"
		slot8 = true

		slot5(slot6, slot7, slot8)
	end

	slot0.hintFunc = slot2
	slot2 = Timer
	slot2 = slot2.New
	slot3 = slot0.hintFunc
	slot4 = slot5
	slot2 = slot2(slot3, slot4)
	slot0.hintTimer = slot2
	slot2 = slot0.hintTimer
	slot3 = slot2
	slot2 = slot2.Start

	slot2(slot3)
end

slot0.startGame = slot31

function slot31(slot0)
	slot1 = slot0.timer

	if slot1 then
		slot1 = slot0.timer
		slot2 = slot1
		slot1 = slot1.Pause

		slot1(slot2)
	end

	slot1 = slot0.hintTimer

	if slot1 then
		slot1 = slot0.hintTimer
		slot2 = slot1
		slot1 = slot1.Pause

		slot1(slot2)
	end

	slot1 = slot0.warning

	if slot1 then
		slot1 = slot0.warning
		slot2 = slot1
		slot1 = slot1.GetComponent
		slot3 = "Animator"
		slot1 = slot1(slot2, slot3)
		slot2 = false
		slot1.enabled = slot2
	end

	slot2 = slot0
	slot1 = slot0.pauseManagedTween

	slot1(slot2)
end

slot0.pauseGame = slot31

function slot31(slot0)
	slot1 = setActive
	slot2 = slot0.pausePage
	slot3 = true

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.pauseGame

	slot1(slot2)
end

slot0.pause = slot31

function slot31(slot0)
	slot1 = slot0.timer

	if slot1 then
		slot1 = slot0.timer
		slot2 = slot1
		slot1 = slot1.Resume

		slot1(slot2)
	end

	slot1 = slot0.hintTimer

	if slot1 then
		slot1 = slot0.hintTimer
		slot2 = slot1
		slot1 = slot1.Resume

		slot1(slot2)
	end

	slot1 = slot0.warning

	if slot1 then
		slot1 = slot0.warning
		slot2 = slot1
		slot1 = slot1.GetComponent
		slot3 = "Animator"
		slot1 = slot1(slot2, slot3)
		slot2 = true
		slot1.enabled = slot2
	end

	slot2 = slot0
	slot1 = slot0.resumeManagedTween

	slot1(slot2)
end

slot0.resumeGame = slot31

function slot31(slot0)
	slot1 = {}
	slot2 = -1
	slot3 = slot0
	slot3 = slot3 + 2
	slot4 = 1

	for slot5 = slot2, slot3, slot4 do
		slot6 = {}
		slot1[slot5] = slot6
		slot6 = 1
		slot7 = slot1
		slot8 = 1

		for slot9 = slot6, slot7, slot8 do
			slot10 = slot1[slot5]
			slot11 = slot0.tileIndicies
			slot11 = slot11[slot5]
			slot11 = slot11[slot9]
			slot10[slot9] = slot11
		end
	end

	repeat
		slot2 = {}
		slot0.tileIndicies = slot2
		slot2 = -1
		slot3 = slot0
		slot3 = slot3 + 2
		slot4 = 1

		for slot5 = slot2, slot3, slot4 do
			slot6 = slot0.tileIndicies
			slot7 = {}
			slot6[slot5] = slot7
			slot6 = 1
			slot7 = slot1
			slot8 = 1

			for slot9 = slot6, slot7, slot8 do
				slot10 = slot0.tileIndicies
				slot10 = slot10[slot5]
				slot11 = slot1[slot5]
				slot11 = slot11[slot9]
				slot10[slot9] = slot11
			end
		end

		slot2 = 1
		slot3 = slot0
		slot4 = 1

		for slot5 = slot2, slot3, slot4 do
			slot6 = 1
			slot7 = slot1
			slot8 = 1

			for slot9 = slot6, slot7, slot8 do
				slot10 = slot0.tileIndicies
				slot10 = slot10[slot5]
				slot10 = slot10[slot9]

				if not slot10 then
					slot10, slot11 = nil
					slot12 = slot0.tileIndicies
					slot13 = slot5 - 1
					slot12 = slot12[slot13]
					slot12 = slot12[slot9]

					if slot12 then
						slot12 = slot0.tileIndicies
						slot13 = slot5 - 1
						slot12 = slot12[slot13]
						slot12 = slot12[slot9]
						slot13 = slot0.tileIndicies
						slot14 = slot5 - 2
						slot13 = slot13[slot14]
						slot13 = slot13[slot9]

						if slot12 == slot13 then
							slot12 = slot0.tileIndicies
							slot13 = slot5 - 1
							slot12 = slot12[slot13]
							slot10 = slot12[slot9]
						end
					end

					slot12 = slot0.tileIndicies
					slot12 = slot12[slot5]
					slot13 = slot9 - 1
					slot12 = slot12[slot13]

					if slot12 then
						slot12 = slot0.tileIndicies
						slot12 = slot12[slot5]
						slot13 = slot9 - 1
						slot12 = slot12[slot13]
						slot13 = slot0.tileIndicies
						slot13 = slot13[slot5]
						slot14 = slot9 - 2
						slot13 = slot13[slot14]

						if slot12 == slot13 then
							slot12 = slot0.tileIndicies
							slot12 = slot12[slot5]
							slot13 = slot9 - 2
							slot11 = slot12[slot13]
						end
					end

					slot12 = math
					slot12 = slot12.random
					slot13 = 1
					slot14 = slot0.tiles
					slot14 = #slot14
					slot12 = slot12(slot13, slot14)

					while slot12 == slot10 or slot12 == slot11 do
						slot13 = math
						slot13 = slot13.random
						slot14 = 1
						slot15 = slot0.tiles
						slot15 = #slot15
						slot13 = slot13(slot14, slot15)
						slot12 = slot13
					end

					slot13 = slot0.tileIndicies
					slot13 = slot13[slot5]
					slot13[slot9] = slot12
				end
			end
		end

		slot3 = slot0
		slot2 = slot0.findMove
		slot2 = slot2(slot3)
	until slot2
end

slot0.fillTileIndicies = slot31

function slot31(slot0)
	slot1 = 1
	slot2 = slot0
	slot3 = 1

	for slot4 = slot1, slot2, slot3 do
		slot5 = 1
		slot6 = slot1
		slot7 = 1

		for slot8 = slot5, slot6, slot7 do
			slot9 = slot0.tileTfs
			slot9 = slot9[slot4]
			slot9 = slot9[slot8]

			if slot9 then
				slot9 = slot0.tileTfs
				slot9 = slot9[slot4]
				slot9 = slot9[slot8]
				slot10 = slot9
				slot9 = slot9.SetAsFirstSibling

				slot9(slot10)
			end
		end
	end
end

slot0.reorderTiles = slot31

function slot31(slot0, slot1)
	slot2 = 0
	slot3 = 1
	slot4 = slot0
	slot5 = 1

	for slot6 = slot3, slot4, slot5 do
		slot7 = 0
		slot8 = slot1
		slot9 = 1
		slot10 = -1

		for slot11 = slot8, slot9, slot10 do
			slot12 = slot0.tileTfs
			slot12 = slot12[slot11]
			slot12 = slot12[slot6]

			if not slot12 then
				slot7 = slot7 + 1
			end
		end

		slot8 = math
		slot8 = slot8.max
		slot9 = slot7
		slot10 = slot2
		slot8 = slot8(slot9, slot10)
		slot2 = slot8
		slot8 = 1
		slot9 = slot1
		slot10 = 1

		for slot11 = slot8, slot9, slot10 do
			slot12 = slot0.tileTfs
			slot12 = slot12[slot11]
			slot12 = slot12[slot6]

			if not slot12 then
				slot12 = rtf
				slot13 = cloneTplTo
				slot14 = slot0.tiles
				slot15 = slot0.tileIndicies
				slot15 = slot15[slot11]
				slot15 = slot15[slot6]
				slot14 = slot14[slot15]
				slot15 = slot0.tilesRoot
				slot12 = slot12(slot13(slot14, slot15))

				if slot1 then
					slot14 = slot0
					slot13 = slot0.index2pos
					slot15 = slot11
					slot16 = slot6
					slot13 = slot13(slot14, slot15, slot16)
					slot12.anchoredPosition = slot13
				else
					slot14 = slot0
					slot13 = slot0.index2pos
					slot15 = slot11 + slot7
					slot16 = slot6
					slot13 = slot13(slot14, slot15, slot16)
					slot12.anchoredPosition = slot13
					slot14 = slot0
					slot13 = slot0.moveTile
					slot15 = slot12
					slot16 = {
						i = slot11,
						j = slot6
					}
					slot17 = slot0.dropTime
					slot18 = slot7

					slot13(slot14, slot15, slot16, slot17(slot18))
				end

				slot13 = slot0.tileTfs
				slot13 = slot13[slot11]
				slot13[slot6] = slot12
			end
		end
	end

	slot4 = slot0
	slot3 = slot0.reorderTiles

	slot3(slot4)

	return slot2
end

slot0.fillTiles = slot31
slot31 = {}
slot32 = {}
slot33 = {
	-1,
	-2
}
slot32[1] = slot33
slot33 = {
	-1,
	-1
}
slot32[2] = slot33
slot31[1] = slot32
slot32 = {}
slot33 = {
	-1,
	-1
}
slot32[1] = slot33
slot33 = {
	-1,
	1
}
slot32[2] = slot33
slot31[2] = slot32
slot32 = {}
slot33 = {
	-1,
	1
}
slot32[1] = slot33
slot33 = {
	-1,
	2
}
slot32[2] = slot33
slot31[3] = slot32

function slot32(slot0)
	slot1 = 1
	slot2 = slot0
	slot3 = 1

	for slot4 = slot1, slot2, slot3 do
		slot5 = 1
		slot6 = slot1
		slot7 = 1

		for slot8 = slot5, slot6, slot7 do
			slot9 = slot0.tileIndicies
			slot9 = slot9[slot4]
			slot9 = slot9[slot8]
			slot10, slot11 = nil
			slot12 = pairs
			slot13 = slot2
			slot12, slot13, slot14 = slot12(slot13)

			for slot15, slot16 in slot12, slot13, slot14 do
				slot17 = slot0.tileIndicies
				slot18 = slot16[1]
				slot18 = slot18[1]
				slot18 = slot4 + slot18
				slot17 = slot17[slot18]
				slot18 = slot16[1]
				slot18 = slot18[2]
				slot18 = slot8 + slot18
				slot10 = slot17[slot18]
				slot17 = slot0.tileIndicies
				slot18 = slot16[2]
				slot18 = slot18[1]
				slot18 = slot4 + slot18
				slot17 = slot17[slot18]
				slot18 = slot16[2]
				slot18 = slot18[2]
				slot18 = slot8 + slot18
				slot11 = slot17[slot18]

				if slot9 == slot10 and slot9 == slot11 then
					slot17 = slot4
					slot18 = slot8
					slot19 = {
						-1,
						0
					}

					return slot17, slot18, slot19
				end

				slot17 = slot0.tileIndicies
				slot18 = slot16[1]
				slot18 = slot18[1]
				slot18 = slot4 - slot18
				slot17 = slot17[slot18]
				slot18 = slot16[1]
				slot18 = slot18[2]
				slot18 = slot8 - slot18
				slot10 = slot17[slot18]
				slot17 = slot0.tileIndicies
				slot18 = slot16[2]
				slot18 = slot18[1]
				slot18 = slot4 - slot18
				slot17 = slot17[slot18]
				slot18 = slot16[2]
				slot18 = slot18[2]
				slot18 = slot8 - slot18
				slot11 = slot17[slot18]

				if slot9 == slot10 and slot9 == slot11 then
					slot17 = slot4
					slot18 = slot8
					slot19 = {
						1,
						0
					}

					return slot17, slot18, slot19
				end

				slot17 = slot0.tileIndicies
				slot18 = slot16[1]
				slot18 = slot18[2]
				slot18 = slot4 - slot18
				slot17 = slot17[slot18]
				slot18 = slot16[1]
				slot18 = slot18[1]
				slot18 = slot8 + slot18
				slot10 = slot17[slot18]
				slot17 = slot0.tileIndicies
				slot18 = slot16[2]
				slot18 = slot18[2]
				slot18 = slot4 - slot18
				slot17 = slot17[slot18]
				slot18 = slot16[2]
				slot18 = slot18[1]
				slot18 = slot8 + slot18
				slot11 = slot17[slot18]

				if slot9 == slot10 and slot9 == slot11 then
					slot17 = slot4
					slot18 = slot8
					slot19 = {
						0,
						-1
					}

					return slot17, slot18, slot19
				end

				slot17 = slot0.tileIndicies
				slot18 = slot16[1]
				slot18 = slot18[2]
				slot18 = slot4 + slot18
				slot17 = slot17[slot18]
				slot18 = slot16[1]
				slot18 = slot18[1]
				slot18 = slot8 - slot18
				slot10 = slot17[slot18]
				slot17 = slot0.tileIndicies
				slot18 = slot16[2]
				slot18 = slot18[2]
				slot18 = slot4 + slot18
				slot17 = slot17[slot18]
				slot18 = slot16[2]
				slot18 = slot18[1]
				slot18 = slot8 - slot18
				slot11 = slot17[slot18]

				if slot9 == slot10 and slot9 == slot11 then
					slot17 = slot4
					slot18 = slot8
					slot19 = {
						0,
						1
					}

					return slot17, slot18, slot19
				end
			end
		end
	end
end

slot0.findMove = slot32

function slot32(slot0)

	-- Decompilation error in this vicinity:
	slot1 = false
	slot0.inGame = slot1
	slot1 = setActive
	slot2 = slot0.warning
	slot3 = false

	slot1(slot2, slot3)

	slot1 = slot0.hintTimer
	slot2 = slot1
	slot1 = slot1.Reset
	slot3 = slot0.hintFunc
	slot4 = 5

	slot1(slot2, slot3, slot4)

	slot1 = slot0.hintTimer
	slot2 = slot1
	slot1 = slot1.Stop

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.cleanManagedTween
	slot3 = true

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.cancelHint

	slot1(slot2)

	slot1 = slot0.timer

	if slot1 then
		slot1 = slot0.timer
		slot2 = slot1
		slot1 = slot1.Pause

		slot1(slot2)
	end

	slot1 = slot0.handle

	if slot1 then
		slot1 = UpdateBeat
		slot2 = slot1
		slot1 = slot1.RemoveListener
		slot3 = slot0.handle

		slot1(slot2, slot3)
	end

	slot1 = 1
	slot2 = slot0
	slot3 = 1

	for slot4 = slot1, slot2, slot3 do
		slot5 = 1
		slot6 = slot1
		slot7 = 1

		for slot8 = slot5, slot6, slot7 do
			slot9 = slot0.tileTfs
			slot9 = slot9[slot4]
			slot9 = slot9[slot8]

			if slot9 then
				slot9 = Destroy
				slot10 = slot0.tileTfs
				slot10 = slot10[slot4]
				slot10 = slot10[slot8]

				slot9(slot10)
			end
		end
	end

	slot1 = slot0.selectedEffectTf

	if slot1 then
		slot1 = Destroy
		slot2 = slot0.selectedEffectTf

		slot1(slot2)

		slot1 = nil
		slot0.selectedEffectTf = slot1
	end

	slot1 = setText
	slot2 = slot0.bestScore
	slot3 = math
	slot3 = slot3.max
	slot4 = slot0.best
	slot5 = slot0.score

	slot1(slot2, slot3(slot4, slot5))

	slot1 = setActive
	slot2 = slot0.gamePage
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.pausePage
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.endBtn
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.endPage
	slot3 = true

	slot1(slot2, slot3)

	slot1 = slot0.score
	slot2 = 0

	if slot1 > slot2 then
		slot1 = playSoundEffect
		slot2 = slot2

		slot1(slot2)
	end

	slot1 = setActive
	slot2 = slot0.newSign
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setText
	slot2 = slot0.endScore
	slot3 = 0

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.managedTween
	slot3 = LeanTween
	slot3 = slot3.value

	function slot4()
		setActive(slot0.newSign, slot0.best < slot0.score)
		setActive(slot0.endBtn, true)
		setImageAlpha(slot0.endBtn, 0)

		setImageAlpha.endBtn:GetComponent("Button").enabled = false

		playSoundEffect(false)

		slot1 = playSoundEffect
		slot0 = playSoundEffect.managedTween
		slot2 = LeanTween.value

		function slot3()
			slot0 = slot0
			slot0 = slot0.endBtn
			slot1 = slot0
			slot0 = slot0.GetComponent
			slot2 = "Button"
			slot0 = slot0(slot1, slot2)
			slot1 = true
			slot0.enabled = slot1
			slot0 = slot0
			slot0 = slot0.infinite

			if not slot0 then
				slot0 = slot0
				slot0 = slot0.timer

				if slot0 then
					slot0 = slot0
					slot0 = slot0.timer
					slot0 = slot0.time
					slot1 = 0

					if slot0 <= slot1 then
						slot0 = slot0
						slot0 = slot0.infinite

						if not slot0 then
							slot0 = slot0
							slot1 = slot0
							slot0 = slot0.SendSuccess
							slot2 = 0

							slot0(slot1, slot2)
						end

						slot0 = slot0
						slot0 = slot0.score
						slot1 = slot0
						slot1 = slot1.best

						if slot1 < slot0 then
							slot0 = slot0
							slot1 = slot0
							slot0 = slot0.StoreDataToServer
							slot2 = {}
							slot3 = slot0
							slot3 = slot3.score
							slot2[1] = slot3

							slot0(slot1, slot2)
						end
					end
				end
			end

			slot0 = slot0
			slot1 = nil
			slot0.timer = slot1
		end

		slot4 = go
		slot5 = slot0
		slot5 = slot5.endBtn
		slot4 = slot4(slot5)
		slot5 = 0
		slot6 = 1
		slot7 = slot2
		slot0 = slot0(slot1, slot2, slot3, slot4, slot5, slot6, slot7)
		slot1 = slot0
		slot0 = slot0.setOnUpdate
		slot2 = System
		slot2 = slot2.Action_float

		function slot3(slot0)
			slot1 = setImageAlpha
			slot2 = slot0
			slot2 = slot2.endBtn
			slot3 = slot0

			slot1(slot2, slot3)
		end

		slot0(slot1, slot2(slot3))
	end

	slot5 = go
	slot6 = slot0.endScore
	slot5 = slot5(slot6)
	slot6 = 0
	slot7 = slot0.score
	slot8 = slot0.score
	slot9 = 0

	slot1(slot2, slot3, slot4, slot5, slot6, slot7, slot5 or 0):setOnUpdate(System.Action_float(function (slot0)
		setText(slot0.endScore, math.floor(slot0))
	end))
end

slot0.stopGame = slot32

function slot32(slot0, slot1, slot2)
	slot3 = {}
	slot4 = 0

	while slot2 > slot4 do
		slot4 = table
		slot4 = slot4.insert
		slot5 = slot3
		slot6 = math
		slot6 = slot6.fmod
		slot7 = slot2
		slot8 = 10

		slot4(slot5, slot6(slot7, slot8))

		slot4 = math
		slot4 = slot4.floor
		slot5 = slot2 / 10
		slot4 = slot4(slot5)
		slot2 = slot4
	end

	slot4 = #slot3
	slot5 = 1
	slot6 = -1

	for slot7 = slot4, slot5, slot6 do
		slot8 = cloneTplTo
		slot9 = slot0.floatChar
		slot10 = slot3[slot7]
		slot9 = slot9[slot10]
		slot10 = slot1

		slot8(slot9, slot10)
	end
end

slot0.formatScore = slot32

function slot32(slot0)
	slot1 = slot0.hintTimer
	slot2 = slot1
	slot1 = slot1.Stop

	slot1(slot2)

	slot1 = true
	slot2 = true
	slot0.updating = slot2
	slot3 = slot0
	slot2 = slot0.tryMatch
	slot2 = slot2(slot3)
	slot3 = next
	slot4 = slot2
	slot3 = slot3(slot4)

	if slot3 ~= nil then
		slot4 = slot0
		slot3 = slot0.cancelHint

		slot3(slot4)

		slot1 = false
		slot3 = slot0.combo
		slot3 = slot3 + 1
		slot0.combo = slot3
		slot3 = playSoundEffect
		slot4 = slot0

		slot3(slot4)

		slot3 = nil
		slot4 = pairs
		slot5 = slot2
		slot4, slot5, slot6 = slot4(slot5)

		for slot7, slot8 in slot4, slot5, slot6 do
			slot9 = #slot8

			if slot9 == 3 then
				slot9 = slot0.combo
				slot3 = 30 * slot9
			else
				slot9 = #slot8

				if slot9 == 4 then
					slot9 = slot0.combo
					slot3 = 60 * slot9
				else
					slot9 = #slot8
					slot9 = 20 * slot9
					slot10 = slot0.combo
					slot3 = slot9 * slot10
				end
			end

			slot9 = slot0.score
			slot9 = slot9 + slot3
			slot0.score = slot9
			slot9 = setText
			slot10 = slot0.scoreText
			slot11 = slot0.score

			slot9(slot10, slot11)

			slot9 = Vector2
			slot9 = slot9.zero
			slot10 = _
			slot10 = slot10.each
			slot11 = slot8

			function slot12(slot0)
				slot1 = slot0
				slot1 = slot1.tileIndicies
				slot2 = slot0[1]
				slot1 = slot1[slot2]
				slot2 = slot0[2]
				slot3 = nil
				slot1[slot2] = slot3
				slot1 = slot0
				slot1 = slot1.tileTfs
				slot2 = slot0[1]
				slot1 = slot1[slot2]
				slot2 = slot0[2]
				slot1 = slot1[slot2]

				if slot1 then
					slot1 = slot0
					slot1 = slot1.tileTfs
					slot2 = slot0[1]
					slot1 = slot1[slot2]
					slot2 = slot0[2]
					slot1 = slot1[slot2]
					slot2 = slot1
					slot3 = slot1.anchoredPosition
					slot2 = slot2 + slot3
					slot1 = slot2
					slot3 = slot1
					slot2 = slot1.GetComponent
					slot4 = "Image"
					slot2 = slot2(slot3, slot4)
					slot3 = slot0
					slot3 = slot3.whitenMat
					slot2.material = slot3
					slot2 = slot1.localPosition
					slot3 = -50
					slot2.z = slot3
					slot3 = cloneTplTo
					slot4 = slot0
					slot4 = slot4.matchEffect
					slot5 = slot0
					slot5 = slot5.tilesRoot
					slot3 = slot3(slot4, slot5)
					slot3.localPosition = slot2
					slot4 = slot0
					slot5 = slot4
					slot4 = slot4.managedTween
					slot6 = LeanTween
					slot6 = slot6.value

					function slot7()
						slot0 = Destroy
						slot1 = slot0

						slot0(slot1)

						slot0 = Destroy
						slot1 = slot1

						slot0(slot1)
					end

					slot8 = go
					slot9 = slot1
					slot8 = slot8(slot9)
					slot9 = 1
					slot10 = 0
					slot11 = slot2
					slot4 = slot4(slot5, slot6, slot7, slot8, slot9, slot10, slot11)
					slot5 = slot4
					slot4 = slot4.setOnUpdate
					slot6 = System
					slot6 = slot6.Action_float

					function slot7(slot0)
						slot1 = setImageAlpha
						slot2 = slot0
						slot3 = slot0

						slot1(slot2, slot3)

						slot1 = setLocalScale
						slot2 = slot0
						slot3 = Vector3
						slot3 = slot3.one
						slot3 = slot3 * slot0
						slot3 = slot3 * 2.7

						slot1(slot2, slot3)
					end

					slot4(slot5, slot6(slot7))
				end

				slot1 = slot0
				slot1 = slot1.tileTfs
				slot2 = slot0[1]
				slot1 = slot1[slot2]
				slot2 = slot0[2]
				slot3 = nil
				slot1[slot2] = slot3
			end

			slot10(slot11, slot12)

			slot10 = #slot8
			slot9 = slot9 / slot10
			slot10 = rtf
			slot11 = cloneTplTo
			slot12 = slot0.floatText
			slot13 = slot0.tilesRoot
			slot10 = slot10(slot11(slot12, slot13))
			slot10.anchoredPosition = slot9
			slot12 = slot0
			slot11 = slot0.formatScore
			slot13 = slot10
			slot14 = slot3

			slot11(slot12, slot13, slot14)

			slot12 = slot0
			slot11 = slot0.managedTween
			slot13 = LeanTween
			slot13 = slot13.moveY

			function slot14()
				slot0 = Destroy
				slot1 = slot0

				slot0(slot1)
			end

			slot15 = slot10
			slot16 = slot9.y
			slot17 = slot2
			slot16 = slot16 + slot17
			slot17 = slot3

			slot11(slot12, slot13, slot14, slot15, slot16, slot17)
		end

		slot5 = slot0
		slot4 = slot0.managedTween
		slot6 = LeanTween
		slot6 = slot6.delayedCall

		function slot7()
			slot0 = slot0
			slot0 = slot0.inGame

			if not slot0 then
				return
			end

			slot0 = 0
			slot1 = 1
			slot2 = slot1
			slot3 = 1

			for slot4 = slot1, slot2, slot3 do
				slot5 = 1
				slot6 = slot2
				slot7 = 1

				for slot8 = slot5, slot6, slot7 do
					slot9 = slot0
					slot9 = slot9.tileIndicies
					slot9 = slot9[slot4]
					slot9 = slot9[slot8]

					if slot9 then
						slot9 = slot4
						slot10 = slot4
						slot11 = 1
						slot12 = -1

						for slot13 = slot10, slot11, slot12 do
							slot14 = slot0
							slot14 = slot14.tileIndicies
							slot15 = slot13 - 1
							slot14 = slot14[slot15]
							slot14 = slot14[slot8]

							if slot14 or slot13 == 1 then
								slot9 = slot13

								break
							end
						end

						if slot9 ~= slot4 then
							slot10 = slot4 - slot9
							slot11 = math
							slot11 = slot11.max
							slot12 = slot10
							slot13 = slot0
							slot11 = slot11(slot12, slot13)
							slot0 = slot11
							slot11 = slot0
							slot12 = slot11
							slot11 = slot11.moveTile
							slot13 = slot0
							slot13 = slot13.tileTfs
							slot13 = slot13[slot4]
							slot13 = slot13[slot8]
							slot14 = {
								i = slot9,
								j = slot8
							}
							slot15 = slot0
							slot15 = slot15.dropTime
							slot16 = slot10

							slot11(slot12, slot13, slot14, slot15(slot16))

							slot11 = slot0
							slot11 = slot11.tileTfs
							slot11 = slot11[slot9]
							slot12 = slot0
							slot12 = slot12.tileTfs
							slot12 = slot12[slot4]
							slot12 = slot12[slot8]
							slot11[slot8] = slot12
							slot11 = slot0
							slot11 = slot11.tileIndicies
							slot11 = slot11[slot9]
							slot12 = slot0
							slot12 = slot12.tileIndicies
							slot12 = slot12[slot4]
							slot12 = slot12[slot8]
							slot11[slot8] = slot12
							slot11 = slot0
							slot11 = slot11.tileTfs
							slot11 = slot11[slot4]
							slot12 = nil
							slot11[slot8] = slot12
							slot11 = slot0
							slot11 = slot11.tileIndicies
							slot11 = slot11[slot4]
							slot12 = nil
							slot11[slot8] = slot12
						end
					end
				end
			end

			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.fillTileIndicies

			slot1(slot2)

			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.tryMatch
			slot1 = slot1(slot2)
			slot2 = slot0
			slot2 = slot2.combo
			slot3 = 1

			if slot2 > slot3 then
				slot2 = next
				slot3 = slot1
				slot2 = slot2(slot3)

				if slot2 == nil then
					slot2 = nil
					slot3 = Vector3
					slot3 = slot3.New
					slot4 = 0
					slot5 = 0
					slot6 = -50
					slot3 = slot3(slot4, slot5, slot6)
					slot4 = slot0
					slot4 = slot4.combo

					if slot4 == 2 then
						slot4 = cloneTplTo
						slot5 = slot0
						slot5 = slot5.goodEffect
						slot6 = slot0
						slot6 = slot6.tilesRoot
						slot4 = slot4(slot5, slot6)
						slot2 = slot4
						slot4 = playSoundEffect
						slot5 = slot3

						slot4(slot5)
					else
						slot4 = slot0
						slot4 = slot4.combo

						if slot4 == 3 then
							slot4 = cloneTplTo
							slot5 = slot0
							slot5 = slot5.greatEffect
							slot6 = slot0
							slot6 = slot6.tilesRoot
							slot4 = slot4(slot5, slot6)
							slot2 = slot4
							slot4 = playSoundEffect
							slot5 = slot3

							slot4(slot5)
						else
							slot4 = cloneTplTo
							slot5 = slot0
							slot5 = slot5.perfectEffect
							slot6 = slot0
							slot6 = slot6.tilesRoot
							slot4 = slot4(slot5, slot6)
							slot2 = slot4
							slot4 = playSoundEffect
							slot5 = slot4

							slot4(slot5)
						end
					end

					slot2.localPosition = slot3
					slot4 = slot0
					slot5 = slot4
					slot4 = slot4.managedTween
					slot6 = LeanTween
					slot6 = slot6.delayedCall

					function slot7()
						slot0 = Destroy
						slot1 = slot0

						slot0(slot1)
					end

					slot8 = slot5
					slot9 = nil

					slot4(slot5, slot6, slot7, slot8, slot9)
				end
			end

			slot2 = math
			slot2 = slot2.max
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.fillTiles
			slot3 = slot3(slot4)
			slot4 = slot0
			slot2 = slot2(slot3, slot4)
			slot0 = slot2
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.managedTween
			slot4 = LeanTween
			slot4 = slot4.delayedCall

			function slot5()
				slot0 = slot0
				slot0 = slot0.inGame

				if not slot0 then
					return
				end

				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.update

				slot0(slot1)
			end

			slot6 = math
			slot6 = slot6.max
			slot7 = slot5
			slot8 = slot0
			slot8 = slot8.dropTime
			slot9 = slot0
			slot6 = slot6(slot7, slot8(slot9))
			slot7 = nil

			slot2(slot3, slot4, slot5, slot6, slot7)
		end

		slot8 = slot1
		slot9 = nil

		slot4(slot5, slot6, slot7, slot8, slot9)
	end

	slot3 = slot0.inGame

	if slot3 then
		slot3 = slot0.hintTimer
		slot4 = slot3
		slot3 = slot3.Reset
		slot5 = slot0.hintFunc
		slot6 = slot9

		slot3(slot4, slot5, slot6)

		slot3 = slot0.hintTimer
		slot4 = slot3
		slot3 = slot3.Start

		slot3(slot4)
	end

	slot3 = not slot1
	slot0.updating = slot3
end

slot0.update = slot32

function slot32(slot0)
	slot1 = {}
	slot2 = 1
	slot3 = slot0
	slot4 = 1

	for slot5 = slot2, slot3, slot4 do
		slot6 = {}
		slot1[slot5] = slot6
	end

	slot3 = slot0
	slot2 = slot0.bfs
	slot4 = slot1

	return slot2(slot3, slot4)
end

slot0.tryMatch = slot32

function slot32(slot0, slot1)
	slot2 = {}
	slot3 = 1
	slot4 = slot0
	slot5 = 1

	for slot6 = slot3, slot4, slot5 do
		slot7 = 1
		slot8 = slot1
		slot9 = 1

		for slot10 = slot7, slot8, slot9 do
			slot11 = slot1[slot6]
			slot11 = slot11[slot10]

			if not slot11 then
				slot12 = slot0
				slot11 = slot0.isConnected
				slot13 = {
					i = slot6,
					j = slot10
				}
				slot11 = slot11(slot12, slot13)

				if not slot11 then
					slot11 = slot1[slot6]
					slot12 = true
					slot11[slot10] = slot12
				else
					slot11 = {}
					slot12 = {
						slot6,
						slot10
					}
					slot11[1] = slot12
					slot12 = {}
					slot13 = {
						slot6,
						slot10
					}
					slot12[1] = slot13
					slot13 = slot0.tileIndicies
					slot13 = slot13[slot6]
					slot13 = slot13[slot10]
					slot14 = next
					slot15 = slot11
					slot14 = slot14(slot15)

					while slot14 ~= nil do
						slot14 = unpack
						slot15 = table
						slot15 = slot15.remove
						slot16 = slot11
						slot14, slot15 = slot14(slot15(slot16))
						slot16 = slot1[slot14]
						slot17 = true
						slot16[slot15] = slot17
						slot16 = pairs
						slot17 = slot2
						slot16, slot17, slot18 = slot16(slot17)

						for slot19, slot20 in slot16, slot17, slot18 do
							slot21 = slot20[1]
							slot21 = slot14 + slot21
							slot22 = slot20[2]
							slot22 = slot15 + slot22
							slot23 = slot0.tileIndicies
							slot23 = slot23[slot21]
							slot23 = slot23[slot22]

							if slot23 then
								slot23 = slot1[slot21]
								slot23 = slot23[slot22]

								if not slot23 then
									slot23 = slot0.tileIndicies
									slot23 = slot23[slot21]
									slot23 = slot23[slot22]

									if slot23 == slot13 then
										slot24 = slot0
										slot23 = slot0.isConnected
										slot25 = {
											i = slot21,
											j = slot22
										}
										slot23 = slot23(slot24, slot25)

										if slot23 then
											slot23 = table
											slot23 = slot23.insert
											slot24 = slot11
											slot25 = {
												slot21,
												slot22
											}

											slot23(slot24, slot25)

											slot23 = table
											slot23 = slot23.insert
											slot24 = slot12
											slot25 = {
												slot21,
												slot22
											}

											slot23(slot24, slot25)
										end
									end
								end
							end
						end
					end

					slot14 = #slot12
					slot15 = 3

					if slot14 >= slot15 then
						slot14 = table
						slot14 = slot14.insert
						slot15 = slot2
						slot16 = slot12

						slot14(slot15, slot16)
					end
				end
			end
		end
	end

	return slot2
end

slot0.bfs = slot32

return slot0
