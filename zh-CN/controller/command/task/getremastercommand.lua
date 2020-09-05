slot0 = class("GetRemasterCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(13503, {
		type = 0
	}, 13504, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(ChapterProxy)

			slot1:updateDailyCount()

			slot4 = 2

			if pg.gameset.reactivity_ticket_max.key_value < slot1.remasterTickets + pg.gameset.reactivity_ticket_daily.key_value then
				slot1:updateRemasterTicketsNum(slot3)

				slot4 = slot2 - slot3 == 2 and 0 or 1
			else
				slot1:updateRemasterTicketsNum(slot1.remasterTickets + pg.gameset.reactivity_ticket_daily.key_value)
			end

			uv0:sendNotification(GAME.GET_REMASTER_TICKETS_DONE, {
				{
					type = DROP_TYPE_ITEM,
					id = ITEM_ID_REACT_CHAPTER_TICKET,
					count = slot4
				}
			})
		else
			pg.TipsMgr.GetInstance():ShowTips("领取失败")
		end
	end)
end

return slot0
