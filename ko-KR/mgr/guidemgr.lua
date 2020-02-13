pg = pg or {}
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

	slot2 = slot0
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
		slot1 = slot0
		slot1._go = slot0
		slot1 = slot0
		slot2 = slot0
		slot2 = slot2._go
		slot2 = slot2.transform
		slot1._tf = slot2
		slot1 = slot0
		slot1 = slot1._go
		slot2 = slot1
		slot1 = slot1.SetActive
		slot3 = false

		slot1(slot2, slot3)

		slot1 = slot0
		slot2 = tf
		slot3 = GameObject
		slot3 = slot3.Find
		slot4 = "Overlay/UIOverlay"
		slot2 = slot2(slot3(slot4))
		slot1.UIOverlay = slot2
		slot1 = slot0
		slot1 = slot1._go
		slot1 = slot1.transform
		slot2 = slot1
		slot1 = slot1.SetParent
		slot3 = slot0
		slot3 = slot3.UIOverlay
		slot4 = false

		slot1(slot2, slot3, slot4)

		slot1 = slot0
		slot2 = findTF
		slot3 = slot0
		slot3 = slot3._go
		slot4 = "Guider"
		slot2 = slot2(slot3, slot4)
		slot1.guiderTF = slot2
		slot1 = slot0
		slot2 = findTF
		slot3 = slot0
		slot3 = slot3.guiderTF
		slot4 = "mode1"
		slot2 = slot2(slot3, slot4)
		slot1.styleTF1 = slot2
		slot1 = slot0
		slot2 = findTF
		slot3 = slot0
		slot3 = slot3.guiderTF
		slot4 = "mode2"
		slot2 = slot2(slot3, slot4)
		slot1.styleTF2 = slot2
		slot1 = slot0
		slot2 = slot0
		slot2 = slot2.styleTF2
		slot2 = slot2.sizeDelta
		slot2 = slot2.y
		slot1.initChatBgH = slot2
		slot1 = SetActive
		slot2 = slot0
		slot2 = slot2.guiderTF
		slot3 = false

		slot1(slot2, slot3)

		slot1 = slot0
		slot2 = findTF
		slot3 = slot0
		slot3 = slot3._go
		slot4 = "BG"
		slot2 = slot2(slot3, slot4)
		slot1._bg = slot2
		slot1 = slot0
		slot2 = slot0
		slot2 = slot2._bg
		slot3 = slot2
		slot2 = slot2.GetComponent
		slot4 = typeof
		slot5 = CanvasGroup
		slot2 = slot2(slot3, slot4(slot5))
		slot1.bgAlpha = slot2
		slot1 = slot0
		slot1 = slot1.bgAlpha
		slot2 = 0.2
		slot1.alpha = slot2
		slot1 = slot0
		slot2 = slot0
		slot2 = slot2._bg
		slot3 = slot2
		slot2 = slot2.Find
		slot4 = "close_btn"
		slot2 = slot2(slot3, slot4)
		slot1._closeBtn = slot2
		slot1 = slot0
		slot2 = GetOrAddComponent
		slot3 = slot0
		slot3 = slot3._closeBtn
		slot4 = typeof
		slot5 = UILongPressTrigger
		slot2 = slot2(slot3, slot4(slot5))
		slot1.uiLongPress = slot2
		slot1 = slot0
		slot1 = slot1.uiLongPress
		slot2 = 10
		slot1.longPressThreshold = slot2
		slot1 = slot0
		slot2 = findTF
		slot3 = slot0
		slot3 = slot3._go
		slot4 = "finger"
		slot2 = slot2(slot3, slot4)
		slot1.fingerTF = slot2
		slot1 = SetActive
		slot2 = slot0
		slot2 = slot2.fingerTF
		slot3 = false

		slot1(slot2, slot3)

		slot1 = slot0
		slot2 = findTF
		slot3 = slot0
		slot3 = slot3._go
		slot4 = "wTask"
		slot2 = slot2(slot3, slot4)
		slot1.wTask = slot2
		slot1 = setActive
		slot2 = slot0
		slot2 = slot2.wTask
		slot3 = false

		slot1(slot2, slot3)

		slot1 = slot0
		slot2 = {}
		slot1.fingerSprites = slot2
		slot1 = eachChild
		slot2 = findTF
		slot3 = slot0
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
			slot3 = slot0
			slot3 = slot3.fingerSprites
			slot4 = slot1

			slot2(slot3, slot4)
		end

		slot1(slot2, slot3)

		slot1 = slot0
		slot2 = nil
		slot1.sceneFunc = slot2
		slot1 = slot0
		slot2 = true
		slot1.inited = slot2
		slot1 = slot0
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.Finder
		slot2 = slot2(slot3)
		slot1.finder = slot2
		slot1 = slot0
		slot2 = slot1
		slot2 = slot2.MANAGER_STATE
		slot2 = slot2.IDLE
		slot1.managerState = slot2
		slot1 = slot2

		slot1()
	end

	slot2(slot3, slot4, slot5, slot6)
end

slot0.Init = slot7

function slot7(slot0)
	return slot0.managerState == slot0.MANAGER_STATE.BUSY
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
	slot2 = slot0
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
	slot5 = slot0
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
						slot2 = slot0

						function slot3(slot0)
							slot1 = table
							slot1 = slot1.contains
							slot2 = slot0
							slot2 = slot2.code
							slot3 = slot0

							return slot1(slot2, slot3)
						end

						return slot1(slot2, slot3)
					else
						slot1 = table
						slot1 = slot1.contains
						slot2 = slot0
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

		slot0:prepareGuider(slot3)

		slot8 = {}
		slot9, slot10, slot11 = ipairs(slot0.curEvents or {})

		for slot12, slot13 in slot9, slot10, slot11 do
			slot14 = table
			slot14 = slot14.insert
			slot15 = slot8

			function slot16(slot0)
				function slot1()
					slot0 = slot0
					slot0 = slot0.managerState
					slot1 = slot1
					slot1 = slot1.MANAGER_STATE
					slot1 = slot1.IDLE

					if slot0 ~= slot1 then
						slot0 = slot0
						slot1 = {}
						slot0.scenes = slot1
						slot0 = slot2

						slot0()
					else
						slot0 = slot0
						slot0 = slot0.erroCallback

						slot0()

						slot0 = slot0
						slot1 = nil
						slot0.erroCallback = slot1
					end
				end

				slot2 = slot0
				slot3 = slot2
				slot2 = slot2.doCurrEvent
				slot4 = slot2
				slot5 = slot1

				slot2(slot3, slot4, slot5)
			end

			slot14(slot15, slot16)
		end

		slot9 = slot0
		slot9 = slot9.MANAGER_STATE
		slot9 = slot9.BUSY
		slot0.managerState = slot9
		slot9 = seriesAsync
		slot10 = slot8

		function slot11()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.endGuider
			slot2 = slot1

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
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.endGuider
		slot2 = slot1

		slot0(slot1, slot2)
	end

	slot2(slot3, slot4)
end

slot0.prepareGuider = slot7

function slot7(slot0, slot1, slot2)
	function slot3(slot0)
		slot1 = slot0
		slot1 = slot1.waitScene

		if slot1 then
			slot1 = slot0
			slot1 = slot1.waitScene

			if slot1 ~= "" then
				slot1 = table
				slot1 = slot1.contains
				slot2 = slot1
				slot2 = slot2.scenes
				slot3 = slot0
				slot3 = slot3.waitScene
				slot1 = slot1(slot2, slot3)

				if not slot1 then
					slot1 = slot1

					function slot2(slot0)
						slot1 = slot0
						slot1 = slot1.waitScene

						if slot1 ~= slot0 then
							slot1 = table
							slot1 = slot1.contains
							slot2 = slot1
							slot2 = slot2.sceneStore
							slot3 = slot0
							slot3 = slot3.waitScene
							slot1 = slot1(slot2, slot3)

							if slot1 then
								slot1 = slot1
								slot2 = nil
								slot1.sceneFunc = slot2
								slot1 = slot2

								slot1()
							end
						end
					end

					slot1.sceneFunc = slot2
					slot1 = slot1
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
		slot0 = slot0
		slot0 = slot0.hideui

		if slot0 then
			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.hideUI
			slot2 = slot0
			slot3 = slot2

			slot0(slot1, slot2, slot3)
		else
			slot0 = slot0
			slot0 = slot0.stories

			if slot0 then
				slot0 = slot1
				slot1 = slot0
				slot0 = slot0.playStories
				slot2 = slot0
				slot3 = slot2

				slot0(slot1, slot2, slot3)
			else
				slot0 = slot0
				slot0 = slot0.notifies

				if slot0 then
					slot0 = slot1
					slot1 = slot0
					slot0 = slot0.sendNotifies
					slot2 = slot0
					slot3 = slot2

					slot0(slot1, slot2, slot3)
				else
					slot0 = slot0
					slot0 = slot0.showSign

					if slot0 then
						slot0 = slot1
						slot1 = slot0
						slot0 = slot0.showSign
						slot2 = slot0
						slot2 = slot2.showSign
						slot3 = slot2

						slot0(slot1, slot2, slot3)
					else
						slot0 = slot0
						slot0 = slot0.doNothing

						if slot0 then
							slot0 = slot2

							slot0()
						else
							slot0 = slot1
							slot1 = slot0
							slot0 = slot0.findUI
							slot2 = slot0
							slot3 = slot2

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
			slot0 = slot0
			slot1 = slot1

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
		slot0 = slot0
		slot0 = slot0.duration
		slot1 = slot0
		slot1 = slot1.pos
		slot2 = slot0
		slot2 = slot2.signType
		slot3 = nil

		if slot2 == 1 then
			slot4 = slot1
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

		slot4 = slot1
		slot5 = Timer
		slot5 = slot5.New

		function slot6()
			slot0 = setActive
			slot1 = slot0
			slot2 = false

			slot0(slot1, slot2)

			slot0 = slot1

			slot0()
		end

		slot7 = slot0
		slot8 = slot0
		slot9 = 1
		slot5 = slot5(slot6, slot7, slot8, slot9)
		slot4.signTimer = slot5
		slot4 = slot1
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
			slot3 = slot0
			slot3 = slot3.notify
			slot4 = slot0
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
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.finishCurrEvent
		slot2 = slot1
		slot3 = slot2

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
			slot3 = slot0
			slot4 = slot0
			slot5 = true

			slot1(slot2, slot3, slot4, slot5)
		end

		slot9(slot10, slot11)
	end

	slot4 = seriesAsync
	slot5 = slot3

	function slot6()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.finishCurrEvent
		slot2 = slot1
		slot3 = slot2

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
			slot1 = slot0
			slot1 = slot1.finder
			slot2 = slot1
			slot1 = slot1.SearchTimely
			slot3 = {}
			slot4 = slot1
			slot4 = slot4.path
			slot3.path = slot4
			slot4 = slot1
			slot4 = slot4.delay
			slot3.delay = slot4
			slot4 = slot1
			slot4 = slot4.pathIndex
			slot3.pathIndex = slot4

			function slot4(slot0)
				slot1 = SetActive
				slot2 = slot0
				slot3 = slot0
				slot3 = slot3.ishide
				slot3 = not slot3

				slot1(slot2, slot3)

				slot1 = slot1

				slot1()
			end

			slot3.found = slot4

			function slot4()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.endGuider
				slot2 = slot1

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
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.finishCurrEvent
		slot2 = slot1
		slot3 = slot2

		slot0(slot1, slot2, slot3)
	end

	slot4(slot5, slot6)
end

slot0.hideUI = slot7

function slot7(slot0, slot1, slot2)
	slot3 = true
	slot4 = {}

	function slot5(slot0)
		slot1 = slot0
		slot1 = slot1.baseui

		if not slot1 then
			slot1 = slot0

			slot1()

			return
		end

		slot1 = slot1
		slot1 = slot1.finder
		slot2 = slot1
		slot1 = slot1.Search
		slot3 = {}
		slot4 = slot0
		slot4 = slot4.baseui
		slot4 = slot4.path
		slot3.path = slot4
		slot4 = slot0
		slot4 = slot4.baseui
		slot4 = slot4.delay
		slot3.delay = slot4
		slot4 = slot0
		slot4 = slot4.baseui
		slot4 = slot4.pathIndex
		slot3.pathIndex = slot4
		slot4 = slot0
		slot4 = slot4.baseui
		slot4 = slot4.conditionData
		slot3.conditionData = slot4
		slot3.found = slot0

		function slot4()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.endGuider
			slot2 = slot1

			slot0(slot1, slot2)
		end

		slot3.notFound = slot4

		slot1(slot2, slot3)
	end

	slot4[1] = slot5

	function slot5(slot0)
		slot1 = slot0
		slot1 = slot1.ui

		if not slot1 then
			slot1 = slot0

			slot1()

			return
		end

		slot1 = false
		slot1 = slot2
		slot1 = slot1.finder
		slot2 = slot1
		slot1 = slot1.Search
		slot3 = {}
		slot4 = slot0
		slot4 = slot4.ui
		slot4 = slot4.path
		slot3.path = slot4
		slot4 = slot0
		slot4 = slot4.ui
		slot4 = slot4.delay
		slot3.delay = slot4
		slot4 = slot0
		slot4 = slot4.ui
		slot4 = slot4.pathIndex
		slot3.pathIndex = slot4
		slot4 = slot0
		slot4 = slot4.ui
		slot4 = slot4.conditionData
		slot3.conditionData = slot4

		function slot4(slot0)
			slot1 = Canvas
			slot1 = slot1.ForceUpdateCanvases

			slot1()

			slot1 = slot0
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.cloneGO
			slot4 = slot0.gameObject
			slot5 = slot0
			slot5 = slot5._go
			slot5 = slot5.transform
			slot6 = slot1
			slot6 = slot6.ui
			slot2 = slot2(slot3, slot4, slot5, slot6)
			slot1.cloneTarget = slot2
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.addUIEventTrigger
			slot3 = slot0
			slot4 = slot1
			slot5 = slot2

			slot1(slot2, slot3, slot4, slot5)

			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.setFinger
			slot3 = slot0
			slot4 = slot1
			slot4 = slot4.ui

			slot1(slot2, slot3, slot4)

			slot1 = slot3

			slot1()
		end

		slot3.found = slot4

		function slot4()
			slot0 = slot0
			slot0 = slot0.ui
			slot0 = slot0.notfoundSkip

			if slot0 then
				slot0 = slot1
				slot1 = slot0
				slot0 = slot0.finishCurrEvent
				slot2 = slot0
				slot3 = slot2

				slot0(slot1, slot2, slot3)
			else
				slot0 = slot1
				slot1 = slot0
				slot0 = slot0.endGuider
				slot2 = slot2

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
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.updateUIStyle
		slot2 = slot1
		slot3 = slot2
		slot4 = slot3

		slot0(slot1, slot2, slot3, slot4)
	end

	slot5(slot6, slot7)
end

slot0.findUI = slot7

function slot7(slot0, slot1, slot2, slot3)
	slot0.bgAlpha.alpha = slot1.alpha or 0.2
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
				slot1 = slot0
				slot2 = slot0
				slot3 = slot2
				slot2 = slot2.cloneGO
				slot4 = go
				slot5 = slot0
				slot4 = slot4(slot5)
				slot5 = slot0
				slot5 = slot5._tf
				slot6 = slot1
				slot6 = slot6.style
				slot6 = slot6.ui
				slot2 = slot2(slot3, slot4, slot5, slot6)
				slot1.cloneTarget = slot2
			end

			slot6.found = slot7

			function slot7()
				slot0 = slot0
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
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.finishCurrEvent
		slot2 = slot1
		slot3 = slot2

		slot0(slot1, slot2, slot3)

		slot0 = slot1
		slot0 = slot0.style

		if slot0 then
			slot0 = slot1
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
				slot4 = slot1
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

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = slot1.style
	slot2 = slot1.style or {}
	slot3 = slot1.style or .dir or 1
	slot5 = slot1.style or .posX or 0
	slot6 = slot1.style or .posY or 0

	SetActive(slot0.styleTF1, (slot1.style or .mode or 1) == slot0.MODE1)
	SetActive(slot0.styleTF2, (slot1.style or .mode or 1) == slot0.MODE2)

	slot7 = nil
	slot8 = slot0.MODE1
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-4, warpins: 1 ---
	slot2 = 
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 5-7, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 8-8, warpins: 1 ---
	slot3 = 1
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 9-11, warpins: 2 ---
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #5 12-12, warpins: 1 ---
	slot4 = 1
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 13-15, warpins: 2 ---
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #7 16-16, warpins: 1 ---
	slot5 = 0
	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 17-19, warpins: 2 ---
	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #9 20-20, warpins: 1 ---
	slot6 = 0
	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 21-26, warpins: 2 ---
	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #11 27-28, warpins: 1 ---
	slot9 = false

	if false then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-29, warpins: 1 ---
		slot9 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 30-36, warpins: 2 ---
	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #13 37-38, warpins: 1 ---
	slot9 = false

	if false then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-39, warpins: 1 ---
		slot9 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 40-45, warpins: 2 ---
	if slot4 == slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-47, warpins: 1 ---
		slot7 = slot0.styleTF1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 48-51, warpins: 1 ---
		slot8 = slot0
		slot8 = slot8.MODE2

		if slot4 == slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 52-52, warpins: 1 ---
			slot7 = slot0.styleTF2
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 53-54, warpins: 3 ---
	if slot3 == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-61, warpins: 1 ---
		slot8 = Vector3
		slot9 = 1
		slot10 = 1
		slot11 = 1
		slot8 = slot8(slot9, slot10, slot11)

		if not slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 62-66, warpins: 2 ---
			slot8 = Vector3
			slot9 = -1
			slot10 = 1
			slot11 = 1
			slot8 = slot8(slot9, slot10, slot11)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #15 ---

	FLOW; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #16 67-75, warpins: 2 ---
	slot7.localScale = slot8
	slot9 = slot7:Find("content")
	slot9.localScale = slot8

	setText(slot9, HXSet.hxLan(slot10))

	slot12 = #slot9:GetComponent(typeof(Text)).text
	slot13 = CHAT_POP_STR_LEN_MIDDLE
	--- END OF BLOCK #16 ---

	FLOW; TARGET BLOCK #18



	-- Decompilation error in this vicinity:
	--- BLOCK #17 76-76, warpins: 1 ---
	slot10 = ""

	--- END OF BLOCK #17 ---

	FLOW; TARGET BLOCK #18



	-- Decompilation error in this vicinity:
	--- BLOCK #18 77-94, warpins: 2 ---
	if slot13 < slot12 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 95-98, warpins: 1 ---
		slot12 = TextAnchor
		slot12 = slot12.MiddleLeft
		slot11.alignment = slot12
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 99-101, warpins: 1 ---
		slot12 = TextAnchor
		slot12 = slot12.MiddleCenter
		slot11.alignment = slot12
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #18 ---

	FLOW; TARGET BLOCK #19



	-- Decompilation error in this vicinity:
	--- BLOCK #19 102-107, warpins: 2 ---
	slot12 = slot11.preferredHeight
	slot12 = slot12 + 120
	slot13 = slot0
	slot13 = slot13.MODE2

	if slot4 == slot13 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 108-110, warpins: 1 ---
		slot13 = slot0.initChatBgH

		if slot13 < slot12 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 111-118, warpins: 1 ---
			slot13 = Vector2
			slot13 = slot13.New
			slot14 = slot7.sizeDelta
			slot14 = slot14.x
			slot15 = slot12
			slot13 = slot13(slot14, slot15)
			slot7.sizeDelta = slot13
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 119-125, warpins: 2 ---
		slot13 = Vector2
		slot13 = slot13.New
		slot14 = slot7.sizeDelta
		slot14 = slot14.x
		slot15 = slot0.initChatBgH
		slot13 = slot13(slot14, slot15)
		slot7.sizeDelta = slot13
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #19 ---

	FLOW; TARGET BLOCK #20



	-- Decompilation error in this vicinity:
	--- BLOCK #20 126-133, warpins: 2 ---
	slot13 = setAnchoredPosition
	slot14 = slot0.guiderTF
	slot15 = Vector2
	slot16 = slot5
	slot17 = slot6

	slot13(slot14, slot15(slot16, slot17))

	return
	--- END OF BLOCK #20 ---



end

slot0.updateContent = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot1 = {}

	function slot2(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot2 = -1
		slot3 = 1
		slot4 = slot0.childCount
		slot5 = 1

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-25, warpins: 0 ---
		for slot6 = slot3, slot4, slot5 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-17, warpins: 2 ---
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

				-- Decompilation error in this vicinity:
				--- BLOCK #0 18-20, warpins: 1 ---
				slot9 = slot8.ignoreLayout

				if not slot9 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 21-23, warpins: 2 ---
					slot2 = slot2 + 1

					if slot2 == slot1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 24-24, warpins: 1 ---
						break
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 25-25, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 26-26, warpins: 2 ---
		return slot2
		--- END OF BLOCK #2 ---



	end

	function slot3(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot2 = GameObject
		slot2 = slot2.Find
		slot3 = slot0
		slot2 = slot2(slot3)
		slot3 = IsNil
		slot4 = slot2
		slot3 = slot3(slot4)

		if not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-11, warpins: 1 ---
			if slot1 and slot1 ~= -1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-22, warpins: 1 ---
				slot3 = slot0
				slot4 = tf
				slot5 = slot2
				slot4 = slot4(slot5)
				slot5 = slot1
				slot3 = slot3(slot4, slot5)
				slot4 = 0

				if slot3 >= slot4 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 23-28, warpins: 1 ---
					slot4 = tf
					slot5 = slot2
					slot4 = slot4(slot5)
					slot4 = slot4.childCount

					if slot3 < slot4 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 29-40, warpins: 1 ---
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

							-- Decompilation error in this vicinity:
							--- BLOCK #0 41-42, warpins: 1 ---
							return slot4
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 43-45, warpins: 2 ---
				slot3 = tf
				slot4 = slot2

				return slot3(slot4)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 46-46, warpins: 6 ---
		return
		--- END OF BLOCK #1 ---



	end

	function slot4(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot2 = slot0
		slot3 = slot0
		slot4 = -1
		slot2 = slot2(slot3, slot4)

		if slot2 ~= nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-12, warpins: 1 ---
			slot3 = slot2.childCount
			slot3 = slot3 - 1
			slot4 = 0
			slot5 = slot3
			slot6 = 1

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 13-29, warpins: 0 ---
			for slot7 = slot4, slot5, slot6 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-27, warpins: 2 ---
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

					-- Decompilation error in this vicinity:
					--- BLOCK #0 28-28, warpins: 1 ---
					return slot8
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 29-29, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 30-30, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	function slot5(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot3 = slot0
		slot2 = slot0.Clear

		slot2(slot3)

		slot2 = 0.5
		slot3 = 20
		slot4 = 0
		slot5 = slot1.delay

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-10, warpins: 1 ---
			slot5 = 0
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-26, warpins: 2 ---
		slot6 = Timer
		slot6 = slot6.New

		function slot7()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-13, warpins: 1 ---
			slot0 = slot0
			slot1 = slot1
			slot0 = slot0 + slot1
			slot0 = slot0
			slot0 = pg
			slot0 = slot0.UIMgr
			slot0 = slot0.GetInstance
			slot0 = slot0()
			slot1 = slot0
			slot0 = slot0.OnLoading
			slot0 = slot0(slot1)

			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-14, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-18, warpins: 2 ---
			slot0 = slot0
			slot1 = slot2

			if slot1 < slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 19-21, warpins: 1 ---
				slot0 = slot3

				if slot0 == 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 22-34, warpins: 1 ---
					slot0 = print
					slot1 = "not found ui >>"
					slot2 = slot4
					slot2 = slot2.path

					slot0(slot1, slot2)

					slot0 = slot5
					slot1 = slot0
					slot0 = slot0.Clear

					slot0(slot1)

					slot0 = slot4
					slot0 = slot0.notFound

					slot0()

					return
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 35-39, warpins: 2 ---
				slot0 = nil
				slot1 = slot4
				slot1 = slot1.conditionData

				if slot1 ~= nil then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 40-47, warpins: 1 ---
					slot1 = slot6
					slot2 = slot4
					slot2 = slot2.path
					slot3 = slot4
					slot3 = slot3.conditionData
					slot1 = slot1(slot2, slot3)
					slot0 = slot1
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 48-54, warpins: 1 ---
					slot1 = slot7
					slot2 = slot4
					slot2 = slot2.path
					slot3 = slot4
					slot3 = slot3.pathIndex
					slot1 = slot1(slot2, slot3)
					slot0 = slot1
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 55-56, warpins: 2 ---
				if slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 57-62, warpins: 1 ---
					slot1 = go
					slot2 = slot0
					slot1 = slot1(slot2)
					slot1 = slot1.activeInHierarchy

					if slot1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 63-71, warpins: 1 ---
						slot1 = slot5
						slot2 = slot1
						slot1 = slot1.Clear

						slot1(slot2)

						slot1 = slot4
						slot1 = slot1.found
						slot2 = slot0

						slot1(slot2)

						return
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 72-74, warpins: 3 ---
				slot1 = slot3
				slot1 = slot1 - 1
				slot3 = slot1
				--- END OF BLOCK #3 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 75-75, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



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

		return
		--- END OF BLOCK #1 ---



	end

	slot1.Search = slot5

	function slot5(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot3 = slot0
		slot2 = slot0.Clear

		slot2(slot3)

		slot2 = slot0
		slot3 = slot1.path
		slot4 = slot1.pathIndex
		slot2 = slot2(slot3, slot4)

		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-13, warpins: 1 ---
			slot3 = slot1.found
			slot4 = slot2

			slot3(slot4)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-15, warpins: 1 ---
			slot3 = slot1.notFound

			slot3()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-16, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot1.SearchTimely = slot5

	function slot5(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot1 = slot0.findUITimer

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-9, warpins: 1 ---
			slot1 = slot0.findUITimer
			slot2 = slot1
			slot1 = slot1.Stop

			slot1(slot2)

			slot1 = nil
			slot0.findUITimer = slot1
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-10, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot1.Clear = slot5

	return slot1
	--- END OF BLOCK #0 ---



end

slot0.Finder = slot7

function slot7(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-22, warpins: 1 ---
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

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-26, warpins: 1 ---
		slot5 = eachChild
		slot6 = slot4

		function slot7(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			slot2 = slot0
			slot1 = slot0.GetComponent
			slot3 = typeof
			slot4 = Button
			slot1 = slot1(slot2, slot3(slot4))

			if slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-10, warpins: 1 ---
				slot2 = false
				slot1.enabled = slot2
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 11-11, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end

		slot5(slot6, slot7)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 27-29, warpins: 2 ---
	slot5 = slot3.hideAnimtor

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-37, warpins: 1 ---
		slot6 = slot4
		slot5 = slot4.GetComponent
		slot7 = typeof
		slot8 = Animator
		slot5 = slot5(slot6, slot7(slot8))

		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-39, warpins: 1 ---
			slot6 = false
			slot5.enabled = slot6
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 40-42, warpins: 3 ---
	slot5 = slot0.targetTimer

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 43-48, warpins: 1 ---
		slot5 = slot0.targetTimer
		slot6 = slot5
		slot5 = slot5.Stop

		slot5(slot6)

		slot5 = nil
		slot0.targetTimer = slot5
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 49-51, warpins: 2 ---
	slot5 = slot3.pos

	if not slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 52-54, warpins: 1 ---
		slot5 = slot3.scale

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 55-57, warpins: 1 ---
			slot5 = slot3.eulerAngles

			if not slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 58-72, warpins: 1 ---
				slot5 = Timer
				slot5 = slot5.New

				function slot6()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-5, warpins: 1 ---
					slot0 = IsNil
					slot1 = slot0
					slot0 = slot0(slot1)

					if not slot0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 6-10, warpins: 1 ---
						slot0 = IsNil
						slot1 = slot1
						slot0 = slot0(slot1)

						if not slot0 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 11-38, warpins: 1 ---
							slot0 = slot1
							slot1 = slot0
							slot1 = slot1.transform
							slot1 = slot1.position
							slot0.position = slot1
							slot0 = slot1
							slot0 = slot0.localPosition
							slot1 = slot1
							slot2 = Vector3
							slot3 = slot0.x
							slot4 = slot0.y
							slot5 = 0
							slot2 = slot2(slot3, slot4, slot5)
							slot1.localPosition = slot2
							slot1 = slot0
							slot1 = slot1.transform
							slot1 = slot1.localScale
							slot2 = slot1
							slot3 = Vector3
							slot4 = slot1.x
							slot5 = slot1.y
							slot6 = slot1.z
							slot3 = slot3(slot4, slot5, slot6)
							slot2.localScale = slot3
							slot2 = slot2
							slot2 = slot2.image

							if slot2 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 39-44, warpins: 1 ---
								slot2 = type
								slot3 = slot2
								slot3 = slot3.image
								slot2 = slot2(slot3)

								if slot2 == "table" then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 45-50, warpins: 1 ---
									slot2 = nil
									slot3 = slot2
									slot3 = slot3.image
									slot3 = slot3.isChild

									if slot3 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 51-61, warpins: 1 ---
										slot3 = tf
										slot4 = slot0
										slot3 = slot3(slot4)
										slot4 = slot3
										slot3 = slot3.Find
										slot5 = slot2
										slot5 = slot5.image
										slot5 = slot5.source
										slot3 = slot3(slot4, slot5)
										slot2 = slot3
										--- END OF BLOCK #0 ---



									else

										-- Decompilation error in this vicinity:
										--- BLOCK #0 62-68, warpins: 1 ---
										slot3 = GameObject
										slot3 = slot3.Find
										slot4 = slot2
										slot4 = slot4.image
										slot4 = slot4.source
										slot3 = slot3(slot4)
										slot2 = slot3
										--- END OF BLOCK #0 ---



									end

									--- END OF BLOCK #0 ---

									FLOW; TARGET BLOCK #1



									-- Decompilation error in this vicinity:
									--- BLOCK #1 69-74, warpins: 2 ---
									slot3 = slot2
									slot3 = slot3.image
									slot3 = slot3.isRelative
									slot4 = nil

									if slot3 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 75-79, warpins: 1 ---
										slot5 = slot2
										slot5 = slot5.image
										slot5 = slot5.target

										if slot5 == "" then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 80-81, warpins: 1 ---
											slot4 = slot1
											--- END OF BLOCK #0 ---



										else

											-- Decompilation error in this vicinity:
											--- BLOCK #0 82-92, warpins: 1 ---
											slot5 = tf
											slot6 = slot1
											slot5 = slot5(slot6)
											slot6 = slot5
											slot5 = slot5.Find
											slot7 = slot2
											slot7 = slot7.image
											slot7 = slot7.target
											slot5 = slot5(slot6, slot7)
											slot4 = slot5
											--- END OF BLOCK #0 ---



										end
										--- END OF BLOCK #0 ---



									else

										-- Decompilation error in this vicinity:
										--- BLOCK #0 93-99, warpins: 1 ---
										slot5 = GameObject
										slot5 = slot5.Find
										slot6 = slot2
										slot6 = slot6.image
										slot6 = slot6.target
										slot5 = slot5(slot6)
										slot4 = slot5
										--- END OF BLOCK #0 ---



									end

									--- END OF BLOCK #1 ---

									FLOW; TARGET BLOCK #2



									-- Decompilation error in this vicinity:
									--- BLOCK #2 100-104, warpins: 3 ---
									slot5 = IsNil
									slot6 = slot2
									slot5 = slot5(slot6)

									if not slot5 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 105-109, warpins: 1 ---
										slot5 = IsNil
										slot6 = slot4
										slot5 = slot5(slot6)

										if not slot5 then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 110-123, warpins: 1 ---
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

												-- Decompilation error in this vicinity:
												--- BLOCK #0 126-129, warpins: 1 ---
												slot7 = slot5.sprite
												slot8 = slot6.sprite

												if slot7 and slot8 and slot7 ~= slot8 then

													-- Decompilation error in this vicinity:
													--- BLOCK #0 134-139, warpins: 1 ---
													slot9 = slot5.enabled
													slot6.enabled = slot9
													slot9 = setImageSprite
													slot10 = slot4
													slot11 = slot7

													slot9(slot10, slot11)
													--- END OF BLOCK #0 ---



												end
												--- END OF BLOCK #0 ---



											end
											--- END OF BLOCK #0 ---



										end
										--- END OF BLOCK #0 ---



									end
									--- END OF BLOCK #2 ---



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
					--- BLOCK #1 140-140, warpins: 12 ---
					return
					--- END OF BLOCK #1 ---



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
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 73-75, warpins: 3 ---
		slot5 = slot3.pos

		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 76-84, warpins: 1 ---
			slot5 = Vector3
			slot6 = slot3.pos
			slot6 = slot6.x
			slot7 = slot3.pos
			slot7 = slot7.y
			slot8 = slot3.pos
			slot8 = slot8.z

			if not slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 85-85, warpins: 1 ---
				slot8 = 0
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 86-88, warpins: 2 ---
			slot5 = slot5(slot6, slot7, slot8)
			slot4.localPosition = slot5
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 89-98, warpins: 1 ---
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
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 99-101, warpins: 2 ---
		slot5 = slot3.scale

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 102-102, warpins: 1 ---
			slot5 = 1
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 103-111, warpins: 2 ---
		slot6 = Vector3
		slot7 = slot5
		slot8 = slot5
		slot9 = slot5
		slot6 = slot6(slot7, slot8, slot9)
		slot4.localScale = slot6
		slot6 = slot3.eulerAngles

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 112-121, warpins: 1 ---
			slot6 = Vector3
			slot7 = slot3.eulerAngles
			slot7 = slot7[1]
			slot8 = slot3.eulerAngles
			slot8 = slot8[2]
			slot9 = slot3.eulerAngles
			slot9 = slot9[3]
			slot6 = slot6(slot7, slot8, slot9)
			slot4.eulerAngles = slot6
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 122-127, warpins: 1 ---
			slot6 = Vector3
			slot7 = 0
			slot8 = 0
			slot9 = 0
			slot6 = slot6(slot7, slot8, slot9)
			slot4.eulerAngles = slot6
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 128-129, warpins: 3 ---
	return slot4
	--- END OF BLOCK #4 ---



end

slot0.cloneGO = slot7

function slot7(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
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

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-17, warpins: 1 ---
		slot5 = slot2.scale
		slot5 = 1 / slot5

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-18, warpins: 2 ---
			slot5 = 1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-28, warpins: 2 ---
	slot6 = slot0.fingerTF
	slot7 = Vector3
	slot8 = slot5
	slot9 = slot5
	slot10 = 1
	slot7 = slot7(slot8, slot9, slot10)
	slot6.localScale = slot7
	slot6 = slot2.fingerPos

	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-37, warpins: 1 ---
		slot6 = Vector3
		slot7 = slot2.fingerPos
		slot7 = slot7.posX
		slot8 = slot2.fingerPos
		slot8 = slot8.posY
		slot9 = 0
		slot6 = slot6(slot7, slot8, slot9)

		if not slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-42, warpins: 2 ---
			slot6 = Vector3
			slot7 = slot3
			slot8 = -slot4
			slot9 = 0
			slot6 = slot6(slot7, slot8, slot9)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 43-45, warpins: 2 ---
	slot7 = slot0.cloneTarget

	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-51, warpins: 1 ---
		slot7 = slot0.fingerTF
		slot8 = slot7
		slot7 = slot7.SetParent
		slot9 = slot0.cloneTarget
		slot10 = false

		slot7(slot8, slot9, slot10)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 52-56, warpins: 2 ---
	slot7 = setAnchoredPosition
	slot8 = slot0.fingerTF
	slot9 = slot6

	slot7(slot8, slot9)

	return
	--- END OF BLOCK #3 ---



end

slot0.setFinger = slot7

function slot7(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot4 = slot2.ui
	slot5 = slot1
	slot6 = slot0.cloneTarget
	slot8 = slot6
	slot7 = slot6.GetComponent
	slot9 = typeof
	slot10 = CanvasGroup
	slot7 = slot7(slot8, slot9(slot10))

	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-13, warpins: 1 ---
		slot8 = 1
		slot7.alpha = slot8
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-16, warpins: 2 ---
	slot8 = slot4.eventIndex

	if slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-28, warpins: 1 ---
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
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-31, warpins: 1 ---
		slot8 = slot4.eventPath

		if slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-41, warpins: 1 ---
			slot8 = GameObject
			slot8 = slot8.Find
			slot9 = slot4.eventPath
			slot8 = slot8(slot9)
			slot5 = slot8
			slot8 = IsNil
			slot9 = slot5
			slot8 = slot8(slot9)

			if slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 42-42, warpins: 1 ---
				slot5 = slot1
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 43-51, warpins: 2 ---
			slot8 = slot0.cloneTarget
			slot9 = slot8
			slot8 = slot8.GetComponent
			slot10 = typeof
			slot11 = Image
			slot8 = slot8(slot9, slot10(slot11))

			if slot8 == nil then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 52-64, warpins: 1 ---
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
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 65-67, warpins: 4 ---
	slot8 = slot4.triggerType

	if slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 68-71, warpins: 1 ---
		slot8 = slot4.triggerType
		slot8 = slot8[1]

		if not slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 72-72, warpins: 2 ---
			slot8 = slot0
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 73-75, warpins: 2 ---
	slot9 = slot0

	if slot8 == slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 76-86, warpins: 1 ---
		slot9 = onButton
		slot10 = slot0
		slot11 = slot6

		function slot12()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			slot0 = IsNil
			slot1 = slot0
			slot0 = slot0(slot1)

			if not slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 6-14, warpins: 1 ---
				slot0 = slot1
				slot1 = slot0
				slot0 = slot0.finishCurrEvent
				slot2 = slot2
				slot3 = slot3

				slot0(slot1, slot2, slot3)

				slot0 = triggerButton
				slot1 = slot0

				slot0(slot1)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-15, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end

		slot13 = SFX_PANEL

		slot9(slot10, slot11, slot12, slot13)

		slot9 = setButtonEnabled
		slot10 = slot6
		slot11 = true

		slot9(slot10, slot11)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 87-89, warpins: 1 ---
		slot9 = slot1

		if slot8 == slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 90-100, warpins: 1 ---
			slot9 = onToggle
			slot10 = slot0
			slot11 = slot6

			function slot12(slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-2, warpins: 1 ---
				if slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 3-7, warpins: 1 ---
					slot1 = IsNil
					slot2 = slot0
					slot1 = slot1(slot2)

					if not slot1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 8-20, warpins: 1 ---
						slot1 = slot1
						slot2 = slot1
						slot1 = slot1.finishCurrEvent
						slot3 = slot2
						slot4 = slot3

						slot1(slot2, slot3, slot4)

						slot1 = triggerToggle
						slot2 = slot0
						slot3 = slot4
						slot3 = slot3.triggerType
						slot3 = slot3[2]

						if not slot3 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 21-21, warpins: 1 ---
							slot3 = true
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 22-22, warpins: 2 ---
						slot1(slot2, slot3)
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 23-23, warpins: 3 ---
				return
				--- END OF BLOCK #1 ---



			end

			slot13 = SFX_PANEL

			slot9(slot10, slot11, slot12, slot13)

			slot9 = setToggleEnabled
			slot10 = slot6
			slot11 = true

			slot9(slot10, slot11)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 101-103, warpins: 1 ---
			slot9 = slot2

			if slot8 == slot9 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 104-124, warpins: 1 ---
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

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-5, warpins: 1 ---
					slot2 = IsNil
					slot3 = slot0
					slot2 = slot2(slot3)

					if not slot2 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 6-10, warpins: 1 ---
						slot2 = slot1
						slot3 = slot2
						slot2 = slot2.OnPointerDown
						slot4 = slot1

						slot2(slot3, slot4)
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 11-11, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end

				slot11(slot12, slot13)

				slot12 = slot10
				slot11 = slot10.AddPointUpFunc

				function slot13(slot0, slot1)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-11, warpins: 1 ---
					slot2 = slot0
					slot3 = slot2
					slot2 = slot2.finishCurrEvent
					slot4 = slot1
					slot5 = slot2

					slot2(slot3, slot4, slot5)

					slot2 = IsNil
					slot3 = slot3
					slot2 = slot2(slot3)

					if not slot2 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 12-16, warpins: 1 ---
						slot2 = slot4
						slot3 = slot2
						slot2 = slot2.OnPointerUp
						slot4 = slot1

						slot2(slot3, slot4)
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 17-17, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end

				slot11(slot12, slot13)

				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 125-127, warpins: 1 ---
			slot9 = slot3

			if slot8 == slot9 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 128-135, warpins: 1 ---
				slot10 = slot6
				slot9 = slot6.GetComponent
				slot11 = typeof
				slot12 = EventTriggerListener
				slot9 = slot9(slot10, slot11(slot12))

				if slot9 == nil then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 136-145, warpins: 1 ---
					slot10 = go
					slot11 = slot6
					slot10 = slot10(slot11)
					slot11 = slot10
					slot10 = slot10.AddComponent
					slot12 = typeof
					slot13 = EventTriggerListener
					slot10 = slot10(slot11, slot12(slot13))
					slot9 = slot10
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 146-150, warpins: 2 ---
				slot11 = slot9
				slot10 = slot9.AddPointDownFunc

				function slot12(slot0, slot1)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-5, warpins: 1 ---
					slot2 = IsNil
					slot3 = slot0
					slot2 = slot2(slot3)

					if not slot2 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 6-11, warpins: 1 ---
						slot2 = slot1
						slot3 = slot2
						slot2 = slot2.finishCurrEvent
						slot4 = slot2
						slot5 = slot3

						slot2(slot3, slot4, slot5)
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 12-12, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end

				slot10(slot11, slot12)
				--- END OF BLOCK #1 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 151-153, warpins: 1 ---
				slot9 = slot4

				if slot8 == slot9 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 154-161, warpins: 1 ---
					slot10 = slot6
					slot9 = slot6.GetComponent
					slot11 = typeof
					slot12 = EventTriggerListener
					slot9 = slot9(slot10, slot11(slot12))

					if slot9 == nil then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 162-171, warpins: 1 ---
						slot10 = go
						slot11 = slot6
						slot10 = slot10(slot11)
						slot11 = slot10
						slot10 = slot10.AddComponent
						slot12 = typeof
						slot13 = EventTriggerListener
						slot10 = slot10(slot11, slot12(slot13))
						slot9 = slot10
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 172-175, warpins: 2 ---
					slot11 = slot9
					slot10 = slot9.AddPointUpFunc

					function slot12(slot0, slot1)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-7, warpins: 1 ---
						slot2 = slot0
						slot3 = slot2
						slot2 = slot2.finishCurrEvent
						slot4 = slot1
						slot5 = slot2

						slot2(slot3, slot4, slot5)

						return
						--- END OF BLOCK #0 ---



					end

					slot10(slot11, slot12)
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 176-177, warpins: 6 ---
	--- END OF BLOCK #4 ---



end

slot0.addUIEventTrigger = slot7

function slot7(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-31, warpins: 1 ---
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

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-40, warpins: 1 ---
		slot3 = SetActive
		slot4 = slot0.cloneTarget
		slot5 = false

		slot3(slot4, slot5)

		slot3 = Destroy
		slot4 = slot0.cloneTarget

		slot3(slot4)

		slot3 = nil
		slot0.cloneTarget = slot3
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 41-43, warpins: 2 ---
	slot3 = slot0.targetTimer

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-49, warpins: 1 ---
		slot3 = slot0.targetTimer
		slot4 = slot3
		slot3 = slot3.Stop

		slot3(slot4)

		slot3 = nil
		slot0.targetTimer = slot3
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 50-52, warpins: 2 ---
	slot3 = slot0.findUITimer

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 53-58, warpins: 1 ---
		slot3 = slot0.findUITimer
		slot4 = slot3
		slot3 = slot3.Stop

		slot3(slot4)

		slot3 = nil
		slot0.findUITimer = slot3
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 59-60, warpins: 2 ---
	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 61-62, warpins: 1 ---
		slot3 = slot2

		slot3()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 63-63, warpins: 2 ---
	return
	--- END OF BLOCK #4 ---



end

slot0.finishCurrEvent = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = slot0
	slot1 = slot0.clearDelegateInfo

	slot1(slot2)

	slot1 = slot0.delayTimer

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-12, warpins: 1 ---
		slot1 = slot0.delayTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.delayTimer = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-15, warpins: 2 ---
	slot1 = slot0.targetTimer

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-21, warpins: 1 ---
		slot1 = slot0.targetTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.targetTimer = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 22-24, warpins: 2 ---
	slot1 = slot0.signTimer

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-30, warpins: 1 ---
		slot1 = slot0.signTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.signTimer = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 31-37, warpins: 2 ---
	slot1 = slot0.finder
	slot2 = slot1
	slot1 = slot1.Clear

	slot1(slot2)

	slot1 = slot0.cloneTarget

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-46, warpins: 1 ---
		slot1 = SetParent
		slot2 = slot0.fingerTF
		slot3 = slot0._go

		slot1(slot2, slot3)

		slot1 = Destroy
		slot2 = slot0.cloneTarget

		slot1(slot2)

		slot1 = nil
		slot0.cloneTarget = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 47-57, warpins: 2 ---
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

		-- Decompilation error in this vicinity:
		--- BLOCK #0 58-59, warpins: 1 ---
		slot1 = nil
		slot0.curEvents = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 60-62, warpins: 2 ---
	slot1 = slot0.currentGuide

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 63-64, warpins: 1 ---
		slot1 = nil
		slot0.currentGuide = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 65-70, warpins: 2 ---
	slot1 = slot0.uiLongPress
	slot1 = slot1.onLongPressed
	slot2 = slot1
	slot1 = slot1.RemoveAllListeners

	slot1(slot2)

	return
	--- END OF BLOCK #6 ---



end

function slot8(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot1 = pg
	slot1 = slot1.DelegateInfo
	slot1 = slot1.New
	slot2 = slot0

	slot1(slot2)

	slot1 = true
	slot0.isAddDelegateInfo = slot1

	return
	--- END OF BLOCK #0 ---



end

slot0.addDelegateInfo = slot8

function slot8(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0.isAddDelegateInfo

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-10, warpins: 1 ---
		slot1 = pg
		slot1 = slot1.DelegateInfo
		slot1 = slot1.Dispose
		slot2 = slot0

		slot1(slot2)

		slot1 = nil
		slot0.isAddDelegateInfo = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-11, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.clearDelegateInfo = slot8

function slot8(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = SetActive
	slot2 = slot0._go
	slot3 = true

	slot1(slot2, slot3)

	return
	--- END OF BLOCK #0 ---



end

slot0.mask = slot8

function slot8(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = SetActive
	slot2 = slot0._go
	slot3 = false

	slot1(slot2, slot3)

	return
	--- END OF BLOCK #0 ---



end

slot0.unMask = slot8

function slot8(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot2 = slot0
	slot3 = slot0

	slot2(slot3)

	slot2 = slot1
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

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-18, warpins: 1 ---
		slot2 = slot1

		slot2()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.endGuider = slot8

function slot8(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot1 = slot0._go
	slot1 = slot1.activeSelf

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-17, warpins: 1 ---
		slot1 = slot0.managerState
		slot0.prevState = slot1
		slot1 = slot0
		slot1 = slot1.MANAGER_STATE
		slot1 = slot1.BREAK
		slot0.managerState = slot1
		slot1 = SetActive
		slot2 = slot0._go
		slot3 = false

		slot1(slot2, slot3)

		slot1 = slot0.cloneTarget

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-21, warpins: 1 ---
			slot1 = SetActive
			slot2 = slot0.cloneTarget
			slot3 = false

			slot1(slot2, slot3)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-22, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.onDisconnected = slot8

function slot8(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0.prevState

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-14, warpins: 1 ---
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

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-18, warpins: 1 ---
			slot1 = SetActive
			slot2 = slot0.cloneTarget
			slot3 = true

			slot1(slot2, slot3)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.onReconneceted = slot8

return
