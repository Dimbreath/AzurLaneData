class("FinishBluePrintCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if not getProxy(TechnologyProxy):getBluePrintById(slot1:getBody().id) then
		return
	end

	if not slot5:isFinished() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(63202, {
		blueprint_id = slot3
	}, 63203, function (slot0)
		if slot0.result == 0 then
			slot1 = Ship.New(slot0.ship)
			slot2 = getProxy(BayProxy)

			slot2:addShip(slot1)
			slot0:unlock(slot1.id)
			slot1:updateBluePrint(slot0)
			slot2:sendNotification(GAME.FINISH_SHIP_BLUEPRINT_DONE, {
				ship = slot1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("printblue_build_erro") .. slot0.result)
		end
	end)
end

return class("FinishBluePrintCommand", pm.SimpleCommand)
