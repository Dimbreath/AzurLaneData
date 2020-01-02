ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = ys.Battle.BattleEvent
slot3 = ys.Battle.BattleConst
slot4 = class("BattleSubRoutineCommand", ys.Battle.BattleSubmarineRunCommand)
ys.Battle.BattleSubRoutineCommand = slot4
slot4.__name = "BattleSubRoutineCommand"

function slot4.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot4.Initialize(slot0)
	slot0.super.Initialize(slot0)
	slot0._dataProxy:SubmarineRunInit()
end

function slot4.DoPrologue(slot0)
	pg.UIMgr.GetInstance():Marching()

	function slot1()
		slot0._uiMediator:OpeningEffect(function ()
			slot0._uiMediator:ShowTimer()
			slot0._uiMediator.ShowTimer._state:ChangeState(slot1.Battle.BattleState.BATTLE_STATE_FIGHT)
			slot0._uiMediator.ShowTimer._state.ChangeState._waveUpdater:Start()
		end, SYSTEM_SUB_ROUTINE)

		slot0 = slot0._uiMediator.OpeningEffect._dataProxy:GetFleetByIFF(slot1.Battle.BattleConfig.FRIENDLY_CODE)

		slot0:FleetWarcry()
		slot0:ChangeSubmarineState(slot1.Battle.OxyState.STATE_FREE_DIVE)
		slot0:GetSubBoostVO():ResetCurrent()
		slot0._dataProxy:InitAllFleetUnitsWeaponCD()
		slot0._dataProxy:TirggerBattleStartBuffs()
	end

	for slot6, slot7 in ipairs(slot2) do
		slot7:AddBuff(slot8)
		slot7:RemoveBuff(8520)
	end

	slot0._uiMediator:SeaSurfaceShift(45, 0, nil, slot1)
end

function slot4.initWaveModule(slot0)
	slot0._waveUpdater = slot0.Battle.BattleWaveUpdater.New(function (slot0, slot1, slot2)
		slot0._dataProxy:SpawnMonster(slot0, slot1, slot2, slot1.Battle.BattleConfig.FOE_CODE)
	end, nil, function ()
		if slot0._vertifyFail then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = slot0._vertifyFail
			})

			return
		end

		slot0._dataProxy:CalcSubRoutineScore()
		slot0._dataProxy.CalcSubRoutineScore._state:BattleEnd()
	end, nil)
end

function slot4.onUpdateCountDown(slot0, slot1)
	if slot0._dataProxy:GetCountDown() <= 0 then
		slot0._dataProxy:EnemyEscape()
		slot0._dataProxy:CalcSubRountineTimeUp()
		slot0._state:BattleTimeUp()
	end
end

function slot4.onShutDownPlayer(slot0, slot1)
	slot0._dataProxy:ShutdownPlayerUnit(slot1.Dispatcher.GetUniqueID(slot2))
end

function slot4.onPlayerShutDown(slot0, slot1)
	if slot0._state:GetState() ~= slot0._state.BATTLE_STATE_FIGHT then
		return
	end

	slot2 = slot1.Data.unit

	if #slot0._userFleet:GetSubBench() > 0 then
		slot0._userFleet:ShiftManualSub()
	else
		slot0._dataProxy:CalcSubRountineElimate()
		slot0._state:BattleEnd()
	end
end

return
