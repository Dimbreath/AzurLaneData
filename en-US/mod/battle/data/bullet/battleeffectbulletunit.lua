ys = ys or {}
slot1 = class("BattleEffectBulletUnit", ys.Battle.BattleBulletUnit)
ys.Battle.BattleEffectBulletUnit = slot1
slot1.__name = "BattleEffectBulletUnit"

function slot1.Ctor(slot0, slot1, slot2)
	slot0.super.Ctor(slot0, slot1, slot2)
end

function slot1.Update(slot0, slot1)
	slot0.super.Update(slot0, slot1)

	if slot0._flare then
		slot0._flare:SetPosition(pg.Tool.FilterY(slot0:GetPosition():Clone()))
	end
end

function slot1.IsFlare(slot0)
	return slot0:GetTemplate().attach_buff[1].flare
end

function slot1.OutRange(slot0)
	slot0.super.OutRange(slot0)

	if slot0._flare then
		slot0._flare:SetActiveFlag(false)

		slot0._flare = nil
	end
end

function slot1.spawnArea(slot0, slot1)
	slot5 = slot0:GetTemplate().attach_buff[1].buff_id
	time = slot0.GetTemplate().hit_type.time
	slot8 = slot0._battleProxy:SpawnLastingColumnArea(slot0:GetEffectField(), slot0:GetIFF(), pg.Tool.FilterY(slot0:GetPosition():Clone()), slot0.GetTemplate().hit_type.range, time, function (slot0)
		for slot4, slot5 in ipairs(slot0) do
			if slot5.Active then
				slot0._battleProxy:GetUnitList()[slot5.UID]:AddBuff(slot1.Battle.BattleBuffUnit.New(slot2))
			end
		end
	end, function (slot0)
		if slot0.Active then
			slot0._battleProxy:GetUnitList()[slot0.UID]:RemoveBuff(slot0._battleProxy.GetUnitList()[slot0.UID])
		end
	end, slot0.GetTemplate().attach_buff[1].friendly, slot0.GetTemplate().attach_buff[1].effect_id)

	if slot1 then
		slot0._flare = slot8
	end

	return slot8
end

function slot1.GetExplodePostion(slot0)
	return slot0._explodePos
end

function slot1.SetExplodePosition(slot0, slot1)
	slot0._explodePos = slot1
end

return
