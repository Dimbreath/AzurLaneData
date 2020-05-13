slot0 = class("GuildTaskLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "GuildTaskUI"
end

function slot0.setTaskList(slot0, slot1)
	slot0.taskList = slot1
end

function slot0.init(slot0)
	slot0.taskTpl = slot0:getTpl("bg/frame/content/task_tpl")
	slot0.awardModel = slot0:getTpl("frame/right_panel/rewards_panel/itemtpl", slot0.taskTpl)
	slot0.taskContainer = slot0:findTF("bg/frame/content")
	slot0.mainPanel = slot0:findTF("bg")
	slot0.topPanel = slot0:findTF("bg/top")
	slot0.mainLayer = pg.UIMgr.GetInstance().UIMain
end

function slot0.didEnter(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
	slot0:displayTasks()
	onButton(slot0, slot0:findTF("btnBack", slot0.topPanel), function ()
		uv0:emit(uv1.ON_CLOSE)
	end, SOUND_BACK)
	onButton(slot0, slot0._tf, function ()
		uv0:emit(uv1.ON_CLOSE)
	end, SOUND_BACK)
end

function slot0.displayTasks(slot0)
	slot0.taskTFs = {}

	for slot4, slot5 in pairs(slot0.taskList) do
		slot0.taskTFs[slot5.id] = cloneTplTo(slot0.taskTpl, slot0.taskContainer)

		slot0:updateTask(slot5)
	end
end

function slot0.updateTask(slot0, slot1)
	slot2 = slot1.id
	slot3 = slot0.taskTFs[slot2]
	slot4 = 0
	slot0.taskList[slot2] = slot1
	slot5 = slot3.transform:Find("frame/left_panel")

	setText(slot5:Find("task_name"), slot1:getConfig("name"))
	setText(slot5:Find("task_desc"), slot1:getConfig("desc"))
	removeAllChildren(slot3.transform:Find("frame/right_panel"):Find("rewards_panel"))

	for slot13 = 1, math.min(#slot1:getConfig("award_display"), 3) do
		slot14 = slot8[slot13]

		updateDrop(cloneTplTo(slot0.awardModel, slot7), {
			type = slot14[1],
			id = slot14[2],
			count = slot14[3]
		})
	end

	slot10 = slot1:getConfig("target_num")
	slot11 = slot5:Find("progress_frame")
	slot12 = slot5:Find("progress_frame/Fill"):GetComponent(typeof(Slider))
	slot13 = slot5:Find("progress_frame/label")
	slot14 = slot6:Find("GetBtn/finish_tag") or slot6:Find("finish_tag")
	slot15 = slot6:Find("GotoBtn")
	slot16 = slot6:Find("GetBtn")
	slot17 = slot6:Find("isGet")

	if slot1:isFinish() then
		if slot1:hasFetched() then
			slot4 = 3

			slot3:SetAsLastSibling()
		else
			slot4 = 2

			onButton(slot0, slot16, function ()
				uv0:emit(GuildTaskMediator.ON_TASK_SUBMIT, uv1)
			end, SFX_PANEL)
			slot3:SetAsFirstSibling()
		end
	else
		slot4 = 1

		onButton(slot0, slot15, function ()
			pg.TipsMgr.GetInstance():ShowTips(i18n("get_award_erro"))
		end, SFX_PANEL)
	end

	setText(slot13, slot1.progress .. "/" .. slot10)

	slot12.value = slot1.progress / slot10

	SetActive(slot15, slot4 == 1)
	SetActive(slot16, slot4 == 2)
	SetActive(slot17, slot4 == 3)
	SetActive(slot13, slot4 == 1)
	SetActive(slot14, slot4 == 2 or slot4 == 3)
	SetActive(slot5:Find("progress_frame/finish_img"), slot4 == 2 or slot4 == 3)
	SetActive(slot3:Find("frame/isGet_panel"), slot4 == 3)
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0.mainLayer)
end

return slot0
