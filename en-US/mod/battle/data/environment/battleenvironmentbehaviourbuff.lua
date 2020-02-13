ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = ys.Battle.BattleConfig
slot3 = class("BattleEnvironmentBehaviourBuff", ys.Battle.BattleEnvironmentBehaviour)
ys.Battle.BattleEnvironmentBehaviourBuff = slot3
slot3.__name = "BattleEnvironmentBehaviourBuff"

function slot3.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot3.SetTemplate(slot0, slot1)
	slot0.super.SetTemplate(slot0, slot1)

	slot0._buffID = slot0._tmpData.buff_id
	slot0._buffLevel = slot0._tmpData.level or 1
end

function slot3.doBehaviour(slot0)
	for slot4, slot5 in ipairs(slot0._cldUnitList) do
		if slot5:IsAlive() then
			slot5:AddBuff(slot0.Battle.BattleBuffUnit.New(slot0._buffID, slot0._buffLevel))
		end
	end

	slot1.super.doBehaviour(slot0)
end

return
