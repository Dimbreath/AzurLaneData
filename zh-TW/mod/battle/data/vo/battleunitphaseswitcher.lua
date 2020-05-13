ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleConst.BossPhaseSwitchType
slot2 = slot0.Battle.BattleConst
slot0.Battle.BattleUnitPhaseSwitcher = class("BattleUnitPhaseSwitcher")
slot0.Battle.BattleUnitPhaseSwitcher.__name = "BattleUnitPhaseSwitcher"
slot3 = slot0.Battle.BattleUnitPhaseSwitcher

function slot3.Ctor(slot0, slot1)
	slot0._client = slot1

	slot0._client:AddPhaseSwitcher(slot0)
end

function slot3.Update(slot0)
	if slot0._currentPhase.switchType == uv0.DURATION then
		if slot0._currentPhase.switchParam < pg.TimeMgr.GetInstance():GetCombatTime() - slot0._phaseStartTime then
			slot0:switch(slot0._currentPhase.switchTo)
		end
	elseif slot0._currentPhase.switchType == uv0.POSITION_X_GREATER then
		if slot0._currentPhase.switchParam < slot0._client:GetPosition().x then
			slot0:switch(slot0._currentPhase.switchTo)
		end
	elseif slot0._currentPhase.switchType == uv0.POSITION_X_LESS and slot0._client:GetPosition().x < slot0._currentPhase.switchParam then
		slot0:switch(slot0._currentPhase.switchTo)
	end
end

function slot3.GetPhaseProgress(slot0)
	if slot0._currentPhase.switchType == uv0.DURATION then
		return (pg.TimeMgr.GetInstance():GetCombatTime() - slot0._phaseStartTime) / slot0._currentPhase.switchParam
	else
		return 1
	end
end

function slot3.UpdateHP(slot0, slot1)
	if slot0._currentPhase.switchType == uv0.HP and slot1 < slot0._currentPhase.switchParam then
		slot0:switch(slot0._currentPhase.switchTo)
	end
end

function slot3.SetTemplateData(slot0, slot1)
	slot0._phaseList = {}

	for slot5, slot6 in ipairs(slot1) do
		slot0._phaseList[slot6.index] = slot6
	end

	slot0:switch(0)
end

function slot3.switch(slot0, slot1)
	if slot1 == -1 or slot0._phaseList[slot1] == nil then
		return
	end

	slot3 = slot0._phaseList[slot1].addWeapon or {}
	slot4 = slot2.removeWeapon or {}
	slot0._currentPhase = slot2

	if slot2.switchParamFunc then
		slot0._currentPhase.switchParam = slot2.switchParamFunc()
	end

	slot0._client:ShiftWeapon(slot4, slot3)

	if slot2.removeBuff then
		for slot8, slot9 in ipairs(slot2.removeBuff) do
			slot0._client:RemoveBuff(slot9)
		end
	end

	if slot2.addBuff then
		for slot8, slot9 in ipairs(slot2.addBuff) do
			slot0._client:AddBuff(uv0.Battle.BattleBuffUnit.New(slot9))
		end
	end

	if slot2.dive then
		slot0._client:ChangeOxygenState(slot2.dive)
	end

	if slot2.setAI then
		slot0._client:SetAI(slot2.setAI)
	end

	if slot2.switchType == uv1.DURATION then
		slot0._phaseStartTime = pg.TimeMgr.GetInstance():GetCombatTime()
	end

	if slot2.retreat == true then
		slot0._client:Retreat()
	end
end
