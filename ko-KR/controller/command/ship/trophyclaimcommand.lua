class("TrophyClaimCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = getProxy(CollectionProxy)

	pg.ConnectionMgr.GetInstance():Send(17301, {
		id = slot1:getBody().trophyID
	}, 17302, function (slot0)
		if slot0.result == 0 then
			slot0:updateTrophyClaim(slot1, slot1)

			slot2 = {}

			for slot6, slot7 in ipairs(slot0.next) do
				slot2[#slot2 + 1] = Trophy.New(slot7)
			end

			slot0:unlockNewTrophy(slot2)
			slot2:sendNotification(GAME.TROPHY_CLAIM_DONE, {
				trophyID = slot1
			})
			slot0:updateTrophy()
		end
	end)
end

return class("TrophyClaimCommand", pm.SimpleCommand)
