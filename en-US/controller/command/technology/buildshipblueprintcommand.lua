class("BuildShipBluePrintCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().hideTip

	if not getProxy(TechnologyProxy).getBluePrintById(slot5, slot3):isFinishPrevTask(true) then
		pg.TipsMgr.GetInstance():ShowTips("without finish pre task")

		return
	end

	if pg.TimeMgr.GetInstance():GetServerTime() < slot5:getColdTime() then
		if slot7 - slot8 < 0 then
			slot9 = 0
		end

		slot11 = nil

		pg.TipsMgr.GetInstance():ShowTips(i18n("blueprint_cannot_build_tip", (math.floor(slot9 / 86400) > 0 and i18n("time_remaining_tip") .. slot10 .. i18n("word_date")) or (math.floor(slot9 / 3600) > 0 and i18n("time_remaining_tip") .. slot12 .. i18n("word_hour")) or (math.floor(slot9 / 60) > 0 and i18n("time_remaining_tip") .. slot13 .. i18n("word_minute")) or i18n("time_remaining_tip") .. slot9 .. i18n("word_second")))

		return
	end

	if slot5:getBuildingBluePrint() then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("cannot_build_multiple_printblue", slot9:getShipVO().getConfig(slot10, "name"), slot6:getShipVO():getConfig("name")),
			onYes = function ()
				slot0:sendNotification(GAME.STOP_BLUEPRINT, {
					id = slot1.id,
					callback = function ()
						slot0:sendNotification(GAME.BUILD_SHIP_BLUEPRINT, {
							hideTip = true,
							id = slot0
						})
					end
				})
			end
		})

		return
	end

	function slot10()
		pg.ConnectionMgr.GetInstance():Send(63200, {
			blueprint_id = slot0
		}, 63201, function (slot0)
			if slot0.result == 0 then
				slot0:updateColdTime()
				slot0.updateColdTime:start(slot0.time)
				slot0:updateBluePrint(slot0.updateBluePrint)
				slot0:sendNotification(GAME.BUILD_SHIP_BLUEPRINT_DONE)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("printblue_build_erro") .. slot0.result)
			end
		end)
	end

	if slot4 then
		slot10()
	else
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("blueprint_build_time_tip"),
			onYes = function ()
				slot0()
			end
		})
	end
end

return class("BuildShipBluePrintCommand", pm.SimpleCommand)
