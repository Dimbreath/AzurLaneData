ys = ys or {}
slot1 = ys.Battle.BattleDataFunction
slot2 = ys.Battle.BattleConst
slot3 = ys.Battle.BattleFormulas
slot4 = ys.Battle.BattleAttr
slot5 = ys.Battle.BattleConfig
slot6 = ys.Battle.BattleUnitEvent
slot7 = ys.Battle.UnitState
slot8 = class("BattleEnemyUnit", ys.Battle.BattleUnit)
ys.Battle.BattleEnemyUnit = slot8
slot8.__name = "BattleEnemyUnit"

slot8.Ctor = function (slot0, slot1, slot2)
	slot0.super.Ctor(slot0, slot1, slot2)

	slot0._type = slot1.UnitType.ENEMY_UNIT
	slot0._level = slot0._battleProxy:GetDungeonLevel()
end

slot8.SetBound = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.super.SetBound(slot0, slot1, slot2, slot3, slot4, slot5, slot6)

	slot0._weaponRightBound = slot4
	slot0._weaponLowerBound = slot2
end

slot8.UpdateAction = function (slot0)
	if slot0._oxyState and slot0._oxyState:GetCurrentDiveState() == slot0.OXY_STATE.DIVE then
		if slot0:GetSpeed().x > 0 then
			slot0._unitState:ChangeState(slot1.STATE_DIVELEFT)
		else
			slot0._unitState:ChangeState(slot1.STATE_DIVE)
		end
	elseif slot0:GetSpeed().x > 0 then
		slot0._unitState:ChangeState(slot1.STATE_MOVELEFT)
	else
		slot0._unitState:ChangeState(slot1.STATE_MOVE)
	end
end

slot8.UpdateHP = function (slot0, slot1, slot2, slot3, slot4)
	slot0.super.UpdateHP(slot0, slot1, slot2, slot3, slot4)

	if slot0._phaseSwitcher then
		slot0._phaseSwitcher:UpdateHP(slot0:GetHPRate())
	end
end

slot8.SetTemplate = function (slot0, slot1, slot2)
	slot0.super.SetTemplate(slot0, slot1)

	slot0._tmpData = slot1.GetMonsterTmpDataFromID(slot0._tmpID)

	slot0:configWeaponQueueParallel()
	slot0:InitCldComponent()
	slot0:SetAttr()

	slot2 = slot2 or {}
	slot3 = slot0:GetExtraInfo()

	for slot7, slot8 in pairs(slot2) do
		slot3[slot7] = slot8
	end

	slot0:setStandardLabelTag()
end

slot8.SetTeamVO = function (slot0, slot1)
	slot0._team = slot1
end

slot8.SetFormationIndex = function (slot0, slot1)
	slot0._formationIndex = slot1
end

slot8.SetWaveIndex = function (slot0, slot1)
	slot0._waveIndex = slot1
end

slot8.SetAttr = function (slot0)
	slot1 = nil

	if slot0:GetRepress() then
		slot1 = slot0._battleProxy:GetRepressLevel()
	end

	slot0:SetEnemyAttr(slot1)
	slot0.InitDOTAttr(slot0._attr, slot0._tmpData)
	slot0:SetCurrent("srcShipType", slot0._tmpData.type)
end

slot8.GetTemplate = function (slot0)
	return slot0._tmpData
end

slot8.GetRarity = function (slot0)
	return slot0._tmpData.rarity
end

slot8.GetLevel = function (slot0)
	return slot0._level or 1
end

slot8.GetTeam = function (slot0)
	return slot0._team
end

slot8.GetWaveIndex = function (slot0)
	return slot0._waveIndex
end

slot8.IsShowHPBar = function (slot0)
	return slot0._IFF ~= slot0.FRIENDLY_CODE
end

slot8.InitCldComponent = function (slot0)
	slot0.super.InitCldComponent(slot0)
	slot0._cldComponent:SetCldData({
		type = slot1.CldType.SHIP,
		IFF = slot0:GetIFF(),
		UID = slot0:GetUniqueID(),
		Mass = slot1.CldMass.L1,
		IsBoss = slot0._isBoss
	})

	if slot0:GetTemplate().friendly_cld ~= 0 then
		slot0._cldComponent:ActiveFriendlyCld()
	end
end

slot8.ConfigBubbleFX = function (slot0)
	slot0._bubbleFX = slot0._tmpData.bubble_fx

	slot0._oxyState:SetBubbleTemplate(slot0._tmpData.bubble_initial, slot0._tmpData.bubble_interval)
end

return
