slot0 = class("BackYardTheme", import(".BaseVO"))
slot0.TYPE_SYSTEM = 1
slot0.TYPE_USER = 2
slot0.MAX_USER_THEME = 5

function slot0.Ctor(slot0, slot1, slot2)
	slot0.id = slot1.id
	slot0.configId = slot1.id
	slot0.name = slot1.name or ""
	slot0.type = slot2 or slot1.type or slot0.TYPE_SYSTEM

	if slot0.type == slot0.TYPE_SYSTEM then
		slot5 = {
			floor = 1,
			furniture_put_list = slot0:getSystemThemeFurnitures(getProxy(DormProxy):getData().level)
		}

		slot0:initTheme(slot5)

		slot0.furnitruesByIds = slot0:getThemeFurnitures(slot5)

		if slot0:isSameConfigId(slot0.furnitures) then
			slot0:checkSystemTheme()
		end
	else
		slot0:initTheme(slot1)

		slot0.furnitruesByIds = slot0:getThemeFurnitures(slot1)
	end
end

function slot0.ContainsFurniture(slot0, slot1)
	for slot5, slot6 in pairs(slot0.furnitures) do
		if slot6.id == slot1.id then
			return true
		end
	end

	return false
end

function slot0.isSameConfigId(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		for slot10, slot11 in ipairs(slot1) do
			if slot5 ~= slot10 and slot6.id == slot11.id then
				return true
			end
		end
	end

	return false
end

function slot0.checkSystemTheme(slot0)
	slot2 = {}

	for slot7, slot8 in pairs(slot0.furnitruesByIds) do
		if not getProxy(DormProxy):getFurniById(slot7) then
			if slot8.parent ~= 0 then
				table.insert({}, {
					pid = slot8.parent,
					id = slot7
				})
			elseif table.getCount(slot8.child) > 0 then
				for slot12, slot13 in pairs(slot8.child) do
					table.insert(slot2, slot12)
				end
			end

			table.insert(slot2, slot7)
		end
	end

	for slot7, slot8 in ipairs(slot2) do
		slot0.furnitruesByIds[slot8] = nil
	end

	for slot7, slot8 in pairs(slot3) do
		if slot0.furnitruesByIds[slot8.pid] then
			for slot13, slot14 in pairs(slot9.child) do
				if slot13 == slot8.id then
					slot9.child[slot8.id] = nil

					break
				end
			end
		end
	end
end

function slot0.initTheme(slot0, slot1)
	slot2 = getProxy(DormProxy).floor
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

function slot0.getThemeFurnitures(slot0, slot1)
	slot2 = getProxy(DormProxy):getData().level
	slot3 = {}
	slot4 = {}

	for slot8, slot9 in ipairs(slot0.furnitures) do
		if slot4[tonumber(slot9.id)] then
			slot4[tonumber(slot9.id)].count = slot4[tonumber(slot9.id)].count + 1
		else
			slot4[tonumber(slot9.id)] = {
				count = 1,
				id = tonumber(slot9.id)
			}
		end
	end

	table.insert({}, {
		floor = 1,
		furniture_put_list = slot1.furniture_put_list or {}
	})

	return GetBackYardDataCommand.initFurnitures({
		lv = slot2,
		furniture_id_list = _.values(slot4),
		furniture_put_list = slot5
	})
end

function slot0.bindConfigTable(slot0)
	return pg.backyard_theme_template
end

function slot0.isUnLock(slot0, slot1)
	return slot0:getConfig("deblocking") <= slot1.level
end

function slot0.isBought(slot0, slot1)
	if slot0.type == slot0.TYPE_SYSTEM then
		slot5 = "ids"

		for slot5, slot6 in pairs(slot0:getConfig(slot5)) do
			if not slot1[slot6] then
				return false
			end
		end
	end

	return true
end

function slot0.getRemainFurIds(slot0, slot1)
	slot2 = {}
	slot6 = "ids"

	for slot6, slot7 in pairs(slot0:getConfig(slot6)) do
		if not slot1[slot7] and Furniture.New({
			id = slot7
		}):inTime() then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot0.getSystemThemeFurnitures(slot0, slot1)
	pcall(function ()
		uv0 = require("GameCfg.backyardTheme.theme_" .. uv1.id)
	end)

	return _.select((nil or require("GameCfg.backyardTheme.theme_empty"))["furnitures_" .. slot1] or {}, function (slot0)
		return pg.furniture_data_template[slot0.id]
	end)
end

function slot0.isOccupyed(slot0, slot1, slot2)
	for slot7, slot8 in pairs(slot0.furnitruesByIds) do
		if slot1[slot8.id] and slot9.floor ~= 0 and slot9.floor ~= slot2 then
			return true
		end
	end

	return false
end

function slot0.getUsableFurnituresForFloor(slot0, slot1, slot2)
	slot3 = {}
	slot4 = {
		[slot9.id] = slot9
	}

	for slot8, slot9 in pairs(slot1) do
		if slot9.floor ~= slot2 then
			-- Nothing
		end
	end

	slot7 = {}

	for slot11, slot12 in pairs(slot0.furnitruesByIds) do
		if slot4[slot12.id] then
			table.insert({}, slot12.id)

			for slot17, slot18 in pairs(slot12.child) do
				table.insert(slot6, slot17)
			end

			if tonumber(slot12.parent) ~= 0 then
				table.insert(slot6, tonumber(slot12.parent))

				for slot18, slot19 in pairs(slot5[tonumber(slot12.parent)].child) do
					table.insert(slot6, slot18)
				end
			end
		else
			table.insert(slot7, slot12.id)
		end
	end

	for slot11, slot12 in ipairs(slot7) do
		if not table.contains(slot6, slot12) then
			table.insert(slot3, slot5[slot12])
		end
	end

	return slot3
end

function slot0.IsUsing(slot0, slot1)
	function slot3(slot0)
		slot1 = {}

		for slot5, slot6 in pairs(uv0) do
			if slot6:getConfig("id") == slot0 then
				table.insert(slot1, slot6)
			end
		end

		return slot1
	end

	if table.getCount(slot1) ~= table.getCount(slot0.furnitures) then
		return false
	end

	for slot7, slot8 in pairs(slot2) do
		if not slot1[slot8.id] then
			return false
		elseif not slot9:isPaper() then
			if not slot9.position then
				return false
			end

			slot11 = false

			for slot15, slot16 in ipairs(slot3(slot8.id)) do
				if slot16:isSame(slot8) then
					slot11 = true

					break
				end
			end

			if not slot11 then
				return false
			end
		end
	end

	return true
end

function slot0.isUsing(slot0, slot1)
	if slot1.wallPaper then
		Clone(slot1.furnitures)[slot1.wallPaper.id] = slot1.wallPaper
	end

	if slot1.floorPaper then
		slot2[slot1.floorPaper.id] = slot1.floorPaper
	end

	return slot0:IsUsing(slot2)
end

function slot0.getName(slot0)
	if slot0.type == slot0.TYPE_SYSTEM then
		return slot0:getConfig("name")
	end

	return slot0.name
end

function slot0.getIcon(slot0)
	if slot0.type == slot0.TYPE_SYSTEM then
		return slot0:getConfig("icon")
	else
		return "themeicon"
	end
end

function slot0.isOverTime(slot0)
	if slot0.type == slot0.TYPE_SYSTEM then
		return _.all(slot0:getConfig("ids"), function (slot0)
			return not Furniture.New({
				id = slot0
			}):IsShopType() or not slot1:inTime()
		end)
	end
end

function slot0.getDesc(slot0)
	if slot0.type == slot0.TYPE_SYSTEM then
		return slot0:getConfig("desc")
	elseif slot0.type == slot0.TYPE_USER then
		return ""
	end
end

function slot0.isMatchSearchKey(slot0, slot1)
	if not slot1 or slot1 == "" then
		return true
	end

	if string.find(slot0:getDesc(), slot1) or string.find(slot0:getName(), slot1) then
		return true
	end

	return false
end

function slot0.GetDisCount(slot0)
	if not pg.TimeMgr.GetInstance():inTime(slot0:getConfig("discount_time")) then
		return 0
	end

	return slot0:getConfig("discount")
end

return slot0
