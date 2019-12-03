slot0 = class("USDefTaskWindowView", import("...base.BaseSubView"))

function slot0.getUIName(slot0)
	return "USDefTaskWindow"
end

function slot0.OnInit(slot0)
	slot0:initData()
	slot0:initUI()
	slot0:updateProgress()
	slot0:updateTaskList()
	slot0:Show()
end

function slot0.OnDestroy(slot0)
	return
end

function slot0.OnBackPress(slot0)
	return
end

function slot0.initData(slot0)
	slot0.taskIDList = Clone(pg.task_data_template[slot0.contextData:getConfig("config_client")[1]].target_id)
	slot0.taskProxy = getProxy(TaskProxy)
	slot0.taskVOList = {}

	for slot5, slot6 in ipairs(slot0.taskIDList) do
		table.insert(slot0.taskVOList, slot0.taskProxy:getTaskVO(slot6))
	end
end

function slot0.initUI(slot0)
	slot0.bg = slot0:findTF("BG")
	slot0.curNumTextTF = slot0:findTF("ProgressPanel/CurNumText")
	slot0.totalNumText = slot0:findTF("ProgressPanel/TotalNumText")
	slot0.taskTpl = slot0:findTF("TaskTpl")
	slot0.taskContainer = slot0:findTF("TaskList/Viewport/Content")
	slot0.taskList = UIItemList.New(slot0.taskContainer, slot0.taskTpl)

	onButton(slot0, slot0.bg, function ()
		slot0:Destroy()
	end, SFX_CANCEL)
end

function slot0.updateProgress(slot0)
	slot1 = #slot0.taskIDList
	slot2 = 0

	for slot6, slot7 in ipairs(slot0.taskVOList) do
		if slot7:getTaskStatus() >= 1 then
			slot2 = slot2 + 1
		end
	end

	setText(slot0.curNumTextTF, string.format("%2d", slot2))
	setText(slot0.totalNumText, string.format("%2d", slot1))
end

function slot0.updateTaskList(slot0)
	slot0.taskList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot7 = slot0:findTF("ItemBG/Icon", slot2)
			slot8 = slot0:findTF("ItemBG/Finished", slot2)

			setText(slot4, string.format("%02d", slot1))
			setText(slot5, "TASK-" .. string.format("%02d", slot1 + 1))
			setText(slot6, slot9)

			if not pg.ship_data_statistics[slot0.taskVOList[slot1 + 1].getConfig(slot3, "target_id_for_client")] then
				slot10 = 205054
			end

			LoadImageSpriteAsync("SquareIcon/" .. slot12, slot7)
			setActive(slot8, slot3:getTaskStatus() >= 1)
		end
	end)
	slot0.taskList:align(#slot0.taskIDList)
end

return slot0
