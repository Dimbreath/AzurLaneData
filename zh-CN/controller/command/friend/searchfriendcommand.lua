slot0 = class("SearchFriendCommand", pm.SimpleCommand)
slot0.SEARCH_TYPE_LIST = 1
slot0.SEARCH_TYPE_RESUME = 2
slot0.SEARCH_TYPE_FRIEND = 3

function slot0.execute(slot0, slot1)
	slot3 = slot1:getBody().type
	slot5 = nil
	slot5 = (tonumber(slot1.getBody().keyword and string.gsub(slot4, "^%s*(.-)%s*$", "%1")) and 0) or 1

	if slot3 == slot0.SEARCH_TYPE_LIST then
		pg.ConnectionMgr.GetInstance():Send(50014, {
			type = 0
		}, 50015, function (slot0)
			slot1 = {}

			for slot5, slot6 in ipairs(slot0.player_list) do
				table.insert(slot1, Friend.New(slot6))
			end

			slot0:sendNotification(GAME.FRIEND_SEARCH_DONE, {
				type = slot1,
				list = slot1
			})
		end)
	elseif slot3 == slot0.SEARCH_TYPE_RESUME or slot3 == slot0.SEARCH_TYPE_FRIEND then
		pg.ConnectionMgr.GetInstance():Send(50001, {
			type = slot5,
			keyword = tostring(slot4)
		}, 50002, function (slot0)
			slot1 = {}

			if slot0.result == 0 then
				table.insert(slot1, Friend.New(slot0.player))
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("friend_searchFriend_noPlayer"))
			end

			slot0:sendNotification(GAME.FRIEND_SEARCH_DONE, {
				type = slot1,
				list = slot1
			})
		end)
	end
end

return slot0
