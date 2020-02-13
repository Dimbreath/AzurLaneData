slot0 = class
slot1 = "JPSkirmishHeadFramePage"
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
	slot3 = "GoBtn"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.goBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "GetBtn"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.getBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "GotBtn"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.gotBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "GotTag"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.gotTag = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Progress"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.progressBar = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ProgressText"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.progressText = slot1
	slot1 = setActive
	slot2 = slot0.goBtn
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.getBtn
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.gotBtn
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.gotTag
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.progressText
	slot3 = false

	slot1(slot2, slot3)
end

slot0.OnInit = slot1

function slot1(slot0)
	slot1 = slot0.ptData

	if slot1 then
		slot1 = slot0.ptData
		slot2 = slot1
		slot1 = slot1.Update
		slot3 = slot0.activity

		slot1(slot2, slot3)
	else
		slot1 = ActivityPtData
		slot1 = slot1.New
		slot2 = slot0.activity
		slot1 = slot1(slot2)
		slot0.ptData = slot1
	end
end

slot0.OnDataSetting = slot1

function slot1(slot0)
	slot1 = LoadImageSpriteAsync
	slot3 = slot0
	slot2 = slot0.GetBgImg
	slot2 = slot2(slot3)
	slot3 = slot0.bg

	slot1(slot2, slot3)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.goBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ActivityMediator
		slot2 = slot2.EVENT_GO_SCENE
		slot3 = SCENE
		slot3 = slot3.TASK

		slot0(slot1, slot2, slot3)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.getBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.ptData
		slot1 = slot0
		slot0 = slot0.GetResProgress
		slot0, slot1 = slot0(slot1)
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.emit
		slot4 = ActivityMediator
		slot4 = slot4.EVENT_PT_OPERATION
		slot5 = {
			cmd = 1
		}
		slot6 = slot0
		slot6 = slot6.ptData
		slot7 = slot6
		slot6 = slot6.GetId
		slot6 = slot6(slot7)
		slot5.activity_id = slot6
		slot5.arg1 = slot1

		slot2(slot3, slot4, slot5)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)
end

slot0.OnFirstFlush = slot1

function slot1(slot0)
	slot1 = getProxy
	slot2 = ActivityProxy
	slot1 = slot1(slot2)
	slot2 = slot1
	slot1 = slot1.getActivityById
	slot3 = ActivityConst
	slot3 = slot3.JP_SKIRMISH_EXP_ID
	slot1 = slot1(slot2, slot3)

	if slot1 then
		slot3 = slot1
		slot2 = slot1.isEnd
		slot2 = slot2(slot3)

		if slot2 then
			slot8, slot9, slot9 = slot0.ptData:GetResProgress()

			setText(slot0.progressText, setColorStr(slot2, "#487CFFFF") .. "/" .. slot3)
			setSlider(slot0.progressBar, 0, 1, slot4)
			setActive(slot0.progressText, true)

			slot6 = slot0.ptData:CanGetNextAward()

			setActive(slot0.goBtn, slot0.ptData:CanGetMorePt() and not slot0.ptData:CanGetAward() and slot6)
			setActive(slot0.getBtn, slot5)
			setActive(slot0.gotBtn, not slot6)
			setActive(slot0.gotTag, not slot6)
		end
	end
end

slot0.OnUpdateFlush = slot1

function slot1(slot0)
	return
end

slot0.OnDestroy = slot1

return slot0
