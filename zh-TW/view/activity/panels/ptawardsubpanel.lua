slot0 = class
slot1 = "PtAwardSubPanel"
slot2 = import
slot3 = "view.base.BaseSubPanel"
slot0 = slot0(slot1, slot2(slot3))

function slot1(slot0)
	slot1 = "ActivitybonusWindow_btnVer"

	return slot1
end

slot0.GetUIName = slot1

function slot1(slot0)
	slot1 = UIItemList
	slot1 = slot1.New
	slot2 = slot0._tf
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "window/panel/list"
	slot2 = slot2(slot3, slot4)
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/panel/list/item"
	slot1 = slot1(slot2, slot3(slot4, slot5))
	slot0.UIlist = slot1
	slot1 = slot0._tf
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "window/pt/Text"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.totalTxt = slot1
	slot1 = slot0._tf
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "window/pt/title"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.totalTitleTxt = slot1
	slot1 = slot0._tf
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "window/top/btnBack"
	slot1 = slot1(slot2, slot3)
	slot0.closeBtn = slot1
	slot1 = slot0._tf
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "window/btn_banned"
	slot1 = slot1(slot2, slot3)
	slot0.btn_banned = slot1
	slot1 = slot0._tf
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "window/btn_get"
	slot1 = slot1(slot2, slot3)
	slot0.btn_get = slot1
	slot1 = slot0._tf
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "window/btn_got"
	slot1 = slot1(slot2, slot3)
	slot0.btn_got = slot1
	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "bg_dark"
	slot3 = slot3(slot4, slot5)

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.Hide

		slot0(slot1)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.closeBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.Hide

		slot0(slot1)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.btn_get

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

slot0.OnInit = slot1

function slot1(slot0, slot1)
	slot0.ptData = slot1
	slot2 = slot1.dropList
	slot3 = slot1.targets
	slot4 = slot1.level
	slot5 = slot1.count
	slot6 = slot1.resId
	slot7 = pg
	slot7 = slot7.item_data_statistics
	slot8 = id2ItemId
	slot9 = slot6
	slot8 = slot8(slot9)
	slot7 = slot7[slot8]
	slot7 = slot7.name
	slot8 = slot1.type

	if slot8 == 2 then
		slot9 = i18n
		slot10 = "pt_count"
		slot11 = i18n
		slot12 = "pt_cosume"
		slot13 = slot7
		slot9 = slot9(slot10, slot11(slot12, slot13))
		slot10 = i18n
		slot11 = "pt_total_count"
		slot12 = i18n
		slot13 = "pt_cosume"
		slot14 = slot7
		slot10 = slot10(slot11, slot12(slot13, slot14))
		slot0.cntTitle = slot10
		slot0.resTitle = slot9
	else
		slot9 = i18n
		slot10 = "pt_count"
		slot11 = slot7
		slot9 = slot9(slot10, slot11)
		slot10 = i18n
		slot11 = "pt_total_count"
		slot12 = slot7
		slot10 = slot10(slot11, slot12)
		slot0.cntTitle = slot10
		slot0.resTitle = slot9
	end

	slot9 = slot0.ptData
	slot10 = slot9
	slot9 = slot9.CanGetAward
	slot9 = slot9(slot10)
	slot10 = slot0.ptData
	slot11 = slot10
	slot10 = slot10.GetBossProgress
	slot10 = slot10(slot11)
	slot11 = setActive
	slot12 = slot0.btn_get
	slot13 = slot9

	slot11(slot12, slot13)

	slot11 = setActive
	slot12 = slot0.btn_banned
	slot13 = not slot9

	slot11(slot12, slot13)

	slot12 = slot0
	slot11 = slot0.UpdateList
	slot13 = slot2
	slot14 = slot3
	slot15 = slot4
	slot16 = slot10

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = Canvas
	slot11 = slot11.ForceUpdateCanvases

	slot11()
end

slot0.UpdateView = slot1

function slot1(slot0, slot1, slot2, slot3)
	slot4 = slot0.UIlist
	slot5 = slot4
	slot4 = slot4.make

	function slot6(slot0, slot1, slot2)
		slot3 = UIItemList
		slot3 = slot3.EventUpdate

		if slot0 == slot3 then
			setText(slot2:Find("title/Text"), "PHASE " .. slot1 + 1)
			setText(slot2:Find("target/Text"), slot4)
			setText(slot2:Find("target/title"), slot2.resTitle)
			updateDrop(slot2:Find("award"), slot5, {
				hideName = true
			})
			onButton(slot2, slot2:Find("award"), function ()
				slot0:emit(BaseUI.ON_DROP, slot0)
			end, SFX_PANEL)
			setActive(slot2:Find("award/mask"), slot1 + 1 <= slot0[slot1 + 1])
		end
	end

	slot4(slot5, slot6)

	slot4 = slot0.UIlist
	slot5 = slot4
	slot4 = slot4.align
	slot6 = #slot1

	slot4(slot5, slot6)
end

slot0.UpdateList = slot1

return slot0
