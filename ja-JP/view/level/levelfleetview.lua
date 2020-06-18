slot0 = class("LevelFleetView", import("..base.BaseSubView"))
slot1 = {
	vanguard = 1,
	submarine = 3,
	main = 2
}

function slot0.getUIName(slot0)
	return "LevelFleetSelectView"
end

function slot0.OnInit(slot0)
	slot0:InitUI()
	setActive(slot0._tf, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
end

function slot0.OnDestroy(slot0)
	slot0.onConfirm = nil
	slot0.onCancel = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0._parentTF)
end

function slot0.setOpenCommanderTag(slot0, slot1)
	slot0.openedCommanerSystem = slot1
end

function slot0.setCBFunc(slot0, slot1, slot2)
	slot0.onConfirm = slot1
	slot0.onCancel = slot2
end

function slot0.InitUI(slot0)
	slot0.tfShipTpl = slot0:findTF("panel/shiptpl")
	slot0.tfEmptyTpl = slot0:findTF("panel/emptytpl")
	slot4 = slot0.findTF
	slot0.tfFleets = {
		[FleetType.Normal] = {
			slot0:findTF("panel/fleet/1"),
			slot0:findTF("panel/fleet/2")
		},
		[FleetType.Submarine] = {
			slot4(slot0, "panel/sub/1")
		}
	}
	slot0.tfLimit = slot0:findTF("panel/limit")
	slot0.tfLimitTips = slot0:findTF("panel/limit_tip")
	slot0.tfLimitElite = slot0:findTF("panel/limit_elite")
	slot0.tfLimitContainer = slot0:findTF("panel/limit_elite/limit_list")
	slot0.tfLimitTpl = slot0:findTF("panel/limit_elite/condition")
	slot0.btnBack = slot0:findTF("panel/btnBack")
	slot0.btnGo = slot0:findTF("panel/start_button")
	slot0.btnASHelp = slot0:findTF("panel/title/ASvalue")
	slot0.commanderToggle = slot0:findTF("panel/commander_btn")
	slot0.formationToggle = slot0:findTF("panel/formation_btn")
	slot0.toggleMask = slot0:findTF("mask")
	slot0.toggleList = slot0:findTF("mask/list")
	slot0.toggles = {}

	for slot4 = 0, slot0.toggleList.childCount - 1 do
		table.insert(slot0.toggles, slot0.toggleList:Find("item" .. slot4 + 1))
	end

	slot0.btnSp = slot0:findTF("panel/sp")
	slot0.spMask = slot0:findTF("mask_sp")

	setActive(slot0.tfShipTpl, false)
	setActive(slot0.tfEmptyTpl, false)
	setActive(slot0.tfLimitTpl, false)
	setActive(slot0.toggleMask, false)
	setActive(slot0.btnSp, false)
	setActive(slot0.spMask, false)
end

function slot0.set(slot0, slot1, slot2, slot3)
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

	for slot7, slot8 in ipairs(slot3 or {}) do
		if slot0:getFleetById(slot8) then
			slot10 = slot9:getFleetType()

			if #slot0.selectIds[slot10] < slot0:getLimitNums(slot10) then
				table.insert(slot11, slot8)
			end
		end
	end

	setActive(slot0.tfLimitElite, false)
	setActive(slot0.tfLimitTips, false)
	setActive(slot0.tfLimit, true)
	onButton(slot0, slot0.btnGo, function ()
		if uv0.onConfirm then
			uv0.onConfirm(uv0:getSelectIds())
		end
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(slot0, slot0.btnASHelp, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_ac")
		})
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.btnBack, function ()
		if uv0.onCancel then
			uv0.onCancel()
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0._tf, function ()
		if uv0.onCancel then
			uv0.onCancel()
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0.toggleMask, function ()
		uv0:hideToggleMask()
	end, SFX_CANCEL)
	onToggle(slot0, slot0.commanderToggle, function (slot0)
		if slot0 then
			uv0.contextData.showCommander = slot0

			for slot4, slot5 in pairs(uv0.tfFleets) do
				for slot9 = 1, #slot5 do
					uv0:updateCommanderBtn(slot4, slot9)
				end
			end
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.formationToggle, function (slot0)
		if slot0 then
			uv0.contextData.showCommander = not slot0

			for slot4, slot5 in pairs(uv0.tfFleets) do
				for slot9 = 1, #slot5 do
					uv0:updateCommanderBtn(slot4, slot9)
				end
			end
		end
	end, SFX_PANEL)
	triggerToggle(slot0.contextData.showCommander and slot0.commanderToggle or slot0.formationToggle, true)
	setActive(slot0.commanderToggle, slot0.openedCommanerSystem)
	slot0:clearFleets()
	slot0:updateFleets()
	slot0:updateLimit()
	setActive(slot0:findTF("panel/title/ASvalue"), OPEN_AIR_DOMINANCE and slot0.chapterASValue > 0)

	if OPEN_AIR_DOMINANCE and slot0.chapterASValue > 0 then
		slot0:updateASValue()
	end
end

function slot0.getFleetById(slot0, slot1)
	return _.detect(slot0.fleets, function (slot0)
		return slot0.id == uv0
	end)
end

function slot0.getLimitNums(slot0, slot1)
	slot2 = 0

	if slot1 == FleetType.Normal then
		slot2 = slot0.chapter:getConfig("group_num")
	elseif slot1 == FleetType.Submarine then
		slot2 = slot0.chapter:getConfig("submarine_num")
	end

	return slot2
end

function slot0.getSelectIds(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.selectIds) do
		for slot10, slot11 in ipairs(slot6) do
			if slot11 > 0 then
				table.insert(slot1, slot11)
			end
		end
	end

	_.sort(slot1, function (slot0, slot1)
		return slot0 < slot1
	end)

	return slot1
end

function slot0.updateFleets(slot0)
	for slot4, slot5 in pairs(slot0.tfFleets) do
		for slot9 = 1, #slot5 do
			slot0:updateFleet(slot4, slot9)
		end
	end
end

function slot0.updateLimit(slot0)
	setText(slot0.tfLimit:Find("number"), string.format("%d/%d", #_.filter(slot0.selectIds[FleetType.Normal], function (slot0)
		return slot0 > 0
	end), slot0:getLimitNums(FleetType.Normal)))
	setText(slot0.tfLimit:Find("number_sub"), string.format("%d/%d", #_.filter(slot0.selectIds[FleetType.Submarine], function (slot0)
		return slot0 > 0
	end), slot0:getLimitNums(FleetType.Submarine)))
end

function slot0.selectFleet(slot0, slot1, slot2, slot3)
	if fleetId ~= slot3 then
		slot4 = slot0.selectIds[slot1]

		if slot3 > 0 and table.contains(slot4, slot3) then
			return
		end

		if slot1 == FleetType.Normal and slot0:getLimitNums(slot1) > 0 and slot3 == 0 and #_.filter(slot4, function (slot0)
			return slot0 > 0
		end) == 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("level_fleet_lease_one_ship"))

			return
		end

		if slot0:getFleetById(slot3) then
			if not slot5:isUnlock() then
				return
			end

			if slot5:isLegalToFight() ~= true then
				pg.TipsMgr.GetInstance():ShowTips(i18n("level_fleet_not_enough"))

				return
			end
		end

		slot4[slot2] = slot3

		slot0:updateFleet(slot1, slot2)
		slot0:updateLimit()

		if OPEN_AIR_DOMINANCE and slot0.chapterASValue > 0 then
			slot0:updateASValue()
		end
	end
end

function slot0.updateCommanderBtn(slot0, slot1, slot2)
	slot3 = slot2 <= slot0:getLimitNums(slot1)
	slot5 = slot0.tfFleets[slot1][slot2]
	slot11 = slot0:getFleetById(slot0.selectIds[slot1][slot2])

	setActive(slot0:findTF("btn_select", slot5), slot3 and not slot0.contextData.showCommander)
	setActive(slot0:findTF("btn_clear", slot5), slot3 and not slot0.contextData.showCommander)
	setActive(slot0:findTF("blank", slot5), not slot3 or slot3 and not slot11 and slot0.contextData.showCommander)
	setActive(slot0:findTF("commander", slot5), slot0.contextData.showCommander and slot3 and slot11)
end

function slot0.updateFleet(slot0, slot1, slot2)
	slot0:updateCommanderBtn(slot1, slot2)

	slot7 = slot0.tfFleets[slot1][slot2]
	slot10 = slot0:findTF(TeamType.Vanguard, slot7)
	slot11 = slot0:findTF(TeamType.Submarine, slot7)
	slot12 = slot0:findTF("btn_select", slot7)
	slot14 = slot0:findTF("btn_clear", slot7)
	slot15 = slot0:findTF("blank", slot7)
	slot17 = slot0:findTF("commander", slot7)

	setActive(slot0:findTF("btn_recom", slot7), false)
	setActive(slot0:findTF("selected", slot7), false)
	setText(findTF(slot7, "bg/name"), "")

	if slot0:findTF(TeamType.Main, slot7) then
		setActive(slot9, slot2 <= slot0:getLimitNums(slot1) and slot0:getFleetById(slot0.selectIds[slot1][slot2]))
	end

	if slot10 then
		setActive(slot10, slot6 and slot5)
	end

	if slot11 then
		setActive(slot11, slot6 and slot5)
	end

	if slot6 then
		if slot5 then
			setText(slot8, slot5.name == "" and Fleet.DEFAULT_NAME[slot5.id] or slot5.name)

			if slot1 == FleetType.Submarine then
				slot0:updateShips(slot11, slot5.subShips)
			else
				slot0:updateShips(slot9, slot5.mainShips)
				slot0:updateShips(slot10, slot5.vanguardShips)
			end

			slot0:updateCommanders(slot17, slot5)
		end

		onButton(slot0, slot12, function ()
			uv0.toggleList.position = (uv1.position + uv2.position) / 2
			uv0.toggleList.anchoredPosition = uv0.toggleList.anchoredPosition + Vector2(-uv0.toggleList.rect.width / 2, -uv1.rect.height / 2)

			uv0:showToggleMask(uv3, function (slot0)
				uv0:hideToggleMask()
				uv0:selectFleet(uv1, uv2, slot0)
			end)
		end, SFX_UI_CLICK)
		onButton(slot0, slot14, function ()
			uv0:selectFleet(uv1, uv2, 0)
		end, SFX_UI_CLICK)
	end
end

function slot0.updateCommanders(slot0, slot1, slot2)
	for slot6 = 1, 2 do
		slot7 = slot2:getCommanderByPos(slot6)
		slot8 = slot1:Find("pos" .. slot6)

		setActive(slot8:Find("add"), not slot7)
		setActive(slot8:Find("info"), slot7)

		if slot7 then
			setImageSprite(slot10:Find("frame"), GetSpriteFromAtlas("weaponframes", "commander_" .. Commander.rarity2Frame(slot7:getRarity())))
			GetImageSpriteFromAtlasAsync("CommanderHrz/" .. slot7:getPainting(), "", slot10:Find("mask/icon"))
		end

		onButton(slot0, slot9, function ()
			getProxy(PlayerProxy):setFlag("lastFleetIndex", uv0:getSelectIds())
			uv0:emit(LevelUIConst.OPEN_COMMANDER_PANEL, uv1, uv0.chapter)
		end, SFX_PANEL)
		onButton(slot0, slot10, function ()
			uv0:emit(LevelUIConst.OPEN_COMMANDER_PANEL, uv1, uv0.chapter)
		end, SFX_PANEL)
	end
end

function slot0.updateShips(slot0, slot1, slot2)
	slot3 = UIItemList.New(slot1, slot0.tfShipTpl)

	slot3:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot4 = getProxy(BayProxy):getShipById(uv0[slot1 + 1])

			updateShip(slot2, slot4)
			setActive(findTF(slot2, "ship_type"), false)

			slot5 = slot2:Find("icon_bg/energy")

			if slot4:getEnergeConfig() and slot6.id <= 2 then
				setActive(slot5, true)
				GetImageSpriteFromAtlasAsync("energy", slot6.icon, slot5)
			else
				setActive(slot5, false)
			end
		end
	end)
	slot3:align(#slot2)

	for slot7, slot8 in ipairs(slot2) do
		slot10 = GetOrAddComponent(slot1:GetChild(slot7 - 1), "UILongPressTrigger").onLongPressed

		pg.DelegateInfo.Add(slot0, slot10)
		slot10:RemoveAllListeners()
		slot10:AddListener(function ()
			uv0:emit(LevelMediator2.ON_SHIP_DETAIL, {
				id = uv1,
				chapter = uv0.chapter
			})
		end)
	end
end

function slot0.showToggleMask(slot0, slot1, slot2)
	setActive(slot0.toggleMask, true)

	for slot7, slot8 in ipairs(slot0.toggles) do
		slot9 = _.filter(slot0.fleets, function (slot0)
			return slot0:getFleetType() == uv0
		end)[slot7]

		setActive(slot8, slot9)

		if slot9 then
			slot12, slot13 = slot9:isUnlock()

			setToggleEnabled(slot8, slot12)
			setActive(slot8:Find("lock"), not slot12)

			slot14 = table.contains(slot0.selectIds[slot1], slot9.id)

			setActive(slot8:Find("on"), slot14)
			setActive(slot8:Find("off"), not slot14)

			if slot12 then
				slot8:GetComponent(typeof(Toggle)).isOn = slot9.id == currentFleetId

				onToggle(slot0, slot8, function (slot0)
					if slot0 then
						setActive(uv0.toggleMask, false)

						if uv1.id ~= currentFleetId then
							if uv0._currentDragDelegate then
								uv0._forceDropCharacter = true

								LuaHelper.triggerEndDrag(uv0._currentDragDelegate)
							end

							uv2(uv1.id)
						end
					end
				end, SFX_UI_TAG)
			else
				onButton(slot0, slot11, function ()
					pg.TipsMgr.GetInstance():ShowTips(uv0)
				end, SFX_UI_CLICK)
			end
		end
	end
end

function slot0.hideToggleMask(slot0)
	setActive(slot0.toggleMask, false)
end

function slot0.clearFleets(slot0)
	for slot4, slot5 in pairs(slot0.tfFleets) do
		_.each(slot5, function (slot0)
			uv0:clearFleet(slot0)
		end)
	end
end

function slot0.updateASValue(slot0)
	slot1 = slot0.chapter:getConfig("best_air_dominance")
	slot2 = getProxy(BayProxy)
	slot3 = 0

	for slot7, slot8 in pairs(slot0.selectIds) do
		for slot12, slot13 in ipairs(slot8) do
			slot3 = slot13 == 0 and slot3 or slot3 + slot0:getFleetById(slot13):getFleetAirDominanceValue()
		end
	end

	slot4 = slot0:findTF("panel/title/ASvalue")

	setText(slot4:Find("value/word"), i18n("level_scene_title_word_3"))
	setText(slot4:Find("value/number"), math.floor(slot3) < slot0.suggestionValue and slot3 or setColorStr(slot3, "#f1dc36"))
	setText(slot4:Find("suggest/word"), i18n("level_scene_title_word_5"))
	setText(slot4:Find("suggest/number"), slot0.suggestionValue)
end

function slot0.clearFleet(slot0, slot1)
	slot3 = slot0:findTF(TeamType.Vanguard, slot1)
	slot4 = slot0:findTF(TeamType.Submarine, slot1)

	if slot0:findTF(TeamType.Main, slot1) then
		removeAllChildren(slot2)
	end

	if slot3 then
		removeAllChildren(slot3)
	end

	if slot4 then
		removeAllChildren(slot4)
	end
end

function slot0.clear(slot0)
	triggerToggle(slot0.formationToggle, true)
	triggerToggle(slot0.commanderToggle, false)
end

function slot0.setCBFuncOnHard(slot0, slot1)
	slot0.onCancelHard = slot1
end

function slot0.setHardShipVOs(slot0, slot1)
	slot0.shipVOs = slot1
end

function slot0.setOnHard(slot0, slot1)
	slot0.chapter = slot1
	slot0.propetyLimitation = slot0.chapter:getConfig("property_limitation")
	slot0.eliteFleetList = slot0.chapter:getEliteFleetList()
	slot0.chapterASValue = slot0.chapter:getConfig("air_dominance")
	slot0.suggestionValue = slot0.chapter:getConfig("best_air_dominance")
	slot0.eliteCommanderList = slot0.chapter:getEliteFleetCommanders()
	slot0.typeLimitations = slot0.chapter:getConfig("limitation")

	onButton(slot0, slot0.btnGo, function ()
		if uv0:isTriesLimit() and not uv0:enoughTimes2Start() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_elite_no_quota"))

			return
		end

		slot0, slot1 = uv1.chapter:IsEliteFleetLegal()

		if slot0 then
			if slot1 then
				uv1:emit(LevelUIConst.HANDLE_SHOW_MSG_BOX, {
					modal = true,
					content = i18n("elite_fleet_confirm", Fleet.DEFAULT_NAME[slot1]),
					onYes = function ()
						uv0.onCancelHard()
						uv0:emit(LevelUIConst.TRACK_CHAPTER, uv0.chapter, function ()
							uv0:emit(LevelMediator2.ON_ELITE_TRACKING, uv0.chapter.id, uv0.chapter.loopFlag)
						end)
						pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WEIGHANCHOR_BATTLE)
					end
				})
			else
				slot2()
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(slot1)
		end
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(slot0, slot0.btnASHelp, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_ac")
		})
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.btnBack, function ()
		uv0.onCancelHard(uv0.chapter)
	end, SFX_CANCEL)
	onButton(slot0, slot0._tf, function ()
		uv0.onCancelHard(uv0.chapter)
	end, SFX_CANCEL)
	onToggle(slot0, slot0.commanderToggle, function (slot0)
		if slot0 then
			uv0.contextData.EditingCommander = slot0

			uv0:flush()
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.formationToggle, function (slot0)
		if slot0 then
			uv0.contextData.EditingCommander = not slot0

			uv0:flush()
		end
	end, SFX_PANEL)
	triggerToggle(slot0.contextData.EditingCommander and slot0.commanderToggle or slot0.formationToggle, true)
	setActive(slot0.commanderToggle, slot0.openedCommanerSystem)
	slot0:flush()
end

function slot0.flush(slot0)
	slot0:updateEliteLimit()
	setActive(slot0:findTF("panel/title/ASvalue"), OPEN_AIR_DOMINANCE and slot0.chapterASValue > 0)

	if OPEN_AIR_DOMINANCE and slot0.chapterASValue > 0 then
		slot0:updateEliteASValue()
	end

	slot0:updateEliteFleets()
end

function slot0.updateEliteLimit(slot0)
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

			if slot1[slot6] == 1 then
				slot0:findTF("Text", cloneTplTo(slot0.tfLimitTpl, slot0.tfLimitContainer)):GetComponent(typeof(Text)).color = Color.New(1, 0.9607843137254902, 0.5019607843137255)
			else
				slot0:findTF("Text", slot11):GetComponent(typeof(Text)).color = Color.New(0.9568627450980393, 0.30196078431372547, 0.30196078431372547)
			end

			setActive(slot11, true)
			setText(slot0:findTF("Text", slot11), AttributeType.EliteCondition2Name(slot8) .. AttributeType.eliteConditionCompare[slot9] .. slot10 .. "（" .. slot2[slot8] .. "）")
		end

		setActive(slot0.tfLimitElite:Find("sub"), slot0.chapter:getConfig("submarine_num") > 0)
	end
end

function slot0.updateEliteASValue(slot0)
	slot1 = getProxy(BayProxy)
	slot2 = 0

	for slot6, slot7 in ipairs(slot0.eliteFleetList) do
		slot8 = {
			[slot12] = getProxy(CommanderProxy):getCommanderById(slot13)
		}

		for slot12, slot13 in pairs(slot0.eliteCommanderList[slot6]) do
			-- Nothing
		end

		for slot12, slot13 in ipairs(slot7) do
			slot2 = slot2 + calcAirDominanceValue(slot1:getShipById(slot13), slot8)
		end
	end

	slot3 = slot0:findTF("panel/title/ASvalue")

	setText(slot3:Find("value/word"), i18n("level_scene_title_word_3"))
	setText(slot3:Find("value/number"), math.floor(slot2) < slot0.suggestionValue and slot2 or setColorStr(slot2, "#f1dc36"))
	setText(slot3:Find("suggest/word"), i18n("level_scene_title_word_5"))
	setText(slot3:Find("suggest/number"), slot0.suggestionValue)
end

function slot0.initAddButton(slot0, slot1, slot2, slot3, slot4)
	slot6 = {
		[slot0.shipVOs[slot12]] = true
	}

	for slot11, slot12 in ipairs(slot0.eliteFleetList[slot4]) do
		if slot2 == slot0.shipVOs[slot12]:getTeamType() then
			table.insert({}, slot12)
		end
	end

	removeAllChildren(findTF(slot1, slot2))

	slot9 = 0
	slot10 = false
	slot11 = 0

	table.sort(Clone(slot3), function (slot0, slot1)
		if type(slot0) == type(slot1) then
			return slot3 < slot2
		elseif slot1 == 0 or slot3 == "string" and slot0 ~= 0 then
			return true
		else
			return false
		end
	end)

	for slot15 = 1, 3 do
		slot16, slot17, slot18 = nil

		if slot7[slot15] and slot0.shipVOs[slot7[slot15]] or nil then
			for slot23, slot24 in ipairs(slot3) do
				if type(slot24) == "number" then
					if slot24 == 0 or slot19:getShipType() == slot24 then
						slot17 = slot19
						slot18 = slot24

						table.remove(slot3, slot23)

						slot10 = slot10 or slot19:getShipType() == slot24

						break
					end
				elseif type(slot24) == "string" and table.contains(Clone(ShipType.BundleList[slot24]), slot19:getShipType()) then
					slot17 = slot19
					slot18 = slot24

					table.remove(slot3, slot23)

					slot10 = true

					break
				end
			end
		else
			slot18 = slot3[1]

			table.remove(slot3, 1)
		end

		if slot18 == 0 then
			slot11 = slot11 + 1
		end

		setActive(slot17 and cloneTplTo(slot0.tfShipTpl, slot8) or cloneTplTo(slot0.tfEmptyTpl, slot8), true)

		if slot17 then
			updateShip(slot20, slot17)
			setActive(slot0:findTF("event_block", slot20), slot17:getFlag("inEvent"))

			slot6[slot17] = true
		else
			slot9 = slot9 + 1
		end

		slot16 = findTF(slot20, "icon_bg")

		setActive(slot0:findTF("ship_type", slot20), true)

		if type(slot18) == "number" then
			if slot18 ~= 0 then
				setImageSprite(slot0:findTF("ship_type", slot20), GetSpriteFromAtlas("shiptype", ShipType.Type2CNLabel(slot18)), true)
			else
				setActive(slot0:findTF("ship_type", slot20), false)
			end
		elseif type(slot18) == "string" then
			setImageSprite(slot0:findTF("ship_type", slot20), GetSpriteFromAtlas("shiptype", ShipType.BundleType2CNLabel(slot18)), true)
		end

		table.sort(_.map(slot5, function (slot0)
			return uv0.shipVOs[slot0]
		end), function (slot0, slot1)
			return uv0[slot0:getTeamType()] < uv0[slot1:getTeamType()] or uv0[slot0:getTeamType()] == uv0[slot1:getTeamType()] and table.indexof(uv1, slot0.id) < table.indexof(uv1, slot1.id)
		end)

		slot22 = GetOrAddComponent(slot16, typeof(UILongPressTrigger))

		function slot23()
			uv0.onCancelHard()
			uv0:emit(LevelMediator2.ON_ELITE_OEPN_DECK, {
				shipType = uv1,
				fleet = uv2,
				chapter = uv0.chapter,
				shipVO = uv3,
				fleetIndex = uv4,
				teamType = uv5
			})
		end

		slot22.onReleased:RemoveAllListeners()
		slot22.onLongPressed:RemoveAllListeners()
		slot22.onReleased:AddListener(function ()
			uv0()
		end)
		slot22.onLongPressed:AddListener(function ()
			if not uv0 then
				uv1()
			else
				uv2.onCancelHard()
				uv2:emit(LevelMediator2.ON_FLEET_SHIPINFO, {
					shipId = uv0.id,
					shipVOs = uv3,
					chapter = uv2.chapter
				})
			end
		end)
	end

	if (slot10 == true or slot11 == 3) and slot9 ~= 3 then
		return true
	else
		return false
	end
end

function slot0.updateEliteFleets(slot0)
	for slot4, slot5 in ipairs(slot0.tfFleets[FleetType.Normal]) do
		setActive(slot0:findTF("btn_select", slot5), false)
		setActive(findTF(slot5, "selected"), false)

		slot11 = slot4 <= slot0.chapter:getConfig("group_num")

		setActive(findTF(slot5, TeamType.Main), slot11)
		setActive(findTF(slot5, TeamType.Vanguard), slot11)
		setActive(slot0:findTF("btn_clear", slot5), slot11 and not slot0.contextData.EditingCommander)
		setActive(slot0:findTF("btn_recom", slot5), slot11 and not slot0.contextData.EditingCommander)
		setActive(slot0:findTF("blank", slot5), not slot11)
		setActive(slot0:findTF("commander", slot5), slot11 and slot0.contextData.EditingCommander)
		setText(slot0:findTF("bg/name", slot5), slot11 and Fleet.DEFAULT_NAME[slot4] or "")

		if slot11 then
			slot12 = slot0.typeLimitations[slot4]

			slot0:initCommander(slot4, slot10, slot0.chapter)

			if slot0:initAddButton(slot5, TeamType.Main, slot12[1], slot4) and slot0:initAddButton(slot5, TeamType.Vanguard, slot12[2], slot4) then
				setActive(slot0:findTF("selected", slot5), true)
			end

			onButton(slot0, slot6, function ()
				if #uv0.eliteFleetList[uv1] ~= 0 then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("battle_preCombatLayer_clear_confirm"),
						onYes = function ()
							uv0:emit(LevelMediator2.ON_ELITE_CLEAR, {
								index = uv1,
								chapterVO = uv0.chapter
							})
						end
					})
				end
			end)
			onButton(slot0, slot7, function ()
				if #uv0.eliteFleetList[uv1] ~= 6 then
					if slot0 ~= 0 then
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							content = i18n("battle_preCombatLayer_auto_confirm"),
							onYes = function ()
								uv0:emit(LevelMediator2.ON_ELITE_RECOMMEND, {
									index = uv1,
									chapterVO = uv0.chapter
								})
							end
						})
					else
						uv0:emit(LevelMediator2.ON_ELITE_RECOMMEND, {
							index = uv1,
							chapterVO = uv0.chapter
						})
					end
				end
			end)
		end
	end

	for slot4, slot5 in ipairs(slot0.tfFleets[FleetType.Submarine]) do
		slot11 = slot0:findTF("commander", slot5)

		setActive(slot0:findTF("btn_select", slot5), false)
		setActive(findTF(slot5, "selected"), false)
		setActive(findTF(slot5, TeamType.Submarine), slot4 <= slot0.chapter:getConfig("submarine_num"))
		setActive(slot0:findTF("btn_clear", slot5), slot4 <= slot0.chapter:getConfig("submarine_num") and not slot0.contextData.EditingCommander)
		setActive(slot0:findTF("btn_recom", slot5), slot4 <= slot0.chapter:getConfig("submarine_num") and not slot0.contextData.EditingCommander)
		setActive(slot0:findTF("blank", slot5), slot0.chapter:getConfig("submarine_num") < slot4)
		setActive(slot11, slot4 <= slot0.chapter:getConfig("submarine_num") and slot0.contextData.EditingCommander)
		setText(slot0:findTF("bg/name", slot5), slot4 <= slot0.chapter:getConfig("submarine_num") and Fleet.DEFAULT_NAME[Fleet.SUBMARINE_FLEET_ID + slot4 - 1] or "")
		slot0:initCommander(slot4 + 2, slot11, slot0.chapter)

		if slot4 <= slot0.chapter:getConfig("submarine_num") then
			if slot0:initAddButton(slot5, TeamType.Submarine, {
				0,
				0,
				0
			}, slot6) then
				setActive(slot0:findTF("selected", slot5), true)
			end

			onButton(slot0, slot7, function ()
				if #uv0.eliteFleetList[uv1] ~= 0 then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("battle_preCombatLayer_clear_confirm"),
						onYes = function ()
							uv0:emit(LevelMediator2.ON_ELITE_CLEAR, {
								index = uv1,
								chapterVO = uv0.chapter
							})
						end
					})
				end
			end)
			onButton(slot0, slot8, function ()
				if #uv0.eliteFleetList[uv1] ~= 3 then
					if slot0 ~= 0 then
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							content = i18n("battle_preCombatLayer_auto_confirm"),
							onYes = function ()
								uv0:emit(LevelMediator2.ON_ELITE_RECOMMEND, {
									index = uv1,
									chapterVO = uv0.chapter
								})
							end
						})
					else
						uv0:emit(LevelMediator2.ON_ELITE_RECOMMEND, {
							index = uv1,
							chapterVO = uv0.chapter
						})
					end
				end
			end)
		end
	end
end

function slot0.initCommander(slot0, slot1, slot2, slot3)
	for slot9 = 1, 2 do
		slot11 = nil

		if slot3:getEliteFleetCommanders()[slot1][slot9] then
			slot11 = getProxy(CommanderProxy):getCommanderById(slot10)
		end

		slot12 = slot2:Find("pos" .. slot9)

		setActive(slot12:Find("add"), not slot11)
		setActive(slot12:Find("info"), slot11)

		if slot11 then
			setImageSprite(slot14:Find("frame"), GetSpriteFromAtlas("weaponframes", "commander_" .. Commander.rarity2Frame(slot11:getRarity())))
			GetImageSpriteFromAtlasAsync("CommanderHrz/" .. slot11:getPainting(), "", slot14:Find("mask/icon"))
		end

		slot15 = slot3:wrapEliteFleet(slot1)

		onButton(slot0, slot13, function ()
			uv0:emit(LevelUIConst.OPEN_COMMANDER_PANEL, uv1, uv2, uv3)
		end, SFX_PANEL)
		onButton(slot0, slot14, function ()
			uv0:emit(LevelUIConst.OPEN_COMMANDER_PANEL, uv1, uv2, uv3)
		end, SFX_PANEL)
	end
end

return slot0
