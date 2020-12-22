slot0 = class("SVOrderPanel", import("view.base.BaseSubView"))

function slot0.getUIName(slot0)
	return "SVOrderPanel"
end

function slot0.OnLoaded(slot0)
end

function slot0.OnInit(slot0)
	slot1 = slot0._tf
	slot2 = slot1:Find("adapt/order_list")
	slot0.btnRedeploy = slot2:Find("redeploy")
	slot0.btnExpansion = slot2:Find("expansion")
	slot0.btnMaintenance = slot2:Find("maintenance")
	slot0.btnFOV = slot2:Find("fov")
	slot0.btnSubmarine = slot2:Find("submarine")
	slot0.btnHelp = slot1:Find("adapt/help")
	slot0.btnBack = slot1:Find("adapt/back")
	slot0.rtRing = slot1:Find("bg/ring")
	slot0.wsCompass = WSCompass.New()
	slot0.wsCompass.tf = slot1:Find("bg/ring/compass")
	slot0.wsCompass.pool = slot0.contextData.wsPool

	slot0.wsCompass:Setup(true)
	onButton(slot0, slot0.btnBack, function ()
		uv0:Hide()
	end, SFX_CANCEL)
	onButton(slot0, slot0.btnHelp, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("world_instruction_help_1")
		})
	end, SFX_PANEL)
end

function slot0.OnDestroy(slot0)
	slot0:ClearBtnTimers()
	slot0.wsCompass:Dispose()
end

function slot0.Show(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {
		blurLevelCamera = true
	})
	setActive(slot0._tf, true)
	pg.CriMgr.GetInstance():PlayBGM("echo-loop", "sub_view")
end

function slot0.Hide(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0._parentTf)
	setActive(slot0._tf, false)
	pg.CriMgr.GetInstance():ResumeLastNormalBGM()
	slot0:ClearComppass()
	slot0:ClearBtnTimers()
end

function slot0.Setup(slot0, slot1, slot2, slot3)
	slot0:Update(slot1, slot2)
	slot0.wsCompass:SetAnchorEulerAngles(slot3)
end

function slot0.Update(slot0, slot1, slot2)
	if slot0.entrance ~= slot1 or slot0.map ~= slot2 or slot0.gid ~= slot2.gid then
		slot0.entrance = slot1
		slot0.map = slot2
		slot0.gid = slot2.gid
	end

	slot0:UpdateCompassMarks()
	slot0:UpdateOrderBtn()
end

function slot0.SetButton(slot0, slot1, slot2)
	slot3 = slot1:Find("type_lock")

	setActive(slot3, not nowWorld:IsSystemOpen(slot2.system))
	setActive(slot1:Find("type_unable"), not isActive(slot3) and (slot2.isLock or slot2.timeStamp and pg.TimeMgr.GetInstance():GetServerTime() < slot2.timeStamp))
	setActive(slot1:Find("type_enable"), not isActive(slot3) and not isActive(slot4))

	if isActive(slot3) then
		onButton(slot0, slot3, function ()
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_instruction_all_1"))
		end, SFX_CONFIRM)
	end

	if isActive(slot4) then
		setActive(slot4:Find("cost"), slot2.isLock)
		setActive(slot4:Find("time"), not slot2.isLock)

		if slot2.isLock then
			setText(slot4:Find("cost/Text"), slot2.cost)
			onButton(slot0, slot4, slot2.lockFunc, SFX_CONFIRM)
		else
			slot0.timers[slot4] = Timer.New(function ()
				if uv0.timeStamp - pg.TimeMgr.GetInstance():GetServerTime() < 0 then
					uv1:UpdateOrderBtn()
				else
					setText(uv2:Find("time/Text"), string.format("%d:%d:%d", math.floor(slot0 / 3600), math.floor(slot0 % 3600 / 60), slot0 % 60))
				end
			end, 1, -1)

			slot0.timers[slot4].func()
			slot0.timers[slot4]:Start()
			onButton(slot0, slot4, slot2.timeFunc, SFX_CONFIRM)
		end
	end

	if isActive(slot5) then
		setText(slot5:Find("cost/Text"), slot2.cost)
		onButton(slot0, slot5, slot2.enableFunc, SFX_CONFIRM)
	end
end

function slot0.UpdateOrderBtn(slot0)
	slot0:ClearBtnTimers()

	slot0.timers = {}
	slot2 = slot0.map:GetConfig("instruction_available")
	slot3 = checkExist(slot0.map, {
		"GetPort"
	})
	slot4 = nowWorld:IsSystemOpen(WorldConst.SystemOrderRedeploy) and slot1.realm == checkExist(slot3, {
		"GetRealm"
	}) and checkExist(slot3, {
		"IsOpen",
		{
			slot1.realm,
			slot1:GetProgress()
		}
	}) and slot1:BuildFormationIds()
	slot5 = {
		system = WorldConst.SystemOrderRedeploy,
		isLock = not slot4,
		lockFunc = function ()
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_instruction_redeploy_1"))
		end,
		cost = slot1:CalcOrderCost(WorldConst.OpReqRedeploy),
		enableFunc = function (slot0, slot1)
			uv0:Hide()
			uv0:emit(WorldScene.SceneOp, "OpRedeploy")
		end
	}

	slot0:SetButton(slot0.btnRedeploy, slot5)
	slot0:SetButton(slot0.btnExpansion, slot5)
	setActive(slot0.btnRedeploy, slot4 ~= WorldConst.FleetExpansion)
	setActive(slot0.btnExpansion, slot4 == WorldConst.FleetExpansion)

	slot6 = pg.TimeMgr.GetInstance()

	slot0:SetButton(slot0.btnMaintenance, {
		system = WorldConst.SystemOrderMaintenance,
		timeStamp = slot1:GetReqCDTime(WorldConst.OpReqMaintenance) + pg.gameset.world_instruction_maintenance.description[2],
		timeFunc = function (slot0)
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_instruction_supply_2", uv0:DescCDTime(uv1 - pg.TimeMgr.GetInstance():GetServerTime())))
		end,
		cost = slot1:CalcOrderCost(WorldConst.OpReqMaintenance),
		enableFunc = function ()
			slot0 = uv0.staminaMgr:GetTotalStamina()

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("world_instruction_morale_1", setColorStr(uv1, COLOR_GREEN), setColorStr(slot0, uv1 <= slot0 and COLOR_GREEN or COLOR_RED)),
				onYes = function ()
					uv0:Hide()

					if uv1.staminaMgr:GetTotalStamina() < uv2 then
						uv1.staminaMgr:Show()
					else
						uv0:emit(WorldScene.SceneOp, "OpReqMaintenance", uv0.map:GetFleet().id)
					end
				end
			})
		end
	})
	slot0:SetButton(slot0.btnSubmarine, {
		system = WorldConst.SystemOrderSubmarine,
		isLock = slot2[1] == 0 or not slot1:CanCallSubmarineSupport() or slot1:IsSubmarineSupporting() and slot1:GetSubAidFlag(),
		lockFunc = function ()
			if uv0[1] == 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("world_instruction_submarine_1"))
			elseif not uv1:CanCallSubmarineSupport() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("world_instruction_submarine_4"))
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("world_instruction_submarine_3"))
			end
		end,
		cost = slot1:CalcOrderCost(WorldConst.OpReqSub),
		enableFunc = function ()
			slot0 = uv0:CalcOrderCost(WorldConst.OpReqSub)
			slot1 = uv0.staminaMgr:GetTotalStamina()

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n(uv0:IsSubmarineSupporting() and "world_instruction_submarine_7" or "world_instruction_submarine_2", setColorStr(slot0, COLOR_GREEN), setColorStr(slot1, slot0 <= slot1 and COLOR_GREEN or COLOR_RED)),
				onYes = function ()
					uv0:Hide()

					if uv1.staminaMgr:GetTotalStamina() < uv2 then
						uv1.staminaMgr:Show()
					else
						uv0:emit(WorldScene.SceneOp, "OpReqSub")
					end
				end
			})
		end
	})
	slot0:SetButton(slot0.btnFOV, {
		system = WorldConst.SystemOrderFOV,
		isLock = slot2[2] == 0 or slot0.map.visionFlag,
		lockFunc = function ()
			if uv0[2] == 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("world_instruction_submarine_1"))
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("world_instruction_detect_2"))
			end
		end,
		cost = slot1:CalcOrderCost(WorldConst.OpReqVision),
		enableFunc = function ()
			slot0 = uv0:CalcOrderCost(WorldConst.OpReqVision)
			slot1 = uv0.staminaMgr:GetTotalStamina()

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("world_instruction_detect_1", setColorStr(slot0, COLOR_GREEN), setColorStr(slot1, slot0 <= slot1 and COLOR_GREEN or COLOR_RED)),
				onYes = function ()
					uv0:Hide()

					if uv1.staminaMgr:GetTotalStamina() < uv2 then
						uv1.staminaMgr:Show()
					else
						uv0:emit(WorldScene.SceneOp, "OpReqVision")
					end
				end
			})
		end
	})
end

function slot0.ClearBtnTimers(slot0)
	if slot0.timers then
		for slot4, slot5 in pairs(slot0.timers) do
			slot5:Stop()
		end
	end

	slot0.timers = nil
end

function slot0.UpdateCompassMarks(slot0)
	slot0.wsCompass:ClearMarks()
	slot0.wsCompass:Update(slot0.entrance, slot0.map)
end

function slot0.ClearComppass(slot0)
	slot0.wsCompass.map = nil

	slot0.wsCompass:RemoveCellsListener()
end

return slot0
