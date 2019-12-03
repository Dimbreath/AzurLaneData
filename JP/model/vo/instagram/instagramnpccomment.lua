slot0 = class("InstagramNpcComment", import(".InstagramComment"))
slot1 = pg.activity_ins_ship_group_template

slot0.Ctor = function (slot0, slot1, slot2, slot3)
	slot0.super.Ctor(slot0, slot1, slot2, slot3)

	slot0.configId = slot0.id

	for slot7, slot8 in ipairs(slot1.npc_reply) do
		table.insert(slot0.replyList, InstagramNpcComment.New(slot0.allReply[slot8], slot2, slot0))
	end

	slot0.config = slot1[slot0:getConfig("ship_group")]
end

slot0.bindConfigTable = function (slot0)
	return pg.activity_ins_npc_template
end

slot0.GetName = function (slot0)
	return slot0.config.name
end

slot0.GetPainting = function (slot0)
	return slot0.config.sculpture
end

slot0.GetType = function (slot0)
	return Instagram.TYPE_NPC_COMMENT
end

return slot0
