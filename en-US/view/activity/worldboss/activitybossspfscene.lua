slot0 = class("ActivityBossSPFScene", import("view.base.BaseUI"))
slot0.mediatorComponent = ActivityBossMediatorTemplate

function slot0.getUIName(slot0)
	return "ActivityBossSPFUI"
end

slot0.PTActID = ActivityConst.ACTIVITY_BOSS_SPF_PT

function slot0.init(slot0)
	slot0.mainTF = slot0:findTF("adapt")
	slot0.bg = slot0:findTF("bg")
	slot0.bottom = slot0:findTF("bottom", slot0.mainTF)
	slot0.hpBar = slot0:findTF("progress", slot0.bottom)
	slot0.barList = {}

	for slot4 = 1, 4, 1 do
		slot0.barList[slot4] = slot0:findTF(slot4, slot0.hpBar)
	end

	slot0.progressDigit = slot0:findTF("digit", slot0.bottom)
	slot0.digitbig = slot0.progressDigit:Find("big")
	slot0.digitsmall = slot0.progressDigit:Find("small")
	slot0.left = slot0:findTF("left", slot0.mainTF)
	slot0.rankTF = slot0:findTF("rank", slot0.left)
	slot0.rankList = slot0:Clone2Full(slot0.rankTF:Find("layout"), 3)

	for slot4, slot5 in ipairs(slot0.rankList) do
		slot5.gameObject:SetActive(false)
	end

	slot0.right = slot0:findTF("right", slot0.mainTF)
	slot0.stageList = {}

	for slot4 = 1, 4, 1 do
		slot0.stageList[slot4] = slot0:findTF(slot4, slot0.right)
	end

	slot0.awardFlash = slot0:findTF("ptaward/flash", slot0.right)
	slot0.awardBtn = slot0:findTF("ptaward/button", slot0.right)
	slot0.ptScoreTxt = slot0:findTF("ptaward/Text", slot0.right)
	slot0.top = slot0:findTF("top", slot0.mainTF)
	slot0.ticketNum = slot0:findTF("ticket/Text", slot0.top)
	slot0.helpBtn = slot0:findTF("help", slot0.top)

	onButton(slot0, slot0.top:Find("back_btn"), function ()
		uv0:emit(uv1.ON_BACK)
	end, SOUND_BACK)

	slot0.backBtn = slot0:findTF("back_button", slot0.top)

	onButton(slot0, slot0.top:Find("option"), function ()
		uv0:quckExitFunc()
	end, SFX_PANEL)

	slot0.bonusWindow = ActivityBossPtAwardSubPanel.New(slot0)

	slot0.bonusWindow:Load()
	slot0.bonusWindow.buffer:Hide()

	slot0.fleetEditPanel = ActivityBossBattleFleetSelectSubPanel.New(slot0)

	slot0.fleetEditPanel:Load()
	slot0.fleetEditPanel.buffer:Hide()

	slot0.commanderFormationPanel = ActivityBossBattleCMDForamtionSubPanel.New(slot0)

	slot0.commanderFormationPanel:Load()
	slot0.commanderFormationPanel.buffer:Hide()

	slot0.enterAnim = slot0.mainTF:GetComponent("Animation")

	setActive(slot0.top, false)
	setActive(slot0.left, false)
end

function slot0.EnterAnim(slot0)
	setActive(slot0.top, true)
	setActive(slot0.left, true)
	slot0.enterAnim:Play("Enter_Animation")
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.awardBtn, function ()
		uv0:ShowAwards()
	end, SFX_PANEL)
	onButton(slot0, slot0.helpBtn, function ()
		slot2.type = MSGBOX_TYPE_HELP
		slot2.helps = pg.gametip.world_boss_help.tip

		pg.MsgboxMgr.GetInstance():ShowMsgBox({})
	end, SFX_PANEL)

	for slot4, slot5 in ipairs(slot0.contextData.DisplayItems or {}) do
		slot7.type = slot0.contextData.DisplayItems[5 - slot4][1]
		slot7.id = slot0.contextData.DisplayItems[5 - slot4][2]
		slot7.count = slot0.contextData.DisplayItems[5 - slot4][3]

		updateDropCfg({})
		onButton(slot0, slot0:findTF("milestone/item", slot0.barList[slot4]), function ()
			uv0:emit(uv1.ON_DROP, uv2)
		end, SFX_PANEL)
	end

	for slot4 = 1, #slot0.stageList - 1, 1 do
		onButton(slot0, slot0.stageList[slot4], function ()
			uv0.contextData.manulOpen = true

			uv0:ShowNormalFleet(uv1)
		end, SFX_PANEL)
	end

	onButton(slot0, slot0.stageList[#slot0.stageList], function ()
		uv0:ShowEXFleet()
	end, SFX_PANEL)

	if slot0.contextData.editFleet then
		if slot0.contextData.editFleet <= #slot0.contextData.normalStageIDs then
			slot0:ShowNormalFleet(slot1)
		else
			slot0:ShowEXFleet()
		end
	end

	slot0:EnterAnim()
end

function slot0.UpdateView(slot0)
	slot0:UpdatePage()
	slot0:CheckStory()
end

function slot0.CheckStory(slot0)
	slot1 = pg.StoryMgr.GetInstance()

	table.eachAsync(slot0.contextData.activity:getConfig("config_client").story, function (slot0, slot1, slot2)
		if uv0.contextData.bossHP < slot1[1] + ((slot0 == 1 or slot1[1] == 0) and 1 or 0) then
			uv1:Play(slot1[2], slot2)
		else
			slot2()
		end
	end)
end

function slot0.UpdatePage(slot0)
	slot1 = slot0.contextData.bossHP

	setText(slot0.digitbig, math.floor(slot1 / 100))
	setText(slot0.digitsmall, string.format("%02d", slot1 % 100))

	for slot6 = 1, 4, 1 do
		slot7 = slot0.barList[slot6]

		setSlider(slot0:findTF("Slider", slot7), 0, 2500, math.min(math.max(slot1 - (slot6 - 1) * 2500, 0), 2500))

		slot8 = slot0.contextData.mileStones[5 - slot6]

		setActive(slot0:findTF("milestone/item", slot7), not slot8)
		setActive(slot0:findTF("milestone/time", slot7), slot8)

		if slot8 then
			setText(slot0:findTF("milestone/time/Text", slot7), pg.TimeMgr.GetInstance():CTimeDescC(slot0.contextData.mileStones[5 - slot6], "%m/%d/%H:%M"))
		end
	end

	for slot6 = 1, #slot0.stageList - 1, 1 do
		slot7 = slot0.contextData.normalStageIDs[slot6]
		slot8 = slot0.stageList[slot6]

		for slot12, slot13 in ipairs(slot0.contextData.ticketInitPools) do
			for slot17, slot18 in ipairs(slot13[1]) do
				if slot18 == slot7 then
					slot20 = slot0.contextData.stageTickets[slot7] or 0

					setActive(slot8:Find("Text"), slot20 > 0)
					setText(slot8:Find("Text"), string.format("%d/%d", slot20, slot13[2]))
				end
			end
		end
	end

	setText(slot0.ptScoreTxt, slot0.contextData.ptData.count)
	setActive(slot0.awardFlash, slot0.contextData.ptData:CanGetAward())

	if slot0.bonusWindow:GetLoaded() then
		if slot0.bonusWindow:IsShowing() then
			slot0.bonusWindow.buffer:UpdateView(slot0.contextData.ptData)
		end
	end

	setText(slot0.ticketNum, slot0:GetEXTicket())
end

function slot0.GetEXTicket(slot0)
	return getProxy(PlayerProxy):getRawData():getResource(slot0.contextData.TicketID)
end

function slot0.ShowNormalFleet(slot0, slot1)
	if not slot0.contextData.actFleets[slot1] then
		slot0.contextData.actFleets[slot1] = slot0:CreateNewFleet(slot1)
	end

	if not slot0.contextData.actFleets[slot1 + 10] then
		slot0.contextData.actFleets[slot1 + 10] = slot0:CreateNewFleet(slot1 + 10)
	end

	if slot0.contextData.manulOpen and #slot0.contextData.actFleets[slot1].ships <= 0 then
		for slot6 = #slot0.contextData.normalStageIDs, 1, -1 do
			slot7 = slot0.contextData.actFleets[slot6]

			if slot6 ~= slot1 and slot7 and slot7:isLegalToFight() then
				slot2:updateShips(slot7.ships)

				break
			end
		end
	end

	slot0.contextData.manulOpen = nil

	slot0.fleetEditPanel.buffer:SetSettings(1, 1, true, false)

	slot5[1] = slot0.contextData.actFleets[slot1]
	slot5[2] = slot0.contextData.actFleets[slot1 + 10]

	slot0.fleetEditPanel.buffer:SetFleets({})

	slot0.contextData.editFleet = slot1

	slot0.fleetEditPanel.buffer:UpdateView()
	slot0.fleetEditPanel.buffer:Show()
end

function slot0.ShowEXFleet(slot0)
	if not slot0.contextData.actFleets[#slot0.contextData.normalStageIDs + 1] then
		slot0.contextData.actFleets[slot1] = slot0:CreateNewFleet(slot1)
	end

	if not slot0.contextData.actFleets[slot1 + 10] then
		slot0.contextData.actFleets[slot1 + 10] = slot0:CreateNewFleet(slot1 + 10)
	end

	slot0.fleetEditPanel.buffer:SetSettings(1, 1, true, true)

	slot4[1] = slot0.contextData.actFleets[slot1]
	slot4[2] = slot0.contextData.actFleets[slot1 + 10]

	slot0.fleetEditPanel.buffer:SetFleets({})

	slot0.contextData.editFleet = slot1

	slot0.fleetEditPanel.buffer:UpdateView()
	slot0.fleetEditPanel.buffer:Show()
end

function slot0.commitEdit(slot0)
	slot0:emit(uv0.mediatorComponent.ON_COMMIT_FLEET)
end

function slot0.commitCombat(slot0)
	if slot0.contextData.editFleet > #slot0.contextData.normalStageIDs then
		slot0:emit(uv0.mediatorComponent.ON_EX_PRECOMBAT, slot0.contextData.editFleet, false)
	else
		slot0:emit(uv0.mediatorComponent.ON_PRECOMBAT, slot0.contextData.editFleet)
	end
end

function slot0.commitTrybat(slot0)
	slot0:emit(uv0.mediatorComponent.ON_EX_PRECOMBAT, slot0.contextData.editFleet, true)
end

function slot0.updateEditPanel(slot0)
	slot0.fleetEditPanel:UpdateView()
end

function slot0.hideFleetEdit(slot0)
	slot0.fleetEditPanel.buffer:Hide()
	slot0.commanderFormationPanel.buffer:Close()

	slot0.contextData.editFleet = nil
end

function slot0.openShipInfo(slot0, slot1, slot2)
	for slot9, slot10 in ipairs(slot0.contextData.actFleets[slot2] and slot3.ships or {}) do
		table.insert({}, getProxy(BayProxy):getShipById(slot10))
	end

	slot9.shipId = slot1
	slot9.shipVOs = slot4

	slot0:emit(uv0.mediatorComponent.ON_FLEET_SHIPINFO, {})
end

function slot0.openCommanderPanel(slot0, slot1)
	slot0.commanderFormationPanel.buffer:Open()
	slot0.commanderFormationPanel.buffer:Update(slot1)
end

function slot0.SelectCMD(slot0, slot1, slot2)
	slot0:emit(uv0.mediatorComponent.ON_SELECT_COMMANDER, slot1, slot2)
end

function slot0.ShowAwards(slot0)
	slot0.bonusWindow.buffer:UpdateView(slot0.contextData.ptData)
	slot0.bonusWindow.buffer:Show()
end

function slot0.CreateNewFleet(slot0, slot1)
	slot3.id = slot1
	slot3.ship_list = {}
	slot3.commanders = {}

	return Fleet.New({})
end

function slot0.UpdateRank(slot0, slot1)
	slot1 = slot1 or {}

	for slot5 = 1, #slot0.rankList, 1 do
		setActive(slot0.rankList[slot5], slot5 <= #slot1)

		if slot5 <= #slot1 then
			setText(slot6:Find("Text"), tostring(slot1[slot5].name))
		end
	end
end

function slot0.Clone2Full(slot0, slot1, slot2)
	slot4 = slot1:GetChild(0)

	for slot9 = 0, slot1.childCount - 1, 1 do
		table.insert({}, slot1:GetChild(slot9))
	end

	for slot9 = slot5, slot2 - 1, 1 do
		table.insert(slot3, tf(cloneTplTo(slot4, slot1)))
	end

	return slot3
end

function slot0.willExit(slot0)
	slot0.fleetEditPanel:Destroy()
	slot0.commanderFormationPanel:Destroy()
	slot0.bonusWindow:Destroy()
end

return slot0
