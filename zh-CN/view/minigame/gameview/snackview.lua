slot0 = class("SnackView", import("..BaseMiniGameView"))
slot0.States_Before = 0
slot0.States_Memory = 1
slot0.States_Select = 2
slot0.States_Finished = 3
slot0.Ani_Close_2_Open = true
slot0.Ani_Open_2_Close = false
slot0.Bubble_Fade_Time = 0.5
slot0.Order_Num = 3
slot0.Snack_Num = 9

function slot0.getUIName(slot0)
	return "Snack"
end

function slot0.init(slot0)
	slot0:initData()
	slot0:findUI()
	slot0:initList()
	slot0:addListener()
end

function slot0.didEnter(slot0)
	slot0:initTime()
	slot0:updateSDModel()
	slot0:setState(slot0.States_Before)
end

function slot0.OnSendMiniGameOPDone(slot0)
	slot0:updateCount()
	pg.m02:sendNotification(GAME.MODIFY_MINI_GAME_DATA, {
		id = MiniGameDataCreator.ShrineGameID,
		map = {
			count = (getProxy(MiniGameProxy):GetMiniGameData(MiniGameDataCreator.ShrineGameID):GetRuntimeData("count") or 0) + 1
		}
	})
end

function slot0.onBackPressed(slot0)
	if slot0.state == slot0.States_Before then
		slot0:emit(slot0.ON_BACK_PRESSED)

		return
	end

	if slot0.timer then
		slot0.timer:Stop()
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("tips_summergame_exit"),
		onYes = function ()
			if slot0.snackResultView then
				slot0.snackResultView:Destroy()
			end

			slot0:emit(slot1.ON_BACK_PRESSED)
		end,
		onNo = function ()
			slot0.timer:Start()
		end
	})
end

function slot0.willExit(slot0)
	if slot0.timer then
		slot0.timer:Stop()
	end

	if slot0.prefab and slot0.model then
		PoolMgr.GetInstance():ReturnSpineChar(slot0.prefab, slot0.model)

		slot0.prefab = nil
		slot0.model = nil
	end
end

function slot0.findUI(slot0)
	slot1 = slot0:findTF("ForNotch")
	slot0.backBtn = slot0:findTF("BackBtn", slot1)
	slot0.helpBtn = slot0:findTF("HelpBtn", slot1)
	slot0.countText = slot0:findTF("Count/CountText", slot1)
	slot2 = slot0:findTF("GameContent")
	slot0.startBtn = slot0:findTF("StartBtn", slot2)
	slot0.considerTipTF = slot0:findTF("ConsiderTip", slot3)
	slot0.considerTimeText = slot0:findTF("TimeText", slot0.considerTipTF)
	slot0.selectTipTF = slot0:findTF("SelectTip", slot3)
	slot0.selectTimeText = slot0:findTF("TimeText", slot0.selectTipTF)
	slot0.selectedContainer = slot0:findTF("SelectedContainer", slot2)
	slot0.selectedTpl = slot0:findTF("SelectedTpl", slot2)
	slot0.selectedContainerCG = GetComponent(slot0.selectedContainer, "CanvasGroup")
	slot0.snackContainer = slot0:findTF("SnackContainer", slot2)
	slot0.animtor = GetComponent(slot0.snackContainer, "Animator")
	slot0.dftAniEvent = GetComponent(slot0.snackContainer, "DftAniEvent")

	slot0.dftAniEvent:SetEndEvent(function (slot0)
		slot0:setState(slot1.States_Select)
	end)

	slot0.spineCharContainer = slot0:findTF("SpineChar", slot2)
end

function slot0.initData(slot0)
	slot0.state = nil
	slot0.orderIDList = {}
	slot0.selectedIDList = {}
	slot0.snackIDList = {}
	slot0.score = 0
	slot0.packageData = {}
	slot0.selectedTFList = {}
	slot0.snackTFList = {}
	slot0.selectedSnackTFList = {}
end

function slot0.initTime(slot0)
	slot0.orginMemoryTime = slot0:GetMGData():getConfig("simple_config_data").memory_time
	slot0.orginSelectTime = slot0:GetMGData():getConfig("simple_config_data").select_time
	slot0.countTime = nil
	slot0.leftTime = slot0.orginSelectTime
end

function slot0.initTimer(slot0, slot1)
	if slot0.state == slot0.States_Memory then
		slot0.countTime = slot0.orginMemoryTime
	elseif slot0.state == slot0.States_Select then
		slot0.countTime = slot0.leftTime
	end

	slot0.timer = Timer.New(slot1, 1, -1)

	slot0.timer:Start()
end

function slot0.initList(slot0)
	for slot4 = 1, slot0.Order_Num, 1 do
		slot0.selectedTFList[slot4] = slot0.selectedContainer:GetChild(slot4 - 1)
	end

	for slot4 = 1, slot0.Snack_Num, 1 do
		slot0.snackTFList[slot4] = slot0.snackContainer:GetChild(slot4 - 1)
	end
end

function slot0.addListener(slot0)
	onButton(slot0, slot0.backBtn, function ()
		slot0:onBackPressed()
	end, SFX_CANCEL)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_summer_food.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.startBtn, function ()
		slot0:setState(slot1.States_Memory)
	end, SFX_PANEL)

	for slot4 = 1, slot0.Snack_Num, 1 do
		onButton(slot0, slot0.snackContainer:GetChild(slot4 - 1), function ()
			if isActive(slot0:findTF("SelectedTag", slot0)) == true then
				table.removebyvalue(slot0.selectedIDList, slot0)
				slot0:updateSelectedList(slot0.selectedIDList)

				slot0.selectedSnackTFList[slot0] = nil

				setActive(slot1, false)
				slot0:updateSelectedOrderTag()
			else
				table.insert(slot0.selectedIDList, slot0)
				slot0:updateSelectedList(slot0.selectedIDList)

				slot0.selectedSnackTFList[slot0] = slot2

				setActive(slot1, true)
				slot0:updateSelectedOrderTag()

				if #slot0.selectedIDList == slot3.Order_Num then
					slot0.timer:Stop()
					slot0:setState(slot3.States_Finished)
				end
			end
		end, SFX_PANEL)
	end
end

function slot0.updateSDModel(slot0)
	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetSpineChar(getProxy(BayProxy).getShipById(slot3, getProxy(PlayerProxy).getData(slot1).character).getPrefab(slot4), true, function (slot0)
		pg.UIMgr.GetInstance():LoadingOff()

		slot0.prefab = slot0
		slot0.model = slot0
		tf(slot0).localScale = Vector3(1, 1, 1)

		slot0:GetComponent("SpineAnimUI"):SetAction("stand", 0)
		setParent(slot0, slot0.spineCharContainer)
	end)
end

function slot0.updateSelectedList(slot0, slot1)
	slot1 = slot1 or {}

	for slot5 = 1, slot0.Order_Num, 1 do
		slot6 = slot0.selectedContainer:GetChild(slot5 - 1)
		slot9 = slot0:findTF("SnackImg", slot8)
		slot0.selectedTFList[slot5] = slot6

		setActive(slot8, slot10)
		setActive(slot0:findTF("Empty", slot6), not slot1[slot5])

		if slot1[slot5] then
			setImageSprite(slot9, GetSpriteFromAtlas("ui/snackui_atlas", "snack_" .. slot10, true))
		end
	end
end

function slot0.updateSnackList(slot0, slot1)
	for slot5 = 1, slot0.Snack_Num, 1 do
		slot6 = slot0.snackContainer:GetChild(slot5 - 1)

		setImageSprite(slot7, GetSpriteFromAtlas("ui/snackui_atlas", "snack_" .. slot8, true))
		setActive(slot0:findTF("SelectedTag", slot6), false)

		slot0.snackTFList[slot5] = slot6
		slot5 = slot5 + 1
	end
end

function slot0.updateCount(slot0)
	setText(slot0.countText, slot0:GetMGHubData().count)
end

function slot0.updateSelectedOrderTag(slot0, slot1)
	for slot5, slot6 in pairs(slot0.selectedSnackTFList) do
		slot7 = slot0:findTF("SelectedTag", slot6)

		if slot1 then
			setActive(slot7, false)
		else
			setImageSprite(slot7, GetSpriteFromAtlas("ui/snackui_atlas", "order_" .. slot8, true))
		end
	end
end

function slot0.updateSnackInteractable(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.snackTFList) do
		setButtonEnabled(slot6, slot1)
	end
end

function slot0.onStateChange(slot0)
	if slot0.state == slot0.States_Before then
		setActive(slot0.selectedContainer, false)
		setActive(slot0.startBtn, true)
		setActive(slot0.considerTipTF, false)
		setActive(slot0.selectTipTF, false)
		slot0:updateCount()
		slot0:updateSnackInteractable(false)
	else
		if slot0.state == slot0.States_Memory then
			setActive(slot0.selectedContainer, true)
			setActive(slot0.startBtn, false)

			slot0.orderIDList = slot0:randFetch(3, 9)

			slot0:updateSelectedList(slot0.orderIDList)

			slot0.snackIDList = slot0:randFetch(9, 9)

			slot0:updateSnackList(slot0.snackIDList)
			slot0:updateSnackInteractable(false)

			function slot1()
				slot0.countTime = slot0.countTime - 1

				setText(slot0.considerTimeText, slot0.countTime)

				if setText.countTime == 0 then
					slot0.timer:Stop()
					slot0.timer.Stop.animtor:SetBool("AniSwitch", slot1.Ani_Close_2_Open)
				end
			end

			LeanTween.value(go(slot0.selectedContainer), 0, 1, slot0.Bubble_Fade_Time):setOnUpdate(System.Action_float(function (slot0)
				slot0.selectedContainerCG.alpha = slot0
			end)):setOnComplete(System.Action(function ()
				setActive(slot0.considerTipTF, true)
				setActive(slot0.selectTipTF, false)
				setActive:initTimer(setActive)
				setText(slot0.considerTimeText, slot0.countTime)
			end))

			return
		end

		if slot0.state == slot0.States_Select then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 98-122, warpins: 1 ---
			setActive(slot0.considerTipTF, false)
			setActive(slot0.selectTipTF, true)
			slot0:updateSelectedList()
			slot0:updateSnackInteractable(true)
			slot0:initTimer(slot1)
			setText(slot0.selectTimeText, slot0.countTime)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 123-127, warpins: 1 ---
			if slot0.state == slot0.States_Finished then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 128-155, warpins: 1 ---
				slot0:updateSnackInteractable(false)
				LeanTween.value(go(slot0.selectedContainer), 1, 0, slot0.Bubble_Fade_Time):setOnUpdate(System.Action_float(function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-4, warpins: 1 ---
					slot0.selectedContainerCG.alpha = slot0

					return
					--- END OF BLOCK #0 ---



				end)):setOnComplete(System.Action(function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-5, warpins: 1 ---
					slot0:openResultView()

					return
					--- END OF BLOCK #0 ---



				end))
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
	end
end

function slot0.openResultView(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-49, warpins: 1 ---
	slot0.packageData = {
		orderIDList = slot0.orderIDList,
		selectedIDList = slot0.selectedIDList,
		countTime = slot0.countTime,
		score = slot0.score,
		correctNumToEXValue = slot0:GetMGData():getConfig("simple_config_data").correct_value,
		scoreLevel = slot0:GetMGData():getConfig("simple_config_data").score_level,
		onSubmit = function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			if slot0:GetMGHubData().count > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-13, warpins: 1 ---
				slot0:SendSuccess(slot0)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 14-55, warpins: 2 ---
			slot0.score = 0
			slot0.countTime = nil
			slot0.leftTime = slot0.orginSelectTime
			slot0.orderIDList = {}
			slot0.selectedIDList = {}
			slot0.snackIDList = {}

			slot0:updateSelectedOrderTag(true)

			slot0.selectedSnackTFList = {}

			slot0.animtor:SetBool("AniSwitch", slot1.Ani_Open_2_Close)
			slot0:setState(slot1.States_Before)

			return
			--- END OF BLOCK #1 ---



		end,
		onContinue = function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-37, warpins: 1 ---
			slot0.score = slot0.packageData.score
			slot0.leftTime = slot0.packageData.countTime
			slot0.orderIDList = {}
			slot0.selectedIDList = {}
			slot0.snackIDList = {}
			slot0.selectedSnackTFList = {}

			slot0.animtor:SetBool("AniSwitch", slot1.Ani_Open_2_Close)
			slot0.animtor.SetBool:setState(slot1.States_Memory)

			return
			--- END OF BLOCK #0 ---



		end
	}
	slot0.snackResultView = SnackResultView.New(slot0._tf, slot0.event, slot0.packageData)

	slot0.snackResultView:Reset()
	slot0.snackResultView:Load()

	return
	--- END OF BLOCK #0 ---



end

function slot0.randFetch(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot3 = {}
	slot4 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-27, warpins: 0 ---
	for slot8 = 1, slot1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-14, warpins: 2 ---
		slot4[slot9] = slot4[slot8] or slot8
		slot4[slot8] = slot4[math.random(slot8, slot2)] or slot9

		table.insert(slot3, slot4[math.random(slot8, slot2)] or slot9)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-18, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 20-27, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-28, warpins: 1 ---
	return slot3
	--- END OF BLOCK #2 ---



end

function slot0.setState(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.state == slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 2 ---
	slot0.state = slot1

	slot0:onStateChange()

	return
	--- END OF BLOCK #1 ---



end

return slot0
