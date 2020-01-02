slot0 = class("EventInfo", import(".BaseVO"))
slot0.StateNone = 0
slot0.StateActive = 1
slot0.StateFinish = 2

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1.id
	slot0.template = pg.collection_template[slot0.id]
	slot0.finishTime = slot1.finish_time
	slot0.overTime = slot1.over_time
	slot0.shipIds = slot1.ship_id_list or {}
	slot0.ships = {}
	slot0.state = slot0.StateNone

	if slot0.finishTime == 0 then
		slot0.state = slot0.StateNone
	elseif pg.TimeMgr.GetInstance():GetServerTime() <= slot0.finishTime then
		slot0.state = slot0.StateActive
	else
		slot0.state = slot0.StateFinish
	end
end

function slot0.reachNum(slot0)
	return slot0.template.ship_num <= #slot0.ships
end

function slot0.reachLevel(slot0)
	return #slot0.ships > 0 and _.any(slot0.ships, function (slot0)
		return slot0.template.ship_lv <= slot0.level
	end)
end

function slot0.reachTypes(slot0)
	if table.getCount(slot0.ships) == 0 then
		return false
	end

	slot1 = true

	for slot5, slot6 in ipairs(slot0.ships) do
		if not table.contains(slot0.template.ship_type, slot6:getShipType()) then
			slot1 = false

			break
		end
	end

	return slot1
end

function slot0.getOilConsume(slot0)
	return slot0.template.oil or 0
end

function slot0.updateTime(slot0)
	slot1 = false

	if slot0.state == slot0.StateActive and slot0.finishTime < pg.TimeMgr.GetInstance():GetServerTime() then
		slot0.state = slot0.StateFinish
		slot1 = true
	end

	return slot1
end

function slot0.getTypesStr(slot0)
	slot3 = false

	if #slot0.template.ship_type == #pg.ship_data_by_type.all then
		slot3 = true

		for slot7, slot8 in pairs(slot1.all) do
			if not table.contains(slot2, slot8) then
				slot3 = false

				break
			end
		end
	end

	if slot3 then
		return i18n("event_type_unlimit")
	else
		slot4 = ""

		for slot8, slot9 in ipairs(slot2) do
			slot4 = slot4 .. slot1[slot9].type_name .. ((slot8 == #slot0.template.ship_type and "") or "、")
		end

		return i18n("event_condition_ship_type", slot4)
	end
end

return slot0
