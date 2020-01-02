ys = ys or {}
slot1 = ys.Battle.BattleConst.AIStepType
slot2 = class("AutoPilot")
ys.Battle.AutoPilot = slot2
slot2.__name = "AutoPilot"
slot2.PILOT_VALVE = 0.5

function slot2.Ctor(slot0, slot1, slot2)
	slot0._aiCfg = slot2
	slot0._target = slot1

	slot1._move:SetAutoMoveAI(slot0, slot1)
	slot0:generateList()

	slot0._currentStep = slot0._stepList[slot0._aiCfg.default]

	slot0._currentStep:Active(slot0._target)
end

function slot2.GetDirection(slot0)
	return slot0._currentStep:GetDirection(slot0._target:GetPosition())
end

function slot2.InputWeaponStateChange(slot0)
	return
end

function slot2.NextStep(slot0)
	if slot0._stepList[slot0._currentStep:GetToIndex()] == nil then
		slot1 = slot0._aiCfg.default
	end

	slot0._currentStep = slot0._stepList[slot1]

	slot0._currentStep:Active(slot0._target)
end

function slot2.generateList(slot0)
	slot0._stepList = {}

	for slot4, slot5 in ipairs(slot0._aiCfg.list) do
		slot6 = nil
		slot7 = slot5.index
		slot8 = slot5.to
		slot10 = slot5.param

		if slot5.type == slot0.STAY then
			slot6 = slot1.Battle.AutoPilotStay.New(slot7, slot0)
		elseif slot9 == slot0.MOVE_TO then
			slot6 = slot1.Battle.AutoPilotMoveTo.New(slot7, slot0)
		elseif slot9 == slot0.MOVE then
			slot6 = slot1.Battle.AutoPilotMove.New(slot7, slot0)
		elseif slot9 == slot0.BROWNIAN then
			slot6 = slot1.Battle.AutoPilotBrownian.New(slot7, slot0)
		elseif slot9 == slot0.CIRCLE then
			slot6 = slot1.Battle.AutoPilotCircle.New(slot7, slot0)
		elseif slot9 == slot0.RELATIVE_BROWNIAN then
			slot6 = slot1.Battle.AutoPilotRelativeBrownian.New(slot7, slot0)
		end

		slot6:SetParameter(slot10, slot8)

		slot0._stepList[slot6:GetIndex()] = slot6
	end
end

return
