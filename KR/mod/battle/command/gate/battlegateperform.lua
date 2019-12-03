slot0 = class("BattleGatePerform")
ys.Battle.BattleGatePerform = slot0
slot0.__name = "BattleGatePerform"

function slot0.Entrance(slot0, slot1)
	slot5 = {
		prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot3).fleet_prefab,
		stageId = slot0.stageId,
		system = SYSTEM_PERFORM,
		memory = slot0.memory,
		exitCallback = slot0.exitCallback
	}

	if slot0.memory then
		slot1:sendNotification(GAME.BEGIN_STAGE_DONE, slot5)
	else
		BeginStageCommand.SendRequest(SYSTEM_PERFORM, {}, {
			slot2
		}, function (slot0)
			slot0:sendNotification(GAME.STORY_UPDATE, {
				storyId = pg.StoryMgr.GetInstance():GetStoryByName("index")[slot1]
			})

			slot0.sendNotification.token = slot0.key

			slot0:sendNotification(GAME.BEGIN_STAGE_DONE, slot0.sendNotification)
		end, function (slot0)
			slot0:RequestFailStandardProcess(slot0)
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
			slot0:sendNotification(GAME.FINISH_STAGE_DONE, {
				system = SYSTEM_PERFORM,
				exitCallback = slot1.exitCallback
			})
		end, function (slot0)
			slot0:RequestFailStandardProcess(slot0)
		end)
	end
end

return slot0
