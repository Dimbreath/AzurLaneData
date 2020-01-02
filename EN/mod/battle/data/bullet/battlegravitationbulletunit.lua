ys = ys or {}
slot1 = ys.Battle.BattleFormulas
slot2 = class("BattleGravitationBulletUnit", ys.Battle.BattleBulletUnit)
ys.Battle.BattleGravitationBulletUnit = slot2
slot2.__name = "BattleGravitationBulletUnit"

function slot2.Ctor(slot0, slot1, slot2)
	slot0.super.Ctor(slot0, slot1, slot2)
end

function slot2.Update(slot0, slot1)
	if slot0._pierceCount > 0 then
		slot0.super.Update(slot0, slot1)
	end
end

function slot2.SetTemplateData(slot0, slot1)
	slot0.super.SetTemplateData(slot0, slot1)

	slot0._hitInterval = slot1.hit_type.interval or 0.2
end

function slot2.GetExplodePostion(slot0)
	return slot0._explodePos
end

function slot2.SetExplodePosition(slot0, slot1)
	slot0._explodePos = slot1
end

function slot2.DealDamage(slot0)
	slot0._nextDamageTime = pg.TimeMgr.GetInstance():GetCombatTime() + slot0._hitInterval
end

function slot2.CanDealDamage(slot0)
	if not slot0._nextDamageTime then
		slot0._nextDamageTime = pg.TimeMgr.GetInstance():GetCombatTime() + slot0._tempData.extra_param.alert_duration

		return false
	else
		return slot0._nextDamageTime < pg.TimeMgr.GetInstance():GetCombatTime()
	end
end

function slot2.Hit(slot0, slot1, slot2)
	slot0.super.Hit(slot0, slot1, slot2)

	slot0._pierceCount = slot0._pierceCount - 1
	slot0._position.y = 100
end

return
