ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = ys.Battle.BattleEvent
slot3 = class("BattleDebugCommand", ys.MVC.Command)
ys.Battle.BattleDebugCommand = slot3
slot3.__name = "BattleDebugCommand"

function slot3.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot3.Initialize(slot0)
	slot0:Init()
	slot0.super.Initialize(slot0)

	slot0._dataProxy = slot0._state:GetProxyByName(slot1.Battle.BattleDataProxy.__name)
	slot0._uiMediator = slot0._state:GetMediatorByName(slot1.Battle.BattleUIMediator.__name)

	slot0:AddEvent()
end

function slot3.DoPrologue(slot0)
	function ()
		slot0._uiMediator:OpeningEffect(function ()
			slot0._uiMediator:ShowAutoBtn()
			slot0._uiMediator.ShowAutoBtn._uiMediator:ShowTimer()
			slot0._uiMediator.ShowAutoBtn._uiMediator.ShowTimer._state:ChangeState(slot1.Battle.BattleState.BATTLE_STATE_FIGHT)
		end, SYSTEM_DEBUG)
		slot0._uiMediator.OpeningEffect._dataProxy:InitAllFleetUnitsWeaponCD()
		slot0._uiMediator.OpeningEffect._dataProxy.InitAllFleetUnitsWeaponCD._dataProxy:TirggerBattleStartBuffs()
	end()
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
	slot0.Battle.BattleDataProxy.Update = slot0.Battle.BattleDebugConsole.ProxyUpdateNormal
	slot0.Battle.BattleDataProxy.UpdateAutoComponent = slot0.Battle.BattleDebugConsole.ProxyUpdateAutoComponentNormal

	slot0:Clear()
	slot0:RemoveEvent()
	slot0.RemoveEvent.super.Dispose(slot0)
end

function slot3.AddEvent(slot0)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.STAGE_DATA_INIT_FINISH, slot0.onInitBattle)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.ADD_UNIT, slot0.onAddUnit)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.REMOVE_UNIT, slot0.onRemoveUnit)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.SHUT_DOWN_PLAYER, slot0.onPlayerShutDown)
end

function slot3.RemoveEvent(slot0)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.STAGE_DATA_INIT_FINISH)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.ADD_UNIT)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.REMOVE_UNIT)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.SHUT_DOWN_PLAYER)
end

function slot3.onInitBattle(slot0)
	slot0._userFleet = slot0._dataProxy:GetFleetByIFF(slot0.Battle.BattleConfig.FRIENDLY_CODE)
end

function slot3.onAddUnit(slot0, slot1)
	slot0:RegisterUnitEvent(slot3)

	slot0._unitDataList[slot1.Data.unit:GetUniqueID()] = slot1.Data.unit

	if slot1.Data.type ~= slot0.Battle.BattleConst.UnitType.ENEMY_UNIT and slot2 ~= slot0.Battle.BattleConst.UnitType.BOSS_UNIT and slot2 == slot0.Battle.BattleConst.UnitType.NPC_UNIT then
	end
end

function slot3.RegisterUnitEvent(slot0, slot1)
	slot1:RegisterEventListener(slot0, slot0.WILL_DIE, slot0.onWillDie)
	slot1:RegisterEventListener(slot0, slot0.DYING, slot0.onUnitDying)

	if slot1:GetUnitType() == slot1.Battle.BattleConst.UnitType.PLAYER_UNIT then
		slot1:RegisterEventListener(slot0, slot0.SHUT_DOWN_PLAYER, slot0.onShutDownPlayer)
	end
end

function slot3.UnregisterUnitEvent(slot0, slot1)
	slot1:UnregisterEventListener(slot0, slot0.WILL_DIE)
	slot1:UnregisterEventListener(slot0, slot0.DYING)

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
	if slot1.Data.unit == slot0._userFleet:GetMainList() == 0 then
		slot0._dataProxy:KillAllAirStrike()
		slot0._dataProxy:KillAllEnemy()
		slot0._dataProxy:CLSBullet(slot0.Battle.BattleConfig.FRIENDLY_CODE)
		slot0._dataProxy:CLSBullet(slot0.Battle.BattleConfig.FOE_CODE)

		for slot7, slot8 in ipairs(slot3) do
			slot0._dataProxy:SpawnMain(slot8, slot0.Battle.BattleConfig.FRIENDLY_CODE)
		end
	end

	if #slot0._userFleet:GetScoutList() == 0 then
		slot0._dataProxy:KillAllAirStrike()
		slot0._dataProxy:KillAllEnemy()
		slot0._dataProxy:CLSBullet(slot0.Battle.BattleConfig.FRIENDLY_CODE)
		slot0._dataProxy:CLSBullet(slot0.Battle.BattleConfig.FOE_CODE)

		for slot7, slot8 in ipairs(slot3) do
			slot0._dataProxy:SpawnVanguard(slot8, slot0.Battle.BattleConfig.FRIENDLY_CODE)
		end
	end
end

function slot3.onUnitDying(slot0, slot1)
	slot0._dataProxy:KillUnit(slot1.Dispatcher.GetUniqueID(slot2))
end

function slot3.onWillDie(slot0, slot1)
	slot0._dataProxy:CalcBattleScoreWhenDead(slot2)

	slot3 = slot0._dataProxy:IsThereBoss()

	if slot1.Dispatcher:IsBoss() and not slot3 then
		slot0._dataProxy:KillAllEnemy()
	end
end

function slot3.onShutDownPlayer(slot0, slot1)
	slot0._dataProxy:ShutdownPlayerUnit(slot1.Dispatcher.GetUniqueID(slot2))
end

return
