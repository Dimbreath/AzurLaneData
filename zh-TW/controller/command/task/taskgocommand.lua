slot0 = class("TaskGoCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if getProxy(TaskProxy):getTaskById(slot1:getBody().taskVO.id) == nil then
		return
	end

	if slot3:getConfig("scene") and #slot7 > 0 then
		if slot7[1] == "ACTIVITY_MAP" then
			slot8, slot9 = getProxy(ChapterProxy):getLastMapForActivity()

			if slot8 then
				slot10 = getProxy(ActivityProxy):getActivityById(pg.expedition_data_by_map[slot8].on_activity)
			end

			if not slot10 or slot10:isEnd() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

				return
			end

			slot15.chapterId = slot9
			slot15.mapIdx = slot8

			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {})
		elseif SCENE[slot7[1]] then
			slot0:sendNotification(GAME.GO_SCENE, SCENE[slot7[1]], slot7[2])
		end

		return
	end

	slot9 = slot3:getConfigTable().sub_type
	slot11.chapterId = slot6:getActiveChapter() and slot10.id
	slot11.mapIdx = slot10 and slot10:getConfig("map")
	slot12 = {
		inChapter = true,
		inPvp = true,
		inFleet = true,
		inClass = true,
		inActivity = true,
		inTactics = true,
		inBackyard = true,
		inSham = true,
		inEvent = true,
		inAdmiral = true
	}
	slot14 = math.fmod(slot9, 10)

	if math.modf(slot9 / 10) == 0 then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {})
	elseif slot13 == 1 then
		if slot14 == 9 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.DAILYLEVEL)
		else
			slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
		end
	elseif slot13 == 2 then
		slot15 = slot8.target_id_for_client

		if slot14 == 0 and slot15 ~= 0 then
			slot17.id = slot15
			slot16 = Chapter.New({})

			if getProxy(ChapterProxy):getMaps()[slot16:getConfig("map")]:getChapter(slot16.id) and slot19:isUnlock() then
				slot24.chapterId = slot19 and slot19.id
				slot24.mapIdx = slot19 and slot19:getConfig("map")

				slot0.sendNotification(slot0, GAME.GO_SCENE, SCENE.LEVEL, {})
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock"))
			end
		elseif slot14 == 6 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.DAILYLEVEL)
		elseif slot14 == 7 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.MILITARYEXERCISE)
		elseif slot14 == 8 then
			if slot6:getShamChapter() and slot16.active then
				slot21.chapterVO = slot16

				slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {})
			else
				slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
			end
		elseif slot14 == 9 then
			slot20.system = SYSTEM_PERFORM
			slot20.stageId = tonumber(slot15)

			slot0:sendNotification(GAME.BEGIN_STAGE, {})
		elseif slot14 > 7 or type(slot15) == "string" and tonumber(slot15) == 0 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
		else
			if type(slot15) == "table" then
				slot16 = slot6:getMaps()

				if _.all(slot15, function (slot0)
					slot2.id = slot0

					return uv0[Chapter.New({}):getConfig("map")]:getChapter(slot0) and not slot3:isUnlock()
				end) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock_1"))

					return
				end
			end

			slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
		end
	elseif slot13 == 3 then
		if slot14 == 0 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.GETBOAT)
		elseif slot14 == 1 then
			slot15 = {}

			for slot20, slot21 in pairs(getProxy(BayProxy):getData()) do
				if slot21:isActivityNpc() and not table.contains(slot15, slot21.id) then
					table.insert(slot15, slot21.id)
				end
			end

			slot21.mode = DockyardScene.MODE_DESTROY
			slot21.onShip = Ship.canDestroyShip
			slot21.flags = slot12
			slot21.leftTopInfo = i18n("word_destroy")
			slot21.ignoredIds = slot15

			slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
				blockLock = true,
				selectedMax = 10,
				skipSelect = true
			})
		elseif slot14 == 7 then
			slot19.warp = NavalAcademyScene.WARP_TO_TACTIC

			slot0:sendNotification(GAME.GO_SCENE, SCENE.NAVALACADEMYSCENE, {})
		else
			slot19.mode = DockyardScene.MODE_OVERVIEW
			slot19.flags = slot12

			slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
				showTagNoBlock = true
			})
		end
	elseif slot13 == 4 then
		if slot14 == 2 then
			slot19.warp = StoreHouseConst.WARP_TO_DESIGN

			slot0:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {})
		elseif slot14 == 3 then
			slot19.mode = DockyardScene.MODE_OVERVIEW
			slot19.flags = slot12

			slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
				showTagNoBlock = true
			})
		else
			slot19.warp = StoreHouseConst.WARP_TO_WEAPON

			slot0:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {})
		end
	elseif slot13 == 5 then
		if slot14 == 0 or slot14 == 1 then
			slot19.warp = StoreHouseConst.WARP_TO_MATERIAL

			slot0:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {})
		end
	elseif slot13 == 6 then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.BACKYARD)
	elseif slot13 == 7 then
		slot15 = nil

		if slot14 == 1 then
			slot15 = NavalAcademyScene.WARP_TO_TACTIC
		end

		slot20.warp = slot15

		slot0:sendNotification(GAME.GO_SCENE, SCENE.NAVALACADEMYSCENE, {})
	elseif slot13 == 8 then
		if slot14 == 0 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.EVENT)
		elseif slot14 == 1 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.NAVALACADEMYSCENE)
		end
	elseif slot13 == 9 then
		if slot14 == 2 then
			slot0:sendNotification(TaskMediator.TASK_FILTER, "weekly")
		end
	elseif slot13 == 10 then
		if slot14 == 4 or slot14 == 5 then
			slot15 = getProxy(ActivityProxy)

			if slot15:getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM) and not slot15:isEnd() then
				slot22.viewComponent = InstagramLayer
				slot22.mediator = InstagramMediator
				slot23.id = slot15.id
				slot22.data = {}
				slot20.subContext = Context.New({})

				slot0:sendNotification(GAME.GO_SCENE, SCENE.MAINUI, {})
			end
		end
	elseif slot13 == 11 then
		if slot14 == 0 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.TECHNOLOGY)
		end
	elseif slot13 == 12 then
		if slot14 == 0 then
			slot19.warp = ShopsLayer.TYPE_SHAM_SHOP

			slot0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, {})
		elseif slot14 == 1 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
		elseif slot14 == 2 then
			slot19.warp = ShopsLayer.TYPE_SHOP_STREET

			slot0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, {})
		end
	elseif slot13 == 13 then
		if slot14 == 0 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
		end
	elseif slot13 == 14 then
		if slot14 == 0 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.DAILYLEVEL)
		end
	elseif slot13 == 15 then
		if slot14 == 0 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.SHOP)
		end
	elseif slot13 == 17 then
		if slot14 == 0 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.COMMANDROOM)
		end
	elseif slot13 == 100 then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
	elseif slot13 == 101 then
		if slot14 == 3 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
		elseif slot14 == 5 or slot14 == 8 then
			slot19.mode = DockyardScene.MODE_OVERVIEW
			slot19.flags = slot12

			slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
				showTagNoBlock = true
			})
		end
	elseif slot13 == 102 then
		slot15 = slot8.target_id_for_client

		if slot14 == 0 and slot15 ~= 0 then
			slot17.id = slot15
			slot16 = Chapter.New({})

			if getProxy(ChapterProxy):getMaps()[slot16:getConfig("map")]:getChapter(slot16.id) and slot19:isUnlock() then
				slot24.chapterId = slot19 and slot19.id
				slot24.mapIdx = slot19 and slot19:getConfig("map")

				slot0.sendNotification(slot0, GAME.GO_SCENE, SCENE.LEVEL, {})
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock"))
			end
		else
			if type(slot15) == "table" then
				slot16 = slot6:getMaps()

				if _.all(slot15, function (slot0)
					slot2.id = slot0

					return uv0[Chapter.New({}):getConfig("map")]:getChapter(slot0) and not slot3:isUnlock()
				end) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock_1"))

					return
				end
			end

			slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
		end
	elseif slot13 == 200 and (slot14 == 1 or slot14 == 2) then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.BIANDUI)
	end
end

return slot0
