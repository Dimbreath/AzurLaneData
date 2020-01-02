ys = ys or {}
slot1 = ys.Battle.BattleFormulas
slot2 = ys.Battle.BattleConfig
ys.Battle.AutoPilotStrategy = class("AutoPilotStrategy", ys.Battle.BattleJoyStickBotBaseStrategy)
ys.Battle.AutoPilotStrategy.__name = "AutoPilotStrategy"
ys.Battle.AutoPilotStrategy.FIX_FRONT = 0.5

function ys.Battle.AutoPilotStrategy.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0._autoPilot = slot1.Battle.AutoPilot.New(slot1:GetMotionReferenceUnit(), slot1.Battle.BattleDataFunction.GetAITmpDataFromID(slot3))
end

function ys.Battle.AutoPilotStrategy.GetStrategyType(slot0)
	return slot0.Battle.BattleJoyStickAutoBot.AUTO_PILOT
end

function ys.Battle.AutoPilotStrategy.analysis(slot0)
	slot0._hrz = slot0._autoPilot:GetDirection().x
	slot0._vtc = slot0._autoPilot.GetDirection().z
end

return
