slot0 = class("ReserveCommanderBoxCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = slot1:getBody().count

	if getProxy(CommanderProxy):getBoxUseCnt() == CommanderConst.MAX_GETBOX_CNT then
		pg.TipsMgr.GetInstance():ShowTips(i18n("commander_reserve_count_is_max"))

		return
	end

	slot7 = getProxy(PlayerProxy):getData()

	for slot12 = slot5, slot5 + slot3 - 1, 1 do
		slot8 = 0 + CommanderConst.getBoxComsume(slot12)
	end

	if slot7.gold < slot8 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	slot12.type = slot3

	pg.ConnectionMgr.GetInstance():Send(25018, {}, 25019, function (slot0)
		if slot0.result == 0 then
			slot3.gold = uv1

			uv0:consume({})
			uv2:updatePlayer(uv0)

			for slot5, slot6 in ipairs(slot0.awards) do
				slot8.type = slot6.type
				slot8.id = slot6.id
				slot8.count = slot6.number
				slot7 = Item.New({})

				table.insert({}, slot7)
				uv3:sendNotification(GAME.ADD_ITEM, slot7)
			end

			uv4:updateBoxUseCnt(uv5)

			slot5.awards = slot1

			uv3:sendNotification(GAME.COMMANDER_RESERVE_BOX_DONE, {})
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_lock_erro", slot0.result))
		end
	end)
end

return slot0
