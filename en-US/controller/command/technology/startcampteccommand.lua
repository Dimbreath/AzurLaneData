slot0 = class("StartCampTecCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.tecID
	slot5 = pg.TimeMgr.GetInstance():DescCDTime(pg.fleet_tech_template[slot2.levelID].time)

	if getProxy(TechnologyNationProxy):getStudyingTecItem() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("technology_uplevel_error_studying", pg.fleet_tech_group[slot7].name))

		return
	end

	slot10.content = i18n("technology_uplevel_error_no_res", pg.fleet_tech_template[slot4].cost, slot5, math.fmod(slot2.levelID, 1000) - 1, math.fmod(slot2.levelID, 1000))

	function slot10.onYes()
		if getProxy(PlayerProxy):getData().gold < pg.fleet_tech_template[uv0].cost then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_gold"))

			return
		end

		slot4.tech_group_id = uv1
		slot4.tech_id = uv0

		pg.ConnectionMgr.GetInstance():Send(64001, {}, 64002, function (slot0)
			if slot0.result == 0 then
				uv1:updateTecItem(uv2, nil, uv0, pg.TimeMgr.GetInstance():GetServerTime() + pg.fleet_tech_template[uv0].time)
				uv1:setTimer()
				uv3:sendNotification(TechnologyConst.START_TEC_BTN_SUCCESS, uv2)
				uv1:refreshRedPoint()
				uv3:sendNotification(TechnologyConst.UPDATE_REDPOINT_ON_TOP)

				slot2 = getProxy(PlayerProxy)
				slot3 = slot2:getData()
				slot6[id2res(1)] = pg.fleet_tech_template[uv0].cost

				slot3:consume({})
				slot2:updatePlayer(slot3)
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("coloring_cell", slot0.result))
			end
		end)
	end

	slot10.weight = LayerWeightConst.TOP_LAYER

	pg.MsgboxMgr.GetInstance():ShowMsgBox({})
end

return slot0
