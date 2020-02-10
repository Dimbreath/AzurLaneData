slot0 = class("FriendInfoMediator", import("..base.ContextMediator"))
slot0.OPEND_FRIEND = "FriendInfoMediator:OPEND_FRIEND"
slot0.OPEN_RESUME = "FriendInfoMediator:OPEN_RESUME"
slot0.OPEN_BACKYARD = "FriendInfoMediator:OPEN_BACKYARD"
slot0.TOGGLE_BLACK = "FriendInfoMediator:TOGGLE_BLACK"
slot0.INFORM = "FriendInfoMediator:INFORM"

function slot0.register(slot0)
	slot0.viewComponent:setFriend(slot0.contextData.friend)
	slot0:bind(uv0.OPEND_FRIEND, function (slot0)
		slot3.type = MSGBOX_TYPE_INPUT
		slot3.placeholder = i18n("friend_request_msg_placeholder")
		slot3.title = i18n("friend_request_msg_title")
		slot3.parent = uv0.contextData.parent

		function slot3.onYes(slot0)
			slot4.id = uv1.id
			slot4.msg = slot0

			uv0:sendNotification(GAME.FRIEND_SEND_REQUEST, {})
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			onNo = true,
			yesText = "text_apply",
			limit = 20
		})
	end)
	slot0:bind(uv0.OPEN_RESUME, function (slot0)
		slot4.mediator = resumeMediator
		slot4.viewComponent = resumeLayer
		slot5.player = uv1
		slot5.parent = uv0.contextData.parent
		slot5.LayerWeightMgr_groupName = LayerWeightConst.GROUP_NOTIFICATION
		slot4.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(uv0.OPEN_BACKYARD, function (slot0)
		uv0:sendNotification(GAME.VISIT_BACKYARD, uv1.id)
	end)
	slot0:bind(uv0.TOGGLE_BLACK, function (slot0)
		if getProxy(FriendProxy):getBlackPlayerById(uv0.id) ~= nil then
			uv1:sendNotification(GAME.FRIEND_RELIEVE_BLACKLIST, slot2)
		else
			slot6.content = i18n("friend_confirm_add_blacklist", uv0.name)
			slot6.parent = uv1.contextData.parent

			function slot6.onYes()
				uv0:sendNotification(GAME.FRIEND_ADD_BLACKLIST, uv1)
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = false
			})
		end
	end)
	slot0:bind(uv0.INFORM, function (slot0, slot1, slot2, slot3)
		slot7.playerId = slot1
		slot7.info = slot2
		slot7.content = slot3

		uv0:sendNotification(GAME.INFORM, {})
	end)

	if not getProxy(FriendProxy):getBlackList() then
		slot0:sendNotification(GAME.GET_BLACK_LIST)
	end

	slot0.viewComponent:setFriendProxy(slot2)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.VISIT_BACKYARD_DONE
	slot1[2] = GAME.GET_BLACK_LIST_DONE
	slot1[3] = GAME.FRIEND_ADD_BLACKLIST_DONE
	slot1[4] = GAME.FRIEND_RELIEVE_BLACKLIST_DONE
	slot1[5] = GAME.INFORM_DONE
	slot1[6] = GAME.FINISH_STAGE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.VISIT_BACKYARD_DONE then
		slot0.viewComponent:emit(BaseUI.ON_CLOSE)

		slot8.ships = slot3.ships
		slot8.player = slot3.player
		slot8.dorm = slot3.dorm
		slot8.mode = BackYardConst.MODE_VISIT

		slot0:sendNotification(GAME.GO_SCENE, SCENE.BACKYARD, {})
	elseif slot2 == GAME.GET_BLACK_LIST_DONE or slot2 == GAME.FRIEND_ADD_BLACKLIST_DONE or slot2 == GAME.FRIEND_RELIEVE_BLACKLIST_DONE then
		slot0.viewComponent:updateBlack()
	elseif slot2 == GAME.INFORM_DONE then
		slot0.viewComponent:closeInfromPanel()

		slot6.parent = slot0.contextData.parent
		slot6.content = i18n("inform_sueecss_tip")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true
		})
	elseif slot2 == GAME.FINISH_STAGE then
		slot0.viewComponent:closeView()
	end
end

return slot0
