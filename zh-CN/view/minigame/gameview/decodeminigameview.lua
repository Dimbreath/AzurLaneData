slot0 = class("DecodeMiniGameView", import("..BaseMiniGameView"))

function slot0.getUIName(slot0)
	return "DecodeGameUI"
end

function slot0.didEnter(slot0)
	slot0.controller = DecodeGameController.New()

	slot0.controller.view:SetUI(slot0._tf)
	slot0.controller:SetCallback(slot1, slot2, function ()
		if slot0:GetMGHubData().ultimate == 0 then
			pg.m02:sendNotification(GAME.SEND_MINI_GAME_OP, {
				hubid = slot0.id,
				cmd = MiniGameOPCommand.CMD_ULTIMATE,
				args1 = {}
			})
		end
	end)
	slot0.controller:SetUp(slot0:PackData())
end

function slot0.PackData(slot0)
	slot2 = slot0:GetMGHubData()

	return {
		mapId = PlayerPrefs.GetInt("DecodeGameMapId", 1),
		unlocks = _.slice(slot3, 1, math.min(DecodeGameConst.MAP_ROW * DecodeGameConst.MAP_COLUMN * DecodeGameConst.MAX_MAP_COUNT - slot2.count, #slot0:GetMGData():GetRuntimeData("elements"))),
		canUseCnt = slot2.count,
		passwords = DecodeGameConst.MAPS_PASSWORD,
		isFinished = slot2.ultimate > 0
	}
end

function slot0.OnGetAwardDone(slot0, slot1)
	if slot1.cmd == MiniGameOPCommand.CMD_COMPLETE and slot0.onGetAward then
		slot0.onGetAward()
	end
end

function slot0.willExit(slot0)
	PlayerPrefs.SetInt("DecodeGameMapId", slot0.controller.mapId or 1)
	PlayerPrefs.Save()
	slot0.controller:Dispose()
end

return slot0
