slot0 = class("ChapterChampionSubmarine", ChapterChampionNormal)

slot0.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot1)
end

slot0.bindConfigTable = function (slot0)
	return pg.expedition_data_template
end

slot0.getPrefab = function (slot0)
	return slot0:getConfig("icon")
end

slot0.getFleetType = function (slot0)
	return FleetType.Submarine
end

slot0.getPoolType = function (slot0)
	return "enemy"
end

slot0.getScale = function (slot0)
	return slot0:getConfig("scale")
end

slot0.inAlertRange = function (slot0, slot1, slot2)
	return _.any(slot0:getConfig("alert_range"), function (slot0)
		return slot0[1] + slot0.row ==  and slot0[2] + slot0.column == slot0.column
	end)
end

return slot0
