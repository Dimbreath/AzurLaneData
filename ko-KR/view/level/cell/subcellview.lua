slot0 = class("SubCellView", import(".SpineCellView"))

function slot0.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)

	slot0.tfShadow = slot0.tf:Find("shadow")
	slot0.tfAmmo = slot0.tf:Find("ammo")
	slot0.tfAmmoText = slot0.tfAmmo:Find("text")
	slot0.showFlag = true

	slot0:LoadEffectShuihua()
end

function slot0.GetOrder(slot0)
	return ChapterConst.CellPriorityFleet
end

function slot0.LoadEffectShuihua(slot0)
	if slot0.effect_shuihua then
		return
	end

	slot1 = "qianting_01"

	slot0:GetLoader():GetPrefab("Effect/" .. slot1, slot1, function (slot0)
		uv0.effect_shuihua = go

		tf(go):SetParent(uv0.tf)

		tf(go).localPosition = Vector3.zero

		setActive(go, false)
	end, "Shuihua")
end

function slot0.PlayShuiHua(slot0)
	if not slot0.effect_shuihua then
		return
	end

	setActive(slot0.effect_shuihua, false)
	setActive(slot0.effect_shuihua, true)
end

function slot0.SetActive(slot0, slot1)
	slot0.showFlag = slot1

	slot0:SetActiveModel(slot1)
end

function slot0.SetActiveModel(slot0, slot1)
	slot1 = slot1 and slot0.showFlag

	setActive(slot0.tfShadow, slot1)
	slot0:SetSpineVisible(slot1)
end

function slot0.clear(slot0)
	slot0.showFlag = nil

	uv0.super.clear(slot0)
end

return slot0
