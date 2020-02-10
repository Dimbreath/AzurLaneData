slot0 = class("ShamEnterCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot6.id = slot2.id
	slot6.group_id_list = slot2.group_id_list
	slot6.formation_list = slot2.formation_list
	slot6.friend_id = slot2.friend_id
	slot6.friend_ship_id = slot2.friend_ship_id

	pg.ConnectionMgr.GetInstance():Send(23002, {}, 23003, function (slot0)
		if slot0.result == 0 then
			getProxy(ChapterProxy):getShamChapter():update(slot0.current_sham)

			for slot6, slot7 in pairs(slot2.cells) do
				if ChapterConst.NeedMarkAsLurk(slot7) then
					slot7.trait = ChapterConst.TraitLurk
				end
			end

			slot1:updateShamChapter(slot2)
			uv0:sendNotification(GAME.SHAM_ENTER_DONE, slot2)
		else
			if slot0.result == 3 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("sham_enter_error_friend_ship_expired"))

				if getProxy(ChapterProxy):getShamChapter():getFriendShip() then
					for slot9, slot10 in pairs(getProxy(PlayerProxy).playerAssists) do
						if slot10.ship and slot10.ship.id == slot3.id then
							slot5[slot9] = nil

							break
						end
					end

					slot2:updateFriendShip(nil)
					slot1:updateShamChapter(slot2)
				end
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("sham_enter_error", slot0.result))
			end

			uv0:sendNotification(GAME.SHAM_ENTER_ERROR, slot0.result)
		end
	end)
end

return slot0
