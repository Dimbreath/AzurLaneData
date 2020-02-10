slot0 = class("VisitBackYardCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if not getProxy(FriendProxy):getFriend(slot1:getBody()) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("friend_not_add"))

		return
	end

	slot8.user_id = slot2

	pg.ConnectionMgr.GetInstance():Send(19101, {}, 19102, function (slot0)
		slot1 = {}

		for slot5, slot6 in ipairs(slot0.ship_id_list) do
			slot8.id = slot6.id
			slot8.configId = slot6.tid
			slot8.skin_id = slot6.skin_id
			slot7 = Ship.New({
				energy = 100
			})
			slot7.state = slot6.state

			slot7:updateStateInfo34(0, 0)

			slot1[slot7.id] = slot7
		end

		slot5.data = slot0

		uv0:sendNotification(GAME.GET_BACKYARD_DATA, {})

		if not getProxy(DormProxy).friendData then
			pg.TipsMgr.GetInstance():ShowTips(i18n("data_erro"))
		else
			slot6.ships = slot1
			slot6.player = uv1
			slot6.dorm = slot2

			uv0:sendNotification(GAME.VISIT_BACKYARD_DONE, {})
		end
	end)
end

return slot0
