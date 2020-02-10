slot0 = class("PutFurnitureCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.furnsPos
	slot4 = slot2.tip

	if not getProxy(DormProxy) then
		return
	end

	if not pg.backyard then
		return
	end

	slot6 = slot5.floor
	slot9, slot10 = Dorm.checkData(slot3, slot5:getData().level)

	if not slot9 then
		pg.TipsMgr.GetInstance():ShowTips(slot10)

		return
	end

	slot11 = {}

	for slot15, slot16 in pairs(slot7:getFurnitrues(slot6)) do
		slot16:clearPosition()
		slot5:updateFurniture(slot16)
	end

	for slot15, slot16 in pairs(slot3) do
		if (slot5:getFurniById(slot15):getConfig("type") == Furniture.TYPE_WALLPAPER or slot18 == Furniture.TYPE_FLOORPAPER) and slot5:getWallPaper(slot18) then
			slot19:clearPosition()
		end

		slot17:updatePosition(Vector2(slot16.x, slot16.y))

		slot17.dir = slot16.dir
		slot17.child = slot16.child
		slot17.parent = slot16.parent
		slot17.floor = slot6

		slot5:updateFurniture(slot17)

		for slot23, slot24 in pairs(slot16.child) do
			slot27.id = tostring(slot23)
			slot27.x = slot24.x
			slot27.y = slot24.y

			table.insert({}, {})
		end

		slot22.id = tostring(slot17:getConfig("id"))
		slot22.x = slot16.x
		slot22.y = slot16.y
		slot22.dir = slot16.dir
		slot22.child = slot19
		slot22.parent = slot16.parent

		table.insert(slot11, {
			shipId = 0
		})
	end

	slot15.floor = slot6
	slot15.furniture_put_list = slot11

	pg.ConnectionMgr.GetInstance():Send(19008, {})

	if slot4 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_putFurniture_ok"))
	end

	slot0:sendNotification(GAME.PUT_FURNITURE_DONE)
	pg.backyard:sendNotification(BACKYARD.PUT_FURNITURE_DONE)
end

return slot0
