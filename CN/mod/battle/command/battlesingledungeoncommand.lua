ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = ys.Battle.BattleEvent
slot3 = class("BattleSingleDungeonCommand", ys.MVC.Command)
ys.Battle.BattleSingleDungeonCommand = slot3
slot3.__name = "BattleSingleDungeonCommand"

slot3.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

slot3.Initialize = function (slot0)
	slot0.super.Initialize(slot0)

	slot0._dataProxy = slot0._state:GetProxyByName(slot1.Battle.BattleDataProxy.__name)
	slot0._uiMediator = slot0._state:GetUIMediator()

	slot0:Init()
	slot0:InitProtocol()
	slot0:AddEvent()

	slot0._count = 0
end

slot3.DoPrologue = function (slot0)
	pg.UIMgr.GetInstance():Marching()
	slot0._uiMediator:SeaSurfaceShift(45, 0, nil, function ()
		slot0._uiMediator:OpeningEffect(function ()
			slot0._uiMediator:ShowAutoBtn()
			slot0._uiMediator.ShowAutoBtn._uiMediator:ShowTimer()

			slot0 = slot0._uiMediator.ShowAutoBtn._uiMediator.ShowTimer._state:GetCommandByName(slot1.Battle.BattleControllerWeaponCommand.__name)

			slot0:TryAutoSub()
			slot0._state:ChangeState(slot1.Battle.BattleState.BATTLE_STATE_FIGHT)
			slot0._waveUpdater:Start()
		end)

		slot0 = slot0._uiMediator.OpeningEffect._dataProxy:GetFleetByIFF(slot1.Battle.BattleConfig.FRIENDLY_CODE)

		slot0:FleetWarcry()
		slot0._dataProxy:InitAllFleetUnitsWeaponCD()
		slot0._dataProxy:TirggerBattleStartBuffs()
	end)
end

slot3.Init = function (slot0)
	slot0._unitDataList = {}

	slot0:initWaveModule()
end

slot3.Clear = function (slot0)
	for slot4, slot5 in pairs(slot0._unitDataList) do
		slot0:UnregisterUnitEvent(slot5)

		slot0._unitDataList[slot4] = nil
	end

	slot0._waveUpdater:Clear()
end

slot3.Reinitialize = function (slot0)
	slot0._state:Deactive()
	slot0:Clear()
	slot0:Init()
end

slot3.Dispose = function (slot0)
	slot0:Clear()
	slot0:RemoveEvent()
	slot0.super.Dispose(slot0)
end

slot3.SetVertifyFail = function (slot0, slot1)
	if not slot0._vertifyFail then
		slot0._vertifyFail = slot1
	end
end

slot3.onInitBattle = function (slot0)
	slot0._userFleet = slot0._dataProxy:GetFleetByIFF(slot0.Battle.BattleConfig.FRIENDLY_CODE)

	slot0._waveUpdater:SetWavesData(slot0._dataProxy:GetStageInfo())
end

slot3.initWaveModule = function (slot0)
	slot0._waveUpdater = slot0.Battle.BattleWaveUpdater.New(function (slot0, slot1, slot2)
		slot0._dataProxy:SpawnMonster(slot0, slot1, slot2, slot1.Battle.BattleConfig.FOE_CODE)
	end, function (slot0)
		slot0._dataProxy:SpawnAirFighter(slot0)
	end, function ()
		if slot0._vertifyFail then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = slot0._vertifyFail
			})

			return
		end

		slot0._dataProxy:CalcSingleDungeonScoreAtEnd(slot0._userFleet)
		slot0._dataProxy.CalcSingleDungeonScoreAtEnd._state:BattleEnd()
	end, function (slot0, slot1, slot2, slot3, slot4)
		slot0._dataProxy:SpawnCubeArea(slot1.Battle.BattleConst.AOEField.SURFACE, -1, slot0, slot1, slot2, slot3, slot4)
	end)
end

slot3.InitProtocol = function (slot0)
	return
end

slot3.AddEvent = function (slot0)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.ADD_UNIT, slot0.onAddUnit)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.REMOVE_UNIT, slot0.onRemoveUnit)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.STAGE_DATA_INIT_FINISH, slot0.onInitBattle)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.SHUT_DOWN_PLAYER, slot0.onPlayerShutDown)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.UPDATE_COUNT_DOWN, slot0.onUpdateCountDown)
end

slot3.RemoveEvent = function (slot0)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.ADD_UNIT)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.REMOVE_UNIT)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.STAGE_DATA_INIT_FINISH)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.SHUT_DOWN_PLAYER)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.UPDATE_COUNT_DOWN)
end

slot3.onAddUnit = function (slot0, slot1)
	slot0:RegisterUnitEvent(slot3)

	slot0._unitDataList[slot1.Data.unit:GetUniqueID()] = slot1.Data.unit

	if slot1.Data.type == slot0.Battle.BattleConst.UnitType.ENEMY_UNIT or slot2 == slot0.Battle.BattleConst.UnitType.BOSS_UNIT or slot2 == slot0.Battle.BattleConst.UnitType.NPC_UNIT then
		slot0._waveUpdater:AddMonster(slot3)
	end
end

slot3.RegisterUnitEvent = function (slot0, slot1)
	slot1:RegisterEventListener(slot0, slot0.WILL_DIE, slot0.onWillDie)
	slot1:RegisterEventListener(slot0, slot0.DYING, slot0.onUnitDying)

	if slot1:GetUnitType() == slot1.Battle.BattleConst.UnitType.PLAYER_UNIT then
		slot1:RegisterEventListener(slot0, slot0.SHUT_DOWN_PLAYER, slot0.onShutDownPlayer)
	end
end

slot3.UnregisterUnitEvent = function (slot0, slot1)
	slot1:UnregisterEventListener(slot0, slot0.WILL_DIE)
	slot1:UnregisterEventListener(slot0, slot0.DYING)

	if slot1:GetUnitType() == slot1.Battle.BattleConst.UnitType.PLAYER_UNIT then
		slot1:UnregisterEventListener(slot0, slot0.SHUT_DOWN_PLAYER)
	end
end

slot3.onRemoveUnit = function (slot0, slot1)
	slot0._waveUpdater:RemoveMonster(slot1.Data.UID)

	if slot0._unitDataList[slot1.Data.UID] == nil then
		return
	end

	slot0:UnregisterUnitEvent(slot3)

	slot0._unitDataList[slot2] = nil
end

slot3.onPlayerShutDown = function (slot0, slot1)
	if slot0._state:GetState() ~= slot0._state.BATTLE_STATE_FIGHT then
		return
	end

	if slot1.Data.unit == slot0._userFleet:GetFlagShip() and slot0._dataProxy:GetInitData().battleType ~= SYSTEM_PROLOGUE and slot0._dataProxy:GetInitData().battleType ~= SYSTEM_PERFORM then
		slot0._dataProxy:CalcSingleDungeonScoreAtEnd(slot0._userFleet)
		slot0._state:BattleEnd()

		return
	end

	if #slot0._userFleet:GetScoutList() == 0 then
		slot0._dataProxy:CalcSingleDungeonScoreAtEnd(slot0._userFleet)
		slot0._state:BattleEnd()
	end
end

slot3.onUpdateCountDown = function (slot0, slot1)
	if slot0._dataProxy:GetCountDown() <= 0 then
		slot0._dataProxy:EnemyEscape()
		slot0._dataProxy:CalcSingleDungeonScoreAtEnd(slot0._userFleet)
		slot0._state:BattleTimeUp()
	end
end

slot3.onUnitDying = function (slot0, slot1)
	slot0._dataProxy:KillUnit(slot1.Dispatcher.GetUniqueID(slot2))
end

slot3.onWillDie = function (slot0, slot1)
	if slot1.Dispatcher.GetDeathReason(slot2) ~= slot0.Battle.BattleConst.UnitDeathReason.LEAVE then
		slot0._dataProxy:CalcBattleScoreWhenDead(slot2)
	elseif slot2:GetIFF() == slot0.Battle.BattleConfig.FRIENDLY_CODE then
		slot0._dataProxy:CalcBPWhenPlayerLeave(slot2)
	end

	slot4 = slot0._dataProxy:IsThereBoss()

	if slot2:IsBoss() and not slot4 then
		if slot3 == slot0.Battle.BattleConst.UnitDeathReason.DESTRUCT then
			slot0._dataProxy:AddScoreWhenBossDestruct()
		end

		slot0._dataProxy:KillAllEnemy()
	end
end

slot3.onShutDownPlayer = function (slot0, slot1)
	slot0._dataProxy:ShutdownPlayerUnit(slot1.Dispatcher.GetUniqueID(slot2))
end

return
