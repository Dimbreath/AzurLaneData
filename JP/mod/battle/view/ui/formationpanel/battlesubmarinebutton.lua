ys = ys or {}
slot1 = class("BattleSubmarineButton", ys.Battle.BattleWeaponButton)
ys.Battle.BattleSubmarineButton = slot1
slot1.__name = "BattleSubmarineButton"

slot1.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

slot1.OnCountChange = function (slot0)
	slot2 = slot0._progressInfo:GetTotal()
	slot0._countTxt.text = string.format("%d", slot0._progressInfo:GetCount())
end

slot1.ConfigSkin = function (slot0, slot1)
	slot0.super.ConfigSkin(slot0, slot1)
	slot0._progress.gameObject:SetActive(false)
	slot0._filledEffect.gameObject:SetActive(false)
end

slot1.Update = function (slot0)
	return
end

slot1.updateProgressBar = function (slot0)
	return
end

slot1.OnfilledEffect = function (slot0)
	return
end

return
