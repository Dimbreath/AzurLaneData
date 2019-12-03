class("ChangePlayerNameCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if not slot1:getBody().name or slot3 == "" then
		return
	end

	if slot3 == getProxy(PlayerProxy).getData(slot4).name then
		pg.TipsMgr.GetInstance():ShowTips(i18n("same_player_name_tip"))

		return
	end

	if not nameValidityCheck(slot3, 4, 14, {
		"spece_illegal_tip",
		"login_newPlayerScene_name_tooShort",
		"login_newPlayerScene_name_tooLong",
		"login_newPlayerScene_invalideName"
	}) then
		return
	end

	if not slot5 then
		return
	end

	slot6, slot7 = slot5:canModifyName()

	if not slot6 then
		pg.TipsMgr.GetInstance():ShowTips(slot7)

		return
	end

	slot9 = getProxy(BagProxy)
	slot10 = nil

	if slot5:getModifyNameComsume()[1] == DROP_TYPE_RESOURCE then
		if slot5:getResById(slot8[2]) < slot8[3] then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

			return
		end

		slot10 = Item.New({
			type = DROP_TYPE_ITEM,
			id = id2ItemId(slot8[2]),
			count = slot8[3]
		})
	elseif slot8[1] == DROP_TYPE_ITEM then
		if not slot9:getItemById(slot8[2]) or slot11.count < slot8[3] then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

			return
		end

		slot10 = Item.New({
			type = DROP_TYPE_ITEM,
			id = slot8[2],
			count = slot8[3]
		})
	else
		return
	end

	slot11 = pg.gameset.player_name_cold_time.key_value

	function slot12()
		pg.ConnectionMgr.GetInstance():Send(11007, {
			name = slot0
		}, 11008, function (slot0)
			if slot0.result == 0 then
				slot0.name = slot0

				slot0:updateModifyNameColdTime(slot1)
				slot0:updatePlayer(slot0)
				slot4:sendNotification(GAME.CONSUME_ITEM, Item.New({
					type = slot5[1],
					id = slot5[2],
					count = slot5[3]
				}))
				slot4:sendNotification(GAME.CHANGE_PLAYER_NAME_DONE)
				pg.TipsMgr.GetInstance():ShowTips(i18n("player_changePlayerName_ok"))
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("player_changePlayerName", slot0.result))

				return
			end
		end)
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("player_name_change_warning", slot10.count, slot10:getConfig("name"), slot3),
		onYes = function ()
			slot0()
		end
	})
end

return class("ChangePlayerNameCommand", pm.SimpleCommand)
