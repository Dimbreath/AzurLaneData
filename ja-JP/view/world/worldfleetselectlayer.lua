slot0 = class("WorldFleetSelectLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "WorldFleetSelect"
end

function slot0.init(slot0)
	slot0.rtBg = slot0._tf:Find("bg")
	slot1 = nowWorld.realm

	eachChild(slot0.rtBg, function (slot0)
		setActive(slot0, slot0.name == tostring(uv0))
	end)

	slot0.rtPanel = slot0._tf:Find("panel")
	slot0.rtShipTpl = slot0.rtPanel:Find("shiptpl")

	setActive(slot0.rtShipTpl, false)

	slot0.rtEmptyTpl = slot0.rtPanel:Find("emptytpl")

	setActive(slot0.rtEmptyTpl, false)

	slot0.rtScroll = slot0.rtPanel:Find("bg")
	slot0.rtContent = slot0.rtScroll:Find("content")
	slot0.rtFleets = {
		[FleetType.Normal] = slot0.rtContent:Find("fleet"),
		[FleetType.Submarine] = slot0.rtContent:Find("sub")
	}
	slot0.rtLimit = slot0.rtPanel:Find("limit/text")
	slot0.btnBack = slot0.rtPanel:Find("btnBack")
	slot0.btnGo = slot0.rtPanel:Find("start_button")
	slot0.commanderToggle = slot0.rtPanel:Find("commander_btn")
	slot0.formationToggle = slot0.rtPanel:Find("formation_btn")

	slot0:buildCommanderPanel()
end

function slot0.didEnter(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0.rtPanel)
	onButton(slot0, slot0.btnGo, function ()
		if uv0:CheckValid() then
			uv0:emit(WorldFleetSelectMediator.OnGO)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.btnBack, function ()
		uv0:closeView()
	end, SFX_CANCEL)

	function slot1(slot0)
		uv0.contextData.showCommander = slot0

		for slot4, slot5 in pairs(uv0.rtFleets) do
			for slot9 = 1, #uv0.contextData.fleets[slot4] do
				uv0:updateCommanderBtn(slot5:GetChild(slot9 - 1), slot4, slot9)
			end
		end
	end

	onToggle(slot0, slot0.commanderToggle, function (slot0)
		if slot0 then
			uv0(slot0)
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.formationToggle, function (slot0)
		if slot0 then
			uv0(not slot0)
		end
	end, SFX_PANEL)
	setText(slot0.rtLimit, i18n("world_fleet_choose"))
	slot0:UpdateFleets()
	scrollTo(slot0.rtContent, nil, slot0.contextData.scrollY)

	slot0.contextData.showCommander = defaultValue(slot0.contextData.showCommander, true)

	triggerToggle(slot0.contextData.showCommander and slot0.commanderToggle or slot0.formationToggle, true)
	slot0:CheckWorldResetAward()
end

function slot0.willExit(slot0)
	slot0.contextData.scrollY = GetComponent(slot0.rtContent, typeof(ScrollRect)).normalizedPosition.y

	pg.UIMgr.GetInstance():UnblurPanel(slot0.rtPanel, slot0._tf)
	slot0:destroyCommanderPanel()
end

function slot0.onBackPressed(slot0)
	if slot0.levelCMDFormationView:isShowing() then
		slot0.levelCMDFormationView:ActionInvoke("Hide")
	else
		slot0:closeView()
	end
end

function slot0.UpdateFleets(slot0)
	for slot5, slot6 in pairs(slot0.contextData.fleets) do
		slot7 = slot0.rtFleets[slot5]
		slot8 = UIItemList.New(slot7, slot7:GetChild(0))

		slot8:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				uv0:UpdateFleet(slot2, uv1, slot1 + 1)
			end
		end)
		slot8:align(#slot1[slot5])
		setActive(slot7, #slot1[slot5] > 0)
	end
end

function slot0.updateCommanderBtn(slot0, slot1)
	setActive(slot1:Find("btn_recom"), not slot0.contextData.showCommander)
	setActive(slot1:Find("btn_clear"), not slot0.contextData.showCommander)
	setActive(slot1:Find("commander"), slot0.contextData.showCommander)
end

function slot0.UpdateFleet(slot0, slot1, slot2, slot3)
	slot0:updateCommanders(slot1:Find("commander"), slot2, slot3)

	slot6 = slot0.contextData.fleets[slot2][slot3]

	setText(slot1:Find("bg/name"), Fleet.DEFAULT_NAME[(slot2 == FleetType.Submarine and 10 or 0) + slot3])

	if slot2 == FleetType.Normal then
		slot0:UpdateShips(slot1:Find(TeamType.Main), TeamType.Main, slot6)
		slot0:UpdateShips(slot1:Find(TeamType.Vanguard), TeamType.Vanguard, slot6)
		setActive(slot1:Find("selected"), slot0:GetTeamShipCount(slot6[TeamType.Main]) > 0 and slot0:GetTeamShipCount(slot6[TeamType.Vanguard]) > 0)
	elseif slot2 == FleetType.Submarine then
		slot0:UpdateShips(slot1:Find(TeamType.Submarine), TeamType.Submarine, slot6)
		setActive(slot1:Find("selected"), slot0:GetTeamShipCount(slot6[TeamType.Submarine]) > 0)
	end

	onButton(slot0, slot1:Find("btn_recom"), function ()
		uv0:RecommendFormation(uv1, uv2)
		uv0:UpdateFleet(uv3, uv1, uv2)
	end, SFX_PANEL)
	onButton(slot0, slot1:Find("btn_clear"), function ()
		if uv0:GetTeamShipCount(uv1[TeamType.Main]) > 0 or uv0:GetTeamShipCount(uv1[TeamType.Vanguard]) > 0 or uv0:GetTeamShipCount(uv1[TeamType.Submarine]) > 0 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("battle_preCombatLayer_clear_confirm"),
				onYes = function ()
					uv0[TeamType.Main] = {}
					uv0[TeamType.Vanguard] = {}
					uv0[TeamType.Submarine] = {}

					uv1:UpdateFleet(uv2, uv3, uv4)
				end
			})
		end
	end, SFX_CANCEL)
end

function slot0.updateCommanders(slot0, slot1, slot2, slot3)
	for slot9 = 1, 2 do
		slot10 = Fleet.New({
			ship_list = {},
			commanders = slot0.contextData.fleets[slot2][slot3].commanders
		}):getCommanderByPos(slot9)
		slot11 = slot1:Find("pos" .. slot9)

		setActive(slot11:Find("add"), not slot10)
		setActive(slot11:Find("info"), slot10)

		if slot10 then
			setImageSprite(slot13:Find("frame"), GetSpriteFromAtlas("weaponframes", "commander_" .. Commander.rarity2Frame(slot10:getRarity())))
			GetImageSpriteFromAtlasAsync("CommanderHrz/" .. slot10:getPainting(), "", slot13:Find("mask/icon"))
		end

		onButton(slot0, slot12, function ()
			uv0:openCommanderPanel(uv1, uv2, uv3)
		end, SFX_PANEL)
		onButton(slot0, slot13, function ()
			uv0:openCommanderPanel(uv1, uv2, uv3)
		end, SFX_PANEL)
	end
end

function slot0.UpdateShips(slot0, slot1, slot2, slot3)
	slot4 = getProxy(BayProxy)
	slot5 = slot3[slot2]
	slot6 = {}

	for slot10, slot11 in ipairs({
		TeamType.Vanguard,
		TeamType.Main,
		TeamType.Submarine
	}) do
		for slot15 = 1, 3 do
			if slot3[slot11][slot15] then
				table.insert(slot6, slot4:getShipById(slot3[slot11][slot15]))
			end
		end
	end

	removeAllChildren(slot1)

	for slot10 = 1, 3 do
		slot11, slot12 = nil

		if slot5[slot10] then
			updateShip(cloneTplTo(slot0.rtShipTpl, slot1, "ship_" .. slot5[slot10]), slot4:getShipById(slot5[slot10]))
		else
			setActive(cloneTplTo(slot0.rtEmptyTpl, slot1, "empty"):Find("ship_type"), false)
		end

		onButton(slot0, slot11:Find("icon_bg"), function ()
			uv0:emit(WorldFleetSelectMediator.OnSelectShip, uv1, uv2, uv3)
		end, SFX_PANEL)

		slot13 = GetOrAddComponent(slot11:Find("icon_bg"), typeof(UILongPressTrigger))

		pg.DelegateInfo.Add(slot0, slot13.onLongPressed)
		slot13.onLongPressed:RemoveAllListeners()
		slot13.onLongPressed:AddListener(function ()
			if not uv0 then
				uv1:emit(WorldFleetSelectMediator.OnSelectShip, uv2, uv3, uv4)
			else
				uv1:emit(WorldFleetSelectMediator.OnShipDetail, {
					shipId = uv0.id,
					shipVOs = uv5
				})
			end
		end)
	end
end

function slot0.setCommanderPrefabs(slot0, slot1)
	slot0.commanderPrefabs = slot1
end

function slot0.openCommanderPanel(slot0, slot1, slot2, slot3)
	slot0.levelCMDFormationView:setCallback(function (slot0)
		if slot0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
			uv0:emit(WorldFleetSelectMediator.OnCommanderSkill, slot0.skill)
		elseif slot0.type == LevelUIConst.COMMANDER_OP_ADD then
			uv0.contextData.eliteCommanderSelected = {
				fleetType = uv1,
				fleetIndex = uv2,
				pos = slot0.pos
			}

			uv0:emit(WorldFleetSelectMediator.OnSelectEliteCommander, uv1, uv2, slot0.pos)
			uv0:closeCommanderPanel()
		else
			uv0:emit(WorldFleetSelectMediator.OnCommanderFormationOp, {
				FleetType = LevelUIConst.FLEET_TYPE_WORLD,
				data = slot0,
				fleets = uv0.contextData.fleets,
				fleetType = uv1,
				fleetIndex = uv2
			})
		end
	end)
	slot0.levelCMDFormationView:Load()
	slot0.levelCMDFormationView:ActionInvoke("update", slot1, slot0.commanderPrefabs)
	slot0.levelCMDFormationView:ActionInvoke("Show")
end

function slot0.closeCommanderPanel(slot0)
	slot0.levelCMDFormationView:ActionInvoke("Hide")
end

function slot0.updateCommanderFleet(slot0, slot1)
	if slot0.levelCMDFormationView:isShowing() then
		slot0.levelCMDFormationView:ActionInvoke("updateFleet", slot1)
	end
end

function slot0.updateCommanderPrefab(slot0)
	if slot0.levelCMDFormationView:isShowing() then
		slot0.levelCMDFormationView:ActionInvoke("updatePrefabs", slot0.commanderPrefabs)
	end
end

function slot0.buildCommanderPanel(slot0)
	slot0.levelCMDFormationView = LevelCMDFormationView.New(slot0._tf, slot0.event, slot0.contextData)
end

function slot0.destroyCommanderPanel(slot0)
	slot0.levelCMDFormationView:Destroy()

	slot0.levelCMDFormationView = nil
end

function slot0.CheckValid(slot0)
	for slot4, slot5 in pairs(slot0.contextData.fleets) do
		if slot4 == FleetType.Normal then
			for slot9, slot10 in ipairs(slot5) do
				if slot0:GetTeamShipCount(slot10[TeamType.Main]) == 0 or slot0:GetTeamShipCount(slot10[TeamType.Vanguard]) == 0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("world_fleet_formation_not_valid", Fleet.DEFAULT_NAME[slot9]))

					return false
				end
			end
		end
	end

	return true
end

function slot0.GetTeamShipCount(slot0, slot1)
	for slot6 = 1, 3 do
		if slot1[slot6] then
			slot2 = 0 + 1
		end
	end

	return slot2
end

function slot0.RecommendFormation(slot0, slot1, slot2)
	slot3 = {
		[FleetType.Normal] = {
			TeamType.Main,
			TeamType.Vanguard
		},
		[FleetType.Submarine] = {
			TeamType.Submarine
		}
	}
	slot4 = {}

	for slot8, slot9 in pairs(slot0.contextData.fleets) do
		for slot13, slot14 in ipairs(slot9) do
			for slot18, slot19 in ipairs(slot3[slot8]) do
				for slot23 = 1, 3 do
					if slot14[slot19][slot23] then
						table.insert(slot4, slot24)
					end
				end
			end
		end
	end

	slot5 = slot0.contextData.fleets[slot1][slot2]
	slot6 = getProxy(BayProxy)

	for slot10, slot11 in ipairs(slot3[slot1]) do
		for slot15 = 1, 3 do
			if not slot5[slot11][slot15] and slot6:getWorldRecommendShip(slot11, slot4) then
				slot5[slot11][slot15] = slot16.id

				table.insert(slot4, slot16.id)
			end
		end
	end
end

function slot0.CheckWorldResetAward(slot0)
	slot1 = {}

	if nowWorld.resetAward and #slot3 > 0 then
		if #pg.gameset.world_resetting_story.description[1] > 0 then
			table.insert(slot1, function (slot0)
				pg.NewStoryMgr.GetInstance():Play(uv0, slot0, true)
			end)
		end

		table.insert(slot1, function (slot0)
			slot1 = nil

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideYes = true,
				hideNo = true,
				type = MSGBOX_TYPE_WORLD_RESET,
				goShop = function ()
					uv0:Op("OpOpenLayer", Context.New({
						mediator = WorldShopMediator,
						viewComponent = WorldShopLayer
					}))
				end,
				itemFunc = function (slot0)
					uv0:emit(uv1.ON_DROP, slot0, function ()
						pg.MsgboxMgr.GetInstance():ShowMsgBox(uv0)
					end)
				end,
				drops = uv2,
				tipWord = i18n("world_recycle_item_transform"),
				onNo = slot0
			})
		end)
	end

	if slot2.resetLimitTip then
		table.insert(slot1, function (slot0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				content = i18n("world_resource_fill")
			})
		end)
	end

	seriesAsync(slot1, function ()
		uv0:ClearResetAward()
	end)
end

return slot0
