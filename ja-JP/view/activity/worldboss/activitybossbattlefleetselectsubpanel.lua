slot0 = class("ActivityBossBattleFleetSelectSubPanel", import("view.base.BaseSubPanel"))
slot1 = {
	vanguard = 1,
	submarine = 3,
	main = 2
}
slot2 = {
	"ship_formationUI_fleetName_easy",
	"ship_formationUI_fleetName_normal",
	"ship_formationUI_fleetName_hard",
	"ship_formationUI_fleetName_extra",
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"ship_formationUI_fleetName_easy_ss",
	"ship_formationUI_fleetName_normal_ss",
	"ship_formationUI_fleetName_hard_ss",
	"ship_formationUI_fleetName_extra_ss"
}

function slot0.GetUIName(slot0)
	return "ActivityBossFleetSelectView"
end

function slot0.OnInit(slot0)
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
	slot0.btnTry = slot0:findTF("panel/try_button")
	slot0.btnASHelp = slot0:findTF("panel/title/ASvalue")
	slot0.commanderToggle = slot0:findTF("panel/commander_btn")
	slot0.formationToggle = slot0:findTF("panel/formation_btn")
	slot0.toggleMask = slot0:findTF("mask")
	slot0.toggleList = slot0:findTF("mask/list")
	slot0.toggles = {}

	for slot4 = 0, slot0.toggleList.childCount - 1, 1 do
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
	setActive(slot0.tfLimitElite, false)
	setActive(slot0.tfLimitTips, false)
	setActive(slot0.tfLimit, false)
	setActive(slot0:findTF("panel/title/ASvalue"), false)
	slot0:InitInteractable()
end

function slot0.InitInteractable(slot0)
	onButton(slot0, slot0.btnGo, function ()
		slot0:OnCombat()
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(slot0, slot0.btnTry, function ()
		slot0:OnTrybat()
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(slot0, slot0.btnBack, function ()
		slot0:OnCancel()
		slot0.OnCancel:OnCommit()
	end, SFX_CANCEL)
	onButton(slot0, slot0._tf, function ()
		slot0:OnCancel()
		slot0.OnCancel:OnCommit()
	end, SFX_CANCEL)
	onToggle(slot0, slot0.commanderToggle, function (slot0)
		if slot0 then
			slot0.contextData.showCommander = slot0

			for slot4, slot5 in pairs(slot0.tfFleets) do
				for slot9 = 1, #slot5, 1 do
					slot0:updateCommanderBtn(slot4, slot9)
				end
			end
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.formationToggle, function (slot0)
		if slot0 then
			slot0.contextData.showCommander = not slot0

			for slot4, slot5 in pairs(slot0.tfFleets) do
				for slot9 = 1, #slot5, 1 do
					slot0:updateCommanderBtn(slot4, slot9)
				end
			end
		end
	end, SFX_PANEL)
end

function slot0.SetFleets(slot0, slot1)
	slot0.fleets = {
		[FleetType.Normal] = {},
		[FleetType.Submarine] = {}
	}

	for slot5, slot6 in pairs(slot1) do
		slot6:RemoveUnusedItems()

		if slot6:isSubmarineFleet() then
			if #slot0.fleets[FleetType.Submarine] < slot0:getLimitNums(FleetType.Submarine) then
				table.insert(slot0.fleets[FleetType.Submarine], slot6)
			end
		elseif #slot0.fleets[FleetType.Normal] < slot0:getLimitNums(FleetType.Normal) then
			table.insert(slot0.fleets[FleetType.Normal], slot6)
		end
	end
end

function slot0.SetSettings(slot0, slot1, slot2, slot3, slot4)
	slot0.groupNum = slot1
	slot0.submarineNum = slot2
	slot0.useCMD = slot3
	slot0.showTryBtn = slot4
end

function slot0.UpdateView(slot0)
	slot0:clearFleets()
	slot0:UpdateFleets()
	triggerToggle((slot0.contextData.showCommander and not LOCK_COMMANDER and pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getRawData().level, "CommandRoomMediator") and slot0.useCMD and slot0.commanderToggle) or slot0.formationToggle, true)
	setActive(slot0.commanderToggle, not LOCK_COMMANDER and pg.SystemOpenMgr.GetInstance().isOpenSystem(getProxy(PlayerProxy).getRawData().level, "CommandRoomMediator") and slot0.useCMD)
	setActive(slot0.btnTry, slot0.showTryBtn)
end

function slot0.getLimitNums(slot0, slot1)
	slot2 = 0

	if slot1 == FleetType.Normal then
		slot2 = slot0.groupNum
	elseif slot1 == FleetType.Submarine then
		slot2 = slot0.submarineNum
	end

	return slot2 or 0
end

function slot0.UpdateFleets(slot0)
	for slot4, slot5 in pairs(slot0.tfFleets) do
		for slot9 = 1, #slot5, 1 do
			slot0:updateFleet(slot4, slot9)
		end
	end
end

function slot0.updateFleet(slot0, slot1, slot2)
	slot0:updateCommanderBtn(slot1, slot2)

	slot4 = slot2 <= slot0:getLimitNums(slot1) and slot0.fleets[slot1][slot2]
	slot8 = slot0:findTF(TeamType.Vanguard, slot5)
	slot9 = slot0:findTF(TeamType.Submarine, slot5)
	slot10 = slot0:findTF("btn_recom", slot5)
	slot11 = slot0:findTF("btn_clear", slot5)
	slot13 = slot0:findTF("commander", slot5)

	setActive(slot12, false)
	setText(findTF(slot5, "bg/name"), "")

	if slot0:findTF(TeamType.Main, slot5) then
		setActive(slot7, slot3 and slot4)
	end

	if slot8 then
		setActive(slot8, slot3 and slot4)
	end

	if slot9 then
		setActive(slot9, slot3 and slot4)
	end

	if slot3 then
		if slot4 then
			setText(slot6, i18n(slot0[slot4.id]) or "")

			if slot1 == FleetType.Submarine then
				slot0:updateShips(slot9, slot4.subShips, slot4.id, TeamType.Submarine)
			else
				slot0:updateShips(slot7, slot4.mainShips, slot4.id, TeamType.Main)
				slot0:updateShips(slot8, slot4.vanguardShips, slot4.id, TeamType.Vanguard)
			end

			slot0:updateCommanders(slot13, slot4)
		end

		onButton(slot0, slot10, function ()
			slot0:emit(ActivityBossBattleMediator3.ON_FLEET_RECOMMEND, slot1.id)
		end)
		onButton(slot0, slot11, function ()
			slot0:emit(ActivityBossBattleMediator3.ON_FLEET_CLEAR, slot1.id)
		end, SFX_UI_CLICK)
	end
end

function slot0.updateShips(slot0, slot1, slot2, slot3, slot4)
	removeAllChildren(slot1)

	slot5 = getProxy(BayProxy)

	for slot9 = 1, 3, 1 do
		setActive(cloneTplTo((slot5:getShipById(slot2[slot9]) and slot0.tfShipTpl) or slot0.tfEmptyTpl, slot1), true)

		if slot10 then
			updateShip(slot12, slot10)
			setActive(slot12:Find("event_block"), slot10.inEvent)
		end

		setActive(slot0:findTF("ship_type", slot12), false)
		GetOrAddComponent(slot12, typeof(UILongPressTrigger)).onLongPressed:RemoveAllListeners()
		onButton(slot0, slot14, function ()
			slot0:emit(ActivityBossBattleMediator3.ON_OPEN_DOCK, {
				fleet = slot1,
				shipVO = slot2,
				fleetIndex = slot3,
				teamType = slot3
			})
		end)
		GetOrAddComponent(slot12, typeof(UILongPressTrigger)).onLongPressed:AddListener(function ()
			if slot0 then
				slot1:OnLongPressShip(slot2[slot3], slot4)
			else
				slot5()
			end
		end)
	end
end

function slot0.updateCommanderBtn(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot3 = slot2 <= slot0:getLimitNums(slot1)

	setActive(slot6, false)
	setActive(slot0:findTF("btn_clear", slot5), slot2 <= slot0.getLimitNums(slot1) and not slot0.contextData.showCommander)
	setActive(slot0:findTF("btn_recom", slot5), slot2 <= slot0.getLimitNums(slot1) and not slot0.contextData.showCommander)
	setActive(slot0:findTF("commander", slot5), slot2 <= slot0.getLimitNums(slot1) and slot2 <= slot0.getLimitNums(slot1) and slot0.fleets[slot1][slot2] and slot0.contextData.showCommander)
	setActive(slot0:findTF("blank", slot5), not (slot2 <= slot0.getLimitNums(slot1)) or (slot2 <= slot0.getLimitNums(slot1) and not (slot2 <= slot0.getLimitNums(slot1) and slot0.fleets[slot1][slot2]) and slot0.contextData.showCommander))

	return

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-8, warpins: 1 ---
	slot3 = false

	if false then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		slot3 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-11, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 12-14, warpins: 1 ---
	slot4 = slot0.fleets[slot1][slot2]
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 15-50, warpins: 2 ---
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #5 51-53, warpins: 1 ---
	slot13 = not slot0.contextData.showCommander
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 54-58, warpins: 2 ---
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #7 59-61, warpins: 1 ---
	slot13 = not slot0.contextData.showCommander

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 62-66, warpins: 2 ---
	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #9 67-68, warpins: 1 ---
	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 69-70, warpins: 1 ---
		slot13 = slot0.contextData.showCommander
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 71-75, warpins: 3 ---
	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #11 76-77, warpins: 1 ---
	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 78-79, warpins: 1 ---
		if not (slot2 <= slot0.getLimitNums(slot1) and slot0.fleets[slot1][slot2]) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 80-82, warpins: 1 ---
			slot13 = slot0.contextData.showCommander
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 83-84, warpins: 1 ---
			slot13 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 85-85, warpins: 1 ---
				slot13 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 86-87, warpins: 4 ---
	--- END OF BLOCK #12 ---



end

function slot0.updateCommanders(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-75, warpins: 0 ---
	for slot6 = 1, 2, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-32, warpins: 2 ---
		slot7 = slot2:getCommanderByPos(slot6)
		slot8 = slot1:Find("pos" .. slot6)

		setActive(slot9, not slot7)
		setActive(slot8:Find("info"), slot7)

		if slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-62, warpins: 1 ---
			setImageSprite(slot10:Find("frame"), GetSpriteFromAtlas("weaponframes", "commander_" .. slot11))
			GetImageSpriteFromAtlasAsync("CommanderHrz/" .. slot7:getPainting(), "", slot10:Find("mask/icon"))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 63-75, warpins: 2 ---
		onButton(slot0, slot9, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			slot0:InvokeParent("openCommanderPanel", slot0, slot1.id)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		onButton(slot0, slot10, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			slot0:InvokeParent("openCommanderPanel", slot0, slot1.id)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 76-77, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.clearFleets(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-11, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.tfFleets) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-9, warpins: 1 ---
		_.each(slot5, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0:clearFleet(slot0)

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-11, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-13, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.clearFleet(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	slot3 = slot0:findTF(TeamType.Vanguard, slot1)
	slot4 = slot0:findTF(TeamType.Submarine, slot1)

	if slot0:findTF(TeamType.Main, slot1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-23, warpins: 1 ---
		removeAllChildren(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-25, warpins: 2 ---
	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-28, warpins: 1 ---
		removeAllChildren(slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 29-30, warpins: 2 ---
	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-33, warpins: 1 ---
		removeAllChildren(slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 34-34, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

function slot0.OnShow(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf, nil, {
		groupName = LayerWeightConst.GROUP_FORMATION_PAGE
	})

	return
	--- END OF BLOCK #0 ---



end

function slot0.OnHide(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0.viewParent._tf)
	triggerToggle(slot0.commanderToggle, false)

	return
	--- END OF BLOCK #0 ---



end

function slot0.OnCancel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0:InvokeParent("hideFleetEdit")

	return
	--- END OF BLOCK #0 ---



end

function slot0.OnCommit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0:InvokeParent("commitEdit")

	return
	--- END OF BLOCK #0 ---



end

function slot0.OnCombat(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0:InvokeParent("commitEdit")
	slot0:InvokeParent("commitCombat")

	return
	--- END OF BLOCK #0 ---



end

function slot0.OnTrybat(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0:InvokeParent("commitEdit")
	slot0:InvokeParent("commitTrybat")

	return
	--- END OF BLOCK #0 ---



end

function slot0.OnLongPressShip(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0:InvokeParent("openShipInfo", slot1, slot2)

	return
	--- END OF BLOCK #0 ---



end

return slot0
