pg = pg or {}
pg.GuideMgr2 = singletonClass("GuideMgr2")
slot1 = createLog("GuideMgr2", LOG_GUIDE2)
pg.GuideMgr2.ENABLE_GUIDE = true
pg.GuideMgr2.MANAGER_STATE = {
	LOADING = 0,
	STOP = 3,
	IDLE = 1,
	BUSY = 2
}
slot2 = 0.1
slot3 = 0.5
slot4 = 1
slot5 = 2
slot6 = 3
slot7 = 4
slot8 = 5
slot9 = 1
slot10 = 2
slot11 = 3
slot12 = 6
slot13 = {
	MODE2 = 2,
	MODE1 = 1
}
slot14 = 3
slot15 = 0.5
slot16 = require("GameCfg.guide.style")
slot17 = require("GameCfg.guide.commonEvent")

pg.GuideMgr2.Init = function (slot0, slot1)
	print("initializing guide2 manager...")
	PoolMgr.GetInstance():GetUI("GuideUI", true, function (slot0)
		slot0._go = slot0

		slot0._go:SetActive(false)

		slot0.UIOverlay = tf(GameObject.Find("Overlay/UIOverlay"))

		slot0._go.transform:SetParent(slot0.UIOverlay, false)

		slot0.guiderTF = findTF(slot0._go, "Guider")
		slot0.styleTF1 = findTF(slot0.guiderTF, "mode1")
		slot0.styleTF2 = findTF(slot0.guiderTF, "mode2")

		SetActive(slot0.guiderTF, false)

		slot0._bg = findTF(slot0._go, "BG")
		slot0.bgAlpha = slot0._bg:GetComponent(typeof(CanvasGroup))
		slot0.fingerTF = findTF(slot0._go, "finger")

		SetActive(slot0.fingerTF, false)

		slot0.fingerSprites = {}

		eachChild(findTF(slot0._go, "resources"), function (slot0)
			table.insert(slot0.fingerSprites, slot0:GetComponent(typeof(Image)).sprite)
		end)

		slot0.horizontalSlip = slot0._go:GetComponent(typeof(HorizontalSlip))
		slot0.managerState = slot1.MANAGER_STATE.IDLE

		pg.GuideMgr.GetInstance():Init(pg.GuideMgr.GetInstance())
	end)

	slot0.managerState = slot0.MANAGER_STATE.LOADING
end

pg.GuideMgr2.updateCurrentGuideStep = function (slot0, slot1)
	slot0("current guide index--->" .. slot1)

	if not slot1.ENABLE_GUIDE or GUIDE_FINALE <= slot1 then
		slot0:AbortGuide("disable guide")

		return
	end

	slot2 = nil

	slot0("load Guider id =======" .. ((slot1 == 0 and 1) or require("GameCfg.guide.G" .. slot1).nextId))

	if GUIDE_FINALE <= ((slot1 == 0 and 1) or require("GameCfg.guide.G" .. slot1).nextId) then
		slot0:AbortGuide("nextId greater than final", true)

		return
	end

	if require("GameCfg.guide.G" .. slot2).condition then
		slot4 = slot0:passGuider(slot3.condition)
		slot5 = true

		if slot3.condition_1 then
			slot5 = slot0:passGuider(slot3.condition_1)
		end

		if not slot4 or not slot5 then
			slot0("<color=red>条件不符合。。。。load next id>></color>" .. slot3.nextId)
			slot0:updateCurrentGuideStep(slot3.id)

			return
		end
	end

	slot0.currentGuide = slot3
	slot0.curEvents = Clone(slot0.currentGuide.events)
end

pg.GuideMgr2.passGuider = function (slot0, slot1)
	if getProxy(slot1[1]) and not slot0:Match(slot1[3], slot2[slot1[2]](slot2, slot1[5]), slot1[4]) then
		return false
	end

	return true
end

slot18 = 807

pg.GuideMgr2.updateSystemGuideStep = function (slot0, slot1)
	slot0("load System Guider id =======" .. slot1)

	slot0.currentGuide = require("GameCfg.guide.G" .. slot1)

	if slot0.currentGuide.condition and not slot0:passGuider(slot0.currentGuide.condition) then
		if slot1 < slot0.currentGuide.nextId then
			slot0:AbortGuide("system guide finished", true, slot0.currentGuide.id)
		else
			slot0:updateSystemGuideStep(slot0.currentGuide.nextId)
		end

		return
	end

	slot0.curEvents = Clone(slot0.currentGuide.events)
end

pg.GuideMgr2.dispatch = function (slot0, slot1)
	slot2 = slot1.func

	if not slot0.curEvents then
		slot0("disable guider")

		if slot2 then
			slot2()
		end

		return
	end

	if not slot0.currentGuide.permit and (not slot1.ENABLE_GUIDE or GUIDE_FINALE <= slot0.currentGuide.id) then
		slot0("disable guider...")
		slot0(slot0.curEvents)
		slot0(slot0.currentGuide)

		if slot2 then
			slot2()
		end

		return
	end

	slot0("Event name ===" .. slot1.event)

	if not slot0.curEvents[slot1.event] then
		slot0("should exist event...." .. slot1.event)

		if slot2 then
			slot2()
		end

		return
	end

	if slot3.commonEvent then
		slot3.action = slot2[slot3.commonEvent].action
		slot3.viewComponent = slot2[slot3.commonEvent].viewComponent
	end

	if slot0.managerState ~= slot1.MANAGER_STATE.IDLE then
		slot0("manager busy...")

		if slot2 then
			slot2()
		end

		return
	end

	slot5 = slot3.viewComponent

	if defaultValue(slot1.checkView, true) and slot1.viewComponent ~= slot5 then
		slot0("not in the current scene...")
		slot0("data view == " .. slot1.viewComponent)
		slot0("event view == " .. slot5)

		if slot2 then
			slot2()
		end

		return
	end

	if slot3.condition and slot0:condition(slot1, slot3) == false then
		if slot3.branch and slot0:condition(slot1, slot3.branch) then
			if slot3.branch.rockBack then
				pg.m02:sendNotification(GAME.UPDATE_GUIDE_INDEX, {
					index = slot3.branch.rockBack
				})
			end

			if slot3.branch.newEvent then
				slot0:dispatch({
					viewComponent = slot3.branch.newEvent.viewComponent,
					event = slot3.branch.newEvent.name,
					data = slot3.branch.newEvent.data
				})
			end
		end

		if slot3.failEvent then
			slot0:dispatchNewEvent(slot3.failEvent)
		end

		if slot2 then
			slot2()
		end

		return
	end

	if slot3.verify and not slot0:verify(slot3.verify) then
		if slot2 then
			slot2()
		end

		return
	end

	slot0:startGuide(slot3, slot1, slot2)
end

pg.GuideMgr2.startGuide = function (slot0, slot1, slot2, slot3)
	pg.DelegateInfo.New(slot0)

	slot0.waitProcess = coroutine.wrap(function ()
		slot0("start guider .......")

		"start guider .......".managerState = slot2.MANAGER_STATE.BUSY

		pg.m02:sendNotification(GAME.START_GUIDE)
		slot1._go.transform:SetAsLastSibling()
		slot1._go:SetActive(true)
		SetActive(slot1._go.fingerTF, false)

		slot1.bgAlpha.alpha = 0.2

		if slot3.isView then
			slot1.checkViewHandle = slot3.viewComponent

			coroutine.yield()
		end

		slot1.waitProcess = nil

		nil:doCurrEvent(slot4, slot5)

		nil.PreEvent = slot3.event
	end)

	slot0.waitProcess()
end

pg.GuideMgr2.dispatchLoaded = function (slot0, slot1)
	if slot0.checkViewHandle and slot1.viewComponent == slot0.checkViewHandle and slot0.waitProcess then
		Canvas.ForceUpdateCanvases()
		slot0.waitProcess()

		slot0.checkViewHandle = nil
	end
end

pg.GuideMgr2.condition = function (slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot2.condition) do
		slot8 = nil

		if slot7[4] == slot0 then
			slot8 = slot1.arg
		elseif slot7[4] == slot1 then
			slot8 = slot1.data
		elseif slot7[4] == slot2 then
			slot8 = slot0
		elseif slot7[4] == slot3 then
			slot8 = ys.Battle.BattleDataProxy.GetInstance():GetStatistics()
		end

		if slot0:Match(slot7[2], slot8[slot7[1]], slot7[3]) == false then
			slot4("condition mismatch.......")
			slot4(slot8[slot7[1]])
			slot4(slot7[3])

			return false
		end
	end

	return true
end

pg.GuideMgr2.verify = function (slot0, slot1)
	if not slot0:Match(slot0.currentGuide.verify.condition[3], getProxy(slot0.currentGuide.verify.condition[1])[slot0.currentGuide.verify.condition[2]](slot3), slot0.currentGuide.verify.condition[4]) then
		slot0("verify failed.......")

		if slot1.action then
			slot0:dispatchNewEvent(slot1)
		else
			slot0:dispatchNewEvent(slot0.currentGuide.verify)
		end

		if slot1.closePath and not IsNil(GameObject.Find(slot1.closePath)) then
			triggerButton(slot5)
		end

		return false
	end

	if slot1.continue and not slot0:Match(slot1.continue.condition[3], getProxy(slot1.continue.condition[1])[slot1.continue.condition[2]](slot6), slot1.continue.condition[4]) then
		slot0:dispatchNewEvent(slot1.continue)

		return false
	end

	slot0("verify successed.......")

	return true
end

pg.GuideMgr2.doCurrEvent = function (slot0, slot1, slot2)
	if table.getCount(slot1.action or {}) == 0 or (slot3 == 1 and slot1.action.newEvent) then
		slot0:finishCurrEvent(slot1, slot2)
		slot0:dispatchNewEvent(slot1)

		return
	end

	if slot1.uiWait then
		slot0.interactive = false
		slot0.waitTimer = Timer.New(function ()
			slot0.interactive = true

			slot0.waitTimer:Stop()

			slot0.waitTimer.Stop.waitTimer = nil
		end, slot1.uiWait, 1)

		slot0.waitTimer:Start()
	else
		slot0.interactive = true
	end

	onButton(slot0, slot0._go, function ()
		if not slot0.interactive then
			slot1("ui mask............")

			return
		end

		slot0:finishCurrEvent(slot2, slot3)
		slot0.finishCurrEvent:dispatchNewEvent(slot2)

		if slot2.action.say and slot2.action.say.goScene then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE[slot2.action.say.goScene])
		end
	end, SFX_PANEL)
	setButtonEnabled(slot0._go, not slot1.action.ui)

	if slot1.action.say then
		slot0:updateContent(slot1.action.say, slot1.text)
	end

	SetActive(slot0.guiderTF, slot1.action.say and slot1.action.say.text)

	if slot1.action.ui then
		slot0:updateUI(slot1, slot2)
	end
end

pg.GuideMgr2.finishCurrEvent = function (slot0, slot1, slot2)
	if not slot1.openUI then
		slot0._go:SetActive(false)
	end

	if slot1.updateIndex then
		pg.m02:sendNotification(GAME.UPDATE_GUIDE_INDEX, {
			cmd = true,
			index = slot0.currentGuide.id
		})
	end

	pg.DelegateInfo.Dispose(slot0)

	slot0.bgAlpha.alpha = 0.2

	removeOnButton(slot0._go)
	SetParent(slot0.fingerTF, tf(slot0._go), false)
	SetActive(slot0.fingerTF, false)
	SetActive(slot0.guiderTF, false)

	if slot0.cloneTarget then
		SetActive(slot0.cloneTarget, false)
		Destroy(slot0.cloneTarget)

		slot0.cloneTarget = nil
	end

	if slot0.targetTimer then
		slot0.targetTimer:Stop()

		slot0.targetTimer = nil
	end

	if slot0.contentTarget then
		SetActive(slot0.contentTarget, false)
		Destroy(slot0.contentTarget)

		slot0.contentTarget = nil
	end

	if slot1.redundancys then
		for slot6, slot7 in pairs(slot1.redundancys) do
			if slot0.curEvents[slot7] and not slot8.retain then
				slot0("redundancy event remove......" .. slot7)

				slot0.curEvents[slot7] = nil
			end
		end
	end

	if slot1.finish then
		slot0("finish guider id == " .. slot0.currentGuide.id)
		pg.m02:sendNotification(GAME.UPDATE_GUIDE_INDEX, {
			index = slot0.currentGuide.id
		})

		if slot1.finishEvent then
			pg.m02:sendNotification(GAME.GUIDE_FINISH)
		end
	end

	slot0("finish guider event")

	slot0.managerState = slot1.MANAGER_STATE.IDLE

	if not slot0.isWake then
		pg.m02:sendNotification(GAME.END_GUIDE)
	end

	if slot1.enabelGuild then
		slot0:AbortGuide("solt guild end ")
	end

	slot0.isWake = nil

	if slot2 then
		slot2()
	end

	if slot1.endEvent then
		slot0("new endEvent......")
		slot0:startGuide(slot1.endEvent[1], {})
	end

	if not slot1.retain then
		slot3 = pairs
		slot4 = slot0.curEvents or {}

		for slot6, slot7 in slot3(slot4) do
			if slot7 == slot1 then
				slot0("event remove......" .. slot6)

				slot0.curEvents[slot6] = nil

				break
			end
		end
	end
end

pg.GuideMgr2.updateContent = function (slot0, slot1, slot2)
	slot3 = {}

	if slot1.style then
		slot3 = slot1.style
	elseif slot1.commonStyle then
		slot3 = slot0[slot1.commonStyle]
	end

	slot4 = slot3.dir or 1
	slot5 = slot3.mode or 1
	slot6 = slot3.posX or 0
	slot7 = slot3.posY or 0
	slot8 = slot3.alpha or 0.8

	if slot3.ui then
		slot0.contentTarget = slot0:cloneGO(GameObject.Find(slot3.ui.path).gameObject, slot0.UIOverlay, slot3.ui)

		onButton(slot0, slot0.contentTarget, function ()
			triggerButton(slot0._go)
		end)
	end

	SetActive(slot0.styleTF1, slot5 == slot1.MODE1)
	SetActive(slot0.styleTF2, slot5 == slot1.MODE2)

	slot9 = nil

	if slot5 == slot1.MODE1 then
		slot9 = slot0.styleTF1
	elseif slot5 == slot1.MODE2 then
		slot9 = slot0.styleTF2
	end

	slot0.bgAlpha.alpha = slot8
	slot9.localScale = (slot4 == 1 and Vector3(1, 1, 1)) or Vector3(-1, 1, 1)
	slot9:Find("content").localScale = (slot4 == 1 and Vector3(1, 1, 1)) or Vector3(-1, 1, 1)

	setText(slot11, (slot2 and slot2) or slot1.text or "")
	slot0:checkTextAlign(slot11)
	setAnchoredPosition(slot0.guiderTF, Vector3(slot6, slot7, 0))
end

pg.GuideMgr2.checkTextAlign = function (slot0, slot1)
	slot3 = slot1:GetComponent(typeof(Text))

	if slot0:getTextRowNum(slot1) > 1 then
		slot3.alignment = TextAnchor.MiddleLeft
	else
		slot3.alignment = TextAnchor.MiddleCenter
	end
end

pg.GuideMgr2.getTextRowNum = function (slot0, slot1)
	slot2 = slot1:GetComponent(typeof(Text))
	slot2.text = ""
	slot2.text = slot2.text

	return math.floor(slot2.preferredHeight / slot2.preferredHeight)
end

pg.GuideMgr2.updateUI = function (slot0, slot1, slot2)
	slot3 = slot1.action.ui
	slot4 = slot1.action.ui.triggerType

	if slot0.cloneTimer then
		slot0.cloneTimer:Stop()

		slot0.cloneTimer = nil
	end

	if slot3.delay then
		slot0:addTimer(slot3.delay, function ()
			slot0:StartSearch(slot0, )
		end)
	else
		slot0:StartSearch(slot1, slot2)
	end
end

pg.GuideMgr2.cloneGO = function (slot0, slot1, slot2, slot3)
	slot4 = tf(Instantiate(slot1))
	slot4.sizeDelta = tf(slot1).sizeDelta

	SetActive(slot4, true)
	slot4:SetParent(slot2, false)

	if slot3.pos then
		slot4.localPosition = Vector3(slot3.pos.x or tf(slot1).localPosition.x, slot3.pos.y, 0)
	else
		if slot0.targetTimer then
			slot0.targetTimer:Stop()

			slot0.targetTimer = nil
		end

		slot0.targetTimer = Timer.New(function ()
			if not IsNil(IsNil) and not IsNil(slot1) then
				slot1.position = slot0.transform.position
				slot0.transform.position.localPosition = Vector3(slot1.localPosition.x, slot1.localPosition.y, 0)
			end
		end, 0.5, -1)

		slot0.targetTimer:Start()
		slot0.targetTimer.func()
	end

	slot4.localScale = Vector3(slot3.scale or 1, , )

	if slot3.eulerAngles then
		slot4.eulerAngles = Vector3(slot3.eulerAngles[1], slot3.eulerAngles[2], slot3.eulerAngles[3])
	else
		slot4.eulerAngles = Vector3(0, 0, 0)
	end

	if slot3.clearColor then
		slot4:GetComponent(typeof(Image)).color = Color.New(0, 0, 0, 0)
	end

	return slot4
end

pg.GuideMgr2.StartSearch = function (slot0, slot1, slot2)
	slot4 = slot1.action.ui.path

	if slot1.action.ui.condition and slot0:Match(slot3.condition[3], getProxy(slot3.condition[1])[slot3.condition[2]](slot5), slot3.condition[4]) then
		slot4 = slot3.path_1
	end

	if IsNil(GameObject.Find(slot4)) then
		slot0:ReSearchTarget(slot4, function ()
			slot0:StartSearch(slot0, )
		end, function ()
			slot0:AbortGuide("target is nil>>1" .. slot1, true)
		end, slot0, slot1)

		return
	end

	if slot3.tweenPath then
		slot2("tweenPath>>>>" .. slot3.tweenPath)

		slot6 = slot3

		if LeanTween.isTweening(GameObject.Find(slot3.tweenPath)) then
			slot2("tweenPath time : " .. LeanTween.getTakeTime(slot7))
		else
			slot2("<color=red> no animating >>> </color>" .. slot7.name)
		end

		slot0:addTimer(slot6, function ()
			slot0:SearchTarget(slot0, , )
		end)
	else
		slot0:SearchTarget(slot5, slot1, slot2)
	end
end

pg.GuideMgr2.SearchTarget = function (slot0, slot1, slot2, slot3)
	slot1 = tf(slot1)

	if slot2.action.ui.childIndex then
		if slot4.childIndex == "#" then
			if slot1.childCount == 0 then
				slot0:AbortGuide("childCount is zero", true)

				return
			end

			slot5 = nil

			for slot9 = 0, slot1.childCount - 1, 1 do
				if slot1:GetChild(slot9).gameObject.name ~= "-1" then
					slot5 = slot10
				end
			end

			slot1 = slot5
		elseif slot4.childIndex == "*" then
			slot1 = slot1:Find(slot0:GetFlagShipId())
		elseif slot4.childIndex == "%" then
			slot1 = slot1:Find(slot0:getDailyId())
		else
			slot5 = 0

			for slot9 = 0, slot1.childCount - 1, 1 do
				if slot1:GetChild(slot9).gameObject.activeSelf then
					if slot5 == slot4.childIndex then
						slot1 = slot10

						break
					end

					slot5 = slot5 + 1
				end
			end
		end

		if IsNil(slot1) then
			slot0:AbortGuide("target is nil>>2>>>childIndex>>>" .. slot4.childIndex, true)

			return
		end
	end

	if slot4.hide ~= nil then
		SetActive(slot1, not slot4.hide)

		if slot4.hidePaths then
			for slot8, slot9 in ipairs(slot4.hidePaths) do
				SetActive(GameObject.Find(slot9), not slot4.hide)
			end
		end

		slot0:finishCurrEvent(slot2, slot3)
		slot0:dispatchNewEvent(slot2)
	else
		slot0.cloneTarget = slot0:cloneGO(slot1.gameObject, slot0.UIOverlay, slot4)

		slot0:addTargetListener(slot1, slot2)
		slot0:setFinger(slot1, slot0.cloneTarget, slot4)
	end
end

pg.GuideMgr2.ReSearchTarget = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = 0
	slot7 = Time.realtimeSinceStartup

	function slot8()
		slot0.searchTimer:Stop()

		slot0.searchTimer.Stop.searchTimer = nil
	end

	slot0.searchTimer = Timer.New(function ()
		slot0("ReSearchTarget.....>>" .. )

		if not IsNil(GameObject.Find(slot2)) then
			if slot3 then
				slot3()
			end

			slot4()
		end

		if slot1 + 1 == slot5 and IsNil(slot0) then
			slot0("cost time>>>" .. Time.realtimeSinceStartup - slot6)

			if slot7 then
				slot7()
			end

			slot4()
		end
	end, slot4, slot5)

	slot0.searchTimer:Start()
end

pg.GuideMgr2.addTimer = function (slot0, slot1, slot2)
	if slot0.cloneTimer then
		slot0.cloneTimer:Stop()

		slot0.cloneTimer = nil
	end

	slot0.cloneTimer = Timer.New(function ()
		slot0.cloneTimer:Stop()

		slot0.cloneTimer.Stop.cloneTimer = nil

		if nil then
			slot1()
		end
	end, slot1 + slot0, 1)

	slot0.cloneTimer:Start()
end

pg.GuideMgr2.setFinger = function (slot0, slot1, slot2, slot3)
	SetActive(slot0.fingerTF, true)

	slot4 = slot1.sizeDelta.x / 2
	slot5 = slot1.sizeDelta.y / 2
	slot0.fingerTF.localScale = Vector3((slot3.scale and 1 / slot3.scale) or 1, , 1)

	if LeanTween.isTweening(go(slot0.fingerTF)) then
		LeanTween.cancel(go(slot0.fingerTF))
	end

	slot7 = (slot3.fingerPos and Vector3(slot3.fingerPos.posX, slot3.fingerPos.posY, 0)) or Vector3(slot4, -slot5, 0)

	if slot2 then
		slot0.fingerTF:SetParent(slot2, false)
	end

	setAnchoredPosition(slot0.fingerTF, slot7)
	LeanTween.play(slot0.fingerTF, slot0.fingerSprites):setLoopPingPong()
end

pg.GuideMgr2.addTargetListener = function (slot0, slot1, slot2)
	slot4 = nil
	slot4 = (not slot2.action.ui.childPath or findTF(slot1, slot3.childPath)) and (not slot3.eventPath or findTF(slot1, slot3.eventPath)) and slot1
	slot0.lastTriggleType = (slot3.triggerType and slot3.triggerType[1]) or slot0

	eachChild(slot0.cloneTarget, function (slot0)
		GetOrAddComponent(slot0, typeof(CanvasGroup)).blocksRaycasts = false
	end)

	if slot0.cloneTarget:GetComponent(typeof(Image)) == nil then
		go(slot0.cloneTarget):AddComponent(typeof(Image)).color = Color(0, 0, 0, 0)
	end

	if slot5 == slot0 then
		onButton(slot0, slot0.cloneTarget, function ()
			slot0:finishCurrEvent(slot0, callback)

			if not slot2.verify or not not slot0:verify(slot2.verify) then
				slot0 = slot1

				if slot2.clickCondition and not slot0:passGuider(slot2.clickCondition) then
					slot0 = slot2
				end

				if not IsNil(slot3) then
					triggerButton(slot3)
				end

				slot0:dispatchNewEvent(slot0)
			end
		end, SFX_PANEL)
	elseif slot5 == slot1 then
		onToggle(slot0, slot0.cloneTarget, function (slot0)
			if slot0 then
				slot0:finishCurrEvent(slot0.finishCurrEvent, callback)

				if not slot2.verify or not not slot0:verify(slot2.verify) then
					slot1 = slot1

					if slot2.clickCondition and not slot0:passGuider(slot2.clickCondition) then
						slot1 = slot2
					end

					if not IsNil(slot3) then
						slot2(slot3, slot2.triggerType[2] or true)
					end

					slot0:dispatchNewEvent(slot1)
				end
			end
		end, SFX_PANEL)
	else
		if slot5 == slot2 or slot5 == slot3 then
			slot6 = slot0.cloneTarget:GetComponent(typeof(EventTriggerListener))
			slot7 = slot1:GetComponent(typeof(EventTriggerListener))
			slot8 = true
			slot9 = 0
			slot10 = slot5 == slot3

			if slot10 then
				slot8 = false
			end

			slot6:AddPointUpFunc(function (slot0, slot1)
				if Time.time - slot0 > (slot1.triggerType[2] or 0.5) and slot2 then
					slot3 = true
				end

				slot4:OnPointerUp(slot1)

				if slot4 then
					slot5:finishCurrEvent(slot6, callback)
				else
					pg.m02:sendNotification(GAME.START_GUIDE)
				end
			end)
			slot6:AddPointDownFunc(function (slot0, slot1)
				slot0 = Time.time

				slot1:OnPointerDown(slot1)

				if slot1.OnPointerDown and slot3.wake then
					pg.m02:sendNotification(GAME.END_GUIDE)

					GAME.END_GUIDE.isWake = true
				end

				playSoundEffect(SFX_PANEL)
			end)

			return
		end

		if slot5 == slot4 then
			GetOrAddComponent(go(slot0.cloneTarget), typeof(EventTriggerListener)):AddPointDownFunc(function (slot0, slot1)
				slot0:finishCurrEvent(slot1, callback)
				playSoundEffect(SFX_PANEL)
			end)
		end
	end
end

pg.GuideMgr2.dispatchNewEvent = function (slot0, slot1)
	slot0("newEvent ready.....")

	if slot0.managerState == slot1.MANAGER_STATE.IDLE then
		slot0(slot1.action.newEvent)

		if slot1.action.newEvent then
			slot0("start dispatch new event.....")
			slot0:dispatch({
				viewComponent = slot2.viewComponent,
				event = slot2.name,
				data = slot2.data,
				isView = slot2.isView
			})
		else
			slot0("newEvent dispatch failed>>>no event.....")
		end
	else
		slot0("newEvent dispatch failed>> mgr busy.....")
	end

	if slot1.inject then
		slot1.action = slot0.curEvents[slot1.inject].action
		slot1.viewComponent = slot0.curEvents[slot1.inject].viewComponent
	end
end

pg.GuideMgr2.Match = function (slot0, slot1, slot2, slot3)
	if slot1 == "=" then
		return slot2 == slot3
	elseif slot1 == "<" then
		return slot2 < slot3
	elseif slot1 == ">" then
		return slot3 < slot2
	elseif slot1 == "<=" then
		return slot2 <= slot3
	elseif slot1 == ">=" then
		return slot3 <= slot2
	elseif slot1 == "~=" then
		return slot2 ~= slot3
	else
		return false
	end
end

pg.GuideMgr2.GetFlagShipId = function (slot0)
	if not slot0.shipId then
		slot0.shipId = getProxy(SettingsProxy):GetSelectedShipId()
	end

	return slot0.shipId
end

pg.GuideMgr2.getDailyId = function (slot0)
	slot1 = pg.TimeMgr.GetInstance():GetServerWeek()

	for slot6, slot7 in pairs(pg.expedition_daily_template.all) do
		if table.contains(slot2[slot7].weekday, tonumber(slot1)) then
			slot0("daily id >>>" .. slot7)

			return slot7
		end
	end
end

pg.GuideMgr2.onDisconnected = function (slot0)
	if slot0._go and slot0.MANAGER_STATE.BUSY == slot0.managerState then
		slot0.isBreak = true

		SetActive(slot0._go, false)

		if slot0.cloneTarget then
			SetActive(slot0.cloneTarget, false)
		end
	end
end

pg.GuideMgr2.onReconneceted = function (slot0)
	if slot0._go and slot0.isBreak then
		SetActive(slot0._go, true)

		slot0.isBreak = nil

		if slot0.cloneTarget then
			SetActive(slot0.cloneTarget, true)
		end
	end
end

pg.GuideMgr2.ClearGuide = function (slot0)
	if slot0.cloneTimer then
		slot0.cloneTimer:Stop()

		slot0.cloneTimer = nil
	end

	if slot0.targetTimer then
		slot0.targetTimer:Stop()

		slot0.targetTimer = nil
	end

	if slot0.cloneTarget then
		SetParent(slot0.fingerTF, slot0._go)
		Destroy(slot0.cloneTarget)

		slot0.cloneTarget = nil
	end

	slot0._go:SetActive(false)
	removeOnButton(slot0._go)

	if slot0.curEvents then
		slot0.curEvents = nil
	end

	if slot0.contentTarget then
		removeOnButton(slot0.contentTarget)
		Destroy(slot0.contentTarget)

		slot0.contentTarget = nil
	end

	if slot0.currentGuide then
		slot0.currentGuide = nil
	end
end

pg.GuideMgr2.Reset = function (slot0)
	slot0("RESET..................")

	if slot0.ENABLE_GUIDE == false then
		slot1.ENABLE_GUIDE = true
	end

	slot0.managerState = slot1.MANAGER_STATE.IDLE
end

pg.GuideMgr2.AbortGuide = function (slot0, slot1, slot2, slot3)
	slot0("Guide Abort............" .. slot1)
	slot0:ClearGuide()

	slot1.ENABLE_GUIDE = false
	slot0.managerState = slot1.MANAGER_STATE.STOP

	if slot2 then
		slot0("destroyGuide")
		pg.m02:sendNotification(GAME.UPDATE_GUIDE_INDEX, {
			index = slot3 or GUIDE_FINALE
		})
	end
end

pg.GuideMgr2.QuitGuide = function (slot0)
	slot0("Guide qiut............")
	slot0:ClearGuide()

	slot0.managerState = slot0.ClearGuide.MANAGER_STATE.IDLE
end

return
