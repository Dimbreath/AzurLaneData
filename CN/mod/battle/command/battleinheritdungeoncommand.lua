ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = ys.Battle.BattleEvent
slot3 = class("BattleInheritDungeonCommand", ys.Battle.BattleSingleDungeonCommand)
ys.Battle.BattleInheritDungeonCommand = slot3
slot3.__name = "BattleInheritDungeonCommand"

slot3.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
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
		slot0._dataProxy.CalcSingleDungeonScoreAtEnd:calcDamageData()
		slot0._dataProxy.CalcSingleDungeonScoreAtEnd.calcDamageData._state:BattleEnd()
	end, function (slot0, slot1, slot2, slot3, slot4)
		slot0._dataProxy:SpawnCubeArea(slot1.Battle.BattleConst.AOEField.SURFACE, -1, slot0, slot1, slot2, slot3, slot4)
	end)
end

slot3.onInitBattle = function (slot0)
	slot0.super.onInitBattle(slot0)

	slot1 = slot0._dataProxy:GetInitData()
	slot0._specificEnemyList = slot1.Battle.BattleDataFunction.GetSpecificEnemyList(slot1.ActID, slot1.StageTmpId)
end

slot3.onAddUnit = function (slot0, slot1)
	slot0.super.onAddUnit(slot0, slot1)

	if table.contains(slot0._specificEnemyList, slot1.Data.unit:GetTemplateID()) then
		slot0._dataProxy:InitSpecificEnemyStatistics(slot2)
	end
end

slot3.onPlayerShutDown = function (slot0, slot1)
	if slot0._state:GetState() ~= slot0._state.BATTLE_STATE_FIGHT then
		return
	end

	if slot1.Data.unit == slot0._userFleet:GetFlagShip() and slot0._dataProxy:GetInitData().battleType ~= SYSTEM_PROLOGUE and slot0._dataProxy:GetInitData().battleType ~= SYSTEM_PERFORM then
		slot0._dataProxy:CalcSingleDungeonScoreAtEnd(slot0._userFleet)
		slot0:calcDamageData()
		slot0._state:BattleEnd()

		return
	end

	if #slot0._userFleet:GetScoutList() == 0 then
		slot0._dataProxy:CalcSingleDungeonScoreAtEnd(slot0._userFleet)
		slot0:calcDamageData()
		slot0._state:BattleEnd()
	end
end

slot3.onUpdateCountDown = function (slot0, slot1)
	if slot0._dataProxy:GetCountDown() <= 0 then
		slot0._dataProxy:EnemyEscape()
		slot0._dataProxy:CalcSingleDungeonScoreAtEnd(slot0._userFleet)
		slot0:calcDamageData()
		slot0._state:BattleTimeUp()
	end
end

slot3.calcDamageData = function (slot0)
	slot0._dataProxy:CalcSpecificEnemyInfo(slot0._dataProxy:GetInitData().ActID)
end

return
