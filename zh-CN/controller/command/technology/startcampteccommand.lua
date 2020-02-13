class("StartCampTecCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().tecID
	slot5 = pg.TimeMgr.GetInstance():DescCDTime(pg.fleet_tech_template[slot1.getBody().levelID].time)

	if getProxy(TechnologyNationProxy):getStudyingTecItem() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("technology_uplevel_error_studying", pg.fleet_tech_group[slot7].name))

		return
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("technology_uplevel_error_no_res", pg.fleet_tech_template[slot4].cost, slot5, math.fmod(slot2.levelID, 1000) - 1, math.fmod(slot2.levelID, 1000)),
		onYes = function ()
			if getProxy(PlayerProxy):getData().gold < pg.fleet_tech_template[getProxy(PlayerProxy).getData()].cost then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_gold"))

				return
			end

			pg.ConnectionMgr.GetInstance():Send(64001, {
				tech_group_id = slot1,
				tech_id = slot0
			}, 64002, function (slot0)
				if slot0.result == 0 then
					slot1:updateTecItem(slot1.updateTecItem, nil, slot0, slot1)
					slot1:setTimer()
					slot1:sendNotification(TechnologyConst.START_TEC_BTN_SUCCESS, slot1.sendNotification)
					slot1:refreshRedPoint()
					slot1:sendNotification(TechnologyConst.UPDATE_REDPOINT_ON_TOP)

					slot2 = getProxy(PlayerProxy)
					slot3 = slot2:getData()

					slot3:consume({
						[id2res(1)] = pg.fleet_tech_template[slot0].cost
					})
					slot2:updatePlayer(slot3)
				else
					pg.TipsMgr.GetInstance():ShowTips(errorTip("coloring_cell", slot0.result))
				end
			end)
		end,
		weight = LayerWeightConst.TOP_LAYER
	})
end

return class("StartCampTecCommand", pm.SimpleCommand)
