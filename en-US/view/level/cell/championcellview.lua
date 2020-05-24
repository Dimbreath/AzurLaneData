slot0 = class("ChampionCellView", import(".SpineCellView"))

function slot0.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)

	slot0.tfFighting = slot0.tf:Find("fighting")
	slot0.tfEffectFound = slot0.tf:Find("effect_found")
	slot0.tfDamageCount = slot0.tf:Find("damage_count")
	slot0.tfBufficons = slot0.tf:Find("random_buff_container")
end

function slot0.GetOrder(slot0)
	return ChapterConst.CellPriorityEnemy
end

function slot0.SetActive(slot0, slot1)
	slot0.go:SetActive(slot1)
end

return slot0
