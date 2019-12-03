pg = pg or {}
pg.GuideMgr = singletonClass("GuideMgr")
pg.GuideMgr.ENABLE_GUIDE = true
pg.GuideMgr.MANAGER_STATE = {
	LOADING = 0,
	BREAK = 4,
	IDLE = 1,
	BUSY = 2,
	STOP = 3
}
slot1 = 1
slot2 = 2
slot3 = 3
slot4 = 4
slot5 = 5
slot6 = {
	MODE2 = 2,
	MODE1 = 1
}

function pg.GuideMgr.Init(slot0, slot1)
	print("initializing guide manager...")

	slot0.managerState = slot0.MANAGER_STATE.LOADING
	slot0.sceneStore = {}

	PoolMgr.GetInstance():GetUI("GuideUI", true, function (slot0)
		slot0._go = slot0
		slot0._tf = slot0._go.transform

		slot0._go:SetActive(false)

		slot0.UIOverlay = tf(GameObject.Find("Overlay/UIOverlay"))

		slot0._go.transform:SetParent(slot0.UIOverlay, false)

		slot0.guiderTF = findTF(slot0._go, "Guider")
		slot0.styleTF1 = findTF(slot0.guiderTF, "mode1")
		slot0.styleTF2 = findTF(slot0.guiderTF, "mode2")
		slot0.initChatBgH = slot0.styleTF2.sizeDelta.y

		SetActive(slot0.guiderTF, false)

		slot0._bg = findTF(slot0._go, "BG")
		slot0.bgAlpha = slot0._bg:GetComponent(typeof(CanvasGroup))
		slot0.bgAlpha.alpha = 0.2
		slot0._closeBtn = slot0._bg:Find("close_btn")
		slot0.uiLongPress = GetOrAddComponent(slot0._closeBtn, typeof(UILongPressTrigger))
		slot0.uiLongPress.longPressThreshold = 10
		slot0.fingerTF = findTF(slot0._go, "finger")

		SetActive(slot0.fingerTF, false)

		slot0.wTask = findTF(slot0._go, "wTask")

		setActive(slot0.wTask, false)

		slot0.fingerSprites = {}

		eachChild(findTF(slot0._go, "resources"), function (slot0)
			table.insert(slot0.fingerSprites, slot0:GetComponent(typeof(Image)).sprite)
		end)

		slot0.sceneFunc = nil
		slot0.inited = true
		slot0.finder = slot0:Finder()
		slot0.managerState = slot1.MANAGER_STATE.IDLE

		slot1.MANAGER_STATE.IDLE()
	end)
end

function pg.GuideMgr.isRuning(slot0)
	return slot0.managerState == slot0.MANAGER_STATE.BUSY
end

function pg.GuideMgr.transformPos(slot0, slot1)
	return tf(slot0._go):InverseTransformPoint(slot1)
end

function pg.GuideMgr.canPlay(slot0)
	if pg.MsgboxMgr.GetInstance()._go.activeSelf then
		return false, 1
	end

	if pg.StoryMgr.GetInstance():isActive() then
		return false, 2
	end

	if slot0.managerState == slot0.MANAGER_STATE.BUSY then
		return false, 3
	end

	return true
end

function pg.GuideMgr.onSceneAnimDone(slot0, slot1)
	if not slot0.inited then
		return
	end

	if not table.contains(slot0.sceneStore, slot1.view) then
		table.insert(slot0.sceneStore, slot1.view)
	end

	if slot0.sceneFunc then
		slot0.sceneFunc(slot1.view)
	end
end

function pg.GuideMgr.onSceneExit(slot0, slot1)
	if not slot0.inited then
		return
	end

	if table.contains(slot0.sceneStore, slot1.view) then
		table.removebyvalue(slot0.sceneStore, slot1.view)
	end
end

function pg.GuideMgr.checkModuleOpen(slot0, slot1)
	return table.contains(slot0.sceneStore, slot1)
end

function pg.GuideMgr.isPlayed(slot0, slot1)
	if getProxy(PlayerProxy) then
		return slot2:getData():IsPlayed(slot1)
	end

	return false
end

function pg.GuideMgr.play(slot0, slot1, slot2, slot3, slot4)
	if not slot0.ENABLE_GUIDE then
		return
	end

	slot10, slot6 = slot0:canPlay()

	print("play guide >>", slot1, slot5)

	slot0.erroCallback = slot4

	if slot5 then
		slot0.currentGuide = require("GameCfg.guide.newguide.segments." .. slot1)

		slot0:addDelegateInfo()

		slot7 = Clone(slot0.currentGuide.events)

		if slot2 then
			slot0.curEvents = _.select(slot7, function (slot0)
				if not slot0.code then
					return true
				elseif type(slot0.code) == "table" then
					return _.any(slot0, function (slot0)
						return table.contains(slot0.code, slot0)
					end)
				else
					return table.contains(slot0, slot0.code)
				end
			end)
		else
			slot0.curEvents = slot7
		end

		slot0:prepareGuider(slot3)

		slot8 = {}
		slot9 = ipairs
		slot10 = slot0.curEvents or {}

		for slot12, slot13 in slot9(slot10) do
			table.insert(slot8, function (slot0)
				slot0:doCurrEvent(slot0.doCurrEvent, function ()
					if slot0.managerState ~= slot1.MANAGER_STATE.IDLE then
						slot0.scenes = {}

						slot2()
					else
						slot0.erroCallback()

						slot0.erroCallback.erroCallback = nil
					end
				end)
			end)
		end

		slot0.managerState = slot0.MANAGER_STATE.BUSY

		seriesAsync(slot8, function ()
			slot0:endGuider(slot0)
		end)
	elseif slot3 then
		slot3()
	end
end

function pg.GuideMgr.prepareGuider(slot0, slot1)
	pg.m02:sendNotification(GAME.START_GUIDE)
	slot0._go.transform:SetAsLastSibling()
	slot0._go:SetActive(true)
	SetActive(slot0.fingerTF, false)

	slot0.bgAlpha.alpha = 0.2

	slot0.uiLongPress.onLongPressed:AddListener(function ()
		slot0:endGuider(slot0)
	end)
end

function pg.GuideMgr.doCurrEvent(slot0, slot1, slot2)
	function slot3(slot0)
		if slot0.waitScene and slot0.waitScene ~= "" and not table.contains(slot1.scenes, slot0.waitScene) then
			function slot1.sceneFunc(slot0)
				if slot0.waitScene == slot0 or table.contains(slot1.sceneStore, slot0.waitScene) then
					slot1.sceneFunc = nil

					nil()
				end
			end

			slot1.sceneFunc()
		else
			slot0()
		end
	end

	function slot4()
		if slot0.hideui then
			slot1:hideUI(slot1.hideUI, )
		elseif slot0.stories then
			slot1:playStories(slot1.playStories, )
		elseif slot0.notifies then
			slot1:sendNotifies(slot1.sendNotifies, )
		elseif slot0.showSign then
			slot1:showSign(slot0.showSign, )
		elseif slot0.doNothing then
			slot2()
		else
			slot1:findUI(slot1.findUI, )
		end
	end

	if slot1.delay ~= nil then
		slot0.delayTimer = Timer.New(function ()
			slot0(slot1)
		end, slot1.delay, 1)

		slot0.delayTimer:Start()
	else
		slot3(slot4)
	end
end

function pg.GuideMgr.showSign(slot0, slot1, slot2)
	function ()
		slot1 = slot0.pos
		slot3 = nil

		if slot0.signType == 1 then
			slot3 = slot1.wTask
		end

		setActive(slot3, true)

		if type(slot1) == "string" then
			if slot1 == "compassPos" then
				slot1 = WorldGuider.GetInstance().tempGridPos
			end
		elseif type(slot1) == "table" then
			slot1 = Vector3.New(slot1[1], slot1[2], slot1[3])
		end

		setLocalPosition(slot3, slot1)

		slot1.signTimer = Timer.New(function ()
			setActive(setActive, false)
			setActive()
		end, slot0, slot0, 1)

		slot1.signTimer:Start()
	end()
end

function pg.GuideMgr.sendNotifies(slot0, slot1, slot2)
	slot3 = {}

	for slot7, slot8 in ipairs(slot1.notifies) do
		table.insert(slot3, function (slot0)
			pg.m02:sendNotification(slot0.notify, slot0.body)
			slot0()
		end)
	end

	seriesAsync(slot3, function ()
		slot0:finishCurrEvent(slot0, )
	end)
end

function pg.GuideMgr.playStories(slot0, slot1, slot2)
	slot3 = {}

	for slot7, slot8 in ipairs(slot1.stories) do
		table.insert(slot3, function (slot0)
			pg.StoryMgr.GetInstance():Play(slot0, slot0, true)
		end)
	end

	seriesAsync(slot3, function ()
		slot0:finishCurrEvent(slot0, )
	end)
end

function pg.GuideMgr.hideUI(slot0, slot1, slot2)
	slot3 = {}

	for slot7, slot8 in ipairs(slot1.hideui) do
		table.insert(slot3, function (slot0)
			slot0.finder:SearchTimely({
				path = slot1.path,
				delay = slot1.delay,
				pathIndex = slot1.pathIndex,
				found = function (slot0)
					SetActive(slot0, not slot0.ishide)
					SetActive()
				end,
				notFound = function ()
					slot0:endGuider(slot0)
				end
			})
		end)
	end

	parallelAsync(slot3, function ()
		slot0:finishCurrEvent(slot0, )
	end)
end

function pg.GuideMgr.findUI(slot0, slot1, slot2)
	slot3 = true

	seriesAsync({
		function (slot0)
			if not slot0.baseui then
				slot0()

				return
			end

			slot1.finder:Search({
				path = slot0.baseui.path,
				delay = slot0.baseui.delay,
				pathIndex = slot0.baseui.pathIndex,
				conditionData = slot0.baseui.conditionData,
				found = slot0,
				notFound = function ()
					slot0:endGuider(slot0)
				end
			})
		end,
		function (slot0)
			if not slot0.ui then
				slot0()

				return
			end

			slot1 = false

			slot2.finder:Search({
				path = slot0.ui.path,
				delay = slot0.ui.delay,
				pathIndex = slot0.ui.pathIndex,
				conditionData = slot0.ui.conditionData,
				found = function (slot0)
					Canvas.ForceUpdateCanvases()

					slot0.cloneTarget = slot0:cloneGO(slot0.gameObject, slot0._go.transform, slot1.ui)

					slot0:addUIEventTrigger(slot0, slot0.addUIEventTrigger, slot0)
					slot0:setFinger(slot0, slot1.ui)
					slot0()
				end,
				notFound = function ()
					if slot0.ui.notfoundSkip then
						slot1:finishCurrEvent(slot1.finishCurrEvent, )
					else
						slot1:endGuider(slot2)
					end
				end
			})
		end
	}, function ()
		slot0:updateUIStyle(slot0, , )
	end)
end

function pg.GuideMgr.updateUIStyle(slot0, slot1, slot2, slot3)
	slot0.bgAlpha.alpha = slot1.alpha or 0.2

	SetActive(slot0.guiderTF, slot1.style)

	if slot1.style then
		slot0:updateContent(slot1)

		if slot1.style.ui then
			slot0.finder:Search({
				path = slot1.style.ui.path,
				delay = slot1.style.ui.delay,
				pathIndex = slot1.style.ui.pathIndex,
				found = function (slot0)
					slot0.cloneTarget = slot0:cloneGO(go(slot0), slot0._tf, slot1.style.ui)
				end,
				notFound = function ()
					slot0:endGuider()
				end
			})
		end
	end

	onButton(slot0, slot0._go, function ()
		slot0:finishCurrEvent(slot0, )

		if slot1.style and slot1.style.scene then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE[slot1.style.scene])
		end
	end, SFX_PANEL)
	setButtonEnabled(slot0._go, slot2)
end

function pg.GuideMgr.updateContent(slot0, slot1)
	slot3 = slot1.style or {}.dir or 1
	slot5 = slot1.style or .posX or 0
	slot6 = slot1.style or .posY or 0

	SetActive(slot0.styleTF1, (slot1.style or .mode or 1) == slot0.MODE1)
	SetActive(slot0.styleTF2, (slot1.style or .mode or 1) == slot0.MODE2)

	slot7 = nil

	if slot4 == slot0.MODE1 then
		slot7 = slot0.styleTF1
	elseif slot4 == slot0.MODE2 then
		slot7 = slot0.styleTF2
	end

	slot7.localScale = (slot3 == 1 and Vector3(1, 1, 1)) or Vector3(-1, 1, 1)
	slot7:Find("content").localScale = (slot3 == 1 and Vector3(1, 1, 1)) or Vector3(-1, 1, 1)

	setText(slot9, HXSet.hxLan(slot2.text or ""))

	if CHAT_POP_STR_LEN_MIDDLE < #slot9:GetComponent(typeof(Text)).text then
		slot11.alignment = TextAnchor.MiddleLeft
	else
		slot11.alignment = TextAnchor.MiddleCenter
	end

	slot12 = slot11.preferredHeight + 120

	if slot4 == slot0.MODE2 and slot0.initChatBgH < slot12 then
		slot7.sizeDelta = Vector2.New(slot7.sizeDelta.x, slot12)
	else
		slot7.sizeDelta = Vector2.New(slot7.sizeDelta.x, slot0.initChatBgH)
	end

	setAnchoredPosition(slot0.guiderTF, Vector2(slot5, slot6))
end

function pg.GuideMgr.Finder(slot0)
	function slot2(slot0, slot1)
		slot2 = -1

		for slot6 = 1, slot0.childCount, 1 do
			if (not slot0:GetChild(slot6 - 1):GetComponent(typeof(LayoutElement)) or not slot8.ignoreLayout) and slot2 + 1 == slot1 then
				break
			end
		end

		return slot2
	end

	function slot3(slot0, slot1)
		if not IsNil(GameObject.Find(slot0)) then
			if slot1 and slot1 ~= -1 then
				if slot0(tf(slot2), slot1) >= 0 and slot3 < tf(slot2).childCount and not IsNil(tf(slot2):GetChild(slot3)) then
					return slot4
				end
			else
				return tf(slot2)
			end
		end
	end

	function slot4(slot0, slot1)
		if slot0(slot0, -1) ~= nil then
			for slot7 = 0, slot2.childCount - 1, 1 do
				if table.contains(slot1, slot2:GetChild(slot7).GetChild(slot8, 0).name) then
					return slot8
				end
			end
		end
	end

	return {
		Search = function (slot0, slot1)
			slot0:Clear()

			slot3 = 20
			slot4 = 0
			slot5 = slot1.delay or 0
			slot0.findUITimer = Timer.New(function ()
				slot0 = slot0 + slot1

				if pg.UIMgr.GetInstance():OnLoading() then
					return
				end

				if slot2 < slot0 then
					if slot3 == 0 then
						print("not found ui >>", slot4.path)
						slot5:Clear()
						slot4.notFound()

						return
					end

					slot0 = nil

					if (slot4.conditionData == nil or slot6(slot4.path, slot4.conditionData)) and slot7(slot4.path, slot4.pathIndex) and go(slot0).activeInHierarchy then
						slot5:Clear()
						slot4.found(slot0)

						return
					end

					slot3 = slot3 - 1
				end
			end, 0.5, -1)

			slot0.findUITimer:Start()
			slot0.findUITimer.func()
		end,
		SearchTimely = function (slot0, slot1)
			slot0:Clear()

			if slot0(slot1.path, slot1.pathIndex) then
				slot1.found(slot2)
			else
				slot1.notFound()
			end
		end,
		Clear = function (slot0)
			if slot0.findUITimer then
				slot0.findUITimer:Stop()

				slot0.findUITimer = nil
			end
		end
	}
end

function pg.GuideMgr.cloneGO(slot0, slot1, slot2, slot3)
	slot4 = tf(Instantiate(slot1))
	slot4.sizeDelta = tf(slot1).sizeDelta

	SetActive(slot4, true)
	slot4:SetParent(slot2, false)

	if slot3.hideChildEvent then
		eachChild(slot4, function (slot0)
			if slot0:GetComponent(typeof(Button)) then
				slot1.enabled = false
			end
		end)
	end

	if slot3.hideAnimtor and slot4:GetComponent(typeof(Animator)) then
		slot5.enabled = false
	end

	if slot0.targetTimer then
		slot0.targetTimer:Stop()

		slot0.targetTimer = nil
	end

	if not slot3.pos and not slot3.scale and not slot3.eulerAngles then
		slot0.targetTimer = Timer.New(function ()
			if not IsNil(IsNil) and not IsNil(slot1) then
				slot1.position = slot0.transform.position
				slot0.transform.position.localPosition = Vector3(slot1.localPosition.x, slot1.localPosition.y, 0)
				slot1.localScale = Vector3(slot0.transform.localScale.x, slot0.transform.localScale.y, slot0.transform.localScale.z)

				if slot1.image and type(slot2.image) == "table" then
					slot4 = nil
					slot4 = (not (not slot2.image.isChild or tf(slot0):Find(slot2.image.source)) and GameObject.Find(slot2.image.source).image.isRelative or ((not slot2.image.isChild or tf(slot0).Find(slot2.image.source)) and GameObject.Find(slot2.image.source).image.target == "" and slot1) or tf(slot1):Find((not slot2.image.isChild or tf(slot0).Find(slot2.image.source)) and GameObject.Find(slot2.image.source).image.target)) and GameObject.Find((not slot2.image.isChild or tf(slot0).Find(slot2.image.source)) and GameObject.Find(slot2.image.source).image.target)

					if not IsNil(slot2) and not IsNil(slot4) then
						slot6 = slot4:GetComponent(typeof(Image))

						if slot2:GetComponent(typeof(Image)) and slot6 then
							slot8 = slot6.sprite

							if slot5.sprite and slot8 and slot7 ~= slot8 then
								slot6.enabled = slot5.enabled

								setImageSprite(slot4, slot7)
							end
						end
					end
				end
			end
		end, 0.01, -1)

		slot0.targetTimer:Start()
		slot0.targetTimer.func()
	else
		if slot3.pos then
			slot4.localPosition = Vector3(slot3.pos.x, slot3.pos.y, slot3.pos.z or 0)
		else
			slot4.position = slot1.transform.position
			slot4.localPosition = Vector3(slot4.localPosition.x, slot4.localPosition.y, 0)
		end

		slot4.localScale = Vector3(slot3.scale or 1, , )

		if slot3.eulerAngles then
			slot4.eulerAngles = Vector3(slot3.eulerAngles[1], slot3.eulerAngles[2], slot3.eulerAngles[3])
		else
			slot4.eulerAngles = Vector3(0, 0, 0)
		end
	end

	return slot4
end

function pg.GuideMgr.setFinger(slot0, slot1, slot2)
	SetActive(slot0.fingerTF, true)

	slot0.fingerTF.localScale = Vector3((slot2.scale and 1 / slot2.scale) or 1, , 1)
	slot6 = (slot2.fingerPos and Vector3(slot2.fingerPos.posX, slot2.fingerPos.posY, 0)) or Vector3(slot1.sizeDelta.x / 2, -(slot1.sizeDelta.y / 2), 0)

	if slot0.cloneTarget then
		slot0.fingerTF:SetParent(slot0.cloneTarget, false)
	end

	setAnchoredPosition(slot0.fingerTF, slot6)
end

function pg.GuideMgr.addUIEventTrigger(slot0, slot1, slot2, slot3)
	slot4 = slot2.ui
	slot5 = slot1

	if slot0.cloneTarget:GetComponent(typeof(CanvasGroup)) then
		slot7.alpha = 1
	end

	if slot4.eventIndex then
		slot5 = slot1:GetChild(slot4.eventIndex)
		slot6 = slot0.cloneTarget:GetChild(slot4.eventIndex)
	elseif slot4.eventPath then
		if IsNil(GameObject.Find(slot4.eventPath)) then
			slot5 = slot1
		end

		if slot0.cloneTarget:GetComponent(typeof(Image)) == nil then
			GetOrAddComponent(slot0.cloneTarget, typeof(Image)).color = Color(1, 1, 1, 0)
		end
	end

	if ((slot4.triggerType and slot4.triggerType[1]) or slot0) == slot0 then
		onButton(slot0, slot6, function ()
			if not IsNil(IsNil) then
				slot1:finishCurrEvent(slot2, slot3)
				triggerButton(triggerButton)
			end
		end, SFX_PANEL)
		setButtonEnabled(slot6, true)
	elseif slot8 == slot1 then
		onToggle(slot0, slot6, function (slot0)
			if slot0 and not IsNil(slot0) then
				slot1:finishCurrEvent(slot1, )
				triggerToggle(slot0, slot4.triggerType[2] or true)
			end
		end, SFX_PANEL)
		setToggleEnabled(slot6, true)
	else
		if slot8 == slot2 then
			slot9 = slot5:GetComponent(typeof(EventTriggerListener))
			slot10 = slot6:GetComponent(typeof(EventTriggerListener))

			slot10:AddPointDownFunc(function (slot0, slot1)
				if not IsNil(slot0) then
					slot1:OnPointerDown(slot1)
				end
			end)
			slot10:AddPointUpFunc(function (slot0, slot1)
				slot0:finishCurrEvent(slot1, slot0.finishCurrEvent)

				if not IsNil(slot0) then
					slot4:OnPointerUp(slot1)
				end
			end)

			return
		end

		if slot8 == slot3 then
			if slot6:GetComponent(typeof(EventTriggerListener)) == nil then
				slot9 = go(slot6):AddComponent(typeof(EventTriggerListener))
			end

			slot9:AddPointDownFunc(function (slot0, slot1)
				if not IsNil(slot0) then
					slot1:finishCurrEvent(slot1.finishCurrEvent, slot1)
				end
			end)
		elseif slot8 == slot4 then
			if slot6:GetComponent(typeof(EventTriggerListener)) == nil then
				slot9 = go(slot6):AddComponent(typeof(EventTriggerListener))
			end

			slot9:AddPointUpFunc(function (slot0, slot1)
				slot0:finishCurrEvent(slot1, slot0.finishCurrEvent)
			end)
		end
	end
end

function pg.GuideMgr.finishCurrEvent(slot0, slot1, slot2)
	slot0.bgAlpha.alpha = 0.2

	removeOnButton(slot0._go)
	SetParent(slot0.fingerTF, tf(slot0._go), false)
	SetActive(slot0.fingerTF, false)
	SetActive(slot0.guiderTF, false)

	slot0.fingerTF.localScale = Vector3(1, 1, 1)

	if slot0.cloneTarget then
		SetActive(slot0.cloneTarget, false)
		Destroy(slot0.cloneTarget)

		slot0.cloneTarget = nil
	end

	if slot0.targetTimer then
		slot0.targetTimer:Stop()

		slot0.targetTimer = nil
	end

	if slot0.findUITimer then
		slot0.findUITimer:Stop()

		slot0.findUITimer = nil
	end

	if slot2 then
		slot2()
	end
end

function slot7(slot0)
	slot0:clearDelegateInfo()

	if slot0.delayTimer then
		slot0.delayTimer:Stop()

		slot0.delayTimer = nil
	end

	if slot0.targetTimer then
		slot0.targetTimer:Stop()

		slot0.targetTimer = nil
	end

	if slot0.signTimer then
		slot0.signTimer:Stop()

		slot0.signTimer = nil
	end

	slot0.finder:Clear()

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

	if slot0.currentGuide then
		slot0.currentGuide = nil
	end

	slot0.uiLongPress.onLongPressed:RemoveAllListeners()
end

function pg.GuideMgr.addDelegateInfo(slot0)
	pg.DelegateInfo.New(slot0)

	slot0.isAddDelegateInfo = true
end

function pg.GuideMgr.clearDelegateInfo(slot0)
	if slot0.isAddDelegateInfo then
		pg.DelegateInfo.Dispose(slot0)

		slot0.isAddDelegateInfo = nil
	end
end

function pg.GuideMgr.mask(slot0)
	SetActive(slot0._go, true)
end

function pg.GuideMgr.unMask(slot0)
	SetActive(slot0._go, false)
end

function pg.GuideMgr.endGuider(slot0, slot1)
	slot0(slot0)

	slot0.managerState = slot1.MANAGER_STATE.IDLE

	pg.m02:sendNotification(GAME.END_GUIDE)

	if slot1 then
		slot1()
	end
end

function pg.GuideMgr.onDisconnected(slot0)
	if slot0._go.activeSelf then
		slot0.prevState = slot0.managerState
		slot0.managerState = slot0.MANAGER_STATE.BREAK

		SetActive(slot0._go, false)

		if slot0.cloneTarget then
			SetActive(slot0.cloneTarget, false)
		end
	end
end

function pg.GuideMgr.onReconneceted(slot0)
	if slot0.prevState then
		slot0.managerState = slot0.prevState
		slot0.prevState = nil

		SetActive(slot0._go, true)

		if slot0.cloneTarget then
			SetActive(slot0.cloneTarget, true)
		end
	end
end

return
