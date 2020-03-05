slot0 = class("DecodeGameView")

function slot0.Ctor(slot0, slot1)
	pg.DelegateInfo.New(slot0)

	slot0.controller = slot1
end

function slot0.SetUI(slot0, slot1)
	slot0._tf = slot1
	slot0._go = go(slot1)
	slot0.mapItemContainer = slot0._tf:Find("game/container")
	slot0.itemList = UIItemList.New(slot0.mapItemContainer, slot0._tf:Find("game/container/tpl"))
	slot0.mapLine = slot0._tf:Find("game/line")

	setActive(slot0.mapLine, false)

	slot0.mapBtns = {
		slot0._tf:Find("btn/btn1"),
		slot0._tf:Find("btn/btn2"),
		slot0._tf:Find("btn/btn3")
	}
	slot0.engines = {
		slot0._tf:Find("tuitong/1"),
		slot0._tf:Find("tuitong/2"),
		slot0._tf:Find("tuitong/3")
	}
	slot0.engineBottom = slot0._tf:Find("tuitong/4")
	slot0.number1 = slot0._tf:Find("shuzi/1"):GetComponent(typeof(Image))
	slot0.number2 = slot0._tf:Find("shuzi/2"):GetComponent(typeof(Image))
	slot0.awardProgressTF = slot0._tf:Find("zhuanpanxinxi/jindu")
	slot0.awardProgress1TF = slot0._tf:Find("zhuanpanxinxi/jindu/zhuanpan")
	slot0.mapProgreeses = {
		slot0._tf:Find("zhuanpanxinxi/deng1"),
		slot0._tf:Find("zhuanpanxinxi/deng2"),
		slot0._tf:Find("zhuanpanxinxi/deng3")
	}
	slot0.mapPasswords = {
		slot0._tf:Find("dengguang/code1/1"),
		slot0._tf:Find("dengguang/code1/2"),
		slot0._tf:Find("dengguang/code1/3"),
		slot0._tf:Find("dengguang/code1/4"),
		slot0._tf:Find("dengguang/code1/5"),
		slot0._tf:Find("dengguang/code1/6")
	}
	slot0.encodingPanel = slot0._tf:Find("encoding")
	slot0.encodingSlider = slot0._tf:Find("encoding/slider/bar")

	setActive(slot0.encodingPanel, false)

	slot0.enterAnim = slot0._tf:Find("enter_anim")
	slot0.enterAnimTop = slot0._tf:Find("enter_anim/top")
	slot0.enterAnimBottom = slot0._tf:Find("enter_anim/bottom")

	setActive(slot0.enterAnim, false)

	slot0.bookBtn = slot0._tf:Find("btn/mima/unlock")
	slot0.mimaLockBtn = slot0._tf:Find("btn/mima/lock")
	slot0.mimaLockBlink = slot0._tf:Find("btn/mima/blink")
	slot0.code1Panel = slot0._tf:Find("dengguang/code1")
	slot0.code2Panel = slot0._tf:Find("dengguang/code2")
	slot0.passWordTF = slot0._tf:Find("game/password")
	slot0.containerSize = slot0.mapItemContainer.sizeDelta
	slot0.mosaic = slot0._tf:Find("game/Mosaic")
	slot0.lines = slot0._tf:Find("game/grids")
	slot0.code2 = {
		slot0._tf:Find("dengguang/code2/1"),
		slot0._tf:Find("dengguang/code2/2"),
		slot0._tf:Find("dengguang/code2/3"),
		slot0._tf:Find("dengguang/code2/4"),
		slot0._tf:Find("dengguang/code2/5"),
		slot0._tf:Find("dengguang/code2/6"),
		slot0._tf:Find("dengguang/code2/7"),
		slot0._tf:Find("dengguang/code2/8"),
		slot0._tf:Find("dengguang/code2/9")
	}
	slot0.lightRight = slot0._tf:Find("dengguang/code2/light_right")
	slot0.lightLeft = slot0._tf:Find("dengguang/code2/light_left")
	slot0.awardLock = slot0._tf:Find("zhuanpanxinxi/item/lock")
	slot0.awardGot = slot0._tf:Find("zhuanpanxinxi/item/got")
	slot0.screenHeight = slot0._tf.rect.height
	slot0.engineBottom.localPosition = Vector3(slot0.engineBottom.localPosition.x, -slot0.screenHeight / 2, 0)
	slot0.code2Panel.localPosition = Vector3(slot0.code2Panel.localPosition.x, slot0.screenHeight / 2, 0)
	slot0.line1 = slot0._tf:Find("game/lines/line1")
	slot0.blinkFlag = false
	slot0.helperTF = slot0._tf:Find("helper")
	slot0.tips = slot0._tf:Find("btn/tips")
	slot0.animCallbacks = {}
	slot0.decodeTV = slot0._tf:Find("game/zhezhao/DecodeTV")
	slot0.anim = slot0.decodeTV:GetComponent(typeof(Animator))
	slot0.dftAniEvent = slot0.decodeTV:GetComponent(typeof(DftAniEvent))

	slot0.dftAniEvent:SetEndEvent(function (slot0)
		for slot4, slot5 in ipairs(slot0.animCallbacks) do
			slot5()
		end

		slot0.animCallbacks = {}

		setActive(slot0.decodeTV, false)
	end)

	slot0.codeHeight = slot0.screenHeight / 2 - slot0.code1Panel.anchoredPosition.y
	slot0.code2Panel.sizeDelta = Vector2(slot0.code2Panel.sizeDelta.x, slot0.codeHeight)
	slot0.code1Panel.sizeDelta = Vector2(slot0.code1Panel.sizeDelta.x, slot0.codeHeight)
end

function slot0.DoEnterAnim(slot0, slot1)
	setActive(slot0.enterAnim, true)
	LeanTween.moveLocalY(go(slot0.enterAnimTop), slot0.screenHeight / 2, 1):setFrom(-75):setDelay(DecodeGameConst.OPEN_DOOR_DELAY)
	LeanTween.moveLocalY(go(slot0.enterAnimBottom), -slot0.screenHeight / 2, 1):setFrom(75):setDelay(DecodeGameConst.OPEN_DOOR_DELAY):setOnComplete(System.Action(function ()
		slot0()
		setActive(slot1.enterAnim, false)
	end))
	updateDrop(slot0._tf:Find("zhuanpanxinxi/item"), {
		id = DecodeGameConst.AWARD[2],
		type = DecodeGameConst.AWARD[1],
		count = DecodeGameConst.AWARD[3]
	})
end

function slot0.Inited(slot0, slot1)
	onButton(slot0, slot0._tf:Find("btn/back"), function ()
		slot0.controller:ExitGame()
	end, SFX_CANCEL)
	onButton(slot0, slot0._tf:Find("btn/help"), function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.decodegame_gametip.tip
		})
	end, SFX_PANEL)

	slot0.ison = false

	onButton(slot0, slot0.bookBtn, function ()
		if slot0.controller:CanSwitch() then
			slot0.ison = not slot0.ison

			slot0.controller:SwitchToDecodeMap(slot0.ison)
			setActive(slot0.bookBtn:Find("Image"), slot0.ison)
		end
	end)

	for slot5, slot6 in ipairs(slot0.mapBtns) do
		onButton(slot0, slot6, function ()
			slot0.controller:SwitchMap(slot0.controller)
		end)
	end

	setActive(slot0.awardLock, not slot1)
	setActive(slot0.awardGot, slot1)
end

function slot0.UpdateMap(slot0, slot1)
	slot0.mapItems = {}

	slot0.itemList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot1:UpdateMapItem(slot2, slot0, slot0.items[slot1 + 1], slot1 + 1)
		end
	end)
	slot0.itemList:align(#slot1.items)

	slot2 = _.flatten(slot1.password)

	for slot6, slot7 in ipairs(slot0.mapPasswords) do
		slot8 = "-"

		if slot1.isUnlock then
			slot8 = slot2[slot6]
		end

		slot7:GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/DecodeGameUI_atlas", slot8 .. "-1")
	end

	setActive(slot0.mosaic, not slot1.isUnlock)
end

function slot0.UpdateMapItem(slot0, slot1, slot2, slot3, slot4)
	slot1.localPosition = slot3.position
	go(slot1).name = slot3.index
	slot7 = slot1:Find("rect/icon").GetComponent(slot6, typeof(Image))
	slot7.sprite = GetSpriteFromAtlas("puzzla/bg_" .. slot2.id + DecodeGameConst.MAP_NAME_OFFSET, slot2.id .. "-" .. ((slot2.isUnlock and slot4) or DecodeGameConst.DISORDER[slot4]))

	slot7:SetNativeSize()

	slot6:GetComponent(typeof(CanvasGroup)).alpha = (slot3.isUnlock and 1) or 0

	setActive(slot1:Find("rays"), false)
	setActive(slot1:Find("rays/yellow"), false)
	setActive(slot1:Find("rays/blue"), false)
	onButton(slot0, slot1, function ()
		slot0.controller:Unlock(slot1.index)
	end, SFX_PANEL)

	slot0.mapItems[slot3.index] = slot1
end

function slot0.OnMapRepairing(slot0, slot1)
	pg.UIMgr.GetInstance():BlurPanel(slot0.encodingPanel)
	setActive(slot0.encodingPanel, true)
	LeanTween.value(go(slot0.encodingSlider), 0, 1, DecodeGameConst.DECODE_MAP_TIME):setOnUpdate(System.Action_float(function (slot0)
		setFillAmount(slot0.encodingSlider, slot0)
	end)):setOnComplete(System.Action(function ()
		pg.UIMgr.GetInstance():UnblurPanel(slot0.encodingPanel, slot0._tf)
		setActive(slot0.encodingPanel, false)
		slot0.encodingPanel()
	end))
end

function slot0.OnSwitch(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-62, warpins: 1 ---
	slot12 = slot0.engines[slot1].Find(slot9, "tui").sizeDelta.y

	LeanTween.moveLocalX(slot10, slot2, DecodeGameConst.SWITCH_MAP):setFrom(slot3)
	LeanTween.value(go(slot11), slot4, slot5, DecodeGameConst.SWITCH_MAP):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0.sizeDelta = Vector2(slot0, slot0)

		return
		--- END OF BLOCK #0 ---



	end))
	LeanTween.rotateZ(go(slot8), slot6, DecodeGameConst.SWITCH_MAP):setOnComplete(System.Action(slot7))

	return
	--- END OF BLOCK #0 ---



end

function slot0.OnExitMap(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-9, warpins: 1 ---
		slot0.mapItemContainer.sizeDelta = Vector2(slot0.containerSize.x, 0)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-20, warpins: 2 ---
	slot0:OnSwitch(slot1, -11, -150, 158, 23, 0, slot3)

	return
	--- END OF BLOCK #1 ---



end

function slot0.OnEnterMap(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	parallelAsync({
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-13, warpins: 1 ---
			slot0:OnSwitch(slot0.OnSwitch, -150, -11, 23, 158, 90, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-3, warpins: 1 ---
				slot0()

				return
				--- END OF BLOCK #0 ---



			end)

			return
			--- END OF BLOCK #0 ---



		end,
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			if not slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-6, warpins: 1 ---
				slot0()

				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 7-61, warpins: 1 ---
			setActive(slot1.mapLine, true)
			LeanTween.value(go(slot1.mapItemContainer), 0, slot1.containerSize.y, DecodeGameConst.SCAN_MAP_TIME):setOnUpdate(System.Action_float(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-10, warpins: 1 ---
				slot0.mapItemContainer.sizeDelta = Vector2(slot0.containerSize.x, slot0)

				return
				--- END OF BLOCK #0 ---



			end)):setOnComplete(System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				setActive(slot0.mapLine, false)
				slot0.mapLine()

				return
				--- END OF BLOCK #0 ---



			end))
			LeanTween.value(go(slot1.mapLine), 286, 286 - slot1.containerSize.y, DecodeGameConst.SCAN_MAP_TIME):setOnUpdate(System.Action_float(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-12, warpins: 1 ---
				slot0.mapLine.localPosition = Vector2(slot0.mapLine.localPosition.x, slot0, 0)

				return
				--- END OF BLOCK #0 ---



			end))

			return
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 62-62, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end
	}, slot3)

	return
	--- END OF BLOCK #0 ---



end

function slot0.UnlockMapItem(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-37, warpins: 1 ---
	slot4 = slot0.mapItems[slot1].Find(slot3, "rect/icon")
	slot5 = slot4:GetComponent(typeof(CanvasGroup))

	LeanTween.value(go(slot4), 0, 1, 0.3):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot0.alpha = slot0

		return
		--- END OF BLOCK #0 ---



	end)):setOnComplete(System.Action(slot2))

	return
	--- END OF BLOCK #0 ---



end

function slot0.UpdateCanUseCnt(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-22, warpins: 1 ---
	slot0.number1.sprite = GetSpriteFromAtlas("ui/DecodeGameUI_atlas", slot2)
	slot0.number2.sprite = GetSpriteFromAtlas("ui/DecodeGameUI_atlas", slot1 % 10)
	tf(slot0.number1).localPosition = (math.floor(slot1 / 10) == 1 and Vector3(-625, -17)) or Vector3(-660, -17)
	tf(slot0.number2).localPosition = (slot3 == 1 and Vector3(-516.8, -17)) or Vector3(-546.3, -17)

	return
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 33-38, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 49-50, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

function slot0.UpdateProgress(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	if slot1 < DecodeGameConst.MAP_ROW * DecodeGameConst.MAP_COLUMN * DecodeGameConst.MAX_MAP_COUNT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-18, warpins: 1 ---
		setFillAmount(slot0.awardProgressTF, slot5 * DecodeGameConst.PROGRESS2FILLAMOUMT)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-22, warpins: 1 ---
		setFillAmount(slot0.awardProgressTF, 1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 23-38, warpins: 2 ---
	slot0.awardProgress1TF.eulerAngles = Vector3(0, 0, 180 - slot5 * DecodeGameConst.PROGRESS2ANGLE)

	setActive(slot0.bookBtn, slot2 == DecodeGameConst.MAX_MAP_COUNT)
	setActive(slot0.mapProgreeses[1], slot3[1])
	setActive(slot0.mapProgreeses[2], slot3[2])
	setActive(slot0.mapProgreeses[3], slot3[3])

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 42-61, warpins: 2 ---
	if slot2 == DecodeGameConst.MAX_MAP_COUNT and not slot0.blinkFlag then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 65-82, warpins: 1 ---
		LeanTween.moveLocalX(go(slot0.mimaLockBtn), 150, 0.3):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-21, warpins: 1 ---
			setActive(slot0.mimaLockBlink, true)
			blinkAni(go(slot0.mimaLockBlink), 0.2, 2):setOnComplete(System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				setActive(slot0.mimaLockBlink, false)
				slot0.mimaLockBlink()

				return
				--- END OF BLOCK #0 ---



			end))

			return
			--- END OF BLOCK #0 ---



		end))

		slot0.blinkFlag = true
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 83-86, warpins: 2 ---
		if slot2 == DecodeGameConst.MAX_MAP_COUNT then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 87-98, warpins: 1 ---
			slot0.mimaLockBtn.localPosition = Vector3(150, 0, 0)

			setActive(slot0.mimaLockBlink, false)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 99-107, warpins: 1 ---
			slot0.mimaLockBtn.localPosition = Vector3(0, 0, 0)

			slot4()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 108-109, warpins: 3 ---
	return
	--- END OF BLOCK #3 ---



end

function slot0.OnEnterDecodeMapBefore(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-27, warpins: 1 ---
	setActive(slot0.mosaic, true)
	setActive(slot0.lines, false)
	LeanTween.moveLocalY(go(slot0.code1Panel), slot0.screenHeight / 2, DecodeGameConst.SWITCH_TO_DECODE_TIME / 2):setOnComplete(System.Action(slot1))

	return
	--- END OF BLOCK #0 ---



end

function slot0.OnEnterDecodeMap(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	parallelAsync({
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-36, warpins: 1 ---
			_.each(slot0.code2, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				setActive(slot0, false)

				return
				--- END OF BLOCK #0 ---



			end)
			LeanTween.moveLocalY(go(slot0.engineBottom), -500, DecodeGameConst.SWITCH_TO_DECODE_TIME / 2)
			LeanTween.moveLocalY(go(slot0.code2Panel), 303, DecodeGameConst.SWITCH_TO_DECODE_TIME / 2):setOnComplete(System.Action(slot0))

			return
			--- END OF BLOCK #0 ---



		end
	}, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		setActive(slot0.mosaic, false)
		setActive(slot0.lines, false)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-22, warpins: 0 ---
		for slot3, slot4 in ipairs(slot0.lines) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-20, warpins: 1 ---
			slot0:UpdatePassWord(slot4, slot3)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 21-22, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 23-30, warpins: 1 ---
		setActive(slot0.passWordTF, 
		-- Decompilation error in this vicinity:
		true)

		-- Decompilation error in this vicinity:
		true()

		return
		--- END OF BLOCK #2 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.OnEnterNormalMapBefore(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	parallelAsync({
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-21, warpins: 1 ---
			LeanTween.moveLocalY(go(slot0.code2Panel), slot0.screenHeight / 2, DecodeGameConst.SWITCH_TO_DECODE_TIME / 2):setOnComplete(System.Action(slot0))

			return
			--- END OF BLOCK #0 ---



		end,
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-22, warpins: 1 ---
			LeanTween.moveLocalY(go(slot0.engineBottom), -slot0.screenHeight / 2, DecodeGameConst.SWITCH_TO_DECODE_TIME / 2):setOnComplete(System.Action(slot0))

			return
			--- END OF BLOCK #0 ---



		end
	}, slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.OnEnterNormalMap(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	seriesAsync({
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-19, warpins: 1 ---
			LeanTween.moveLocalY(go(slot0.code1Panel), 303, DecodeGameConst.SWITCH_TO_DECODE_TIME / 2):setOnComplete(System.Action(slot0))

			return
			--- END OF BLOCK #0 ---



		end,
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			setActive(slot0.passWordTF, false)
			slot0()

			return
			--- END OF BLOCK #0 ---



		end,
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			slot0.mapItemContainer.sizeDelta = slot0.containerSize

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 11-34, warpins: 0 ---
			for slot4, slot5 in ipairs(slot1.passwordIndexs) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-32, warpins: 1 ---
				slot0.mapItems[slot5].Find(slot6, "rect/icon"):GetComponent(typeof(CanvasGroup)).alpha = 1

				setActive(slot0.mapItems[slot5].Find(slot6, "rays"), false)
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 33-34, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 35-37, warpins: 1 ---
			slot0()

			return
			--- END OF BLOCK #2 ---



		end
	}, slot2)

	return
	--- END OF BLOCK #0 ---



end

function slot0.OnDecodeMap(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot3 = {}

	function slot4(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-11, warpins: 0 ---
		for slot4, slot5 in ipairs(slot0.items) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-8, warpins: 1 ---
			if slot5.index == slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-9, warpins: 1 ---
				return slot5
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 10-11, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 12-12, warpins: 1 ---
		return
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-52, warpins: 0 ---
	for slot8, slot9 in ipairs(slot1.passwordIndexs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-50, warpins: 1 ---
		slot0.mapItems[slot9].SetAsLastSibling(slot10)
		table.insert(slot3, {
			target = slot0.mapItems[slot9],
			sizeDelta = slot0.mapItems[slot9].Find(slot10, "rect").sizeDelta,
			starPosition = Vector2(slot0.mapItems[slot9].localPosition.x + slot0.mapItems[slot9].Find(slot10, "rect").sizeDelta.x / 2, slot0.mapItems[slot9].localPosition.y - slot0.mapItems[slot9].Find(slot10, "rect").sizeDelta.y / 2),
			endPosition = Vector2(slot0.mapItems[slot9].localPosition.x - slot0.mapItems[slot9].Find(slot10, "rect").sizeDelta.x / 2, slot0.mapItems[slot9].localPosition.y + slot0.mapItems[slot9].Find(slot10, "rect").sizeDelta.y / 2),
			item = slot4(slot9)
		})
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 51-52, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 53-89, warpins: 1 ---
	function slot5()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		slot0 = Vector2(0, slot0.line1.localPosition.y)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-39, warpins: 0 ---
		for slot4, slot5 in ipairs(ipairs) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-23, warpins: 1 ---
			slot8 = slot5.endPosition
			slot10 = slot5.target.Find(slot6, "rect").sizeDelta

			if slot5.starPosition.y <= slot0.y and slot0.y <= slot8.y then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 28-37, warpins: 1 ---
				slot9.sizeDelta = Vector2(slot10.x, slot5.sizeDelta.y - (slot0.y - slot7.y))
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 38-39, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 40-40, warpins: 1 ---
		return
		--- END OF BLOCK #2 ---



	end

	setActive(slot0.line1, true)
	LeanTween.value(go(slot0.line1), 0, slot6, DecodeGameConst.SCAN_GRID_TIME):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		setAnchoredPosition(slot0.line1, {
			y = slot0
		})
		setAnchoredPosition()

		return
		--- END OF BLOCK #0 ---



	end)):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		setActive(slot0.line1, false)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-48, warpins: 0 ---
		for slot3, slot4 in ipairs(slot0.line1) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-46, warpins: 1 ---
			slot4.target:Find("rect/icon"):GetComponent(typeof(CanvasGroup)).alpha = 0
			slot4.target:Find("rect").sizeDelta = slot4.sizeDelta

			setActive(slot4.target:Find("rays"), true)
			setActive(slot4.target:Find("rays/blue"), slot4.item.isUsed)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 47-48, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 49-51, warpins: 1 ---
		slot2()

		return
		--- END OF BLOCK #2 ---



	end))

	return
	--- END OF BLOCK #2 ---



end

function slot0.UpdatePassWord(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 == false then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-23, warpins: 2 ---
	slot0.code2[slot2].GetComponent(slot3, typeof(Image)).sprite = GetSpriteFromAtlas("ui/DecodeGameUI_atlas", slot1 .. "-1")

	setActive(slot0.code2[slot2], true)

	return
	--- END OF BLOCK #1 ---



end

function slot0.OnRightCode(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-31, warpins: 1 ---
	slot0:UpdatePassWord(slot2, slot3)
	setActive(slot0.mapItems[slot1].Find(slot4, "rays/blue"), true)
	setActive(slot0.lightRight, true)

	slot0.timer2 = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		setActive(slot0.lightRight, false)

		return
		--- END OF BLOCK #0 ---



	end, 1, 1)

	slot0.timer2:Start()

	return
	--- END OF BLOCK #0 ---



end

function slot0.OnFalseCode(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-42, warpins: 1 ---
	slot0:RemoveTimers()
	setActive(slot0.lightLeft, true)

	slot0.timer1 = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		setActive(slot0.lightLeft, false)

		return
		--- END OF BLOCK #0 ---



	end, 1, 1)

	slot0.timer1:Start()
	setActive(slot3, true)
	blinkAni(slot3, 0.2, 2):setOnComplete(System.Action(function (...)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		setActive(setActive, false)

		return
		--- END OF BLOCK #0 ---



	end))

	return
	--- END OF BLOCK #0 ---



end

function slot0.RemoveTimers(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.timer1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0.timer1:Stop()

		slot0.timer1 = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-12, warpins: 2 ---
	if slot0.timer2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-18, warpins: 1 ---
		slot0.timer2:Stop()

		slot0.timer2 = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-19, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.OnSuccess(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-32, warpins: 1 ---
	LeanTween.value(slot2, 0, -140, DecodeGameConst.GET_AWARD_ANIM_TIME / 2):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		tf(slot0).eulerAngles = Vector3(0, 0, slot0)

		return
		--- END OF BLOCK #0 ---



	end)):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-20, warpins: 1 ---
		LeanTween.moveLocalX(LeanTween.moveLocalX, 132, DecodeGameConst.GET_AWARD_ANIM_TIME / 2):setFrom(0):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-13, warpins: 1 ---
			setActive(slot0.awardLock, false)
			setActive(slot0.awardGot, true)
			slot0.awardGot()

			return
			--- END OF BLOCK #0 ---



		end))

		return
		--- END OF BLOCK #0 ---



	end))

	return
	--- END OF BLOCK #0 ---



end

function slot0.ShowHelper(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 22-23, warpins: 2 ---
	if PlayerPrefs.GetInt("DecodeGameHelpBg" .. slot3 .. slot1, 0) > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-26, warpins: 1 ---
		slot2()

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 27-83, warpins: 1 ---
	PlayerPrefs.SetInt("DecodeGameHelpBg" .. slot3 .. slot1, 1)
	PlayerPrefs.Save()
	setActive(slot0.helperTF, true)

	slot5 = slot0.helperTF:Find("Image")

	setImageSprite(slot5, slot8)

	slot5.sizeDelta = Vector2(DecodeGameConst.HELP_BGS[slot1][2][1], DecodeGameConst.HELP_BGS[slot1][2][2])
	slot5.localPosition = Vector3(DecodeGameConst.HELP_BGS[slot1][3][1], DecodeGameConst.HELP_BGS[slot1][3][2], 0)

	onButton(slot0, slot0.helperTF, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		setActive(slot0.helperTF, false)
		slot0.helperTF()

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 84-84, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

function slot0.ShowTip(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	eachChild(slot0.tips, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		setActive(slot0, go(slot0).name == tostring(slot0))

		return
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-16, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.PlayVoice(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	playSoundEffect(slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.OnSwitchMap(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0:PlayerMapStartAnim(slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.PlayerMapStartAnim(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	setActive(slot0.decodeTV, true)
	table.insert(slot0.animCallbacks, slot1)
	slot0.anim:SetTrigger("trigger")

	return
	--- END OF BLOCK #0 ---



end

function slot0.Dispose(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	pg.DelegateInfo.Dispose(slot0)

	slot0.mapItems = nil

	slot0:RemoveTimers()
	slot0.dftAniEvent:SetEndEvent(nil)

	slot0.animCallbacks = nil

	return
	--- END OF BLOCK #0 ---



end

return slot0
