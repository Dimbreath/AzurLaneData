slot0 = pg
slot0 = slot0 or {}
pg = slot0
slot0 = pg
slot1 = singletonClass
slot2 = "GuideMgr"
slot1 = slot1(slot2)
slot0.GuideMgr = slot1
slot0 = pg
slot0 = slot0.GuideMgr
slot1 = true
slot0.ENABLE_GUIDE = slot1
slot1 = {
	LOADING = 0,
	BREAK = 4,
	IDLE = 1,
	BUSY = 2,
	STOP = 3
}
slot0.MANAGER_STATE = slot1
slot1 = 1
slot2 = 2
slot3 = 3
slot4 = 4
slot5 = 5
slot6 = {
	MODE2 = 2,
	MODE1 = 1
}

function slot7(slot0, slot1)
	slot2 = print
	slot3 = "initializing guide manager..."

	slot2(slot3)

	slot2 = uv0
	slot2 = slot2.MANAGER_STATE
	slot2 = slot2.LOADING
	slot0.managerState = slot2
	slot2 = {}
	slot0.sceneStore = slot2
	slot2 = PoolMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.GetUI
	slot4 = "GuideUI"
	slot5 = true

	function slot6(slot0)
		slot1 = uv0
		slot1._go = slot0
		slot1 = uv0
		slot2 = uv0
		slot2 = slot2._go
		slot2 = slot2.transform
		slot1._tf = slot2
		slot1 = uv0
		slot1 = slot1._go
		slot2 = slot1
		slot1 = slot1.SetActive
		slot3 = false

		slot1(slot2, slot3)

		slot1 = uv0
		slot2 = tf
		slot3 = GameObject
		slot3 = slot3.Find
		slot4 = "Overlay/UIOverlay"
		slot2 = slot2(slot3(slot4))
		slot1.UIOverlay = slot2
		slot1 = uv0
		slot1 = slot1._go
		slot1 = slot1.transform
		slot2 = slot1
		slot1 = slot1.SetParent
		slot3 = uv0
		slot3 = slot3.UIOverlay
		slot4 = false

		slot1(slot2, slot3, slot4)

		slot1 = uv0
		slot2 = findTF
		slot3 = uv0
		slot3 = slot3._go
		slot4 = "Guider"
		slot2 = slot2(slot3, slot4)
		slot1.guiderTF = slot2
		slot1 = uv0
		slot2 = findTF
		slot3 = uv0
		slot3 = slot3.guiderTF
		slot4 = "mode1"
		slot2 = slot2(slot3, slot4)
		slot1.styleTF1 = slot2
		slot1 = uv0
		slot2 = findTF
		slot3 = uv0
		slot3 = slot3.guiderTF
		slot4 = "mode2"
		slot2 = slot2(slot3, slot4)
		slot1.styleTF2 = slot2
		slot1 = uv0
		slot2 = uv0
		slot2 = slot2.styleTF2
		slot2 = slot2.sizeDelta
		slot2 = slot2.y
		slot1.initChatBgH = slot2
		slot1 = SetActive
		slot2 = uv0
		slot2 = slot2.guiderTF
		slot3 = false

		slot1(slot2, slot3)

		slot1 = uv0
		slot2 = findTF
		slot3 = uv0
		slot3 = slot3._go
		slot4 = "BG"
		slot2 = slot2(slot3, slot4)
		slot1._bg = slot2
		slot1 = uv0
		slot2 = uv0
		slot2 = slot2._bg
		slot3 = slot2
		slot2 = slot2.GetComponent
		slot4 = typeof
		slot5 = CanvasGroup
		slot2 = slot2(slot3, slot4(slot5))
		slot1.bgAlpha = slot2
		slot1 = uv0
		slot1 = slot1.bgAlpha
		slot2 = 0.2
		slot1.alpha = slot2
		slot1 = uv0
		slot2 = uv0
		slot2 = slot2._bg
		slot3 = slot2
		slot2 = slot2.Find
		slot4 = "close_btn"
		slot2 = slot2(slot3, slot4)
		slot1._closeBtn = slot2
		slot1 = uv0
		slot2 = GetOrAddComponent
		slot3 = uv0
		slot3 = slot3._closeBtn
		slot4 = typeof
		slot5 = UILongPressTrigger
		slot2 = slot2(slot3, slot4(slot5))
		slot1.uiLongPress = slot2
		slot1 = uv0
		slot1 = slot1.uiLongPress
		slot2 = 10
		slot1.longPressThreshold = slot2
		slot1 = uv0
		slot2 = findTF
		slot3 = uv0
		slot3 = slot3._go
		slot4 = "finger"
		slot2 = slot2(slot3, slot4)
		slot1.fingerTF = slot2
		slot1 = SetActive
		slot2 = uv0
		slot2 = slot2.fingerTF
		slot3 = false

		slot1(slot2, slot3)

		slot1 = uv0
		slot2 = findTF
		slot3 = uv0
		slot3 = slot3._go
		slot4 = "wTask"
		slot2 = slot2(slot3, slot4)
		slot1.wTask = slot2
		slot1 = setActive
		slot2 = uv0
		slot2 = slot2.wTask
		slot3 = false

		slot1(slot2, slot3)

		slot1 = uv0
		slot2 = {}
		slot1.fingerSprites = slot2
		slot1 = eachChild
		slot2 = findTF
		slot3 = uv0
		slot3 = slot3._go
		slot4 = "resources"
		slot2 = slot2(slot3, slot4)

		function slot3(slot0)
			slot2 = slot0
			slot1 = slot0.GetComponent
			slot3 = typeof
			slot4 = Image
			slot1 = slot1(slot2, slot3(slot4))
			slot1 = slot1.sprite
			slot2 = table
			slot2 = slot2.insert
			slot3 = uv0
			slot3 = slot3.fingerSprites
			slot4 = slot1

			slot2(slot3, slot4)
		end

		slot1(slot2, slot3)

		slot1 = uv0
		slot2 = nil
		slot1.sceneFunc = slot2
		slot1 = uv0
		slot2 = true
		slot1.inited = slot2
		slot1 = uv0
		slot2 = uv0
		slot3 = slot2
		slot2 = slot2.Finder
		slot2 = slot2(slot3)
		slot1.finder = slot2
		slot1 = uv0
		slot2 = uv1
		slot2 = slot2.MANAGER_STATE
		slot2 = slot2.IDLE
		slot1.managerState = slot2
		slot1 = uv2

		slot1()
	end

	slot2(slot3, slot4, slot5, slot6)
end

slot0.Init = slot7

function slot7(slot0)
	slot1 = slot0.managerState
	slot2 = uv0
	slot2 = slot2.MANAGER_STATE
	slot2 = slot2.BUSY

	if slot1 ~= slot2 then
		slot1 = false
	else
		slot1 = true
	end

	return slot1
end

slot0.isRuning = slot7

function slot7(slot0, slot1)
	slot2 = tf
	slot3 = slot0._go
	slot2 = slot2(slot3)
	slot3 = slot2
	slot2 = slot2.InverseTransformPoint
	slot4 = slot1

	return slot2(slot3, slot4)
end

slot0.transformPos = slot7

function slot7(slot0)
	slot1 = pg
	slot1 = slot1.MsgboxMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot1 = slot1._go
	slot1 = slot1.activeSelf

	if slot1 then
		slot1 = false
		slot2 = 1

		return slot1, slot2
	end

	slot1 = pg
	slot1 = slot1.StoryMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.isActive
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = false
		slot2 = 2

		return slot1, slot2
	end

	slot1 = slot0.managerState
	slot2 = uv0
	slot2 = slot2.MANAGER_STATE
	slot2 = slot2.BUSY

	if slot1 == slot2 then
		slot1 = false
		slot2 = 3

		return slot1, slot2
	end

	slot1 = true

	return slot1
end

slot0.canPlay = slot7

function slot7(slot0, slot1)
	slot2 = slot0.inited

	if not slot2 then
		return
	end

	slot2 = table
	slot2 = slot2.contains
	slot3 = slot0.sceneStore
	slot4 = slot1.view
	slot2 = slot2(slot3, slot4)

	if not slot2 then
		slot2 = table
		slot2 = slot2.insert
		slot3 = slot0.sceneStore
		slot4 = slot1.view

		slot2(slot3, slot4)
	end

	slot2 = slot0.sceneFunc

	if slot2 then
		slot2 = slot0.sceneFunc
		slot3 = slot1.view

		slot2(slot3)
	end
end

slot0.onSceneAnimDone = slot7

function slot7(slot0, slot1)
	slot2 = slot0.inited

	if not slot2 then
		return
	end

	slot2 = table
	slot2 = slot2.contains
	slot3 = slot0.sceneStore
	slot4 = slot1.view
	slot2 = slot2(slot3, slot4)

	if slot2 then
		slot2 = table
		slot2 = slot2.removebyvalue
		slot3 = slot0.sceneStore
		slot4 = slot1.view

		slot2(slot3, slot4)
	end
end

slot0.onSceneExit = slot7

function slot7(slot0, slot1)
	slot2 = table
	slot2 = slot2.contains
	slot3 = slot0.sceneStore
	slot4 = slot1

	return slot2(slot3, slot4)
end

slot0.checkModuleOpen = slot7

function slot7(slot0, slot1)
	slot2 = getProxy
	slot3 = PlayerProxy
	slot2 = slot2(slot3)

	if slot2 then
		slot4 = slot2
		slot3 = slot2.getData
		slot3 = slot3(slot4)
		slot4 = slot3
		slot3 = slot3.IsPlayed
		slot5 = slot1

		return slot3(slot4, slot5)
	end

	slot3 = false

	return slot3
end

slot0.isPlayed = slot7

function slot7(slot0, slot1, slot2, slot3, slot4)
	slot5 = uv0
	slot5 = slot5.ENABLE_GUIDE

	if not slot5 then
		return
	end

	slot6 = slot0
	slot5 = slot0.canPlay
	slot5, slot6 = slot5(slot6)
	slot7 = print
	slot8 = "play guide >>"
	slot9 = slot1
	slot10 = slot5

	slot7(slot8, slot9, slot10)

	slot0.erroCallback = slot4

	if slot5 then
		slot7 = require
		slot8 = "GameCfg.guide.newguide.segments."
		slot9 = slot1
		slot8 = slot8 .. slot9
		slot7 = slot7(slot8)
		slot0.currentGuide = slot7
		slot8 = slot0
		slot7 = slot0.addDelegateInfo

		slot7(slot8)

		slot7 = Clone
		slot8 = slot0.currentGuide
		slot8 = slot8.events
		slot7 = slot7(slot8)

		if slot2 then
			slot8 = _
			slot8 = slot8.select
			slot9 = slot7

			function slot10(slot0)
				slot1 = slot0.code

				if not slot1 then
					slot1 = true

					return slot1
				else
					slot1 = type
					slot2 = slot0.code
					slot1 = slot1(slot2)

					if slot1 == "table" then
						slot1 = _
						slot1 = slot1.any
						slot2 = uv0

						function slot3(slot0)
							slot1 = table
							slot1 = slot1.contains
							slot2 = uv0
							slot2 = slot2.code
							slot3 = slot0

							return slot1(slot2, slot3)
						end

						return slot1(slot2, slot3)
					else
						slot1 = table
						slot1 = slot1.contains
						slot2 = uv0
						slot3 = slot0.code

						return slot1(slot2, slot3)
					end
				end
			end

			slot8 = slot8(slot9, slot10)
			slot0.curEvents = slot8
		else
			slot0.curEvents = slot7
		end

		slot9 = slot0
		slot8 = slot0.prepareGuider
		slot10 = slot3

		slot8(slot9, slot10)

		slot8 = {}
		slot9 = ipairs
		slot10 = slot0.curEvents

		if not slot10 then
			slot10 = {}
		end

		slot9, slot10, slot11 = slot9(slot10)

		for slot12, slot13 in slot9, slot10, slot11 do
			slot14 = table
			slot14 = slot14.insert
			slot15 = slot8

			function slot16(slot0)
				function slot1()
					slot0 = uv0
					slot0 = slot0.managerState
					slot1 = uv1
					slot1 = slot1.MANAGER_STATE
					slot1 = slot1.IDLE

					if slot0 ~= slot1 then
						slot0 = uv0
						slot1 = {}
						slot0.scenes = slot1
						slot0 = uv2

						slot0()
					else
						slot0 = uv0
						slot0 = slot0.erroCallback

						slot0()

						slot0 = uv0
						slot1 = nil
						slot0.erroCallback = slot1
					end
				end

				slot2 = uv0
				slot3 = slot2
				slot2 = slot2.doCurrEvent
				slot4 = uv2
				slot5 = slot1

				slot2(slot3, slot4, slot5)
			end

			slot14(slot15, slot16)
		end

		slot9 = uv0
		slot9 = slot9.MANAGER_STATE
		slot9 = slot9.BUSY
		slot0.managerState = slot9
		slot9 = seriesAsync
		slot10 = slot8

		function slot11()
			slot0 = uv0
			slot1 = slot0
			slot0 = slot0.endGuider
			slot2 = uv1

			slot0(slot1, slot2)
		end

		slot9(slot10, slot11)
	elseif slot3 then
		slot7 = slot3

		slot7()
	end
end

slot0.play = slot7

function slot7(slot0, slot1)
	slot2 = pg
	slot2 = slot2.m02
	slot3 = slot2
	slot2 = slot2.sendNotification
	slot4 = GAME
	slot4 = slot4.START_GUIDE

	slot2(slot3, slot4)

	slot2 = slot0._go
	slot2 = slot2.transform
	slot3 = slot2
	slot2 = slot2.SetAsLastSibling

	slot2(slot3)

	slot2 = slot0._go
	slot3 = slot2
	slot2 = slot2.SetActive
	slot4 = true

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0.fingerTF
	slot4 = false

	slot2(slot3, slot4)

	slot2 = slot0.bgAlpha
	slot3 = 0.2
	slot2.alpha = slot3
	slot2 = slot0.uiLongPress
	slot2 = slot2.onLongPressed
	slot3 = slot2
	slot2 = slot2.AddListener

	function slot4()
		slot0 = uv0
		slot1 = slot0
		slot0 = slot0.endGuider
		slot2 = uv1

		slot0(slot1, slot2)
	end

	slot2(slot3, slot4)
end

slot0.prepareGuider = slot7

function slot7(slot0, slot1, slot2)
	function slot3(slot0)
		slot1 = uv0
		slot1 = slot1.waitScene

		if slot1 then
			slot1 = uv0
			slot1 = slot1.waitScene

			if slot1 ~= "" then
				slot1 = table
				slot1 = slot1.contains
				slot2 = uv1
				slot2 = slot2.scenes
				slot3 = uv0
				slot3 = slot3.waitScene
				slot1 = slot1(slot2, slot3)

				if not slot1 then
					slot1 = uv1

					function slot2(slot0)
						slot1 = uv0
						slot1 = slot1.waitScene

						if slot1 ~= slot0 then
							slot1 = table
							slot1 = slot1.contains
							slot2 = uv1
							slot2 = slot2.sceneStore
							slot3 = uv0
							slot3 = slot3.waitScene
							slot1 = slot1(slot2, slot3)

							if slot1 then
								slot1 = uv1
								slot2 = nil
								slot1.sceneFunc = slot2
								slot1 = uv2

								slot1()
							end
						end
					end

					slot1.sceneFunc = slot2
					slot1 = uv1
					slot1 = slot1.sceneFunc

					slot1()
				end
			end
		else
			slot1 = slot0

			slot1()
		end
	end

	function slot4()
		slot0 = uv0
		slot0 = slot0.hideui

		if slot0 then
			slot0 = uv1
			slot1 = slot0
			slot0 = slot0.hideUI
			slot2 = uv0
			slot3 = uv2

			slot0(slot1, slot2, slot3)
		else
			slot0 = uv0
			slot0 = slot0.stories

			if slot0 then
				slot0 = uv1
				slot1 = slot0
				slot0 = slot0.playStories
				slot2 = uv0
				slot3 = uv2

				slot0(slot1, slot2, slot3)
			else
				slot0 = uv0
				slot0 = slot0.notifies

				if slot0 then
					slot0 = uv1
					slot1 = slot0
					slot0 = slot0.sendNotifies
					slot2 = uv0
					slot3 = uv2

					slot0(slot1, slot2, slot3)
				else
					slot0 = uv0
					slot0 = slot0.showSign

					if slot0 then
						slot0 = uv1
						slot1 = slot0
						slot0 = slot0.showSign
						slot2 = uv0
						slot2 = slot2.showSign
						slot3 = uv2

						slot0(slot1, slot2, slot3)
					else
						slot0 = uv0
						slot0 = slot0.doNothing

						if slot0 then
							slot0 = uv2

							slot0()
						else
							slot0 = uv1
							slot1 = slot0
							slot0 = slot0.findUI
							slot2 = uv0
							slot3 = uv2

							slot0(slot1, slot2, slot3)
						end
					end
				end
			end
		end
	end

	slot5 = slot1.delay

	if slot5 ~= nil then
		slot5 = Timer
		slot5 = slot5.New

		function slot6()
			slot0 = uv0
			slot1 = uv1

			slot0(slot1)
		end

		slot7 = slot1.delay
		slot8 = 1
		slot5 = slot5(slot6, slot7, slot8)
		slot0.delayTimer = slot5
		slot5 = slot0.delayTimer
		slot6 = slot5
		slot5 = slot5.Start

		slot5(slot6)
	else
		slot5 = slot3
		slot6 = slot4

		slot5(slot6)
	end
end

slot0.doCurrEvent = slot7

function slot7(slot0, slot1, slot2)
	function slot3()
		slot0 = uv0
		slot0 = slot0.duration
		slot1 = uv0
		slot1 = slot1.pos
		slot2 = uv0
		slot2 = slot2.signType
		slot3 = nil

		if slot2 == 1 then
			slot4 = uv1
			slot3 = slot4.wTask
		end

		slot4 = setActive
		slot5 = slot3
		slot6 = true

		slot4(slot5, slot6)

		slot4 = type
		slot5 = slot1
		slot4 = slot4(slot5)

		if slot4 == "string" then
			if slot1 == "compassPos" then
				slot4 = WorldGuider
				slot4 = slot4.GetInstance
				slot4 = slot4()
				slot1 = slot4.tempGridPos
			end
		else
			slot4 = type
			slot5 = slot1
			slot4 = slot4(slot5)

			if slot4 == "table" then
				slot4 = Vector3
				slot4 = slot4.New
				slot5 = slot1[1]
				slot6 = slot1[2]
				slot7 = slot1[3]
				slot4 = slot4(slot5, slot6, slot7)
				slot1 = slot4
			end
		end

		slot4 = setLocalPosition
		slot5 = slot3
		slot6 = slot1

		slot4(slot5, slot6)

		slot4 = uv1
		slot5 = Timer
		slot5 = slot5.New

		function slot6()
			slot0 = setActive
			slot1 = uv0
			slot2 = false

			slot0(slot1, slot2)

			slot0 = uv1

			slot0()
		end

		slot7 = slot0
		slot8 = slot0
		slot9 = 1
		slot5 = slot5(slot6, slot7, slot8, slot9)
		slot4.signTimer = slot5
		slot4 = uv1
		slot4 = slot4.signTimer
		slot5 = slot4
		slot4 = slot4.Start

		slot4(slot5)
	end

	slot4 = slot3

	slot4()
end

slot0.showSign = slot7

function slot7(slot0, slot1, slot2)
	slot3 = {}
	slot4 = ipairs
	slot5 = slot1.notifies
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = table
		slot9 = slot9.insert
		slot10 = slot3

		function slot11(slot0)
			slot1 = pg
			slot1 = slot1.m02
			slot2 = slot1
			slot1 = slot1.sendNotification
			slot3 = uv0
			slot3 = slot3.notify
			slot4 = uv0
			slot4 = slot4.body

			slot1(slot2, slot3, slot4)

			slot1 = slot0

			slot1()
		end

		slot9(slot10, slot11)
	end

	slot4 = seriesAsync
	slot5 = slot3

	function slot6()
		slot0 = uv0
		slot1 = slot0
		slot0 = slot0.finishCurrEvent
		slot2 = uv1
		slot3 = uv2

		slot0(slot1, slot2, slot3)
	end

	slot4(slot5, slot6)
end

slot0.sendNotifies = slot7

function slot7(slot0, slot1, slot2)
	slot3 = {}
	slot4 = ipairs
	slot5 = slot1.stories
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = table
		slot9 = slot9.insert
		slot10 = slot3

		function slot11(slot0)
			slot1 = pg
			slot1 = slot1.StoryMgr
			slot1 = slot1.GetInstance
			slot1 = slot1()
			slot2 = slot1
			slot1 = slot1.Play
			slot3 = uv0
			slot4 = slot0
			slot5 = true

			slot1(slot2, slot3, slot4, slot5)
		end

		slot9(slot10, slot11)
	end

	slot4 = seriesAsync
	slot5 = slot3

	function slot6()
		slot0 = uv0
		slot1 = slot0
		slot0 = slot0.finishCurrEvent
		slot2 = uv1
		slot3 = uv2

		slot0(slot1, slot2, slot3)
	end

	slot4(slot5, slot6)
end

slot0.playStories = slot7

function slot7(slot0, slot1, slot2)
	slot3 = {}
	slot4 = ipairs
	slot5 = slot1.hideui
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = table
		slot9 = slot9.insert
		slot10 = slot3

		function slot11(slot0)
			slot1 = uv0
			slot1 = slot1.finder
			slot2 = slot1
			slot1 = slot1.SearchTimely
			slot3 = {}
			slot4 = uv1
			slot4 = slot4.path
			slot3.path = slot4
			slot4 = uv1
			slot4 = slot4.delay
			slot3.delay = slot4
			slot4 = uv1
			slot4 = slot4.pathIndex
			slot3.pathIndex = slot4

			function slot4(slot0)
				slot1 = SetActive
				slot2 = slot0
				slot3 = uv0
				slot3 = slot3.ishide
				slot3 = not slot3

				slot1(slot2, slot3)

				slot1 = uv1

				slot1()
			end

			slot3.found = slot4

			function slot4()
				slot0 = uv0
				slot1 = slot0
				slot0 = slot0.endGuider
				slot2 = uv1

				slot0(slot1, slot2)
			end

			slot3.notFound = slot4

			slot1(slot2, slot3)
		end

		slot9(slot10, slot11)
	end

	slot4 = parallelAsync
	slot5 = slot3

	function slot6()
		slot0 = uv0
		slot1 = slot0
		slot0 = slot0.finishCurrEvent
		slot2 = uv1
		slot3 = uv2

		slot0(slot1, slot2, slot3)
	end

	slot4(slot5, slot6)
end

slot0.hideUI = slot7

function slot7(slot0, slot1, slot2)
	slot3 = true
	slot4 = {}

	function slot5(slot0)
		slot1 = uv0
		slot1 = slot1.baseui

		if not slot1 then
			slot1 = slot0

			slot1()

			return
		end

		slot1 = uv1
		slot1 = slot1.finder
		slot2 = slot1
		slot1 = slot1.Search
		slot3 = {}
		slot4 = uv0
		slot4 = slot4.baseui
		slot4 = slot4.path
		slot3.path = slot4
		slot4 = uv0
		slot4 = slot4.baseui
		slot4 = slot4.delay
		slot3.delay = slot4
		slot4 = uv0
		slot4 = slot4.baseui
		slot4 = slot4.pathIndex
		slot3.pathIndex = slot4
		slot4 = uv0
		slot4 = slot4.baseui
		slot4 = slot4.conditionData
		slot3.conditionData = slot4
		slot3.found = slot0

		function slot4()
			slot0 = uv0
			slot1 = slot0
			slot0 = slot0.endGuider
			slot2 = uv1

			slot0(slot1, slot2)
		end

		slot3.notFound = slot4

		slot1(slot2, slot3)
	end

	slot4[1] = slot5

	function slot5(slot0)
		slot1 = uv0
		slot1 = slot1.ui

		if not slot1 then
			slot1 = slot0

			slot1()

			return
		end

		uv1 = false
		slot1 = uv2
		slot1 = slot1.finder
		slot2 = slot1
		slot1 = slot1.Search
		slot3 = {}
		slot4 = uv0
		slot4 = slot4.ui
		slot4 = slot4.path
		slot3.path = slot4
		slot4 = uv0
		slot4 = slot4.ui
		slot4 = slot4.delay
		slot3.delay = slot4
		slot4 = uv0
		slot4 = slot4.ui
		slot4 = slot4.pathIndex
		slot3.pathIndex = slot4
		slot4 = uv0
		slot4 = slot4.ui
		slot4 = slot4.conditionData
		slot3.conditionData = slot4

		function slot4(slot0)
			slot1 = Canvas
			slot1 = slot1.ForceUpdateCanvases

			slot1()

			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.cloneGO
			slot4 = slot0.gameObject
			slot5 = uv0
			slot5 = slot5._go
			slot5 = slot5.transform
			slot6 = uv1
			slot6 = slot6.ui
			slot2 = slot2(slot3, slot4, slot5, slot6)
			slot1.cloneTarget = slot2
			slot1 = uv0
			slot2 = slot1
			slot1 = slot1.addUIEventTrigger
			slot3 = slot0
			slot4 = uv1
			slot5 = uv2

			slot1(slot2, slot3, slot4, slot5)

			slot1 = uv0
			slot2 = slot1
			slot1 = slot1.setFinger
			slot3 = slot0
			slot4 = uv1
			slot4 = slot4.ui

			slot1(slot2, slot3, slot4)

			slot1 = uv3

			slot1()
		end

		slot3.found = slot4

		function slot4()
			slot0 = uv0
			slot0 = slot0.ui
			slot0 = slot0.notfoundSkip

			if slot0 then
				slot0 = uv1
				slot1 = slot0
				slot0 = slot0.finishCurrEvent
				slot2 = uv0
				slot3 = uv2

				slot0(slot1, slot2, slot3)
			else
				slot0 = uv1
				slot1 = slot0
				slot0 = slot0.endGuider
				slot2 = uv2

				slot0(slot1, slot2)
			end
		end

		slot3.notFound = slot4

		slot1(slot2, slot3)
	end

	slot4[2] = slot5
	slot5 = seriesAsync
	slot6 = slot4

	function slot7()
		slot0 = uv0
		slot1 = slot0
		slot0 = slot0.updateUIStyle
		slot2 = uv1
		slot3 = uv2
		slot4 = uv3

		slot0(slot1, slot2, slot3, slot4)
	end

	slot5(slot6, slot7)
end

slot0.findUI = slot7

function slot7(slot0, slot1, slot2, slot3)
	slot4 = slot0.bgAlpha
	slot5 = slot1.alpha

	if not slot5 then
		slot5 = 0.2
	end

	slot4.alpha = slot5
	slot4 = SetActive
	slot5 = slot0.guiderTF
	slot6 = slot1.style

	slot4(slot5, slot6)

	slot4 = slot1.style

	if slot4 then
		slot5 = slot0
		slot4 = slot0.updateContent
		slot6 = slot1

		slot4(slot5, slot6)

		slot4 = slot1.style
		slot4 = slot4.ui

		if slot4 then
			slot4 = slot0.finder
			slot5 = slot4
			slot4 = slot4.Search
			slot6 = {}
			slot7 = slot1.style
			slot7 = slot7.ui
			slot7 = slot7.path
			slot6.path = slot7
			slot7 = slot1.style
			slot7 = slot7.ui
			slot7 = slot7.delay
			slot6.delay = slot7
			slot7 = slot1.style
			slot7 = slot7.ui
			slot7 = slot7.pathIndex
			slot6.pathIndex = slot7

			function slot7(slot0)
				slot1 = uv0
				slot2 = uv0
				slot3 = slot2
				slot2 = slot2.cloneGO
				slot4 = go
				slot5 = slot0
				slot4 = slot4(slot5)
				slot5 = uv0
				slot5 = slot5._tf
				slot6 = uv1
				slot6 = slot6.style
				slot6 = slot6.ui
				slot2 = slot2(slot3, slot4, slot5, slot6)
				slot1.cloneTarget = slot2
			end

			slot6.found = slot7

			function slot7()
				slot0 = uv0
				slot1 = slot0
				slot0 = slot0.endGuider

				slot0(slot1)
			end

			slot6.notFound = slot7

			slot4(slot5, slot6)
		end
	end

	slot4 = onButton
	slot5 = slot0
	slot6 = slot0._go

	function slot7()
		slot0 = uv0
		slot1 = slot0
		slot0 = slot0.finishCurrEvent
		slot2 = uv1
		slot3 = uv2

		slot0(slot1, slot2, slot3)

		slot0 = uv1
		slot0 = slot0.style

		if slot0 then
			slot0 = uv1
			slot0 = slot0.style
			slot0 = slot0.scene

			if slot0 then
				slot0 = pg
				slot0 = slot0.m02
				slot1 = slot0
				slot0 = slot0.sendNotification
				slot2 = GAME
				slot2 = slot2.GO_SCENE
				slot3 = SCENE
				slot4 = uv1
				slot4 = slot4.style
				slot4 = slot4.scene
				slot3 = slot3[slot4]

				slot0(slot1, slot2, slot3)
			end
		end
	end

	slot8 = SFX_PANEL

	slot4(slot5, slot6, slot7, slot8)

	slot4 = setButtonEnabled
	slot5 = slot0._go
	slot6 = slot2

	slot4(slot5, slot6)
end

slot0.updateUIStyle = slot7

function slot7(slot0, slot1)
	slot2 = slot1.style

	if not slot2 then
		slot2 = {}
	end

	slot3 = slot2.dir

	if not slot3 then
		slot3 = 1
	end

	slot4 = slot2.mode

	if not slot4 then
		slot4 = 1
	end

	slot5 = slot2.posX

	if not slot5 then
		slot5 = 0
	end

	slot6 = slot2.posY

	if not slot6 then
		slot6 = 0
	end

	slot7 = SetActive
	slot8 = slot0.styleTF1
	slot9 = uv0
	slot9 = slot9.MODE1

	if slot4 ~= slot9 then
		slot9 = false
	else
		slot9 = true
	end

	slot7(slot8, slot9)

	slot7 = SetActive
	slot8 = slot0.styleTF2
	slot9 = uv0
	slot9 = slot9.MODE2

	if slot4 ~= slot9 then
		slot9 = false
	else
		slot9 = true
	end

	slot7(slot8, slot9)

	slot7 = nil
	slot8 = uv0
	slot8 = slot8.MODE1

	if slot4 == slot8 then
		slot7 = slot0.styleTF1
	else
		slot8 = uv0
		slot8 = slot8.MODE2

		if slot4 == slot8 then
			slot7 = slot0.styleTF2
		end
	end

	if slot3 == 1 then
		slot8 = Vector3
		slot9 = 1
		slot10 = 1
		slot11 = 1
		slot8 = slot8(slot9, slot10, slot11)

		if not slot8 then
			slot8 = Vector3
			slot9 = -1
			slot10 = 1
			slot11 = 1
			slot8 = slot8(slot9, slot10, slot11)
		end
	end

	slot7.localScale = slot8
	slot10 = slot7
	slot9 = slot7.Find
	slot11 = "content"
	slot9 = slot9(slot10, slot11)
	slot9.localScale = slot8
	slot10 = slot2.text

	if not slot10 then
		slot10 = ""
	end

	slot11 = setText
	slot12 = slot9
	slot13 = HXSet
	slot13 = slot13.hxLan
	slot14 = slot10

	slot11(slot12, slot13(slot14))

	slot12 = slot9
	slot11 = slot9.GetComponent
	slot13 = typeof
	slot14 = Text
	slot11 = slot11(slot12, slot13(slot14))
	slot12 = slot11.text
	slot12 = #slot12
	slot13 = CHAT_POP_STR_LEN_MIDDLE

	if slot13 < slot12 then
		slot12 = TextAnchor
		slot12 = slot12.MiddleLeft
		slot11.alignment = slot12
	else
		slot12 = TextAnchor
		slot12 = slot12.MiddleCenter
		slot11.alignment = slot12
	end

	slot12 = slot11.preferredHeight
	slot12 = slot12 + 120
	slot13 = uv0
	slot13 = slot13.MODE2

	if slot4 == slot13 then
		slot13 = slot0.initChatBgH

		if slot13 < slot12 then
			slot13 = Vector2
			slot13 = slot13.New
			slot14 = slot7.sizeDelta
			slot14 = slot14.x
			slot15 = slot12
			slot13 = slot13(slot14, slot15)
			slot7.sizeDelta = slot13
		end
	else
		slot13 = Vector2
		slot13 = slot13.New
		slot14 = slot7.sizeDelta
		slot14 = slot14.x
		slot15 = slot0.initChatBgH
		slot13 = slot13(slot14, slot15)
		slot7.sizeDelta = slot13
	end

	slot13 = setAnchoredPosition
	slot14 = slot0.guiderTF
	slot15 = Vector2
	slot16 = slot5
	slot17 = slot6

	slot13(slot14, slot15(slot16, slot17))
end

slot0.updateContent = slot7

function slot7(slot0)
	slot1 = {}

	function slot2(slot0, slot1)
		slot2 = -1
		slot3 = 1
		slot4 = slot0.childCount
		slot5 = 1

		for slot6 = slot3, slot4, slot5 do
			slot8 = slot0
			slot7 = slot0.GetChild
			slot9 = slot6 - 1
			slot7 = slot7(slot8, slot9)
			slot9 = slot7
			slot8 = slot7.GetComponent
			slot10 = typeof
			slot11 = LayoutElement
			slot8 = slot8(slot9, slot10(slot11))

			if slot8 then
				slot9 = slot8.ignoreLayout

				if not slot9 then
					slot2 = slot2 + 1

					if slot2 == slot1 then
						break
					end
				end
			end
		end

		return slot2
	end

	function slot3(slot0, slot1)
		slot2 = GameObject
		slot2 = slot2.Find
		slot3 = slot0
		slot2 = slot2(slot3)
		slot3 = IsNil
		slot4 = slot2
		slot3 = slot3(slot4)

		if not slot3 then
			if slot1 and slot1 ~= -1 then
				slot3 = uv0
				slot4 = tf
				slot5 = slot2
				slot4 = slot4(slot5)
				slot5 = slot1
				slot3 = slot3(slot4, slot5)
				slot4 = 0

				if slot3 >= slot4 then
					slot4 = tf
					slot5 = slot2
					slot4 = slot4(slot5)
					slot4 = slot4.childCount

					if slot3 < slot4 then
						slot4 = tf
						slot5 = slot2
						slot4 = slot4(slot5)
						slot5 = slot4
						slot4 = slot4.GetChild
						slot6 = slot3
						slot4 = slot4(slot5, slot6)
						slot5 = IsNil
						slot6 = slot4
						slot5 = slot5(slot6)

						if not slot5 then
							return slot4
						end
					end
				end
			else
				slot3 = tf
				slot4 = slot2

				return slot3(slot4)
			end
		end
	end

	function slot4(slot0, slot1)
		slot2 = uv0
		slot3 = slot0
		slot4 = -1
		slot2 = slot2(slot3, slot4)

		if slot2 ~= nil then
			slot3 = slot2.childCount
			slot3 = slot3 - 1
			slot4 = 0
			slot5 = slot3
			slot6 = 1

			for slot7 = slot4, slot5, slot6 do
				slot9 = slot2
				slot8 = slot2.GetChild
				slot10 = slot7
				slot8 = slot8(slot9, slot10)
				slot10 = slot8
				slot9 = slot8.GetChild
				slot11 = 0
				slot9 = slot9(slot10, slot11)
				slot10 = table
				slot10 = slot10.contains
				slot11 = slot1
				slot12 = slot9.name
				slot10 = slot10(slot11, slot12)

				if slot10 then
					return slot8
				end
			end
		end
	end

	function slot5(slot0, slot1)
		slot3 = slot0
		slot2 = slot0.Clear

		slot2(slot3)

		slot2 = 0.5
		slot3 = 20
		slot4 = 0
		slot5 = slot1.delay

		if not slot5 then
			slot5 = 0
		end

		slot6 = Timer
		slot6 = slot6.New

		function slot7()
			slot0 = uv0
			slot1 = uv1
			slot0 = slot0 + slot1
			uv0 = slot0
			slot0 = pg
			slot0 = slot0.UIMgr
			slot0 = slot0.GetInstance
			slot0 = slot0()
			slot1 = slot0
			slot0 = slot0.OnLoading
			slot0 = slot0(slot1)

			if slot0 then
				return
			end

			slot0 = uv0
			slot1 = uv2

			if slot1 < slot0 then
				slot0 = uv3

				if slot0 == 0 then
					slot0 = print
					slot1 = "not found ui >>"
					slot2 = uv4
					slot2 = slot2.path

					slot0(slot1, slot2)

					slot0 = uv5
					slot1 = slot0
					slot0 = slot0.Clear

					slot0(slot1)

					slot0 = uv4
					slot0 = slot0.notFound

					slot0()

					return
				end

				slot0 = nil
				slot1 = uv4
				slot1 = slot1.conditionData

				if slot1 ~= nil then
					slot1 = uv6
					slot2 = uv4
					slot2 = slot2.path
					slot3 = uv4
					slot3 = slot3.conditionData
					slot1 = slot1(slot2, slot3)
					slot0 = slot1
				else
					slot1 = uv7
					slot2 = uv4
					slot2 = slot2.path
					slot3 = uv4
					slot3 = slot3.pathIndex
					slot1 = slot1(slot2, slot3)
					slot0 = slot1
				end

				if slot0 then
					slot1 = go
					slot2 = slot0
					slot1 = slot1(slot2)
					slot1 = slot1.activeInHierarchy

					if slot1 then
						slot1 = uv5
						slot2 = slot1
						slot1 = slot1.Clear

						slot1(slot2)

						slot1 = uv4
						slot1 = slot1.found
						slot2 = slot0

						slot1(slot2)

						return
					end
				end

				slot1 = uv3
				slot1 = slot1 - 1
				uv3 = slot1
			end
		end

		slot8 = slot2
		slot9 = -1
		slot6 = slot6(slot7, slot8, slot9)
		slot0.findUITimer = slot6
		slot6 = slot0.findUITimer
		slot7 = slot6
		slot6 = slot6.Start

		slot6(slot7)

		slot6 = slot0.findUITimer
		slot6 = slot6.func

		slot6()
	end

	slot1.Search = slot5

	function slot5(slot0, slot1)
		slot3 = slot0
		slot2 = slot0.Clear

		slot2(slot3)

		slot2 = uv0
		slot3 = slot1.path
		slot4 = slot1.pathIndex
		slot2 = slot2(slot3, slot4)

		if slot2 then
			slot3 = slot1.found
			slot4 = slot2

			slot3(slot4)
		else
			slot3 = slot1.notFound

			slot3()
		end
	end

	slot1.SearchTimely = slot5

	function slot5(slot0)
		slot1 = slot0.findUITimer

		if slot1 then
			slot1 = slot0.findUITimer
			slot2 = slot1
			slot1 = slot1.Stop

			slot1(slot2)

			slot1 = nil
			slot0.findUITimer = slot1
		end
	end

	slot1.Clear = slot5

	return slot1
end

slot0.Finder = slot7

function slot7(slot0, slot1, slot2, slot3)
	slot4 = tf
	slot5 = Instantiate
	slot6 = slot1
	slot4 = slot4(slot5(slot6))
	slot5 = tf
	slot6 = slot1
	slot5 = slot5(slot6)
	slot5 = slot5.sizeDelta
	slot4.sizeDelta = slot5
	slot5 = SetActive
	slot6 = slot4
	slot7 = true

	slot5(slot6, slot7)

	slot6 = slot4
	slot5 = slot4.SetParent
	slot7 = slot2
	slot8 = false

	slot5(slot6, slot7, slot8)

	slot5 = slot3.hideChildEvent

	if slot5 then
		slot5 = eachChild
		slot6 = slot4

		function slot7(slot0)
			slot2 = slot0
			slot1 = slot0.GetComponent
			slot3 = typeof
			slot4 = Button
			slot1 = slot1(slot2, slot3(slot4))

			if slot1 then
				slot2 = false
				slot1.enabled = slot2
			end
		end

		slot5(slot6, slot7)
	end

	slot5 = slot3.hideAnimtor

	if slot5 then
		slot6 = slot4
		slot5 = slot4.GetComponent
		slot7 = typeof
		slot8 = Animator
		slot5 = slot5(slot6, slot7(slot8))

		if slot5 then
			slot6 = false
			slot5.enabled = slot6
		end
	end

	slot5 = slot0.targetTimer

	if slot5 then
		slot5 = slot0.targetTimer
		slot6 = slot5
		slot5 = slot5.Stop

		slot5(slot6)

		slot5 = nil
		slot0.targetTimer = slot5
	end

	slot5 = slot3.pos

	if not slot5 then
		slot5 = slot3.scale

		if not slot5 then
			slot5 = slot3.eulerAngles

			if not slot5 then
				slot5 = Timer
				slot5 = slot5.New

				function slot6()
					slot0 = IsNil
					slot1 = uv0
					slot0 = slot0(slot1)

					if not slot0 then
						slot0 = IsNil
						slot1 = uv1
						slot0 = slot0(slot1)

						if not slot0 then
							slot0 = uv1
							slot1 = uv0
							slot1 = slot1.transform
							slot1 = slot1.position
							slot0.position = slot1
							slot0 = uv1
							slot0 = slot0.localPosition
							slot1 = uv1
							slot2 = Vector3
							slot3 = slot0.x
							slot4 = slot0.y
							slot5 = 0
							slot2 = slot2(slot3, slot4, slot5)
							slot1.localPosition = slot2
							slot1 = uv0
							slot1 = slot1.transform
							slot1 = slot1.localScale
							slot2 = uv1
							slot3 = Vector3
							slot4 = slot1.x
							slot5 = slot1.y
							slot6 = slot1.z
							slot3 = slot3(slot4, slot5, slot6)
							slot2.localScale = slot3
							slot2 = uv2
							slot2 = slot2.image

							if slot2 then
								slot2 = type
								slot3 = uv2
								slot3 = slot3.image
								slot2 = slot2(slot3)

								if slot2 == "table" then
									slot2 = nil
									slot3 = uv2
									slot3 = slot3.image
									slot3 = slot3.isChild

									if slot3 then
										slot3 = tf
										slot4 = uv0
										slot3 = slot3(slot4)
										slot4 = slot3
										slot3 = slot3.Find
										slot5 = uv2
										slot5 = slot5.image
										slot5 = slot5.source
										slot3 = slot3(slot4, slot5)
										slot2 = slot3
									else
										slot3 = GameObject
										slot3 = slot3.Find
										slot4 = uv2
										slot4 = slot4.image
										slot4 = slot4.source
										slot3 = slot3(slot4)
										slot2 = slot3
									end

									slot3 = uv2
									slot3 = slot3.image
									slot3 = slot3.isRelative
									slot4 = nil

									if slot3 then
										slot5 = uv2
										slot5 = slot5.image
										slot5 = slot5.target

										if slot5 == "" then
											slot4 = uv1
										else
											slot5 = tf
											slot6 = uv1
											slot5 = slot5(slot6)
											slot6 = slot5
											slot5 = slot5.Find
											slot7 = uv2
											slot7 = slot7.image
											slot7 = slot7.target
											slot5 = slot5(slot6, slot7)
											slot4 = slot5
										end
									else
										slot5 = GameObject
										slot5 = slot5.Find
										slot6 = uv2
										slot6 = slot6.image
										slot6 = slot6.target
										slot5 = slot5(slot6)
										slot4 = slot5
									end

									slot5 = IsNil
									slot6 = slot2
									slot5 = slot5(slot6)

									if not slot5 then
										slot5 = IsNil
										slot6 = slot4
										slot5 = slot5(slot6)

										if not slot5 then
											slot6 = slot2
											slot5 = slot2.GetComponent
											slot7 = typeof
											slot8 = Image
											slot5 = slot5(slot6, slot7(slot8))
											slot7 = slot4
											slot6 = slot4.GetComponent
											slot8 = typeof
											slot9 = Image
											slot6 = slot6(slot7, slot8(slot9))

											if slot5 and slot6 then
												slot7 = slot5.sprite
												slot8 = slot6.sprite

												if slot7 and slot8 and slot7 ~= slot8 then
													slot9 = slot5.enabled
													slot6.enabled = slot9
													slot9 = setImageSprite
													slot10 = slot4
													slot11 = slot7

													slot9(slot10, slot11)
												end
											end
										end
									end
								end
							end
						end
					end
				end

				slot7 = 0.01
				slot8 = -1
				slot5 = slot5(slot6, slot7, slot8)
				slot0.targetTimer = slot5
				slot5 = slot0.targetTimer
				slot6 = slot5
				slot5 = slot5.Start

				slot5(slot6)

				slot5 = slot0.targetTimer
				slot5 = slot5.func

				slot5()
			end
		end
	else
		slot5 = slot3.pos

		if slot5 then
			slot5 = Vector3
			slot6 = slot3.pos
			slot6 = slot6.x
			slot7 = slot3.pos
			slot7 = slot7.y
			slot8 = slot3.pos
			slot8 = slot8.z

			if not slot8 then
				slot8 = 0
			end

			slot5 = slot5(slot6, slot7, slot8)
			slot4.localPosition = slot5
		else
			slot5 = slot1.transform
			slot5 = slot5.position
			slot4.position = slot5
			slot5 = slot4.localPosition
			slot6 = Vector3
			slot7 = slot5.x
			slot8 = slot5.y
			slot9 = 0
			slot6 = slot6(slot7, slot8, slot9)
			slot4.localPosition = slot6
		end

		slot5 = slot3.scale

		if not slot5 then
			slot5 = 1
		end

		slot6 = Vector3
		slot7 = slot5
		slot8 = slot5
		slot9 = slot5
		slot6 = slot6(slot7, slot8, slot9)
		slot4.localScale = slot6
		slot6 = slot3.eulerAngles

		if slot6 then
			slot6 = Vector3
			slot7 = slot3.eulerAngles
			slot7 = slot7[1]
			slot8 = slot3.eulerAngles
			slot8 = slot8[2]
			slot9 = slot3.eulerAngles
			slot9 = slot9[3]
			slot6 = slot6(slot7, slot8, slot9)
			slot4.eulerAngles = slot6
		else
			slot6 = Vector3
			slot7 = 0
			slot8 = 0
			slot9 = 0
			slot6 = slot6(slot7, slot8, slot9)
			slot4.eulerAngles = slot6
		end
	end

	return slot4
end

slot0.cloneGO = slot7

function slot7(slot0, slot1, slot2)
	slot3 = SetActive
	slot4 = slot0.fingerTF
	slot5 = true

	slot3(slot4, slot5)

	slot3 = slot1.sizeDelta
	slot3 = slot3.x
	slot3 = slot3 / 2
	slot4 = slot1.sizeDelta
	slot4 = slot4.y
	slot4 = slot4 / 2
	slot5 = slot2.scale

	if slot5 then
		slot5 = slot2.scale
		slot5 = 1 / slot5

		if not slot5 then
			slot5 = 1
		end
	end

	slot6 = slot0.fingerTF
	slot7 = Vector3
	slot8 = slot5
	slot9 = slot5
	slot10 = 1
	slot7 = slot7(slot8, slot9, slot10)
	slot6.localScale = slot7
	slot6 = slot2.fingerPos

	if slot6 then
		slot6 = Vector3
		slot7 = slot2.fingerPos
		slot7 = slot7.posX
		slot8 = slot2.fingerPos
		slot8 = slot8.posY
		slot9 = 0
		slot6 = slot6(slot7, slot8, slot9)

		if not slot6 then
			slot6 = Vector3
			slot7 = slot3
			slot8 = -slot4
			slot9 = 0
			slot6 = slot6(slot7, slot8, slot9)
		end
	end

	slot7 = slot0.cloneTarget

	if slot7 then
		slot7 = slot0.fingerTF
		slot8 = slot7
		slot7 = slot7.SetParent
		slot9 = slot0.cloneTarget
		slot10 = false

		slot7(slot8, slot9, slot10)
	end

	slot7 = setAnchoredPosition
	slot8 = slot0.fingerTF
	slot9 = slot6

	slot7(slot8, slot9)
end

slot0.setFinger = slot7

function slot7(slot0, slot1, slot2, slot3)
	slot4 = slot2.ui
	slot5 = slot1
	slot6 = slot0.cloneTarget
	slot8 = slot6
	slot7 = slot6.GetComponent
	slot9 = typeof
	slot10 = CanvasGroup
	slot7 = slot7(slot8, slot9(slot10))

	if slot7 then
		slot8 = 1
		slot7.alpha = slot8
	end

	slot8 = slot4.eventIndex

	if slot8 then
		slot9 = slot1
		slot8 = slot1.GetChild
		slot10 = slot4.eventIndex
		slot8 = slot8(slot9, slot10)
		slot5 = slot8
		slot8 = slot0.cloneTarget
		slot9 = slot8
		slot8 = slot8.GetChild
		slot10 = slot4.eventIndex
		slot8 = slot8(slot9, slot10)
		slot6 = slot8
	else
		slot8 = slot4.eventPath

		if slot8 then
			slot8 = GameObject
			slot8 = slot8.Find
			slot9 = slot4.eventPath
			slot8 = slot8(slot9)
			slot5 = slot8
			slot8 = IsNil
			slot9 = slot5
			slot8 = slot8(slot9)

			if slot8 then
				slot5 = slot1
			end

			slot8 = slot0.cloneTarget
			slot9 = slot8
			slot8 = slot8.GetComponent
			slot10 = typeof
			slot11 = Image
			slot8 = slot8(slot9, slot10(slot11))

			if slot8 == nil then
				slot8 = GetOrAddComponent
				slot9 = slot0.cloneTarget
				slot10 = typeof
				slot11 = Image
				slot8 = slot8(slot9, slot10(slot11))
				slot9 = Color
				slot10 = 1
				slot11 = 1
				slot12 = 1
				slot13 = 0
				slot9 = slot9(slot10, slot11, slot12, slot13)
				slot8.color = slot9
			end
		end
	end

	slot8 = slot4.triggerType

	if slot8 then
		slot8 = slot4.triggerType
		slot8 = slot8[1]

		if not slot8 then
			slot8 = uv0
		end
	end

	slot9 = uv0

	if slot8 == slot9 then
		slot9 = onButton
		slot10 = slot0
		slot11 = slot6

		function slot12()
			slot0 = IsNil
			slot1 = uv0
			slot0 = slot0(slot1)

			if not slot0 then
				slot0 = uv1
				slot1 = slot0
				slot0 = slot0.finishCurrEvent
				slot2 = uv2
				slot3 = uv3

				slot0(slot1, slot2, slot3)

				slot0 = triggerButton
				slot1 = uv0

				slot0(slot1)
			end
		end

		slot13 = SFX_PANEL

		slot9(slot10, slot11, slot12, slot13)

		slot9 = setButtonEnabled
		slot10 = slot6
		slot11 = true

		slot9(slot10, slot11)
	else
		slot9 = uv1

		if slot8 == slot9 then
			slot9 = onToggle
			slot10 = slot0
			slot11 = slot6

			function slot12(slot0)
				if slot0 then
					slot1 = IsNil
					slot2 = uv0
					slot1 = slot1(slot2)

					if not slot1 then
						slot1 = uv1
						slot2 = slot1
						slot1 = slot1.finishCurrEvent
						slot3 = uv2
						slot4 = uv3

						slot1(slot2, slot3, slot4)

						slot1 = triggerToggle
						slot2 = uv0
						slot3 = uv4
						slot3 = slot3.triggerType
						slot3 = slot3[2]

						if not slot3 then
							slot3 = true
						end

						slot1(slot2, slot3)
					end
				end
			end

			slot13 = SFX_PANEL

			slot9(slot10, slot11, slot12, slot13)

			slot9 = setToggleEnabled
			slot10 = slot6
			slot11 = true

			slot9(slot10, slot11)
		else
			slot9 = uv2

			if slot8 == slot9 then
				slot10 = slot5
				slot9 = slot5.GetComponent
				slot11 = typeof
				slot12 = EventTriggerListener
				slot9 = slot9(slot10, slot11(slot12))
				slot11 = slot6
				slot10 = slot6.GetComponent
				slot12 = typeof
				slot13 = EventTriggerListener
				slot10 = slot10(slot11, slot12(slot13))
				slot12 = slot10
				slot11 = slot10.AddPointDownFunc

				function slot13(slot0, slot1)
					slot2 = IsNil
					slot3 = uv0
					slot2 = slot2(slot3)

					if not slot2 then
						slot2 = uv1
						slot3 = slot2
						slot2 = slot2.OnPointerDown
						slot4 = slot1

						slot2(slot3, slot4)
					end
				end

				slot11(slot12, slot13)

				slot12 = slot10
				slot11 = slot10.AddPointUpFunc

				function slot13(slot0, slot1)
					slot2 = uv0
					slot3 = slot2
					slot2 = slot2.finishCurrEvent
					slot4 = uv1
					slot5 = uv2

					slot2(slot3, slot4, slot5)

					slot2 = IsNil
					slot3 = uv3
					slot2 = slot2(slot3)

					if not slot2 then
						slot2 = uv4
						slot3 = slot2
						slot2 = slot2.OnPointerUp
						slot4 = slot1

						slot2(slot3, slot4)
					end
				end

				slot11(slot12, slot13)

				return
			end

			slot9 = uv3

			if slot8 == slot9 then
				slot10 = slot6
				slot9 = slot6.GetComponent
				slot11 = typeof
				slot12 = EventTriggerListener
				slot9 = slot9(slot10, slot11(slot12))

				if slot9 == nil then
					slot10 = go
					slot11 = slot6
					slot10 = slot10(slot11)
					slot11 = slot10
					slot10 = slot10.AddComponent
					slot12 = typeof
					slot13 = EventTriggerListener
					slot10 = slot10(slot11, slot12(slot13))
					slot9 = slot10
				end

				slot11 = slot9
				slot10 = slot9.AddPointDownFunc

				function slot12(slot0, slot1)
					slot2 = IsNil
					slot3 = uv0
					slot2 = slot2(slot3)

					if not slot2 then
						slot2 = uv1
						slot3 = slot2
						slot2 = slot2.finishCurrEvent
						slot4 = uv2
						slot5 = uv3

						slot2(slot3, slot4, slot5)
					end
				end

				slot10(slot11, slot12)
			else
				slot9 = uv4

				if slot8 == slot9 then
					slot10 = slot6
					slot9 = slot6.GetComponent
					slot11 = typeof
					slot12 = EventTriggerListener
					slot9 = slot9(slot10, slot11(slot12))

					if slot9 == nil then
						slot10 = go
						slot11 = slot6
						slot10 = slot10(slot11)
						slot11 = slot10
						slot10 = slot10.AddComponent
						slot12 = typeof
						slot13 = EventTriggerListener
						slot10 = slot10(slot11, slot12(slot13))
						slot9 = slot10
					end

					slot11 = slot9
					slot10 = slot9.AddPointUpFunc

					function slot12(slot0, slot1)
						slot2 = uv0
						slot3 = slot2
						slot2 = slot2.finishCurrEvent
						slot4 = uv1
						slot5 = uv2

						slot2(slot3, slot4, slot5)
					end

					slot10(slot11, slot12)
				end
			end
		end
	end
end

slot0.addUIEventTrigger = slot7

function slot7(slot0, slot1, slot2)
	slot3 = slot0.bgAlpha
	slot4 = 0.2
	slot3.alpha = slot4
	slot3 = removeOnButton
	slot4 = slot0._go

	slot3(slot4)

	slot3 = SetParent
	slot4 = slot0.fingerTF
	slot5 = tf
	slot6 = slot0._go
	slot5 = slot5(slot6)
	slot6 = false

	slot3(slot4, slot5, slot6)

	slot3 = SetActive
	slot4 = slot0.fingerTF
	slot5 = false

	slot3(slot4, slot5)

	slot3 = SetActive
	slot4 = slot0.guiderTF
	slot5 = false

	slot3(slot4, slot5)

	slot3 = slot0.fingerTF
	slot4 = Vector3
	slot5 = 1
	slot6 = 1
	slot7 = 1
	slot4 = slot4(slot5, slot6, slot7)
	slot3.localScale = slot4
	slot3 = slot0.cloneTarget

	if slot3 then
		slot3 = SetActive
		slot4 = slot0.cloneTarget
		slot5 = false

		slot3(slot4, slot5)

		slot3 = Destroy
		slot4 = slot0.cloneTarget

		slot3(slot4)

		slot3 = nil
		slot0.cloneTarget = slot3
	end

	slot3 = slot0.targetTimer

	if slot3 then
		slot3 = slot0.targetTimer
		slot4 = slot3
		slot3 = slot3.Stop

		slot3(slot4)

		slot3 = nil
		slot0.targetTimer = slot3
	end

	slot3 = slot0.findUITimer

	if slot3 then
		slot3 = slot0.findUITimer
		slot4 = slot3
		slot3 = slot3.Stop

		slot3(slot4)

		slot3 = nil
		slot0.findUITimer = slot3
	end

	if slot2 then
		slot3 = slot2

		slot3()
	end
end

slot0.finishCurrEvent = slot7

function slot7(slot0)
	slot2 = slot0
	slot1 = slot0.clearDelegateInfo

	slot1(slot2)

	slot1 = slot0.delayTimer

	if slot1 then
		slot1 = slot0.delayTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.delayTimer = slot1
	end

	slot1 = slot0.targetTimer

	if slot1 then
		slot1 = slot0.targetTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.targetTimer = slot1
	end

	slot1 = slot0.signTimer

	if slot1 then
		slot1 = slot0.signTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.signTimer = slot1
	end

	slot1 = slot0.finder
	slot2 = slot1
	slot1 = slot1.Clear

	slot1(slot2)

	slot1 = slot0.cloneTarget

	if slot1 then
		slot1 = SetParent
		slot2 = slot0.fingerTF
		slot3 = slot0._go

		slot1(slot2, slot3)

		slot1 = Destroy
		slot2 = slot0.cloneTarget

		slot1(slot2)

		slot1 = nil
		slot0.cloneTarget = slot1
	end

	slot1 = slot0._go
	slot2 = slot1
	slot1 = slot1.SetActive
	slot3 = false

	slot1(slot2, slot3)

	slot1 = removeOnButton
	slot2 = slot0._go

	slot1(slot2)

	slot1 = slot0.curEvents

	if slot1 then
		slot1 = nil
		slot0.curEvents = slot1
	end

	slot1 = slot0.currentGuide

	if slot1 then
		slot1 = nil
		slot0.currentGuide = slot1
	end

	slot1 = slot0.uiLongPress
	slot1 = slot1.onLongPressed
	slot2 = slot1
	slot1 = slot1.RemoveAllListeners

	slot1(slot2)
end

function slot8(slot0)
	slot1 = pg
	slot1 = slot1.DelegateInfo
	slot1 = slot1.New
	slot2 = slot0

	slot1(slot2)

	slot1 = true
	slot0.isAddDelegateInfo = slot1
end

slot0.addDelegateInfo = slot8

function slot8(slot0)
	slot1 = slot0.isAddDelegateInfo

	if slot1 then
		slot1 = pg
		slot1 = slot1.DelegateInfo
		slot1 = slot1.Dispose
		slot2 = slot0

		slot1(slot2)

		slot1 = nil
		slot0.isAddDelegateInfo = slot1
	end
end

slot0.clearDelegateInfo = slot8

function slot8(slot0)
	slot1 = SetActive
	slot2 = slot0._go
	slot3 = true

	slot1(slot2, slot3)
end

slot0.mask = slot8

function slot8(slot0)
	slot1 = SetActive
	slot2 = slot0._go
	slot3 = false

	slot1(slot2, slot3)
end

slot0.unMask = slot8

function slot8(slot0, slot1)
	slot2 = uv0
	slot3 = slot0

	slot2(slot3)

	slot2 = uv1
	slot2 = slot2.MANAGER_STATE
	slot2 = slot2.IDLE
	slot0.managerState = slot2
	slot2 = pg
	slot2 = slot2.m02
	slot3 = slot2
	slot2 = slot2.sendNotification
	slot4 = GAME
	slot4 = slot4.END_GUIDE

	slot2(slot3, slot4)

	if slot1 then
		slot2 = slot1

		slot2()
	end
end

slot0.endGuider = slot8

function slot8(slot0)
	slot1 = slot0._go
	slot1 = slot1.activeSelf

	if slot1 then
		slot1 = slot0.managerState
		slot0.prevState = slot1
		slot1 = uv0
		slot1 = slot1.MANAGER_STATE
		slot1 = slot1.BREAK
		slot0.managerState = slot1
		slot1 = SetActive
		slot2 = slot0._go
		slot3 = false

		slot1(slot2, slot3)

		slot1 = slot0.cloneTarget

		if slot1 then
			slot1 = SetActive
			slot2 = slot0.cloneTarget
			slot3 = false

			slot1(slot2, slot3)
		end
	end
end

slot0.onDisconnected = slot8

function slot8(slot0)
	slot1 = slot0.prevState

	if slot1 then
		slot1 = slot0.prevState
		slot0.managerState = slot1
		slot1 = nil
		slot0.prevState = slot1
		slot1 = SetActive
		slot2 = slot0._go
		slot3 = true

		slot1(slot2, slot3)

		slot1 = slot0.cloneTarget

		if slot1 then
			slot1 = SetActive
			slot2 = slot0.cloneTarget
			slot3 = true

			slot1(slot2, slot3)
		end
	end
end

slot0.onReconneceted = slot8
