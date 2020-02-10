slot0 = class("BuildShipBluePrintCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.hideTip

	if not getProxy(TechnologyProxy):getBluePrintById(slot2.id):isFinishPrevTask(true) then
		pg.TipsMgr.GetInstance():ShowTips("without finish pre task")

		return
	end

	slot8 = pg.TimeMgr.GetInstance()

	if slot8:GetServerTime() < slot5:getColdTime() then
		if slot7 - slot8 < 0 then
			slot9 = 0
		end

		slot11 = nil

		pg.TipsMgr.GetInstance():ShowTips(i18n("blueprint_cannot_build_tip", math.floor(slot9 / 86400) > 0 and i18n("time_remaining_tip") .. slot10 .. i18n("word_date") or math.floor(slot9 / 3600) > 0 and i18n("time_remaining_tip") .. slot12 .. i18n("word_hour") or math.floor(slot9 / 60) > 0 and i18n("time_remaining_tip") .. slot13 .. i18n("word_minute") or i18n("time_remaining_tip") .. slot9 .. i18n("word_second")))

		return
	end

	if slot5:getBuildingBluePrint() then
		slot14.content = i18n("cannot_build_multiple_printblue", slot9:getShipVO():getConfig("name"), slot6:getShipVO():getConfig("name"))

		function slot14.onYes()
			slot3.id = uv1.id

			function slot3.callback()
				slot3.id = uv1

				uv0:sendNotification(GAME.BUILD_SHIP_BLUEPRINT, {
					hideTip = true
				})
			end

			uv0:sendNotification(GAME.STOP_BLUEPRINT, {})
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({})

		return
	end

	if slot4 then
		function ()
			slot3.blueprint_id = uv0

			pg.ConnectionMgr.GetInstance():Send(63200, {}, 63201, function (slot0)
				if slot0.result == 0 then
					uv0:updateColdTime()
					uv1:start(slot0.time)
					uv0:updateBluePrint(uv1)
					uv2:sendNotification(GAME.BUILD_SHIP_BLUEPRINT_DONE)
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("printblue_build_erro") .. slot0.result)
				end
			end)
		end()
	else
		slot13.content = i18n("blueprint_build_time_tip")

		function slot13.onYes()
			uv0()
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({})
	end
end

return slot0
