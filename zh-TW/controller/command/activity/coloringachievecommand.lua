slot0 = class("ColoringAchieveCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot8.act_id = slot2.activityId
	slot8.id = slot2.id

	pg.ConnectionMgr.GetInstance():Send(26002, {}, 26003, function (slot0)
		if slot0.result == 0 then
			slot1 = _.map(slot0.drop_list, function (slot0)
				slot1.type = slot0.type
				slot1.id = slot0.id
				slot1.count = slot0.number

				if ({})["type"] ~= DROP_TYPE_SHIP then
					uv0:sendNotification(GAME.ADD_ITEM, Item.New(slot1))
				end

				return slot1
			end)
			slot2 = getProxy(ColoringProxy)
			slot3 = slot2:getColorGroups()
			slot4 = slot2:getColorGroup(uv1)

			slot4:setDrops(slot1)
			slot4:setState(ColorGroup.StateAchieved)
			slot2:checkState()

			slot8.drops = slot1

			uv0:sendNotification(GAME.COLORING_ACHIEVE_DONE, {})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("coloring_achieve", slot0.result))
		end
	end)
end

return slot0
