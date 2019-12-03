class("ChallengeShareMediator", import("..base.ContextMediator")).register = function (slot0)
	slot2 = getProxy(ChallengeProxy):getUserChallengeInfo(slot1)

	slot0.viewComponent:setLevel(slot2:getLevel())
	slot0.viewComponent:setFlagShipPaint(({
		regularFleet = slot2:getRegularFleet(),
		submarineFleet = slot2:getSubmarineFleet()
	})["regularFleet"]:getShipsByTeam(TeamType.Main, true)[1].getPainting(slot4))

	slot5 = {}

	for slot9, slot10 in ipairs(()["regularFleet"]:getShips(true)) do
		if slot10.id ~= slot4.id then
			table.insert(slot5, slot10:getPainting())
		end
	end

	for slot9, slot10 in ipairs(slot3.submarineFleet:getShips(true)) do
		if slot10.id ~= slot4.id then
			table.insert(slot5, slot10:getPainting())
		end
	end

	slot0.viewComponent:setShipPaintList(slot5)
end

return class("ChallengeShareMediator", import("..base.ContextMediator"))
