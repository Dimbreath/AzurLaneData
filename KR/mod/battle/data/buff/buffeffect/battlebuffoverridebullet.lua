ys = ys or {}
ys.Battle.BattleBuffOverrideBullet = class("BattleBuffOverrideBullet", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffOverrideBullet.__name = "BattleBuffOverrideBullet"

ys.Battle.BattleBuffOverrideBullet.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

ys.Battle.BattleBuffOverrideBullet.SetArgs = function (slot0, slot1, slot2)
	slot0._bulletType = slot0._tempData.arg_list.bullet_type
	slot0._override = slot0._tempData.arg_list.override
end

ys.Battle.BattleBuffOverrideBullet.onBulletCreate = function (slot0, slot1, slot2, slot3)
	if slot3._bullet.GetType(slot4) == slot0._bulletType then
		slot0:overrideBullet(slot4)
	end
end

ys.Battle.BattleBuffOverrideBullet.overrideBullet = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0._override) do
		if slot5 == "diverFilter" then
			slot1:SetDiverFilter(slot6)
			slot1:ResetCldSurface()
		end
	end
end

return
