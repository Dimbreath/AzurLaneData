slot0 = {
	p = pg.gameset.air_dominance_p.key_value,
	q = pg.gameset.air_dominance_q.key_value,
	s = pg.gameset.air_dominance_s.key_value,
	t = pg.gameset.air_dominance_t.key_value,
	r = pg.gameset.air_dominance_r.key_value,
	a = pg.gameset.air_dominance_a.key_value,
	x = pg.gameset.air_dominance_x.key_value,
	y = pg.gameset.air_dominance_y.key_value
}

function calcAirDominanceValue(slot0, slot1)
	slot2 = slot0:getAircraftCount()

	return (defaultValue(slot0:getProperties(slot1)[AttributeType.Air], 0) * (slot2[EquipType.FighterAircraft] * slot0.p + slot2[EquipType.TorpedoAircraft] * slot0.q + slot2[EquipType.BomberAircraft] * slot0.s + slot2[EquipType.SeaPlane] * slot0.t) * (0.8 + (slot0.level * slot0.r) / 100)) / 100 + slot0:getEquipmentProperties()[AttributeType.AirDominate]
end

function calcAirDominanceStatus(slot0, slot1, slot2)
	slot1 = slot1 * slot0.a / (slot2 + slot0.a)

	if slot0 == 0 then
		if slot1 <= slot0.x then
			return 0
		elseif slot1 <= slot0.y then
			return 2
		else
			return 1
		end
	elseif slot0 <= slot0.x then
		if slot1 == 0 then
			return 0
		elseif slot1 <= slot0.x then
			return 0
		elseif slot1 <= slot0.y then
			if slot0 <= slot1 * 0.75 then
				return 2
			elseif slot0 <= slot1 * 1.3 then
				return 3
			else
				return 4
			end
		elseif slot0 <= slot1 * 0.5 then
			return 1
		elseif slot0 <= slot1 * 0.75 then
			return 2
		elseif slot0 <= slot1 * 1.3 then
			return 3
		else
			return 4
		end
	elseif slot0 <= slot0.y then
		if slot1 == 0 then
			return 4
		elseif slot1 <= slot0.y then
			if slot0 <= slot1 * 0.75 then
				return 2
			elseif slot0 <= slot1 * 1.3 then
				return 3
			else
				return 4
			end
		elseif slot0 <= slot1 * 0.5 then
			return 1
		elseif slot0 <= slot1 * 0.75 then
			return 2
		elseif slot0 <= slot1 * 1.3 then
			return 3
		else
			return 4
		end
	elseif slot1 == 0 then
		return 5
	elseif slot0 <= slot1 * 0.5 then
		return 1
	elseif slot0 <= slot1 * 0.75 then
		return 2
	elseif slot0 <= slot1 * 1.3 then
		return 3
	elseif slot0 <= slot1 * 2 then
		return 4
	else
		return 5
	end
end

return
