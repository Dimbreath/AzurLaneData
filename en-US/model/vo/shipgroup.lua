slot0 = class("ShipGroup", import(".BaseVO"))
slot0.REQ_INTERVAL = 60

function slot0.GetGroupConfig(slot0)
	for slot4, slot5 in pairs(pg.ship_data_group) do
		if slot5.group_type == slot0 then
			return slot5
		end
	end
end

function slot0.getDefaultShipConfig(slot0)
	slot1 = nil

	for slot5 = 4, 1, -1 do
		if pg.ship_data_statistics[tonumber(slot0 .. slot5)] then
			break
		end
	end

	return slot1
end

function slot0.getDefaultShipNameByGroupID(slot0)
	return uv0.getDefaultShipConfig(slot0).name
end

function slot0.IsBluePrintGroup(slot0)
	return table.contains(pg.ship_data_blueprint.all, slot0)
end

slot0.STATE_LOCK = 0
slot0.STATE_NOTGET = 1
slot0.STATE_UNLOCK = 2
slot0.ENABLE_SKIP_TO_CHAPTER = true
slot1 = pg.ship_data_group

function slot0.getState(slot0, slot1, slot2)
	if uv0.ENABLE_SKIP_TO_CHAPTER then
		if slot2 and not slot1 then
			return uv0.STATE_LOCK
		end

		if uv1[slot0] then
			if not uv1[slot0].hide then
				return uv0.STATE_LOCK
			end

			if slot3.hide == 1 then
				return uv0.STATE_LOCK
			elseif slot3.hide ~= 0 then
				return uv0.STATE_LOCK
			end
		end

		if slot1 then
			return uv0.STATE_UNLOCK
		else
			if not uv1[slot0] then
				return uv0.STATE_LOCK
			end

			slot6 = nil

			if slot3.redirect_id ~= 0 then
				slot6 = getProxy(ChapterProxy):getChapterById(slot4)
			end

			if slot4 == 0 or slot6 and slot6:isClear() then
				return uv0.STATE_NOTGET
			else
				return uv0.STATE_LOCK
			end
		end
	else
		return slot1 and uv0.STATE_UNLOCK or uv0.STATE_LOCK
	end
end

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1.id
	slot0.star = slot1.star
	slot0.hearts = slot1.heart_count
	slot0.iheart = (slot1.heart_flag or 0) > 0
	slot0.married = slot1.marry_flag
	slot0.maxIntimacy = slot1.intimacy_max
	slot0.maxLV = slot1.lv_max
	slot0.evaluation = nil
	slot0.lastReqStamp = 0
	slot0.trans = false
	slot2 = uv0.getDefaultShipConfig(slot0.id)

	print(shipid)

	function slot5.__index(slot0, slot1)
		return uv0[slot1]
	end

	slot0.shipConfig = setmetatable({}, {})
	slot3 = uv0.GetGroupConfig(slot0.id)

	function slot6.__index(slot0, slot1)
		return uv0[slot1]
	end

	slot0.groupConfig = setmetatable({}, {})
end

function slot0.getName(slot0, slot1)
	slot2 = slot0.shipConfig.name

	if slot1 and slot0.trans then
		slot2 = HXSet.hxLan(pg.ship_skin_template[slot0.groupConfig.trans_skin].name)
	end

	return slot2
end

function slot0.getNation(slot0)
	return slot0.shipConfig.nationality
end

function slot0.getRarity(slot0, slot1)
	if slot1 and slot0.trans then
		slot2 = slot0.shipConfig.rarity + 1
	end

	return slot2
end

function slot0.getTeamType(slot0)
	return pg.ship_data_by_type[slot0:getShipType()].team_type
end

function slot0.getPainting(slot0, slot1)
	slot2 = slot0.shipConfig.skin_id

	if slot1 and slot0.trans then
		slot2 = slot0.groupConfig.trans_skin
	end

	return pg.ship_skin_template[slot2].painting
end

function slot0.getShipType(slot0, slot1)
	slot2 = slot0.shipConfig.type

	if slot1 and slot0.trans and Ship.getTransformShipId(slot0.shipConfig.id) then
		slot2 = pg.ship_data_statistics[slot3].type
	end

	return slot2
end

function slot0.getShipConfigId(slot0, slot1)
	slot2 = slot0.shipConfig.id

	if slot1 and slot0.trans and Ship.getTransformShipId(slot0.shipConfig.id) then
		slot2 = pg.ship_data_statistics[slot3].id
	end

	return slot2
end

function slot0.getSkinList(slot0)
	return ShipSkin.GetAllSkinByGroup(slot0)
end

function slot0.getDisplayableSkinList(slot0)
	for slot6, slot7 in ipairs(pg.ship_skin_template.all) do
		if pg.ship_skin_template[slot7].ship_group == slot0.id and slot8.no_showing ~= "1" and not function (slot0)
			if slot0.skin_type ~= ShipSkin.SKIN_TYPE_OLD then
				if slot0.skin_type == ShipSkin.SKIN_TYPE_NOT_HAVE_HIDE then
					slot1 = not getProxy(ShipSkinProxy):hasSkin(slot0.id)
				else
					slot1 = false
				end
			else
				slot1 = true
			end

			return slot1
		end(slot8) then
			table.insert({}, slot8)
		end
	end

	return slot1
end

function slot0.getDefaultSkin(slot0)
	return ShipSkin.GetSkinByType(slot0, ShipSkin.SKIN_TYPE_DEFAULT)
end

function slot0.getProposeSkin(slot0)
	return ShipSkin.GetSkinByType(slot0, ShipSkin.SKIN_TYPE_PROPOSE)
end

function slot0.getModSkin(slot0)
	if pg.ship_data_trans[slot0] then
		return pg.ship_skin_template[slot1.skin_id]
	end

	return nil
end

function slot0.GetSkin(slot0, slot1)
	if not slot1 then
		return uv0.getDefaultSkin(slot0.id)
	else
		return uv0.getModSkin(slot0.id)
	end
end

function slot0.updateMaxIntimacy(slot0, slot1)
	slot0.maxIntimacy = math.max(slot1, slot0.maxIntimacy)
end

function slot0.updateMarriedFlag(slot0)
	slot0.married = 1
end

function slot0.isBluePrintGroup(slot0)
	return uv0.IsBluePrintGroup(slot0.id)
end

function slot0.getBluePrintChangeSkillList(slot0)
	return pg.ship_data_blueprint[slot0.id].change_skill
end

function slot0.GetSkin(slot0, slot1)
	if not slot1 then
		return uv0.getDefaultSkin(slot0.id)
	else
		return uv0.getModSkin(slot0.id)
	end
end

function slot0.GetNationTxt(slot0)
	slot1 = slot0.shipConfig.nationality

	return Nation.Nation2facionName(slot1) .. "-" .. Nation.Nation2Name(slot1)
end

slot0.CONDITION_FORBIDDEN = -1
slot0.CONDITION_CLEAR = 0
slot0.CONDITION_INTIMACY = 1
slot0.CONDITION_MARRIED = 2

function slot0.VoiceReplayCodition(slot0, slot1)
	slot2 = true
	slot3 = ""

	if slot0:isBluePrintGroup() then
		slot4 = getProxy(TechnologyProxy):getBluePrintById(slot0.id)

		if not table.contains(slot4:getUnlockVoices(), slot1.key) and slot4:getUnlockLevel(slot1.key) > 0 then
			return false, i18n("ship_profile_voice_locked_design", slot6)
		end
	end

	if slot1.unlock_condition[1] == uv0.CONDITION_INTIMACY then
		if slot0.maxIntimacy < slot1.unlock_condition[2] then
			slot2 = false
			slot3 = i18n("ship_profile_voice_locked_intimacy", math.floor(slot1.unlock_condition[2] / 100))
		end
	elseif slot1.unlock_condition[1] == uv0.CONDITION_MARRIED and slot0.married == 0 then
		slot2 = false
		slot3 = i18n("ship_profile_voice_locked_propose")
	end

	return slot2, slot3
end

function slot0.GetMaxIntimacy(slot0)
	return slot0.maxIntimacy / 100 + (slot0.married and slot0.married * 1000 or 0)
end

return slot0
