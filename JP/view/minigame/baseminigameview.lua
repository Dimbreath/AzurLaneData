slot0 = class("BaseMiniGameView", import("..base.BaseUI"))

slot0.SetExtraData = function (slot0, slot1)
	slot0.mg_extraData = slot1
end

slot0.GetExtraValue = function (slot0, slot1)
	if slot0.mg_extraData[slot1] then
		return slot0.mg_extraData[slot1]
	else
		return nil
	end
end

slot0.SetMGData = function (slot0, slot1)
	slot0.mg_data = slot1
end

slot0.GetMGData = function (slot0)
	return slot0.mg_data
end

slot0.SetMGHubData = function (slot0, slot1)
	slot0.mg_hubData = slot1
end

slot0.GetMGHubData = function (slot0)
	return slot0.mg_hubData
end

slot0.SendSuccess = function (slot0, ...)
	slot0:emit(BaseMiniGameMediator.MINI_GAME_SUCCESS, ...)
end

slot0.SendFailure = function (slot0, ...)
	slot0:emit(BaseMiniGameMediator.MINI_GAME_FAILURE, ...)
end

slot0.StoreDataToServer = function (slot0, slot1)
	if slot0.mg_data:getConfig("type") == MiniGameConst.MG_TYPE_2 then
		table.insertto(slot3, slot1)
		slot0.mg_data:SetRuntimeData("elements", slot1)
		slot0:emit(BaseMiniGameMediator.MINI_GAME_OPERATOR, MiniGameOPCommand.CMD_SPECIAL_GAME, {
			slot0.mg_data.id,
			2
		})
	end
end

slot0.SendOperator = function (slot0, slot1, slot2)
	slot0:emit(BaseMiniGameMediator.MINI_GAME_OPERATOR, slot1, slot2)
end

slot0.OnSendMiniGameOPDone = function (slot0, slot1)
	return
end

slot0.OnModifyMiniGameDataDone = function (slot0, slot1)
	return
end

slot0.OnApplicationPaused = function (slot0, slot1)
	return
end

return slot0
