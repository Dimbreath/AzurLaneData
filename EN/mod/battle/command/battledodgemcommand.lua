ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = ys.Battle.BattleEvent
slot3 = class("BattleDodgemCommand", ys.Battle.BattleSingleDungeonCommand)
ys.Battle.BattleDodgemCommand = slot3
slot3.__name = "BattleDodgemCommand"

function slot3.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot3.Initialize(slot0)
	slot0.super.Initialize(slot0)
	slot0._dataProxy:DodgemCountInit()
end

function slot3.DoPrologue(slot0)
	pg.UIMgr.GetInstance():Marching()
	slot0._uiMediator:SeaSurfaceShift(45, 0, nil, function ()
		slot0._uiMediator:OpeningEffect(function ()
			slot0._dataProxy:SetupDamageKamikazeShip(slot1.Battle.BattleFormulas.CalcDamageLockS2M)
			slot0._dataProxy.SetupDamageKamikazeShip._dataProxy:SetupDamageCrush(slot1.Battle.BattleFormulas.UnilateralCrush)
			slot0._dataProxy.SetupDamageKamikazeShip._dataProxy.SetupDamageCrush._uiMediator:ShowTimer()
			slot0._dataProxy.SetupDamageKamikazeShip._dataProxy.SetupDamageCrush._uiMediator.ShowTimer._state:ChangeState(slot1.Battle.BattleState.BATTLE_STATE_FIGHT)
			slot0._dataProxy.SetupDamageKamikazeShip._dataProxy.SetupDamageCrush._uiMediator.ShowTimer._state.ChangeState._waveUpdater:Start()
		end)
		slot0._uiMediator.OpeningEffect._dataProxy:GetFleetByIFF(slot1.Battle.BattleConfig.FRIENDLY_CODE):FleetWarcry()
	end)

	slot2 = slot0._state:GetSceneMediator()

	slot2:InitPopScorePool()
	slot2:EnablePopContainer(slot0.Battle.BattlePopNumManager.CONTAINER_HP, false)
	slot2:EnablePopContainer(slot0.Battle.BattlePopNumManager.CONTAINER_SCORE, true)
	slot0._uiMediator:ShowDodgemScoreBar()
end

function slot3.initWaveModule(slot0)
	slot0._waveUpdater = slot0.Battle.BattleWaveUpdater.New(function (slot0, slot1, slot2)
		slot0._dataProxy:SpawnMonster(slot0, slot1, slot2, slot1.Battle.BattleConfig.FOE_CODE)
	end, nil, function ()
		if slot0._vertifyFail then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = slot0._vertifyFail
			})

			return
		end

		slot0._dataProxy:CalcDodgemScore()
		slot0._dataProxy.CalcDodgemScore._state:BattleEnd()
	end, nil)
end

function slot3.onWillDie(slot0, slot1)
	slot0._dataProxy:CalcDodgemCount(slot2)

	slot3 = slot1.Dispatcher.GetDeathReason(slot2)

	if slot1.Dispatcher.GetTemplate(slot2).type == ShipType.JinBi and slot3 == slot0.Battle.BattleConst.UnitDeathReason.CRUSH then
		slot2:DispatchScorePoint(slot0._dataProxy:GetScorePoint())
	end
end

return
