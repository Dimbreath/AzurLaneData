ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = ys.Battle.BattleAirFighterUnit
ys.Battle.BattleAirFighterCharacter = class("BattleAirFighterCharacter", ys.Battle.BattleAircraftCharacter)
ys.Battle.BattleAirFighterCharacter.__name = "BattleAirFighterCharacter"

ys.Battle.BattleAirFighterCharacter.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.BattleAirFighterCharacter.SetUnitData = function (slot0, slot1)
	slot0._unitData = slot1

	slot0:AddUnitEvent()
	slot1:SetUnVisitable()
end

ys.Battle.BattleAirFighterCharacter.AddModel = function (slot0, slot1)
	slot0:SetGO(slot1)
	slot0:SetBoneList()
	slot0._unitData:ActiveCldBox()
end

ys.Battle.BattleAirFighterCharacter.Update = function (slot0)
	slot0:UpdateMatrix()
	slot0:UpdateUIComponentPosition()
	slot0:UpdateHPPop()
	slot0:UpdateHPBarPostition()
	slot0:UpdatePosition()
	slot0:UpdateHpBar()

	if slot0._unitData:GetStrikeState() == slot0.STRIKE_STATE_DOWN or slot1 == slot0.STRIKE_STATE_ATTACK or slot1 == slot0.STRIKE_STATE_UP then
		slot0:UpdateShadow()
	end
end

ys.Battle.BattleAirFighterCharacter.AddUnitEvent = function (slot0)
	slot0.super.AddUnitEvent(slot0)
	slot0._unitData:RegisterEventListener(slot0, slot1.AIR_STRIKE_STATE_CHANGE, slot0.onStrikeStateChange)
end

ys.Battle.BattleAirFighterCharacter.RemoveUnitEvent = function (slot0)
	slot0.super.RemoveUnitEvent(slot0)
	slot0._unitData:UnregisterEventListener(slot0, slot1.AIR_STRIKE_STATE_CHANGE)
end

ys.Battle.BattleAirFighterCharacter.onStrikeStateChange = function (slot0)
	if slot0._unitData:GetStrikeState() == slot0.STRIKE_STATE_FLY then
		slot0._tf.localScale = Vector3(slot2, (12 / (slot0._unitData:GetFormationIndex() + 3) + 1) * slot0._unitData:GetSize(), )

		slot0._shadow:SetActive(false)
	elseif slot1 == slot0.STRIKE_STATE_BACK then
		slot2 = slot0._unitData:GetSize()
		slot0._tf.localScale = Vector3(-slot2, slot2, slot2)

		slot0._HPBar:SetActive(true)
		slot0._shadow:SetActive(true)
	elseif slot1 == slot0.STRIKE_STATE_DOWN then
	elseif slot1 == slot0.STRIKE_STATE_ATTACK then
	elseif slot1 == slot0.STRIKE_STATE_UP then
	elseif slot1 == slot0.STRIKE_STATE_FREE then
	end
end

return
