class("CommanderFormationOPCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().data.FleetType
	slot5 = getProxy(CommanderProxy)
	slot6 = getProxy(ChapterProxy)
	slot7 = getProxy(FleetProxy)

	if slot1.getBody().data.data.type == LevelUIConst.COMMANDER_OP_RENAME then
		slot0:sendNotification(GAME.SET_COMMANDER_PREFAB_NAME, {
			id = slot8.id,
			name = slot8.str
		})

		return
	end

	if slot4 == LevelUIConst.FLEET_TYPE_SELECT then
		slot9 = slot3.fleetId
		slot10 = slot3.chapterId

		if slot8.type == LevelUIConst.COMMANDER_OP_USE_PREFAB then
			slot0:sendNotification(GAME.USE_COMMANDER_PREFBA, {
				pid = slot8.id,
				fleetId = slot9
			})
		elseif slot8.type == LevelUIConst.COMMANDER_OP_RECORD_PREFAB then
			slot0:sendNotification(GAME.SET_COMMANDER_PREFAB, {
				id = slot8.id,
				commanders = slot7:getFleetById(slot9).getCommanders(slot12)
			})
		elseif slot8.type == LevelUIConst.COMMANDER_OP_REST_ALL then
			seriesAsync({
				function (slot0)
					slot0:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
						commanderId = 0,
						pos = 1,
						fleetId = slot0.sendNotification,
						callback = slot0
					})
				end,
				function (slot0)
					slot0:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
						commanderId = 0,
						pos = 2,
						fleetId = slot0.sendNotification,
						callback = slot0
					})
				end
			})
		end

		return
	end

	if slot4 == LevelUIConst.FLEET_TYPE_EDIT then
		slot9 = slot3.index
		slot10 = slot3.chapterId
		slot12 = slot5:getPrefabFleetById(slot11)

		if slot8.type == LevelUIConst.COMMANDER_OP_USE_PREFAB then
			slot13 = {}

			for slot17 = 1, 2, 1 do
				if slot12:getCommanderByPos(slot17) then
					slot19, slot20 = Commander.canEquipToEliteChapter(slot10, slot9, slot17, slot18.id)

					if not slot19 then
						pg.TipsMgr.GetInstance():ShowTips(slot20)

						return
					end
				end
			end

			slot14 = slot6:getChapterById(slot10)
			slot15 = slot6:getSameMapChapters(slot14)

			if slot12:isSameId(slot14:getEliteFleetCommanders()[slot9]) then
				return
			end

			function slot18(slot0)
				for slot4 = 1, 2, 1 do
					if slot0:getCommanderByPos(slot4) then
						slot0:updateCommander(slot1, slot4, slot5.id)
					else
						slot0:updateCommander(slot1, slot4, nil)
					end
				end

				slot2:updateChapter(slot0)
			end

			for slot22, slot23 in pairs(slot15) do
				slot18(slot23)
			end

			slot18(slot14)
			slot0:sendNotification(GAME.COMMANDER_ELIT_FORMATION_OP_DONE, {
				chapterId = slot14.id,
				index = slot9
			})
		elseif slot8.type == LevelUIConst.COMMANDER_OP_RECORD_PREFAB then
			slot13 = slot8.id

			if table.getCount(slot6:getChapterById(slot10).getEliteFleetCommanders(slot14)[slot9]) == 0 then
				return
			end

			slot17 = slot5:getPrefabFleetById(slot13)

			for slot21 = 1, 2, 1 do
				if slot5:getCommanderById(slot16[slot21]) then
					slot17:updateCommander(slot21, slot23)
				end
			end

			slot5:updatePrefabFleet(slot17)
			slot6:updateChapter(slot14)
			slot0:sendNotification(GAME.COMMANDER_ELIT_FORMATION_OP_DONE, {
				chapterId = slot14.id,
				index = slot9
			})
		elseif slot8.type == LevelUIConst.COMMANDER_OP_REST_ALL then
			function slot15(slot0)
				slot0:updateCommander(slot0, 1, nil)
				slot0:updateCommander(slot0, 2, nil)
				slot0.updateCommander:updateChapter(slot0)
			end

			for slot19, slot20 in pairs(slot14) do
				slot15(slot20)
			end

			slot15(slot13)
			slot0:sendNotification(GAME.COMMANDER_ELIT_FORMATION_OP_DONE, {
				chapterId = slot13.id,
				index = slot9
			})
		end
	end
end

return class("CommanderFormationOPCommand", pm.SimpleCommand)
