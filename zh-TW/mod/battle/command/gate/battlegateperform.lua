slot0 = class("BattleGatePerform")
ys.Battle.BattleGatePerform = slot0
slot0.__name = "BattleGatePerform"

function slot0.Entrance(slot0, slot1)
	slot2 = slot0.stageId
	slot5.prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(pg.expedition_data_template[slot2].dungeon_id).fleet_prefab
	slot5.stageId = slot2
	slot5.system = SYSTEM_PERFORM
	slot5.memory = slot0.memory
	slot5.exitCallback = slot0.exitCallback

	if slot0.memory then
		slot1:sendNotification(GAME.BEGIN_STAGE_DONE, {})
	else
		slot11[1] = slot2

		BeginStageCommand.SendRequest(SYSTEM_PERFORM, {}, {}, function (slot0)
			slot5.storyId = pg.StoryMgr.GetInstance():GetStoryByName("index")[uv1]

			uv0:sendNotification(GAME.STORY_UPDATE, {})

			uv2.token = slot0.key

			uv0:sendNotification(GAME.BEGIN_STAGE_DONE, uv2)
		end, function (slot0)
			uv0:RequestFailStandardProcess(slot0)
		end)
	end
end

function slot0.Exit(slot0, slot1)
	if slot0.memory then
		slot5.system = SYSTEM_PERFORM

		slot1:sendNotification(GAME.FINISH_STAGE_DONE, {})
	else
		slot1:SendRequest(slot1.GeneralPackage(slot0, {}), function (slot0)
			slot4.system = SYSTEM_PERFORM
			slot4.exitCallback = uv1.exitCallback

			uv0:sendNotification(GAME.FINISH_STAGE_DONE, {})
		end, function (slot0)
			uv0:RequestFailStandardProcess(slot0)
		end)
	end
end

return slot0
