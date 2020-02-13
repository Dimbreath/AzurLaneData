ys = ys or {}
slot1 = class("BattleBuffAntiSubVigilance", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffAntiSubVigilance = slot1
slot1.__name = "BattleBuffAntiSubVigilance"

function slot1.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function slot1.SetArgs(slot0, slot1, slot2)
	slot0._vigilantRange = slot0._tempData.arg_list.vigilanceRange
	slot0._sonarRange = slot0._tempData.arg_list.sonarRange
	slot0._sonarFrequency = slot0._tempData.arg_list.sonarFrequency
end

function slot1.onAttach(slot0, slot1)
	slot0._vigilantUnit = slot1
	slot0._vigilantState = slot1:InitAntiSubState(slot0._sonarRange, slot0._sonarFrequency)

	slot0._vigilantState:InitCheck(#slot0:getTargetList(slot0._vigilantUnit, "TargetHarmNearest", {
		range = 200
	}))

	slot0._sonarCheckTimeStamp = pg.TimeMgr.GetInstance():GetCombatTime()
end

function slot1.onUpdate(slot0)
	if #slot0:getTargetList(slot0._vigilantUnit, "TargetHarmNearest", {
		range = slot0._vigilantRange
	}) > 0 then
		slot0._vigilantState:VigilantAreaEngage()
	end

	slot0._vigilantState:Update(slot2, #slot0:getTargetList(slot0._vigilantUnit, {
		"TargetAllFoe",
		"TargetHarmNearest",
		"TargetDiveState"
	}, {
		range = slot0._sonarRange
	}))

	if slot0._sonarFrequency <= pg.TimeMgr.GetInstance():GetCombatTime() - slot0._sonarCheckTimeStamp then
		slot0._vigilantState:SonarDetect(slot3)

		slot0._sonarCheckTimeStamp = slot4
	end
end

function slot1.onAntiSubHateChain(slot0)
	slot0._vigilantState:HateChain()
end

function slot1.onFriendlyShipDying(slot0, slot1, slot2, slot3)
	slot0._vigilantState:MineExplode()
end

function slot1.onSubmarinFreeDive(slot0, slot1, slot2, slot3)
	return
end

function slot1.onSubmarinFreeFloat(slot0, slot1, slot2, slot3)
	slot0._vigilantState:SubmarineFloat()
end

return
