ys = ys or {}
slot1 = ys.Battle.BattleDataFunction
slot2 = ys.Battle.BattleFormulas
slot3 = class("BattleBuffAddBuff", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffAddBuff = slot3
slot3.__name = "BattleBuffAddBuff"

function slot3.Ctor(slot0, slot1)
	slot0.Battle.BattleBuffAddBuff.super.Ctor(slot0, slot1)
end

function slot3.SetArgs(slot0, slot1, slot2)
	slot0._level = slot2:GetLv()
	slot0._buff_id = slot0._tempData.arg_list.buff_id
	slot0._target = slot0._tempData.arg_list.target or "TargetSelf"
	slot0._time = slot3.time or 0
	slot0._rant = slot3.rant or 10000
	slot0._nextEffectTime = pg.TimeMgr.GetInstance():GetCombatTime() + slot0._time
	slot0._check_target = slot3.check_target
	slot0._minTargetNumber = slot3.minTargetNumber or 0
	slot0._maxTargetNumber = slot3.maxTargetNumber or 10000
	slot0._isBuffStackByCheckTarget = slot3.isBuffStackByCheckTarget
	slot0._countType = slot3.countType
	slot0._weaponType = slot0._tempData.arg_list.weaponType
end

function slot3.onUpdate(slot0, slot1, slot2, slot3)
	if slot0._nextEffectTime <= slot3 then
		slot0:attachBuff(slot0._buff_id, slot0._level, slot1)

		slot0._nextEffectTime = slot3 + slot0._time
	end
end

function slot3.onBulletHit(slot0, slot1, slot2, slot3)
	if not slot0:equipIndexRequire(slot3.equipIndex) then
		return
	end

	slot4 = slot3.target

	if (not slot0._weaponType or slot3.weaponType == slot0._weaponType) and slot4:IsAlive() then
		slot0:attachBuff(slot0._buff_id, slot0._level, slot4)
	end
end

function slot3.onBulletCreate(slot0, slot1, slot2, slot3)
	if not slot0:equipIndexRequire(slot3.equipIndex) then
		return
	end

	slot5 = slot0._buff_id
	slot6 = slot0._level

	slot3._bullet:SetBuffFun(slot0._tempData.arg_list.bulletTrigger, function (slot0, slot1)
		slot0:attachBuff(slot1, slot0.attachBuff, slot0)
	end)
end

function slot3.onTrigger(slot0, slot1, slot2, slot3)
	slot0.super.onTrigger(slot0, slot1, slot2, slot3)
	slot0:AddBuff(slot1)
end

function slot3.AddBuff(slot0, slot1)
	if not slot0:ammoRequire(slot1) then
		return
	end

	if slot0._check_target then
		if slot0._minTargetNumber <= #slot0:getTargetList(slot1, slot0._check_target, slot0._tempData.arg_list) and slot3 <= slot0._maxTargetNumber then
			for slot8, slot9 in ipairs(slot4) do
				if slot0._isBuffStackByCheckTarget then
					slot9:SetBuffStack(slot0._buff_id, slot0._level, slot3)
				else
					slot0:attachBuff(slot0._buff_id, slot0._level, slot9)
				end
			end
		end
	else
		for slot6, slot7 in ipairs(slot2) do
			slot0:attachBuff(slot0._buff_id, slot0._level, slot7)
		end
	end
end

function slot3.attachBuff(slot0, slot1, slot2, slot3)
	slot6 = nil

	if #slot0.GetBuffTemplate(slot1).effect_list == 1 and slot5[1].type == "BattleBuffDOT" then
		if slot1.CaclulateDOTPlace(slot0._rant, slot5[1], slot0._caster, slot3) then
			slot2.Battle.BattleBuffUnit.New(slot1, nil, slot0._caster):SetOrb(slot0._caster, 1)
		end
	elseif slot1.IsHappen(slot0._rant) then
		slot6 = slot2.Battle.BattleBuffUnit.New(slot1, slot2, slot0._caster)
	end

	if slot6 then
		slot6:SetCommander(slot0._commander)
		slot3:AddBuff(slot6)
	end
end

function slot3.Dispose(slot0)
	slot0.Battle.BattleBuffAddBuff.super:Dispose()
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._timer)

	slot0._timer = nil
end

return
