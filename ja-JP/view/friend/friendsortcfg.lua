slot2.tag = i18n("word_default")

function slot2.func(slot0, slot1)
	table.sort(slot0, function (slot0, slot1)
		if slot0.unreadCount == slot1.unreadCount then
			if slot0.online == slot1.online then
				if slot0.preOnLineTime == slot1.preOnLineTime then
					return slot0.id < slot1.id
				elseif uv0 then
					return slot0.preOnLineTime < slot1.preOnLineTime
				else
					return slot1.preOnLineTime < slot0.preOnLineTime
				end
			elseif uv0 then
				return slot0.online < slot1.online
			else
				return slot1.online < slot0.online
			end
		else
			return slot1.unreadCount < slot0.unreadCount
		end
	end)
end

slot1[1] = {
	spr = "sort_login"
}
slot2.tag = i18n("word_star")

function slot2.func(slot0, slot1)
	slot2 = pg.ship_data_statistics

	table.sort(slot0, function (slot0, slot1)
		if uv0[slot0.icon].star == uv0[slot1.icon].star then
			if slot0.level == slot1.level then
				return slot0.id < slot1.id
			elseif uv1 then
				return slot0.level < slot1.level
			else
				return slot1.level < slot0.level
			end
		elseif uv1 then
			return uv0[slot0.icon].star < uv0[slot1.icon].star
		else
			return uv0[slot1.icon].star < uv0[slot0.icon].star
		end
	end)
end

slot1[2] = {
	spr = "sort_star"
}
slot2.tag = i18n("word_level")

function slot2.func(slot0, slot1)
	table.sort(slot0, function (slot0, slot1)
		if slot0.level == slot1.level then
			return slot0.id < slot1.id
		elseif uv0 then
			return slot0.level < slot1.level
		else
			return slot1.level < slot0.level
		end
	end)
end

slot1[3] = {
	spr = "sort_lv"
}
slot0.SORT_TAG = {}

return {}
