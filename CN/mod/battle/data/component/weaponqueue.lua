ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.WeaponQueue = class("WeaponQueue")
ys.Battle.WeaponQueue.__name = "WeaponQueue"

ys.Battle.WeaponQueue.Ctor = function (slot0)
	slot0._totalWeapon = {}
	slot0._queueList = {}
	slot0._GCDTimerList = {}
end

ys.Battle.WeaponQueue.ConfigParallel = function (slot0, slot1, slot2)
	slot0._torpedoQueue = slot0.Battle.ManualWeaponQueue.New(slot2)
	slot0._chargeQueue = slot0.Battle.ManualWeaponQueue.New(slot1)
end

ys.Battle.WeaponQueue.ClearAllWeapon = function (slot0)
	for slot4, slot5 in ipairs(slot0._totalWeapon) do
		slot5:Clear()
	end
end

ys.Battle.WeaponQueue.Dispose = function (slot0)
	slot0._torpedoQueue:Clear()
	slot0._chargeQueue:Clear()

	for slot4, slot5 in ipairs(slot0._totalWeapon) do
		slot5:Dispose()
	end

	slot0._torpedoQueue = nil
	slot0._chargeQueue = nil
end

ys.Battle.WeaponQueue.AppendWeapon = function (slot0, slot1)
	slot0:GetQueueByIndex(slot2)[#slot0.GetQueueByIndex(slot2) + 1] = slot1
	slot0._totalWeapon[#slot0._totalWeapon + 1] = slot1
end

ys.Battle.WeaponQueue.RemoveWeapon = function (slot0, slot1)
	slot4 = 1
	slot5 = #slot0:GetQueueByIndex(slot2)

	while slot4 <= slot5 do
		if slot3[slot4] == slot1 then
			table.remove(slot3, slot4)

			break
		end

		slot4 = slot4 + 1
	end

	slot4 = 1
	slot5 = #slot0._totalWeapon

	while slot4 <= slot5 do
		if slot0._totalWeapon[slot4] == slot1 then
			table.remove(slot0._totalWeapon, slot4)

			break
		end

		slot4 = slot4 + 1
	end
end

ys.Battle.WeaponQueue.AppendManualTorpedo = function (slot0, slot1)
	slot0:AppendWeapon(slot1)
	slot0._torpedoQueue:AppendWeapon(slot1)
end

ys.Battle.WeaponQueue.AppendChargeWeapon = function (slot0, slot1)
	slot0:AppendWeapon(slot1)
	slot0._chargeQueue:AppendWeapon(slot1)
end

ys.Battle.WeaponQueue.QueueEnterGCD = function (slot0, slot1, slot2)
	slot0:addGCDTimer(slot2, slot1)
end

ys.Battle.WeaponQueue.GetTotalWeaponUnit = function (slot0)
	return slot0._totalWeapon
end

ys.Battle.WeaponQueue.GetQueueByIndex = function (slot0, slot1)
	if slot0._queueList[slot1] == nil then
		slot0._queueList[slot1] = {}
	end

	return slot0._queueList[slot1]
end

ys.Battle.WeaponQueue.GetManualTorpedoQueue = function (slot0)
	return slot0._torpedoQueue
end

ys.Battle.WeaponQueue.GetChargeWeaponQueue = function (slot0)
	return slot0._chargeQueue
end

ys.Battle.WeaponQueue.Update = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0._queueList) do
		if slot0:isNotAttacking(slot5) then
			slot0:updateWeapon(slot5, slot1)
		end
	end
end

ys.Battle.WeaponQueue.CheckWeaponInitalCD = function (slot0)
	for slot4, slot5 in ipairs(slot0._totalWeapon) do
		if not slot0._torpedoQueue:Containers(slot5) and not slot0._chargeQueue:Containers(slot5) then
			slot5:InitialCD()
		end
	end

	slot0._torpedoQueue:CheckWeaponInitalCD()
	slot0._chargeQueue:CheckWeaponInitalCD()
end

ys.Battle.WeaponQueue.FlushWeaponReloadRequire = function (slot0)
	for slot4, slot5 in ipairs(slot0._totalWeapon) do
		if not slot0._torpedoQueue:Containers(slot5) and not slot0._chargeQueue:Containers(slot5) then
			slot5:FlushReloadRequire()
		end
	end

	slot0._torpedoQueue:FlushWeaponReloadRequire()
	slot0._chargeQueue:FlushWeaponReloadRequire()
end

ys.Battle.WeaponQueue.isNotAttacking = function (slot0, slot1)
	if slot0._GCDTimerList[slot1] ~= nil then
		return false
	end

	for slot5, slot6 in ipairs(slot0._queueList[slot1]) do
		if slot6:IsAttacking() then
			return false
		end
	end

	return true
end

ys.Battle.WeaponQueue.updateWeapon = function (slot0, slot1, slot2)
	for slot7, slot8 in ipairs(slot3) do
		if slot8:GetType() == slot0.EquipmentType.BEAM and slot8:GetCurrentState() == slot8.STATE_ATTACK then
			slot8:Update()

			return
		end
	end

	for slot7, slot8 in ipairs(slot3) do
		slot9 = slot8:GetCurrentState()

		slot8:Update(slot2)

		slot10 = slot8:GetCurrentState()

		if slot1 ~= slot0.NON_QUEUE_WEAPON and ((slot10 ~= slot9 and (slot9 == slot8.STATE_PRECAST or slot9 == slot8.STATE_READY)) or slot8:IsAttacking()) then
			break
		end
	end
end

ys.Battle.WeaponQueue.addGCDTimer = function (slot0, slot1, slot2)
	if slot0._GCDTimerList[slot2] ~= nil then
		return
	end

	slot0._GCDTimerList[slot2] = pg.TimeMgr.GetInstance():AddBattleTimer("weaponGCD", -1, slot1, function ()
		slot0:removeGCDTimer(slot0)
	end, true)
end

ys.Battle.WeaponQueue.removeGCDTimer = function (slot0, slot1)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._GCDTimerList[slot1])

	slot0._GCDTimerList[slot1] = nil
end

return
