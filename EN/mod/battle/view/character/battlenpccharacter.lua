ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
ys.Battle.BattleNPCCharacter = class("BattleNPCCharacter", ys.Battle.BattleEnemyCharacter)
ys.Battle.BattleNPCCharacter.__name = "BattleNPCCharacter"

ys.Battle.BattleNPCCharacter.Ctor = function (slot0)
	slot0.super.Ctor(slot0)

	slot0._preCastBound = false
end

ys.Battle.BattleNPCCharacter.SetHPColor = function (slot0, slot1)
	slot0._HPColor = slot1
end

ys.Battle.BattleNPCCharacter.GetHPColor = function (slot0)
	return slot0._HPColor
end

ys.Battle.BattleNPCCharacter.SetModleID = function (slot0, slot1)
	slot0._prefab = slot1
end

ys.Battle.BattleNPCCharacter.GetModleID = function (slot0)
	if slot0._prefab then
		return slot0._prefab
	else
		return slot0._unitData:GetTemplate().prefab
	end
end

ys.Battle.BattleNPCCharacter.SetUnvisible = function (slot0)
	slot0._isUnvisible = true
end

ys.Battle.BattleNPCCharacter.MakeVisible = function (slot0)
	if slot0._isUnvisible then
		slot0._go:SetActive(false)
		slot0._HPBar:SetActive(false)
		slot0._buffBar:SetActive(false)
	end
end

return
