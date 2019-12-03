slot0 = class("AnniversaryScene", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "AnniversaryUI"
end

function slot0.setActivity(slot0, slot1)
	slot0.activityVO = slot1
	slot0.configData = slot0.activityVO:getConfig("config_data") or {}
	slot0.date = slot0.activityVO.data3
	slot0.currTaskId = slot0.activityVO.data2
end

function slot0.setTaskList(slot0, slot1)
	slot0.taskVOs = slot1
end

function slot0.getTaskById(slot0, slot1)
	slot2 = -1

	for slot6, slot7 in ipairs(slot0.configData) do
		for slot11, slot12 in pairs(slot7) do
			if slot1 == slot12 then
				slot2 = slot6
			end
		end
	end

	if slot2 ~= -1 then
		if slot2 < slot0.date then
			slot3 = Task.New({
				submit_time = 2,
				id = slot1
			})
			slot3.progress = slot3:getConfig("target_num")

			return slot3
		else
			return slot0.taskVOs[slot1]
		end
	end
end

function slot0.init(slot0)
	slot0.backBtn = slot0:findTF("bg/top/back")
	slot0.mainPanel = slot0:findTF("bg/main")
	slot0.scrollRect = slot0:findTF("scroll_rect", slot0.mainPanel)
	slot0.taskGorupContainer = slot0:findTF("scroll_rect/content", slot0.mainPanel)
	slot0.taskGorupTpl = slot0:getTpl("taskGroup", slot0.taskGorupContainer)
	slot0.offset = Vector2(slot0.taskGorupTpl.rect.width / 2 + 30, slot0.taskGorupTpl.rect.height / 2 + 30)
	slot0.taskGroupDesc = slot0:findTF("taskGroup_desc", slot0.taskGorupContainer)
	slot0.bottomPanel = slot0:findTF("bg/bottom")
	slot0.bottomTaskGroups = slot0:findTF("taskGroups", slot0.bottomPanel)
	slot0.bottomBTpl = slot0:getTpl("bottom_task_tpl", slot0.bottomTaskGroups)
	slot0.startPosition = slot0.taskGorupContainer.localPosition
	slot0.titles = {}
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.backBtn, function ()
		slot0:emit(slot1.ON_BACK)
	end, SFX_CANCEL)
	slot0:initScrollRect()
end

slot1 = 2

function slot0.getRow(slot0, slot1)
	return math.floor(slot1 / slot0) * 2 + slot1 % slot0
end

function slot0.initScrollRect(slot0)
	slot0.taskGroupTFs = {}

	for slot6 = 0, slot0:getRow(#slot0.configData) - 1, 1 do
		for slot10 = 0, slot0 - 1, 1 do
			slot11 = slot0.offset.x * slot10
			slot12 = slot0.offset.y * slot6 * -1
			slot13 = slot6 % 2 == 0

			if slot13 == slot10 % 2 == 0 then
				cloneTplTo(slot0.taskGorupTpl, slot0.taskGorupContainer).localPosition = Vector2(slot11, slot12)

				table.insert(slot0.taskGroupTFs, cloneTplTo(slot0.taskGorupTpl, slot0.taskGorupContainer))
			end
		end
	end

	slot0:updateTaskGroups()

	slot0.dateIndex = math.max(slot0.date, 1)

	slot0:addVerticalDrag(slot0.scrollRect, function ()
		if slot0.dateIndex + 1 > #slot1 then
			return
		end

		slot0:moveToTaskGroup(slot0)
	end, function ()
		if slot0.dateIndex - 1 < 1 then
			return
		end

		slot0:moveToTaskGroup(slot0)
	end)
	slot0:moveToTaskGroup(slot0.dateIndex, true)
	slot0:initBottomPanel()
end

function slot0.initBottomPanel(slot0)
	slot0.bottomTaskGroupTFs = {}

	for slot4, slot5 in ipairs(slot0.configData) do
		slot0.bottomTaskGroupTFs[slot4] = cloneTplTo(slot0.bottomBTpl, slot0.bottomTaskGroups)

		slot0:updateBottomTaskGroup(slot4)
	end
end

function slot0.updateBottomTaskGroup(slot0, slot1)
	slot0.bottomTaskGroupTFs[slot1].GetComponent(slot2, typeof(Image)).sprite = GetSpriteFromAtlas("ui/anniversaryui_atlas", "part" .. slot1)
	slot0.bottomTaskGroupTFs[slot1].Find(slot2, "Image"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/anniversaryui_atlas", "h_part" .. slot1)

	triggerToggle(slot0.bottomTaskGroupTFs[slot1], _.all(slot5, function (slot0)
		return slot0:getTaskById(slot0) and slot1:isReceive()
	end))
end

function slot0.updateTaskGroups(slot0)
	for slot4, slot5 in ipairs(slot0.configData) do
		if slot0.taskGroupTFs[slot4] then
			slot0:updateTaskGroup(slot6, slot4, slot5)
		end
	end
end

function slot0.updateTaskGroup(slot0, slot1, slot2, slot3)
	slot4 = slot1:Find("mask_lock")
	slot5 = slot1:Find("mask_prev_unfinish")
	slot1:Find("icon"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/anniversaryui_atlas", "lihui" .. slot2)
	slot7 = slot0.date < slot2
	slot8 = false
	slot9 = false

	if slot7 then
		slot9 = slot0.activityVO.data1 + (slot2 - 1) * 86400 <= pg.TimeMgr.GetInstance():GetServerTime()

		setText(slot4:Find("Text"), pg.TimeMgr.GetInstance():CTimeDescC(slot11, "%m/%d"))
	else
		slot8 = _.all(slot3, function (slot0)
			return slot0:getTaskById(slot0) and slot1:isReceive()
		end)
	end

	setActive(slot4, slot7 and not slot9)
	setActive(slot5, slot7 and slot9)
	setActive(slot1:Find("completed"), slot8)
end

function slot0.updateTaskGroupDesc(slot0, slot1)
	slot5 = nil
	slot0:findTF("main/desc", slot0.taskGroupDesc).Find(slot3, "Image"):GetComponent(typeof(Image)).sprite = (not slot0.titles[slot1] or slot0.titles[slot1]) and GetSpriteFromAtlas("ui/anniversaryui_atlas", "title" .. slot1)

	setText(slot3, i18n("anniversary_task_title_" .. slot1))

	function slot8(slot0, slot1)
		setText(slot0:Find("name"), slot0:getTaskById(slot1) or Task.New({
			id = slot1
		}):getConfig("name"))
		setText(slot0:Find("desc"), slot0.getTaskById(slot1) or Task.New():getConfig("desc"))
		onButton(slot0, slot0:Find("confirm_btn"), function ()
			if slot0:isReceive() then
			elseif not slot0:isFinish() then
				slot1:emit(AnniversaryMediator.TO_TASK, slot1.emit)
			elseif slot0:isFinish() then
				slot1:emit(AnniversaryMediator.ON_SUBMIT_TASK, )
			end
		end, SFX_PANEL)
		setActive(slot0:Find("confirm_btn/go"), not slot0.getTaskById(slot1) or Task.New():isFinish())
		setActive(slot0:Find("confirm_btn/finished"), slot0.getTaskById(slot1) or Task.New():isReceive())
		setActive(slot0:Find("confirm_btn/get"), slot0.getTaskById(slot1) or Task.New():isFinish() and not slot0.getTaskById(slot1) or Task.New():isReceive())
		updateDrop(setActive, {
			type = slot0.getTaskById(slot1) or Task.New():getConfig("award_display")[1][1],
			id = slot0.getTaskById(slot1) or Task.New().getConfig("award_display")[1][2],
			count = slot0.getTaskById(slot1) or Task.New().getConfig("award_display")[1][3]
		})
		onButton(slot0, setActive, function ()
			if slot0[1] == DROP_TYPE_RESOURCE then
				slot0 = id2ItemId(slot0[2])
			elseif slot0[1] == DROP_TYPE_ITEM then
				slot0 = slot0[2]
			end

			if slot0 then
				slot1:emit(slot2.ON_ITEM, slot0)
			end
		end, SFX_PANEL)

		slot0:findTF("slider", slot0):GetComponent(typeof(Slider)).value = slot0.getTaskById(slot1) or Task.New():getProgress() / slot0.getTaskById(slot1) or Task.New():getConfig("target_num")

		setText(slot0:findTF("slider/Text", slot0), slot0.getTaskById(slot1) or Task.New():getProgress() .. "/" .. slot0.getTaskById(slot1) or Task.New():getConfig("target_num"))
	end

	slot0.ulist = UIItemList.New(slot0:findTF("main/task_list", slot0.taskGroupDesc), slot7)

	slot0.ulist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot0(slot2, slot1[slot1 + 1])
		end
	end)
	slot0.ulist:align(#slot0.configData[slot1])
end

function slot0.moveToTaskGroup(slot0, slot1, slot2, slot3)
	if slot3 then
		LeanTween.cancel(go(slot0.taskGroupDesc))
		LeanTween.cancel(go(slot0.taskGorupContainer))
	elseif LeanTween.isTweening(go(slot0.taskGroupDesc)) or LeanTween.isTweening(go(slot0.taskGorupContainer)) then
		return
	end

	function slot4()
		slot0.dateIndex = slot1
	end

	if slot0.date < slot1 then
		LeanTween.moveLocal(go(slot0.taskGorupContainer), Vector3(slot7, slot6, 0), 0.2):setOnComplete(System.Action(slot4))

		slot0.taskGroupDesc.localScale = Vector3(0, 1, 1)
		slot0.overStep = true

		if slot0.dateIndex then
			triggerToggle(slot0.taskGroupTFs[slot0.dateIndex], false)
		end
	else
		if slot2 or slot0.overStep then
			slot0.taskGroupDesc.localScale = Vector3(0, 1, 1)

			slot0:openAnim(slot1, slot4)
			slot0:updateTaskGroupDesc(slot1)
		elseif slot0.dateIndex then
			slot0:closeAnim(slot0.dateIndex, function ()
				slot0:openAnim(slot0, )

				slot0.openAnim.dateIndex = slot0

				slot0.openAnim:updateTaskGroupDesc(slot0.dateIndex)
			end)
		end

		slot0.overStep = nil
	end
end

function slot0.openAnim(slot0, slot1, slot2)
	slot4 = slot0.taskGroupTFs[slot1]
	slot6 = slot0.startPosition.y + (slot0:getRow(slot1) - 1) * slot0.offset.y
	slot7 = slot0.taskGorupContainer.localPosition.x

	table.insert(slot3, function (slot0)
		LeanTween.moveLocal(go(slot0.taskGorupContainer), Vector3(slot1, go(slot0.taskGorupContainer), 0), 0.2):setOnComplete(System.Action(slot0))
	end)
	table.insert(slot3, function (slot0)
		triggerToggle(slot0, true)
		LeanTween.rotate(go(slot0), Vector3(slot1, 0, slot2), 0.2):setFrom(Vector3(slot1, -180, slot0.eulerAngles.z)):setOnComplete(System.Action(slot0))
	end)
	table.insert(slot3, function (slot0)
		LeanTween.scale(slot0.taskGroupDesc, Vector3(1, 1, 1), 0.2):setFrom(Vector3(0, 1, 1)):setOnComplete(System.Action(slot0))

		slot0.taskGroupDesc.position = slot1.position

		slot0.taskGroupDesc:SetAsLastSibling()
		slot0.taskGroupDesc.SetAsLastSibling:SetAsLastSibling()
	end)
	seriesAsync({}, slot2)
end

function slot0.closeAnim(slot0, slot1, slot2)
	slot4 = slot0.taskGroupTFs[slot1]

	table.insert(slot3, function (slot0)
		LeanTween.scale(slot0.taskGroupDesc, Vector3(0, 1, 1), 0.2):setFrom(Vector3(1, 1, 1)):setOnComplete(System.Action(slot0))
	end)
	table.insert(slot3, function (slot0)
		LeanTween.rotate(go(slot0), Vector3(slot1, 0, slot2), 0.2):setFrom(Vector3(slot1, -180, slot0.eulerAngles.z)):setOnComplete(System.Action(slot0))
	end)
	table.insert(slot3, function (slot0)
		triggerToggle(slot0, false)
		slot0()
	end)
	seriesAsync({}, slot2)
end

function slot0.addVerticalDrag(slot0, slot1, slot2, slot3)
	slot4 = GetOrAddComponent(slot1, "EventTriggerListener")
	slot5 = nil
	slot6 = 0
	slot7 = 50

	slot4:AddBeginDragFunc(function ()
		slot0 = 0
		slot1 = nil
	end)
	slot4:AddDragFunc(function (slot0, slot1)
		slot2 = slot1.position

		if not slot0 then
			slot0 = slot2
		end

		slot1 = slot2.y - slot0.y
	end)
	slot4:AddDragEndFunc(function (slot0, slot1)
		if slot0 < -slot1 then
			if slot2 then
				slot2()
			end
		elseif slot1 < slot0 and slot3 then
			slot3()
		end
	end)
end

function slot0.willExit(slot0)
	return
end

return slot0
