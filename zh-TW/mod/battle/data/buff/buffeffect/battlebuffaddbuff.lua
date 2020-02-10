ys = ys or {}
slot0 = ys
slot1 = class("BattleBuffAddBuff", slot0.Battle.BattleBuffEffect)
slot0.Battle.BattleBuffAddBuff = slot1
slot1.__name = "BattleBuffAddBuff"

function slot1.Ctor(slot0, slot1)
	uv0.Battle.BattleBuffAddBuff.super.Ctor(slot0, slot1)
end

function slot1.SetArgs(slot0, slot1, slot2)
	slot0._level = slot2:GetLv()
	slot3 = slot0._tempData.arg_list
	slot0._buff_id = slot3.buff_id
	slot0._target = slot3.target or "TargetSelf"
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

function slot1.onUpdate(slot0, slot1, slot2, slot3)
	if slot0._nextEffectTime <= slot3 then
		slot4 = uv0.Battle.BattleBuffUnit.New(slot0._buff_id, slot0._level, slot0._caster)

		slot4:SetCommander(slot0._commander)
		slot1:AddBuff(slot4)

		slot0._nextEffectTime = slot3 + slot0._time
	end
end

function slot1.onBulletHit(slot0, slot1, slot2, slot3)
	if not slot0:equipIndexRequire(slot3.equipIndex) then
		return
	end

	slot4 = slot3.target

	if (not slot0._weaponType or slot3.weaponType == slot0._weaponType) and uv0.Battle.BattleFormulas.IsHappen(slot0._rant) and slot4:IsAlive() then
		slot5 = uv0.Battle.BattleBuffUnit.New(slot0._buff_id, slot0._level, slot0._caster)

		slot5:SetCommander(slot0._commander)
		slot4:AddBuff(slot5)
	end
end

function slot1.onBulletCreate(slot0, slot1, slot2, slot3)
	if not slot0:equipIndexRequire(slot3.equipIndex) then
		return
	end

	slot5 = slot0._buff_id
	slot6 = slot0._level

	slot3._bullet:SetBuffFun(slot0._tempData.arg_list.bulletTrigger, function (slot0, slot1)
		slot2 = uv0.Battle.BattleBuffUnit.New(uv1, uv2, uv3._caster)

		slot2:SetCommander(uv3._commander)
		slot0:AddBuff(slot2)
	end)
end

function slot1.onTrigger(slot0, slot1, slot2, slot3)
	uv0.super.onTrigger(slot0, slot1, slot2, slot3)
	slot0:AddBuff(slot1)
end

function slot1.AddBuff(slot0, slot1)
	if not slot0:ammoRequire(slot1) then
		return
	end

	if slot0._check_target then
		if slot0._minTargetNumber <= #slot0:getTargetList(slot1, slot0._check_target, slot0._tempData.arg_list) and slot3 <= slot0._maxTargetNumber then
			for slot8, slot9 in ipairs(slot0:getTargetList(slot1, slot0._target, slot0._tempData.arg_list)) do
				if slot0._isBuffStackByCheckTarget then
					slot9:SetBuffStack(slot0._buff_id, slot0._level, slot3)
				else
					slot10 = uv0.Battle.BattleBuffUnit.New(slot0._buff_id, slot0._level, slot0._caster)

					slot10:SetCommander(slot0._commander)
					slot9:AddBuff(slot10)
				end
			end
		end
	else
		for slot6, slot7 in ipairs(slot0:getTargetList(slot1, slot0._target, slot0._tempData.arg_list)) do
			slot8 = uv0.Battle.BattleBuffUnit.New(slot0._buff_id, slot0._level, slot0._caster)

			slot8:SetCommander(slot0._commander)
			slot7:AddBuff(slot8)
		end
	end
end

function slot1.Dispose(slot0)
	uv0.Battle.BattleBuffAddBuff.super:Dispose()
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._timer)

	slot0._timer = nil
end
