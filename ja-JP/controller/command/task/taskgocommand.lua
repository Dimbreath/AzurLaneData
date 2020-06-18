slot0 = class("TaskGoCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if getProxy(TaskProxy):getTaskById(slot1:getBody().taskVO.id) == nil then
		return
	end

	if slot3:getConfig("scene") and #slot7 > 0 then
		if slot7[1] == "ACTIVITY_MAP" then
			slot8, slot9 = getProxy(ChapterProxy):getLastMapForActivity()

			if not slot8 or not getProxy(ActivityProxy):getActivityById(pg.expedition_data_by_map[slot8].on_activity) or slot10:isEnd() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

				return
			end

			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = slot9,
				mapIdx = slot8
			})
		elseif SCENE[slot7[1]] then
			slot0:sendNotification(GAME.GO_SCENE, SCENE[slot7[1]], slot7[2])
		end

		return
	end

	slot9 = slot3:getConfigTable().sub_type
	slot13 = math.fmod(slot9, 10)

	if math.modf(slot9 / 10) == 0 then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
			chapterId = slot6:getActiveChapter() and slot10.id,
			mapIdx = slot10 and slot10:getConfig("map")
		})
	elseif slot12 == 1 then
		if slot13 == 9 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.DAILYLEVEL)
		else
			slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
		end
	elseif slot12 == 2 then
		slot14 = slot8.target_id_for_client

		if slot13 == 0 and slot14 ~= 0 then
			slot15 = Chapter.New({
				id = slot14
			})

			if getProxy(ChapterProxy):getMaps()[slot15:getConfig("map")]:getChapter(slot15.id) and slot18:isUnlock() then
				slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
					chapterId = slot18 and slot18.id,
					mapIdx = slot18 and slot18:getConfig("map")
				})
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock"))
			end
		elseif slot13 == 6 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.DAILYLEVEL)
		elseif slot13 == 7 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.MILITARYEXERCISE)
		elseif slot13 == 8 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
		elseif slot13 == 9 then
			slot0:sendNotification(GAME.BEGIN_STAGE, {
				system = SYSTEM_PERFORM,
				stageId = tonumber(slot14)
			})
		elseif slot13 > 7 or type(slot14) == "string" and tonumber(slot14) == 0 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
		else
			if type(slot14) == "table" then
				slot15 = slot6:getMaps()

				if _.all(slot14, function (slot0)
					return uv0[Chapter.New({
						id = slot0
					}):getConfig("map")]:getChapter(slot0) and not slot3:isUnlock()
				end) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock_1"))

					return
				end
			end

			slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
		end
	elseif slot12 == 3 then
		if slot13 == 0 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.GETBOAT)
		elseif slot13 == 1 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
				blockLock = true,
				skipSelect = true,
				selectedMax = 10,
				mode = DockyardScene.MODE_DESTROY,
				onShip = ShipStatus.canDestroyShip,
				leftTopInfo = i18n("word_destroy"),
				ignoredIds = pg.ShipFlagMgr.GetInstance():FilterShips({
					isActivityNpc = true
				})
			})
		elseif slot13 == 7 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.NAVALACADEMYSCENE, {
				warp = NavalAcademyScene.WARP_TO_TACTIC
			})
		else
			slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
				mode = DockyardScene.MODE_OVERVIEW
			})
		end
	elseif slot12 == 4 then
		if slot13 == 2 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {
				warp = StoreHouseConst.WARP_TO_DESIGN
			})
		elseif slot13 == 3 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
				mode = DockyardScene.MODE_OVERVIEW
			})
		else
			slot0:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {
				warp = StoreHouseConst.WARP_TO_WEAPON
			})
		end
	elseif slot12 == 5 then
		if slot13 == 0 or slot13 == 1 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {
				warp = StoreHouseConst.WARP_TO_MATERIAL
			})
		end
	elseif slot12 == 6 then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.BACKYARD)
	elseif slot12 == 7 then
		slot14 = nil

		if slot13 == 1 then
			slot14 = NavalAcademyScene.WARP_TO_TACTIC
		end

		slot0:sendNotification(GAME.GO_SCENE, SCENE.NAVALACADEMYSCENE, {
			warp = slot14
		})
	elseif slot12 == 8 then
		if slot13 == 0 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.EVENT)
		elseif slot13 == 1 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.NAVALACADEMYSCENE)
		end
	elseif slot12 == 9 then
		if slot13 == 2 then
			slot0:sendNotification(TaskMediator.TASK_FILTER, "weekly")
		end
	elseif slot12 == 10 then
		if (slot13 == 4 or slot13 == 5) and getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM) and not slot14:isEnd() then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.MAINUI, {
				subContext = Context.New({
					viewComponent = InstagramLayer,
					mediator = InstagramMediator,
					data = {
						id = slot14.id
					}
				})
			})
		end
	elseif slot12 == 11 then
		if slot13 == 0 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.TECHNOLOGY)
		end
	elseif slot12 == 12 then
		if slot13 == 0 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, {
				warp = NewShopsScene.TYPE_SHAM_SHOP
			})
		elseif slot13 == 1 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
		elseif slot13 == 2 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, {
				warp = NewShopsScene.TYPE_SHOP_STREET
			})
		end
	elseif slot12 == 13 then
		if slot13 == 0 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
		end
	elseif slot12 == 14 then
		if slot13 == 0 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.DAILYLEVEL)
		end
	elseif slot12 == 15 then
		if slot13 == 0 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.SHOP)
		end
	elseif slot12 == 17 then
		if slot13 == 0 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.COMMANDROOM)
		end
	elseif slot12 == 100 then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
	elseif slot12 == 101 then
		if slot13 == 3 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
		elseif slot13 == 5 or slot13 == 8 then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
				mode = DockyardScene.MODE_OVERVIEW
			})
		end
	elseif slot12 == 102 then
		slot14 = slot8.target_id_for_client

		if slot13 == 0 and slot14 ~= 0 then
			slot15 = Chapter.New({
				id = slot14
			})

			if getProxy(ChapterProxy):getMaps()[slot15:getConfig("map")]:getChapter(slot15.id) and slot18:isUnlock() then
				slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
					chapterId = slot18 and slot18.id,
					mapIdx = slot18 and slot18:getConfig("map")
				})
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock"))
			end
		else
			if type(slot14) == "table" then
				slot15 = slot6:getMaps()

				if _.all(slot14, function (slot0)
					return uv0[Chapter.New({
						id = slot0
					}):getConfig("map")]:getChapter(slot0) and not slot3:isUnlock()
				end) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock_1"))

					return
				end
			end

			slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot11)
		end
	elseif slot12 == 200 and (slot13 == 1 or slot13 == 2) then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.BIANDUI)
	end
end

return slot0
