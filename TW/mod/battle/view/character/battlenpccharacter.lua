ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
ys.Battle.BattleNPCCharacter = class("BattleNPCCharacter", ys.Battle.BattleEnemyCharacter)
ys.Battle.BattleNPCCharacter.__name = "BattleNPCCharacter"

function ys.Battle.BattleNPCCharacter.Ctor(slot0)
	slot0.super.Ctor(slot0)

	slot0._preCastBound = false
end

function ys.Battle.BattleNPCCharacter.SetHPColor(slot0, slot1)
	slot0._HPColor = slot1
end

function ys.Battle.BattleNPCCharacter.GetHPColor(slot0)
	return slot0._HPColor
end

function ys.Battle.BattleNPCCharacter.SetModleID(slot0, slot1)
	slot0._prefab = slot1
end

function ys.Battle.BattleNPCCharacter.GetModleID(slot0)
	if slot0._prefab then
		return slot0._prefab
	else
		return slot0._unitData:GetTemplate().prefab
	end
end

function ys.Battle.BattleNPCCharacter.SetUnvisible(slot0)
	slot0._isUnvisible = true
end

function ys.Battle.BattleNPCCharacter.MakeVisible(slot0)
	if slot0._isUnvisible then
		slot0._go:SetActive(false)
		slot0._HPBar:SetActive(false)
		slot0._buffBar:SetActive(false)
	end
end

return
