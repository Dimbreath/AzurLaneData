ys = ys or {}
slot1 = ys.Battle.BattleDataFunction
slot2 = ys.Battle.BattleFormulas
slot3 = ys.Battle.BattleAttr
slot5 = ys.Battle.BattleConst.EquipmentType
slot6 = ys.Battle.BattleConfig
ys.Battle.BattlePlayerUnit = class("BattlePlayerUnit", ys.Battle.BattleUnit)
ys.Battle.BattlePlayerUnit.__name = "BattlePlayerUnit"

function ys.Battle.BattlePlayerUnit.Ctor(slot0, slot1, slot2)
	slot0.super.Ctor(slot0, slot1, slot2)

	slot0._type = slot1.UnitType.PLAYER_UNIT
end

function ys.Battle.BattlePlayerUnit.Retreat(slot0)
	slot0.super.Retreat(slot0)
	slot0:SetDeathReason(slot1.UnitDeathReason.LEAVE)
	slot0:DeadAction()
	slot0._battleProxy:ShutdownPlayerUnit(slot0:GetUniqueID())
	slot0._battleProxy:KillUnit(slot0:GetUniqueID())
end

function ys.Battle.BattlePlayerUnit.DeadActionEvent(slot0)
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.WILL_DIE, {}))
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.SHUT_DOWN_PLAYER, {}))
	slot0._unitState:ChangeState(slot0.Battle.UnitState.STATE_DEAD)
end

function ys.Battle.BattlePlayerUnit.InitCurrentHP(slot0, slot1)
	slot0:SetCurrentHP(math.ceil(slot0:GetMaxHP() * slot1))
	slot0:TriggerBuff(slot0.BuffEffectType.ON_HP_RATIO_UPDATE, {})
end

function ys.Battle.BattlePlayerUnit.SetSkinId(slot0, slot1)
	slot0._skinId = slot1
end

function ys.Battle.BattlePlayerUnit.GetSkinID(slot0)
	return slot0._skinId
end

function ys.Battle.BattlePlayerUnit.GetDefaultSkinID(slot0)
	return slot0._tmpData.skin_id
end

function ys.Battle.BattlePlayerUnit.GetShipName(slot0)
	return slot0._shipName or slot0._tmpData.name
end

function ys.Battle.BattlePlayerUnit.SetShipName(slot0, slot1)
	slot0._shipName = slot1
end

function ys.Battle.BattlePlayerUnit.SetTemplate(slot0, slot1, slot2)
	slot0.super.SetTemplate(slot0, slot1)

	slot0._tmpData = slot1.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(slot0._tmpID)

	slot0:configWeaponQueueParallel()
	slot0:overrideWeaponInfo()
	slot0:overrideSkin(slot0._skinId, true)
	slot0:InitCldComponent()

	slot2.armorType = slot0._tmpData.armor_type

	slot0:setAttrFromOutBattle(slot2)
	slot2.InitDOTAttr(slot0._attr, slot0._tmpData)
	slot2.SetCurrent(slot0, "srcShipType", slot0._tmpData.type)

	slot0._personality = slot1.Battle.BattleDataFunction.GetShipPersonality(2)

	for slot6, slot7 in ipairs(slot0._tmpData.tag_list) do
		slot0:AddLabelTag(slot7)
	end

	slot0:setStandardLabelTag()
end

function ys.Battle.BattlePlayerUnit.overrideSkin(slot0, slot1, slot2)
	slot0._skinData = slot0.GetPlayerShipSkinDataFromID(slot1)
	slot3 = {
		"prefab",
		"fx_container",
		"bound_bone",
		"smoke"
	}

	if slot2 then
		slot3[#slot3 + 1] = "painting"
	end

	_.each(slot3, function (slot0)
		slot0._tmpData[slot0] = slot0._skinData[slot0]
	end)
end

function ys.Battle.BattlePlayerUnit.overrideWeaponInfo(slot0, slot1, slot2)
	if slot0._overrideBaseInfo then
		slot0._tmpData.base_list = slot0._overrideBaseInfo
	end

	if slot0._overridePreloadInfo then
		slot0._tmpData.preload_count = slot0._overridePreloadInfo
	end
end

function ys.Battle.BattlePlayerUnit.SetWeaponInfo(slot0, slot1, slot2)
	slot0._overrideBaseInfo = slot1
	slot0._overridePreloadInfo = slot2
end

function ys.Battle.BattlePlayerUnit.SetRarity(slot0, slot1)
	slot0._rarity = slot1
end

function ys.Battle.BattlePlayerUnit.SetIntimacy(slot0, slot1)
	slot0._intimacy = slot1
end

function ys.Battle.BattlePlayerUnit.setWeapon(slot0, slot1)
	slot2 = slot0._tmpData.default_equip_list
	slot3 = slot0._tmpData.base_list
	slot4 = slot0._proficiencyList
	slot5 = slot0._tmpData.preload_count

	for slot9, slot10 in ipairs(slot1) do
		if slot9 == Ship.PREFAB_EQUIP and slot10 and slot10.skin and slot10.skin ~= 0 then
			if slot0.GetEquipSkinDataFromID(slot10.skin).ship_skin_id ~= 0 then
				slot0:overrideSkin(slot11.ship_skin_id)
			end

			slot12 = slot11.attachment_key
			slot0._skinAttachment = slot0._skinAttachment or {}

			if slot12 ~= 0 and not slot0._skinAttachment[slot12] then
				slot0._skinAttachment[slot12] = slot11.attachment_combat_scene
			end
		elseif slot9 <= Ship.WEAPON_COUNT then
			slot11 = slot4[slot9]
			slot12 = slot5[slot9]

			function slot13(slot0, slot1, slot2)
				for slot7 = 1, slot0[slot1], 1 do
					slot9 = slot2:AddWeapon(slot0, slot1, slot2, slot3, slot1).GetTemplateData(slot8).type

					if slot7 <= slot4 and (slot9 == slot5.POINT_HIT_AND_LOCK or slot9 == slot5.MANUAL_TORPEDO or slot9 == slot5.DISPOSABLE_TORPEDO) then
						slot8:SetModifyInitialCD()
					end
				end
			end

			if slot10.equipment then
				for slot18, slot19 in ipairs(slot14) do
					if slot19 and slot19 ~= -1 then
						slot13(slot19, slot10.equipment.label, slot10.skin)
					end
				end
			else
				slot13(slot2[slot9])
			end
		end
	end

	slot6 = #slot2

	for slot11, slot12 in ipairs(slot7) do
		if slot12 and slot12 ~= -1 then
			slot0:AddWeapon(slot12, nil, nil, slot4[slot11 + slot6] or 1, slot11 + slot6)
		end
	end

	if slot0:CanDoAntiSub() then
		slot8 = {}

		for slot12 = Ship.WEAPON_COUNT + 1, #slot1, 1 do
			if slot1[slot12] and slot13.equipment and #slot13.equipment.weapon_id > 0 then
				slot8[#slot8 + 1] = slot13.equipment.weapon_id[1]
			end
		end

		if #slot8 == 0 then
			slot8 = slot0._tmpData.depth_charge_list
		end

		slot9 = 20
		slot10 = 1

		for slot14, slot15 in ipairs(slot8) do
			slot0:AddAutoWeapon(slot2.Battle.BattleDataFunction.CreateWeaponUnit(slot15, slot0, slot10, slot9))
		end
	end
end

function ys.Battle.BattlePlayerUnit.SetPriorityWeaponSkin(slot0, slot1)
	if not slot0._priorityWeaponSkinID then
		slot0._priorityWeaponSkinID = slot1
	end
end

function ys.Battle.BattlePlayerUnit.GetPriorityWeaponSkin(slot0)
	return slot0._priorityWeaponSkinID
end

function ys.Battle.BattlePlayerUnit.AddWeapon(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0._totalWeapon[#slot0._totalWeapon + 1] = slot0.Battle.BattleDataFunction.CreateWeaponUnit(slot1, slot0, slot4, slot5)

	if slot2 then
		slot6:SetEquipmentLabel(slot2)
	end

	if slot6:GetTemplateData().type == slot1.POINT_HIT_AND_LOCK then
		slot0._chargeList[#slot0._chargeList + 1] = slot6

		slot0._weaponQueue:AppendChargeWeapon(slot6)
	elseif slot7 == slot1.MANUAL_TORPEDO or slot7 == slot1.DISPOSABLE_TORPEDO then
		slot0._manualTorpedoList[#slot0._manualTorpedoList + 1] = slot6

		slot0._weaponQueue:AppendManualTorpedo(slot6)
	elseif slot7 == slot1.PASSIVE_SCOUT then
	elseif slot7 == slot1.FLEET_ANTI_AIR then
		slot0._fleetAAList[#slot0._fleetAAList + 1] = slot6
	else
		slot0:AddAutoWeapon(slot6)
	end

	if slot7 == slot1.PASSIVE_SCOUT then
		slot0._hiveList[#slot0._hiveList + 1] = slot6
	end

	if slot7 == slot1.ANTI_AIR then
		slot0._AAList[#slot0._AAList + 1] = slot6
	end

	if slot3 and slot3 ~= 0 then
		slot6:SetSkinData(slot3)
		slot0:SetPriorityWeaponSkin(slot3)
	end

	return slot6
end

function ys.Battle.BattlePlayerUnit.RemoveWeapon(slot0, slot1)
	slot3 = nil

	if slot0.GetWeaponPropertyDataFromID(slot1).type == slot1.PASSIVE_SCOUT then
		for slot7, slot8 in ipairs(slot0._hiveList) do
			if slot8:GetWeaponId() == slot1 then
				slot3 = slot8

				table.remove(slot0._hiveList, slot7)

				break
			end
		end
	elseif slot2 == slot1.SCOUT then
		for slot7, slot8 in ipairs(slot0._autoWeaponList) do
			if slot8:GetWeaponId() == slot1 then
				slot0:RemoveAutoWeapon(slot8)

				break
			end
		end
	end

	if slot3 then
		for slot7, slot8 in ipairs(slot0._totalWeapon) do
			if slot8 == slot3 then
				table.remove(slot0._totalWeapon, slot7)

				break
			end
		end
	end

	return slot3
end

function ys.Battle.BattlePlayerUnit.ShiftWeapon(slot0, slot1)
	return
end

function ys.Battle.BattlePlayerUnit.GetManualWeaponParallel(slot0)
	return slot0._tmpData.parallel_max
end

function ys.Battle.BattlePlayerUnit.LeaderSetting(slot0)
	if slot0.GetWords(slot0:GetSkinID(), "hp_warning", slot0:GetIntimacy()) and slot2 ~= "" then
		slot0._warningValue = slot1.WARNING_HP_RATE * slot0:GetMaxHP()
	end
end

function ys.Battle.BattlePlayerUnit.UpdateHP(slot0, slot1, slot2, slot3, slot4)
	slot0.super.UpdateHP(slot0, slot1, slot2, slot3, slot4)

	if slot0._warningValue and slot0._currentHP < slot0._warningValue and not isHeal then
		slot0._warningValue = nil

		slot0:DispatchVoice(slot6)
		slot0:DispatchChat(slot1.GetWords(slot0:GetSkinID(), slot6, slot5), 2.5, "hp_warning")
	end

	if slot0._mainUnitWarningValue and slot0._currentHP < slot0._mainUnitWarningValue and slot0._currentHP > 0 and not isHeal then
		slot0._mainUnitWarningValue = nil

		pg.TipsMgr.GetInstance():ShowTips(i18n("battle_main_emergent", slot0:GetShipName()))
	end
end

function ys.Battle.BattlePlayerUnit.SetMainFleetUnit(slot0)
	slot0.super.SetMainFleetUnit(slot0)

	if slot0._IFF == slot1.FRIENDLY_CODE then
		slot0._mainUnitWarningValue = slot1.WARNING_HP_RATE_MAIN * slot0:GetMaxHP()
	end
end

function ys.Battle.BattlePlayerUnit.UpdatePrecastMoveLimit(slot0)
	return
end

function ys.Battle.BattlePlayerUnit.ConfigBubbleFX(slot0)
	slot0._bubbleFX = slot0.PLAYER_SUB_BUBBLE_FX

	slot0._oxyState:SetBubbleTemplate(slot0.PLAYER_SUB_BUBBLE_INIT, slot0.PLAYER_SUB_BUBBLE_INTERVAL)
end

function ys.Battle.BattlePlayerUnit.OxyConsume(slot0)
	slot0.super.OxyConsume(slot0)

	if slot0._currentOxy <= 0 then
		slot0._fleet:ChangeSubmarineState(slot1.Battle.OxyState.STATE_FREE_FLOAT, true)
	end
end

function ys.Battle.BattlePlayerUnit.SetFormationIndex(slot0, slot1)
	slot0._formationIndex = slot1
end

function ys.Battle.BattlePlayerUnit.setAttrFromOutBattle(slot0, slot1)
	slot0:SetPlayerAttrFromOutBattle(slot1)
end

function ys.Battle.BattlePlayerUnit.SetFleetVO(slot0, slot1)
	slot0._fleet = slot1
	slot0._subRaidLine, slot0._subRetreatLine = slot0._fleet:GetSubmarineBaseLine()
end

function ys.Battle.BattlePlayerUnit.GetTemplate(slot0)
	return slot0._tmpData
end

function ys.Battle.BattlePlayerUnit.GetRarity(slot0)
	return slot0._rarity or slot0._tmpData.rarity
end

function ys.Battle.BattlePlayerUnit.GetIntimacy(slot0)
	return slot0._intimacy or 0
end

function ys.Battle.BattlePlayerUnit.GetAutoPilotPreference(slot0)
	return slot0._personality
end

function ys.Battle.BattlePlayerUnit.GetFleetVO(slot0)
	return slot0._fleet
end

function ys.Battle.BattlePlayerUnit.InitCldComponent(slot0)
	slot0.super.InitCldComponent(slot0)
	slot0._cldComponent:SetCldData({
		type = slot1.CldType.SHIP,
		IFF = slot0:GetIFF(),
		UID = slot0:GetUniqueID(),
		Mass = slot1.CldMass.L2
	})
end

return
