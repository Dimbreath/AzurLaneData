ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.BattleFleetBuffBlindAura = class("BattleFleetBuffBlindAura", ys.Battle.BattleFleetBuffEffect)
ys.Battle.BattleFleetBuffBlindAura.__name = "BattleFleetBuffBlindAura"

function ys.Battle.BattleFleetBuffBlindAura.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleFleetBuffBlindAura.SetArgs(slot0, slot1, slot2)
	slot3 = slot0._tempData.arg_list.target
	slot0._aura = slot0.Battle.BattleDataProxy.GetInstance():SpawnLastingCubeArea(slot1.AOEField.SURFACE, slot1:GetIFF(), Vector3(-55, 0, 55), 180, 70, 0, function (slot0)
		slot1 = slot0:getTargetList(slot0.getTargetList, slot0, slot0._tempData.arg_list)

		for slot5, slot6 in ipairs(slot0) do
			if slot6.Active then
				for slot10, slot11 in ipairs(slot1) do
					if slot11:GetUniqueID() == slot6.UID then
						slot11:SetBlindInvisible(true)

						break
					end
				end
			end
		end
	end, function (slot0)
		if slot0.Active then
			for slot5, slot6 in ipairs(slot1) do
				if slot6:GetUniqueID() == slot0.UID then
					slot6:SetBlindInvisible(false)

					break
				end
			end
		end
	end, false)
end

function ys.Battle.BattleFleetBuffBlindAura.Clear(slot0)
	slot0._aura:SetActiveFlag(false)

	slot0._aura = nil

	slot0.super.Clear(slot0)
end

return
