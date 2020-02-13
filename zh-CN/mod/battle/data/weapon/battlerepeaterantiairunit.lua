ys = ys or {}
slot1 = ys.Battle.BattleEvent
slot2 = ys.Battle.BattleFormulas
slot3 = ys.Battle.BattleConst
slot4 = ys.Battle.BattleConfig
slot5 = ys.Battle.BattleDataFunction
slot6 = ys.Battle.BattleAttr
slot7 = ys.Battle.BattleVariable
slot8 = class("BattleRepeaterAntiAirUnit", ys.Battle.BattleWeaponUnit)
ys.Battle.BattleRepeaterAntiAirUnit = slot8
slot8.__name = "BattleRepeaterAntiAirUnit"

function slot8.Ctor(slot0)
	slot0.super.Ctor(slot0)

	slot0._dataProxy = slot0.super.Ctor.Battle.BattleDataProxy.GetInstance()
end

function slot8.FilterTarget(slot0)
	slot2 = {}
	slot3 = slot0._host:GetIFF()
	slot4 = 1

	for slot8, slot9 in pairs(slot1) do
		if slot9:GetIFF() ~= slot3 and slot9:IsVisitable() then
			slot2[slot4] = slot9
			slot4 = slot4 + 1
		end
	end

	return slot2
end

function slot8.Fire(slot0)
	slot0._dataProxy:SpawnColumnArea(slot2.AOEField.AIR, slot0._host:GetIFF(), slot0._host:GetPosition(), slot0._tmpData.range * 2, -1, function (slot0)
		if not slot0._dataProxy then
			return
		end

		slot1 = {}
		slot2 = slot0._dataProxy:GetAircraftList()

		for slot6, slot7 in ipairs(slot0) do
			if slot7.Active and slot2[slot7.UID] and slot8:IsVisitable() then
				slot1[#slot1 + 1] = slot8
			end
		end

		slot3 = slot1.CalculateRepaterAnitiAirTotalDamage(slot0)

		while slot3 > 0 and #slot1 > 0 do
			if slot3 - (slot1[math.random(#slot1)].GetMaxHP(slot5) + math.random(slot2.AnitAirRepeaterConfig.lower_range, slot2.AnitAirRepeaterConfig.upper_range)) < 0 then
				slot6 = slot6 + slot3
			end

			if not slot1.RollRepeaterHitDice(slot0, slot5) then
				table.remove(slot1, slot4)
				slot0._dataProxy:HandleDirectDamage(slot5, slot6, slot0:GetHost())
			end
		end
	end)
	slot0:EnterCoolDown()
	slot0._host:PlayFX(slot0._tmpData.fire_fx, true)
	slot3.Battle.PlayBattleSFX(slot0._tmpData.fire_sfx)
end

return
