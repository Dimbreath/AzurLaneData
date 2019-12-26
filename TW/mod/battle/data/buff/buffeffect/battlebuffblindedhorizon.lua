ys = ys or {}
slot1 = class("BattleBuffBlindedHorizon", ys.Battle.BattleBuffAura)
ys.Battle.BattleBuffBlindedHorizon = slot1
slot1.__name = "BattleBuffBlindedHorizon"
slot2 = ys.Battle.BattleConst

function slot1.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function slot1.SetArgs(slot0, slot1, slot2)
	slot0._horizonRange = slot0._tempData.arg_list.range
	slot4 = slot1:GetUniqueID()
	slot0._aura = slot0.Battle.BattleDataProxy.GetInstance():SpawnAura(slot1, slot1.AOEField.SURFACE, slot0._horizonRange, function (slot0)
		for slot4, slot5 in ipairs(slot0) do
			if slot5.Active then
				for slot10, slot11 in ipairs(slot6) do
					if slot11:GetUniqueID() == slot5.UID then
						slot11:AppendExposed(slot2)

						break
					end
				end
			end
		end
	end, function (slot0)
		if slot0.Active then
			for slot5, slot6 in ipairs(slot1) do
				if slot6:GetUniqueID() == slot0.UID then
					slot6:RemoveExposed(slot2)

					break
				end
			end
		end
	end, function (slot0)
		if slot0.Active then
			for slot5, slot6 in ipairs(slot1) do
				if slot6:GetUniqueID() == slot0.UID then
					slot6:RemoveExposed(slot2)

					break
				end
			end
		end
	end)
end

function slot1.onAttach(slot0, slot1, slot2)
	slot0.Battle.BattleAttr.FlashByBuff(slot1, "blindedHorizon", slot0._horizonRange)
end

function slot1.onRemove(slot0, slot1, slot2)
	slot0.Battle.BattleAttr.FlashByBuff(slot1, "blindedHorizon", 0)
end

return
