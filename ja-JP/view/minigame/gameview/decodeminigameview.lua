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

function slot0.GetPtActivity(slot0)
	for slot6, slot7 in ipairs(slot2) do
		if slot7:getConfig("config_id") == pg.gameset.activity_res_id.key_value then
			return slot7
		end
	end
end

function slot0.PackData(slot0)
	function slot5(slot0)
		for slot4 = 1, slot0, 1 do
			if not table.contains(slot0, slot4) then
				return slot4
			end
		end
	end

	slot6 = PlayerPrefs.GetInt("DecodeGameMapId", 1)
	slot8 = slot0:GetMGData():GetRuntimeData("elements")
	slot10 = {}

	for slot14 = 1, math.min(slot3, math.floor(slot0:GetPtActivity().data1 / 200)) - slot0:GetMGHubData().count, 1 do
		if slot8[slot14] then
			table.insert(slot10, slot8[slot14])
		else
			table.insert(slot10, slot5(slot10))
		end
	end

	return {
		mapId = slot6,
		unlocks = slot10,
		canUseCnt = slot7.count,
		passwords = DecodeGameConst.MAPS_PASSWORD,
		isFinished = slot7.ultimate > 0
	}
end

function slot0.OnGetAwardDone(slot0, slot1)
	if slot1.cmd == MiniGameOPCommand.CMD_COMPLETE and slot0.onGetAward then
		slot0.onGetAward()

		slot0.onGetAward = nil
	end
end

function slot0.willExit(slot0)
	PlayerPrefs.SetInt("DecodeGameMapId", slot0.controller.mapId or 1)
	PlayerPrefs.Save()
	slot0.controller:Dispose()
end

return slot0
