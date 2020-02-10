slot0 = class("GetWBDamageRankCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot7.boss_id = slot1:getBody().bossId

	pg.ConnectionMgr.GetInstance():Send(33505, {}, 33506, function (slot0)
		if slot0.result == 0 then
			for slot5, slot6 in ipairs(slot0.rank_list) do
				slot9.id = slot6.id
				slot9.name = slot6.name
				slot9.damage = slot6.damage

				table.insert({}, {})
			end

			getProxy(WorldProxy):GetWorld():GetBossProxy():SetRank(uv0, slot1)

			slot7.bossId = uv0

			uv1:sendNotification(GAME.WORLD_GET_BOSS_RANK_DONE, {})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("world_activate_error_", slot0.result))
		end
	end)
end

return slot0
