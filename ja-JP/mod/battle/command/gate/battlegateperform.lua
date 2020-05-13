slot0 = class("BattleGatePerform")
ys.Battle.BattleGatePerform = slot0
slot0.__name = "BattleGatePerform"

function slot0.Entrance(slot0, slot1)
	slot2 = slot0.stageId

	if slot0.memory then
		slot1:sendNotification(GAME.BEGIN_STAGE_DONE, {
			prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(pg.expedition_data_template[slot2].dungeon_id).fleet_prefab,
			stageId = slot2,
			system = SYSTEM_PERFORM,
			memory = slot0.memory,
			exitCallback = slot0.exitCallback
		})
	else
		BeginStageCommand.SendRequest(SYSTEM_PERFORM, {}, {
			slot2
		}, function (slot0)
			uv0:sendNotification(GAME.STORY_UPDATE, {
				storyId = pg.StoryMgr.GetInstance():GetStoryByName("index")[uv1]
			})

			uv2.token = slot0.key

			uv0:sendNotification(GAME.BEGIN_STAGE_DONE, uv2)
		end, function (slot0)
			uv0:RequestFailStandardProcess(slot0)
		end)
	end
end

function slot0.Exit(slot0, slot1)
	if slot0.memory then
		slot1:sendNotification(GAME.FINISH_STAGE_DONE, {
			system = SYSTEM_PERFORM
		})
	else
		slot1:SendRequest(slot1.GeneralPackage(slot0, {}), function (slot0)
			uv0:sendNotification(GAME.FINISH_STAGE_DONE, {
				system = SYSTEM_PERFORM,
				exitCallback = uv1.exitCallback
			})
		end, function (slot0)
			uv0:RequestFailStandardProcess(slot0)
		end)
	end
end

return slot0
