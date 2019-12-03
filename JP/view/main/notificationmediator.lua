slot0 = class("NotificationMediator", import("..base.ContextMediator"))
slot0.ON_SEND_PUBLIC = "NotificationMediator:ON_SEND_PUBLIC"
slot0.CHANGE_ROOM = "NotificationMediator:CHANGE_ROOM"
slot0.OPEN_INFO = "NotificationMediator:OPEN_INFO"
slot0.OPEN_EMOJI = "NotificationMediator:OPEN_EMOJI"
slot0.BATTLE_CHAT_CLOSE = "NotificationMediator:BATTLE_CHAT_CLOSE"

slot0.register = function (slot0)
	slot0.viewComponent:setPlayer(slot2)
	slot0.viewComponent:setInGuild(getProxy(GuildProxy):getRawData() ~= nil)
	slot0.viewComponent:setMessages(slot0.viewComponent.setInGuild)
	slot0:bind(slot0.ON_SEND_PUBLIC, function (slot0, slot1, slot2)
		slot3 = slot2:match("^$ (%S+)")

		if slot2:match("$ pushTest") then
			slot5 = {}

			for slot9, slot10 in slot2:gmatch("%S+") do
				table.insert(slot5, slot9)
			end

			pg.PushNotificationMgr.GetInstance():Push(slot5[3], slot5[4], os.time() + slot5[5])
		elseif slot3 then
			slot5 = {}

			for slot9, slot10 in slot2:gmatch("%s+(%S+)") do
				table.insert(slot5, slot9)
			end

			slot0:sendNotification(GAME.SEND_CMD, {
				cmd = slot5[1],
				arg1 = slot5[2],
				arg2 = slot5[3],
				arg3 = slot5[4]
			})
		elseif slot2 == pg.gameset.code_switch.description then
			if getProxy(PlayerProxy).getRawData(slot5).level >= 9 then
				HXSet.switchCodeMode()
			end
		else
			slot6 = getProxy(PlayerProxy).getData(slot5)
			slot9 = 0

			for slot13 = #getProxy(ChatProxy).getData(slot7), 1, -1 do
				if slot8[slot13].type == ChatConst.ChannelWorld and slot8[slot13].player.id == slot6.id then
					slot9 = slot8[slot13].timestamp

					break
				end
			end

			if pg.TimeMgr.GetInstance():GetServerTime() < slot6.chatMsgBanTime then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					hideNo = true,
					content = i18n("chat_msg_ban", os.date("%Y/%m/%d %H:%M:%S", slot6.chatMsgBanTime))
				})
			elseif slot6.level < 10 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("chat_level_not_enough", 10))
			elseif slot10 - slot9 < 10 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("dont_send_message_frequently", 10 - slot10 - slot9))
			else
				slot11, slot12 = wordVer(slot2, {
					isReplace = true
				})

				if slot1 == ChatConst.ChannelWorld then
					slot0:sendNotification(GAME.SEND_MSG, slot12)
				elseif slot1 == ChatConst.ChannelGuild then
					slot0:sendNotification(GAME.GUILD_SEND_MSG, slot12)
				end
			end
		end
	end)
	slot0:bind(slot0.CHANGE_ROOM, function (slot0, slot1)
		if slot1 == getProxy(PlayerProxy).getRawData(slot2).chatRoomId then
			slot0:onChangeChatRoomDone()
		else
			slot0:sendNotification(GAME.CHANGE_CHAT_ROOM, slot1)
		end
	end)
	slot0:bind(slot0.BATTLE_CHAT_CLOSE, function (slot0)
		slot0:sendNotification(BattleMediator.CLOSE_CHAT)
	end)
	slot0:bind(slot0.OPEN_INFO, function (slot0, slot1, slot2, slot3)
		if slot1.id == slot0.id then
			return
		end

		slot1.contextData.pos = slot2
		slot1.contextData.msg = slot3

		slot1:sendNotification(GAME.FRIEND_SEARCH, {
			type = SearchFriendCommand.SEARCH_TYPE_RESUME,
			keyword = slot1.id
		})
	end)
	slot0:bind(slot0.OPEN_EMOJI, function (slot0, slot1, slot2)
		slot0:addSubLayers(Context.New({
			viewComponent = EmojiLayer,
			mediator = EmojiMediator,
			data = {
				callback = slot1,
				pos = slot2,
				LayerWeightMgr_groupName = LayerWeightConst.GROUP_NOTIFICATION
			}
		}), true)
	end)
end

slot0.listNotificationInterests = function (slot0)
	return {
		GAME.SEND_CMD_DONE,
		ChatProxy.NEW_MSG,
		GAME.CHANGE_CHAT_ROOM_DONE,
		GAME.CHAT_ROOM_MAX_NUMBER,
		GAME.FRIEND_SEARCH_DONE,
		GAME.FINISH_STAGE,
		FriendProxy.FRIEND_NEW_MSG,
		GuildProxy.NEW_MSG_ADDED
	}
end

slot0.handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == ChatProxy.NEW_MSG or slot2 == FriendProxy.FRIEND_NEW_MSG or slot2 == GuildProxy.NEW_MSG_ADDED then
		table.insert(slot4, slot3)
		slot0.viewComponent:setMessages(slot4)

		slot6 = getProxy(PlayerProxy).getRawData(slot5)

		if NotificationLayer.ChannelBits.recv == bit.lshift(1, ChatConst.ChannelAll) or bit.band(slot7, bit.lshift(1, slot3.type)) > 0 then
			table.insert(slot0.viewComponent.filteredMessages, slot3)
			slot0.viewComponent:append(slot3, -1, true)
		elseif slot3.player and slot3.player.id == slot6.id then
			slot0.viewComponent.recvTypes:each(function (slot0, slot1)
				if ChatConst.RecvChannels[slot0 + 1] == slot0.type then
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
			slot0:addSubLayers(Context.New({
				viewComponent = FriendInfoLayer,
				mediator = FriendInfoMediator,
				data = {
					friend = slot3.list[1],
					pos = slot0.contextData.pos,
					msg = slot0.contextData.msg,
					form = slot0.contextData.form,
					parent = slot0.contextData.chatViewParent,
					LayerWeightMgr_groupName = LayerWeightConst.GROUP_NOTIFICATION
				}
			}))

			slot0.contextData.pos = nil
			slot0.contextData.msg = nil
		end
	elseif slot2 == GAME.FINISH_STAGE then
		slot0.viewComponent:closeView()
	end
end

slot0.getAllMessages = function (slot0)
	slot1 = {}

	_.each(getProxy(ChatProxy).getRawData(slot2), function (slot0)
		table.insert(slot0, slot0)
	end)

	if getProxy(GuildProxy):getRawData() then
		_.each(slot3:getChatMsgs(), function (slot0)
			table.insert(slot0, slot0)
		end)
	end

	_.each(getProxy(FriendProxy).getCacheMsgList(slot4), function (slot0)
		table.insert(slot0, slot0)
	end)

	return _(slot1):chain():filter(function (slot0)
		return not slot0:isInBlackList(slot0.playerId)
	end):sort(function (slot0, slot1)
		return slot0.timestamp < slot1.timestamp
	end):value()
end

slot0.onChangeChatRoomDone = function (slot0, slot1)
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
