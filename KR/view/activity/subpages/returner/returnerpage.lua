slot0 = class("ReturnerPage")

function slot0.Ctor(slot0, slot1, slot2)
	pg.DelegateInfo.New(slot0)

	slot0._go = slot1
	slot0._tf = tf(slot1)
	slot0._event = slot2
	slot0.bg = slot0._tf:Find("bg"):GetComponent(typeof(Image))
	slot0.input = slot0._tf:Find("InputField")
	slot0.inputPlaceholder = slot0._tf:Find("InputField/Placeholder"):GetComponent(typeof(Text))
	slot0.confirmBtn = slot0._tf:Find("confim_btn")
	slot0.taskUIlist = UIItemList.New(slot0._tf:Find("task_list"), slot0._tf:Find("task_list/tpl"))
	slot0.totalProgress = slot0._tf:Find("total_progress"):GetComponent(typeof(Text))
	slot0.progress = slot0._tf:Find("progress"):GetComponent(typeof(Text))
	slot0.awrdOverviewBtn = slot0._tf:Find("award_overview")
	slot0.help = slot0._tf:Find("help")
	slot0.ptTxt = slot0._tf:Find("pt"):GetComponent(typeof(Text))
	slot0.matchBtn = slot0._tf:Find("match_btn")
	slot0.matchedBtn = slot0._tf:Find("matched_btn")

	slot0:Init()
end

function slot0.Init(slot0)
	onButton(slot0, slot0.confirmBtn, function ()
		if slot0.code ~= 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("return_have_participated_in_act"))

			return
		end

		if not getInputText(slot0.input) or slot0 == "" then
			return
		end

		slot0._event:emit(ActivityMediator.RETURN_AWARD_OP, {
			activity_id = slot0.activity.id,
			cmd = ActivityConst.RETURN_AWARD_OP_SET_RETRUNER,
			arg1 = tonumber(slot0)
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.awrdOverviewBtn, function ()
		slot0._event:emit(ActivityMediator.RETURN_AWARD_OP, {
			cmd = ActivityConst.RETURN_AWARD_OP_SHOW_RETURNER_AWARD_OVERVIEW,
			arg1 = {
				tasklist = slot0.config.task_list,
				ptId = pg.activity_template_headhunting[slot0.activity.id].pt,
				totalPt = slot0.pt
			}
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.matchBtn, function ()
		if slot0.code ~= 0 then
			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("returner_match_tip"),
			onYes = function ()
				slot0._event:emit(ActivityMediator.RETURN_AWARD_OP, {
					activity_id = slot0.activity.id,
					cmd = ActivityConst.RETURN_AWARD_OP_MATCH
				})
			end
		})
	end, SFX_PANEL)
end

function slot0.Update(slot0, slot1)
	slot0.activity = slot1

	slot0:UpdateData()

	if slot0:ShouldAcceptTasks() then
		slot0:AcceptTasks()
	else
		slot0:UpdateTasks()
	end

	if not (slot0.code ~= 0) then
		slot0.inputPlaceholder.text = i18n("input_returner_code")
	else
		slot0.inputPlaceholder.text = slot0.code

		setInputText(slot0.input, "")
	end

	slot0.input:GetComponent(typeof(InputField)).interactable = not slot2

	setActive(slot0.matchBtn, not slot2)
	setActive(slot0.matchedBtn, slot2)
end

function slot0.ShouldAcceptTasks(slot0)
	if slot0.code == 0 then
		return false
	end

	if slot0.taskIndex == 0 then
		return true
	end

	slot2 = getProxy(TaskProxy)

	return _.all(slot0.config.task_list[slot0.taskIndex], function (slot0)
		return slot0:getTaskById(slot0) == nil and slot0:getFinishTaskById(slot0) == nil
	end) or (_.all(slot0.config.task_list[slot0.taskIndex], function (slot0)
		return slot0:getFinishTaskById(slot0) ~= nil
	end) and not (slot0.taskIndex == #slot0.config.task_list) and function ()
		return slot0.taskIndex < slot0.day
	end())
end

function slot0.AcceptTasks(slot0)
	slot0._event:emit(ActivityMediator.RETURN_AWARD_OP, {
		activity_id = slot0.activity.id,
		cmd = ActivityConst.RETURN_AWARD_OP_RETURNER_GET_AWARD
	})
end

function slot0.UpdateData(slot0)
	slot0.config = pg.activity_template_returnner[slot0.activity.id]
	slot0.code = slot0.activity.data2
	slot0.pt = getProxy(PlayerProxy):getRawData():getResource(pg.activity_template_headhunting[slot0.activity.id].pt)
	slot0.taskIndex = slot0.activity.data4
	slot0.ptTxt.text = slot0.pt
	slot0.day = pg.TimeMgr.GetInstance():DiffDay(slot0.activity.getStartTime(slot1), pg.TimeMgr.GetInstance():GetServerTime()) + 1
end

function slot1(slot0, slot1, slot2)
	updateDrop(slot1:Find("item"), {
		type = slot2:getConfig("award_display")[1][1],
		id = slot2.getConfig("award_display")[1][2],
		count = slot2.getConfig("award_display")[1][3]
	})
	setText(slot1:Find("desc"), slot2:getConfig("desc"))
	setFillAmount(slot1:Find("slider"), slot2:getProgress() / slot2:getConfig("target_num"))
	setActive(slot4, not slot2:isFinish())
	setActive(slot1:Find("get"), slot2:isFinish() and not slot2:isReceive())
	setActive(slot1:Find("got"), slot2:isReceive())
	onButton(slot0, slot4, function ()
		slot0._event:emit(ActivityMediator.ON_TASK_GO, slot0._event)
	end, SFX_PANEL)
	onButton(slot0, slot5, function ()
		slot0._event:emit(ActivityMediator.ON_TASK_SUBMIT, slot0._event)
	end, SFX_PANEL)
end

function slot0.UpdateTasks(slot0)
	slot0.taskUIlist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot1(slot2, slot2, getProxy(TaskProxy):getTaskById(slot0[slot1 + 1]) or slot4:getFinishTaskById(slot3))
		end
	end)
	slot0.taskUIlist:align(#(slot0.config.task_list[slot0.taskIndex] or {}))

	slot0.totalProgress.text = #slot1
	slot0.progress.text = slot0.taskIndex
end

function slot0.Dispose(slot0)
	pg.DelegateInfo.Dispose(slot0)

	slot0.bg.sprite = nil
end

return slot0
