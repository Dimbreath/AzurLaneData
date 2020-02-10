slot0 = class("SearchFriendCommand", pm.SimpleCommand)
slot0.SEARCH_TYPE_LIST = 1
slot0.SEARCH_TYPE_RESUME = 2
slot0.SEARCH_TYPE_FRIEND = 3

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot5 = nil
	slot5 = tonumber(slot2.keyword and string.gsub(slot4, "^%s*(.-)%s*$", "%1")) and 0 or 1

	if slot2.type == uv0.SEARCH_TYPE_LIST then
		pg.ConnectionMgr.GetInstance():Send(50014, {
			type = 0
		}, 50015, function (slot0)
			for slot5, slot6 in ipairs(slot0.player_list) do
				table.insert({}, Friend.New(slot6))
			end

			slot5.type = uv1
			slot5.list = slot1

			uv0:sendNotification(GAME.FRIEND_SEARCH_DONE, {})
		end)
	elseif slot3 == uv0.SEARCH_TYPE_RESUME or slot3 == uv0.SEARCH_TYPE_FRIEND then
		slot9.type = slot5
		slot9.keyword = tostring(slot4)

		pg.ConnectionMgr.GetInstance():Send(50001, {}, 50002, function (slot0)
			if slot0.result == 0 then
				table.insert({}, Friend.New(slot0.player))
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("friend_searchFriend_noPlayer"))
			end

			slot5.type = uv1
			slot5.list = slot1

			uv0:sendNotification(GAME.FRIEND_SEARCH_DONE, {})
		end)
	end
end

return slot0
