slot0 = class("SetMonthCardRatioCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot6.ratio = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(11601, {}, 11602, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(PlayerProxy)
			slot2 = slot1:getData()

			if slot2:getCardById(VipCard.MONTH) and not slot3:isExpire() then
				slot3.data = uv0

				slot2:addVipCard(slot3)
				slot1:updatePlayer(slot2)
			end

			pg.TipsMgr.GetInstance():ShowTips(i18n("month_card_set_ratio_success"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("month_card_set_ratio_fail", slot0.result))
		end
	end)
end

return slot0
