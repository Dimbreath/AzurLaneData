class("ActivityBossPageUpdateCommond", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	if not getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) or slot3:isEnd() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(26031, {
		act_id = slot3.id
	}, 26032, function (slot0)
		if slot0.result == 0 then
			if not getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) or slot0:isEnd() then
				return
			end

			slot0.data1 = slot0.boss_hp or 0
			slot0.data1_list = slot0.milestones or {}
			slot0.data2 = 1

			getProxy(ActivityProxy):updateActivity(slot0)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return class("ActivityBossPageUpdateCommond", pm.SimpleCommand)
