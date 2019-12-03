ys = ys or {}
ys.Battle.BattleBuffEffect = class("BattleBuffEffect")
ys.Battle.BattleBuffEffect.__name = "BattleBuffEffect"
slot1 = ys.Battle.BattleUnitEvent
ys.Battle.BattleBuffEffect.FX_TYPE_NOR = 0
ys.Battle.BattleBuffEffect.FX_TYPE_MOD_ATTR = 1
ys.Battle.BattleBuffEffect.FX_TYPE_CASTER = 2
ys.Battle.BattleBuffEffect.FX_TYPE_LINK = 3
ys.Battle.BattleBuffEffect.FX_TYPE_MOD_VELOCTIY = 4

function ys.Battle.BattleBuffEffect.Ctor(slot0, slot1)
	slot0._tempData = Clone(slot1)
	slot0._type = slot0._tempData.type
	slot0._quota = slot0._tempData.arg_list.quota or -1
	slot0._indexRequire = slot2.index
	slot0._damageAttrRequire = slot2.damageAttr
	slot0._countType = slot2.countType
	slot0._behit = slot2.be_hit_condition
	slot0._ammoTypeRequire = slot2.ammoType
	slot0._ammoIndexRequire = slot2.ammoIndex

	slot0:ConfigHPTrigger()
	slot0:ConfigAttrTrigger()
	slot0:SetActive()
end

function ys.Battle.BattleBuffEffect.GetEffectType(slot0)
	return slot0.FX_TYPE_NOR
end

function ys.Battle.BattleBuffEffect.HaveQuota(slot0)
	if slot0._quota == 0 then
		return false
	else
		return true
	end
end

function ys.Battle.BattleBuffEffect.ConfigHPTrigger(slot0)
	slot0._hpUpperBound = slot0._tempData.arg_list.hpUpperBound
	slot0._hpLowerBound = slot0._tempData.arg_list.hpLowerBound

	if slot0._hpUpperBound and slot0._hpLowerBound == nil then
		slot0._hpLowerBound = 0
	end

	if slot0._hpLowerBound and slot0._hpUpperBound == nil then
		slot0._hpUpperBound = 1
	end

	slot0._hpSigned = slot1.hpSigned or -1
	slot0._hpOutInterval = slot1.hpOutInterval
end

function ys.Battle.BattleBuffEffect.ConfigAttrTrigger(slot0)
	slot0._attrLowerBound = slot0._tempData.arg_list.attrLowerBound
	slot0._attrUpperBound = slot0._tempData.arg_list.attrUpperBound
	slot0._attrInterval = slot0._tempData.arg_list.attrInterval
end

function ys.Battle.BattleBuffEffect.SetCaster(slot0, slot1)
	slot0._caster = slot1
end

function ys.Battle.BattleBuffEffect.SetCommander(slot0, slot1)
	slot0._commander = slot1
end

function ys.Battle.BattleBuffEffect.SetBullet(slot0, slot1)
	return
end

function ys.Battle.BattleBuffEffect.SetArgs(slot0, slot1, slot2)
	return
end

function ys.Battle.BattleBuffEffect.SetOrb(slot0)
	return
end

function ys.Battle.BattleBuffEffect.Trigger(slot0, slot1, slot2, slot3, slot4)
	slot0[slot1](slot0, slot2, slot3, slot4)
end

function ys.Battle.BattleBuffEffect.onAttach(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onRemove(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onOtherBuffRemove(slot0, slot1, slot2, slot3)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onUpdate(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onStack(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onBulletHit(slot0, slot1, slot2, slot3)
	if not slot0:equipIndexRequire(slot3.equipIndex) then
		return
	end

	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onBeHit(slot0, slot1, slot2, slot3)
	if slot0._behit then
		if slot0._behit.damage_type == slot3.weaponType and slot0._behit.bullet_type == slot3.bulletType then
			slot0:onTrigger(slot1, slot2)
		end
	else
		slot0:onTrigger(slot1, slot2)
	end
end

function ys.Battle.BattleBuffEffect.onFire(slot0, slot1, slot2, slot3)
	if not slot0:equipIndexRequire(slot3.equipIndex) then
		return
	end

	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onCombo(slot0, slot1, slot2, slot3)
	if not slot0:equipIndexRequire(slot3.equipIndex) then
		return
	end

	slot4 = slot3.matchUnitCount
	slot6 = slot0._tempData.arg_list.lowerBound

	if slot0._tempData.arg_list.upperBound and slot4 <= slot5 then
		slot0:onTrigger(slot1, slot2)
	elseif slot6 and slot6 <= slot4 then
		slot0:onTrigger(slot1, slot2)
	end
end

function ys.Battle.BattleBuffEffect.equipIndexRequire(slot0, slot1)
	if not slot0._indexRequire then
		return true
	else
		for slot5, slot6 in ipairs(slot0._indexRequire) do
			if slot6 == slot1 then
				return true
			end
		end

		return false
	end
end

function ys.Battle.BattleBuffEffect.ammoRequire(slot0, slot1)
	if not slot0._ammoTypeRequire then
		return true
	elseif not slot1:GetWeaponByIndex(slot0._ammoIndexRequire) or slot2:GetPrimalAmmoType() ~= slot0._ammoTypeRequire then
		return false
	else
		return true
	end
end

function ys.Battle.BattleBuffEffect.onWeaponSteday(slot0, slot1, slot2, slot3)
	slot0:onFire(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onChargeWeaponFire(slot0, slot1, slot2, slot3)
	slot0:onFire(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onTorpedoWeaponFire(slot0, slot1, slot2, slot3)
	slot0:onFire(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onAntiAirWeaponFire(slot0, slot1, slot2, slot3)
	slot0:onFire(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onAllInStrike(slot0, slot1, slot2, slot3)
	slot0:onFire(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onAllInStrikeSteady(slot0, slot1, slot2, slot3)
	slot0:onFire(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onChargeWeaponReady(slot0, slot1, slot2, slot3)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onManualTorpedoReady(slot0, slot1, slot2, slot3)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onAirAssistReady(slot0, slot1, slot2, slot3)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onDying(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onFriendlyAircraftDying(slot0, slot1, slot2, slot3)
	if slot0._tempData.arg_list.templateID then
		if slot3.unit.GetTemplateID(slot4) == slot0._tempData.arg_list.templateID then
			slot0:onTrigger(slot1, slot2)
		end
	else
		slot0:onTrigger(slot1, slot2)
	end
end

function ys.Battle.BattleBuffEffect.onFriendlyShipDying(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onFoeAircraftDying(slot0, slot1, slot2, slot3)
	if slot0._tempData.arg_list.inside then
		if not slot1:GetFleetVO():GetFleetAntiAirWeapon():IsOutOfRange(slot3.unit) then
			slot0:onTrigger(slot1, slot2)
		end
	elseif slot0._tempData.arg_list.killer then
		if slot0:killerRequire(slot0._tempData.arg_list.killer, slot3.killer, slot1) then
			slot0:onTrigger(slot1, slot2)
		end
	else
		slot0:onTrigger(slot1, slot2)
	end
end

function ys.Battle.BattleBuffEffect.onFoeDying(slot0, slot1, slot2, slot3)
	if slot0._tempData.arg_list.killer then
		if slot0:killerRequire(slot0._tempData.arg_list.killer, slot3.killer, slot1) then
			slot0:onTrigger(slot1, slot2)
		end
	else
		slot0:onTrigger(slot1, slot2)
	end
end

function ys.Battle.BattleBuffEffect.killerRequire(slot0, slot1, slot2, slot3)
	slot4, slot5 = nil
	slot4 = ((slot2.__name == slot0.Battle.BattlePlayerUnit.__name or slot6 == slot0.Battle.BattleNPCUnit.__name or slot6 == slot0.Battle.BattleEnemyUnit.__name or slot6 == slot0.Battle.BattleAircraftUnit.__name or slot6 == slot0.Battle.BattleAirFighterUnit.__name) and slot2) or slot2:GetHost()

	if slot4 then
		if slot4.__name == slot0.Battle.BattleAircraftUnit.__name then
			slot5 = slot4:GetMotherUnit()
		else
			slot5 = slot4
			slot4 = nil
		end
	else
		return false
	end

	if slot1 == "self" then
		if slot5 == slot3 and not slot4 then
			return true
		end
	elseif slot1 == "child" and slot5 == slot3 and slot4 then
		return true
	end

	return false
end

function ys.Battle.BattleBuffEffect.onInitGame(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onStartGame(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onFlagShip(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onConsort(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onLeader(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onRear(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onSubLeader(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onSubConsort(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onBulletCollide(slot0, slot1, slot2, slot3)
	if not slot0:equipIndexRequire(slot3.equipIndex) then
		return
	end

	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onBombBulletBang(slot0, slot1, slot2, slot3)
	if not slot0:equipIndexRequire(slot3.equipIndex) then
		return
	end

	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onBulletHitBefore(slot0, slot1, slot2, slot3)
	if slot0._behit then
		if slot0._behit.damage_type == slot3.weaponType and slot0._behit.bullet_type == slot3.bulletType then
			slot0:onTrigger(slot1, slot2)
		end
	else
		slot0:onTrigger(slot1, slot2)
	end
end

function ys.Battle.BattleBuffEffect.onBulletCreate(slot0, slot1, slot2, slot3)
	print(slot0:equipIndexRequire(slot3.equipIndex))

	if not slot0:equipIndexRequire(slot3.equipIndex) then
		return
	end

	slot0:onTrigger(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onChargeWeaponBulletCreate(slot0, slot1, slot2, slot3)
	slot0:onBulletCreate(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onTorpedoWeaponBulletCreate(slot0, slot1, slot2, slot3)
	slot0:onBulletCreate(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onAntiAirWeaponBulletCreate(slot0, slot1, slot2, slot3)
	slot0:onBulletCreate(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onInternalBulletCreate(slot0, slot1, slot2, slot3)
	if not slot0:equipIndexRequire(slot3.equipIndex) then
		return
	end

	slot0:onTrigger(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onManualBulletCreate(slot0, slot1, slot2, slot3)
	if not slot0:equipIndexRequire(slot3.equipIndex) then
		return
	end

	slot0:onTrigger(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onTakeDamage(slot0, slot1, slot2, slot3)
	if slot0:damageAttrRequire(slot3.damageAttr) then
		slot0:onTrigger(slot1, slot2, slot3)
	end
end

function ys.Battle.BattleBuffEffect.onTakeHealing(slot0, slot1, slot2, slot3)
	slot0:onTrigger(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.damageAttrRequire(slot0, slot1)
	if not slot0._damageAttrRequire or table.contains(slot0._damageAttrRequire, slot1) then
		return true
	else
		return false
	end
end

function ys.Battle.BattleBuffEffect.hpIntervalRequire(slot0, slot1, slot2)
	if slot0._hpUpperBound == nil and slot0._hpLowerBound == nil then
		return true
	end

	if slot2 then
		if slot0._hpSigned == 0 then
		elseif slot2 * slot0._hpSigned < 0 then
			return false
		end
	end

	slot3 = nil

	if slot0._hpOutInterval then
		if slot0._hpUpperBound <= slot1 or slot1 <= slot0._hpLowerBound then
			slot3 = true
		end
	elseif slot1 <= slot0._hpUpperBound and slot0._hpLowerBound <= slot1 then
		slot3 = true
	end

	return slot3
end

function ys.Battle.BattleBuffEffect.attrIntervalRequire(slot0, slot1)
	slot2 = true

	if slot0._attrUpperBound and slot0._attrUpperBound <= slot1 then
		slot2 = false
	end

	if slot0._attrLowerBound and slot1 <= slot0._attrLowerBound then
		slot2 = false
	end

	return slot2
end

function ys.Battle.BattleBuffEffect.onHPRatioUpdate(slot0, slot1, slot2, slot3)
	if slot0:hpIntervalRequire(slot1:GetHPRate(), slot3.dHP) then
		slot0:doOnHPRatioUpdate(slot1, slot2, slot3)
	end
end

function ys.Battle.BattleBuffEffect.onFriendlyHpRatioUpdate(slot0, slot1, slot2, slot3)
	if slot0:hpIntervalRequire(slot3.unit.GetHPRate(slot4), slot3.dHP) then
		slot0:doOnHPRatioUpdate(slot1, slot2, slot3)
	end
end

function ys.Battle.BattleBuffEffect.onTeammateHpRatioUpdate(slot0, slot1, slot2, slot3)
	slot0:onFriendlyHpRatioUpdate(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onBulletKill(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onBattleBuffCount(slot0, slot1, slot2, slot3)
	if slot3.buffFX.GetCountType(slot4) == slot0._countType and slot0:onTrigger(slot1, slot2) ~= "overheat" then
		slot4:ResetCount()
	end
end

function ys.Battle.BattleBuffEffect.onDamagePrevent(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onShieldBroken(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleBuffEffect.onTrigger(slot0, slot1, slot2, slot3)
	if slot0._quota > 0 then
		slot0._quota = slot0._quota - 1
	end
end

function ys.Battle.BattleBuffEffect.doOnHPRatioUpdate(slot0, slot1, slot2, slot3)
	slot0:onTrigger(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.doOnFriendlyHPRatioUpdate(slot0, slot1, slot2, slot3)
	slot0:onTrigger(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onSubmarineDive(slot0, slot1, slot2, slot3)
	slot0:onTrigger(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onSubmarineRaid(slot0, slot1, slot2, slot3)
	slot0:onTrigger(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onSubmarineFloat(slot0, slot1, slot2, slot3)
	slot0:onTrigger(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onSubmarineRetreat(slot0, slot1, slot2, slot3)
	slot0:onTrigger(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onSubmarineAid(slot0, slot1, slot2, slot3)
	slot0:onTrigger(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onSubmarinFreeDive(slot0, slot1, slot2, slot3)
	slot0:onTrigger(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onSubmarinFreeFloat(slot0, slot1, slot2, slot3)
	slot0:onTrigger(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onSubmarineFreeSpecial(slot0, slot1, slot2, slot3)
	slot0:onTrigger(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.onAntiSubHateChain(slot0, slot1, slot2, slot3)
	slot0:onTrigger(slot1, slot2, attach)
end

function ys.Battle.BattleBuffEffect.onRetreat(slot0, slot1, slot2, slot3)
	slot0:onTrigger(slot1, slot2, slot3)
end

function ys.Battle.BattleBuffEffect.Clear(slot0)
	slot0._commander = nil
end

function ys.Battle.BattleBuffEffect.getTargetList(slot0, slot1, slot2, slot3)
	if type(slot2) == "string" then
		if slot0.Battle.BattleTargetChoise[slot2] == nil then
			return slot0:GetListByAttr(slot1, slot2)
		else
			return slot0.Battle.BattleTargetChoise[slot2](slot1, slot3)
		end
	elseif type(slot2) == "table" then
		slot4 = nil

		for slot8, slot9 in ipairs(slot2) do
			slot4 = slot0.Battle.BattleTargetChoise[slot9](slot1, slot3, slot4)
		end

		return slot4
	end
end

function ys.Battle.BattleBuffEffect.GetListByAttr(slot0, slot1, slot2)
	slot3 = slot2:split("_")
	slot4 = slot3[1]
	slot5 = slot3[2]
	slot6 = slot3[3]
	slot8 = {}

	if slot3[4] == "Help" then
		slot8 = slot0.Battle.BattleTargetChoise.TargetAllHelp(slot1)
	elseif slot7 == "Harm" then
		slot8 = slot0.Battle.BattleTargetChoise.TargetAllHarm(slot1)
	end

	table.sort(slot8, function (slot0, slot1)
		if slot0 == "H" and #slot1 > 1 then
			return slot1._attr[slot0._attr[]] < slot0._attr[]
		elseif slot0 == "L" and #slot1 > 1 then
			return slot0._attr[] < slot1._attr[slot0._attr[]]
		end
	end)

	slot9 = {}

	for slot13 = 1, slot6, 1 do
		slot9[slot13] = slot8[slot13]
	end

	return slot9
end

function ys.Battle.BattleBuffEffect.IsHappen(slot0, slot1)
	return math.random(100) < slot1
end

function ys.Battle.BattleBuffEffect.IsActive(slot0)
	return slot0._isActive
end

function ys.Battle.BattleBuffEffect.SetActive(slot0)
	slot0._isActive = true
end

function ys.Battle.BattleBuffEffect.NotActive(slot0)
	slot0._isActive = false
end

function ys.Battle.BattleBuffEffect.IsLock(slot0)
	return slot0._isLock
end

function ys.Battle.BattleBuffEffect.SetLock(slot0)
	slot0._isLock = true
end

function ys.Battle.BattleBuffEffect.NotLock(slot0)
	slot0._isLock = false
end

function ys.Battle.BattleBuffEffect.Dispose(slot0)
	return
end

return
