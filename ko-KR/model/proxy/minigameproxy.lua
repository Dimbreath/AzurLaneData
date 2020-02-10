slot0 = class("MiniGameProxy", import(".NetProxy"))
slot0.ON_HUB_DATA_UPDATE = "on hub data update"
slot0.ON_MINI_GAME_DATA_UPDATE = "on_mini_game_data_update"

function slot0.register(slot0)
	slot0.miniGameHubDataDic = {}
	slot0.miniGameDataDic = {}
end

function slot0.CheckHasHub(slot0, slot1)
	return slot0.miniGameHubDataDic[slot1] ~= nil
end

function slot0.GetMiniGameData(slot0, slot1)
	if slot0.miniGameDataDic[slot1] == nil then
		slot2.id = slot1
		slot0.miniGameDataDic[slot1] = MiniGameData.New({})
	end

	return slot0.miniGameDataDic[slot1]
end

function slot0.GetHubByHubId(slot0, slot1)
	if slot0.miniGameHubDataDic[slot1] == nil then
		slot2.id = slot1
		slot0.miniGameHubDataDic[slot1] = MiniGameHubData.New({})
	end

	return slot0.miniGameHubDataDic[slot1]
end

function slot0.GetHubByGameId(slot0, slot1)
	if slot0.miniGameHubDataDic[slot0:GetMiniGameData(slot1):getConfig("hub_id")] == nil then
		slot4.id = slot3
		slot0.miniGameHubDataDic[slot3] = MiniGameHubData.New({})
	end

	return slot0.miniGameHubDataDic[slot3]
end

function slot0.UpdataHubData(slot0, slot1)
	slot3 = slot0:GetHubByHubId(slot1.id)

	slot3:UpdateData(slot1)
	slot0.facade:sendNotification(uv0.ON_HUB_DATA_UPDATE, slot3)
end

function slot0.RequestInitData(slot0, slot1, slot2)
	if slot2 and not (slot0:GetMiniGameData(slot1):getConfig("request_data") == 1) then
		return
	end

	if slot3:CheckInTime() then
		if slot3:getConfig("type") == MiniGameConst.MG_TYPE_2 and not slot3:GetRuntimeData("fetchData") then
			slot11.hubid = slot0:GetHubByGameId(slot1).id
			slot11.cmd = MiniGameOPCommand.CMD_SPECIAL_GAME
			slot12[1] = slot3.id
			slot11.args1 = {
				nil,
				1
			}

			slot0:sendNotification(GAME.SEND_MINI_GAME_OP, {})
			slot3:SetRuntimeData("fetchData", true)
		end
	end
end

function slot0.remove(slot0)
end

return slot0
