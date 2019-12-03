slot0 = class("ChampionCellView", import(".SpineCellView"))

function slot0.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0.tfShadow = slot0.tf:Find("shadow")
	slot0.tfFighting = slot0.tf:Find("fighting")
	slot0.tfEffectFound = slot0.tf:Find("effect_found")
	slot0.tfDamageCount = slot0.tf:Find("damage_count")
	slot0.tfBufficons = slot0.tf:Find("random_buff_container")
end

function slot0.getOrder(slot0)
	return 2
end

function slot0.SetActive(slot0, slot1)
	slot0.showFlag = slot1

	slot0:SetActiveModel(slot1)
	setActive(slot0.tfShadow, slot1)
end

function slot0.SetActiveModel(slot0, slot1)
	slot0:SetSpineVisible(slot1 and slot0.showFlag)
end

function slot0.PlayShuiHua(slot0)
	return
end

return slot0
