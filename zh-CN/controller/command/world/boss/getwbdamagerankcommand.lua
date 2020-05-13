slot0 = class("GetWBDamageRankCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(33505, {
		boss_id = slot1:getBody().bossId
	}, 33506, function (slot0)
		if slot0.result == 0 then
			slot1 = {}

			for slot5, slot6 in ipairs(slot0.rank_list) do
				table.insert(slot1, {
					id = slot6.id,
					name = slot6.name,
					damage = slot6.damage
				})
			end

			getProxy(WorldProxy):GetWorld():GetBossProxy():SetRank(uv0, slot1)
			uv1:sendNotification(GAME.WORLD_GET_BOSS_RANK_DONE, {
				bossId = uv0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("world_activate_error_", slot0.result))
		end
	end)
end

return slot0
