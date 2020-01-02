slot0 = class("LevelEliteFleetPanel", import("..base.BasePanel"))
slot1 = {
	vanguard = 1,
	submarine = 3,
	main = 2
}

function slot0.init(slot0)
	slot0.super.init(slot0)

	slot0.tfShipTpl = slot0:findTF("panel/shiptpl")
	slot0.tfEmptyTpl = slot0:findTF("panel/emptytpl")
	slot0.tfFleets = {
		[FleetType.Normal] = {
			slot0:findTF("panel/fleet/1"),
			slot0:findTF("panel/fleet/2")
		},
		[FleetType.Submarine] = {
			slot0:findTF("panel/sub/1")
		}
	}
	slot0.tfLimit = slot0:findTF("panel/limit")
	slot0.tfLimitTips = slot0:findTF("panel/limit_tip")
	slot0.tfLimitElite = slot0:findTF("panel/limit_elite")
	slot0.tfLimitContainer = slot0:findTF("panel/limit_elite/limit_list")
	slot0.tfLimitTpl = slot0:findTF("panel/limit_elite/condition")
	slot0.btnBack = slot0:findTF("panel/btnBack")
	slot0.btnGo = slot0:findTF("panel/start_button")
	slot0.btnAdHelp = slot0:findTF("panel/title/ADvalue/helpbtn")
	slot0.commanderBtn = slot0:findTF("panel/commander_btn")
	slot0.toggleMask = slot0:findTF("mask")

	setActive(slot0.tfShipTpl, false)
	setActive(slot0.tfEmptyTpl, false)
	setActive(slot0.tfLimitTpl, false)
	setActive(slot0.toggleMask, false)

	slot0.onConfirm = nil
	slot0.onCancel = nil
	slot0.onClick = nil
	slot0.onLongPressed = nil
	slot0.onEliteClear = nil
	slot0.onEliteRecommend = nil
end

function slot0.set(slot0, slot1)
	slot0.chapter = slot1
	slot0.propetyLimitation = slot0.chapter:getConfig("property_limitation")
	slot0.eliteFleetList = slot0.chapter:getEliteFleetList()
	slot0.chapterADValue = slot0.chapter:getConfig("air_dominance")
	slot0.suggestionValue = slot0.chapter:getConfig("best_air_dominance")
	slot0.eliteCommanderList = slot0.chapter:getEliteFleetCommanders()
	slot0.typeLimitations = slot0.chapter:getConfig("limitation")

	onButton(slot0, slot0.btnGo, function ()
		if slot0.onConfirm then
			slot0.onConfirm()
		end
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(slot0, slot0.btnAdHelp, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_ac")
		})
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.btnBack, function ()
		if slot0.onCancel then
			slot0.onCancel()
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0._tf, function ()
		if slot0.onCancel then
			slot0.onCancel()
		end
	end, SFX_CANCEL)
	onToggle(slot0, slot0.commanderBtn, function (slot0)
		slot0.parent.contextData.EditingCommander = slot0

		slot0:flush()
	end, SFX_PANEL)
	triggerToggle(slot0.commanderBtn, slot0.parent.contextData.EditingCommander)
	setActive(slot0.commanderBtn, slot0.parent.openedCommanerSystem)
	slot0:flush()
end

function slot0.clear(slot0)
	triggerToggle(slot0.commanderBtn, false)
end

function slot0.flush(slot0)
	slot0:updateLimit()

	if OPEN_AIR_DOMINANCE and slot0.chapterADValue > 0 then
		setActive(slot0:findTF("panel/title/ADvalue"), true)
		slot0:updateFleetPanelADValue()
	else
		setActive(slot0:findTF("panel/title/ADvalue"), false)
	end

	slot0:updateFleets()
end

function slot0.updateLimit(slot0)
	setActive(slot0.toggleMask, false)
	setActive(slot0.tfLimit, false)
	setActive(slot0.tfLimitTips, #slot0.propetyLimitation == 0)
	setActive(slot0.tfLimitElite, #slot0.propetyLimitation > 0)
	removeAllChildren(slot0.tfLimitContainer)

	if #slot0.propetyLimitation > 0 then
		slot1, slot2 = slot0.chapter:IsPropertyLimitationSatisfy()

		for slot6, slot7 in ipairs(slot0.propetyLimitation) do
			slot8 = slot7[1]
			slot9 = slot7[2]
			slot10 = slot7[3]
			slot11 = cloneTplTo(slot0.tfLimitTpl, slot0.tfLimitContainer)

			if slot1[slot6] == 1 then
				slot0:findTF("Text", slot11):GetComponent(typeof(Text)).color = Color.New(1, 0.9607843137254902, 0.5019607843137255)
			else
				slot0:findTF("Text", slot11):GetComponent(typeof(Text)).color = Color.New(0.9568627450980393, 0.30196078431372547, 0.30196078431372547)
			end

			setActive(slot11, true)
			setText(slot0:findTF("Text", slot11), AttributeType.EliteCondition2Name(slot8) .. AttributeType.eliteConditionCompare[slot9] .. slot10 .. "（" .. slot2[slot8] .. "）")
		end

		setActive(slot0.tfLimitElite:Find("sub"), slot0.chapter:getConfig("submarine_num") > 0)
	end
end

function slot0.updateFleetPanelADValue(slot0)
	slot1 = getProxy(BayProxy)
	slot2 = 0

	for slot6, slot7 in ipairs(slot0.eliteFleetList) do
		slot8 = {}

		for slot12, slot13 in pairs(slot0.eliteCommanderList[slot6]) do
			slot8[slot12] = getProxy(CommanderProxy):getCommanderById(slot13)
		end

		for slot12, slot13 in ipairs(slot7) do
			slot2 = slot2 + calcAirDominanceValue(slot1:getShipById(slot13), slot8)
		end
	end

	setText(slot3, i18n("level_scene_title_word_5"))
	setText(slot0:findTF("Num1", slot3), setColorStr(math.floor(slot2), (math.floor(slot2) < slot0.suggestionValue and "#f1dc36") or COLOR_WHITE))
	setText(slot0:findTF("Num2", slot3), slot0.suggestionValue)
end

function slot0.initAddButton(slot0, slot1, slot2, slot3, slot4)
	slot6 = {}
	slot7 = {}

	for slot11, slot12 in ipairs(slot5) do
		slot6[slot0.parent.shipVOs[slot12]] = true

		if slot2 == slot0.parent.shipVOs[slot12]:getTeamType() then
			table.insert(slot7, slot12)
		end
	end

	removeAllChildren(slot8)

	slot9 = 0
	slot10 = false
	slot11 = 0

	table.sort(slot3, function (slot0, slot1)
		if type(slot0) == type(slot1) then
			return slot3 < slot2
		elseif slot1 == 0 or (slot3 == "string" and slot0 ~= 0) then
			return true
		else
			return false
		end
	end)

	slot12 = {}
	slot13 = {}

	for slot17 = 1, 3, 1 do
		slot18, slot19, slot20 = nil
		slot21 = (slot7[slot17] and slot0.parent.shipVOs[slot7[slot17]]) or nil

		if slot21 then
			for slot25, slot26 in ipairs(slot3) do
				if type(slot26) == "number" then
					if slot26 == 0 or slot21:getShipType() == slot26 then
						slot19 = slot21
						slot20 = slot26

						table.remove(slot3, slot25)
						table.insert(slot12, slot25)

						slot10 = slot10 or slot21:getShipType() == slot26

						break
					end
				elseif type(slot26) == "string" and table.contains(Clone(ShipType.BundleList[slot26]), slot21:getShipType()) then
					slot19 = slot21
					slot20 = slot26

					table.remove(slot3, slot25)
					table.insert(slot12, slot25)

					slot10 = true

					break
				end
			end
		else
			slot20 = slot3[1]

			table.remove(slot3, 1)
			table.insert(slot12, 1)
		end

		if slot20 == 0 then
			slot11 = slot11 + 1
		end

		table.insert(slot13, (slot19 and cloneTplTo(slot0.tfShipTpl, slot8)) or cloneTplTo(slot0.tfEmptyTpl, slot8))
		setActive((slot19 and cloneTplTo(slot0.tfShipTpl, slot8)) or cloneTplTo(slot0.tfEmptyTpl, slot8), true)

		if slot19 then
			updateShip(slot22, slot19)
			setActive(slot0:findTF("event_block", slot22), slot19.inEvent)

			slot6[slot19] = true
		else
			slot9 = slot9 + 1
		end

		slot18 = findTF(slot22, "icon_bg")

		setActive(slot0:findTF("ship_type", slot22), true)

		if type(slot20) == "number" then
			if slot20 ~= 0 then
				setImageSprite(slot0:findTF("ship_type", slot22), GetSpriteFromAtlas("shiptype", ShipType.Type2CNLabel(slot20)), true)
			else
				setActive(slot0:findTF("ship_type", slot22), false)
			end
		elseif type(slot20) == "string" then
			setImageSprite(slot0:findTF("ship_type", slot22), GetSpriteFromAtlas("shiptype", ShipType.BundleType2CNLabel(slot20)), true)
		end

		setActive(slot0:findTF("ship_type", slot22), not slot19 and slot20 ~= 0)
		table.sort(setActive, function (slot0, slot1)
			return slot0[slot0:getTeamType()] < slot0[slot1:getTeamType()] or (slot0[slot0:getTeamType()] == slot0[slot1:getTeamType()] and table.indexof(slot1, slot0.id) < table.indexof(slot1, slot1.id))
		end)

		slot24 = GetOrAddComponent(slot18, typeof(UILongPressTrigger))

		slot24.onReleased:RemoveAllListeners()
		slot24.onLongPressed:RemoveAllListeners()
		slot24.onReleased:AddListener(function ()
			slot0.onClick({
				shipType = slot1,
				fleet = slot1,
				chapter = slot0.chapter,
				shipVO = slot3,
				fleetIndex = slot4,
				teamType = slot5
			})
		end)
		slot24.onLongPressed:AddListener(function ()
			if not slot0 then
				slot1.onClick({
					shipType = slot2,
					fleet = slot3,
					chapter = slot1.chapter,
					shipVO = slot0,
					fleetIndex = slot4,
					teamType = slot5
				})
			else
				slot1.onLongPressed({
					shipId = slot0.id,
					shipVOs = slot6,
					chapter = slot1.chapter
				})
			end
		end)
	end

	for slot17 = 3, 1, -1 do
		slot13[slot17]:SetSiblingIndex(slot12[slot17] - 1)
	end

	if (slot10 == true or slot11 == 3) and slot9 ~= 3 then
		return true
	else
		return false
	end
end

function slot0.initCommander(slot0, slot1, slot2, slot3)
	slot5 = slot3:getEliteFleetCommanders()[slot1]

	for slot9 = 1, 2, 1 do
		slot11 = nil

		if slot5[slot9] then
			slot11 = getProxy(CommanderProxy):getCommanderById(slot10)
		end

		slot12 = slot2:Find("pos" .. slot9)

		setActive(slot13, not slot11)
		setActive(slot12:Find("info"), slot11)

		if slot11 then
			setImageSprite(slot14:Find("frame"), GetSpriteFromAtlas("weaponframes", "commander_" .. slot15))
			GetImageSpriteFromAtlasAsync("CommanderHrz/" .. slot11:getPainting(), "", slot14:Find("mask/icon"))
		end

		slot15 = slot3:wrapEliteFleet(slot1)

		onButton(slot0, slot13, function ()
			slot0.parent:openCommanderPanel(slot0.parent, slot2.id, )
		end, SFX_PANEL)
		onButton(slot0, slot14, function ()
			slot0.parent:openCommanderPanel(slot0.parent, slot2.id, )
		end, SFX_PANEL)
	end
end

function slot0.updateFleets(slot0)
	for slot4, slot5 in ipairs(slot0.tfFleets[FleetType.Normal]) do
		setActive(slot8, false)
		setActive(findTF(slot5, "selected"), false)
		setActive(findTF(slot5, TeamType.Main), slot4 <= slot0.chapter:getConfig("group_num"))
		setActive(findTF(slot5, TeamType.Vanguard), slot4 <= slot0.chapter.getConfig("group_num"))
		setActive(slot0:findTF("btn_clear", slot5), slot4 <= slot0.chapter.getConfig("group_num") and not slot0.contextData.EditingCommander)
		setActive(slot0:findTF("btn_recom", slot5), slot4 <= slot0.chapter.getConfig("group_num") and not slot0.contextData.EditingCommander)
		setActive(slot0:findTF("blank", slot5), not (slot4 <= slot0.chapter.getConfig("group_num")))
		setActive(slot0:findTF("commander", slot5), slot4 <= slot0.chapter.getConfig("group_num") and slot0.contextData.EditingCommander)
		setText(slot0:findTF("bg/name", slot5), (slot4 <= slot0.chapter.getConfig("group_num") and Fleet.DEFAULT_NAME[slot4]) or "")

		if slot11 then
			slot16 = slot0:initAddButton(slot5, TeamType.Vanguard, slot14, slot4)

			slot0:initCommander(slot4, slot10, slot0.chapter)

			if slot0:initAddButton(slot5, TeamType.Main, slot13, slot4) and slot16 then
				setActive(slot0:findTF("selected", slot5), true)
			end

			onButton(slot0, slot6, function ()
				if #slot0.eliteFleetList[slot1] ~= 0 then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("battle_preCombatLayer_clear_confirm"),
						onYes = function ()
							slot0.onEliteClear({
								index = slot1,
								chapterVO = slot0.chapter
							})
						end
					})
				end
			end)
			onButton(slot0, slot7, function ()
				if #slot0.eliteFleetList[slot1] ~= 6 then
					if slot0 ~= 0 then
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							content = i18n("battle_preCombatLayer_auto_confirm"),
							onYes = function ()
								slot0.onEliteRecommend({
									index = slot1,
									chapterVO = slot0.chapter
								})
							end
						})
					else
						slot0.onEliteRecommend({
							index = slot1,
							chapterVO = slot0.chapter
						})
					end
				end
			end)
		end
	end

	for slot4, slot5 in ipairs(slot0.tfFleets[FleetType.Submarine]) do
		setActive(slot9, false)
		setActive(findTF(slot5, "selected"), false)
		setActive(findTF(slot5, TeamType.Submarine), slot4 <= slot0.chapter:getConfig("submarine_num"))
		setActive(slot0:findTF("btn_clear", slot5), slot4 <= slot0.chapter:getConfig("submarine_num") and not slot0.contextData.EditingCommander)
		setActive(slot0:findTF("btn_recom", slot5), slot4 <= slot0.chapter:getConfig("submarine_num") and not slot0.contextData.EditingCommander)
		setActive(slot0:findTF("blank", slot5), slot0.chapter:getConfig("submarine_num") < slot4)
		setActive(slot0:findTF("commander", slot5), slot4 <= slot0.chapter:getConfig("submarine_num") and slot0.contextData.EditingCommander)
		setText(slot0:findTF("bg/name", slot5), (slot4 <= slot0.chapter:getConfig("submarine_num") and Fleet.DEFAULT_NAME[(Fleet.SUBMARINE_FLEET_ID + slot4) - 1]) or "")
		slot0:initCommander(slot4 + 2, slot0.findTF("commander", slot5), slot0.chapter)

		if slot4 <= slot0.chapter:getConfig("submarine_num") then
			if slot0:initAddButton(slot5, TeamType.Submarine, {
				0,
				0,
				0
			}, slot6) then
				setActive(slot0:findTF("selected", slot5), true)
			end

			onButton(slot0, slot7, function ()
				if #slot0.eliteFleetList[slot1] ~= 0 then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("battle_preCombatLayer_clear_confirm"),
						onYes = function ()
							slot0.onEliteClear({
								index = slot1,
								chapterVO = slot0.chapter
							})
						end
					})
				end
			end)
			onButton(slot0, slot8, function ()
				if #slot0.eliteFleetList[slot1] ~= 3 then
					if slot0 ~= 0 then
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							content = i18n("battle_preCombatLayer_auto_confirm"),
							onYes = function ()
								slot0.onEliteRecommend({
									index = slot1,
									chapterVO = slot0.chapter
								})
							end
						})
					else
						slot0.onEliteRecommend({
							index = slot1,
							chapterVO = slot0.chapter
						})
					end
				end
			end)
		end
	end
end

return slot0
