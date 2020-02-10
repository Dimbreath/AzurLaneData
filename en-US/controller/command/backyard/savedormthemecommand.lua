slot0 = class("SaveDormThemeCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot4, slot5 = Dorm.checkData(slot1:getBody().furnitureputList, getProxy(DormProxy):getData().level)

	if not slot4 then
		pg.TipsMgr.GetInstance():ShowTips(slot5)

		return
	end

	slot6 = {}

	for slot10, slot11 in pairs(slot2.furnitureputList) do
		for slot16, slot17 in pairs(slot11.child) do
			slot20.id = tostring(slot16)
			slot20.x = slot17.x
			slot20.y = slot17.y

			table.insert({}, {})
		end

		slot15.id = tostring(slot11.configId)
		slot15.x = slot11.x
		slot15.y = slot11.y
		slot15.dir = slot11.dir
		slot15.child = slot12
		slot15.parent = slot11.parent

		table.insert(slot6, {
			shipId = 0
		})
	end

	slot7.id = slot2.id
	slot7.name = slot2.name
	slot7.furniture_put_list = slot6

	pg.ConnectionMgr.GetInstance():Send(19020, {}, 19021, function (slot0)
		if slot0.result == 0 then
			getProxy(DormProxy):AddTheme(uv0)
			uv1:sendNotification(GAME.SAVE_DORMTHEME_DONE)
			pg.TipsMgr:GetInstance().ShowTips("Saved")
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return slot0
