slot0 = class("SubCellView", import(".SpineCellView"))

slot0.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0.tfShadow = slot0.tf:Find("shadow")
	slot0.tfAmmo = slot0.tf:Find("ammo")
	slot0.tfAmmoText = slot0.tfAmmo:Find("text")
	slot0.showFlag = true

	slot0:LoadEffectShuihua()
end

slot0.getOrder = function (slot0)
	return 3
end

slot0.LoadEffectShuihua = function (slot0)
	if slot0.effect_shuihua then
		return
	end

	ResourceMgr.Inst:getAssetAsync("Effect/" .. slot1, "qianting_01", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
		if not slot0.validate then
			return
		end

		slot1 = Object.Instantiate(slot0)
		slot0.effect_shuihua = slot1

		tf(slot1):SetParent(slot0.tf)

		tf(slot1).localPosition = Vector3.zero

		setActive(slot1, false)
	end), true, true)
end

slot0.PlayShuiHua = function (slot0)
	if not slot0.effect_shuihua then
		return
	end

	setActive(slot0.effect_shuihua, false)
	setActive(slot0.effect_shuihua, true)
end

slot0.SetActive = function (slot0, slot1)
	slot0.showFlag = slot1

	slot0:SetActiveModel(slot1)
end

slot0.SetActiveModel = function (slot0, slot1)
	setActive(slot0.tfShadow, slot1 and slot0.showFlag)
	slot0:SetSpineVisible(slot1 and slot0.showFlag)
end

slot0.clear = function (slot0)
	if slot0.effect_shuihua then
		Destroy(slot0.effect_shuihua)

		slot0.effect_shuihua = nil
	end

	slot0.showFlag = nil

	slot0.super.clear(slot0)
end

return slot0
