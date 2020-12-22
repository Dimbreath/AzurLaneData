slot0 = class("WSMapRight", import("...BaseEntity"))
slot0.Fields = {
	map = "table",
	onOpenScanner = "function",
	rtTipWord = "userdata",
	btnHelp = "userdata",
	btnPort = "userdata",
	btnDetail = "userdata",
	tipEventPri = "number",
	btnScan = "userdata",
	taskProxy = "table",
	btnInventory = "userdata",
	btnInformation = "userdata",
	gid = "number",
	fleet = "table",
	entrance = "table",
	world = "table",
	wsPool = "table",
	btnDefeat = "userdata",
	btnExit = "userdata",
	transform = "userdata",
	wsCompass = "table",
	btnOrder = "userdata",
	rtCompassPanel = "userdata",
	wsTimer = "table",
	onOpenOrder = "function"
}
slot0.Listeners = {
	onUpdateFleetBuff = "OnUpdateFleetBuff",
	onClearLog = "OnClearLog",
	onAppendLog = "OnAppendLog",
	onUpdateFleetLocation = "OnUpdateFleetLocation",
	onUpdateFleetDefeat = "OnUpdateFleetDefeat",
	onUpdateInfoBtnTip = "OnUpdateInfoBtnTip",
	onUpdateSelectedFleet = "OnUpdateSelectedFleet"
}

function slot0.Setup(slot0)
	pg.DelegateInfo.New(slot0)
	slot0:Init()
end

function slot0.Dispose(slot0)
	slot0.wsCompass:Dispose()
	slot0:RemoveFleetListener(slot0.fleet)
	slot0:RemoveMapListener()

	if slot0.taskProxy then
		slot0.taskProxy:RemoveListener(WorldTaskProxy.EventUpdateTask, slot0.onUpdateInfoBtnTip)

		slot0.taskProxy = nil
	end

	pg.DelegateInfo.Dispose(slot0)
	slot0:Clear()
end

function slot0.Init(slot0)
	slot1 = slot0.transform
	slot0.rtCompassPanel = slot1:Find("compass_panel")
	slot0.btnOrder = slot0.rtCompassPanel:Find("btn_order")
	slot0.btnScan = slot0.rtCompassPanel:Find("btn_scan")
	slot0.btnDefeat = slot0.rtCompassPanel:Find("btn_defeat")

	onButton(slot0, slot0.btnOrder, function ()
		if uv0.onOpenOrder then
			uv0.onOpenOrder()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.btnScan, function ()
		if uv0.onOpenScanner then
			uv0.onOpenScanner()
		end
	end, SFX_PANEL)

	slot0.btnInventory = slot1:Find("btn_list/dock/inventory_button")
	slot0.btnInformation = slot1:Find("btn_list/dock/information_button")
	slot0.btnDetail = slot1:Find("btn_list/dock/detail_button")
	slot0.btnHelp = slot1:Find("btn_list/dock/help_button")
	slot0.btnPort = slot1:Find("btn_list/port_button")
	slot0.btnExit = slot1:Find("btn_list/exit_button")

	setActive(slot0.btnPort, false)
	setActive(slot0.btnExit, false)

	slot0.wsCompass = WSCompass.New()
	slot0.wsCompass.tf = slot0.rtCompassPanel:Find("ring/compass")
	slot0.wsCompass.pool = slot0.wsPool

	slot0.wsCompass:Setup()

	slot0.rtTipWord = slot1:Find("tip_word")
	slot0.taskProxy = nowWorld:GetTaskProxy()

	slot0.taskProxy:AddListener(WorldTaskProxy.EventUpdateTask, slot0.onUpdateInfoBtnTip)
end

function slot0.Update(slot0, slot1, slot2)
	if slot0.entrance ~= slot1 or slot0.map ~= slot2 or slot0.gid ~= slot2.gid then
		slot0:RemoveMapListener()

		slot0.entrance = slot1
		slot0.map = slot2
		slot0.gid = slot2.gid

		slot0:AddMapListener()
		slot0:OnUpdateSelectedFleet()
		slot0:UpdateCompass()
		slot0:UpdateExit()
		slot0:OnUpdateEventTips()
	end
end

function slot0.AddMapListener(slot0)
	if slot0.map then
		slot0.map:AddListener(WorldMap.EventUpdateFIndex, slot0.onUpdateSelectedFleet)
	end
end

function slot0.RemoveMapListener(slot0)
	if slot0.map then
		slot0.map:RemoveListener(WorldMap.EventUpdateFIndex, slot0.onUpdateSelectedFleet)
	end
end

function slot0.AddFleetListener(slot0, slot1)
	if slot1 then
		slot1:AddListener(WorldMapFleet.EventUpdateLocation, slot0.onUpdateFleetLocation)
		slot1:AddListener(WorldMapFleet.EventUpdateBuff, slot0.onUpdateFleetBuff)
		slot1:AddListener(WorldMapFleet.EventUpdateDefeat, slot0.onUpdateFleetDefeat)
	end
end

function slot0.RemoveFleetListener(slot0, slot1)
	if slot1 then
		slot1:RemoveListener(WorldMapFleet.EventUpdateLocation, slot0.onUpdateFleetLocation)
		slot1:RemoveListener(WorldMapFleet.EventUpdateBuff, slot0.onUpdateFleetBuff)
		slot1:RemoveListener(WorldMapFleet.EventUpdateDefeat, slot0.onUpdateFleetDefeat)
	end
end

function slot0.OnUpdateSelectedFleet(slot0, slot1)
	slot2 = slot0.map:GetFleet()

	if not slot1 or slot0.fleet ~= slot2 then
		slot0:RemoveFleetListener(slot0.fleet)

		slot0.fleet = slot2

		slot0:AddFleetListener(slot0.fleet)
		slot0:UpdateCompassRotation(slot2)
		slot0:OnUpdateFleetLocation()
		slot0:OnUpdateFleetBuff()
		slot0:OnUpdateFleetDefeat()
	end
end

function slot0.OnUpdateFleetLocation(slot0)
	if not slot0.map.active then
		return
	end

	setActive(slot0.btnPort, slot0.map:InPort(slot0.fleet.id))
	slot0:UpdateCompassMarks()
end

function slot0.OnUpdateFleetBuff(slot0)
	setActive(slot0.wsCompass.tf, not slot0.fleet:GetBuffByTrap(WorldBuff.TrapCompassInterference))
end

function slot0.OnUpdateFleetDefeat(slot0)
	setText(slot0.btnDefeat:Find("Text"), math.min(slot0.fleet:getDefeatCount(), 99))
end

function slot0.UpdateCompass(slot0)
	slot0:UpdateCompassMarks()
	slot0:UpdateCompassRotation(slot0.map:GetFleet())
end

function slot0.UpdateCompossView(slot0, slot1, slot2)
	slot0.wsCompass:UpdateByViewer(slot0.map, slot1, slot2)
end

function slot0.UpdateCompassRotation(slot0, slot1)
	slot0.wsCompass:UpdateCompassRotation(slot1)
end

function slot0.UpdateCompassMarks(slot0)
	slot0.wsCompass:ClearMarks()
	slot0.wsCompass:Update(slot0.entrance, slot0.map)
end

function slot0.OnUpdateEventTips(slot0)
	slot1, slot2 = slot0.map:GetEventTipWord()

	if slot0.tipEventPri ~= slot2 then
		setActive(slot0.rtTipWord, false)

		slot0.tipEventPri = slot2
	end

	setActive(slot0.rtTipWord, slot2 > 0)

	if slot2 > 0 then
		setText(slot0.rtTipWord:Find("Text"), slot1)
	end
end

function slot0.UpdateExit(slot0)
	setActive(slot0.btnExit, slot0.map:canExit())
end

function slot0.OnUpdateInfoBtnTip(slot0)
	setActive(slot0.btnInformation:Find("tip"), _.any(slot0.taskProxy:getTaskVOs(), function (slot0)
		return slot0:getState() == WorldTask.STATE_FINISHED
	end))
end

function slot0.OnUpdateHelpBtnTip(slot0, slot1)
	setActive(slot0.btnHelp:Find("imge/tip"), WorldConst.IsWorldHelpNew(nowWorld:GetProgress(), slot1))
end

return slot0
