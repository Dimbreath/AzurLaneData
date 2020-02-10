slot0 = class("GetChargeListCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(16104, {
		type = 0
	}, 16105, function (slot0)
		slot1 = {}

		for slot5, slot6 in ipairs(slot0.pay_list) do
			slot7 = Goods.New(slot6, Goods.TYPE_CHARGE)
			slot1[slot7.id] = slot7
		end

		for slot6, slot7 in ipairs(slot0.first_pay_list) do
			table.insert({}, slot7)
		end

		for slot7, slot8 in ipairs(slot0.normal_list) do
			slot9 = Goods.New(slot8, Goods.TYPE_GIFT_PACKAGE)
			slot3[slot9.id] = slot9

			table.insert({}, slot8)
		end

		for slot8, slot9 in ipairs(slot0.normal_group_list) do
			table.insert({}, slot9)
		end

		slot5 = getProxy(ShopsProxy)

		slot5:setChargedList(slot1)
		slot5:setFirstChargeList(slot2)
		slot5:setNormalList(slot3)
		slot5:setNormalGroupList(slot4)

		slot9.chargedList = slot1
		slot9.firstChargeIds = slot2
		slot9.normalList = slot3
		slot9.normalGroupList = slot4

		uv0:sendNotification(GAME.GET_CHARGE_LIST_DONE, {})
	end)
end

return slot0
