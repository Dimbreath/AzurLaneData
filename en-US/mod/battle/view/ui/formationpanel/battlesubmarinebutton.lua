ys = ys or {}
slot1 = class("BattleSubmarineButton", ys.Battle.BattleWeaponButton)
ys.Battle.BattleSubmarineButton = slot1
slot1.__name = "BattleSubmarineButton"

function slot1.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot1.OnCountChange(slot0)
	slot2 = slot0._progressInfo:GetTotal()
	slot0._countTxt.text = string.format("%d", slot0._progressInfo:GetCount())
end

function slot1.ConfigSkin(slot0, slot1)
	slot0.super.ConfigSkin(slot0, slot1)
	slot0._progress.gameObject:SetActive(false)
	slot0._filledEffect.gameObject:SetActive(false)
end

function slot1.Update(slot0)
	return
end

function slot1.updateProgressBar(slot0)
	return
end

function slot1.OnfilledEffect(slot0)
	return
end

return
