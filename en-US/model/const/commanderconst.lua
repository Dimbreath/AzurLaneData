slot0 = class("CommanderConst")
slot0.TALENT_POINT_LEVEL = 5
slot0.TALENT_POINT = 1
slot0.TALENT_ADDITION_NUMBER = 1
slot0.TALENT_ADDITION_RATIO = 2
slot0.TALENT_ADDITION_BUFF = 3
slot0.MAX_TELENT_COUNT = 5
slot0.RESET_TALENT_WAIT_TIME = 86401
slot0.PLAY_MAX_COUNT = 10
slot0.MAX_FORMATION_POS = 2
slot0.MAX_ABILITY = 255
slot1[1] = AttributeType.Durability
slot1[2] = AttributeType.Cannon
slot1[3] = AttributeType.Torpedo
slot1[4] = AttributeType.AntiAircraft
slot1[5] = AttributeType.Air
slot1[6] = AttributeType.Reload
slot1[7] = AttributeType.Armor
slot1[8] = AttributeType.Hit
slot1[9] = AttributeType.Dodge
slot1[10] = AttributeType.Speed
slot1[11] = AttributeType.Luck
slot1[12] = AttributeType.AntiSub
slot0.PROPERTIES = {}
slot0.DESTROY_ATTR_ID = 202

function slot0.getBoxComsume(slot0)
	slot1 = nil

	for slot5, slot6 in ipairs(uv0) do
		if slot0 < slot6[3] then
			slot1 = slot6[1]

			break
		end
	end

	return slot1 or uv0[#uv0][1]
end

slot0.MAX_GETBOX_CNT = 0

for slot5, slot6 in ipairs(pg.gameset.commander_get_cost.description) do
	slot0.MAX_GETBOX_CNT = slot0.MAX_GETBOX_CNT + slot6[3]
end

return slot0
