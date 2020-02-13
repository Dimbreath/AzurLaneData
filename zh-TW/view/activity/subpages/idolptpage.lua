slot0 = class
slot1 = "IdolPTPage"
slot2 = import
slot3 = ".TemplatePage.PtTemplatePage"
slot0 = slot0(slot1, slot2(slot3))
slot1 = ActivityConst
slot1 = slot1.IDOL_INS_ID
slot0.LinkActivityID = slot1
slot1 = 300
slot0.RefreshTime = slot1

function slot1(slot0)
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.OnInit
	slot2 = slot0

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "list"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.lableList = slot1
	slot1 = {}
	slot0.lableItems = slot1
	slot1 = 0
	slot2 = slot0.lableList
	slot2 = slot2.childCount
	slot2 = slot2 - 1
	slot3 = 1

	for slot4 = slot1, slot2, slot3 do
		slot5 = table
		slot5 = slot5.insert
		slot6 = slot0.lableItems
		slot7 = slot0.lableList
		slot8 = slot7
		slot7 = slot7.GetChild
		slot9 = slot4

		slot5(slot6, slot7(slot8, slot9))
	end

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "btn_link"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.linkBtn = slot1
end

slot0.OnInit = slot1

function slot1(slot0)
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.OnDataSetting
	slot2 = slot0
	slot1 = slot1(slot2)
	slot2 = getProxy
	slot3 = ActivityProxy
	slot2 = slot2(slot3)
	slot3 = slot2
	slot2 = slot2.getActivityByType
	slot4 = ActivityConst
	slot4 = slot4.ACTIVITY_TYPE_INSTAGRAM
	slot2 = slot2(slot3, slot4)
	slot0.linkAct = slot2

	if slot2 then
		slot4 = slot2
		slot3 = slot2.isEnd
		slot3 = slot3(slot4)

		if not slot3 then
			slot4 = slot0.RefreshTime <= pg.TimeMgr.GetInstance():GetServerTime() - (getProxy(ActivityProxy).requestTime[slot2.id] or 0)

			if slot4 then
				slot6 = slot0
				slot5 = slot0.emit
				slot7 = ActivityMediator
				slot7 = slot7.FETCH_INSTARGRAM
				slot8 = {}
				slot9 = slot2.id
				slot8.activity_id = slot9

				slot5(slot6, slot7, slot8)
			end

			return slot4 or slot1
		end
	end

	return slot1
end

slot0.OnDataSetting = slot1

function slot1(slot0)
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
		slot2 = slot2.BATTLE_OPERA

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

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.linkBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.linkAct

		if slot0 then
			slot0 = slot0
			slot0 = slot0.linkAct
			slot1 = slot0
			slot0 = slot0.isEnd
			slot0 = slot0(slot1)

			if not slot0 then
				slot0 = slot0
				slot0 = slot0.linkAct
				slot1 = slot0
				slot0 = slot0.ExistMsg
				slot0 = slot0(slot1)

				if slot0 then
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.emit
					slot2 = ActivityMediator
					slot2 = slot2.OPEN_LAYER
					slot3 = Context
					slot3 = slot3.New
					slot4 = {}
					slot5 = InstagramLayer
					slot4.viewComponent = slot5
					slot5 = InstagramMediator
					slot4.mediator = slot5
					slot5 = {}
					slot6 = ActivityConst
					slot6 = slot6.IDOL_INS_ID
					slot5.id = slot6
					slot4.data = slot5

					slot0(slot1, slot2, slot3(slot4))
				end
			end
		else
			slot0 = pg
			slot0 = slot0.TipsMgr
			slot0 = slot0.GetInstance
			slot0 = slot0()
			slot1 = slot0
			slot0 = slot0.ShowTips
			slot2 = i18n
			slot3 = "challenge_end_tip"

			slot0(slot1, slot2(slot3))
		end
	end

	slot1(slot2, slot3, slot4)
end

slot0.OnFirstFlush = slot1

function slot1(slot0)
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.OnUpdateFlush
	slot2 = slot0

	slot1(slot2)

	slot1 = slot0.linkAct

	if slot1 then
		slot3 = slot1
		slot2 = slot1.isEnd
		slot2 = slot2(slot3)

		if not slot2 then
			slot2 = {}
			slot3 = math
			slot3 = slot3.floor
			slot4 = slot1.data1_list
			slot4 = #slot4
			slot4 = slot4 / 2
			slot3 = slot3(slot4)
			slot4 = 1
			slot5 = slot3
			slot6 = 1

			for slot7 = slot4, slot5, slot6 do
				slot2[slot1.data1_list[2 * slot7 - 1]] = (slot2[slot1.data1_list[2 * slot7 - 1]] or 0) + (slot1.data1_list[2 * slot7] or 0)
			end

			slot4 = {}
			slot5 = pairs
			slot6 = slot2
			slot5, slot6, slot7 = slot5(slot6)

			for slot8, slot9 in slot5, slot6, slot7 do
				slot10 = table
				slot10 = slot10.insert
				slot11 = slot4
				slot12 = {
					name = slot8,
					count = slot9
				}

				slot10(slot11, slot12)
			end

			slot5 = table
			slot5 = slot5.sort
			slot6 = slot4

			function slot7(slot0, slot1)
				slot2 = slot0.count
				slot3 = slot1.count

				if slot2 == slot3 then
					return slot0.name < slot1.name
				else
					return slot1.count < slot0.count
				end
			end

			slot5(slot6, slot7)

			slot5 = math
			slot5 = slot5.min
			slot6 = #slot4
			slot7 = slot0.lableItems
			slot7 = #slot7
			slot5 = slot5(slot6, slot7)
			slot6 = 1
			slot7 = slot5
			slot8 = 1

			for slot9 = slot6, slot7, slot8 do
				slot10 = slot0.lableItems
				slot10 = slot10[slot9]
				slot11 = setText
				slot13 = slot10
				slot12 = slot10.Find
				slot14 = "name"
				slot12 = slot12(slot13, slot14)
				slot13 = "#"
				slot14 = tostring
				slot15 = ShipGroup
				slot15 = slot15.getDefaultShipNameByGroupID
				slot16 = slot4[slot9]
				slot16 = slot16.name
				slot14 = slot14(slot15(slot16))
				slot15 = "#"
				slot13 = slot13 .. slot14 .. slot15

				slot11(slot12, slot13)

				slot11 = setText
				slot13 = slot10
				slot12 = slot10.Find
				slot14 = "Text"
				slot12 = slot12(slot13, slot14)
				slot14 = slot0
				slot13 = slot0.TransFormat
				slot15 = slot4[slot9]
				slot15 = slot15.count

				slot11(slot12, slot13(slot14, slot15))
			end

			slot6 = slot5 + 1
			slot7 = slot0.lableItems
			slot7 = #slot7
			slot8 = 1

			for slot9 = slot6, slot7, slot8 do
				slot10 = slot0.lableItems
				slot10 = slot10[slot9]
				slot11 = setText
				slot13 = slot10
				slot12 = slot10.Find
				slot14 = "name"
				slot12 = slot12(slot13, slot14)
				slot13 = ""

				slot11(slot12, slot13)

				slot11 = setText
				slot13 = slot10
				slot12 = slot10.Find
				slot14 = "Text"
				slot12 = slot12(slot13, slot14)
				slot13 = "0"

				slot11(slot12, slot13)
			end
		end
	end

	slot3 = slot0
	slot2 = slot0.GetWorldRank
	slot4 = slot0.RefreshTime

	slot2(slot3, slot4)
end

slot0.OnUpdateFlush = slot1

function slot1(slot0, slot1)
	slot2 = math.floor((tonumber(slot1) or 0) / 1000)
	slot3 = (tonumber(slot1) or 0) % 10
	slot4 = 1

	if slot2 >= slot4 then
		slot4 = slot2
		slot5 = 0

		if slot3 > slot5 then
			return slot4 .. ("." .. slot3 or "") .. "K"
		end
	else
		return slot1
	end
end

slot0.TransFormat = slot1

function slot1(slot0, slot1)
	slot2 = slot0.linkAct

	if slot2 then
		slot2 = slot0.linkAct
		slot3 = slot2
		slot2 = slot2.isEnd
		slot2 = slot2(slot3)

		if slot2 then
			return
		end
	end

	slot3 = pg.TimeMgr.GetInstance():GetServerTime() - (getProxy(ActivityProxy).requestTime[slot0.linkAct.id] or 0)

	if slot1 <= slot3 then
		slot4 = slot0
		slot3 = slot0.emit
		slot5 = ActivityMediator
		slot5 = slot5.FETCH_INSTARGRAM
		slot6 = {
			activity_id = slot2
		}

		slot3(slot4, slot5, slot6)
	end
end

slot0.GetWorldRank = slot1

function slot1()
	slot0 = getProxy
	slot1 = ActivityProxy
	slot0 = slot0(slot1)
	slot1 = slot0
	slot0 = slot0.getActivityById
	slot2 = ActivityConst
	slot2 = slot2.IDOL_PT_ID
	slot0 = slot0(slot1, slot2)

	if slot0 then
		slot2 = slot0
		slot1 = slot0.isEnd
		slot1 = slot1(slot2)

		if not slot1 then
			slot2 = slot0
			slot1 = slot0.readyToAchieve

			return slot1(slot2)
		end
	end
end

slot0.NeedTip = slot1

return slot0
