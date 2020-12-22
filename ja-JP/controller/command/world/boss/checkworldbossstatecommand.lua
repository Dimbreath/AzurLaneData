slot0 = class("CheckWorldBossStateCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.callback
	slot5 = slot2.failedCallback

	function slot6()
		for slot5, slot6 in ipairs(getProxy(ChatProxy):GetMessagesByUniqueId(uv0)) do
			slot6.args.isDeath = true

			slot0:UpdateMsg(slot6)
		end

		if uv1 then
			uv1()
		end
	end

	pg.ConnectionMgr.GetInstance():Send(34515, {
		boss_id = slot2.bossId
	}, 34516, function (slot0)
		if slot0.result == 0 then
			if uv0 then
				uv0()
			end
		elseif slot0.result == 1 then
			uv1()
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_boss_none"))
		elseif slot0.result == 3 then
			uv1()
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_boss_none"))
		elseif slot0.result == 6 then
			uv1()
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_max_challenge_cnt"))
		elseif slot0.result == 20 then
			uv1()
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_boss_none"))
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
		end
	end)
end

return slot0
