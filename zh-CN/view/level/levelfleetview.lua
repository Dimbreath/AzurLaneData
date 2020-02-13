slot0 = class
slot1 = "LevelFleetView"
slot2 = import
slot3 = "..base.BaseSubView"
slot0 = slot0(slot1, slot2(slot3))
slot1 = {
	vanguard = 1,
	submarine = 3,
	main = 2
}

function slot2(slot0)
	slot1 = "LevelFleetSelectView"

	return slot1
end

slot0.getUIName = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.InitUI

	slot1(slot2)

	slot1 = setActive
	slot2 = slot0._tf
	slot3 = true

	slot1(slot2, slot3)

	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.BlurPanel
	slot3 = slot0._tf

	slot1(slot2, slot3)
end

slot0.OnInit = slot2

function slot2(slot0)
	slot1 = nil
	slot0.onConfirm = slot1
	slot1 = nil
	slot0.onCancel = slot1
	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.UnblurPanel
	slot3 = slot0._tf
	slot4 = slot0._parentTF

	slot1(slot2, slot3, slot4)
end

slot0.OnDestroy = slot2

function slot2(slot0, slot1)
	slot0.openedCommanerSystem = slot1
end

slot0.setOpenCommanderTag = slot2

function slot2(slot0, slot1, slot2)
	slot0.onConfirm = slot1
	slot0.onCancel = slot2
end

slot0.setCBFunc = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/shiptpl"
	slot1 = slot1(slot2, slot3)
	slot0.tfShipTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/emptytpl"
	slot1 = slot1(slot2, slot3)
	slot0.tfEmptyTpl = slot1
	slot1 = {}
	slot2 = FleetType
	slot2 = slot2.Normal
	slot3 = {}
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "panel/fleet/1"
	slot4 = slot4(slot5, slot6)
	slot3[1] = slot4
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "panel/fleet/2"
	slot3[MULTRES] = slot4(slot5, slot6)
	slot1[slot2] = slot3
	slot2 = FleetType
	slot2 = slot2.Submarine
	slot3 = {}
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "panel/sub/1"
	slot3[MULTRES] = slot4(slot5, slot6)
	slot1[slot2] = slot3
	slot0.tfFleets = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/limit"
	slot1 = slot1(slot2, slot3)
	slot0.tfLimit = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/limit_tip"
	slot1 = slot1(slot2, slot3)
	slot0.tfLimitTips = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/limit_elite"
	slot1 = slot1(slot2, slot3)
	slot0.tfLimitElite = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/limit_elite/limit_list"
	slot1 = slot1(slot2, slot3)
	slot0.tfLimitContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/limit_elite/condition"
	slot1 = slot1(slot2, slot3)
	slot0.tfLimitTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/btnBack"
	slot1 = slot1(slot2, slot3)
	slot0.btnBack = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/start_button"
	slot1 = slot1(slot2, slot3)
	slot0.btnGo = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/title/ASvalue"
	slot1 = slot1(slot2, slot3)
	slot0.btnASHelp = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/commander_btn"
	slot1 = slot1(slot2, slot3)
	slot0.commanderToggle = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/formation_btn"
	slot1 = slot1(slot2, slot3)
	slot0.formationToggle = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "mask"
	slot1 = slot1(slot2, slot3)
	slot0.toggleMask = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "mask/list"
	slot1 = slot1(slot2, slot3)
	slot0.toggleList = slot1
	slot1 = {}
	slot0.toggles = slot1
	slot1 = 0
	slot2 = slot0.toggleList
	slot2 = slot2.childCount
	slot2 = slot2 - 1
	slot3 = 1

	for slot4 = slot1, slot2, slot3 do
		slot5 = table
		slot5 = slot5.insert
		slot6 = slot0.toggles
		slot7 = slot0.toggleList
		slot8 = slot7
		slot7 = slot7.Find
		slot9 = "item"
		slot10 = slot4 + 1
		slot9 = slot9 .. slot10

		slot5(slot6, slot7(slot8, slot9))
	end

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/sp"
	slot1 = slot1(slot2, slot3)
	slot0.btnSp = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "mask_sp"
	slot1 = slot1(slot2, slot3)
	slot0.spMask = slot1
	slot1 = setActive
	slot2 = slot0.tfShipTpl
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.tfEmptyTpl
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.tfLimitTpl
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.toggleMask
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.btnSp
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.spMask
	slot3 = false

	slot1(slot2, slot3)
end

slot0.InitUI = slot2

function slot2(slot0, slot1, slot2, slot3)
	slot0.chapter = slot1
	slot0.selects = slot3
	slot0.chapterASValue = slot0.chapter:getConfig("air_dominance")
	slot0.suggestionValue = slot0.chapter:getConfig("best_air_dominance")
	slot0.fleets = _(_.values(slot2)):chain():filter(function (slot0)
		return slot0:isRegularFleet()
	end):sort(function (slot0, slot1)
		return slot0.id < slot1.id
	end):value()
	slot0.selectIds = {
		[FleetType.Normal] = {},
		[FleetType.Submarine] = {}
	}
	slot4 = ipairs
	slot5 = slot3 or {}
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot10 = slot0
		slot9 = slot0.getFleetById
		slot11 = slot8
		slot9 = slot9(slot10, slot11)

		if slot9 then
			slot11 = slot9
			slot10 = slot9.getFleetType
			slot10 = slot10(slot11)
			slot11 = slot0.selectIds
			slot11 = slot11[slot10]
			slot12 = #slot11
			slot14 = slot0
			slot13 = slot0.getLimitNums
			slot15 = slot10
			slot13 = slot13(slot14, slot15)

			if slot12 < slot13 then
				slot12 = table
				slot12 = slot12.insert
				slot13 = slot11
				slot14 = slot8

				slot12(slot13, slot14)
			end
		end
	end

	slot4 = setActive
	slot5 = slot0.tfLimitElite
	slot6 = false

	slot4(slot5, slot6)

	slot4 = setActive
	slot5 = slot0.tfLimitTips
	slot6 = false

	slot4(slot5, slot6)

	slot4 = setActive
	slot5 = slot0.tfLimit
	slot6 = true

	slot4(slot5, slot6)

	slot4 = onButton
	slot5 = slot0
	slot6 = slot0.btnGo

	function slot7()
		slot0 = slot0
		slot0 = slot0.onConfirm

		if slot0 then
			slot0 = slot0
			slot0 = slot0.onConfirm
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.getSelectIds

			slot0(slot1(slot2))
		end
	end

	slot8 = SFX_UI_WEIGHANCHOR_GO

	slot4(slot5, slot6, slot7, slot8)

	slot4 = onButton
	slot5 = slot0
	slot6 = slot0.btnASHelp

	function slot7()
		slot0 = pg
		slot0 = slot0.MsgboxMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.ShowMsgBox
		slot2 = {}
		slot3 = MSGBOX_TYPE_HELP
		slot2.type = slot3
		slot3 = i18n
		slot4 = "help_battle_ac"
		slot3 = slot3(slot4)
		slot2.helps = slot3

		slot0(slot1, slot2)
	end

	slot8 = SFX_UI_CLICK

	slot4(slot5, slot6, slot7, slot8)

	slot4 = onButton
	slot5 = slot0
	slot6 = slot0.btnBack

	function slot7()
		slot0 = slot0
		slot0 = slot0.onCancel

		if slot0 then
			slot0 = slot0
			slot0 = slot0.onCancel

			slot0()
		end
	end

	slot8 = SFX_CANCEL

	slot4(slot5, slot6, slot7, slot8)

	slot4 = onButton
	slot5 = slot0
	slot6 = slot0._tf

	function slot7()
		slot0 = slot0
		slot0 = slot0.onCancel

		if slot0 then
			slot0 = slot0
			slot0 = slot0.onCancel

			slot0()
		end
	end

	slot8 = SFX_CANCEL

	slot4(slot5, slot6, slot7, slot8)

	slot4 = onButton
	slot5 = slot0
	slot6 = slot0.toggleMask

	function slot7()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.hideToggleMask

		slot0(slot1)
	end

	slot8 = SFX_CANCEL

	slot4(slot5, slot6, slot7, slot8)

	slot4 = onToggle
	slot5 = slot0
	slot6 = slot0.commanderToggle

	function slot7(slot0)
		if slot0 then
			slot1 = slot0
			slot1 = slot1.contextData
			slot1.showCommander = slot0
			slot1 = pairs
			slot2 = slot0
			slot2 = slot2.tfFleets
			slot1, slot2, slot3 = slot1(slot2)

			for slot4, slot5 in slot1, slot2, slot3 do
				slot6 = 1
				slot7 = #slot5
				slot8 = 1

				for slot9 = slot6, slot7, slot8 do
					slot10 = slot0
					slot11 = slot10
					slot10 = slot10.updateCommanderBtn
					slot12 = slot4
					slot13 = slot9

					slot10(slot11, slot12, slot13)
				end
			end
		end
	end

	slot8 = SFX_PANEL

	slot4(slot5, slot6, slot7, slot8)

	slot4 = onToggle
	slot5 = slot0
	slot6 = slot0.formationToggle

	function slot7(slot0)
		if slot0 then
			slot1 = slot0
			slot1 = slot1.contextData
			slot2 = not slot0
			slot1.showCommander = slot2
			slot1 = pairs
			slot2 = slot0
			slot2 = slot2.tfFleets
			slot1, slot2, slot3 = slot1(slot2)

			for slot4, slot5 in slot1, slot2, slot3 do
				slot6 = 1
				slot7 = #slot5
				slot8 = 1

				for slot9 = slot6, slot7, slot8 do
					slot10 = slot0
					slot11 = slot10
					slot10 = slot10.updateCommanderBtn
					slot12 = slot4
					slot13 = slot9

					slot10(slot11, slot12, slot13)
				end
			end
		end
	end

	slot8 = SFX_PANEL

	slot4(slot5, slot6, slot7, slot8)

	slot4 = triggerToggle
	slot5 = slot0.contextData
	slot5 = slot5.showCommander

	if slot5 then
		slot4(slot0.commanderToggle or slot0.formationToggle, true)

		slot4 = setActive
		slot5 = slot0.commanderToggle
		slot6 = slot0.openedCommanerSystem

		slot4(slot5, slot6)

		slot5 = slot0
		slot4 = slot0.clearFleets

		slot4(slot5)

		slot5 = slot0
		slot4 = slot0.updateFleets

		slot4(slot5)

		slot5 = slot0
		slot4 = slot0.updateLimit

		slot4(slot5)

		slot4 = setActive
		slot6 = slot0
		slot5 = slot0.findTF
		slot7 = "panel/title/ASvalue"
		slot5 = slot5(slot6, slot7)
		slot6 = OPEN_AIR_DOMINANCE

		if slot6 then
			slot4(slot5, slot0.chapterASValue > 0)

			slot4 = OPEN_AIR_DOMINANCE
		end
	end

	if slot4 then
		slot4 = slot0.chapterASValue
		slot5 = 0

		if slot4 > slot5 then
			slot5 = slot0
			slot4 = slot0.updateASValue

			slot4(slot5)
		end
	end
end

slot0.set = slot2

function slot2(slot0, slot1)
	slot2 = _
	slot2 = slot2.detect
	slot3 = slot0.fleets

	function slot4(slot0)
		return slot0.id == slot0
	end

	return slot2(slot3, slot4)
end

slot0.getFleetById = slot2

function slot2(slot0, slot1)
	slot2 = 0
	slot3 = FleetType
	slot3 = slot3.Normal

	if slot1 == slot3 then
		slot3 = slot0.chapter
		slot4 = slot3
		slot3 = slot3.getConfig
		slot5 = "group_num"
		slot3 = slot3(slot4, slot5)
		slot2 = slot3
	else
		slot3 = FleetType
		slot3 = slot3.Submarine

		if slot1 == slot3 then
			slot3 = slot0.chapter
			slot4 = slot3
			slot3 = slot3.getConfig
			slot5 = "submarine_num"
			slot3 = slot3(slot4, slot5)
			slot2 = slot3
		end
	end

	return slot2
end

slot0.getLimitNums = slot2

function slot2(slot0)
	slot1 = {}
	slot2 = pairs
	slot3 = slot0.selectIds
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7 = ipairs
		slot8 = slot6
		slot7, slot8, slot9 = slot7(slot8)

		for slot10, slot11 in slot7, slot8, slot9 do
			slot12 = 0

			if slot11 > slot12 then
				slot12 = table
				slot12 = slot12.insert
				slot13 = slot1
				slot14 = slot11

				slot12(slot13, slot14)
			end
		end
	end

	slot2 = _
	slot2 = slot2.sort
	slot3 = slot1

	function slot4(slot0, slot1)
		return slot0 < slot1
	end

	slot2(slot3, slot4)

	return slot1
end

slot0.getSelectIds = slot2

function slot2(slot0)
	slot1 = pairs
	slot2 = slot0.tfFleets
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = 1
		slot7 = #slot5
		slot8 = 1

		for slot9 = slot6, slot7, slot8 do
			slot11 = slot0
			slot10 = slot0.updateFleet
			slot12 = slot4
			slot13 = slot9

			slot10(slot11, slot12, slot13)
		end
	end
end

slot0.updateFleets = slot2

function slot2(slot0)
	slot1 = _
	slot1 = slot1.filter
	slot2 = slot0.selectIds
	slot3 = FleetType
	slot3 = slot3.Normal
	slot2 = slot2[slot3]

	function slot3(slot0)
		return slot0 > 0
	end

	slot1 = slot1(slot2, slot3)
	slot1 = #slot1
	slot2 = _
	slot2 = slot2.filter
	slot3 = slot0.selectIds
	slot4 = FleetType
	slot4 = slot4.Submarine
	slot3 = slot3[slot4]

	function slot4(slot0)
		return slot0 > 0
	end

	slot2 = slot2(slot3, slot4)
	slot2 = #slot2
	slot4 = slot0
	slot3 = slot0.getLimitNums
	slot5 = FleetType
	slot5 = slot5.Normal
	slot3 = slot3(slot4, slot5)
	slot4 = setText
	slot5 = slot0.tfLimit
	slot6 = slot5
	slot5 = slot5.Find
	slot7 = "number"
	slot5 = slot5(slot6, slot7)
	slot6 = string
	slot6 = slot6.format
	slot7 = "%d/%d"
	slot8 = slot1
	slot9 = slot3

	slot4(slot5, slot6(slot7, slot8, slot9))

	slot5 = slot0
	slot4 = slot0.getLimitNums
	slot6 = FleetType
	slot6 = slot6.Submarine
	slot4 = slot4(slot5, slot6)
	slot5 = setText
	slot6 = slot0.tfLimit
	slot7 = slot6
	slot6 = slot6.Find
	slot8 = "number_sub"
	slot6 = slot6(slot7, slot8)
	slot7 = string
	slot7 = slot7.format
	slot8 = "%d/%d"
	slot9 = slot2
	slot10 = slot4

	slot5(slot6, slot7(slot8, slot9, slot10))
end

slot0.updateLimit = slot2

function slot2(slot0, slot1, slot2, slot3)
	slot4 = fleetId

	if slot4 ~= slot3 then
		slot4 = slot0.selectIds
		slot4 = slot4[slot1]
		slot5 = 0

		if slot3 > slot5 then
			slot5 = table
			slot5 = slot5.contains
			slot6 = slot4
			slot7 = slot3
			slot5 = slot5(slot6, slot7)

			if slot5 then
				return
			end
		end

		slot5 = FleetType
		slot5 = slot5.Normal

		if slot1 == slot5 then
			slot6 = slot0
			slot5 = slot0.getLimitNums
			slot7 = slot1
			slot5 = slot5(slot6, slot7)
			slot6 = 0

			if slot5 > slot6 and slot3 == 0 then
				slot5 = _
				slot5 = slot5.filter
				slot6 = slot4

				function slot7(slot0)
					return slot0 > 0
				end

				slot5 = slot5(slot6, slot7)
				slot5 = #slot5

				if slot5 == 1 then
					slot5 = pg
					slot5 = slot5.TipsMgr
					slot5 = slot5.GetInstance
					slot5 = slot5()
					slot6 = slot5
					slot5 = slot5.ShowTips
					slot7 = i18n
					slot8 = "level_fleet_lease_one_ship"

					slot5(slot6, slot7(slot8))

					return
				end
			end
		end

		slot6 = slot0
		slot5 = slot0.getFleetById
		slot7 = slot3
		slot5 = slot5(slot6, slot7)

		if slot5 then
			slot7 = slot5
			slot6 = slot5.isUnlock
			slot6 = slot6(slot7)

			if not slot6 then
				return
			end

			slot7 = slot5
			slot6 = slot5.isLegalToFight
			slot6 = slot6(slot7)

			if slot6 ~= true then
				slot6 = pg
				slot6 = slot6.TipsMgr
				slot6 = slot6.GetInstance
				slot6 = slot6()
				slot7 = slot6
				slot6 = slot6.ShowTips
				slot8 = i18n
				slot9 = "level_fleet_not_enough"

				slot6(slot7, slot8(slot9))

				return
			end
		end

		slot4[slot2] = slot3
		slot7 = slot0
		slot6 = slot0.updateFleet
		slot8 = slot1
		slot9 = slot2

		slot6(slot7, slot8, slot9)

		slot7 = slot0
		slot6 = slot0.updateLimit

		slot6(slot7)

		slot6 = OPEN_AIR_DOMINANCE

		if slot6 then
			slot6 = slot0.chapterASValue
			slot7 = 0

			if slot6 > slot7 then
				slot7 = slot0
				slot6 = slot0.updateASValue

				slot6(slot7)
			end
		end
	end
end

slot0.selectFleet = slot2

function slot2(slot0, slot1, slot2)
	slot7 = slot0:findTF("btn_clear", slot5)
	slot8 = slot0:findTF("blank", slot5)
	slot9 = slot0:findTF("commander", slot5)
	slot11 = slot0:getFleetById(slot10)
	slot12 = setActive
	slot13 = slot0:findTF("btn_select", slot5)

	if slot2 <= slot0:getLimitNums(slot1) then
		slot14 = slot0.contextData
		slot14 = slot14.showCommander
		slot14 = not slot14
	end

	slot12(slot13, slot14)

	slot12 = setActive
	slot13 = slot7

	if slot3 then
		slot14 = slot0.contextData
		slot14 = slot14.showCommander
		slot14 = not slot14
	end

	slot12(slot13, slot14)

	slot12 = setActive
	slot13 = slot8

	if slot3 then
		if slot3 then
			if not slot11 then
				slot14 = slot0.contextData
				slot14 = slot14.showCommander
			else
				slot14 = false
			end
		end
	else
		slot14 = true
	end

	slot12(slot13, slot14)
	setActive(slot9, slot0.contextData.showCommander and slot3 and slot11)
end

slot0.updateCommanderBtn = slot2

function slot2(slot0, slot1, slot2)
	slot0:updateCommanderBtn(slot1, slot2)

	slot5 = slot0:getFleetById(slot4)
	slot6 = slot2 <= slot0:getLimitNums(slot1)
	slot9 = slot0:findTF(TeamType.Main, slot7)
	slot10 = slot0:findTF(TeamType.Vanguard, slot7)
	slot11 = slot0:findTF(TeamType.Submarine, slot7)
	slot12 = slot0:findTF("btn_select", slot7)
	slot14 = slot0:findTF("btn_clear", slot7)
	slot15 = slot0:findTF("blank", slot7)
	slot17 = slot0:findTF("commander", slot7)

	setActive(slot13, false)
	setActive(slot16, false)
	setText(findTF(slot7, "bg/name"), "")

	if slot9 then
		setActive(slot9, slot6 and slot5)
	end

	if slot10 then
		setActive(slot10, slot6 and slot5)
	end

	if slot11 then
		setActive(slot11, slot6 and slot5)
	end

	if slot6 then

		-- Decompilation error in this vicinity:
		slot18 = setText
		slot19 = slot8
		slot20 = slot5.name

		slot18(slot19, Fleet.DEFAULT_NAME[slot5.id] or slot5.name)

		slot18 = FleetType.Submarine

		if slot1 == slot18 then
			slot19 = slot0
			slot18 = slot0.updateShips
			slot20 = slot11
			slot21 = slot5.subShips

			slot18(slot19, slot20, slot21)
		else
			slot19 = slot0
			slot18 = slot0.updateShips
			slot20 = slot9
			slot21 = slot5.mainShips

			slot18(slot19, slot20, slot21)

			slot19 = slot0
			slot18 = slot0.updateShips
			slot20 = slot10
			slot21 = slot5.vanguardShips

			slot18(slot19, slot20, slot21)
		end

		slot19 = slot0
		slot18 = slot0.updateCommanders
		slot20 = slot17
		slot21 = slot5

		slot18(slot19, slot20, slot21)

		slot18 = onButton
		slot19 = slot0
		slot20 = slot12

		function slot21()
			slot0 = slot0
			slot0 = slot0.toggleList
			slot1 = slot1
			slot1 = slot1.position
			slot2 = slot2
			slot2 = slot2.position
			slot1 = slot1 + slot2
			slot1 = slot1 / 2
			slot0.position = slot1
			slot0 = slot0
			slot0 = slot0.toggleList
			slot1 = slot0
			slot1 = slot1.toggleList
			slot1 = slot1.anchoredPosition
			slot2 = Vector2
			slot3 = slot0
			slot3 = slot3.toggleList
			slot3 = slot3.rect
			slot3 = slot3.width
			slot3 = -slot3
			slot3 = slot3 / 2
			slot4 = slot1
			slot4 = slot4.rect
			slot4 = slot4.height
			slot4 = -slot4
			slot4 = slot4 / 2
			slot2 = slot2(slot3, slot4)
			slot1 = slot1 + slot2
			slot0.anchoredPosition = slot1
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.showToggleMask
			slot2 = slot3

			function slot3(slot0)
				slot1 = slot0
				slot2 = slot1
				slot1 = slot1.hideToggleMask

				slot1(slot2)

				slot1 = slot0
				slot2 = slot1
				slot1 = slot1.selectFleet
				slot3 = slot1
				slot4 = slot2
				slot5 = slot0

				slot1(slot2, slot3, slot4, slot5)
			end

			slot0(slot1, slot2, slot3)
		end

		slot22 = SFX_UI_CLICK

		slot18(slot19, slot20, slot21, slot22)

		slot18 = onButton
		slot19 = slot0
		slot20 = slot14

		function slot21()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.selectFleet
			slot2 = slot1
			slot3 = slot2
			slot4 = 0

			slot0(slot1, slot2, slot3, slot4)
		end

		slot22 = SFX_UI_CLICK

		slot18(slot19, slot20, slot21, slot22)
	end
end

slot0.updateFleet = slot2

function slot2(slot0, slot1, slot2)
	slot3 = 1
	slot4 = 2
	slot5 = 1

	for slot6 = slot3, slot4, slot5 do
		slot8 = slot2
		slot7 = slot2.getCommanderByPos
		slot9 = slot6
		slot7 = slot7(slot8, slot9)
		slot9 = slot1
		slot8 = slot1.Find
		slot10 = "pos"
		slot11 = slot6
		slot10 = slot10 .. slot11
		slot8 = slot8(slot9, slot10)
		slot10 = slot8
		slot9 = slot8.Find
		slot11 = "add"
		slot9 = slot9(slot10, slot11)
		slot11 = slot8
		slot10 = slot8.Find
		slot12 = "info"
		slot10 = slot10(slot11, slot12)
		slot11 = setActive
		slot12 = slot9
		slot13 = not slot7

		slot11(slot12, slot13)

		slot11 = setActive
		slot12 = slot10
		slot13 = slot7

		slot11(slot12, slot13)

		if slot7 then
			slot11 = Commander
			slot11 = slot11.rarity2Frame
			slot13 = slot7
			slot12 = slot7.getRarity
			slot11 = slot11(slot12(slot13))
			slot12 = setImageSprite
			slot14 = slot10
			slot13 = slot10.Find
			slot15 = "frame"
			slot13 = slot13(slot14, slot15)
			slot14 = GetSpriteFromAtlas
			slot15 = "weaponframes"
			slot16 = "commander_"
			slot17 = slot11
			slot16 = slot16 .. slot17

			slot12(slot13, slot14(slot15, slot16))

			slot12 = GetImageSpriteFromAtlasAsync
			slot13 = "CommanderHrz/"
			slot15 = slot7
			slot14 = slot7.getPainting
			slot14 = slot14(slot15)
			slot13 = slot13 .. slot14
			slot14 = ""
			slot16 = slot10
			slot15 = slot10.Find
			slot17 = "mask/icon"

			slot12(slot13, slot14, slot15(slot16, slot17))
		end

		slot11 = onButton
		slot12 = slot0
		slot13 = slot9

		function slot14()
			slot0 = getProxy
			slot1 = PlayerProxy
			slot0 = slot0(slot1)
			slot1 = slot0
			slot0 = slot0.setFlag
			slot2 = "lastFleetIndex"
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.getSelectIds

			slot0(slot1, slot2, slot3(slot4))

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = LevelUIConst
			slot2 = slot2.OPEN_COMMANDER_PANEL
			slot3 = slot1
			slot4 = slot0
			slot4 = slot4.chapter

			slot0(slot1, slot2, slot3, slot4)
		end

		slot15 = SFX_PANEL

		slot11(slot12, slot13, slot14, slot15)

		slot11 = onButton
		slot12 = slot0
		slot13 = slot10

		function slot14()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = LevelUIConst
			slot2 = slot2.OPEN_COMMANDER_PANEL
			slot3 = slot1
			slot4 = slot0
			slot4 = slot4.chapter

			slot0(slot1, slot2, slot3, slot4)
		end

		slot15 = SFX_PANEL

		slot11(slot12, slot13, slot14, slot15)
	end
end

slot0.updateCommanders = slot2

function slot2(slot0, slot1, slot2)
	slot3 = slot1
	slot4 = UIItemList
	slot4 = slot4.New
	slot5 = slot1
	slot6 = slot0.tfShipTpl
	slot4 = slot4(slot5, slot6)
	slot6 = slot4
	slot5 = slot4.make

	function slot7(slot0, slot1, slot2)
		slot3 = UIItemList
		slot3 = slot3.EventUpdate

		if slot0 == slot3 then
			slot3 = getProxy
			slot4 = BayProxy
			slot3 = slot3(slot4)
			slot5 = slot3
			slot4 = slot3.getShipById
			slot6 = slot0
			slot7 = slot1 + 1
			slot6 = slot6[slot7]
			slot4 = slot4(slot5, slot6)
			slot5 = updateShip
			slot6 = slot2
			slot7 = slot4

			slot5(slot6, slot7)

			slot5 = setActive
			slot6 = findTF
			slot7 = slot2
			slot8 = "ship_type"
			slot6 = slot6(slot7, slot8)
			slot7 = false

			slot5(slot6, slot7)

			slot6 = slot2
			slot5 = slot2.Find
			slot7 = "icon_bg/energy"
			slot5 = slot5(slot6, slot7)
			slot7 = slot4
			slot6 = slot4.getEnergeConfig
			slot6 = slot6(slot7)

			if slot6 then
				slot7 = slot6.id
				slot8 = 2

				if slot7 <= slot8 then
					slot7 = setActive
					slot8 = slot5
					slot9 = true

					slot7(slot8, slot9)

					slot7 = GetImageSpriteFromAtlasAsync
					slot8 = "energy"
					slot9 = slot6.icon
					slot10 = slot5

					slot7(slot8, slot9, slot10)
				end
			else
				slot7 = setActive
				slot8 = slot5
				slot9 = false

				slot7(slot8, slot9)
			end
		end
	end

	slot5(slot6, slot7)

	slot6 = slot4
	slot5 = slot4.align
	slot7 = #slot2

	slot5(slot6, slot7)

	slot5 = ipairs
	slot6 = slot2
	slot5, slot6, slot7 = slot5(slot6)

	for slot8, slot9 in slot5, slot6, slot7 do
		slot11 = slot3
		slot10 = slot3.GetChild
		slot12 = slot8 - 1
		slot10 = slot10(slot11, slot12)
		slot11 = GetOrAddComponent
		slot12 = slot10
		slot13 = "UILongPressTrigger"
		slot11 = slot11(slot12, slot13)
		slot11 = slot11.onLongPressed
		slot12 = pg
		slot12 = slot12.DelegateInfo
		slot12 = slot12.Add
		slot13 = slot0
		slot14 = slot11

		slot12(slot13, slot14)

		slot13 = slot11
		slot12 = slot11.RemoveAllListeners

		slot12(slot13)

		slot13 = slot11
		slot12 = slot11.AddListener

		function slot14()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = LevelMediator2
			slot2 = slot2.ON_SHIP_DETAIL
			slot3 = {}
			slot4 = slot1
			slot3.id = slot4
			slot4 = slot0
			slot4 = slot4.chapter
			slot3.chapter = slot4

			slot0(slot1, slot2, slot3)
		end

		slot12(slot13, slot14)
	end
end

slot0.updateShips = slot2

function slot2(slot0, slot1, slot2)
	slot3 = setActive
	slot4 = slot0.toggleMask
	slot5 = true

	slot3(slot4, slot5)

	slot3 = _
	slot3 = slot3.filter
	slot4 = slot0.fleets

	function slot5(slot0)
		return slot0:getFleetType() == slot0
	end

	slot3 = slot3(slot4, slot5)
	slot4 = ipairs
	slot5 = slot0.toggles
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = slot3[slot7]
		slot10 = setActive
		slot11 = slot8
		slot12 = slot9

		slot10(slot11, slot12)

		if slot9 then
			slot11 = slot8
			slot10 = slot8.GetComponent
			slot12 = typeof
			slot13 = Toggle
			slot10 = slot10(slot11, slot12(slot13))
			slot12 = slot8
			slot11 = slot8.Find
			slot13 = "lock"
			slot11 = slot11(slot12, slot13)
			slot13 = slot9
			slot12 = slot9.isUnlock
			slot12, slot13 = slot12(slot13)
			slot14 = setToggleEnabled
			slot15 = slot8
			slot16 = slot12

			slot14(slot15, slot16)

			slot14 = setActive
			slot15 = slot11
			slot16 = not slot12

			slot14(slot15, slot16)

			slot14 = table
			slot14 = slot14.contains
			slot15 = slot0.selectIds
			slot15 = slot15[slot1]
			slot16 = slot9.id
			slot14 = slot14(slot15, slot16)
			slot15 = setActive
			slot17 = slot8
			slot16 = slot8.Find
			slot18 = "on"
			slot16 = slot16(slot17, slot18)
			slot17 = slot14

			slot15(slot16, slot17)

			slot15 = setActive
			slot17 = slot8
			slot16 = slot8.Find
			slot18 = "off"
			slot16 = slot16(slot17, slot18)
			slot17 = not slot14

			slot15(slot16, slot17)

			if slot12 then
				slot10.isOn = slot9.id == currentFleetId
				slot15 = onToggle
				slot16 = slot0
				slot17 = slot8

				function slot18(slot0)
					if slot0 then
						slot1 = setActive
						slot2 = slot0
						slot2 = slot2.toggleMask
						slot3 = false

						slot1(slot2, slot3)

						slot1 = slot1
						slot1 = slot1.id
						slot2 = currentFleetId

						if slot1 ~= slot2 then
							slot1 = slot0
							slot1 = slot1._currentDragDelegate

							if slot1 then
								slot1 = slot0
								slot2 = true
								slot1._forceDropCharacter = slot2
								slot1 = LuaHelper
								slot1 = slot1.triggerEndDrag
								slot2 = slot0
								slot2 = slot2._currentDragDelegate

								slot1(slot2)
							end

							slot1 = slot2
							slot2 = slot1
							slot2 = slot2.id

							slot1(slot2)
						end
					end
				end

				slot19 = SFX_UI_TAG

				slot15(slot16, slot17, slot18, slot19)
			else
				slot15 = onButton
				slot16 = slot0
				slot17 = slot11

				function slot18()
					slot0 = pg
					slot0 = slot0.TipsMgr
					slot0 = slot0.GetInstance
					slot0 = slot0()
					slot1 = slot0
					slot0 = slot0.ShowTips
					slot2 = slot0

					slot0(slot1, slot2)
				end

				slot19 = SFX_UI_CLICK

				slot15(slot16, slot17, slot18, slot19)
			end
		end
	end
end

slot0.showToggleMask = slot2

function slot2(slot0)
	slot1 = setActive
	slot2 = slot0.toggleMask
	slot3 = false

	slot1(slot2, slot3)
end

slot0.hideToggleMask = slot2

function slot2(slot0)
	slot1 = pairs
	slot2 = slot0.tfFleets
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = _
		slot6 = slot6.each
		slot7 = slot5

		function slot8(slot0)
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.clearFleet
			slot3 = slot0

			slot1(slot2, slot3)
		end

		slot6(slot7, slot8)
	end
end

slot0.clearFleets = slot2

function slot2(slot0)
	slot1 = slot0.chapter
	slot2 = slot1
	slot1 = slot1.getConfig
	slot3 = "best_air_dominance"
	slot1 = slot1(slot2, slot3)
	slot2 = getProxy
	slot3 = BayProxy
	slot2 = slot2(slot3)
	slot3 = 0
	slot4 = pairs
	slot5 = slot0.selectIds
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = ipairs
		slot10 = slot8
		slot9, slot10, slot11 = slot9(slot10)

		for slot12, slot13 in slot9, slot10, slot11 do
			if slot13 ~= 0 or not slot3 then
				slot15 = slot0
				slot14 = slot0.getFleetById
				slot16 = slot13
				slot14 = slot14(slot15, slot16)
				slot15 = slot14
				slot14 = slot14.getFleetAirDominanceValue
				slot14 = slot14(slot15)
				slot3 = slot3 + slot14
			end
		end
	end

	slot4 = math
	slot4 = slot4.floor
	slot5 = slot3
	slot4 = slot4(slot5)
	slot3 = slot4
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "panel/title/ASvalue"
	slot4 = slot4(slot5, slot6)
	slot5 = setText
	slot7 = slot4
	slot6 = slot4.Find
	slot8 = "value/word"
	slot6 = slot6(slot7, slot8)
	slot7 = i18n
	slot8 = "level_scene_title_word_3"

	slot5(slot6, slot7(slot8))

	slot5 = setText
	slot7 = slot4
	slot6 = slot4.Find
	slot8 = "value/number"
	slot6 = slot6(slot7, slot8)
	slot7 = slot0.suggestionValue

	if slot3 >= slot7 or not slot3 then
		slot7 = setColorStr
		slot8 = slot3
		slot9 = "#f1dc36"
		slot7 = slot7(slot8, slot9)
	end

	slot5(slot6, slot7)

	slot5 = setText
	slot7 = slot4
	slot6 = slot4.Find
	slot8 = "suggest/word"
	slot6 = slot6(slot7, slot8)
	slot7 = i18n
	slot8 = "level_scene_title_word_5"

	slot5(slot6, slot7(slot8))

	slot5 = setText
	slot7 = slot4
	slot6 = slot4.Find
	slot8 = "suggest/number"
	slot6 = slot6(slot7, slot8)
	slot7 = slot0.suggestionValue

	slot5(slot6, slot7)
end

slot0.updateASValue = slot2

function slot2(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = TeamType
	slot4 = slot4.Main
	slot5 = slot1
	slot2 = slot2(slot3, slot4, slot5)
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = TeamType
	slot5 = slot5.Vanguard
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = TeamType
	slot6 = slot6.Submarine
	slot7 = slot1
	slot4 = slot4(slot5, slot6, slot7)

	if slot2 then
		slot5 = removeAllChildren
		slot6 = slot2

		slot5(slot6)
	end

	if slot3 then
		slot5 = removeAllChildren
		slot6 = slot3

		slot5(slot6)
	end

	if slot4 then
		slot5 = removeAllChildren
		slot6 = slot4

		slot5(slot6)
	end
end

slot0.clearFleet = slot2

function slot2(slot0)
	slot1 = triggerToggle
	slot2 = slot0.formationToggle
	slot3 = true

	slot1(slot2, slot3)

	slot1 = triggerToggle
	slot2 = slot0.commanderToggle
	slot3 = false

	slot1(slot2, slot3)
end

slot0.clear = slot2

function slot2(slot0, slot1)
	slot0.onCancelHard = slot1
end

slot0.setCBFuncOnHard = slot2

function slot2(slot0, slot1)
	slot0.shipVOs = slot1
end

slot0.setHardShipVOs = slot2

function slot2(slot0, slot1)

	-- Decompilation error in this vicinity:
	slot0.chapter = slot1
	slot2 = slot0.chapter
	slot3 = slot2
	slot2 = slot2.getConfig
	slot4 = "property_limitation"
	slot2 = slot2(slot3, slot4)
	slot0.propetyLimitation = slot2
	slot2 = slot0.chapter
	slot3 = slot2
	slot2 = slot2.getEliteFleetList
	slot2 = slot2(slot3)
	slot0.eliteFleetList = slot2
	slot2 = slot0.chapter
	slot3 = slot2
	slot2 = slot2.getConfig
	slot4 = "air_dominance"
	slot2 = slot2(slot3, slot4)
	slot0.chapterASValue = slot2
	slot2 = slot0.chapter
	slot3 = slot2
	slot2 = slot2.getConfig
	slot4 = "best_air_dominance"
	slot2 = slot2(slot3, slot4)
	slot0.suggestionValue = slot2
	slot2 = slot0.chapter
	slot3 = slot2
	slot2 = slot2.getEliteFleetCommanders
	slot2 = slot2(slot3)
	slot0.eliteCommanderList = slot2
	slot2 = slot0.chapter
	slot3 = slot2
	slot2 = slot2.getConfig
	slot4 = "limitation"
	slot2 = slot2(slot3, slot4)
	slot0.typeLimitations = slot2
	slot2 = onButton
	slot3 = slot0
	slot4 = slot0.btnGo

	function slot5()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.isTriesLimit
		slot0 = slot0(slot1)

		if slot0 then
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.enoughTimes2Start
			slot0 = slot0(slot1)

			if not slot0 then
				slot0 = pg
				slot0 = slot0.TipsMgr
				slot0 = slot0.GetInstance
				slot0 = slot0()
				slot1 = slot0
				slot0 = slot0.ShowTips
				slot2 = i18n
				slot3 = "common_elite_no_quota"

				slot0(slot1, slot2(slot3))

				return
			end
		end

		slot0 = slot1
		slot0 = slot0.chapter
		slot1 = slot0
		slot0 = slot0.IsEliteFleetLegal
		slot0, slot1 = slot0(slot1)

		if slot0 then
			function slot2()
				slot0 = slot0
				slot0 = slot0.onCancelHard

				slot0()

				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = LevelUIConst
				slot2 = slot2.TRACK_CHAPTER
				slot3 = slot0
				slot3 = slot3.chapter

				function slot4()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.emit
					slot2 = LevelMediator2
					slot2 = slot2.ON_ELITE_TRACKING
					slot3 = slot0
					slot3 = slot3.chapter
					slot3 = slot3.id
					slot4 = slot0
					slot4 = slot4.chapter
					slot4 = slot4.loopFlag

					slot0(slot1, slot2, slot3, slot4)
				end

				slot0(slot1, slot2, slot3, slot4)

				slot0 = playSoundEffect
				slot1 = SFX_UI_WEIGHANCHOR_BATTLE

				slot0(slot1)
			end

			if slot1 then
				slot3 = slot1
				slot4 = slot3
				slot3 = slot3.emit
				slot5 = LevelUIConst
				slot5 = slot5.HANDLE_SHOW_MSG_BOX
				slot6 = {
					modal = true
				}
				slot7 = i18n
				slot8 = "elite_fleet_confirm"
				slot9 = Fleet
				slot9 = slot9.DEFAULT_NAME
				slot9 = slot9[slot1]
				slot7 = slot7(slot8, slot9)
				slot6.content = slot7
				slot6.onYes = slot2

				slot3(slot4, slot5, slot6)
			else
				slot3 = slot2

				slot3()
			end
		else
			slot2 = pg
			slot2 = slot2.TipsMgr
			slot2 = slot2.GetInstance
			slot2 = slot2()
			slot3 = slot2
			slot2 = slot2.ShowTips
			slot4 = slot1

			slot2(slot3, slot4)
		end
	end

	slot6 = SFX_UI_WEIGHANCHOR_GO

	slot2(slot3, slot4, slot5, slot6)

	slot2 = onButton
	slot3 = slot0
	slot4 = slot0.btnASHelp

	function slot5()
		slot0 = pg
		slot0 = slot0.MsgboxMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.ShowMsgBox
		slot2 = {}
		slot3 = MSGBOX_TYPE_HELP
		slot2.type = slot3
		slot3 = i18n
		slot4 = "help_battle_ac"
		slot3 = slot3(slot4)
		slot2.helps = slot3

		slot0(slot1, slot2)
	end

	slot6 = SFX_UI_CLICK

	slot2(slot3, slot4, slot5, slot6)

	slot2 = onButton
	slot3 = slot0
	slot4 = slot0.btnBack

	function slot5()
		slot0 = slot0
		slot0 = slot0.onCancelHard
		slot1 = slot0
		slot1 = slot1.chapter

		slot0(slot1)
	end

	slot6 = SFX_CANCEL

	slot2(slot3, slot4, slot5, slot6)

	slot2 = onButton
	slot3 = slot0
	slot4 = slot0._tf

	function slot5()
		slot0 = slot0
		slot0 = slot0.onCancelHard
		slot1 = slot0
		slot1 = slot1.chapter

		slot0(slot1)
	end

	slot6 = SFX_CANCEL

	slot2(slot3, slot4, slot5, slot6)

	slot2 = onToggle
	slot3 = slot0
	slot4 = slot0.commanderToggle

	function slot5(slot0)
		if slot0 then
			slot1 = slot0
			slot1 = slot1.contextData
			slot1.EditingCommander = slot0
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.flush

			slot1(slot2)
		end
	end

	slot6 = SFX_PANEL

	slot2(slot3, slot4, slot5, slot6)

	slot2 = onToggle
	slot3 = slot0
	slot4 = slot0.formationToggle

	function slot5(slot0)
		if slot0 then
			slot1 = slot0
			slot1 = slot1.contextData
			slot2 = not slot0
			slot1.EditingCommander = slot2
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.flush

			slot1(slot2)
		end
	end

	slot6 = SFX_PANEL

	slot2(slot3, slot4, slot5, slot6)

	slot2 = triggerToggle
	slot3 = slot0.contextData
	slot3 = slot3.EditingCommander

	slot2(slot0.commanderToggle or slot0.formationToggle, true)

	slot2 = setActive
	slot3 = slot0.commanderToggle
	slot4 = slot0.openedCommanerSystem

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.flush

	slot2(slot3)
end

slot0.setOnHard = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.updateEliteLimit

	slot1(slot2)

	slot1 = setActive
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "panel/title/ASvalue"
	slot2 = slot2(slot3, slot4)
	slot3 = OPEN_AIR_DOMINANCE

	if slot3 then
		slot1(slot2, slot0.chapterASValue > 0)

		slot1 = OPEN_AIR_DOMINANCE
	end

	if slot1 then
		slot1 = slot0.chapterASValue
		slot2 = 0

		if slot1 > slot2 then
			slot2 = slot0
			slot1 = slot0.updateEliteASValue

			slot1(slot2)
		end
	end

	slot2 = slot0
	slot1 = slot0.updateEliteFleets

	slot1(slot2)
end

slot0.flush = slot2

function slot2(slot0)
	setActive(slot0.toggleMask, false)
	setActive(slot0.tfLimit, false)
	setActive(slot0.tfLimitTips, #slot0.propetyLimitation == 0)
	setActive(slot0.tfLimitElite, #slot0.propetyLimitation > 0)
	removeAllChildren(slot0.tfLimitContainer)

	slot1 = #slot0.propetyLimitation
	slot2 = 0

	if slot1 > slot2 then
		slot1 = slot0.chapter
		slot2 = slot1
		slot1 = slot1.IsPropertyLimitationSatisfy
		slot1, slot2 = slot1(slot2)
		slot3 = ipairs
		slot4 = slot0.propetyLimitation
		slot3, slot4, slot5 = slot3(slot4)

		for slot6, slot7 in slot3, slot4, slot5 do
			slot8 = slot7[1]
			slot9 = slot7[2]
			slot10 = slot7[3]
			slot11 = cloneTplTo
			slot12 = slot0.tfLimitTpl
			slot13 = slot0.tfLimitContainer
			slot11 = slot11(slot12, slot13)
			slot12 = slot1[slot6]

			if slot12 == 1 then
				slot13 = slot0
				slot12 = slot0.findTF
				slot14 = "Text"
				slot15 = slot11
				slot12 = slot12(slot13, slot14, slot15)
				slot13 = slot12
				slot12 = slot12.GetComponent
				slot14 = typeof
				slot15 = Text
				slot12 = slot12(slot13, slot14(slot15))
				slot13 = Color
				slot13 = slot13.New
				slot14 = 1
				slot15 = 0.9607843137254902
				slot16 = 0.5019607843137255
				slot13 = slot13(slot14, slot15, slot16)
				slot12.color = slot13
			else
				slot13 = slot0
				slot12 = slot0.findTF
				slot14 = "Text"
				slot15 = slot11
				slot12 = slot12(slot13, slot14, slot15)
				slot13 = slot12
				slot12 = slot12.GetComponent
				slot14 = typeof
				slot15 = Text
				slot12 = slot12(slot13, slot14(slot15))
				slot13 = Color
				slot13 = slot13.New
				slot14 = 0.9568627450980393
				slot15 = 0.30196078431372547
				slot16 = 0.30196078431372547
				slot13 = slot13(slot14, slot15, slot16)
				slot12.color = slot13
			end

			slot12 = setActive
			slot13 = slot11
			slot14 = true

			slot12(slot13, slot14)

			slot12 = AttributeType
			slot12 = slot12.EliteCondition2Name
			slot13 = slot8
			slot12 = slot12(slot13)
			slot13 = AttributeType
			slot13 = slot13.eliteConditionCompare
			slot13 = slot13[slot9]
			slot14 = slot10
			slot12 = slot12 .. slot13 .. slot14
			slot13 = slot12
			slot14 = "（"
			slot15 = slot2[slot8]
			slot16 = "）"
			slot12 = slot13 .. slot14 .. slot15 .. slot16
			slot13 = setText
			slot15 = slot0
			slot14 = slot0.findTF
			slot16 = "Text"
			slot17 = slot11
			slot14 = slot14(slot15, slot16, slot17)
			slot15 = slot12

			slot13(slot14, slot15)
		end

		setActive(slot0.tfLimitElite:Find("sub"), slot0.chapter:getConfig("submarine_num") > 0)
	end
end

slot0.updateEliteLimit = slot2

function slot2(slot0)
	slot1 = getProxy
	slot2 = BayProxy
	slot1 = slot1(slot2)
	slot2 = 0
	slot3 = ipairs
	slot4 = slot0.eliteFleetList
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = {}
		slot9 = pairs
		slot10 = slot0.eliteCommanderList
		slot10 = slot10[slot6]
		slot9, slot10, slot11 = slot9(slot10)

		for slot12, slot13 in slot9, slot10, slot11 do
			slot14 = getProxy
			slot15 = CommanderProxy
			slot14 = slot14(slot15)
			slot15 = slot14
			slot14 = slot14.getCommanderById
			slot16 = slot13
			slot14 = slot14(slot15, slot16)
			slot8[slot12] = slot14
		end

		slot9 = ipairs
		slot10 = slot7
		slot9, slot10, slot11 = slot9(slot10)

		for slot12, slot13 in slot9, slot10, slot11 do
			slot14 = calcAirDominanceValue
			slot16 = slot1
			slot15 = slot1.getShipById
			slot17 = slot13
			slot15 = slot15(slot16, slot17)
			slot16 = slot8
			slot14 = slot14(slot15, slot16)
			slot2 = slot2 + slot14
		end
	end

	slot3 = math
	slot3 = slot3.floor
	slot4 = slot2
	slot3 = slot3(slot4)
	slot2 = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "panel/title/ASvalue"
	slot3 = slot3(slot4, slot5)
	slot4 = setText
	slot6 = slot3
	slot5 = slot3.Find
	slot7 = "value/word"
	slot5 = slot5(slot6, slot7)
	slot6 = i18n
	slot7 = "level_scene_title_word_3"

	slot4(slot5, slot6(slot7))

	slot4 = setText
	slot6 = slot3
	slot5 = slot3.Find
	slot7 = "value/number"
	slot5 = slot5(slot6, slot7)
	slot6 = slot0.suggestionValue

	if slot2 >= slot6 or not slot2 then
		slot6 = setColorStr
		slot7 = slot2
		slot8 = "#f1dc36"
		slot6 = slot6(slot7, slot8)
	end

	slot4(slot5, slot6)

	slot4 = setText
	slot6 = slot3
	slot5 = slot3.Find
	slot7 = "suggest/word"
	slot5 = slot5(slot6, slot7)
	slot6 = i18n
	slot7 = "level_scene_title_word_5"

	slot4(slot5, slot6(slot7))

	slot4 = setText
	slot6 = slot3
	slot5 = slot3.Find
	slot7 = "suggest/number"
	slot5 = slot5(slot6, slot7)
	slot6 = slot0.suggestionValue

	slot4(slot5, slot6)
end

slot0.updateEliteASValue = slot2

function slot2(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0.eliteFleetList
	slot5 = slot5[slot4]
	slot6 = {}
	slot7 = {}
	slot8 = ipairs
	slot9 = slot5
	slot8, slot9, slot10 = slot8(slot9)

	for slot11, slot12 in slot8, slot9, slot10 do
		slot13 = slot0.shipVOs
		slot13 = slot13[slot12]
		slot14 = true
		slot6[slot13] = slot14
		slot13 = slot0.shipVOs
		slot13 = slot13[slot12]
		slot14 = slot13
		slot13 = slot13.getTeamType
		slot13 = slot13(slot14)

		if slot2 == slot13 then
			slot13 = table
			slot13 = slot13.insert
			slot14 = slot7
			slot15 = slot12

			slot13(slot14, slot15)
		end
	end

	slot8 = findTF
	slot9 = slot1
	slot10 = slot2
	slot8 = slot8(slot9, slot10)
	slot9 = removeAllChildren
	slot10 = slot8

	slot9(slot10)

	slot9 = 0
	slot10 = false
	slot11 = 0
	slot12 = Clone
	slot13 = slot3
	slot12 = slot12(slot13)
	slot3 = slot12
	slot12 = table
	slot12 = slot12.sort
	slot13 = slot3

	function slot14(slot0, slot1)
		slot2 = type
		slot3 = slot0
		slot2 = slot2(slot3)
		slot3 = type
		slot4 = slot1
		slot3 = slot3(slot4)

		if slot2 == slot3 then
			return slot3 < slot2
		elseif slot1 == 0 or (slot3 == "string" and slot0 ~= 0) then
			slot4 = true

			return slot4
		else
			slot4 = false

			return slot4
		end
	end

	slot12(slot13, slot14)

	slot12 = 1
	slot13 = 3
	slot14 = 1

	for slot15 = slot12, slot13, slot14 do
		slot16, slot17, slot18 = nil
		slot19 = slot7[slot15]

		if slot19 then
			slot19 = slot0.shipVOs[slot7[slot15]] or nil

			if slot19 then
				slot20 = ipairs
				slot21 = slot3
				slot20, slot21, slot22 = slot20(slot21)

				for slot23, slot24 in slot20, slot21, slot22 do
					slot25 = type
					slot26 = slot24
					slot25 = slot25(slot26)

					if slot25 == "number" then
						if slot24 ~= 0 then
							slot26 = slot19
							slot25 = slot19.getShipType
							slot25 = slot25(slot26)

							if slot25 == slot24 then
								slot17 = slot19
								slot18 = slot24
								slot25 = table
								slot25 = slot25.remove
								slot26 = slot3
								slot27 = slot23

								slot25(slot26, slot27)

								if not slot10 then
									slot10 = slot19:getShipType() == slot24
								end

								break
							end
						end
					else
						slot25 = type
						slot26 = slot24
						slot25 = slot25(slot26)

						if slot25 == "string" then
							slot25 = Clone
							slot26 = ShipType
							slot26 = slot26.BundleList
							slot26 = slot26[slot24]
							slot25 = slot25(slot26)
							slot26 = table
							slot26 = slot26.contains
							slot27 = slot25
							slot29 = slot19
							slot28 = slot19.getShipType
							slot26 = slot26(slot27, slot28(slot29))

							if slot26 then
								slot17 = slot19
								slot18 = slot24
								slot26 = table
								slot26 = slot26.remove
								slot27 = slot3
								slot28 = slot23

								slot26(slot27, slot28)

								slot10 = true

								break
							end
						end
					end
				end
			else
				slot18 = slot3[1]
				slot20 = table
				slot20 = slot20.remove
				slot21 = slot3
				slot22 = 1

				slot20(slot21, slot22)
			end
		end

		if slot18 == 0 then
			slot11 = slot11 + 1
		end

		if slot17 then
			slot20 = cloneTplTo
			slot21 = slot0.tfShipTpl
			slot22 = slot8
			slot20 = slot20(slot21, slot22)

			if not slot20 then
				slot20 = cloneTplTo
				slot21 = slot0.tfEmptyTpl
				slot22 = slot8
				slot20 = slot20(slot21, slot22)
			end
		end

		slot21 = setActive
		slot22 = slot20
		slot23 = true

		slot21(slot22, slot23)

		if slot17 then
			slot21 = updateShip
			slot22 = slot20
			slot23 = slot17

			slot21(slot22, slot23)

			slot21 = setActive
			slot23 = slot0
			slot22 = slot0.findTF
			slot24 = "event_block"
			slot25 = slot20
			slot22 = slot22(slot23, slot24, slot25)
			slot23 = slot17.inEvent

			slot21(slot22, slot23)

			slot21 = true
			slot6[slot17] = slot21
		else
			slot9 = slot9 + 1
		end

		slot21 = findTF
		slot22 = slot20
		slot23 = "icon_bg"
		slot21 = slot21(slot22, slot23)
		slot16 = slot21
		slot21 = setActive
		slot23 = slot0
		slot22 = slot0.findTF
		slot24 = "ship_type"
		slot25 = slot20
		slot22 = slot22(slot23, slot24, slot25)
		slot23 = true

		slot21(slot22, slot23)

		slot21 = type
		slot22 = slot18
		slot21 = slot21(slot22)

		if slot21 == "number" then
			if slot18 ~= 0 then
				slot21 = GetSpriteFromAtlas
				slot22 = "shiptype"
				slot23 = ShipType
				slot23 = slot23.Type2CNLabel
				slot24 = slot18
				slot21 = slot21(slot22, slot23(slot24))
				slot22 = setImageSprite
				slot24 = slot0
				slot23 = slot0.findTF
				slot25 = "ship_type"
				slot26 = slot20
				slot23 = slot23(slot24, slot25, slot26)
				slot24 = slot21
				slot25 = true

				slot22(slot23, slot24, slot25)
			else
				slot21 = setActive
				slot23 = slot0
				slot22 = slot0.findTF
				slot24 = "ship_type"
				slot25 = slot20
				slot22 = slot22(slot23, slot24, slot25)
				slot23 = false

				slot21(slot22, slot23)
			end
		else
			slot21 = type
			slot22 = slot18
			slot21 = slot21(slot22)

			if slot21 == "string" then
				slot21 = GetSpriteFromAtlas
				slot22 = "shiptype"
				slot23 = ShipType
				slot23 = slot23.BundleType2CNLabel
				slot24 = slot18
				slot21 = slot21(slot22, slot23(slot24))
				slot22 = setImageSprite
				slot24 = slot0
				slot23 = slot0.findTF
				slot25 = "ship_type"
				slot26 = slot20
				slot23 = slot23(slot24, slot25, slot26)
				slot24 = slot21
				slot25 = true

				slot22(slot23, slot24, slot25)
			end
		end

		slot21 = _
		slot21 = slot21.map
		slot22 = slot5

		function slot23(slot0)
			slot1 = slot0
			slot1 = slot1.shipVOs
			slot1 = slot1[slot0]

			return slot1
		end

		slot21 = slot21(slot22, slot23)
		slot22 = table
		slot22 = slot22.sort
		slot23 = slot21

		function slot24(slot0, slot1)

			-- Decompilation error in this vicinity:
			slot2 = slot0
			slot4 = slot0
			slot3 = slot0.getTeamType
			slot3 = slot3(slot4)
			slot2 = slot2[slot3]
			slot3 = slot0
			slot5 = slot1
			slot4 = slot1.getTeamType
			slot4 = slot4(slot5)
			slot3 = slot3[slot4]
			slot2 = slot0
			slot4 = slot0
			slot3 = slot0.getTeamType
			slot3 = slot3(slot4)
			slot2 = slot2[slot3]
			slot3 = slot0
			slot5 = slot1
			slot4 = slot1.getTeamType
			slot4 = slot4(slot5)
			slot3 = slot3[slot4]

			return table.indexof(slot1, slot0.id) < table.indexof(slot1, slot1.id)
		end

		slot22(slot23, slot24)

		slot22 = GetOrAddComponent
		slot23 = slot16
		slot24 = typeof
		slot25 = UILongPressTrigger
		slot22 = slot22(slot23, slot24(slot25))

		function slot23()
			slot0 = slot0
			slot0 = slot0.onCancelHard

			slot0()

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = LevelMediator2
			slot2 = slot2.ON_ELITE_OEPN_DECK
			slot3 = {}
			slot4 = slot1
			slot3.shipType = slot4
			slot4 = slot2
			slot3.fleet = slot4
			slot4 = slot0
			slot4 = slot4.chapter
			slot3.chapter = slot4
			slot4 = slot3
			slot3.shipVO = slot4
			slot4 = slot4
			slot3.fleetIndex = slot4
			slot4 = slot5
			slot3.teamType = slot4

			slot0(slot1, slot2, slot3)
		end

		slot24 = slot22.onReleased
		slot25 = slot24
		slot24 = slot24.RemoveAllListeners

		slot24(slot25)

		slot24 = slot22.onLongPressed
		slot25 = slot24
		slot24 = slot24.RemoveAllListeners

		slot24(slot25)

		slot24 = slot22.onReleased
		slot25 = slot24
		slot24 = slot24.AddListener

		function slot26()
			slot0 = slot0

			slot0()
		end

		slot24(slot25, slot26)

		slot24 = slot22.onLongPressed
		slot25 = slot24
		slot24 = slot24.AddListener

		function slot26()
			slot0 = slot0

			if not slot0 then
				slot0 = slot1

				slot0()
			else
				slot0 = slot2
				slot0 = slot0.onCancelHard

				slot0()

				slot0 = slot2
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = LevelMediator2
				slot2 = slot2.ON_FLEET_SHIPINFO
				slot3 = {}
				slot4 = slot0
				slot4 = slot4.id
				slot3.shipId = slot4
				slot4 = slot3
				slot3.shipVOs = slot4
				slot4 = slot2
				slot4 = slot4.chapter
				slot3.chapter = slot4

				slot0(slot1, slot2, slot3)
			end
		end

		slot24(slot25, slot26)
	end

	if (slot10 == true or slot11 == 3) and slot9 ~= 3 then
		slot12 = true

		return slot12
	else
		slot12 = false

		return slot12
	end
end

slot0.initAddButton = slot2

function slot2(slot0)
	slot1 = ipairs
	slot2 = slot0.tfFleets
	slot3 = FleetType
	slot3 = slot3.Normal
	slot2 = slot2[slot3]
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot7 = slot0:findTF("btn_recom", slot5)
		slot9 = slot0:findTF("blank", slot5)
		slot10 = slot0:findTF("commander", slot5)

		setActive(slot8, false)
		setActive(findTF(slot5, "selected"), false)
		setActive(findTF(slot5, TeamType.Main), slot11)
		setActive(findTF(slot5, TeamType.Vanguard), slot4 <= slot0.chapter:getConfig("group_num"))

		slot12 = setActive
		slot13 = slot0:findTF("btn_clear", slot5)

		if slot11 then
			slot14 = slot0.contextData
			slot14 = slot14.EditingCommander
			slot14 = not slot14
		end

		slot12(slot13, slot14)

		slot12 = setActive
		slot13 = slot7

		if slot11 then
			slot14 = slot0.contextData
			slot14 = slot14.EditingCommander
			slot14 = not slot14
		end

		slot12(slot13, slot14)

		slot12 = setActive
		slot13 = slot9
		slot14 = not slot11

		slot12(slot13, slot14)

		slot12 = setActive
		slot13 = slot10

		if slot11 then
			slot14 = slot0.contextData
			slot14 = slot14.EditingCommander
		end

		slot12(slot13, slot14)

		slot12 = setText
		slot14 = slot0
		slot13 = slot0.findTF
		slot15 = "bg/name"
		slot16 = slot5
		slot13 = slot13(slot14, slot15, slot16)

		if slot11 then
			slot12(slot13, Fleet.DEFAULT_NAME[slot4] or "")

			if slot11 then
				slot12 = slot0.typeLimitations
				slot12 = slot12[slot4]
				slot13 = slot12[1]
				slot14 = slot12[2]
				slot16 = slot0
				slot15 = slot0.initAddButton
				slot17 = slot5
				slot18 = TeamType
				slot18 = slot18.Main
				slot19 = slot13
				slot20 = slot4
				slot15 = slot15(slot16, slot17, slot18, slot19, slot20)
				slot17 = slot0
				slot16 = slot0.initAddButton
				slot18 = slot5
				slot19 = TeamType
				slot19 = slot19.Vanguard
				slot20 = slot14
				slot21 = slot4
				slot16 = slot16(slot17, slot18, slot19, slot20, slot21)
				slot18 = slot0
				slot17 = slot0.initCommander
				slot19 = slot4
				slot20 = slot10
				slot21 = slot0.chapter

				slot17(slot18, slot19, slot20, slot21)

				if slot15 and slot16 then
					slot17 = setActive
					slot19 = slot0
					slot18 = slot0.findTF
					slot20 = "selected"
					slot21 = slot5
					slot18 = slot18(slot19, slot20, slot21)
					slot19 = true

					slot17(slot18, slot19)
				end

				slot17 = onButton
				slot18 = slot0
				slot19 = slot6

				function slot20()
					slot0 = slot0
					slot0 = slot0.eliteFleetList
					slot1 = slot1
					slot0 = slot0[slot1]
					slot0 = #slot0

					if slot0 ~= 0 then
						slot0 = pg
						slot0 = slot0.MsgboxMgr
						slot0 = slot0.GetInstance
						slot0 = slot0()
						slot1 = slot0
						slot0 = slot0.ShowMsgBox
						slot2 = {}
						slot3 = i18n
						slot4 = "battle_preCombatLayer_clear_confirm"
						slot3 = slot3(slot4)
						slot2.content = slot3

						function slot3()
							slot0 = slot0
							slot1 = slot0
							slot0 = slot0.emit
							slot2 = LevelMediator2
							slot2 = slot2.ON_ELITE_CLEAR
							slot3 = {}
							slot4 = slot1
							slot3.index = slot4
							slot4 = slot0
							slot4 = slot4.chapter
							slot3.chapterVO = slot4

							slot0(slot1, slot2, slot3)
						end

						slot2.onYes = slot3

						slot0(slot1, slot2)
					end
				end

				slot17(slot18, slot19, slot20)

				slot17 = onButton
				slot18 = slot0
				slot19 = slot7

				function slot20()
					slot0 = slot0
					slot0 = slot0.eliteFleetList
					slot1 = slot1
					slot0 = slot0[slot1]
					slot0 = #slot0

					if slot0 ~= 6 then
						if slot0 ~= 0 then
							slot1 = pg
							slot1 = slot1.MsgboxMgr
							slot1 = slot1.GetInstance
							slot1 = slot1()
							slot2 = slot1
							slot1 = slot1.ShowMsgBox
							slot3 = {}
							slot4 = i18n
							slot5 = "battle_preCombatLayer_auto_confirm"
							slot4 = slot4(slot5)
							slot3.content = slot4

							function slot4()
								slot0 = slot0
								slot1 = slot0
								slot0 = slot0.emit
								slot2 = LevelMediator2
								slot2 = slot2.ON_ELITE_RECOMMEND
								slot3 = {}
								slot4 = slot1
								slot3.index = slot4
								slot4 = slot0
								slot4 = slot4.chapter
								slot3.chapterVO = slot4

								slot0(slot1, slot2, slot3)
							end

							slot3.onYes = slot4

							slot1(slot2, slot3)
						else
							slot1 = slot0
							slot2 = slot1
							slot1 = slot1.emit
							slot3 = LevelMediator2
							slot3 = slot3.ON_ELITE_RECOMMEND
							slot4 = {}
							slot5 = slot1
							slot4.index = slot5
							slot5 = slot0
							slot5 = slot5.chapter
							slot4.chapterVO = slot5

							slot1(slot2, slot3, slot4)
						end
					end
				end

				slot17(slot18, slot19, slot20)
			end
		end
	end

	slot1 = ipairs
	slot2 = slot0.tfFleets
	slot3 = FleetType
	slot3 = slot3.Submarine
	slot2 = slot2[slot3]
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = slot4 + 2
		slot8 = slot0:findTF("btn_recom", slot5)
		slot10 = slot0:findTF("blank", slot5)
		slot11 = slot0:findTF("commander", slot5)

		setActive(slot9, false)
		setActive(findTF(slot5, "selected"), false)
		setActive(findTF(slot5, TeamType.Submarine), slot4 <= slot0.chapter:getConfig("submarine_num"))

		slot12 = setActive
		slot13 = slot0:findTF("btn_clear", slot5)
		slot14 = slot0.chapter:getConfig("submarine_num")

		if slot4 <= slot14 then
			slot14 = slot0.contextData
			slot14 = slot14.EditingCommander
			slot14 = not slot14
		else
			slot14 = false

			if false then
				slot14 = true
			end
		end

		slot12(slot13, slot14)

		slot12 = setActive
		slot13 = slot8
		slot14 = slot0.chapter
		slot15 = slot14
		slot14 = slot14.getConfig
		slot16 = "submarine_num"
		slot14 = slot14(slot15, slot16)

		if slot4 <= slot14 then
			slot14 = slot0.contextData
			slot14 = slot14.EditingCommander
			slot14 = not slot14
		else
			slot14 = false

			if false then
				slot14 = true
			end
		end

		slot12(slot13, slot14)
		setActive(slot10, slot0.chapter:getConfig("submarine_num") < slot4)

		slot12 = setActive
		slot13 = slot11
		slot15 = slot0.chapter
		slot14 = slot0.chapter.getConfig
		slot16 = "submarine_num"
		slot14 = slot14(slot15, slot16)

		if slot4 <= slot14 then
			slot14 = slot0.contextData
			slot14 = slot14.EditingCommander
		else
			slot14 = false

			if false then
				slot14 = true
			end
		end

		slot12(slot13, slot14)

		slot12 = setText
		slot14 = slot0
		slot13 = slot0.findTF
		slot15 = "bg/name"
		slot16 = slot5
		slot13 = slot13(slot14, slot15, slot16)
		slot14 = slot0.chapter
		slot15 = slot14
		slot14 = slot14.getConfig
		slot16 = "submarine_num"
		slot14 = slot14(slot15, slot16)

		if slot4 <= slot14 then
			slot12(slot13, Fleet.DEFAULT_NAME[(Fleet.SUBMARINE_FLEET_ID + slot4) - 1] or "")

			slot13 = slot0
			slot12 = slot0.initCommander
			slot14 = slot6
			slot15 = slot11
			slot16 = slot0.chapter

			slot12(slot13, slot14, slot15, slot16)

			slot12 = slot0.chapter
			slot13 = slot12
			slot12 = slot12.getConfig
			slot14 = "submarine_num"
			slot12 = slot12(slot13, slot14)

			if slot4 <= slot12 then
				slot13 = slot0
				slot12 = slot0.initAddButton
				slot14 = slot5
				slot15 = TeamType
				slot15 = slot15.Submarine
				slot16 = {
					0,
					0,
					0
				}
				slot17 = slot6
				slot12 = slot12(slot13, slot14, slot15, slot16, slot17)

				if slot12 then
					slot13 = setActive
					slot15 = slot0
					slot14 = slot0.findTF
					slot16 = "selected"
					slot17 = slot5
					slot14 = slot14(slot15, slot16, slot17)
					slot15 = true

					slot13(slot14, slot15)
				end

				slot13 = onButton
				slot14 = slot0
				slot15 = slot7

				function slot16()
					slot0 = slot0
					slot0 = slot0.eliteFleetList
					slot1 = slot1
					slot0 = slot0[slot1]
					slot0 = #slot0

					if slot0 ~= 0 then
						slot0 = pg
						slot0 = slot0.MsgboxMgr
						slot0 = slot0.GetInstance
						slot0 = slot0()
						slot1 = slot0
						slot0 = slot0.ShowMsgBox
						slot2 = {}
						slot3 = i18n
						slot4 = "battle_preCombatLayer_clear_confirm"
						slot3 = slot3(slot4)
						slot2.content = slot3

						function slot3()
							slot0 = slot0
							slot1 = slot0
							slot0 = slot0.emit
							slot2 = LevelMediator2
							slot2 = slot2.ON_ELITE_CLEAR
							slot3 = {}
							slot4 = slot1
							slot3.index = slot4
							slot4 = slot0
							slot4 = slot4.chapter
							slot3.chapterVO = slot4

							slot0(slot1, slot2, slot3)
						end

						slot2.onYes = slot3

						slot0(slot1, slot2)
					end
				end

				slot13(slot14, slot15, slot16)

				slot13 = onButton
				slot14 = slot0
				slot15 = slot8

				function slot16()
					slot0 = slot0
					slot0 = slot0.eliteFleetList
					slot1 = slot1
					slot0 = slot0[slot1]
					slot0 = #slot0

					if slot0 ~= 3 then
						if slot0 ~= 0 then
							slot1 = pg
							slot1 = slot1.MsgboxMgr
							slot1 = slot1.GetInstance
							slot1 = slot1()
							slot2 = slot1
							slot1 = slot1.ShowMsgBox
							slot3 = {}
							slot4 = i18n
							slot5 = "battle_preCombatLayer_auto_confirm"
							slot4 = slot4(slot5)
							slot3.content = slot4

							function slot4()
								slot0 = slot0
								slot1 = slot0
								slot0 = slot0.emit
								slot2 = LevelMediator2
								slot2 = slot2.ON_ELITE_RECOMMEND
								slot3 = {}
								slot4 = slot1
								slot3.index = slot4
								slot4 = slot0
								slot4 = slot4.chapter
								slot3.chapterVO = slot4

								slot0(slot1, slot2, slot3)
							end

							slot3.onYes = slot4

							slot1(slot2, slot3)
						else
							slot1 = slot0
							slot2 = slot1
							slot1 = slot1.emit
							slot3 = LevelMediator2
							slot3 = slot3.ON_ELITE_RECOMMEND
							slot4 = {}
							slot5 = slot1
							slot4.index = slot5
							slot5 = slot0
							slot5 = slot5.chapter
							slot4.chapterVO = slot5

							slot1(slot2, slot3, slot4)
						end
					end
				end

				slot13(slot14, slot15, slot16)
			end
		end
	end
end

slot0.updateEliteFleets = slot2

function slot2(slot0, slot1, slot2, slot3)
	slot5 = slot3
	slot4 = slot3.getEliteFleetCommanders
	slot4 = slot4(slot5)
	slot5 = slot4[slot1]
	slot6 = 1
	slot7 = 2
	slot8 = 1

	for slot9 = slot6, slot7, slot8 do
		slot10 = slot5[slot9]
		slot11 = nil

		if slot10 then
			slot12 = getProxy
			slot13 = CommanderProxy
			slot12 = slot12(slot13)
			slot13 = slot12
			slot12 = slot12.getCommanderById
			slot14 = slot10
			slot12 = slot12(slot13, slot14)
			slot11 = slot12
		end

		slot13 = slot2
		slot12 = slot2.Find
		slot14 = "pos"
		slot15 = slot9
		slot14 = slot14 .. slot15
		slot12 = slot12(slot13, slot14)
		slot14 = slot12
		slot13 = slot12.Find
		slot15 = "add"
		slot13 = slot13(slot14, slot15)
		slot15 = slot12
		slot14 = slot12.Find
		slot16 = "info"
		slot14 = slot14(slot15, slot16)
		slot15 = setActive
		slot16 = slot13
		slot17 = not slot11

		slot15(slot16, slot17)

		slot15 = setActive
		slot16 = slot14
		slot17 = slot11

		slot15(slot16, slot17)

		if slot11 then
			slot15 = Commander
			slot15 = slot15.rarity2Frame
			slot17 = slot11
			slot16 = slot11.getRarity
			slot15 = slot15(slot16(slot17))
			slot16 = setImageSprite
			slot18 = slot14
			slot17 = slot14.Find
			slot19 = "frame"
			slot17 = slot17(slot18, slot19)
			slot18 = GetSpriteFromAtlas
			slot19 = "weaponframes"
			slot20 = "commander_"
			slot21 = slot15
			slot20 = slot20 .. slot21

			slot16(slot17, slot18(slot19, slot20))

			slot16 = GetImageSpriteFromAtlasAsync
			slot17 = "CommanderHrz/"
			slot19 = slot11
			slot18 = slot11.getPainting
			slot18 = slot18(slot19)
			slot17 = slot17 .. slot18
			slot18 = ""
			slot20 = slot14
			slot19 = slot14.Find
			slot21 = "mask/icon"

			slot16(slot17, slot18, slot19(slot20, slot21))
		end

		slot16 = slot3
		slot15 = slot3.wrapEliteFleet
		slot17 = slot1
		slot15 = slot15(slot16, slot17)
		slot16 = onButton
		slot17 = slot0
		slot18 = slot13

		function slot19()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = LevelUIConst
			slot2 = slot2.OPEN_COMMANDER_PANEL
			slot3 = slot1
			slot4 = slot2
			slot5 = slot3

			slot0(slot1, slot2, slot3, slot4, slot5)
		end

		slot20 = SFX_PANEL

		slot16(slot17, slot18, slot19, slot20)

		slot16 = onButton
		slot17 = slot0
		slot18 = slot14

		function slot19()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = LevelUIConst
			slot2 = slot2.OPEN_COMMANDER_PANEL
			slot3 = slot1
			slot4 = slot2
			slot5 = slot3

			slot0(slot1, slot2, slot3, slot4, slot5)
		end

		slot20 = SFX_PANEL

		slot16(slot17, slot18, slot19, slot20)
	end
end

slot0.initCommander = slot2

return slot0
