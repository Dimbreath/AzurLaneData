ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = ys.Battle.BattleFormulas
slot3 = ys.Battle.BattleUnitEvent
slot4 = ys.Battle.BattleDataFunction
ys.Battle.BattleAllInStrike = class("BattleAllInStrike")
ys.Battle.BattleAllInStrike.__name = "BattleAllInStrike"
ys.Battle.BattleAllInStrike.EMITTER_NORMAL = "BattleBulletEmitter"
ys.Battle.BattleAllInStrike.EMITTER_SHOTGUN = "BattleShotgunEmitter"
ys.Battle.BattleAllInStrike.STATE_DISABLE = "DISABLE"
ys.Battle.BattleAllInStrike.STATE_READY = "READY"
ys.Battle.BattleAllInStrike.STATE_PRECAST = "PRECAST"
ys.Battle.BattleAllInStrike.STATE_PRECAST_FINISH = "STATE_PRECAST_FINISH"
ys.Battle.BattleAllInStrike.STATE_ATTACK = "ATTACK"
ys.Battle.BattleAllInStrike.STATE_OVER_HEAT = "OVER_HEAT"

ys.Battle.BattleAllInStrike.Ctor = function (slot0, slot1)
	slot0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._skill = slot0.Battle.BattleSkillUnit.New(slot1)
	slot0._reloadFacotrList = {}
	slot0._jammingTime = 0
end

ys.Battle.BattleAllInStrike.Update = function (slot0)
	slot0:UpdateReload()
end

ys.Battle.BattleAllInStrike.UpdateReload = function (slot0)
	if slot0._CDstartTime and not slot0._jammingStartTime then
		if slot0:GetReloadFinishTimeStamp() <= pg.TimeMgr.GetInstance():GetCombatTime() then
			slot0:handleCoolDown()
		else
			return
		end
	end
end

ys.Battle.BattleAllInStrike.Clear = function (slot0)
	slot0._skill:Clear()
end

ys.Battle.BattleAllInStrike.Dispose = function (slot0)
	slot0._skill:Dispose()
	slot0.EventDispatcher.DetachEventDispatcher(slot0)
end

ys.Battle.BattleAllInStrike.SetHost = function (slot0, slot1)
	slot0._host = slot1
	slot2 = nil
	slot0._hiveList = slot1:GetHiveList()

	for slot6, slot7 in ipairs(slot0._hiveList) do
		if slot7:GetSkinID() then
			slot9, slot10, slot11, slot12 = slot0.GetEquipSkin(slot8)

			if slot12 then
				slot2 = slot12

				break
			end
		end
	end

	if slot2 then
		for slot7, slot8 in ipairs(slot3) do
			if slot8.__name == slot1.Battle.BattleSkillFire.__name then
				slot8:SetWeaponSkin(slot2)
			end
		end
	end

	slot0:FlushTotalReload()
	slot0:FlushReloadMax(1)
end

ys.Battle.BattleAllInStrike.FlushTotalReload = function (slot0)
	slot0._totalReload = slot0.CaclulateAirAssistReloadMax(slot0._hiveList)
end

ys.Battle.BattleAllInStrike.FlushReloadMax = function (slot0, slot1)
	slot0._reloadMax = slot0._totalReload * (slot1 or 1)
end

ys.Battle.BattleAllInStrike.AppendReloadFactor = function (slot0, slot1, slot2)
	slot0._reloadFacotrList[slot1] = slot2
end

ys.Battle.BattleAllInStrike.RemoveReloadFactor = function (slot0, slot1)
	if slot0._reloadFacotrList[slot1] then
		slot0._reloadFacotrList[slot1] = nil
	end
end

ys.Battle.BattleAllInStrike.GetReloadFactorList = function (slot0)
	return slot0._reloadFacotrList
end

ys.Battle.BattleAllInStrike.SetAllInWeaponVO = function (slot0, slot1)
	slot0._allInWeaponVo = slot1
	slot0._currentState = slot0.STATE_READY
end

ys.Battle.BattleAllInStrike.GetCurrentState = function (slot0)
	return slot0._currentState
end

ys.Battle.BattleAllInStrike.GetHost = function (slot0)
	return slot0._host
end

ys.Battle.BattleAllInStrike.GetType = function (slot0)
	return slot0.EquipmentType.AIR_ASSIST
end

ys.Battle.BattleAllInStrike.Fire = function (slot0)
	slot0._host:TriggerBuff(slot0.Battle.BattleConst.BuffEffectType.ON_ALL_IN_STRIKE_STEADY, {})

	for slot4, slot5 in ipairs(slot0._hiveList) do
		slot5:SingleFire()
	end

	slot0._skill:Cast(slot0._host)
	slot0._host:StateChange(slot0.Battle.UnitState.STATE_ATTACK, "attack")
	slot0:DispatchEvent(slot0.Event.New(slot1.MANUAL_WEAPON_FIRE, {}))
	slot0._host:TriggerBuff(slot0.Battle.BattleConst.BuffEffectType.ON_ALL_IN_STRIKE, {})
end

ys.Battle.BattleAllInStrike.TriggerBuffOnReady = function (slot0)
	slot0._host:TriggerBuff(slot0.Battle.BattleConst.BuffEffectType.ON_AIR_ASSIST_READY, {})
end

ys.Battle.BattleAllInStrike.SingleFire = function (slot0)
	for slot4, slot5 in ipairs(slot0._hiveList) do
		slot5:SingleFire()
	end

	slot0._skill:Cast(slot0._host)
	slot0._host:TriggerBuff(slot0.Battle.BattleConst.BuffEffectType.ON_ALL_IN_STRIKE, {})
end

ys.Battle.BattleAllInStrike.GetReloadTime = function (slot0)
	if slot0._reloadMax ~= slot0._cacheReloadMax or slot0._host:GetAttr().loadSpeed ~= slot0._cacheHostReload then
		slot0._cacheReloadMax = slot0._reloadMax
		slot0._cacheHostReload = slot0._host:GetAttr().loadSpeed
		slot0._cacheReloadTime = slot0.ReloadTime(slot0._reloadMax, slot0._host:GetAttr())
	end

	return slot0._cacheReloadTime
end

ys.Battle.BattleAllInStrike.SetModifyInitialCD = function (slot0)
	slot0._modInitCD = true
end

ys.Battle.BattleAllInStrike.GetModifyInitialCD = function (slot0)
	return slot0._modInitCD
end

ys.Battle.BattleAllInStrike.InitialCD = function (slot0)
	slot0:AddCDTimer(slot0:GetReloadTime())
	slot0._allInWeaponVo:Deduct(slot0)
	slot0._allInWeaponVo:Charge(slot0)
end

ys.Battle.BattleAllInStrike.EnterCoolDown = function (slot0)
	slot0:AddCDTimer(slot0:GetReloadTime())
	slot0._allInWeaponVo:Charge(slot0)
end

ys.Battle.BattleAllInStrike.OverHeat = function (slot0)
	slot0._currentState = slot0.STATE_OVER_HEAT

	slot0._allInWeaponVo:Deduct(slot0)
end

ys.Battle.BattleAllInStrike.AddCDTimer = function (slot0, slot1)
	slot0._currentState = slot0.STATE_OVER_HEAT
	slot0._CDstartTime = pg.TimeMgr.GetInstance():GetCombatTime()
	slot0._reloadRequire = slot1
end

ys.Battle.BattleAllInStrike.handleCoolDown = function (slot0)
	slot0._currentState = slot0.STATE_READY

	slot0._allInWeaponVo:Plus(slot0)
	slot0:DispatchEvent(slot1.Event.New(slot2.MANUAL_WEAPON_READY, {}))
	slot0:TriggerBuffOnReady()

	slot0._CDstartTime = nil
	slot0._jammingTime = 0
end

ys.Battle.BattleAllInStrike.FlushReloadRequire = function (slot0)
	if not slot0._CDstartTime then
		return true
	end

	slot0._reloadRequire = pg.TimeMgr.GetInstance():GetCombatTime() - slot0._CDstartTime + slot0.ReloadTime(slot4, slot0._host:GetAttr())

	slot0._allInWeaponVo:RefreshReloadingBar()
end

ys.Battle.BattleAllInStrike.QuickCoolDown = function (slot0)
	if slot0._currentState == slot0.STATE_OVER_HEAT then
		slot0._currentState = slot0.STATE_READY

		slot0._allInWeaponVo:InstantCoolDown(slot0)
		slot0:DispatchEvent(slot1.Event.New(slot2.MANUAL_WEAPON_INSTANT_READY, {}))

		slot0._CDstartTime = nil
	end
end

ys.Battle.BattleAllInStrike.GetReloadFinishTimeStamp = function (slot0)
	return slot0._reloadRequire + slot0._CDstartTime + slot0._jammingTime
end

ys.Battle.BattleAllInStrike.StartJamming = function (slot0)
	slot0._jammingStartTime = pg.TimeMgr.GetInstance():GetCombatTime()
end

ys.Battle.BattleAllInStrike.JammingEliminate = function (slot0)
	if not slot0._jammingStartTime then
		return
	end

	slot0._jammingTime = pg.TimeMgr.GetInstance():GetCombatTime() - slot0._jammingStartTime
	slot0._jammingStartTime = nil
end

ys.Battle.BattleAllInStrike.CLSBullet = function (slot0)
	slot0.Battle.BattleDataProxy.GetInstance():CLSBullet(slot0._host:GetIFF() * -1)
end

ys.Battle.BattleAllInStrike.DispatchBlink = function (slot0, slot1)
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.CHARGE_WEAPON_FINISH, slot2))
end

return
