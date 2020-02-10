slot0 = class("FriendMediator", import("..base.ContextMediator"))
slot0.SEARCH_FRIEND = "FriendMediator:SEARCH_FRIEND"
slot0.ADD_FRIEND = "FriendMediator:ADD_FRIEND"
slot0.ACCEPT_REQUEST = "FriendMediator:ACCEPT_REQUEST"
slot0.REFUSE_REQUEST = "FriendMediator:REFUSE_REQUEST"
slot0.DELETE_FRIEND = "FriendMediator:DELETE_FRIEND"
slot0.OPEN_RESUME = "FriendMediator:OPEN_RESUME"
slot0.OPEN_RESUME_BY_VO = "FriendMediator:OPEN_RESUME_BY_VO"
slot0.REFUSE_ALL_REQUEST = "FriendMediator:REFUSE_ALL_REQUEST"
slot0.OPEN_CHATROOM = "FriendMediator:OPEN_CHATROOM"
slot0.VISIT_BACKYARD = "FriendMediator:VISIT_BACKYRAD"
slot0.RELIEVE_BLACKLIST = "FriendMediator:RELIEVE_BLACKLIST"
slot0.GET_BLACK_LIST = "FriendMediator:GET_BLACK_LIST"

function slot0.register(slot0)
	slot1 = getProxy(FriendProxy)

	slot0.viewComponent:setFriendVOs(slot1:getAllFriends())
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
	slot0.viewComponent:setRequests(getProxy(NotificationProxy):getRequests())
	slot0.viewComponent:setBlackList(slot1:getBlackList())
	slot0:bind(uv0.GET_BLACK_LIST, function (slot0)
		uv0:sendNotification(GAME.GET_BLACK_LIST)
	end)
	slot0:bind(uv0.SEARCH_FRIEND, function (slot0, slot1, slot2)
		slot6.type = slot1
		slot6.keyword = slot2

		uv0:sendNotification(GAME.FRIEND_SEARCH, {})
	end)
	slot0:bind(uv0.OPEN_CHATROOM, function (slot0, slot1)
		slot5.mediator = ChatRoomMediator
		slot5.viewComponent = ChatRoomLayer
		slot6.friendVO = slot1
		slot5.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.ADD_FRIEND, function (slot0, slot1, slot2)
		slot6.id = slot1
		slot6.msg = slot2

		uv0:sendNotification(GAME.FRIEND_SEND_REQUEST, {})
	end)
	slot0:bind(uv0.ACCEPT_REQUEST, function (slot0, slot1)
		uv0:sendNotification(GAME.FRIEND_ACCEPT_REQUEST, slot1)
	end)
	slot0:bind(uv0.REFUSE_ALL_REQUEST, function (slot0)
		uv0:sendNotification(GAME.FRIEND_REJECT_REQUEST, 0)
	end)
	slot0:bind(uv0.REFUSE_REQUEST, function (slot0, slot1, slot2)
		uv0:sendNotification(GAME.FRIEND_REJECT_REQUEST, slot1.id)

		if slot2 then
			uv0:sendNotification(GAME.FRIEND_ADD_BLACKLIST, slot1)
		end
	end)
	slot0:bind(uv0.DELETE_FRIEND, function (slot0, slot1)
		uv0:sendNotification(GAME.FRIEND_DELETE, slot1)
	end)
	slot0:bind(uv0.OPEN_RESUME, function (slot0, slot1)
		slot5.type = SearchFriendCommand.SEARCH_TYPE_RESUME
		slot5.keyword = slot1

		uv0:sendNotification(GAME.FRIEND_SEARCH, {})
	end)
	slot0:bind(uv0.OPEN_RESUME_BY_VO, function (slot0, slot1)
		uv0:openResume(slot1)
	end)
	slot0:bind(uv0.VISIT_BACKYARD, function (slot0, slot1)
		uv0:sendNotification(GAME.VISIT_BACKYARD, slot1)
	end)
	slot0:bind(uv0.RELIEVE_BLACKLIST, function (slot0, slot1)
		uv0:sendNotification(GAME.FRIEND_RELIEVE_BLACKLIST, slot1)
	end)
	slot0:updateChatNotification()
end

function slot0.updateChatNotification(slot0)
	slot0.viewComponent:updateChatNotification(getProxy(FriendProxy):getNewMsgCount())
end

function slot0.openResume(slot0, slot1)
	slot5.mediator = resumeMediator
	slot5.viewComponent = resumeLayer
	slot6.player = slot1
	slot5.data = {}

	slot0:addSubLayers(Context.New({}))
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.FRIEND_SEARCH_DONE
	slot1[2] = GAME.FRIEND_SEND_REQUEST_DONE
	slot1[3] = NotificationProxy.FRIEND_REQUEST_REMOVED
	slot1[4] = NotificationProxy.FRIEND_REQUEST_ADDED
	slot1[5] = FriendProxy.FRIEND_REMOVED
	slot1[6] = FriendProxy.FRIEND_ADDED
	slot1[7] = FriendProxy.FRIEND_UPDATED
	slot1[8] = GAME.VISIT_BACKYARD_DONE
	slot1[9] = GAME.FRIEND_RELIEVE_BLACKLIST_DONE
	slot1[10] = FriendProxy.RELIEVE_BLACKLIST
	slot1[11] = FriendProxy.BLACK_LIST_UPDATED
	slot1[12] = FriendProxy.ADD_INTO_BLACKLIST

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.FRIEND_SEARCH_DONE then
		if slot3.type == SearchFriendCommand.SEARCH_TYPE_RESUME then
			slot0:openResume(slot3.list[1])
		else
			slot0.viewComponent:setSearchResult(slot3.list)
			slot0.viewComponent:updatePage(FriendScene.SEARCH_PAGE)

			if table.getCount(slot3.list) > 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("friend_search_succeed"))
			end
		end
	elseif slot2 == GAME.FRIEND_SEND_REQUEST_DONE then
		slot0.viewComponent:removeSearchResult(slot3)
		slot0.viewComponent:updatePage(FriendScene.SEARCH_PAGE)
	elseif slot2 == NotificationProxy.FRIEND_REQUEST_REMOVED or slot2 == NotificationProxy.FRIEND_REQUEST_ADDED then
		slot0.viewComponent:setRequests(getProxy(NotificationProxy):getRequests())
		slot0.viewComponent:updatePage(FriendScene.REQUEST_PAGE)
		slot0.viewComponent:updateRequestTip()
	elseif slot2 == FriendProxy.FRIEND_REMOVED or slot2 == FriendProxy.FRIEND_ADDED or slot2 == FriendProxy.FRIEND_UPDATED then
		slot0.viewComponent:setFriendVOs(getProxy(FriendProxy):getAllFriends())
		slot0.viewComponent:updatePage(FriendScene.FRIEND_PAGE)

		if slot2 == FriendProxy.FRIEND_UPDATED then
			slot0:updateChatNotification()
		end
	elseif slot2 == FriendProxy.RELIEVE_BLACKLIST or slot2 == FriendProxy.BLACK_LIST_UPDATED or slot2 == FriendProxy.ADD_INTO_BLACKLIST then
		slot0.viewComponent:setBlackList(getProxy(FriendProxy):getBlackList())
		slot0.viewComponent:updatePage(FriendScene.BLACKLIST_PAGE)
	elseif slot2 == GAME.VISIT_BACKYARD_DONE then
		slot8.ships = slot3.ships
		slot8.player = slot3.player
		slot8.dorm = slot3.dorm
		slot8.mode = BackYardConst.MODE_VISIT

		slot0:sendNotification(GAME.GO_SCENE, SCENE.BACKYARD, {})
	end
end

return slot0
