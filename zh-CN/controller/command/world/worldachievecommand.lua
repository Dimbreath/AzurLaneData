slot0 = class("WorldAchieveCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(33602, slot1:getBody(), 33603, function (slot0)
		if slot0.result == 0 then
			for slot5, slot6 in ipairs(slot0.drops) do
				slot7 = Item.New(slot6)

				table.insert({}, slot7)
				uv0:sendNotification(GAME.ADD_ITEM, slot7)
			end

			for slot6, slot7 in ipairs(uv1.list) do
				slot8 = nowWorld:GetMap(slot7.id)

				table.foreachi(slot7.star_list, function (slot0, slot1)
					uv0:SetMapAchieveSuccess(uv1.id, slot1)
				end)
			end

			uv0:sendNotification(GAME.WORLD_ACHIEVE_DONE, {
				list = uv1.list,
				drops = slot1
			})

			return
		end

		pg.TipsMgr.GetInstance():ShowTips(errorTip("world_achieve_error_", slot0.result))
	end)
end

return slot0
