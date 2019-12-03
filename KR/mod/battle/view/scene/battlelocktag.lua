ys = ys or {}
ys.Battle.BattleLockTag = class("BattleLockTag")
ys.Battle.BattleLockTag.__name = "BattleLockTag"

ys.Battle.BattleLockTag.Ctor = function (slot0, slot1, slot2)
	slot0._markGO = slot1
	slot0._markTF = slot1.transform
	slot0._controller = slot0._markTF:GetComponent("LockTag")
	slot0._flag = true
end

ys.Battle.BattleLockTag.Mark = function (slot0, slot1)
	slot0._markTime = pg.TimeMgr.GetInstance():GetCombatTime()
	slot0._requiredTime = slot1

	SetActive(slot0._markGO, true)

	slot0._controller.enabled = true
end

ys.Battle.BattleLockTag.Update = function (slot0, slot1)
	if (slot1 - slot0._markTime) / slot0._requiredTime >= 1 and slot0._flag then
		slot0._controller:SetRate(1)

		slot0._controller.enabled = false
		slot0._markTF:GetComponent(typeof(Animator)).enabled = true
		slot0._flag = false
	elseif slot0._flag then
		slot0._controller:SetRate(slot3)
	end
end

ys.Battle.BattleLockTag.SetPosition = function (slot0, slot1)
	slot0._markTF.position = slot1
end

ys.Battle.BattleLockTag.SetTagCount = function (slot0, slot1)
	slot0._controller.count = slot1
end

ys.Battle.BattleLockTag.Dispose = function (slot0)
	Object.Destroy(slot0._markGO)
end

return
