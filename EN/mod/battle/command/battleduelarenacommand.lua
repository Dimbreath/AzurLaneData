ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = ys.Battle.BattleEvent
slot3 = class("BattleDuelArenaCommand", ys.MVC.Command)
ys.Battle.BattleDuelArenaCommand = slot3
slot3.__name = "BattleDuelArenaCommand"

function slot3.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot3.ConfigBattleData(slot0, slot1)
	slot0._battleInitData = slot1
end

function slot3.Initialize(slot0)
	slot0:Init()
	slot0.super.Initialize(slot0)

	slot0._dataProxy = slot0._state:GetProxyByName(slot1.Battle.BattleDataProxy.__name)
	slot0._uiMediator = slot0._state:GetMediatorByName(slot1.Battle.BattleUIMediator.__name)

	slot0:InitProtocol()
	slot0:AddEvent()
end

function slot3.DoPrologue(slot0)
	slot0._dataProxy:InitUserShipsData(slot0._battleInitData.RivalMainUnitList, slot0._battleInitData.RivalVanguardUnitList, slot0.Battle.BattleConfig.FOE_CODE, {})
	slot0._userFleet:SnapShot()
	slot0._rivalFleet:SnapShot()

	slot0._rivalWeaponBot = slot0.Battle.BattleManualWeaponAutoBot.New(slot0._rivalFleet)
	slot0._rivalJoyStickBot = slot0.Battle.BattleJoyStickAutoBot.New(slot0._dataProxy, slot0._rivalFleet)
	slot1 = slot0._uiMediator:InitDuelRateBar()

	slot1:SetFleetVO(slot0._userFleet, {
		name = getProxy(PlayerProxy):getData().name,
		level = getProxy(PlayerProxy).getData().level
	})
	slot1:SetFleetVO(slot0._rivalFleet, {
		name = slot0._dataProxy:GetInitData().RivalVO.name,
		level = slot0._dataProxy.GetInitData().RivalVO.level
	})
	slot0._uiMediator:OpeningEffect(function ()
		slot0._state:ChangeState(slot1.Battle.BattleState.BATTLE_STATE_FIGHT)
		slot0._state.ChangeState._weaponCommand:ActiveBot(true, false)
		slot0._state.ChangeState._weaponCommand.ActiveBot._rivalWeaponBot:SetActive(true, false)
		slot0._state.ChangeState._weaponCommand.ActiveBot._rivalWeaponBot.SetActive._rivalJoyStickBot:SetActive(true)
		slot0._state.ChangeState._weaponCommand.ActiveBot._rivalWeaponBot.SetActive._rivalJoyStickBot.SetActive._uiMediator:InitCameraGestureSlider()
		slot0._state.ChangeState._weaponCommand.ActiveBot._rivalWeaponBot.SetActive._rivalJoyStickBot.SetActive._uiMediator.InitCameraGestureSlider._uiMediator:ShowTimer()
		slot0._state.ChangeState._weaponCommand.ActiveBot._rivalWeaponBot.SetActive._rivalJoyStickBot.SetActive._uiMediator.InitCameraGestureSlider._uiMediator.ShowTimer._uiMediator:ShowDuelBar()
		slot0._state.ChangeState._weaponCommand.ActiveBot._rivalWeaponBot.SetActive._rivalJoyStickBot.SetActive._uiMediator.InitCameraGestureSlider._uiMediator.ShowTimer._uiMediator.ShowDuelBar._uiMediator:EnableJoystick(false)
		slot0._state.ChangeState._weaponCommand.ActiveBot._rivalWeaponBot.SetActive._rivalJoyStickBot.SetActive._uiMediator.InitCameraGestureSlider._uiMediator.ShowTimer._uiMediator.ShowDuelBar._uiMediator.EnableJoystick._uiMediator:EnableWeaponButton(false)
	end)

	for slot8, slot9 in pairs(slot4) do
		slot9:FleetWarcry()

		for slot14, slot15 in ipairs(slot10) do
			for slot21, slot22 in ipairs(slot17) do
				slot15:AddBuff(slot0.Battle.BattleBuffUnit.New(slot22))
			end
		end
	end

	slot0._uiMediator:EnableWeaponButton(false)
	slot0._dataProxy:InitAllFleetUnitsWeaponCD()
	slot0._dataProxy:TirggerBattleStartBuffs()

	for slot9, slot10 in ipairs(slot5) do
		slot10:AddBuff(slot0.Battle.BattleBuffUnit.New(slot0.Battle.BattleConfig.DULE_BALANCE_BUFF))
	end
end

function slot3.Update(slot0)
	slot0._rivalWeaponBot:Update()
end

function slot3.Init(slot0)
	slot0._unitDataList = {}
end

function slot3.Clear(slot0)
	for slot4, slot5 in pairs(slot0._unitDataList) do
		slot0:UnregisterUnitEvent(slot5)

		slot0._unitDataList[slot4] = nil
	end
end

function slot3.Reinitialize(slot0)
	slot0._state:Deactive()
	slot0:Clear()
	slot0:Init()
end

function slot3.Dispose(slot0)
	slot0:Clear()
	slot0:RemoveEvent()
	slot0.super.Dispose(slot0)
end

function slot3.onInitBattle(slot0)
	slot0._weaponCommand = slot0._state:GetCommandByName(slot0.Battle.BattleControllerWeaponCommand.__name)
	slot0._userFleet = slot0._dataProxy:GetFleetByIFF(slot0.Battle.BattleConfig.FRIENDLY_CODE)
	slot0._rivalFleet = slot0._dataProxy:GetFleetByIFF(slot0.Battle.BattleConfig.FOE_CODE)
end

function slot3.InitProtocol(slot0)
	return
end

function slot3.AddEvent(slot0)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.ADD_UNIT, slot0.onAddUnit)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.REMOVE_UNIT, slot0.onRemoveUnit)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.STAGE_DATA_INIT_FINISH, slot0.onInitBattle)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.SHUT_DOWN_PLAYER, slot0.onPlayerShutDown)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.UPDATE_COUNT_DOWN, slot0.onUpdateCountDown)
end

function slot3.RemoveEvent(slot0)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.ADD_UNIT)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.REMOVE_UNIT)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.STAGE_DATA_INIT_FINISH)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.SHUT_DOWN_PLAYER)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.UPDATE_COUNT_DOWN)
end

function slot3.onAddUnit(slot0, slot1)
	slot2 = slot1.Data.type

	slot0:RegisterUnitEvent(slot3)

	slot0._unitDataList[slot1.Data.unit:GetUniqueID()] = slot1.Data.unit
end

function slot3.RegisterUnitEvent(slot0, slot1)
	slot1:RegisterEventListener(slot0, slot0.DYING, slot0.onUnitDying)
	slot1:RegisterEventListener(slot0, slot0.UPDATE_HP, slot0.onUpdateUnitHP)

	if slot1:GetUnitType() == slot1.Battle.BattleConst.UnitType.PLAYER_UNIT then
		slot1:RegisterEventListener(slot0, slot0.SHUT_DOWN_PLAYER, slot0.onShutDownPlayer)
	end
end

function slot3.UnregisterUnitEvent(slot0, slot1)
	slot1:UnregisterEventListener(slot0, slot0.DYING)
	slot1:UnregisterEventListener(slot0, slot0.UPDATE_HP)

	if slot1:GetUnitType() == slot1.Battle.BattleConst.UnitType.PLAYER_UNIT then
		slot1:UnregisterEventListener(slot0, slot0.SHUT_DOWN_PLAYER)
	end
end

function slot3.onRemoveUnit(slot0, slot1)
	if slot0._unitDataList[slot1.Data.UID] == nil then
		return
	end

	slot0:UnregisterUnitEvent(slot3)

	slot0._unitDataList[slot2] = nil
end

function slot3.onPlayerShutDown(slot0, slot1)
	if slot0._state:GetState() ~= slot0._state.BATTLE_STATE_FIGHT then
		return
	end

	if slot0._failReason == nil then
		slot0.Battle.BattleState.GenerateVertifyData(1)

		slot2, slot3 = slot0.Battle.BattleState.Vertify()

		if not slot2 then
			slot0._failReason = 900 + slot3
		end
	end

	if #slot0._userFleet:GetUnitList() == 0 or #slot0._rivalFleet:GetUnitList() == 0 then
		slot0._dataProxy:CalcDuelScoreAtEnd(slot0._userFleet, slot0._rivalFleet)

		if slot0._failReason then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = slot0._failReason
			})

			return
		end

		slot0._failReason = nil

		slot0._state:BattleEnd()
	end

	slot3 = #slot0._rivalFleet:GetScoutList()

	if #slot0._userFleet:GetScoutList() == 0 and slot3 ~= 0 then
		slot0._dataProxy:ShiftFleetBound(slot0._rivalFleet, slot0.Battle.BattleConfig.FRIENDLY_CODE)
		slot0._rivalJoyStickBot:UpdateFleetArea()
		slot0._rivalJoyStickBot:SwitchStrategy(slot0.Battle.BattleJoyStickAutoBot.COUNTER_MAIN)
	end

	if slot3 == 0 and slot2 ~= 0 then
		slot0._dataProxy:ShiftFleetBound(slot0._userFleet, slot0.Battle.BattleConfig.FOE_CODE)
		slot0._weaponCommand:GetStickBot():UpdateFleetArea()
		slot0._weaponCommand:GetStickBot():SwitchStrategy(slot0.Battle.BattleJoyStickAutoBot.COUNTER_MAIN)
	end

	if not slot1.Data.unit:IsMainFleetUnit() and slot2 == 0 and slot3 == 0 then
		slot6 = slot0._rivalFleet:GetMainList()

		for slot10, slot11 in ipairs(slot5) do
			slot11:AddBuff(slot0.Battle.BattleBuffUnit.New(slot0.Battle.BattleConfig.DUEL_MAIN_RAGE_BUFF))
		end

		for slot10, slot11 in ipairs(slot6) do
			slot11:AddBuff(slot0.Battle.BattleBuffUnit.New(slot0.Battle.BattleConfig.DUEL_MAIN_RAGE_BUFF))
		end

		pg.TipsMgr.GetInstance():ShowTips(i18n("battle_duel_main_rage"))
	end
end

function slot3.onUpdateCountDown(slot0, slot1)
	if slot0._dataProxy:GetCountDown() <= 0 then
		slot8, slot10 = slot0._userFleet:GetDamageRatioResult()
		slot9, slot11 = slot0._rivalFleet:GetDamageRatioResult()

		slot0._dataProxy:CalcDuelScoreAtTimesUp(slot2, slot4, slot3, slot5)
		slot0._state:BattleEnd()
	end
end

function slot3.onUpdateUnitHP(slot0, slot1)
	slot1.Dispatcher.GetFleetVO(slot2):UpdateFleetDamage(slot1.Data.validDHP)
end

function slot3.onUnitDying(slot0, slot1)
	slot0._dataProxy:CalcBattleScoreWhenDead(slot2)
	slot0._dataProxy:KillUnit(slot1.Dispatcher.GetUniqueID(slot2))
end

function slot3.onShutDownPlayer(slot0, slot1)
	slot1.Dispatcher.GetFleetVO(slot2).UpdateFleetOverDamage(slot4, slot2)
	slot0._dataProxy:ShutdownPlayerUnit(slot1.Dispatcher.GetUniqueID(slot2))
end

return
