class("ActivityPuzzlePicecOPCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().id or 0
	slot4 = slot2.cmd
	slot6 = slot2.callback
	slot7 = getProxy(ActivityProxy)

	if not getProxy(ActivityProxy):getActivityById(slot2.actId) or slot8:isEnd() then
		return
	end

	if not pg.activity_event_picturepuzzle[slot5] then
		return
	end

	if slot4 == 1 then
		if #slot8.data2_list > #slot9.pickup_picturepuzzle + #slot9.drop_picturepuzzle then
			return
		end

		if slot8.data1 == 1 then
			return
		end

		slot0:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = slot5
		})

		return
	elseif slot4 == 2 then
		if table.contains(slot8.data2_list, slot3) then
			return
		end
	elseif slot4 == 3 then
		if table.contains(slot8.data3_list, slot3) then
			return
		end

		if pg.TimeMgr.GetInstance():GetServerTime() < slot8.data2 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("bulin_tip_other2"))

			return
		end
	end

	pg.ConnectionMgr.GetInstance():Send(11202, {
		arg2 = 0,
		activity_id = slot5,
		cmd = slot4,
		arg1 = slot3
	}, 11203, function (slot0)
		if slot0.result == 0 then
			slot0 = getProxy(ActivityProxy):getActivityById(getProxy(ActivityProxy).getActivityById)

			if getProxy(ActivityProxy) == 1 then
				slot0.data1 = 1
			elseif slot2 == 2 then
				table.insert(slot0.data2_list, slot3)
			elseif slot2 == 3 then
				table.insert(slot0.data3_list, slot3)

				slot0.data2 = pg.TimeMgr.GetInstance():GetServerTime() + slot4.cd
			end

			slot5:updateActivity(slot0)

			if slot6 then
				slot6()
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return class("ActivityPuzzlePicecOPCommand", pm.SimpleCommand)
