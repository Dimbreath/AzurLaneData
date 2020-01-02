ys = ys or {}
slot0 = ys.Battle.BattleConfig
ys.Battle.BattleTargetChoise = {
	TargetNil = function (slot0)
		return nil
	end,
	TargetNull = function (slot0)
		return {}
	end,
	TargetAll = function (slot0)
		return ys.Battle.BattleDataProxy.GetInstance():GetUnitList()
	end,
	TargetTemplate = function (slot0, slot1, slot2)
		slot3 = slot1.targetTemplateIDList or {
			slot1.targetTemplateID
		}
		slot4 = slot2 or ys.Battle.BattleDataProxy.GetInstance():GetUnitList()
		slot5 = {}
		slot6 = slot0:GetIFF()

		for slot10, slot11 in pairs(slot4) do
			slot13 = slot11:GetIFF()

			if table.contains(slot3, slot11:GetTemplateID()) and slot6 == slot13 then
				slot5[#slot5 + 1] = slot11
			end
		end

		return slot5
	end,
	TargetNationality = function (slot0, slot1, slot2)
		slot3 = slot1.targetTemplateIDList or {
			slot1.targetTemplateID
		}
		slot4 = slot2 or ys.Battle.BattleDataProxy.GetInstance():GetUnitList()
		slot5 = {}
		slot7 = type(slot6)

		for slot11, slot12 in pairs(slot4) do
			if slot7 == "number" then
				if slot12:GetTemplate().nationality == slot6 then
					slot5[#slot5 + 1] = slot12
				end
			elseif slot7 == "table" and table.contains(slot6, slot12:GetTemplate().nationality) then
				slot5[#slot5 + 1] = slot12
			end
		end

		return slot5
	end,
	TargetShipType = function (slot0, slot1, slot2)
		slot3 = slot2 or ys.Battle.BattleDataProxy.GetInstance():GetUnitList()
		slot4 = {}
		slot5 = slot1.ship_type_list

		for slot9, slot10 in pairs(slot3) do
			if table.contains(slot5, slot10:GetTemplate().type) then
				slot4[#slot4 + 1] = slot10
			end
		end

		return slot4
	end,
	TargetShipTag = function (slot0, slot1, slot2)
		slot3 = slot2 or ys.Battle.BattleDataProxy.GetInstance():GetUnitList()
		slot4 = {}
		slot5 = slot1.ship_tag_list

		for slot9, slot10 in pairs(slot3) do
			if slot10:ContainsLabelTag(slot5) then
				slot4[#slot4 + 1] = slot10
			end
		end

		return slot4
	end,
	TargetShipArmor = function (slot0, slot1, slot2)
		slot3 = slot2 or ys.Battle.BattleDataProxy.GetInstance():GetUnitList()
		slot4 = {}
		slot5 = slot1.armor_type

		for slot9, slot10 in ipairs(slot3) do
			if slot10:GetAttrByName("armorType") == slot5 then
				slot4[#slot4 + 1] = slot10
			end
		end

		return slot4
	end,
	getShipListByIFF = function (slot0)
		slot1 = ys.Battle.BattleDataProxy.GetInstance()
		slot2 = nil

		if slot0 == slot0.FRIENDLY_CODE then
			slot2 = slot1:GetFriendlyShipList()
		elseif slot0 == slot0.FOE_CODE then
			slot2 = slot1:GetFoeShipList()
		end

		return slot2
	end,
	TargetAllHelp = function (slot0, slot1, slot2)
		slot3 = {}

		if slot0 then
			slot4 = slot1 or {}.exceptCaster
			slot5 = slot0:GetUniqueID()
			slot6 = slot2 or slot0.getShipListByIFF(slot0:GetIFF())

			for slot10, slot11 in pairs(slot6) do
				slot12 = slot11:GetUniqueID()

				if slot11:IsAlive() and (not slot4 or slot12 ~= slot5) then
					slot3[#slot3 + 1] = slot11
				end
			end
		end

		return slot3
	end,
	TargetHelpLeastHP = function (slot0, slot1, slot2)
		slot3 = nil
		slot4 = slot1 or {}.targetMaxHPRatio

		if slot0 then
			slot5 = slot2 or slot0.getShipListByIFF(slot0:GetIFF())
			slot6 = 9999999999.0

			for slot10, slot11 in pairs(slot5) do
				if slot11:IsAlive() and slot11:GetCurrentHP() < slot6 and (not slot4 or slot11:GetHPRate() <= slot4) then
					slot3 = slot11
					slot6 = slot11:GetCurrentHP()
				end
			end
		end

		return {
			slot3
		}
	end,
	TargetHelpLeastHPRatio = function (slot0, slot1, slot2)
		slot1 = slot1 or {}
		slot3 = nil

		if slot0 then
			slot4 = 100
			slot5 = slot2 or slot0.getShipListByIFF(slot0:GetIFF())

			for slot9, slot10 in pairs(slot5) do
				if slot10:IsAlive() and slot10:GetHPRate() < slot4 then
					slot3 = slot10
					slot4 = slot10:GetHPRate()
				end
			end
		end

		return {
			slot3
		}
	end,
	TargetHighestHP = function (slot0, slot1, slot2)
		slot1 = slot1 or {}
		slot3 = nil

		if slot0 then
			slot4 = slot2 or ys.Battle.BattleDataProxy.GetInstance():GetUnitList()
			slot5 = 1

			for slot9, slot10 in pairs(slot4) do
				if slot10:IsAlive() and slot5 < slot10:GetCurrentHP() then
					slot3 = slot10
					slot5 = slot10:GetCurrentHP()
				end
			end
		end

		return {
			slot3
		}
	end,
	TargetHighestHPRatio = function (slot0, slot1, slot2)
		slot1 = slot1 or {}
		slot3 = nil

		if slot0 then
			slot4 = slot2 or ys.Battle.BattleDataProxy.GetInstance():GetUnitList()
			slot5 = 0

			for slot9, slot10 in pairs(slot4) do
				if slot10:IsAlive() and slot5 < slot10:GetHPRate() then
					slot3 = slot10
					slot5 = slot10:GetHPRate()
				end
			end
		end

		return {
			slot3
		}
	end,
	TargetHPCompare = function (slot0, slot1, slot2)
		slot3 = {}
		slot4 = slot2 or ys.Battle.BattleDataProxy.GetInstance():GetUnitList()

		if slot0 then
			slot5 = slot0:GetHP()

			for slot9, slot10 in ipairs(slot4) do
				if slot10:GetHP() < slot5 then
					slot3[#slot3 + 1] = slot10
				end
			end
		end

		return slot3
	end,
	TargetHPRatioLowerThan = function (slot0, slot1, slot2)
		slot3 = {}
		slot4 = slot1.hpRatioList[1]
		slot5 = slot2 or ys.Battle.BattleDataProxy.GetInstance():GetUnitList()

		for slot9, slot10 in ipairs(slot5) do
			if slot10:GetHP() < slot4 then
				slot3[#slot3 + 1] = slot10
			end
		end

		return slot3
	end,
	TargetNationalityFriendly = function (slot0, slot1, slot2)
		slot3 = {}

		if slot0 then
			slot4 = slot1.nationality
			slot5 = slot2 or slot0:TargetAllHelp(slot1)

			for slot9, slot10 in pairs(slot5) do
				if slot10:GetTemplate().nationality == slot4 then
					slot3[#slot3 + 1] = slot10
				end
			end
		end

		return slot3
	end,
	TargetNationalityFoe = function (slot0, slot1, slot2)
		slot3 = {}

		if slot0 then
			slot4 = slot1.nationality
			slot5 = slot2 or slot0:TargetAllHarm(slot1)

			for slot9, slot10 in pairs(slot5) do
				if slot10:GetTemplate().nationality == slot4 then
					slot3[#slot3 + 1] = slot10
				end
			end
		end

		return slot3
	end,
	TargetShipTypeFriendly = function (slot0, slot1, slot2)
		slot3 = {}

		if slot0 then
			slot4 = slot1.ship_type_list
			slot5 = slot2 or slot0:TargetAllHelp(slot1)

			for slot9, slot10 in pairs(slot5) do
				if table.contains(slot4, slot10:GetTemplate().type) then
					slot3[#slot3 + 1] = slot10
				end
			end
		end

		return slot3
	end,
	TargetSelf = function (slot0)
		return {
			slot0
		}
	end,
	TargetAllHarm = function (slot0, slot1, slot2)
		slot3 = {}
		slot4 = nil
		slot5 = ys.Battle.BattleDataProxy.GetInstance()

		if slot2 then
			slot4 = slot2
		elseif slot0:GetIFF() == slot0.FRIENDLY_CODE then
			slot4 = slot5:GetFoeShipList()
		elseif slot6 == slot0.FOE_CODE then
			slot4 = slot5:GetFriendlyShipList()
		end

		slot6 = slot5:GetTotalRightBound()

		if slot4 then
			for slot10, slot11 in pairs(slot4) do
				if slot11:IsAlive() and slot11:GetPosition().x < slot6 and slot11:GetCurrentOxyState() ~= ys.Battle.BattleConst.OXY_STATE.DIVE then
					slot3[#slot3 + 1] = slot11
				end
			end
		end

		return slot3
	end,
	TargetAllFoe = function (slot0, slot1, slot2)
		slot3 = {}
		slot4 = nil
		slot5 = ys.Battle.BattleDataProxy.GetInstance()

		if slot2 then
			slot4 = slot2
		elseif slot0:GetIFF() == slot0.FRIENDLY_CODE then
			slot4 = slot5:GetFoeShipList()
		elseif slot6 == slot0.FOE_CODE then
			slot4 = slot5:GetFriendlyShipList()
		end

		slot6 = slot5:GetTotalRightBound()

		if slot4 then
			for slot10, slot11 in pairs(slot4) do
				if slot11:IsAlive() and slot11:GetPosition().x < slot6 then
					slot3[#slot3 + 1] = slot11
				end
			end
		end

		return slot3
	end,
	TargetHarmNearest = function (slot0, slot1, slot2)
		slot3 = slot1 or {}.range or 9999999999.0
		slot4 = nil
		slot5 = slot2 or slot0:TargetAllHarm()

		for slot9, slot10 in ipairs(slot5) do
			if slot0:GetDistance(slot10) < slot3 then
				slot3 = slot11
				slot4 = slot10
			end
		end

		return {
			slot4
		}
	end,
	TargetHarmFarthest = function (slot0, slot1, slot2)
		slot3 = 0
		slot4 = nil
		slot5 = slot2 or slot0:TargetAllHarm()

		for slot9, slot10 in ipairs(slot5) do
			if slot3 < slot0:GetDistance(slot10) then
				slot3 = slot11
				slot4 = slot10
			end
		end

		return {
			slot4
		}
	end,
	TargetHarmRandom = function (slot0, slot1, slot2)
		if #(slot2 or slot0:TargetAllHarm()) > 0 then
			return {
				slot4[math.random(#slot4)]
			}
		else
			return {}
		end
	end,
	TargetHarmRandomByWeight = function (slot0, slot1, slot2)
		slot3 = slot2 or slot0:TargetAllHarm()
		slot4 = {}
		slot5 = 0

		for slot9, slot10 in ipairs(slot3) do
			if (slot10:GetTemplate().battle_unit_type or 0) == slot5 then
				slot4[#slot4 + 1] = slot10
			elseif slot5 < slot11 then
				slot4 = {
					slot10
				}
				slot5 = slot11
			end
		end

		if #slot4 > 0 then
			return {
				slot4[math.random(#slot4)]
			}
		else
			return {}
		end
	end,
	TargetWeightiest = function (slot0, slot1, slot2)
		slot3 = slot2 or ys.Battle.BattleDataProxy.GetInstance():GetUnitList()
		slot4 = {}
		slot5 = 0

		for slot9, slot10 in ipairs(slot3) do
			if (slot10:GetTemplate().battle_unit_type or 0) == slot5 then
				slot4[#slot4 + 1] = slot10
			elseif slot5 < slot11 then
				slot4 = {
					slot10
				}
				slot5 = slot11
			end
		end

		return slot4
	end,
	TargetRandom = function (slot0, slot1, slot2)
		return Mathf.MultiRandom(slot2 or ys.Battle.BattleDataProxy.GetInstance():GetUnitList(), slot1.randomCount or 1)
	end,
	TargetInsideArea = function (slot0, slot1, slot2)
		slot3 = slot2 or slot0:TargetAllHarm()
		slot5 = slot1.lineX
		slot6 = {}

		if (slot1.dir or ys.Battle.BattleConst.UnitDir.RIGHT) == ys.Battle.BattleConst.UnitDir.RIGHT then
			for slot10, slot11 in ipairs(slot3) do
				if slot5 <= slot11:GetPosition().x then
					table.insert(slot6, slot11)
				end
			end
		elseif slot4 == ys.Battle.BattleConst.UnitDir.LEFT then
			for slot10, slot11 in ipairs(slot3) do
				if slot11:GetPosition().x <= slot5 then
					table.insert(slot6, slot11)
				end
			end
		end

		return slot6
	end,
	TargetAircraftHelp = function (slot0)
		slot2 = {}
		slot3 = slot0:GetIFF()

		for slot7, slot8 in pairs(ys.Battle.BattleDataProxy.GetInstance().GetAircraftList(slot1)) do
			if slot3 == slot8:GetIFF() then
				slot2[#slot2 + 1] = slot8
			end
		end

		return slot2
	end,
	TargetAircraftHarm = function (slot0)
		slot2 = {}
		slot3 = slot0:GetIFF()

		for slot7, slot8 in pairs(ys.Battle.BattleDataProxy.GetInstance().GetAircraftList(slot1)) do
			if slot3 ~= slot8:GetIFF() and slot8:IsVisitable() then
				slot2[#slot2 + 1] = slot8
			end
		end

		return slot2
	end,
	TargetDiveState = function (slot0, slot1, slot2)
		slot3 = (slot1 and slot1.diveState) or ys.Battle.BattleConst.OXY_STATE.DIVE
		slot4 = slot2 or ys.Battle.BattleDataProxy.GetInstance():GetUnitList()
		slot5 = {}

		for slot9, slot10 in pairs(slot4) do
			if slot3 == slot10:GetCurrentOxyState() then
				slot5[#slot5 + 1] = slot10
			end
		end

		return slot5
	end,
	TargetDetectedUnit = function (slot0, slot1, slot2)
		slot3 = slot2 or ys.Battle.BattleDataProxy.GetInstance():GetUnitList()
		slot4 = {}

		for slot8, slot9 in pairs(slot3) do
			if slot9:GetDiveDetected() then
				slot4[#slot4 + 1] = slot9
			end
		end

		return slot4
	end,
	TargetAllHarmBullet = function (slot0)
		slot2 = {}
		slot3 = slot0:GetIFF()

		for slot7, slot8 in pairs(ys.Battle.BattleDataProxy.GetInstance().GetBulletList(slot1)) do
			if slot3 ~= slot8:GetIFF() then
				slot2[#slot2 + 1] = slot8
			end
		end

		return slot2
	end,
	TargetAllHarmBulletByType = function (slot0, slot1)
		slot3 = {}
		slot4 = slot0:GetIFF()

		for slot8, slot9 in pairs(ys.Battle.BattleDataProxy.GetInstance().GetBulletList(slot2)) do
			if slot4 ~= slot9:GetIFF() and slot9:GetType() == slot1 then
				slot3[#slot3 + 1] = slot9
			end
		end

		return slot3
	end,
	TargetAllHarmTorpedoBullet = function (slot0)
		return slot0:TargetAllHarmBulletByType(ys.Battle.BattleConst.BulletType.TORPEDO)
	end,
	TargetFleetIndex = function (slot0, slot1)
		slot3 = TeamType.TeamPos
		slot4 = slot1.fleetPos
		slot5 = {}

		for slot10, slot11 in ipairs(slot6) do
			if slot4 == slot3.FLAG_SHIP and slot11 == slot2:GetFlagShip() then
				table.insert(slot5, slot11)
			elseif slot4 == slot3.LEADER and slot11 == slot2:GetScoutList()[1] then
				table.insert(slot5, slot11)
			elseif slot4 == slot3.REAR and slot11 == slot2:GetScoutList()[#slot2:GetScoutList()] then
				table.insert(slot5, slot11)
			elseif slot4 == slot3.CONSORT then
				table.insert(slot5, slot11)
			end
		end

		slot7 = slot2:GetSubList()

		for slot11, slot12 in ipairs(slot6) do
			if slot4 == slot3.SUB_LEADER and slot11 == 1 then
				table.insert(slot5, slot12)
			elseif slot4 == slot3.SUB_CONSORT then
				table.insert(slot5, slot12)
			end
		end

		return slot5
	end,
	TargetPlayerVanguardFleet = function (slot0, slot1, slot2)
		slot4 = ys.Battle.BattleDataProxy.GetInstance():GetFleetByIFF(slot0:GetIFF()):GetScoutList()

		if not slot2 then
			return slot4
		else
			slot5 = #slot2

			while slot5 > 0 do
				if not table.contains(slot4, slot2[slot5]) then
					table.remove(slot2, slot5)
				end

				slot5 = slot5 - 1
			end

			return slot2
		end
	end,
	TargetPlayerMainFleet = function (slot0, slot1, slot2)
		slot4 = ys.Battle.BattleDataProxy.GetInstance():GetFleetByIFF(slot0:GetIFF()):GetMainList()

		if not slot2 then
			return slot4
		else
			slot5 = #slot2

			while slot5 > 0 do
				if not table.contains(slot4, slot2[slot5]) then
					table.remove(slot2, slot5)
				end

				slot5 = slot5 - 1
			end

			return slot2
		end
	end,
	TargetPlayerFlagShip = function (slot0, slot1, slot2)
		return {
			ys.Battle.BattleDataProxy.GetInstance():GetFleetByIFF(slot0:GetIFF()):GetFlagShip()
		}
	end,
	TargetPlayerByType = function (slot0, slot1)
		slot4 = {}
		slot5 = slot1.shipType

		for slot9, slot10 in ipairs(slot3) do
			if slot10:GetTemplate().type == slot5 then
				slot4[#slot4 + 1] = slot10
			end
		end

		return slot4
	end
}

return
