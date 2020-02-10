slot0 = class("NotificationMediator", import("..base.ContextMediator"))
slot0.ON_SEND_PUBLIC = "NotificationMediator:ON_SEND_PUBLIC"
slot0.CHANGE_ROOM = "NotificationMediator:CHANGE_ROOM"
slot0.OPEN_INFO = "NotificationMediator:OPEN_INFO"
slot0.OPEN_EMOJI = "NotificationMediator:OPEN_EMOJI"
slot0.BATTLE_CHAT_CLOSE = "NotificationMediator:BATTLE_CHAT_CLOSE"

function slot0.register(slot0)
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getRawData())

	slot4 = slot0.viewComponent

	slot4.setInGuild(slot4, getProxy(GuildProxy):getRawData() ~= nil)
	slot0.viewComponent:setMessages(slot0:getAllMessages())
	slot0:bind(uv0.ON_SEND_PUBLIC, function (slot0, slot1, slot2)
		slot3 = slot2:match("^$ (%S+)")

		if slot2:match("$ pushTest") then
			for slot9, slot10 in slot2:gmatch("%S+") do
				table.insert({}, slot9)
			end

			pg.PushNotificationMgr.GetInstance():Push(slot5[3], slot5[4], os.time() + slot5[5])
		elseif slot3 then
			for slot9, slot10 in slot2:gmatch("%s+(%S+)") do
				table.insert({}, slot9)
			end

			slot9.cmd = slot5[1]
			slot9.arg1 = slot5[2]
			slot9.arg2 = slot5[3]
			slot9.arg3 = slot5[4]

			uv0:sendNotification(GAME.SEND_CMD, {})
		elseif slot2 == pg.gameset.code_switch.description then
			if getProxy(PlayerProxy):getRawData().level >= 9 then
				HXSet.switchCodeMode()
			end
		else
			slot9 = 0

			for slot13 = #getProxy(ChatProxy):getData(), 1, -1 do
				if slot8[slot13].type == ChatConst.ChannelWorld and slot8[slot13].player.id == getProxy(PlayerProxy):getData().id then
					slot9 = slot8[slot13].timestamp

					break
				end
			end

			if pg.TimeMgr.GetInstance():GetServerTime() < slot6.chatMsgBanTime then
				slot14.content = i18n("chat_msg_ban", os.date("%Y/%m/%d %H:%M:%S", slot6.chatMsgBanTime))

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					hideNo = true
				})
			elseif slot6.level < 10 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("chat_level_not_enough", 10))
			elseif slot10 - slot9 < 10 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("dont_send_message_frequently", 10 - (slot10 - slot9)))
			else
				slot11, slot12 = wordVer(slot2, {
					isReplace = true
				})

				if slot1 == ChatConst.ChannelWorld then
					uv0:sendNotification(GAME.SEND_MSG, slot12)
				elseif slot1 == ChatConst.ChannelGuild then
					uv0:sendNotification(GAME.GUILD_SEND_MSG, slot12)
				end
			end
		end
	end)
	slot0:bind(uv0.CHANGE_ROOM, function (slot0, slot1)
		if slot1 == getProxy(PlayerProxy):getRawData().chatRoomId then
			uv0:onChangeChatRoomDone()
		else
			uv0:sendNotification(GAME.CHANGE_CHAT_ROOM, slot1)
		end
	end)
	slot0:bind(uv0.BATTLE_CHAT_CLOSE, function (slot0)
		uv0:sendNotification(BattleMediator.CLOSE_CHAT)
	end)
	slot0:bind(uv0.OPEN_INFO, function (slot0, slot1, slot2, slot3)
		if slot1.id == uv0.id then
			return
		end

		uv1.contextData.pos = slot2
		uv1.contextData.msg = slot3
		slot7.type = SearchFriendCommand.SEARCH_TYPE_RESUME
		slot7.keyword = slot1.id

		uv1:sendNotification(GAME.FRIEND_SEARCH, {})
	end)
	slot0:bind(uv0.OPEN_EMOJI, function (slot0, slot1, slot2)
		slot6.viewComponent = EmojiLayer
		slot6.mediator = EmojiMediator
		slot7.callback = slot1
		slot7.pos = slot2
		slot7.LayerWeightMgr_groupName = LayerWeightConst.GROUP_NOTIFICATION

		function slot7.emojiIconCallback(slot0)
			uv0.viewComponent:insertEmojiToInputText(slot0)
		end

		slot6.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.SEND_CMD_DONE
	slot1[2] = ChatProxy.NEW_MSG
	slot1[3] = GAME.CHANGE_CHAT_ROOM_DONE
	slot1[4] = GAME.CHAT_ROOM_MAX_NUMBER
	slot1[5] = GAME.FRIEND_SEARCH_DONE
	slot1[6] = GAME.FINISH_STAGE
	slot1[7] = FriendProxy.FRIEND_NEW_MSG
	slot1[8] = GuildProxy.NEW_MSG_ADDED

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == ChatProxy.NEW_MSG or slot2 == FriendProxy.FRIEND_NEW_MSG or slot2 == GuildProxy.NEW_MSG_ADDED then
		slot4 = slot0.viewComponent.messages

		table.insert(slot4, slot3)
		slot0.viewComponent:setMessages(slot4)

		slot6 = getProxy(PlayerProxy):getRawData()

		if NotificationLayer.ChannelBits.recv == bit.lshift(1, ChatConst.ChannelAll) or bit.band(slot7, bit.lshift(1, slot3.type)) > 0 then
			table.insert(slot0.viewComponent.filteredMessages, slot3)
			slot0.viewComponent:append(slot3, -1, true)
		elseif slot3.player and slot3.player.id == slot6.id then
			slot0.viewComponent.recvTypes:each(function (slot0, slot1)
				if ChatConst.RecvChannels[slot0 + 1] == uv0.type then
					triggerButton(slot1)
				end
			end)
		end
	elseif slot2 == GAME.SEND_CMD_DONE then
		print(slot3)

		if string.find(slot3, "CMD:into") then
			slot0.viewComponent:closeView()
		end
	elseif slot2 == GAME.CHANGE_CHAT_ROOM_DONE then
		slot0:onChangeChatRoomDone(slot3)
	elseif slot2 == GAME.CHAT_ROOM_MAX_NUMBER then
		pg.TipsMgr.GetInstance():ShowTips(i18n("main_notificationMediator_room_max_number"))
	elseif slot2 == GAME.FRIEND_SEARCH_DONE then
		if slot3.list[1] then
			slot7.viewComponent = FriendInfoLayer
			slot7.mediator = FriendInfoMediator
			slot8.friend = slot3.list[1]
			slot8.pos = slot0.contextData.pos
			slot8.msg = slot0.contextData.msg
			slot8.form = slot0.contextData.form
			slot8.parent = slot0.contextData.chatViewParent
			slot8.LayerWeightMgr_groupName = LayerWeightConst.GROUP_NOTIFICATION
			slot7.data = {}

			slot0:addSubLayers(Context.New({}))

			slot0.contextData.pos = nil
			slot0.contextData.msg = nil
		end
	elseif slot2 == GAME.FINISH_STAGE then
		slot0.viewComponent:closeView()
	end
end

function slot0.getAllMessages(slot0)
	slot1 = {}

	_.each(getProxy(ChatProxy):getRawData(), function (slot0)
		table.insert(uv0, slot0)
	end)

	slot3 = getProxy(GuildProxy)

	if slot3:getRawData() then
		_.each(slot3:getChatMsgs(), function (slot0)
			table.insert(uv0, slot0)
		end)
	end

	_.each(getProxy(FriendProxy):getCacheMsgList(), function (slot0)
		table.insert(uv0, slot0)
	end)

	return _(slot1):chain():filter(function (slot0)
		return not uv0:isInBlackList(slot0.playerId)
	end):sort(function (slot0, slot1)
		return slot0.timestamp < slot1.timestamp
	end):value()
end

function slot0.onChangeChatRoomDone(slot0, slot1)
	if slot0.viewComponent.tempRoomSendBits then
		NotificationLayer.ChannelBits.send = slot0.viewComponent.tempRoomSendBits
	end

	if slot0.viewComponent.tempRoomRecvBits then
		NotificationLayer.ChannelBits.recv = slot0.viewComponent.tempRoomRecvBits
	end

	slot0.viewComponent:closeChangeRoomPanel()
	slot0.viewComponent:setMessages(slot0:getAllMessages())
	slot0.viewComponent:updateChatChannel()
	slot0.viewComponent:updateFilter()
	slot0.viewComponent:updateAll()

	if slot1 then
		slot0.viewComponent:setPlayer(slot1)
		slot0.viewComponent:updateRoom()
	end
end

return slot0
