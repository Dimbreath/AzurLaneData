slot0 = class("FriendProxy", import(".NetProxy"))
slot0.FRIEND_ADDED = "FriendProxy friend added"
slot0.FRIEND_REMOVED = "FriendProxy friend removed"
slot0.FRIEND_NEW_MSG = "FriendProxy friend new msg"
slot0.FRIEND_UPDATED = "FriendProxy friend updated"
slot0.RELIEVE_BLACKLIST = "FriendProxy relieve blacklist"
slot0.ADD_INTO_BLACKLIST = "FriendProxy add into blacklist"
slot0.BLACK_LIST_UPDATED = "FriendProxy black list updated"

slot0.register = function (slot0)
	slot0:on(50000, function (slot0)
		slot0.data = {}

		for slot4, slot5 in ipairs(slot0.friend_list) do
			slot0.data[Friend.New(slot5).id] = {
				player = Friend.New(slot5),
				cacheMsgs = {}
			}
		end
	end)
	slot0:on(50008, function (slot0)
		if not slot0.data[Friend.New(slot0.player).id] then
			slot0:addFriend(slot1)
		else
			slot0:updateFriend(slot1)
		end
	end)
	slot0:on(50013, function (slot0)
		slot0:removeFriend(slot0.id)
	end)
	slot0:on(50104, function (slot0)
		slot1 = ChatMsg.New(ChatConst.ChannelFriend, {
			player = Player.New(slot0.msg.player),
			content = slot0.msg.content,
			timestamp = slot0.msg.timestamp
		})

		slot0:addChatMsg(slot1.playerId, slot1)

		slot2 = slot0:getFriend(slot1.playerId)

		slot2:increaseUnreadCount()
		slot0:updateFriend(slot2)
	end)
end

slot0.removeFriend = function (slot0, slot1)
	if slot0.data[slot1] then
		slot0.data[slot1] = nil

		slot0:sendNotification(slot0.FRIEND_REMOVED, slot2.player)
	else
		print("不存在的好友: " .. data.id)
	end
end

slot0.getAllFriends = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.data) do
		table.insert(slot1, slot6.player)
	end

	return Clone(slot1)
end

slot0.getAllCacheMsg = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.data) do
		slot1[slot6.player.id] = slot6.cacheMsgs
	end

	return Clone(slot1)
end

slot0.getCacheMsgList = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.data) do
		underscore.each(slot6.cacheMsgs, function (slot0)
			table.insert(slot0, slot0)
		end)
	end

	return slot1
end

slot0.getFriend = function (slot0, slot1)
	if slot0.data[slot1] then
		return slot0.data[slot1].player:clone(), slot0.data[slot1].cacheMsgs
	end
end

slot0.addChatMsg = function (slot0, slot1, slot2)
	if slot0.data[slot1] then
		slot3, slot7 = wordVer(slot2.content, {
			isReplace = true
		})

		string.gsub(slot4, ChatConst.EmojiCodeMatch, function (slot0)
			slot0 = tonumber(slot0)
		end)

		if nil then
			if pg.emoji_template[slot5] then
				slot4 = slot6.desc
			else
				slot5 = nil
			end
		end

		slot2.content = slot4
		slot2.emojiId = slot5

		table.insert(slot0.data[slot1].cacheMsgs, slot2)
		slot2:display("added")
		slot0:sendNotification(slot0.FRIEND_NEW_MSG, slot2)
	end
end

slot0.addFriend = function (slot0, slot1)
	slot1:display("added")

	slot0.data[slot1.id] = {
		player = slot1,
		cacheMsgs = {}
	}

	slot0:sendNotification(slot0.FRIEND_ADDED, slot1:clone())
end

slot0.updateFriend = function (slot0, slot1)
	slot0.data[slot1.id].player = slot1

	slot0:sendNotification(slot0.FRIEND_UPDATED, slot1:clone())
end

slot0.isFriend = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0.data) do
		if slot5 == slot1 then
			return true
		end
	end

	return false
end

slot0.getFriendCount = function (slot0)
	return table.getCount(slot0.data or {})
end

slot0.getNewMsgCount = function (slot0)
	slot1 = 0

	for slot5, slot6 in pairs(slot0.data) do
		if slot6.player.unreadCount > 0 then
			slot1 = slot1 + 1
		end
	end

	return slot1
end

slot0.setBlackList = function (slot0, slot1)
	slot0.blackList = slot1

	slot0:sendNotification(slot0.BLACK_LIST_UPDATED, Clone(slot1))
end

slot0.getBlackList = function (slot0)
	return Clone(slot0.blackList)
end

slot0.relieveBlackListById = function (slot0, slot1)
	slot0.blackList[slot1] = nil

	slot0:sendNotification(slot0.RELIEVE_BLACKLIST, slot1)
end

slot0.getBlackPlayerById = function (slot0, slot1)
	return slot0.blackList and Clone(slot0.blackList[slot1])
end

slot0.addIntoBlackList = function (slot0, slot1)
	if slot0.blackList then
		slot0.blackList[slot1.id] = slot1

		slot0:sendNotification(slot0.ADD_INTO_BLACKLIST, Clone(slot1))
	end
end

slot0.isInBlackList = function (slot0, slot1)
	if slot0.blackList then
		return slot0.blackList[slot1]
	end
end

return slot0
