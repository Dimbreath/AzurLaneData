slot0 = class("CommanderTalent", import("..BaseVO"))
slot1 = pg.commander_ability_group

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot0.id
	slot0.groupId = slot0:getConfig("group_id")
	slot0.list = uv0[slot0.groupId].ability_list
end

function slot0.reset(slot0)
	slot0.id = slot0.list[1]
	slot0.configId = slot0.id
end

function slot0.setOrigin(slot0, slot1)
	slot0.origin = slot1
end

function slot0.isOrigin(slot0)
	return slot0.origin
end

function slot0.getTalentList(slot0)
	return slot0.list
end

function slot0.bindConfigTable(slot0)
	return pg.commander_ability_template
end

function slot0.getConsume(slot0)
	slot1 = 0
	slot2 = table.indexof(slot0.list, slot0.id)

	return slot0.origin and slot2 - table.indexof(slot0.list, slot0.origin.id) or slot2
end

function slot0.getAttrsAddition(slot0)
	slot1 = {}
	slot2 = {}

	for slot6, slot7 in ipairs(CommanderConst.PROPERTIES) do
		for slot11, slot12 in ipairs(slot0:getConfig("add")) do
			if CommanderConst.TALENT_ADDITION_NUMBER == slot12[1] then
				if slot12[4] == slot6 then
					slot13.value = slot12[5]
					slot13.nation = slot12[2]
					slot13.shiptype = slot12[3]
					slot1[slot7] = {}
				end
			elseif CommanderConst.TALENT_ADDITION_RATIO == slot12[1] and slot12[4] == slot6 then
				slot13.value = slot12[5]
				slot13.nation = slot12[2]
				slot13.shiptype = slot12[3]
				slot2[slot7] = {}
			end
		end
	end

	return slot1, slot2
end

function slot0.getBuffsAddition(slot0)
	for slot5, slot6 in ipairs(slot0:getConfig("add")) do
		if CommanderConst.TALENT_ADDITION_BUFF == slot6[1] then
			table.insert({}, slot6[4])
		end
	end

	return slot1
end

function slot0.getDestoryExpValue(slot0)
	for slot6, slot7 in ipairs(slot0:getConfig("add")) do
		if slot7[1] == CommanderConst.TALENT_ADDITION_NUMBER and slot7[4] == CommanderConst.DESTROY_ATTR_ID then
			slot1 = 0 + slot7[5]
		end
	end

	return slot1
end

function slot0.getDestoryExpRetio(slot0)
	for slot6, slot7 in ipairs(slot0:getConfig("add")) do
		if slot7[1] == CommanderConst.TALENT_ADDITION_RATIO and slot7[4] == CommanderConst.DESTROY_ATTR_ID then
			slot1 = 0 + slot7[5]
		end
	end

	return slot1
end

function slot0.getDesc(slot0)
	slot1 = {}

	for slot6, slot7 in ipairs(slot0:getConfig("add_desc")) do
		if slot1[slot7[1]] then
			slot1[slot8].value = slot1[slot8].value + slot7[2]
		else
			slot9.value = slot7[2]
			slot9.type = slot7[3] and CommanderConst.TALENT_ADDITION_RATIO or CommanderConst.TALENT_ADDITION_NUMBER
			slot1[slot8] = {}
		end
	end

	return slot1
end

return slot0
