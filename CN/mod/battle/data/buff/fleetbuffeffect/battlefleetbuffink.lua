ys = ys or {}
ys.Battle.BattleFleetBuffInk = class("BattleFleetBuffInk", ys.Battle.BattleFleetBuffEffect)
ys.Battle.BattleFleetBuffInk.__name = "BattleFleetBuffInk"

function ys.Battle.BattleFleetBuffInk.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleFleetBuffInk.onAttach(slot0, slot1, slot2)
	slot1:Blinding(true)
	slot1:SetWeaponBlock(1)
end

function ys.Battle.BattleFleetBuffInk.onRemove(slot0, slot1, slot2)
	slot1:Blinding(false)
	slot1:SetWeaponBlock(-1)
end

return
