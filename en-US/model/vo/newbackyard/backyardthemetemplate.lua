slot0 = class("BackYardThemeTemplate", import(".BackYardBaseThemeTemplate"))

function slot0.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1, BackYardTheme.TYPE_USER)

	slot0.isFetched = slot1.is_fetch
end

function slot0.GetType(slot0)
	return BackYardConst.THEME_TEMPLATE_USAGE_TYPE_OTHER
end

function slot0.initTheme(slot0, slot1)
	slot2 = 1
	slot0.furnitures = {}

	for slot6, slot7 in ipairs(slot1.furniture_put_list or {}) do
		for slot12, slot13 in ipairs(slot7.child) do
			-- Nothing
		end

		table.insert(slot0.furnitures, BackyardFurnitureVO.New({
			id = tonumber(slot7.id),
			position = {
				x = slot7.x,
				y = slot7.y
			},
			dir = slot7.dir,
			child = {
				[tonumber(slot13.id)] = {
					x = slot13.x,
					y = slot13.y
				}
			},
			parent = tonumber(slot7.parent),
			floor = slot2
		}))
	end
end

function slot0.ShouldFetch(slot0)
	return not slot0.isFetched
end

function slot0.getThemeFurnitures(slot0)
	return {}
end

function slot0.GetAllFurniture(slot0)
	slot1 = {}
	slot2 = {}

	for slot6, slot7 in ipairs(slot0.furnitures) do
		if not slot2[tonumber(slot7.id)] then
			slot2[tonumber(slot7.id)] = {
				id = tonumber(slot7.id),
				count = slot7:getConfig("count")
			}
		end
	end

	table.insert({}, {
		floor = 1,
		furniture_put_list = slot0:GetRawPutList() or {}
	})

	return GetBackYardDataCommand.initFurnitures({
		skipCheck = true,
		lv = 4,
		furniture_id_list = _.values(slot2),
		furniture_put_list = slot3
	})
end

function slot0.IsOccupyed(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot0[slot6.id] and slot7.floor ~= 0 and slot7.floor ~= 1 then
			return true
		end
	end

	return false
end

function slot0.isOccupyed(slot0)
	return uv0.IsOccupyed(slot0, self:GetAllFurniture())
end

function slot0.GetUsableFurnituresForFloor(slot0, slot1, slot2)
	slot3 = {}
	slot4 = {
		[slot9.id] = slot9
	}

	for slot8, slot9 in pairs(slot0) do
		if slot9.floor ~= slot2 then
			-- Nothing
		end
	end

	slot6 = {}

	for slot10, slot11 in pairs(slot1) do
		if slot4[slot11.id] then
			table.insert({}, slot11.id)

			for slot16, slot17 in pairs(slot11.child) do
				table.insert(slot5, slot16)
			end

			if tonumber(slot11.parent) ~= 0 then
				table.insert(slot5, tonumber(slot11.parent))

				for slot17, slot18 in pairs(slot1[tonumber(slot11.parent)].child) do
					table.insert(slot5, slot17)
				end
			end
		else
			table.insert(slot6, slot11.id)
		end
	end

	for slot10, slot11 in ipairs(slot6) do
		if not table.contains(slot5, slot11) then
			table.insert(slot3, slot1[slot11])
		end
	end

	return slot3
end

function slot0.getUsableFurnituresForFloor(slot0, slot1, slot2)
	return uv0.GetUsableFurnituresForFloor(slot1, slot0:GetAllFurniture(), slot2)
end

function slot0.GetFurnitureCnt(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.furnitures) do
		if not slot1[slot6.id] then
			slot1[slot6.id] = 0
		end

		slot1[slot6.id] = slot1[slot6.id] + 1
	end

	return slot1
end

return slot0
