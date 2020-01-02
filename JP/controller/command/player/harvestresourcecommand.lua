class("HarvestResourceCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if pg.user_level[getProxy(PlayerProxy).getData(slot4).level]["max_" .. id2res(slot2)] <= getProxy(PlayerProxy).getData(slot4)[id2res(slot2)] then
		pg.TipsMgr.GetInstance():ShowTips(i18n("player_harvestResource_error_fullBag"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(11013, {
		number = 0,
		type = slot2
	}, 11014, function (slot0)
		if slot0.result == 0 then
			if slot0 - slot1[] < slot1[slot2 .. "Field"] then
				slot1:addResources({
					[slot2] = slot1
				})

				slot1[slot2 .. "Field"] = slot1[slot2 .. "Field"] - slot1
			else
				slot1:addResources({
					[slot1[slot2 .. "Field"]] = slot1[slot2 .. "Field"]
				})

				slot1[slot2 .. "Field"] = 0
			end

			slot3:updatePlayer(slot1)
			slot3:sendNotification(GAME.HARVEST_RES_DONE, {
				type = GAME.HARVEST_RES_DONE,
				outPut = slot2
			})
			playSoundEffect(SFX_UI_ACADEMY_GETMATERIAL)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("player_harvestResource", slot0.result))
		end
	end)
end

return class("HarvestResourceCommand", pm.SimpleCommand)
