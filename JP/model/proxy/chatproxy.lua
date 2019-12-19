slot0 = class("ChatProxy", import(".NetProxy"))
slot0.NEW_MSG = "ChatProxy public msg"

function slot0.InjectPublic(slot0, slot1)
	if slot1.id == 0 then
		slot0.text = (slot1.args[1] and slot1.args[1].string) or ""

		return
	end

	slot2 = i18n("ad_" .. slot1.id)

	for slot6 = 1, #slot1.args, 1 do
		slot8 = nil

		if slot1.args[slot6].type == PublicArg.TypePlayerName then
			slot8 = slot7.string
		elseif slot7.type == PublicArg.TypeShipId then
			slot0:AddSprite(slot10, slot11)

			slot2 = string.gsub(slot2, "shipcolor" .. slot6, ShipRarity.Rarity2HexColor(pg.ship_data_statistics[slot7.int].rarity))
			slot8 = pg.ship_data_statistics[slot7.int].name

			if pg.ship_data_statistics[slot7.int].rarity == ShipRarity.SSR then
				slot8 = ShipRarity.SSRGradient(slot8)
			end
		else
			slot2 = string.gsub(slot2, "$" .. slot6, (slot7.type ~= PublicArg.TypeEquipId or pg.equip_data_statistics[slot7.int].name) and (slot7.type ~= PublicArg.TypeItemId or pg.item_data_statistics[slot7.int].name) and (slot7.type ~= PublicArg.TypeNums or slot7.int) and slot7.string)
		end
	end

	slot0.text = slot2
end

function slot0.register(slot0)
	slot0:on(50101, function (slot0)
		if slot0.type == ChatConst.CODE_BANED then
			pg.TipsMgr.GetInstance():ShowTips(slot0.content)
		elseif slot0.type == ChatConst.CODE_GUILDBOSS_OPEN then
			slot0:sendNotification(GAME.BOSS_EVENT_START)
		elseif slot0.type == ChatConst.CODE_ACTOBSS_MSG_WORD then
			slot0:sendNotification(GAME.ACTIVITY_BOSS_MSG_ADDED, {
				name = slot0.player.name,
				score = slot0.content
			})
			table.insert(slot0.actBossMsg, )

			if #slot0.actBossMsg > 6 then
				table.remove(slot0.actBossMsg, 1)
			end
		else
			slot1, slot5 = wordVer(slot0.content, {
				isReplace = true
			})

			string.gsub(slot2, ChatConst.EmojiCodeMatch, function (slot0)
				slot0 = tonumber(slot0)
			end)

			if nil then
				if pg.emoji_template[slot3] then
					slot2 = slot4.desc
				else
					slot3 = nil
				end
			end

			slot0:addNewMsg(ChatMsg.New(ChatConst.ChannelWorld, {
				player = Player.New(slot0.player),
				content = slot2,
				emojiId = slot3,
				timestamp = pg.TimeMgr.GetInstance():GetServerTime()
			}))
		end
	end)
	slot0:on(50103, function (slot0)
		slot1 = {}

		for slot5, slot6 in ipairs(slot0.arg_list) do
			table.insert(slot1, PublicArg.New(slot6))
		end

		slot0:addNewMsg(ChatMsg.New(ChatConst.ChannelPublic, {
			id = slot0.ad_id,
			args = slot1,
			timestamp = pg.TimeMgr.GetInstance():GetServerTime()
		}))
	end)

	slot0.informs = {}
	slot0.actBossMsg = {}
end

function slot0.addNewMsg(slot0, slot1)
	if slot1.id == 0 then
		slot0.top = slot1

		_.each(slot1.args, function (slot0)
			if slot0.string then
				pg.TipsMgr.GetInstance():ShowTips(slot0.string)
			end
		end)
	else
		table.insert(slot0.data, slot1)

		if #slot0.data > 100 then
			table.remove(slot0.data, 1)
		end
	end

	slot0:sendNotification(slot0.NEW_MSG, slot1)
end

function slot0.clearMsg(slot0)
	slot0.data = {}
end

function slot0.loadUsedEmoji(slot0)
	slot0.usedEmoji = {}

	if #string.split(PlayerPrefs.GetString(ChatConst.EMOJI_SAVE_TAG .. getProxy(PlayerProxy):getRawData().id) or "", ":") > 0 then
		_.each(slot2, function (slot0)
			if #string.split(slot0, "|") == 2 then
				slot0.usedEmoji[tonumber(slot1[1])] = tonumber(slot1[2])
			end
		end)
	end
end

function slot0.saveUsedEmoji(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.usedEmoji) do
		table.insert(slot1, slot5 .. "|" .. slot6)
	end

	PlayerPrefs.SetString(ChatConst.EMOJI_SAVE_TAG .. slot2, table.concat(slot1, ":"))
end

function slot0.getUsedEmoji(slot0)
	if not slot0.usedEmoji then
		slot0:loadUsedEmoji()
	end

	return slot0.usedEmoji
end

function slot0.addUsedEmoji(slot0, slot1)
	slot2[slot1] = (slot0:getUsedEmoji()[slot1] or 0) + 1

	slot0:saveUsedEmoji()
end

function slot0.loadUsedEmojiIcon(slot0)
	slot0.usedEmojiIcon = {}

	for slot4 = 1, 6, 1 do
		slot0.usedEmojiIcon[slot4] = pg.emoji_small_template.all[slot4]
	end

	if #string.split(PlayerPrefs.GetString(ChatConst.EMOJI_ICON_SAVE_TAG .. getProxy(PlayerProxy):getRawData().id) or "", ":") > 0 then
		for slot6, slot7 in ipairs(slot2) do
			slot0.usedEmojiIcon[slot6] = tonumber(slot7)
		end
	end
end

function slot0.saveUsedEmojiIcon(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.usedEmojiIcon) do
		table.insert(slot1, slot6)
	end

	PlayerPrefs.SetString(ChatConst.EMOJI_ICON_SAVE_TAG .. slot2, table.concat(slot1, ":"))
end

function slot0.getUsedEmojiIcon(slot0)
	if not slot0.usedEmojiIcon then
		slot0:loadUsedEmojiIcon()
	end

	return slot0.usedEmojiIcon
end

function slot0.addUsedEmojiIcon(slot0, slot1)
	if table.indexof(slot0:getUsedEmojiIcon(), slot1, 1) then
		table.remove(slot2, slot3)
	else
		table.remove(slot2, #slot2)
	end

	table.insert(slot2, 1, slot1)
	slot0:saveUsedEmojiIcon()
end

return slot0
