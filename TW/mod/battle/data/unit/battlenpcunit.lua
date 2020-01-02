ys = ys or {}
slot1 = ys.Battle.BattleDataFunction
slot2 = ys.Battle.BattleConst
slot3 = ys.Battle.BattleFormulas
slot4 = ys.Battle.BattleAttr
slot5 = ys.Battle.BattleUnitEvent
ys.Battle.BattleNPCUnit = class("BattleNPCUnit", ys.Battle.BattleEnemyUnit)

function ys.Battle.BattleNPCUnit.SetTemplate(slot0, slot1, slot2)
	slot0.super.SetTemplate(slot0, slot1)

	slot0._tmpData = setmetatable({}, {
		__index = slot1.Battle.BattleDataFunction.GetMonsterTmpDataFromID(slot0._tmpID)
	})

	if slot2.template then
		for slot6, slot7 in pairs(slot2.template) do
			slot0._tmpData[slot6] = slot7
		end

		slot0._tmpData.id = slot1
	end

	if slot2.attr then
		slot2.SetAttr(slot0, slot2.attr)
	else
		slot0:SetAttr()
	end

	slot0:SetCurrentHP(slot2.currentHP or slot0:GetMaxHP())
	slot0:InitCldComponent()
end

return
