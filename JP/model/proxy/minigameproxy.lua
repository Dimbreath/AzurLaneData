slot0 = class("MiniGameProxy", import(".NetProxy"))
slot0.ON_HUB_DATA_UPDATE = "on hub data update"
slot0.ON_MINI_GAME_DATA_UPDATE = "on_mini_game_data_update"

slot0.register = function (slot0)
	slot0.miniGameHubDataDic = {}
	slot0.miniGameDataDic = {}
end

slot0.CheckHasHub = function (slot0, slot1)
	return slot0.miniGameHubDataDic[slot1] ~= nil
end

slot0.GetMiniGameData = function (slot0, slot1)
	if slot0.miniGameDataDic[slot1] == nil then
		slot0.miniGameDataDic[slot1] = MiniGameData.New({
			id = slot1
		})
	end

	return slot0.miniGameDataDic[slot1]
end

slot0.GetHubByHubId = function (slot0, slot1)
	if slot0.miniGameHubDataDic[slot1] == nil then
		slot0.miniGameHubDataDic[slot1] = MiniGameHubData.New({
			id = slot1
		})
	end

	return slot0.miniGameHubDataDic[slot1]
end

slot0.GetHubByGameId = function (slot0, slot1)
	if slot0.miniGameHubDataDic[slot0:GetMiniGameData(slot1).getConfig(slot2, "hub_id")] == nil then
		slot0.miniGameHubDataDic[slot3] = MiniGameHubData.New({
			id = slot3
		})
	end

	return slot0.miniGameHubDataDic[slot3]
end

slot0.UpdataHubData = function (slot0, slot1)
	slot3 = slot0:GetHubByHubId(slot2)

	slot3:UpdateData(slot1)
	slot0.facade:sendNotification(slot0.ON_HUB_DATA_UPDATE, slot3)
end

slot0.RequestInitData = function (slot0, slot1, slot2)
	slot4 = slot0:GetMiniGameData(slot1):getConfig("request_data") == 1

	if slot2 and not slot4 then
		return
	end

	if slot3:CheckInTime() then
		slot5 = slot0:GetHubByGameId(slot1)

		if slot3:getConfig("type") == MiniGameConst.MG_TYPE_2 and not slot3:GetRuntimeData("fetchData") then
			slot0:sendNotification(GAME.SEND_MINI_GAME_OP, {
				hubid = slot5.id,
				cmd = MiniGameOPCommand.CMD_SPECIAL_GAME,
				args1 = {
					slot3.id,
					1
				}
			})
			slot3:SetRuntimeData("fetchData", true)
		end
	end
end

slot0.remove = function (slot0)
	return
end

return slot0
