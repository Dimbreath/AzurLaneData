slot0 = class("CommanderFormationOPCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = slot1:getBody().data
	slot4 = slot3.FleetType
	slot5 = getProxy(CommanderProxy)
	slot6 = getProxy(ChapterProxy)
	slot7 = getProxy(FleetProxy)

	if slot3.data.type == LevelUIConst.COMMANDER_OP_RENAME then
		slot0:sendNotification(GAME.SET_COMMANDER_PREFAB_NAME, {
			id = slot8.id,
			name = slot8.str,
			onFailed = slot8.onFailed
		})

		return
	end

	if slot4 == LevelUIConst.FLEET_TYPE_SELECT then
		slot10 = slot3.chapterId

		if slot8.type == LevelUIConst.COMMANDER_OP_USE_PREFAB then
			slot0:sendNotification(GAME.USE_COMMANDER_PREFBA, {
				pid = slot8.id,
				fleetId = slot3.fleetId
			})
		elseif slot8.type == LevelUIConst.COMMANDER_OP_RECORD_PREFAB then
			slot0:sendNotification(GAME.SET_COMMANDER_PREFAB, {
				id = slot8.id,
				commanders = slot7:getFleetById(slot9):getCommanders()
			})
		elseif slot8.type == LevelUIConst.COMMANDER_OP_REST_ALL then
			seriesAsync({
				function (slot0)
					uv0:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
						commanderId = 0,
						pos = 1,
						fleetId = uv1,
						callback = slot0
					})
				end,
				function (slot0)
					uv0:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
						commanderId = 0,
						pos = 2,
						fleetId = uv1,
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
		slot12 = slot5:getPrefabFleetById(slot8.id)

		if slot8.type == LevelUIConst.COMMANDER_OP_USE_PREFAB then
			slot13 = {}

			for slot17 = 1, 2 do
				if slot12:getCommanderByPos(slot17) then
					slot19, slot20 = Commander.canEquipToEliteChapter(slot10, slot9, slot17, slot18.id)

					if not slot19 then
						pg.TipsMgr.GetInstance():ShowTips(slot20)

						return
					end
				end
			end

			if slot12:isSameId(slot6:getChapterById(slot10):getEliteFleetCommanders()[slot9]) then
				return
			end

			for slot20 = 1, 2 do
				if slot12:getCommanderByPos(slot20) then
					slot0:sendNotification(GAME.SELECT_ELIT_CHAPTER_COMMANDER, {
						chapterId = slot10,
						index = slot9,
						pos = slot20,
						commanderId = slot21.id
					})
				else
					slot0:sendNotification(GAME.SELECT_ELIT_CHAPTER_COMMANDER, {
						chapterId = slot10,
						index = slot9,
						pos = slot20
					})
				end
			end

			slot0:sendNotification(GAME.COMMANDER_ELIT_FORMATION_OP_DONE, {
				chapterId = slot14.id,
				index = slot9
			})
		elseif slot8.type == LevelUIConst.COMMANDER_OP_RECORD_PREFAB then
			slot13 = slot8.id

			if table.getCount(slot6:getChapterById(slot10):getEliteFleetCommanders()[slot9]) == 0 then
				return
			end

			for slot21 = 1, 2 do
				if slot5:getCommanderById(slot16[slot21]) then
					-- Nothing
				end
			end

			slot0:sendNotification(GAME.SET_COMMANDER_PREFAB, {
				id = slot13,
				commanders = {
					[slot21] = slot23
				}
			})
			slot6:updateChapter(slot14)
			slot0:sendNotification(GAME.COMMANDER_ELIT_FORMATION_OP_DONE, {
				chapterId = slot14.id,
				index = slot9
			})
		elseif slot8.type == LevelUIConst.COMMANDER_OP_REST_ALL then
			slot13 = slot6:getChapterById(slot10)

			for slot17 = 1, 2 do
				slot0:sendNotification(GAME.SELECT_ELIT_CHAPTER_COMMANDER, {
					chapterId = slot10,
					index = slot9,
					pos = slot17
				})
			end

			slot0:sendNotification(GAME.COMMANDER_ELIT_FORMATION_OP_DONE, {
				chapterId = slot13.id,
				index = slot9
			})
		end
	end
end

return slot0
