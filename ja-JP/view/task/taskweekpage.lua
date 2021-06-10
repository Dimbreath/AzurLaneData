slot0 = class("TaskWeekPage", import(".TaskCommonPage"))
slot0.WEEK_TASK_TYPE_COMMON = 1
slot0.WEEK_TASK_TYPE_PT = 2

function slot0.getUIName(slot0)
	return "TaskListForWeekPage"
end

function slot0.RefreshWeekProgress(slot0)
	slot0:UpdateWeekProgress(slot0.contextData.weekTaskProgressInfo)
end

function slot0.OnLoaded(slot0)
	uv0.super.OnLoaded(slot0)

	slot1 = slot0:findTF("right_panel/task_progress")

	setActive(slot1, true)
	setText(slot1:Find("title"), i18n("week_task_title_label"))

	slot0.awardPreviewBtn = slot1:Find("award_preview")

	setText(slot0.awardPreviewBtn:Find("Text"), i18n("week_task_award_preview_label"))

	slot0.phaseTxt = slot1:Find("phase/Text"):GetComponent(typeof(Text))
	slot0.progressSlider = slot1:Find("slider"):GetComponent(typeof(Slider))
	slot0.progressTxt = slot1:Find("slider/Text"):GetComponent(typeof(Text))
	slot0.awardList = UIItemList.New(slot1:Find("awards"), slot1:Find("awards/itemtpl"))
	slot0.getBtn = slot1:Find("get_btn")
	slot0.getBtnEnableTF = slot0.getBtn:Find("enable")
	slot0.getBtnDisableTF = slot0.getBtn:Find("disable")
	slot0.tip = slot1:Find("tip")

	onButton(slot0, slot0.awardPreviewBtn, function ()
		uv0.contextData.ptAwardWindow:ExecuteAction("Display", uv0.contextData.weekTaskProgressInfo:GetAllPhaseDrops())
	end, SFX_PANEL)

	slot0.topTF = slot0._scrllPanel.parent
	slot0.topPosy = slot0._scrllPanel.localPosition.y + slot0._scrllPanel.rect.height * 0.5

	slot0._scrollView.onValueChanged:AddListener(function (slot0)
		uv0:UpdateCardTip()
	end)
end

function slot0.UpdateCardTip(slot0)
	for slot4, slot5 in pairs(slot0.taskCards) do
		slot5.tip.anchoredPosition3D = math.abs(slot0.topTF:InverseTransformPoint(slot5._tf.position).y + slot5.height * 0.5 - slot0.topPosy) < slot5.tip.rect.height * 0.5 and Vector3(-5, -25) or Vector3(-5, 0)
	end
end

function slot0.onUpdateTask(slot0, slot1, slot2)
	uv0.super.onUpdateTask(slot0, slot1, slot2)

	if slot1 == 0 then
		slot0.taskCards[slot2].tip.anchoredPosition3D = Vector3(-5, -25)
	end
end

function slot0.Update(slot0, slot1, slot2, slot3)
	slot0.taskVOs = {}

	if TaskScene.IsPassScenario() then
		slot4 = slot0.contextData.weekTaskProgressInfo

		slot0:UpdateWeekProgress(slot4)

		for slot9, slot10 in pairs(slot4:GetSubTasks()) do
			table.insert(slot0.taskVOs, slot10)
		end

		for slot10, slot11 in pairs(slot0.contextData.taskVOsById) do
			if slot11:getConfig("visibility") == 1 and slot2[slot11:GetRealType()] then
				table.insert(slot0.taskVOs, slot11)
			end
		end

		table.sort(slot0.taskVOs, function (slot0, slot1)
			if slot0:getTaskStatus(slot0) == slot1:getTaskStatus(slot1) then
				return (slot0.isWeekTask and 0 or 1) > (slot1.isWeekTask and 0 or 1)
			else
				return slot3 < slot2
			end
		end)
		slot0:Show()
		slot0._scrollView:SetTotalCount(#slot0.taskVOs, -1)
	else
		setActive(slot0._tf, false)
	end

	if slot3 then
		slot3(slot0.taskVOs)
	end
end

function slot0.UpdateWeekProgress(slot0, slot1)
	slot0:UpdateWeekProgressGetBtn(slot1)

	slot0.phaseTxt.text = slot1:GetPhase() .. "/" .. slot1:GetTotalPhase()
	slot2 = slot1:GetProgress()
	slot3 = slot1:GetTarget()
	slot0.progressSlider.value = slot2 / slot3
	slot0.progressTxt.text = slot2 .. "/" .. slot3

	slot0.awardList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = uv0[slot1 + 1]

			updateDrop(slot2, {
				type = slot3[1],
				id = slot3[2],
				count = slot3[3]
			})
			onButton(uv1, slot2, function ()
				uv0:emit(TaskMediator.ON_DROP, uv1)
			end, SFX_PANEL)
		end
	end)
	slot0.awardList:align(#slot1:GetDropList())
end

function slot0.UpdateWeekProgressGetBtn(slot0, slot1)
	slot2 = slot1:CanUpgrade()

	setGray(slot0.getBtn, not slot2, false)
	setActive(slot0.getBtnEnableTF, slot2)
	setActive(slot0.getBtnDisableTF, not slot2)
	setActive(slot0.tip, slot2)
	onButton(slot0, slot0.getBtn, function ()
		if uv0 then
			uv1:emit(TaskMediator.ON_SUBMIT_WEEK_PROGREE)
		end
	end, SFX_PANEL)
end

function slot0.OnDestroy(slot0)
	slot0._scrollView.onValueChanged:RemoveAllListeners()
end

return slot0
