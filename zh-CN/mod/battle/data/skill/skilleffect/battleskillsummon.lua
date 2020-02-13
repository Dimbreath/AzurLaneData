ys = ys or {}
ys.Battle.BattleSkillSummon = class("BattleSkillSummon", ys.Battle.BattleSkillEffect)
ys.Battle.BattleSkillSummon.__name = "BattleSkillSummon"

function ys.Battle.BattleSkillSummon.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1, lv)
end

function ys.Battle.BattleSkillSummon.DoDataEffectWithoutTarget(slot0, slot1, slot2)
	slot0:DoSummon(slot1, slot2)
end

function ys.Battle.BattleSkillSummon.DoDataEffect(slot0, slot1, slot2, slot3)
	slot0:DoSummon(slot1, slot3)
end

function ys.Battle.BattleSkillSummon.DoSummon(slot0, slot1, slot2)
	slot3 = slot0.Battle.BattleDataProxy.GetInstance()

	if slot0._tempData.arg_list.isCasterAlive and not slot1:IsAlive() then
		return
	end

	slot5 = slot1:GetPosition()
	slot6 = nil

	if slot4.HPColor then
		slot6 = Color.New(slot4.HPColor[1], slot4.HPColor[2], slot4.HPColor[3], 1)
	end

	slot7 = slot4.equipmentList or {}
	slot8, slot9 = nil
	slot10 = slot4.monsterTemplateID
	slot11, slot12, slot13, slot14 = nil

	if slot4.isClone then
		slot9 = slot1:GetAttr()

		if slot4.equipmentList then
		else
			slot7 = {}

			for slot18, slot19 in ipairs(slot1._equipmentList) do
				slot7[#slot7 + 1] = slot19.id
			end
		end

		slot11 = Clone(slot1:GetTemplate())
	end

	if slot4.isBulletPos then
		slot5 = slot2.bullet:GetExplodePostion()
	end

	if slot1.GetWaveIndex then
		slot13 = slot1:GetWaveIndex()
	end

	slot3:SpawnMonster({
		monsterTemplateID = slot10,
		equipmentList = slot7,
		pilotAITemplateID = slot12 or slot4.pilotAITemplateID,
		corrdinate = slot4.corrdinate or {
			slot5.x,
			slot5.y,
			slot5.z
		},
		buffList = slot14 or slot4.buffList,
		mark = slot4.mark,
		extraInfo = {
			IFF = slot1:GetIFF(),
			dir = slot1:GetDirection(),
			HPColor = slot6,
			attr = slot9,
			template = slot11,
			isUnvisible = slot4.isUnvisible
		}
	}, slot13, slot0.Battle.BattleConst.UnitType.NPC_UNIT, slot1:GetIFF())
end

return
