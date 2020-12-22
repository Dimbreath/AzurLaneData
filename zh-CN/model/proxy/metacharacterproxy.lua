slot0 = class("MetaCharacterProxy", import(".NetProxy"))
slot0.METAPROGRESS_UPDATED = "MetaCharacterProxy:METAPROGRESS_UPDATED"
slot1 = pg.ship_strengthen_meta

function slot0.register(slot0)
	slot0.data = {}
	slot0.metaProgressVOList = {}

	for slot4, slot5 in pairs(uv0.all) do
		slot6 = MetaProgress.New({
			id = slot5
		})
		slot0.data[slot5] = slot6

		table.insert(slot0.metaProgressVOList, slot6)
	end

	slot0:on(63316, function (slot0)
		print("get 63316 exp info")

		for slot4, slot5 in ipairs(slot0.skill_info_list) do
			slot7 = slot5.skill_id
			slot8 = slot5.skill_level
			slot12 = getProxy(BayProxy):getShipById(slot5.ship_id)

			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_META, {
				metaShipVO = slot12,
				newDayExp = slot5.day_exp,
				addDayExp = slot5.add_exp,
				curSkillID = slot7,
				newSkillLevel = slot8
			})
			slot12:updateSkill({
				skill_id = slot7,
				skill_lv = slot8,
				skill_exp = slot5.skill_exp
			})
			getProxy(BayProxy):updateShip(slot12)
		end
	end)
end

function slot0.getMetaProgressVOList(slot0)
	for slot4, slot5 in ipairs(slot0.metaProgressVOList) do
		slot5:setDataBeforeGet()
	end

	return slot0.metaProgressVOList
end

function slot0.getMetaProgressVOByID(slot0, slot1)
	if slot0.data[slot1] then
		slot2:setDataBeforeGet()
	end

	return slot2
end

function slot0.isHaveVaildMetaProgressVO(slot0)
	for slot5, slot6 in ipairs(slot0:getMetaProgressVOList()) do
		if slot6:isShow() then
			return true
		end
	end

	return false
end

function slot0.isHaveBuildMetaProgressVO(slot0)
	for slot5, slot6 in ipairs(slot0:getMetaProgressVOList()) do
		if slot6:isBuildType() and slot6:isInAct() then
			return true
		end
	end

	return false
end

return slot0
