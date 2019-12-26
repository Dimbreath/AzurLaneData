slot0 = class("BeatMonsterNianConst")
slot0.INPUT_TIME = 3
slot0.ACTION_NAME_L = "L"
slot0.ACTION_NAME_R = "R"
slot0.ACTION_NAME_A = "A"
slot0.MotionCombinations = {
	LLA = "isAttack2",
	RRA = "isAttack5",
	ARA = "isAttack2",
	LRA = "isAttack3",
	AAA = "isAttack1",
	LAA = "isAttack4",
	ALA = "isAttack1",
	RAA = "isAttack7",
	RLA = "isAttack6"
}

function slot0.MatchAction(slot0)
	return slot0.MotionCombinations[slot0] ~= nil
end

function slot0.GetMatchAction(slot0)
	return slot0.MotionCombinations[slot0]
end

function slot0.GetMonsterAction(slot0)
	return "isAttack"
end

return slot0
