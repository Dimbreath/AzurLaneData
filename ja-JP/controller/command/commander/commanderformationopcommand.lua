slot0 = class("CommanderFormationOPCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = slot1:getBody().data
	slot4 = slot3.FleetType
	slot5 = getProxy(CommanderProxy)
	slot6 = getProxy(ChapterProxy)
	slot7 = getProxy(FleetProxy)

	if slot3.data.type == LevelUIConst.COMMANDER_OP_RENAME then
		slot15.id = slot8.id
		slot15.name = slot8.str
		slot15.onFailed = slot8.onFailed

		slot0:sendNotification(GAME.SET_COMMANDER_PREFAB_NAME, {})

		return
	end

	if slot4 == LevelUIConst.FLEET_TYPE_SELECT then
		slot10 = slot3.chapterId

		if slot8.type == LevelUIConst.COMMANDER_OP_USE_PREFAB then
			slot15.pid = slot8.id
			slot15.fleetId = slot3.fleetId

			slot0:sendNotification(GAME.USE_COMMANDER_PREFBA, {})
		elseif slot8.type == LevelUIConst.COMMANDER_OP_RECORD_PREFAB then
			slot17.id = slot8.id
			slot17.commanders = slot7:getFleetById(slot9):getCommanders()

			slot0:sendNotification(GAME.SET_COMMANDER_PREFAB, {})
		elseif slot8.type == LevelUIConst.COMMANDER_OP_REST_ALL then
			slot11[1] = function (slot0)
				slot4.fleetId = uv1
				slot4.callback = slot0

				uv0:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
					commanderId = 0,
					pos = 1
				})
			end

			slot11[2] = function (slot0)
				slot4.fleetId = uv1
				slot4.callback = slot0

				uv0:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
					commanderId = 0,
					pos = 2
				})
			end

			seriesAsync({})
		end

		return
	end

	if slot4 == LevelUIConst.FLEET_TYPE_EDIT then
		slot9 = slot3.index
		slot10 = slot3.chapterId
		slot12 = slot5:getPrefabFleetById(slot8.id)

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

			if slot12:isSameId(slot6:getChapterById(slot10):getEliteFleetCommanders()[slot9]) then
				return
			end

			for slot20 = 1, 2, 1 do
				if slot12:getCommanderByPos(slot20) then
					slot25.chapterId = slot10
					slot25.index = slot9
					slot25.pos = slot20
					slot25.commanderId = slot21.id

					slot0:sendNotification(GAME.SELECT_ELIT_CHAPTER_COMMANDER, {})
				else
					slot25.chapterId = slot10
					slot25.index = slot9
					slot25.pos = slot20

					slot0:sendNotification(GAME.SELECT_ELIT_CHAPTER_COMMANDER, {})
				end
			end

			slot20.chapterId = slot14.id
			slot20.index = slot9

			slot0:sendNotification(GAME.COMMANDER_ELIT_FORMATION_OP_DONE, {})
		elseif slot8.type == LevelUIConst.COMMANDER_OP_RECORD_PREFAB then
			slot13 = slot8.id

			if table.getCount(slot6:getChapterById(slot10):getEliteFleetCommanders()[slot9]) == 0 then
				return
			end

			slot17 = {}

			for slot21 = 1, 2, 1 do
				if slot5:getCommanderById(slot16[slot21]) then
					slot17[slot21] = slot23
				end
			end

			slot21.id = slot13
			slot21.commanders = slot17

			slot0:sendNotification(GAME.SET_COMMANDER_PREFAB, {})
			slot6:updateChapter(slot14)

			slot21.chapterId = slot14.id
			slot21.index = slot9

			slot0:sendNotification(GAME.COMMANDER_ELIT_FORMATION_OP_DONE, {})
		elseif slot8.type == LevelUIConst.COMMANDER_OP_REST_ALL then
			slot13 = slot6:getChapterById(slot10)

			for slot17 = 1, 2, 1 do
				slot21.chapterId = slot10
				slot21.index = slot9
				slot21.pos = slot17

				slot0:sendNotification(GAME.SELECT_ELIT_CHAPTER_COMMANDER, {})
			end

			slot17.chapterId = slot13.id
			slot17.index = slot9

			slot0:sendNotification(GAME.COMMANDER_ELIT_FORMATION_OP_DONE, {})
		end
	end
end

return slot0
