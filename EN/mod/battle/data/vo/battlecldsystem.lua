ys = ys or {}
slot1 = ys.Battle.BattleFormulas
slot3 = Vector3.zero
slot4 = ys.Battle.BattleConst.OXY_STATE
slot5 = ys.Battle.BattleConst.BulletType
slot6 = class("BattleCldSystem")
ys.Battle.BattleCldSystem = slot6
slot6.__name = "BattleCldSystem"

slot6.Ctor = function (slot0, slot1)
	slot0._proxy = slot1

	slot0:InitCldTree()

	slot0._friendlyCode = slot1:GetFriendlyCode()
	slot0._foeCode = slot1:GetFoeCode()
end

slot6.Dispose = function (slot0)
	slot0._proxy = nil
	slot0._shipTree = nil
	slot0._foeShipTree = nil
	slot0._aircraftTree = nil
	slot0._surfaceBulletTree = nil
	slot0._airBulletTree = nil
	slot0._bulletTreeList = nil
	slot0._foeSurafceBulletTree = nil
	slot0._foeAirbulletTree = nil
	slot0._foeBulleetTreeList = nil
	slot0._surfaceAOETree = nil
	slot0._airAOETree = nil
	slot0._AOETreeList = nil
	slot0._wallTree = nil
end

slot6.InitCldTree = function (slot0)
	slot9, slot8, slot6, slot7 = slot0._proxy:GetTotalBounds()
	slot5 = Vector3(slot3, 0, slot2)
	slot6 = Vector3(slot4, 0, slot1)
	slot0._shipTree = pg.ColliderTree.New("shipTree", slot5, slot6, 2)
	slot0._foeShipTree = pg.ColliderTree.New("foeShipTree", slot5, slot6, 2)
	slot0._aircraftTree = pg.ColliderTree.New("aircraftTree", slot5, slot6, 2)
	slot0._surfaceBulletTree = pg.ColliderTree.New("surfaceBullets", slot5, slot6, 4)
	slot0._airBulletTree = pg.ColliderTree.New("airBullets", slot5, slot6, 3)
	slot0._bulletTreeList = {
		[slot0.BulletField.SURFACE] = slot0._surfaceBulletTree,
		[slot0.BulletField.AIR] = slot0._airBulletTree
	}
	slot0._foeSurafceBulletTree = pg.ColliderTree.New("foeSurfaceBullets", slot5, slot6, 3)
	slot0._foeAirbulletTree = pg.ColliderTree.New("foeAirBullets", slot5, slot6, 3)
	slot0._foeBulleetTreeList = {
		[slot0.BulletField.SURFACE] = slot0._foeSurafceBulletTree,
		[slot0.BulletField.AIR] = slot0._foeAirbulletTree
	}
	slot0._surfaceAOETree = pg.ColliderTree.New("surfaceAOE", slot5, slot6, 2)
	slot0._airAOETree = pg.ColliderTree.New("airAOE", slot5, slot6, 2)
	slot0._AOETreeList = {
		[slot0.AOEField.SURFACE] = slot0._surfaceAOETree,
		[slot0.AOEField.AIR] = slot0._airAOETree
	}
	slot0._wallTree = pg.ColliderTree.New("wall", slot5, slot6, 2)
end

slot6.UpdateShipCldTree = function (slot0, slot1)
	slot2 = slot1:GetSpeed()
	slot3 = slot1:GetCldBox()
	slot4 = nil
	slot5 = true

	if slot1:GetCldData().Surface == slot0.OXY_STATE.DIVE then
		slot5 = false
	end

	if slot1:GetIFF() == slot0._foeCode then
		if slot1:GetCldData().FriendlyCld and slot5 then
			slot1:GetCldData().distList = {}

			if #slot0._foeShipTree:GetCldList(slot3, slot2) > 1 then
				slot0:HandleEnemyShipCld(slot6, slot1)
			end
		end

		if slot5 then
			slot0._proxy:HandleShipCrashDecelerate(slot1, slot7)
			slot0:HandlePlayerShipCld(slot0._shipTree:GetCldList(slot3, slot2), slot1)
		end

		slot4 = slot0._foeShipTree
	elseif slot1:GetIFF() == slot0._friendlyCode then
		if slot5 then
			slot0._proxy:HandleShipCrashDecelerate(slot1, slot0.surfaceFilterCount(slot1, slot6))
		end

		slot4 = slot0._shipTree
	end

	slot4:Update(slot3)
end

slot6.HandlePlayerShipCld = function (slot0, slot1, slot2)
	if slot2:GetCldData().Active == false then
		return
	end

	slot5 = {}

	for slot9 = 1, #slot1, 1 do
		if slot1[slot9].data.Active == false then
		elseif slot10.UID == slot2:GetUniqueID() then
		elseif slot3.IFF == slot10.IFF then
		elseif slot3.Surface ~= slot10.Surface then
		else
			slot5[#slot5 + 1] = slot10.UID
		end
	end

	slot0._proxy:HandleShipCrashDamageList(slot2, slot5)
end

slot6.HandleEnemyShipCld = function (slot0, slot1, slot2)
	if slot2:GetCldData().Active == false then
		return
	end

	slot4 = slot2:GetPosition()
	slot5 = {}

	for slot10 = 1, #slot1, 1 do
		if slot1[slot10].data.Active == false then
		elseif slot11.UID == slot2:GetUniqueID() then
		elseif slot3.IFF ~= slot11.IFF then
		elseif not slot11.FriendlyCld then
		elseif slot3.Surface ~= slot11.Surface then
		else
			slot5[#slot5 + 1] = slot4 - slot0:GetShip(slot11.UID).GetPosition(slot12)
		end
	end

	slot3.distList = slot5
end

slot6.surfaceFilterCount = function (slot0, slot1)
	slot2 = slot0:GetCldData()
	slot3 = 0

	for slot8 = 1, #slot1, 1 do
		if slot1[slot8].data.Active == true and slot9.UID ~= slot0:GetUniqueID() and slot2.IFF ~= slot9.IFF and slot2.Surface == slot9.Surface then
			slot3 = slot3 + 1
		end
	end

	return slot3
end

slot6.UpdateAircraftCld = function (slot0, slot1)
	slot2 = slot1:GetSpeed()
	slot3 = slot1:GetCldBox()
	slot4 = nil

	if slot1:GetIFF() == slot0._foeCode then
		slot4 = slot0:GetBulletTree(slot0.BulletField.AIR)
	elseif slot1:GetIFF() == slot0._friendlyCode then
		slot4 = slot0:GetFoeBulletTree(slot0.BulletField.AIR)
	end

	slot0:HandleBulletCldWithAircraft(slot5, slot1)
	slot0._aircraftTree:Update(slot1:GetCldBox())
end

slot6.HandleBulletCldWithAircraft = function (slot0, slot1, slot2)
	for slot7 = 1, #slot1, 1 do
		if slot1[slot7].data.type == slot0.CldType.BULLET and slot8.Active == true then
			slot0._proxy:HandleBulletHit(slot0:GetBullet(slot8.UID), slot2)
		end
	end
end

slot6.UpdateBulletCld = function (slot0, slot1)
	slot2 = slot1:GetEffectField()
	slot3 = slot1:GetCldBox()
	slot5, slot6 = nil

	if slot1:GetCldData().IFF == slot0._friendlyCode then
		slot5 = slot0:GetBulletTree(slot2)
	elseif slot4 == slot0._foeCode then
		slot5 = slot0:GetFoeBulletTree(slot2)
	end

	if slot2 == slot0.BulletField.SURFACE then
		if slot4 == slot0._friendlyCode then
			slot6 = slot0:GetFoeShipTree()
		elseif slot4 == slot0._foeCode then
			slot6 = slot0:GetShipTree()
		end

		slot0:HandleBulletCldWithShip(slot6:GetCldList(slot3, slot1), slot1)
	end

	slot5:Update(slot3)
end

slot6.HandleBulletCldWithShip = function (slot0, slot1, slot2)
	slot4 = slot2:GetType()

	for slot8 = 1, #slot1, 1 do
		if slot1[slot8].data.type == slot0.CldType.SHIP and slot9.Active == true then
			if slot0:GetShip(slot9.UID):GetOxyState() and slot11:GetCurrentDiveState() == slot1.DIVE and slot2:GetCldData().Surface ~= slot0.OXY_STATE.DIVE then
			elseif slot0._proxy:HandleBulletHit(slot2, slot10) then
				break
			end
		end
	end
end

slot6.UpdateAOECld = function (slot0, slot1)
	slot2 = slot1:GetCldBox()
	slot4 = slot1:GetAngle() * math.deg2Rad
	slot5 = nil

	if slot1:GetFieldType() == slot0.BulletField.SURFACE then
		slot8 = nil
		slot8 = (not slot1:OpponentAffected() or ((slot1:GetCldData().IFF ~= slot0._foeCode or slot0._shipTree) and slot0._foeShipTree)) and (slot1.GetCldData().IFF ~= slot0._foeCode or slot0._foeShipTree) and slot0._shipTree

		if math.abs(math.cos(slot4)) ~= 1 then
			if slot1:GetIFF() == -1 then
				slot4 = slot4 + math.pi
			end

			slot5 = slot8:GetCldListGradient(slot4, slot1:GetHeight(), slot1:GetWidth(), slot1:GetPosition())
		else
			slot5 = slot8:GetCldList(slot2, slot1)
		end
	else
		slot5 = slot0._aircraftTree:GetCldList(slot2, slot1)
	end

	slot1:ClearCLDList()
	slot0:HandleAreaCldWithVehicle(slot1, slot5)
end

slot6.HandleAreaCldWithVehicle = function (slot0, slot1, slot2)
	slot3 = slot1:GetCldData()
	slot4 = slot1:OpponentAffected()

	for slot9 = 1, #slot2, 1 do
		slot10 = slot2[slot9].data

		if (slot4 and slot10.IFF ~= slot3.IFF) or (not slot4 and slot10.IFF == slot3.IFF) then
			slot1:AppendCldObj(slot10)
		end
	end
end

slot6.UpdateWallCld = function (slot0, slot1)
	slot3 = nil

	slot0:HandleWallCldWithBullet(slot1, (slot1:GetIFF() ~= slot0._friendlyCode or slot0._foeSurafceBulletTree:GetCldList(slot1:GetCldBox(), slot0)) and slot0._surfaceBulletTree:GetCldList(slot1.GetCldBox(), slot0))
end

slot6.HandleWallCldWithBullet = function (slot0, slot1, slot2)
	for slot7 = 1, #slot2, 1 do
		if slot2[slot7].data.type == slot0.CldType.BULLET and slot8.Active == true and not slot0._proxy:HandleWallHitByBullet(slot1, slot0:GetBullet(slot8.UID)) then
			return
		end
	end
end

slot6.InsertToBulletCldTree = function (slot0, slot1, slot2)
	slot3 = nil

	if slot2:GetCldData().IFF == slot0._foeCode then
		slot3 = slot0:GetFoeBulletTree(slot1)
	elseif slot4.IFF == slot0._friendlyCode then
		slot3 = slot0:GetBulletTree(slot1)
	end

	slot3:Insert(slot2:GetCldBox())
end

slot6.InsertToAOECldTree = function (slot0, slot1, slot2)
	slot0:GetAOETree(slot1):Insert(slot2:GetCldBox())
end

slot6.InsertToWallCldTree = function (slot0, slot1)
	slot0:GetWallTree():Insert(slot1:GetCldBox())
end

slot6.InsertToShipCldTree = function (slot0, slot1)
	slot3 = nil

	if slot1:GetCldData().IFF == slot0._foeCode then
		slot3 = slot0:GetFoeShipTree()
	elseif slot2.IFF == slot0._friendlyCode then
		slot3 = slot0:GetShipTree()
	end

	slot3:Insert(slot1:GetCldBox())
end

slot6.InsertToAircraftCldTree = function (slot0, slot1)
	slot0._aircraftTree:Insert(slot1:GetCldBox())
end

slot6.GetBulletTree = function (slot0, slot1)
	return slot0._bulletTreeList[slot1]
end

slot6.GetFoeBulletTree = function (slot0, slot1)
	return slot0._foeBulleetTreeList[slot1]
end

slot6.GetAOETree = function (slot0, slot1)
	return slot0._AOETreeList[slot1]
end

slot6.GetWallTree = function (slot0, slot1)
	return slot0._wallTree
end

slot6.GetShipTree = function (slot0)
	return slot0._shipTree
end

slot6.GetFoeShipTree = function (slot0)
	return slot0._foeShipTree
end

slot6.GetAircraftTree = function (slot0)
	return slot0._aircraftTree
end

slot6.DeleteShipLeaf = function (slot0, slot1)
	if slot1:GetCldData().IFF == slot0._foeCode then
		slot0.DeleteCldLeaf(slot0:GetFoeShipTree(), slot1)
	elseif slot2 == slot0._friendlyCode then
		slot0.DeleteCldLeaf(slot0:GetShipTree(), slot1)
	end
end

slot6.DeleteBulletLeaf = function (slot0, slot1)
	if slot1:GetCldData().IFF == slot0._foeCode then
		slot0.DeleteCldLeaf(slot0:GetFoeBulletTree(slot1:GetEffectField()), slot1)
	elseif slot2 == slot0._friendlyCode then
		slot0.DeleteCldLeaf(slot0:GetBulletTree(slot1:GetEffectField()), slot1)
	end
end

slot6.DeleteCldLeaf = function (slot0, slot1)
	slot0:Remove(slot1:GetCldBox())
end

slot6.GetShip = function (slot0, slot1)
	return slot0._proxy:GetUnitList()[slot1]
end

slot6.GetAircraft = function (slot0, slot1)
	return slot0._proxy:GetAircraftList()[slot1]
end

slot6.GetBullet = function (slot0, slot1)
	return slot0._proxy:GetBulletList()[slot1]
end

slot6.GetAOE = function (slot0, slot1)
	return slot0._proxy:GetAOEList()[slot1]
end

slot6.InitShipCld = function (slot0, slot1)
	slot0:InsertToShipCldTree(slot1)
end

slot6.DeleteShipCld = function (slot0, slot1)
	slot1:DeactiveCldBox()
	slot0:DeleteShipLeaf(slot1)
end

slot6.InitAircraftCld = function (slot0, slot1)
	slot0:InsertToAircraftCldTree(slot1)
end

slot6.DeleteAircraftCld = function (slot0, slot1)
	slot1:DeactiveCldBox()
	slot0.DeleteCldLeaf(slot0:GetAircraftTree(), slot1)
end

slot6.InitBulletCld = function (slot0, slot1)
	slot0:InsertToBulletCldTree(slot1:GetEffectField(), slot1)
end

slot6.DeleteBulletCld = function (slot0, slot1)
	slot1:DeactiveCldBox()
	slot0:DeleteBulletLeaf(slot1)
end

slot6.ShiftBulletCld = function (slot0, slot1)
	return
end

slot6.InitAOECld = function (slot0, slot1)
	slot0:InsertToAOECldTree(slot1:GetFieldType(), slot1)
end

slot6.DeleteAOECld = function (slot0, slot1)
	slot1:DeactiveCldBox()
	slot0.DeleteCldLeaf(slot0:GetAOETree(slot1:GetFieldType()), slot1)
end

slot6.InitWallCld = function (slot0, slot1)
	slot0:InsertToWallCldTree(slot1)
end

slot6.DeleteWallCld = function (slot0, slot1)
	slot1:DeactiveCldBox()

	if slot0:GetWallTree() then
		slot0.DeleteCldLeaf(slot2, slot1)
	end
end

return
