ys = ys or {}
ys.Battle.BattleBuffOverrideBullet = class("BattleBuffOverrideBullet", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffOverrideBullet.__name = "BattleBuffOverrideBullet"

function ys.Battle.BattleBuffOverrideBullet.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffOverrideBullet.SetArgs(slot0, slot1, slot2)
	slot0._bulletType = slot0._tempData.arg_list.bullet_type
	slot0._override = slot0._tempData.arg_list.override
end

function ys.Battle.BattleBuffOverrideBullet.onBulletCreate(slot0, slot1, slot2, slot3)
	if slot3._bullet.GetType(slot4) == slot0._bulletType then
		slot0:overrideBullet(slot4)
	end
end

function ys.Battle.BattleBuffOverrideBullet.overrideBullet(slot0, slot1)
	for slot5, slot6 in pairs(slot0._override) do
		if slot5 == "diverFilter" then
			slot1:SetDiverFilter(slot6)
			slot1:ResetCldSurface()
		end
	end
end

return
