slot0 = class("FireworkFactoryView", import("..BaseMiniGameView"))
slot1 = Mathf

function slot0.getUIName(slot0)
	return "FireworkFactoryUI"
end

slot0.MINIGAME_ID = 4
slot2 = 50
slot3 = {
	{
		color = "FFD26FFF",
		name = "na"
	},
	{
		color = "DE89ECFF",
		name = "k"
	},
	{
		color = "8F77DFFF",
		name = "rb"
	},
	{
		color = "70ad9f",
		name = "zn"
	},
	{
		color = "FF7069FF",
		name = "ca"
	},
	{
		color = "7faf6e",
		name = "cu"
	}
}
slot4 = {
	"s",
	"a",
	"b",
	"c"
}

function slot0.TransformColor(slot0)
	return Color.New(tonumber(string.sub(slot0, 1, 2), 16) / 255, tonumber(string.sub(slot0, 3, 4), 16) / 255, tonumber(string.sub(slot0, 5, 6), 16) / 255)
end

function slot0.init(slot0)
	slot0.top = slot0:findTF("top")
	slot0.plate = slot0:findTF("plate")
	slot0.storage = slot0:findTF("storage")
	slot0.dispenseView = slot0:findTF("top/dispenseView")

	setActive(slot0.dispenseView, false)

	slot0.resultWindow = slot0:findTF("top/resultwindow")

	setActive(slot0.resultWindow, false)

	slot0.btn_back = slot0.top:Find("noAdaptPanel/back")
	slot0.btn_help = slot0.top:Find("noAdaptPanel/title/help")
	slot0.timesText = slot0.top:Find("times/text")
	slot0.ballPlate = slot0.plate:Find("ball_plate")
	slot0.plateRings = {}

	for slot4 = 1, 3, 1 do
		table.insert(slot0.plateRings, slot0.ballPlate:GetChild(slot4))
	end

	slot0.btn_load = slot0.plate:Find("btn_load")
	slot0.ballSelectPanel = slot0.plate:Find("panel/layout")
	slot0.ballSelects = slot0:Clone2Full(slot0.ballSelectPanel, 3)
	slot0.ballSelectStatus = {
		0,
		0,
		0
	}
	slot0.lastSelectedBall = nil
	slot0.ballStoragePanel = slot0.storage:Find("house/layout")
	slot0.ballStorages = slot0:Clone2Full(slot0.ballStoragePanel, 6)
	slot0.screen_mask = slot0:findTF("mask")
	slot0.btn_next = slot0:findTF("Button")
	slot0.btn_next_text = slot0.btn_next:Find("Image")
	slot0.desc_dispense = slot0.dispenseView:Find("intro/Scroll View/Viewport/text")

	setText(slot0.desc_dispense, i18n("help_firework_produce"))

	slot0.btn_dispenseBG = slot0.dispenseView:Find("bg")
	slot0.btn_hammer = slot0.dispenseView:Find("container/Button")
	slot0.btn_hammer_text = slot0.btn_hammer:Find("text")
	slot0.slider_powder = slot0.dispenseView:Find("container/Slider/Fill Area"):GetComponent("Slider")
	slot0.slider_progress = slot0.dispenseView:Find("progress/Slider"):GetComponent("Slider")
	slot0.slider_progress_bg = slot0.dispenseView:Find("progress/Slider/Background/progressdi")
	slot0.slider_bubble = slot0.dispenseView:Find("container/Slider/Fill Area/Fill/handler/bubble")
	slot0.slider_bubble_text = slot0.slider_bubble:Find("text")
	slot0.progress_width = slot0.dispenseView:Find("progress/Slider/Handle Slide Area").rect.width
	slot0.progress_sub_mark_1 = slot0.dispenseView:Find("progress/Slider/Handle Slide Area/submark1")
	slot0.progress_sub_mark_2 = slot0.dispenseView:Find("progress/Slider/Handle Slide Area/submark2")
	slot0.progress_dis = {}

	for slot4 = 0, slot0.slider_progress_bg.childCount - 1, 1 do
		table.insert(slot0.progress_dis, slot0.slider_progress_bg:GetChild(slot4))
	end

	slot0.result_digits = {}

	pg.PoolMgr.GetInstance():GetPrefab("ui/light01", "", true, function (slot0)
		tf(slot0):SetParent(slot0.dispenseView, false)
		slot0:SetActive(false)

		slot0.effect_light = slot0
	end)

	slot0.result_bg = slot0.resultWindow:Find("bg")
	slot0.result_desc = slot0.resultWindow:Find("window/Text")

	setText(slot0.result_desc, i18n("result_firework_produce"))

	slot0.btn_result_confirm = slot0.resultWindow:Find("window/button")
	slot0.result_pingjia = slot0.resultWindow:Find("window/pingjia"):GetComponent("Image")
	slot0.flagStart = false
	slot0.flagDispense = false
	slot0.progressDispense = 0
end

function slot0.SetSprite(slot0, slot1, slot2)
	slot0:SetImageSprite(slot1:GetComponent("Image"), slot2)
end

function slot0.SetImageSprite(slot0, slot1, slot2)
	pg.PoolMgr.GetInstance():GetSprite("ui/fireworkfactoryui_atlas", slot2, false, function (slot0)
		slot0.sprite = slot0
	end)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.btn_back, function ()
		if slot0.flagDispense then
			slot0:ExitDispenseView()
		elseif slot0:CheckpowderDispensed() and slot0.flagStart then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("tips_firework_exit"),
				onYes = function ()
					slot0:emit(slot1.ON_BACK_PRESSED)
				end
			})
		else
			slot0:emit(slot1.ON_BACK)
		end
	end)
	onButton(slot0, slot0.btn_dispenseBG, function ()
		slot0:ExitDispenseView()
	end)
	onButton(slot0, slot0.btn_help, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_firework.tip
		})
	end)
	onButton(slot0, slot0.btn_next, function ()
		if not slot0.flagStart then
			slot0.flagStart = true

			slot0:UpdateNextBtn()
		elseif slot0:CheckballLoaded() then
			slot0:EnterDispenseView()
		end
	end)
	onButton(slot0, slot0.btn_hammer, function ()
		if slot0.progressDispense == 0 then
			slot0:ResetHammerAnim()
			slot0:FindNextPowderProgress()
			slot0:UpdateContainer()
		elseif slot0 == 1 then
			slot0.result_digits[1] = slot0.slider_powder.value * 100

			slot0:FindandStopProgress()
			slot0:UpdateContainer()
		elseif slot0 == 2 then
			slot0.result_digits[2] = slot0.slider_powder.value * 100

			slot0:FindandStopProgress()
			slot0:UpdateContainer()
		elseif slot0 == 3 then
			slot0.result_digits[3] = slot0.slider_powder.value * 100

			slot0:FindandStopProgress()
			slot0:UpdateContainer()
		end
	end)
	onButton(slot0, slot0.btn_result_confirm, function ()
		slot0:ShowResult()
	end)
	onButton(slot0, slot0.result_bg, function ()
		slot0:ShowResult()
	end)

	for slot4 = 1, #slot0.ballStorages, 1 do
		slot0:UpdateBall(slot5, slot4)
		onButton(slot0, slot0.ballStorages[slot4].Find(slot5, "mask"), function ()
			if not slot0.lastSelectedBall or slot0.lastSelectedBall <= 0 then
				return
			end

			slot0.ballSelectStatus[slot0.lastSelectedBall] = slot0.lastSelectedBall

			slot0.ballSelectStatus:UpdateRing(slot0.lastSelectedBall, slot0.ballSelectStatus)
			slot0.ballSelectStatus.UpdateRing:UpdateBall(slot0.ballSelects[slot0.lastSelectedBall]:Find("ball"), slot0.ballSelectStatus.UpdateRing)
			slot0.ballSelectStatus.UpdateRing.UpdateBall:UdpateSelectedBall(slot0.lastSelectedBall + 1)
			slot0.ballSelectStatus.UpdateRing.UpdateBall.UdpateSelectedBall:UpdateNextBtn()
		end)
	end

	for slot4 = 1, #slot0.ballSelects, 1 do
		slot0:UpdateBall(slot0.ballSelects[slot4].Find(slot5, "ball"), 0)
		slot0:UpdateRing(slot4, 0)
		onButton(slot0, slot0.ballSelects[slot4].Find(slot5, "mask"), function ()
			slot0.ballSelectStatus[slot1] = 0

			slot0.ballSelectStatus:UpdateBall(slot0.ballSelects[slot1]:Find("ball"), 0)
			slot0.ballSelectStatus.UpdateBall:UpdateRing(slot0.ballSelectStatus.UpdateBall, 0)
			slot0.ballSelectStatus.UpdateBall.UpdateRing:UdpateSelectedBall(slot0.ballSelectStatus.UpdateBall.UpdateRing)
			slot0.ballSelectStatus.UpdateBall.UpdateRing.UdpateSelectedBall:UpdateNextBtn()
		end)
	end

	slot0:ResetView()
	pg.UIMgr.GetInstance():OverlayPanel(slot0.top, {
		groupName = LayerWeightConst.GROUP_FIREWORK_PRODUCE
	})

	slot3 = {
		0
	}

	for slot7, slot8 in ipairs(slot2) do
		slot3[#slot2 - slot7 + 2] = slot8[1]
		slot3[#slot2 + slot7 + 1] = slot8[2]
	end

	slot3[#slot3] = 300

	for slot7 = 1, #slot3 - 1, 1 do
		slot0.progress_dis[slot7].anchorMin = Vector2(slot8, 0)
		slot0.progress_dis[slot7].anchorMax = Vector2(slot3[slot7 + 1] / 300, 1)
		slot0.progress_dis[slot7].sizeDelta = Vector2.zero
	end
end

function slot0.UpdateNextBtn(slot0)
	if not slot0.flagStart then
		slot1 = "dispense_ready"

		if slot0:GetMGData():GetRuntimeData("elements") and #slot3 > 3 and slot3[4] == SummerFeastScene.GetCurrentDay() then
			slot1 = "dispense_retry"
		end

		slot0:SetSprite(slot0.btn_next_text, slot1)
	else
		slot0:SetSprite(slot0.btn_next_text, "dispense_confirm")
	end

	setActive(slot0.screen_mask, not slot0.flagStart)
	setButtonEnabled(slot0.btn_next, not slot0.flagStart or slot0:CheckballLoaded())
end

function slot0.UpdateDispenseBtn(slot0)
	slot0:SetImageSprite(slot0.btn_load_img, (slot0:CheckpowderDispensed() and "btn_loadcompleted") or "btn_load")
	slot0:SetSprite(slot0.btn_load_text, (slot1 and "load_completed") or "load_ready")
	setButtonEnabled(slot0.btn_load, not slot1)
end

slot5 = {
	"start",
	"first_time",
	"second_time",
	"third_time",
	"finish_time"
}

function slot0.FindandStopProgress(slot0)
	slot0:StopHammerAnim()
	setButtonEnabled(slot0.btn_hammer, false)
	setButtonEnabled(slot0.btn_dispenseBG, false)
	setText(slot0.slider_bubble_text, math.ceil(slot0.result_digits[#slot0.result_digits]) .. "%")
	setActive(slot0.slider_bubble, true)
	setActive(slot0.effect_light, true)

	slot0.progressDispense = (#slot0.result_digits >= 3 and 4) or 0
	slot1 = 0

	for slot5 = 1, 3, 1 do
		if slot0.result_digits[slot5] then
			slot1 = slot1 + slot6
		end
	end

	slot2 = 0

	for slot6 = 1, #slot0.result_digits - 1, 1 do
		if slot0.result_digits[slot6] then
			slot2 = slot2 + slot7

			if slot6 == 1 then
				setActive(slot0.progress_sub_mark_1, true)

				slot0.progress_sub_mark_1.anchoredPosition = Vector2((slot0.progress_width * slot2) / 300, 27)
			elseif slot6 == 2 then
				setActive(slot0.progress_sub_mark_2, true)

				slot0.progress_sub_mark_2.anchoredPosition = Vector2((slot0.progress_width * slot2) / 300, 27)
			end
		end
	end

	slot3 = slot0.slider_bubble.transform.position
	slot4 = slot0.slider_progress.transform.position
	slot5 = slot0.slider_progress.value
	slot0.progressAnim = LeanTween.value(slot0.slider_progress.gameObject, 0, 1, 1.5):setEase(LeanTweenType.linear):setOnUpdate(System.Action_float(function (slot0)
		slot0.slider_progress.value = slot1.Lerp(slot1.Lerp, slot3 / 300, slot0)

		if slot0.effect_light then
			slot0.effect_light.transform.position = Vector3.Lerp(slot4, slot5, slot0 * 3) - Vector3(0, 0, 2)

			if slot0 * 3 > 1 then
				setActive(slot0.effect_light, false)
			end
		end
	end)):setOnComplete(System.Action(function ()
		setButtonEnabled(slot0.btn_hammer, true)
		setButtonEnabled(slot0.btn_dispenseBG, true)

		if setButtonEnabled.progressDispense > 3 then
			slot0:FindNextPowderProgress()
		end
	end))
end

function slot0.FindNextPowderProgress(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0.progressDispense = #slot0.result_digits + 1

	if slot0.progressDispense > 3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-18, warpins: 1 ---
		slot0:StopHammerAnim()
		setButtonEnabled(slot0.btn_hammer, false)
		slot0:ShowResultWindow()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.ShowResultWindow(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if #slot0.result_digits < 3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-22, warpins: 2 ---
	setActive(slot0.resultWindow, true)

	slot2 = slot0:GetMGData().GetSimpleValue(slot1, "score_reference")
	slot3 = 0

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-26, warpins: 0 ---
	for slot7 = 1, 3, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-26, warpins: 2 ---
		slot3 = slot3 + slot0.result_digits[slot7]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 27-31, warpins: 1 ---
	slot4 = 4

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 32-41, warpins: 0 ---
	for slot8, slot9 in ipairs(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-34, warpins: 1 ---
		if slot9[1] <= slot3 and slot3 <= slot9[2] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-39, warpins: 1 ---
			slot4 = slot8

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 40-40, warpins: 1 ---
			break
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 40-41, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 42-44, warpins: 2 ---
	if slot4 <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-45, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 46-52, warpins: 2 ---
	slot0:SetImageSprite(slot0.result_pingjia, slot0[slot4])

	return
	--- END OF BLOCK #6 ---



end

function slot0.ShowResult(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if slot0:GetMGHubData().count <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-11, warpins: 1 ---
		slot0:AfterResult()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-14, warpins: 1 ---
		slot0:GetReward()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-19, warpins: 2 ---
	setActive(slot0.resultWindow, false)

	return
	--- END OF BLOCK #1 ---



end

function slot0.AfterResult(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	slot1 = slot0:GetMGData()

	table.insert(slot3, slot2)
	slot0:StoreDataToServer(Clone(slot0.ballSelectStatus))
	onNextTick(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0:emit(slot1.ON_BACK)

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.GetReward(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if #slot0.result_digits < 3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-18, warpins: 2 ---
	slot2 = slot0:GetMGData().GetSimpleValue(slot1, "score_reference")
	slot3 = 0

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-22, warpins: 0 ---
	for slot7 = 1, 3, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-22, warpins: 2 ---
		slot3 = slot3 + slot0.result_digits[slot7]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 23-27, warpins: 1 ---
	slot4 = 4

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 28-37, warpins: 0 ---
	for slot8, slot9 in ipairs(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-30, warpins: 1 ---
		if slot9[1] <= slot3 and slot3 <= slot9[2] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 34-35, warpins: 1 ---
			slot4 = slot8

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 36-36, warpins: 1 ---
			break
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 36-37, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 38-40, warpins: 2 ---
	if slot4 <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-41, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 42-46, warpins: 2 ---
	slot0:SendSuccess(slot4)

	return
	--- END OF BLOCK #6 ---



end

function slot0.ResetHammerAnim(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.hammerAnim then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-6, warpins: 1 ---
		slot0:StopHammerAnim()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-19, warpins: 2 ---
	setActive(slot0.slider_bubble, false)

	slot2 = slot0:GetMGData():GetSimpleValue("roundTime") or slot0
	slot0.hammerAnim = LeanTween.value(slot0.slider_powder.gameObject, 0, 1, (slot0.GetMGData().GetSimpleValue("roundTime") or slot0) / 100 * 2):setEase(LeanTweenType.linear):setLoopPingPong():setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot0.slider_powder.value = slot0

		return
		--- END OF BLOCK #0 ---



	end))

	return

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-20, warpins: 1 ---
	slot2 = slot0
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 21-47, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

function slot0.StopHammerAnim(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.hammerAnim then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-12, warpins: 2 ---
	LeanTween.cancel(slot0.hammerAnim.uniqueId)

	slot0.hammerAnim = nil

	return
	--- END OF BLOCK #1 ---



end

function slot0.UpdateContainer(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot0:SetSprite(slot0.btn_hammer_text, slot0[slot0.progressDispense + 1])

	slot1 = 0
	slot2 = true

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-27, warpins: 0 ---
	for slot6 = 1, 3, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-18, warpins: 2 ---
		slot7 = slot0.result_digits[slot6]

		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-20, warpins: 1 ---
			if slot7 == nil then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-22, warpins: 1 ---
				slot2 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 23-23, warpins: 1 ---
				slot2 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 24-25, warpins: 3 ---
		if slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-26, warpins: 1 ---
			slot1 = slot1 + slot7
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 27-27, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-31, warpins: 1 ---
	slot0.slider_progress.value = slot1 / 300

	return
	--- END OF BLOCK #2 ---



end

function slot0.StopProgressAnim(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.progressAnim then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-12, warpins: 2 ---
	LeanTween.cancel(slot0.progressAnim.uniqueId)

	slot0.progressAnim = nil

	return
	--- END OF BLOCK #1 ---



end

function slot0.CheckballLoaded(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	return _.all(slot0.ballSelectStatus, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 <= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-5, warpins: 1 ---
			slot1 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-6, warpins: 1 ---
			slot1 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-7, warpins: 2 ---
		return slot1
		--- END OF BLOCK #1 ---



	end)
	--- END OF BLOCK #0 ---



end

function slot0.CheckpowderDispensed(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if #slot0.result_digits < 3 then

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

function slot0.UpdateBall(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = setActive
	slot4 = slot1

	if slot2 <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-12, warpins: 2 ---
	slot3(slot4, slot5)

	if slot2 <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-13, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-34, warpins: 2 ---
	slot1:GetComponent("Image").color = slot0.TransformColor(slot0[slot2].color)

	slot0:SetSprite(slot1:Find("symbol"), slot0[slot2].name)

	return
	--- END OF BLOCK #2 ---



end

function slot0.UpdateRing(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot1 <= 0 or slot1 > 3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-14, warpins: 2 ---
	slot4 = setActive
	slot5 = slot0.plateRings[slot1]

	if slot2 <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-16, warpins: 1 ---
		slot6 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-17, warpins: 1 ---
		slot6 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-21, warpins: 2 ---
	slot4(slot5, slot6)

	if slot2 <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-22, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 23-33, warpins: 2 ---
	slot3:GetComponent("Image").color = slot0.TransformColor(slot0[slot2].color)

	return
	--- END OF BLOCK #3 ---



end

function slot0.ResetView(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	_.each(slot0.plateRings, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		setActive(slot0, false)

		return
		--- END OF BLOCK #0 ---



	end)
	_.each(slot0.ballSelects, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		setActive(slot0:Find("ball"), false)
		setActive(slot0:Find("selected"), false)

		return
		--- END OF BLOCK #0 ---



	end)
	setText(slot0.timesText, slot0:GetMGHubData().count)

	if slot0:GetMGData():GetRuntimeData("elements") and #slot3 > 3 and slot3[4] == SummerFeastScene.GetCurrentDay() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-40, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 41-63, warpins: 0 ---
		for slot7 = 1, 3, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 41-46, warpins: 2 ---
			slot0.ballSelectStatus[slot7] = slot3[slot7]

			if slot3[slot7] > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 47-62, warpins: 1 ---
				slot0:UpdateRing(slot7, slot8)
				slot0:UpdateBall(slot0.ballSelects[slot7]:Find("ball"), slot8)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 63-63, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 64-83, warpins: 4 ---
	slot0:UdpateSelectedBall(1)
	slot0:UpdateNextBtn()
	setActive(slot0.slider_bubble, false)
	setActive(slot0.progress_sub_mark_1, false)
	setActive(slot0.progress_sub_mark_2, false)

	return
	--- END OF BLOCK #1 ---



end

function slot0.UdpateSelectedBall(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot1 <= 0 or slot1 > 3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-10, warpins: 2 ---
	if slot0.lastSelectedBall then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-13, warpins: 1 ---
		if slot0.lastSelectedBall == slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-14, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-24, warpins: 2 ---
		setActive(slot0.ballSelects[slot0.lastSelectedBall]:Find("selected"), false)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 25-35, warpins: 2 ---
	setActive(slot0.ballSelects[slot1]:Find("selected"), true)

	slot0.lastSelectedBall = slot1

	return
	--- END OF BLOCK #2 ---



end

function slot0.Clone2Full(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot3 = {}
	slot4 = slot1:GetChild(0)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-19, warpins: 0 ---
	for slot9 = 0, slot1.childCount - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-19, warpins: 2 ---
		table.insert(slot3, slot1:GetChild(slot9))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-23, warpins: 1 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 24-35, warpins: 0 ---
	for slot9 = slot5, slot2 - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-35, warpins: 2 ---
		table.insert(slot3, tf(cloneTplTo(slot4, slot1)))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 36-36, warpins: 1 ---
	return slot3
	--- END OF BLOCK #4 ---



end

function slot0.EnterDispenseView(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	setActive(slot0.dispenseView, true)

	slot0.flagDispense = true

	if #slot0.result_digits >= 3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-13, warpins: 1 ---
		slot1 = 4
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-14, warpins: 1 ---
		slot1 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-22, warpins: 2 ---
	slot0.progressDispense = slot1

	slot0:UpdateContainer()

	slot0.slider_powder.value = 0

	return
	--- END OF BLOCK #1 ---



end

function slot0.ExitDispenseView(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.flagDispense then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-37, warpins: 2 ---
	slot0:UpdateNextBtn()
	slot0:StopHammerAnim()
	slot0:StopProgressAnim()

	slot0.progressDispense = 0

	setActive(slot0.dispenseView, false)
	setButtonEnabled(slot0.btn_hammer, true)
	setText(slot0.timesText, slot0:GetMGHubData().count)
	setActive(slot0.slider_bubble, false)

	if slot0.effect_light then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-41, warpins: 1 ---
		setActive(slot0.effect_light, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 42-44, warpins: 2 ---
	slot0.flagDispense = false

	return
	--- END OF BLOCK #2 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot0:ExitDispenseView()
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.top, slot0._tf)

	if slot0.effect_light then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-25, warpins: 1 ---
		pg.PoolMgr.GetInstance():ReturnPrefab("ui/light01", "", slot0.effect_light)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 26-45, warpins: 2 ---
	pg.PoolMgr.GetInstance():DestroyPrefab("ui/light01", "")
	pg.PoolMgr.GetInstance():DestroySprite("ui/fireworkfactoryui_atlas")

	if slot0.OPTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-51, warpins: 1 ---
		slot0.OPTimer:Stop()

		slot0.OPTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 52-52, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

return slot0
