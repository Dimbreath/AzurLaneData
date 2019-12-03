slot0 = class("BackyardEffectCompose")

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot0.id
	slot0.ids = slot0:getConfig("furniture_ids")
	slot0.effect = slot0:getConfig("effect_name")
end

slot0.getConfig = function (slot0, slot1)
	return pg.furniture_compose_template[slot0.configId][slot1]
end

slot0.match = function (slot0, slot1)
	return _.all(slot0.ids, function (slot0)
		return _.any(slot0, function (slot0)
			return slot0 == slot0
		end)
	end)
end

slot0.getEffectName = function (slot0)
	return slot0.effect
end

return slot0
