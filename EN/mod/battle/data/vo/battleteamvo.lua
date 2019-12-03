ys = ys or {}
slot1 = ys.Battle.BattleEvent
slot2 = ys.Battle.BattleFormulas
slot3 = ys.Battle.BattleConst
slot4 = ys.Battle.BattleConfig
slot5 = ys.Battle.BattleDataFunction
slot6 = class("BattleTeamVO")
ys.Battle.BattleTeamVO = slot6
slot6.__name = "BattleTeamVO"

slot6.Ctor = function (slot0, slot1)
	slot0._teamID = slot1

	slot0:init()
end

slot6.UpdateMotion = function (slot0)
	if slot0._motionReferenceUnit then
		slot0._motionVO:UpdatePos(slot0._motionReferenceUnit)
		slot0._motionVO:UpdateSpeed(slot0._motionReferenceUnit:GetSpeed())
	end
end

slot6.IsFatalDamage = function (slot0)
	return slot0._count == 0
end

slot6.AppendUnit = function (slot0, slot1)
	slot1:SetMotion(slot0._motionVO)

	slot0._enemyList[#slot0._enemyList + 1] = slot1
	slot0._count = slot0._count + 1

	slot0:refreshTeamFormation()
	slot1:SetTeamVO(slot0)
end

slot6.RemoveUnit = function (slot0, slot1)
	slot2 = 0

	for slot6, slot7 in ipairs(slot0._enemyList) do
		if slot7 == slot1 then
			slot2 = slot6

			break
		end
	end

	table.remove(slot0._enemyList, slot2)

	slot0._count = slot0._count - 1

	slot1:SetTeamVO(nil)
	slot0:refreshTeamFormation()
end

slot6.init = function (slot0)
	slot0._enemyList = {}
	slot0._motionVO = slot0.Battle.BattleFleetMotionVO.New()
	slot0._count = 0
end

slot6.refreshTeamFormation = function (slot0)
	slot1 = 1
	slot2 = #slot0._enemyList
	slot3 = {}

	while slot1 <= slot2 do
		slot3[#slot3 + 1] = slot1
		slot1 = slot1 + 1
	end

	slot4 = slot0.GetFormationTmpDataFromID(slot1.FORMATION_ID).pos_offset
	slot0._enemyList = slot0.SortFleetList(slot3, slot0._enemyList)
	slot5 = slot1.BornOffset

	for slot9, slot10 in ipairs(slot0._enemyList) do
		if slot9 == 1 then
			slot0._motionReferenceUnit = slot10

			slot10:CancelFollowTeam()
		else
			slot10:UpdateFormationOffset(Vector3(slot4[slot9].x, slot4[slot9].y, slot4[slot9].z) + slot5 * (slot9 - 1))
		end
	end
end

slot6.Dispose = function (slot0)
	slot0._enemyList = nil
	slot0._motionReferenceUnit = nil
	slot0._motionVO = nil
end

return
