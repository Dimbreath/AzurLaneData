class("UpdateStoryCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().storyId

	if not pg.ConnectionMgr.GetInstance():getConnection() or not pg.ConnectionMgr.GetInstance():isConnected() then
		return
	end

	slot4 = 0
	slot5 = 0

	if getProxy(PlayerProxy) then
		slot4 = (type(slot3) == "number" and slot3) or slot6:getData():getStoryIndexID(slot3)

		if slot4 > 0 then
			slot7:addStory(slot4)
			slot6:updatePlayer(slot7)
		end

		if slot7:getStoryIndexAgainID(slot3) > 0 then
			slot7:addStoryAgain(slot5)
			slot6:updatePlayer(slot7)
		end
	end

	if slot4 > 0 then
		pg.ConnectionMgr.GetInstance():Send(11017, {
			story_id = slot4
		}, 11018, function (slot0)
			return
		end)
	end

	if slot5 > 0 then
		pg.ConnectionMgr.GetInstance():Send(11017, {
			story_id = slot5
		}, 11018, function (slot0)
			return
		end)
	end
end

return class("UpdateStoryCommand", pm.SimpleCommand)
