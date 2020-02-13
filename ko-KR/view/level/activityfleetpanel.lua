slot0 = class
slot1 = "ActivityFleetPanel"
slot2 = import
slot3 = "..level.LevelEliteFleetPanel"
slot0 = slot0(slot1, slot2(slot3))

function slot1(slot0)
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.init
	slot2 = slot0

	slot1(slot2)
end

slot0.init = slot1

function slot1(slot0, slot1, slot2)
	slot0.groupNum = slot1
	slot0.submarineNum = slot2
	slot3 = setActive
	slot4 = slot0.tfLimitElite
	slot5 = false

	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = slot0.tfLimitTips
	slot5 = false

	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = slot0.tfLimit
	slot5 = false

	slot3(slot4, slot5)

	slot3 = onButton
	slot4 = slot0
	slot5 = slot0.btnGo

	function slot6()
		slot0 = slot0
		slot0 = slot0.onCombat

		if slot0 then
			slot0 = slot0
			slot0 = slot0.onCombat

			slot0()
		end
	end

	slot7 = SFX_UI_WEIGHANCHOR_GO

	slot3(slot4, slot5, slot6, slot7)

	slot3 = onButton
	slot4 = slot0
	slot5 = slot0.btnBack

	function slot6()
		slot0 = slot0
		slot0 = slot0.onCancel

		if slot0 then
			slot0 = slot0
			slot0 = slot0.onCancel

			slot0()
		end

		slot0 = slot0
		slot0 = slot0.onCommit

		if slot0 then
			slot0 = slot0
			slot0 = slot0.onCommit

			slot0()
		end
	end

	slot7 = SFX_CANCEL

	slot3(slot4, slot5, slot6, slot7)

	slot3 = onButton
	slot4 = slot0
	slot5 = slot0._tf

	function slot6()
		slot0 = slot0
		slot0 = slot0.onCancel

		if slot0 then
			slot0 = slot0
			slot0 = slot0.onCancel

			slot0()
		end

		slot0 = slot0
		slot0 = slot0.onCommit

		if slot0 then
			slot0 = slot0
			slot0 = slot0.onCommit

			slot0()
		end
	end

	slot7 = SFX_CANCEL

	slot3(slot4, slot5, slot6, slot7)

	slot3 = onButton
	slot4 = slot0
	slot5 = slot0.toggleMask

	function slot6()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.hideToggleMask

		slot0(slot1)
	end

	slot7 = SFX_CANCEL

	slot3(slot4, slot5, slot6, slot7)

	slot3 = onToggle
	slot4 = slot0
	slot5 = slot0.commanderBtn

	function slot6(slot0)
		slot1 = slot0
		slot1 = slot1.parent
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

	slot7 = SFX_PANEL

	slot3(slot4, slot5, slot6, slot7)

	slot3 = triggerToggle
	slot4 = slot0.commanderBtn
	slot5 = slot0.parent
	slot5 = slot5.contextData
	slot5 = slot5.showCommander

	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = slot0.commanderBtn
	slot5 = slot0.parent
	slot5 = slot5.openedCommanerSystem

	slot3(slot4, slot5)

	slot4 = slot0
	slot3 = slot0.clearFleets

	slot3(slot4)

	slot4 = slot0
	slot3 = slot0.updateFleets

	slot3(slot4)
end

slot0.set = slot1

function slot1(slot0, slot1)
	slot2 = 0
	slot3 = FleetType
	slot3 = slot3.Normal

	if slot1 == slot3 then
		slot2 = slot0.groupNum
	else
		slot3 = FleetType
		slot3 = slot3.Submarine

		if slot1 == slot3 then
			slot2 = slot0.submarineNum
		end
	end

	return slot2
end

slot0.getLimitNums = slot1

function slot1(slot0)
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

slot0.updateFleets = slot1

function slot1(slot0)
	return
end

slot0.updateLimit = slot1

function slot1(slot0, slot1, slot2)
	slot4 = slot0.fleets[slot1][slot2]
	slot8 = slot0:findTF("btn_recom", slot5)
	slot9 = slot0:findTF("blank", slot5)
	slot10 = slot0:findTF("commander", slot5)

	setActive(slot6, false)

	slot11 = setActive
	slot12 = slot0:findTF("btn_clear", slot5)

	if slot2 <= slot0:getLimitNums(slot1) then
		slot13 = slot0.parent
		slot13 = slot13.contextData
		slot13 = slot13.showCommander
		slot13 = not slot13
	end

	slot11(slot12, slot13)

	slot11 = setActive
	slot12 = slot8

	if slot3 then
		slot13 = slot0.parent
		slot13 = slot13.contextData
		slot13 = slot13.showCommander
		slot13 = not slot13
	end

	slot11(slot12, slot13)

	slot11 = setActive
	slot12 = slot9

	if slot3 then
		if slot3 then
			if not slot4 then
				slot13 = slot0.parent
				slot13 = slot13.contextData
				slot13 = slot13.showCommander
			else
				slot13 = false
			end
		end
	else
		slot13 = true
	end

	slot11(slot12, slot13)
	setActive(slot10, slot0.parent.contextData.showCommander and slot3 and slot4)
end

slot0.updateCommanderBtn = slot1

function slot1(slot0, slot1, slot2)
	slot0:updateCommanderBtn(slot1, slot2)

	slot3 = slot0.fleets[slot1][slot2]
	slot4 = slot2 <= slot0:getLimitNums(slot1)
	slot7 = slot0:findTF(TeamType.Main, slot5)
	slot8 = slot0:findTF(TeamType.Vanguard, slot5)
	slot9 = slot0:findTF(TeamType.Submarine, slot5)
	slot10 = slot0:findTF("btn_select", slot5)
	slot11 = slot0:findTF("btn_recom", slot5)
	slot12 = slot0:findTF("btn_clear", slot5)
	slot13 = slot0:findTF("blank", slot5)
	slot15 = slot0:findTF("commander", slot5)

	setActive(slot14, false)
	setText(findTF(slot5, "bg/name"), "")

	if slot7 then
		setActive(slot7, slot4 and slot3)
	end

	if slot8 then
		setActive(slot8, slot4 and slot3)
	end

	if slot9 then
		setActive(slot9, slot4 and slot3)
	end

	if slot4 then

		-- Decompilation error in this vicinity:
		slot16 = setText
		slot17 = slot6
		slot18 = slot3.name

		slot16(slot17, Fleet.DEFAULT_NAME[slot3.id] or slot3.name)

		slot16 = FleetType.Submarine

		if slot1 == slot16 then
			slot17 = slot0
			slot16 = slot0.updateShips
			slot18 = slot9
			slot19 = slot3.subShips
			slot20 = slot3.id
			slot21 = TeamType
			slot21 = slot21.Submarine
			slot22 = slot3

			slot16(slot17, slot18, slot19, slot20, slot21, slot22)
		else
			slot17 = slot0
			slot16 = slot0.updateShips
			slot18 = slot7
			slot19 = slot3.mainShips
			slot20 = slot3.id
			slot21 = TeamType
			slot21 = slot21.Main
			slot22 = slot3

			slot16(slot17, slot18, slot19, slot20, slot21, slot22)

			slot17 = slot0
			slot16 = slot0.updateShips
			slot18 = slot8
			slot19 = slot3.vanguardShips
			slot20 = slot3.id
			slot21 = TeamType
			slot21 = slot21.Vanguard
			slot22 = slot3

			slot16(slot17, slot18, slot19, slot20, slot21, slot22)
		end

		slot17 = slot0
		slot16 = slot0.updateCommanders
		slot18 = slot15
		slot19 = slot3

		slot16(slot17, slot18, slot19)

		slot16 = onButton
		slot17 = slot0
		slot18 = slot11

		function slot19()
			slot0 = slot0
			slot0 = slot0.parent
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ActivityBossBattleMediator2
			slot2 = slot2.ON_FLEET_RECOMMEND
			slot3 = slot1
			slot3 = slot3.id

			slot0(slot1, slot2, slot3)
		end

		slot16(slot17, slot18, slot19)

		slot16 = onButton
		slot17 = slot0
		slot18 = slot12

		function slot19()
			slot0 = slot0
			slot0 = slot0.parent
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ActivityBossBattleMediator2
			slot2 = slot2.ON_FLEET_CLEAR
			slot3 = slot1
			slot3 = slot3.id

			slot0(slot1, slot2, slot3)
		end

		slot20 = SFX_UI_CLICK

		slot16(slot17, slot18, slot19, slot20)
	end
end

slot0.updateFleet = slot1

function slot1(slot0, slot1, slot2)
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
			slot0 = slot0
			slot0 = slot0.parent
			slot1 = slot0
			slot0 = slot0.openCommanderPanel
			slot2 = slot1
			slot3 = slot1
			slot3 = slot3.id

			slot0(slot1, slot2, slot3)
		end

		slot15 = SFX_PANEL

		slot11(slot12, slot13, slot14, slot15)

		slot11 = onButton
		slot12 = slot0
		slot13 = slot10

		function slot14()
			slot0 = slot0
			slot0 = slot0.parent
			slot1 = slot0
			slot0 = slot0.openCommanderPanel
			slot2 = slot1
			slot3 = slot1
			slot3 = slot3.id

			slot0(slot1, slot2, slot3)
		end

		slot15 = SFX_PANEL

		slot11(slot12, slot13, slot14, slot15)
	end
end

slot0.updateCommanders = slot1

function slot1(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = UIItemList
	slot6 = slot6.New
	slot7 = slot1
	slot8 = slot0.tfShipTpl
	slot6 = slot6(slot7, slot8)
	slot8 = slot6
	slot7 = slot6.make

	function slot9(slot0, slot1, slot2)
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

			if slot4 then
				slot5 = setActive
				slot7 = slot2
				slot6 = slot2.Find
				slot8 = "icon_bg"
				slot6 = slot6(slot7, slot8)
				slot7 = true

				slot5(slot6, slot7)

				slot5 = setActive
				slot7 = slot2
				slot6 = slot2.Find
				slot8 = "empty"
				slot6 = slot6(slot7, slot8)
				slot7 = false

				slot5(slot6, slot7)

				slot5 = updateShip
				slot6 = slot2
				slot7 = slot4

				slot5(slot6, slot7)
			else
				slot5 = setActive
				slot7 = slot2
				slot6 = slot2.Find
				slot8 = "icon_bg"
				slot6 = slot6(slot7, slot8)
				slot7 = false

				slot5(slot6, slot7)

				slot5 = setActive
				slot7 = slot2
				slot6 = slot2.Find
				slot8 = "empty"
				slot6 = slot6(slot7, slot8)
				slot7 = true

				slot5(slot6, slot7)
			end

			slot5 = setActive
			slot6 = findTF
			slot7 = slot2
			slot8 = "ship_type"
			slot6 = slot6(slot7, slot8)
			slot7 = false

			slot5(slot6, slot7)

			slot5 = GetOrAddComponent
			slot6 = slot2
			slot7 = typeof
			slot8 = UILongPressTrigger
			slot5 = slot5(slot6, slot7(slot8))

			function slot6()
				slot0 = slot0
				slot0 = slot0.onCancel

				slot0()

				slot0 = slot0
				slot0 = slot0.parent
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = ActivityBossBattleMediator2
				slot2 = slot2.ON_OPEN_DOCK
				slot3 = {
					shipType = 0
				}
				slot4 = slot1
				slot3.fleet = slot4
				slot4 = slot2
				slot3.shipVO = slot4
				slot4 = slot3
				slot3.fleetIndex = slot4
				slot4 = slot4
				slot3.teamType = slot4

				slot0(slot1, slot2, slot3)
			end

			slot7 = slot5.onReleased
			slot8 = slot7
			slot7 = slot7.RemoveAllListeners

			slot7(slot8)

			slot7 = slot5.onLongPressed
			slot8 = slot7
			slot7 = slot7.RemoveAllListeners

			slot7(slot8)

			slot7 = slot5.onReleased
			slot8 = slot7
			slot7 = slot7.AddListener

			function slot9()
				slot0 = slot0

				slot0()
			end

			slot7(slot8, slot9)

			slot7 = slot5.onLongPressed
			slot8 = slot7
			slot7 = slot7.AddListener

			function slot9()
				slot0 = slot0

				if slot0 then
					slot0 = slot1
					slot0 = slot0.onCancel

					slot0()

					slot0 = slot1
					slot0 = slot0.onLongPressShip
					slot1 = slot0
					slot1 = slot1.id
					slot2 = _
					slot2 = slot2.map
					slot3 = slot2
					slot4 = slot3
					slot3 = slot3.getShipIds
					slot3 = slot3(slot4)

					function slot4(slot0)
						slot1 = slot0
						slot2 = slot1
						slot1 = slot1.getShipById
						slot3 = slot0

						return slot1(slot2, slot3)
					end

					slot0(slot1, slot2(slot3, slot4))
				else
					slot0 = slot4

					slot0()
				end
			end

			slot7(slot8, slot9)
		end
	end

	slot7(slot8, slot9)

	slot8 = slot6
	slot7 = slot6.align
	slot9 = 3

	slot7(slot8, slot9)
end

slot0.updateShips = slot1

function slot1(slot0, slot1, slot2)
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
			slot11 = slot9
			slot10 = slot9.isUnlock
			slot10, slot11 = slot10(slot11)
			slot13 = slot8
			slot12 = slot8.Find
			slot14 = "lock"
			slot12 = slot12(slot13, slot14)
			slot13 = setButtonEnabled
			slot14 = slot8
			slot15 = slot10

			slot13(slot14, slot15)

			slot13 = setActive
			slot14 = slot12
			slot15 = not slot10

			slot13(slot14, slot15)

			if slot10 then
				slot13 = table
				slot13 = slot13.contains
				slot14 = slot0.selectIds
				slot14 = slot14[slot1]
				slot15 = slot9.id
				slot13 = slot13(slot14, slot15)
				slot14 = setActive
				slot15 = findTF
				slot16 = slot8
				slot17 = "selected"
				slot15 = slot15(slot16, slot17)
				slot16 = slot13

				slot14(slot15, slot16)

				slot14 = setActive
				slot15 = findTF
				slot16 = slot8
				slot17 = "text"
				slot15 = slot15(slot16, slot17)
				slot16 = not slot13

				slot14(slot15, slot16)

				slot14 = setActive
				slot15 = findTF
				slot16 = slot8
				slot17 = "text_selected"
				slot15 = slot15(slot16, slot17)
				slot16 = slot13

				slot14(slot15, slot16)

				slot14 = onButton
				slot15 = slot0
				slot16 = slot8

				function slot17()
					slot0 = slot0
					slot1 = slot1
					slot1 = slot1.id

					slot0(slot1)
				end

				slot18 = SFX_UI_TAG

				slot14(slot15, slot16, slot17, slot18)
			else
				slot13 = onButton
				slot14 = slot0
				slot15 = slot12

				function slot16()
					slot0 = pg
					slot0 = slot0.TipsMgr
					slot0 = slot0.GetInstance
					slot0 = slot0()
					slot1 = slot0
					slot0 = slot0.ShowTips
					slot2 = slot0

					slot0(slot1, slot2)
				end

				slot17 = SFX_UI_CLICK

				slot13(slot14, slot15, slot16, slot17)
			end
		end
	end
end

slot0.showToggleMask = slot1

function slot1(slot0)
	slot1 = setActive
	slot2 = slot0.toggleMask
	slot3 = false

	slot1(slot2, slot3)
end

slot0.hideToggleMask = slot1

function slot1(slot0, slot1)
	slot2 = {}
	slot3 = FleetType
	slot3 = slot3.Normal
	slot4 = {}
	slot2[slot3] = slot4
	slot3 = FleetType
	slot3 = slot3.Submarine
	slot4 = {}
	slot2[slot3] = slot4
	slot0.fleets = slot2
	slot2 = pairs
	slot3 = slot1
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot6
		slot7 = slot6.isSubmarineFleet
		slot7 = slot7(slot8)

		if slot7 then
			slot7 = table
			slot7 = slot7.insert
			slot8 = slot0.fleets
			slot9 = FleetType
			slot9 = slot9.Submarine
			slot8 = slot8[slot9]
			slot9 = slot6

			slot7(slot8, slot9)
		else
			slot7 = table
			slot7 = slot7.insert
			slot8 = slot0.fleets
			slot9 = FleetType
			slot9 = slot9.Normal
			slot8 = slot8[slot9]
			slot9 = slot6

			slot7(slot8, slot9)
		end
	end
end

slot0.setFleets = slot1

function slot1(slot0)
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

slot0.clearFleets = slot1

function slot1(slot0, slot1)
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

slot0.clearFleet = slot1

function slot1(slot0)
	slot1 = triggerToggle
	slot2 = slot0.commanderBtn
	slot3 = false

	slot1(slot2, slot3)
end

slot0.clear = slot1

return slot0
