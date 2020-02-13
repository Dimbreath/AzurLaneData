class("ActivityBeUpdatedCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().isInit

	if slot1.getBody().activity.getConfig(slot3, "type") == ActivityConst.ACTIVITY_TYPE_VOTE and slot3:getConfig("config_id") ~= 6 then
		slot8 = getProxy(ActivityProxy):GetVoteBookActivty().data1 < pg.gameset.order_pt_max.description[2]

		getProxy(VoteProxy).SetOrderBook(slot10, slot9)
		slot0:sendNotification(GAME.VOTE_BOOK_BE_UPDATED_DONE)
	elseif slot3:getConfig("type") == ActivityConst.ACTIVITY_TYPE_INSTAGRAM and slot3:CanBeActivated() then
		getProxy(ActivityProxy):AddInstagramTimer(slot3.id)
	end
end

return class("ActivityBeUpdatedCommand", pm.SimpleCommand)
