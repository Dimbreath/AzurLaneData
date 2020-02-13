class("GetCommanderCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.callback
	slot5 = defaultValue(slot2.notify, true)
	slot6 = getProxy(CommanderProxy)
	slot7 = slot6:getBoxById(slot3)

	if getProxy(PlayerProxy):getData().commanderBagMax <= slot6:getCommanderCnt() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("commander_capcity_is_max"))

		if slot4 then
			slot4()
		end

		return
	end

	if slot7:getState() ~= CommanderBox.STATE_FINISHED then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(25004, {
		boxid = slot3
	}, 25005, function (slot0)
		if slot0.result == 0 then
			slot0:addCommander(Commander.New(slot0.commander))
			slot1:finish()

			if slot1.finish then
				slot3:sendNotification(GAME.COMMANDER_ON_OPEN_BOX_DONE, {
					commander = slot1:clone(),
					boxId = slot4,
					callback = 
				})
			elseif slot5 then
				slot5(slot1)
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_acquire_erro", slot0.result))

			if slot0.result then
				slot5()
			end
		end
	end)
end

return class("GetCommanderCommand", pm.SimpleCommand)
