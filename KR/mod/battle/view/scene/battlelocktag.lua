ys = ys or {}
ys.Battle.BattleLockTag = class("BattleLockTag")
ys.Battle.BattleLockTag.__name = "BattleLockTag"

function ys.Battle.BattleLockTag.Ctor(slot0, slot1, slot2)
	slot0._markGO = slot1
	slot0._markTF = slot1.transform
	slot0._controller = slot0._markTF:GetComponent("LockTag")
	slot0._flag = true
end

function ys.Battle.BattleLockTag.Mark(slot0, slot1)
	slot0._markTime = pg.TimeMgr.GetInstance():GetCombatTime()
	slot0._requiredTime = slot1

	SetActive(slot0._markGO, true)

	slot0._controller.enabled = true
end

function ys.Battle.BattleLockTag.Update(slot0, slot1)
	if (slot1 - slot0._markTime) / slot0._requiredTime >= 1 and slot0._flag then
		slot0._controller:SetRate(1)

		slot0._controller.enabled = false
		slot0._markTF:GetComponent(typeof(Animator)).enabled = true
		slot0._flag = false
	elseif slot0._flag then
		slot0._controller:SetRate(slot3)
	end
end

function ys.Battle.BattleLockTag.SetPosition(slot0, slot1)
	slot0._markTF.position = slot1
end

function ys.Battle.BattleLockTag.SetTagCount(slot0, slot1)
	slot0._controller.count = slot1
end

function ys.Battle.BattleLockTag.Dispose(slot0)
	Object.Destroy(slot0._markGO)
end

return
