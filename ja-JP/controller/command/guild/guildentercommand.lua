slot0 = class("GuildEnterCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = getProxy(GuildProxy)

	if not slot3:getData() or not slot3:getGuildEvent() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(61002, {
		id = slot2.id,
		group_id_list = slot2.group_id_list,
		formation_list = slot2.formation_list,
		friend_id = slot2.friend_id,
		friend_ship_id = slot2.friend_ship_id,
		guild_id = slot4.id
	}, 61003, function (slot0)
		if slot0.result == 0 then
			slot2 = getProxy(ChapterProxy):getGuildChapter()

			slot2:update(slot0.current_guild)

			for slot6, slot7 in pairs(slot2.cells) do
				if ChapterConst.NeedMarkAsLurk(slot7) then
					slot7.trait = ChapterConst.TraitLurk
				end
			end

			slot1:updateGuildChapter(slot2)
			uv0:reduceCount()
			uv1:updateGuildEvent(uv0)
			uv2:sendNotification(GAME.GUILD_ENTER_DONE, slot2)
		else
			if slot0.result == 3 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("sham_enter_error_friend_ship_expired"))

				if getProxy(ChapterProxy):getGuildChapter():getFriendShip() then
					for slot9, slot10 in pairs(getProxy(PlayerProxy).playerGuildAssists) do
						if slot10.ship and slot10.ship.id == slot3.id then
							slot5[slot9] = nil

							break
						end
					end

					slot2:updateFriendShip(nil)
					slot1:updateGuildChapter(slot2)
				end
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("sham_enter_error", slot0.result))
			end

			uv2:sendNotification(GAME.GUIlD_ENTER_ERROR, slot0.result)
		end
	end)
end

return slot0
