ys = ys or {}
slot1 = ys.Battle.BattleEvent
slot2 = ys.Battle.BattleConfig
slot3 = class("BattleSkillOverrideAutoPilot", ys.Battle.BattleSkillEffect)
ys.Battle.BattleSkillOverrideAutoPilot = slot3
slot3.__name = "BattleSkillOverrideAutoPilot"

slot3.Ctor = function (slot0, slot1, slot2)
	slot0.super.Ctor(slot0, slot1, slot2)

	slot0._AIID = slot0._tempData.arg_list.ai_id
end

slot3.DoDataEffect = function (slot0, slot1)
	if not slot1:GetFleetVO() then
		return
	end

	slot2:OverrideJoyStickAutoBot(slot0._AIID)
end

slot3.DataEffectWithoutTarget = function (slot0, slot1)
	slot0:DoDataEffect(slot1)
end

return
