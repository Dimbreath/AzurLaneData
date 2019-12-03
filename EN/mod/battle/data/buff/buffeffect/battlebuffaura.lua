ys = ys or {}
slot1 = class("BattleBuffAura", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffAura = slot1
slot1.__name = "BattleBuffAura"
slot2 = ys.Battle.BattleConst

slot1.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

slot1.SetArgs = function (slot0, slot1, slot2)
	slot0._level = slot2:GetLv()
	slot0._caster = slot2:GetCaster()
	slot0._auraBuffID = slot0._tempData.arg_list.buff_id
	slot0._target = slot0._tempData.arg_list.target
	slot0._check_target = slot0._tempData.arg_list.check_target or "TargetNull"
	slot0._minTargetNumber = slot3.minTargetNumber or 0
	slot0._maxDistance = slot3.max_distance
	slot0._checkTargetMaxDistance = slot3.checkTargetMaxDistance
	slot0._isBuffStackByCheckTarget = slot3.isBuffStackByCheckTarget
	slot4 = true

	if (type(slot0._target) == "string" and slot0._target == "TargetAllHarm") or (slot5 == "table" and table.contains(slot0._target, "TargetAllHarm")) then
		slot4 = false
	end

	slot0._aura = slot0.Battle.BattleDataProxy.GetInstance():SpawnLastingCubeArea(slot1.AOEField.SURFACE, slot1:GetIFF(), Vector3(-55, 0, 55), 180, 70, 0, function (slot0)
		for slot4, slot5 in ipairs(slot0) do
			if slot5.Active then
				for slot10, slot11 in ipairs(slot6) do
					if slot11:GetUniqueID() == slot5.UID then
						slot11:AddBuff(slot2.Battle.BattleBuffUnit.New(slot0._auraBuffID, slot0._level, slot0._caster))

						break
					end
				end
			end
		end
	end, function (slot0)
		if slot0.Active then
			for slot5, slot6 in ipairs(slot1) do
				if slot6:GetUniqueID() == slot0.UID then
					slot6:RemoveBuff(slot0._auraBuffID)

					break
				end
			end
		end
	end, slot4)
end

slot1.Clear = function (slot0)
	slot0._aura:SetActiveFlag(false)

	slot0._aura = nil

	slot0.super.Clear(slot0)
end

return
