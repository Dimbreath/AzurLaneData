ys = ys or {}
ys.Battle.BattleAllInStrikeVO = class("BattleAllInStrikeVO", ys.Battle.BattlePlayerWeaponVO)
ys.Battle.BattleAllInStrikeVO.__name = "BattleAllInStrikeVO"
ys.Battle.BattleAllInStrikeVO.GCD = ys.Battle.BattleConfig.AirAssistCFG.GCD

ys.Battle.BattleAllInStrikeVO.Ctor = function (slot0)
	slot0.super.Ctor(slot0, slot0.GCD)
end

ys.Battle.BattleAllInStrikeVO.AppendWeapon = function (slot0, slot1)
	slot1:SetAllInWeaponVO(slot0)
	slot0.super.AppendWeapon(slot0, slot1)
end

return
