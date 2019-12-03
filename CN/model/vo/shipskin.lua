slot0 = class("ShipSkin", import(".BaseVO"))
slot0.SKIN_TYPE_DEFAULT = -1
slot0.SKIN_TYPE_COMMON_FASHION = 0
slot0.SKIN_TYPE_PROPOSE = 1
slot0.SKIN_TYPE_REMAKE = 2
slot0.SKIN_TYPE_OLD = 3
slot0.SKIN_TYPE_NOT_HAVE_HIDE = 4
slot0.WITH_BGM = 5

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot1.id
	slot0.endTime = slot1.end_time or slot1.time or 0
end

function slot0.bindConfigTable(slot0)
	return pg.ship_skin_template
end

function slot0.isExpireType(slot0)
	return slot0.endTime > 0
end

function slot0.getExpireTime(slot0)
	return slot0.endTime
end

function slot0.isExpired(slot0)
	return slot0.endTime <= pg.TimeMgr.GetInstance():GetServerTime()
end

function slot0.getRemainTime(slot0)
	return slot0:getExpireTime() - pg.TimeMgr.GetInstance():GetServerTime()
end

function slot0.getIcon(slot0)
	return slot0:getConfig("painting")
end

return slot0
