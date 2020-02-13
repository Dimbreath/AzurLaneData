slot0 = class("MikasaRepairePage", import("...base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.layer = slot0:findTF("layer")
end

function slot0.OnFirstFlush(slot0)
	return
end

function slot0.OnUpdateFlush(slot0)
	slot0:update_task_list_mikasa_museum(slot0.activity, slot0.layer, 1)
end

function slot0.update_task_list_mikasa_museum(slot0, slot1, slot2, slot3)
	slot4 = getProxy(TaskProxy)
	slot5 = slot1:getConfig("config_data")
	slot6 = getProxy(ActivityProxy)
	slot7 = slot2:Find("AD")

	onButton(slot0, slot9, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.word_museum_help.tip
		})
	end, SFX_PANEL)

	slot10, slot11, slot12 = nil
	slot13 = {}
	slot14, slot15 = nil

	for slot19 = 1, 4, 1 do
		slot12 = slot0:findTF("btn_repair", slot10)
		slot13[slot19] = nil

		for slot23 = 1, 4, 1 do
			slot0:set_mikasa_btn(slot5[(slot19 - 1) * 4 + slot23], slot0:findTF("repair" .. slot23, slot10), (slot23 == 1 and 0) or slot5[((slot19 - 1) * 4 + slot23) - 1], slot23 >= 4)

			if not slot13[slot19] then
				slot13[slot19] = (slot4:getTaskById(slot14) and slot14) or nil
			end
		end

		setActive(slot10:Find("line1/unselected"), not slot4:getTaskById(slot5[(slot19 - 1) * 4 + 1]) or slot4:getFinishTaskById(slot14):isReceive())
		setActive(slot10:Find("line1/selected"), slot4.getTaskById(slot5[(slot19 - 1) * 4 + 1]) or slot4.getFinishTaskById(slot14):isReceive())
		setActive(slot10:Find("line2/unselected"), not slot4:getTaskById(slot5[(slot19 - 1) * 4 + 2]) or slot4:getFinishTaskById(slot14):isReceive())
		setActive(slot10:Find("line2/selected"), slot4.getTaskById(slot5[(slot19 - 1) * 4 + 2]) or slot4.getFinishTaskById(slot14):isReceive())
		setActive(slot10:Find("to_award/unselected"), not slot4:getTaskById(slot5[(slot19 - 1) * 4 + 3]) or slot4:getFinishTaskById(slot14):isReceive())
		setActive(slot10:Find("to_award/selected"), slot4.getTaskById(slot5[(slot19 - 1) * 4 + 3]) or slot4.getFinishTaskById(slot14):isReceive())

		slot12:GetComponent(typeof(Image)).enabled = not slot4:getTaskById(slot5[slot19 * 4]) or slot4:getFinishTaskById(slot14):isFinish()

		setActive(slot12:Find("get"), slot4.getTaskById(slot5[slot19 * 4]) or slot4.getFinishTaskById(slot14):isFinish() and not slot4.getTaskById(slot5[slot19 * 4]) or slot4.getFinishTaskById(slot14):isReceive())
		setActive(slot12:Find("got"), slot4.getTaskById(slot5[slot19 * 4]) or slot4.getFinishTaskById(slot14):isReceive())
		onButton(slot0, slot12, function ()
			slot0:emit(ActivityMediator.ON_TASK_SUBMIT, slot1:getTaskById(slot2[slot1.getTaskById]))
		end, SFX_PANEL)
		setActive(slot10:Find("gear"), not slot4.getTaskById(slot5[slot19 * 4]) or slot4.getFinishTaskById(slot14):isFinish())

		if not slot15:isFinish() then
			slot20 = slot4:getTaskById(slot13[slot19])

			setText(slot10:Find("gear/test_bg/Text"), slot21 .. "/" .. slot20:getConfig("target_num"))
		end

		setButtonEnabled(slot12, ((slot13[slot19] and (slot4:getTaskById(slot14) or slot4:getFinishTaskById(slot14))) or nil) and (slot13[slot19] and (slot4.getTaskById(slot14) or slot4.getFinishTaskById(slot14))) or nil:isFinish())
		setActive(slot12:Find("mask"), ((slot13[slot19] and (slot4.getTaskById(slot14) or slot4.getFinishTaskById(slot14))) or nil) and (slot13[slot19] and (slot4.getTaskById(slot14) or slot4.getFinishTaskById(slot14))) or nil:isFinish())
	end

	slot12 = slot8:Find("btn_main")
	slot12:GetComponent(typeof(Image)).enabled = not slot4:getTaskById(slot5[#slot5]) or slot4:getFinishTaskById(slot14):isFinish()

	setActive(slot12:Find("get"), slot4.getTaskById(slot5[#slot5]) or slot4.getFinishTaskById(slot14):isFinish() and not slot4.getTaskById(slot5[#slot5]) or slot4.getFinishTaskById(slot14):isReceive())
	setActive(slot12:Find("got"), slot4.getTaskById(slot5[#slot5]) or slot4.getFinishTaskById(slot14):isReceive())
	onButton(slot0, slot12, function ()
		if not slot0:isFinish() then
			slot0 = slot1:getActivityById(ActivityConst.MIKASA_DAILY_TASK_ACTIVITY)
			slot1 = pg.TimeMgr.GetInstance()

			if _.all(_.flatten({
				slot0:getConfig("config_data")[math.clamp(slot1:DiffDay(slot0.data1, slot1:GetServerTime()) + 1, 1, #slot0:getConfig("config_data"))]
			}), function (slot0)
				return slot0:getFinishTaskById(slot0) ~= nil
			end) then
				pg.TipsMgr:GetInstance():ShowTips(i18n("word_museum_1"))
			else
				slot3:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK, {
					page = "activity"
				})
			end
		else
			slot3:emit(ActivityMediator.ON_TASK_SUBMIT, slot3.emit)
		end
	end, SFX_PANEL)
	setButtonEnabled(slot12, not slot4.getTaskById(slot5[#slot5]) or slot4.getFinishTaskById(slot14):isReceive())
	slot0:set_mikasa_btn(slot14, slot11, 0, true, slot1:getConfig("config_client").story)

	for slot19 = 1, 4, 1 do
		setActive(slot8:Find("repair_phase/point" .. slot19), slot19 <= slot15:getProgress())

		if slot19 > 1 then
			setActive(slot8:Find("repair_phase/line" .. slot19 - 1), slot19 <= slot15:getProgress())
		end
	end

	setText(slot8:Find("repair_phase/Text"), slot15:getProgress() .. "/4")
end

function slot0.set_mikasa_btn(slot0, slot1, slot2, slot3, slot4, slot5)
	slot7 = getProxy(TaskProxy):getTaskById(slot1) or slot6:getFinishTaskById(slot1)
	slot8 = slot2:Find("award")
	slot9 = slot2:Find("face")

	if slot4 then
		setActive(slot8, true)
		setActive(slot9, false)
		setActive(slot8, slot11)
		updateDrop(slot8, slot12)
		onButton(slot0, slot8, function ()
			slot0:emit(BaseUI.ON_DROP, slot0)
		end, SFX_PANEL)
		setActive(slot8:Find("mask"), slot7:isReceive())
		setActive(slot8:Find("black_block"), slot7:isReceive())
		setActive(slot2:Find("Text"), false)
	else
		setActive(slot8, false)
		setActive(slot9, true)
		setActive(slot9:Find("bg_select"), slot3 == 0 or slot6:getFinishTaskById(slot3))
		setActive(slot9:Find("mask"), slot6:getFinishTaskById(slot1))
		setActive(slot9:Find("black_block"), slot6:getFinishTaskById(slot1))
	end

	if slot7:getConfig("sub_type") == TASK_SUB_TYPE_FROM_TASKS and slot5 then
		for slot13, slot14 in ipairs(slot5) do
			if slot14[1] == slot1 and slot14[2] == slot7:getProgress() and not slot0.player:IsPlayed(slot14[3]) then
				pg.StoryMgr.GetInstance():Play(slot14[3])

				break
			end
		end
	end
end

return slot0
