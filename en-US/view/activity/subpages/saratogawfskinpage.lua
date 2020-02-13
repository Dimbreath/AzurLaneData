slot0 = class
slot1 = "SaratogaWFSkinPage"
slot2 = import
slot3 = ".TemplatePage.PtTemplatePage"
slot0 = slot0(slot1, slot2(slot3))

function slot1(slot0)
	slot1 = LoadImageSpriteAsync
	slot3 = slot0
	slot2 = slot0.GetBgImg
	slot2 = slot2(slot3)
	slot3 = slot0.bg

	slot1(slot2, slot3)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.displayBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ActivityMediator
		slot2 = slot2.SHOW_AWARD_WINDOW
		slot3 = PtAwardWindow
		slot4 = {}
		slot5 = slot0
		slot5 = slot5.ptData
		slot5 = slot5.type
		slot4.type = slot5
		slot5 = slot0
		slot5 = slot5.ptData
		slot5 = slot5.dropList
		slot4.dropList = slot5
		slot5 = slot0
		slot5 = slot5.ptData
		slot5 = slot5.targets
		slot4.targets = slot5
		slot5 = slot0
		slot5 = slot5.ptData
		slot5 = slot5.level
		slot4.level = slot5
		slot5 = slot0
		slot5 = slot5.ptData
		slot5 = slot5.count
		slot4.count = slot5
		slot5 = slot0
		slot5 = slot5.ptData
		slot5 = slot5.resId
		slot4.resId = slot5

		slot0(slot1, slot2, slot3, slot4)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

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
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.OnUpdateFlush
	slot2 = slot0

	slot1(slot2)

	slot1 = slot0.ptData
	slot2 = slot1
	slot1 = slot1.GetResProgress
	slot1, slot2, slot3 = slot1(slot2)
	slot4 = setText
	slot5 = slot0.progress
	slot6 = setColorStr
	slot7 = slot1
	slot8 = "#F294B8FF"
	slot6 = slot6(slot7, slot8)
	slot7 = "/"
	slot8 = slot2
	slot6 = slot6 .. slot7 .. slot8

	slot4(slot5, slot6)
end

slot0.OnUpdateFlush = slot1

return slot0
