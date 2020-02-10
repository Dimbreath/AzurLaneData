slot0 = class("BackYardShipAddExpCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot5 = getProxy(BayProxy)
	slot6 = {}
	slot7 = {}

	for slot11, slot12 in pairs(getProxy(DormProxy):getBackYardShips()) do
		if slot12.state == Ship.STATE_TRAIN then
			slot13 = slot5:getShipById(slot12.id)
			slot14 = Clone(slot13)

			if slot13.level ~= slot13:getMaxLevel() then
				slot13:addExp(slot2)
				slot5:updateShip(slot13)

				if pg.backyard then
					slot18.type = BackYardConst.ADDITION_TYPE_EXP
					slot18.id = slot13.id
					slot18.exp = slot2

					pg.backyard:sendNotification(BACKYARD.BOAT_ADDITION_DONE, {})
				end
			end

			slot6[slot13.id] = slot13
			slot7[slot13.id] = slot14
		end
	end

	slot11.oldShips = slot7
	slot11.newShips = slot6

	slot0:sendNotification(DormProxy.SHIPS_EXP_ADDED, {})
end

return slot0
