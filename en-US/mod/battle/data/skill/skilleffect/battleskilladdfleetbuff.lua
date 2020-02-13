ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.BattleSkillAddFleetBuff = class("BattleSkillAddFleetBuff", ys.Battle.BattleSkillEffect)
ys.Battle.BattleSkillAddFleetBuff.__name = "BattleSkillAddFleetBuff"

function ys.Battle.BattleSkillAddFleetBuff.Ctor(slot0, slot1, slot2)
	slot0.super.Ctor(slot0, slot1, slot2)

	slot0._fleetBuffID = slot0._tempData.arg_list.fleet_buff_id
end

function ys.Battle.BattleSkillAddFleetBuff.DoDataEffect(slot0, slot1, slot2)
	if slot2:IsAlive() and slot2:GetUnitType() == slot0.UnitType.PLAYER_UNIT then
		slot2:GetFleetVO():AttachFleetBuff(slot1.Battle.BattleFleetBuffUnit.New(slot0._fleetBuffID))
	end
end

return
