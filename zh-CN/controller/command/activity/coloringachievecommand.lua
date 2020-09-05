slot0 = class("ColoringAchieveCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(26002, {
		act_id = slot2.activityId,
		id = slot2.id
	}, 26003, function (slot0)
		if slot0.result == 0 then
			slot1 = _.map(slot0.drop_list, function (slot0)
				if ({
					type = slot0.type,
					id = slot0.id,
					count = slot0.number
				}).type ~= DROP_TYPE_SHIP then
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
			uv0:sendNotification(GAME.COLORING_ACHIEVE_DONE, {
				drops = slot1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("coloring_achieve", slot0.result))
		end
	end)
end

return slot0
