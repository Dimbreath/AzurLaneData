slot0 = class("WorldEnterCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = {}

	if getProxy(WorldProxy).isProtoLock then
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_close"))

		return
	end

	if nowWorld.realm == 0 then
		nowWorld:SetupRealm(1)
	end

	if nowWorld:CheckReset(true) then
		table.insert(slot3, function (slot0)
			pg.ConnectionMgr.GetInstance():Send(33112, {
				type = 1
			}, 33113, function (slot0)
				if slot0.result == 0 then
					if slot0.time == 0 then
						nowWorld:TransDefaultFleets()
						uv0:BuildWorld(true)
						nowWorld:CheckResetAward(uv1:BuildDrop(slot0.drop_list))
						pg.TipsMgr.GetInstance():ShowTips(i18n("world_reset_success"))
					else
						nowWorld.expiredTime = slot0.time
					end

					uv2()
				else
					pg.TipsMgr.GetInstance():ShowTips(errorTip("world_reset_error_", slot0.result))
				end
			end)
		end)
	elseif nowWorld:CheckResetProgress() then
		table.insert(slot3, function (slot0)
			pg.ConnectionMgr.GetInstance():Send(33112, {
				type = 2
			}, 33113, function (slot0)
				if slot0.result == 0 then
					uv0:NetUpdateWorldSairenChapter(slot0.sairen_chapter)
					uv1()
				else
					pg.TipsMgr.GetInstance():ShowTips(errorTip("world_reset_error_", slot0.result))
				end
			end)
		end)
	end

	if not pg.NewStoryMgr.GetInstance():IsPlayed(pg.gameset.world_starting_story.description[1]) then
		table.insert(slot3, function (slot0)
			uv0:Play(uv1, slot0)
		end)
	end

	seriesAsync(slot3, function ()
		if not nowWorld:IsActivate() then
			slot0, slot1 = nowWorld:BuildFormationIds()
			slot2, slot3 = nil

			if nowWorld:IsRookie() then
				slot2, slot3 = WorldConst.GetRealmRookieId(nowWorld.realm)
			else
				slot3 = 2
				slot2 = 2
			end

			uv0:sendNotification(GAME.GO_SCENE, SCENE.WORLD_FLEET_SELECT, {
				type = slot0,
				fleets = slot1,
				mapId = slot2,
				entranceId = slot3
			})
		else
			uv0:sendNotification(GAME.GO_SCENE, SCENE.WORLD, uv1)
		end
	end)
end

function slot0.BuildDrop(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot1) do
		slot8 = Item.New(slot7)

		table.insert(slot2, slot8)
		slot0:sendNotification(GAME.ADD_ITEM, slot8)
	end

	return slot2
end

return slot0
