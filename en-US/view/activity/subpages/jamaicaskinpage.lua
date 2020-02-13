slot0 = class
slot1 = "JamaicaSkinPage"
slot2 = import
slot3 = "...base.BaseActivityPage"
slot0 = slot0(slot1, slot2(slot3))

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "AD"
	slot1 = slot1(slot2, slot3)
	slot0.bg = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "slider"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.slider = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "step"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.step = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "progress"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.progress = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "award"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.awardTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "battle_btn"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.battleBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "get_btn"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.getBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "got_btn"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.gotBtn = slot1
end

slot0.OnInit = slot1

function slot1(slot0)
	slot1 = slot0.activity
	slot2 = slot1
	slot1 = slot1.getConfig
	slot3 = "config_data"
	slot1 = slot1(slot2, slot3)
	slot2 = _
	slot2 = slot2.flatten
	slot3 = slot1
	slot2 = slot2(slot3)
	slot0.taskIDList = slot2
	slot2 = {}
	slot0.dropList = slot2
	slot2 = {}
	slot0.descs = slot2
	slot2 = ipairs
	slot3 = slot0.taskIDList
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7 = pg
		slot7 = slot7.task_data_template
		slot7 = slot7[slot6]
		slot7 = slot7.award_display
		slot7 = slot7[1]
		slot8 = table
		slot8 = slot8.insert
		slot9 = slot0.dropList
		slot10 = Clone
		slot11 = slot7

		slot8(slot9, slot10(slot11))

		slot8 = pg
		slot8 = slot8.task_data_template
		slot8 = slot8[slot6]
		slot8 = slot8.desc
		slot9 = table
		slot9 = slot9.insert
		slot10 = slot0.descs
		slot11 = slot8

		slot9(slot10, slot11)
	end

	slot2 = updateActivityTaskStatus
	slot3 = slot0.activity

	return slot2(slot3)
end

slot0.OnDataSetting = slot1

function slot1(slot0)
	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.battleBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ActivityMediator
		slot2 = slot2.SPECIAL_BATTLE_OPERA

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.getBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ActivityMediator
		slot2 = slot2.ON_TASK_SUBMIT
		slot3 = slot0
		slot3 = slot3.curTaskVO

		slot0(slot1, slot2, slot3)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)
end

slot0.OnFirstFlush = slot1

function slot1(slot0)
	slot1 = getActivityTask
	slot2 = slot0.activity
	slot1, slot2 = slot1(slot2)
	slot0.curTaskVO = slot2
	slot4 = slot2
	slot3 = slot2.getConfig
	slot5 = "award_display"
	slot3 = slot3(slot4, slot5)
	slot3 = slot3[1]
	slot4 = {}
	slot5 = slot3[1]
	slot4.type = slot5
	slot5 = slot3[2]
	slot4.id = slot5
	slot5 = slot3[3]
	slot4.count = slot5
	slot5 = updateDrop
	slot6 = slot0.awardTF
	slot7 = slot4

	slot5(slot6, slot7)

	slot5 = onButton
	slot6 = slot0
	slot7 = slot0.awardTF

	function slot8()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = BaseUI
		slot2 = slot2.ON_DROP
		slot3 = slot1

		slot0(slot1, slot2, slot3)
	end

	slot9 = SFX_PANEL

	slot5(slot6, slot7, slot8, slot9)

	slot6 = slot2
	slot5 = slot2.getProgress
	slot5 = slot5(slot6)
	slot7 = slot2
	slot6 = slot2.getConfig
	slot8 = "target_num"
	slot6 = slot6(slot7, slot8)
	slot7 = setText
	slot8 = slot0.progress

	if slot6 <= slot5 then
		slot7(slot8, (setColorStr(slot5, COLOR_GREEN) or slot5) .. "/" .. slot6)
		setSlider(slot0.slider, 0, slot6, slot5)
		setText(slot0.step, slot7 .. "/" .. #slot0.taskIDList)

		slot8 = slot2:getTaskStatus()

		setActive(slot0.battleBtn, slot8 == 0)
		setActive(slot0.getBtn, slot8 == 1)
		setActive(slot0.gotBtn, slot8 == 2)

		if slot8 == 2 then
			slot0.finishedIndex = slot7
		else
			slot9 = slot7 - 1
			slot0.finishedIndex = slot9
		end
	end
end

slot0.OnUpdateFlush = slot1

function slot1(slot0)
	return
end

slot0.OnDestroy = slot1

return slot0
