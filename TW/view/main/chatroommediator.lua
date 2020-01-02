slot0 = class("ChatRoomMediator", import("..base.ContextMediator"))
slot0.SEND_FRIEND_MSG = "ChatRoomMediator:SEND_FRIEND_MSG"
slot0.FETCH_FRIEND_MSG = "ChatRoomMediator:FETCH_FRIEND_MSG"
slot0.CLEAR_UNREADCOUNT = "ChatRoomMediator:CLEAR_UNREADCOUNT"
slot0.OPEN_EMOJI = "ChatRoomMediator:OPEN_EMOJI"

function slot0.register(slot0)
	slot0.viewComponent:setPlayer(slot2)
	slot0.viewComponent:setFriendVO(slot3)

	slot0.friendProxy = getProxy(FriendProxy)

	slot0:bind(slot0.SEND_FRIEND_MSG, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.FRIEND_SEND_MSG, {
			playerId = slot1,
			msg = slot2
		})
	end)
	slot0:bind(slot0.FETCH_FRIEND_MSG, function (slot0, slot1)
		slot0:sendNotification(GAME.FRIEND_FETCH_MSG, slot1)
	end)
	slot0:bind(slot0.CLEAR_UNREADCOUNT, function (slot0, slot1)
		if slot0.friendProxy:getFriend(slot1):hasUnreadMsg() then
			slot2:resetUnreadCount()
			slot0.friendProxy:updateFriend(slot2)
		end
	end)
	slot0:bind(slot0.OPEN_EMOJI, function (slot0, slot1, slot2)
		slot0:addSubLayers(Context.New({
			viewComponent = EmojiLayer,
			mediator = EmojiMediator,
			data = {
				callback = slot2,
				pos = slot1,
				LayerWeightMgr_groupName = LayerWeightConst.GROUP_CHATROOM,
				emojiIconCallback = function (slot0)
					slot0.viewComponent:insertEmojiToInputText(slot0)
				end
			}
		}))
	end)
	slot0.viewComponent:setFriends(slot4)
	slot0.viewComponent:setCacheMsgs(slot0.friendProxy:getAllCacheMsg())
end

function slot0.listNotificationInterests(slot0)
	return {
		FriendProxy.FRIEND_NEW_MSG,
		FriendProxy.FRIEND_UPDATED
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == FriendProxy.FRIEND_NEW_MSG then
		slot0.viewComponent:setCacheMsgs(slot0.friendProxy:getAllCacheMsg())
		slot0.viewComponent:appendMsg(slot3)
	elseif slot2 == FriendProxy.FRIEND_UPDATED then
		slot0.viewComponent:updateFriendVO(slot3)
	end
end

return slot0
