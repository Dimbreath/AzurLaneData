slot0 = class("SubmitWBAwardCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot5 = nowWorld:GetBossProxy()

	pg.ConnectionMgr.GetInstance():Send(34511, {
		boss_id = slot1:getBody().bossId
	}, 34512, function (slot0)
		if slot0.result == 0 then
			slot1 = {}

			for slot5, slot6 in ipairs(slot0.drops) do
				slot7 = {
					type = slot6.type,
					id = slot6.id,
					count = slot6.number
				}

				table.insert(slot1, slot7)
				uv0:sendNotification(GAME.ADD_ITEM, Item.New(slot7))
			end

			uv1:RemoveSelfBoss()
			uv1:ClearRank(uv2)
			uv0:sendNotification(GAME.WORLD_BOSS_SUBMIT_AWARD_DONE, {
				items = slot1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n1("领取失败") .. slot0.result)
		end
	end)
end

return slot0
