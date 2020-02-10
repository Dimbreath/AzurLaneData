slot0 = class("ActivityNewPtOPCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if not getProxy(ActivityProxy):getActivityById(slot1:getBody().activity_id) or slot4:isEnd() then
		return
	end

	slot5 = pg.ConnectionMgr.GetInstance()
	slot8.activity_id = slot2.activity_id
	slot8.cmd = slot2.cmd or 0
	slot8.arg1 = slot2.arg1 or 0
	slot8.arg2 = slot2.arg2 or 0

	slot5.Send(slot5, 11202, {}, 11203, function (slot0)
		if slot0.result == 0 then
			slot1 = {}

			if uv0.cmd == 1 then
				for slot5 = #PlayerConst.tranOwnShipSkin(slot0.award_list), 1, -1 do
					if slot1[slot5].type ~= DROP_TYPE_SHIP then
						uv1:sendNotification(GAME.ADD_ITEM, slot6)
					end
				end

				table.insert(uv2.data1_list, uv0.arg1)
			elseif uv0.cmd == 2 then
				uv2.data3 = slot0.number[1]
			end

			uv3:updateActivity(uv2)

			slot5.awards = slot1

			uv1:sendNotification(GAME.ACT_NEW_PT_DONE, {})
		else
			print(errorTip("", slot0.result))
		end
	end)
end

return slot0
