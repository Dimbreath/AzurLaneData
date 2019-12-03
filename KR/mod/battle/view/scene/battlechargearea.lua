ys = ys or {}
ys.Battle.BattleChargeArea = class("BattleChargeArea")
ys.Battle.BattleChargeArea.__name = "BattleChargeArea"

ys.Battle.BattleChargeArea.Ctor = function (slot0, slot1)
	slot1.gameObject:SetActive(false)

	slot0._areaTf = slot1.transform
	slot0._areaGO = slot1
end

ys.Battle.BattleChargeArea.InitArea = function (slot0)
	slot0._controller = slot0._areaTf.GetComponent(slot1, "ChargeArea")
	slot0._areaTf.localScale.x = slot0._chargeWeapon:GetTemplateData().range / 5.5
	slot0._areaTf.localScale.y = slot0._chargeWeapon.GetTemplateData().range / 5.5
	slot0._areaTf.localScale = slot0._areaTf.localScale
	slot0._controller.maxAngle = slot0._chargeWeapon:GetTemplateData().angle
	slot0._controller.minAngle = slot0._chargeWeapon:GetMinAngle()
	slot0._areaTf.Find(slot1, "UpperEdge").transform.localScale = Vector3(1, 1 / slot0._areaTf.localScale.y, 1)
	slot0._areaTf.Find(slot1, "LowerEdge").transform.localScale = Vector3(1, 1 / slot0._areaTf.localScale.y, 1)
	slot0._controller.rate = 0.5
end

ys.Battle.BattleChargeArea.Update = function (slot0, slot1)
	slot0._areaTf.position = slot1
end

ys.Battle.BattleChargeArea.SetWeapon = function (slot0, slot1)
	slot0._chargeWeapon = slot1

	slot0:InitArea()
end

ys.Battle.BattleChargeArea.SetActive = function (slot0, slot1)
	slot0._areaGO:SetActive(slot1)
end

ys.Battle.BattleChargeArea.GetActive = function (slot0)
	return slot0._areaGO:GetActive()
end

ys.Battle.BattleChargeArea.Reset = function (slot0)
	slot0._controller.rate = 1
end

return
