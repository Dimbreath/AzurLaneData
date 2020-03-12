slot0 = class("DecodeGameController")

function slot0.Ctor(slot0, slot1)
	slot0.model = DecodeGameModel.New(slot0)
	slot0.view = DecodeGameView.New(slot0)
end

function slot0.SetCallback(slot0, slot1, slot2, slot3)
	slot0.exitCallBack = slot1
	slot0.saveDataCallback = slot2
	slot0.successCallback = slot3
end

function slot0.SetUp(slot0, slot1)
	seriesAsync({
		function (slot0)
			slot0.isIniting = true

			slot0.model:SetData(slot0.model.SetData)
			slot0:UpdateProgress()
			slot0.view:UpdateCanUseCnt(slot0.model.canUseCnt)
			slot0:SwitchMap(slot0.model.map.id, slot0())
		end,
		function (slot0)
			slot0:PlayVoice(DecodeGameConst.OPEN_DOOR_VOICE)
			slot0.view:DoEnterAnim(slot0)
		end,
		function (slot0)
			pg.StoryMgr.GetInstance():Play(DecodeGameConst.STORYID, slot0)
		end,
		function (slot0)
			slot0.view:ShowHelper(1, slot0)
		end,
		function (slot0)
			slot0.isIniting = nil

			slot0:ShowTip()
			slot0.view:Inited(slot0.model.isFinished)
		end
	})
end

function slot0.ShowTip(slot0)
	slot1 = slot0.model:GetUnlockMapCnt()
	slot2 = nil

	if slot0.model.isFinished then
		slot2 = 0
	elseif slot1 < DecodeGameConst.MAX_MAP_COUNT and slot0.model.canUseCnt <= 0 then
		slot2 = 1
	elseif slot1 < DecodeGameConst.MAX_MAP_COUNT and slot0.model.canUseCnt > 0 then
		slot2 = 2
	elseif not slot0.isInDecodeMap and not slot0.isInComparison and slot1 == DecodeGameConst.MAX_MAP_COUNT then
		slot2 = 3
	elseif slot0.isInDecodeMap and not slot0.isInComparison and slot1 == DecodeGameConst.MAX_MAP_COUNT then
		slot2 = 4
	elseif slot0.isInDecodeMap and slot0.isInComparison and slot1 == DecodeGameConst.MAX_MAP_COUNT then
		slot2 = 5
	end

	slot0.view:ShowTip(slot2)
end

function slot0.UpdateProgress(slot0, slot1)
	slot2 = slot0.model:GetUnlockedCnt()
	slot3 = slot0.model:GetUnlockMapCnt()
	slot4, slot5 = slot0.model:GetPassWordProgress()
	slot1 = slot1 or function ()
		return
	end

	if slot5 > (slot0.finishCnt or 0) and slot5 ~= #slot4 then
		slot0.finishCnt = slot5

		slot0:PlayVoice(DecodeGameConst.INCREASE_PASSWORD_PROGRESS_VOICE)
	end

	slot0.view:UpdateProgress(slot2, slot3, slot4, slot1)
end

function slot0.SwitchMap(slot0, slot1, slot2)
	if slot0.inSwitching then
		return
	end

	if slot0.mapId ~= slot1 then
		function slot3(slot0)
			parallelAsync({
				function (slot0)
					if not slot0.isInDecodeMap then
						slot0.view:OnSwitchMap(slot0)
					else
						slot0()
					end
				end,
				function (slot0)
					if not slot0.mapId then
						slot0()

						return
					end

					slot0.model:ExitMap()
					slot0.view:OnExitMap(slot0.mapId, slot0.isInDecodeMap, slot0)
				end,
				function (slot0)
					slot0.mapId = nil

					slot0.model:SwitchMap(slot0.model.SwitchMap)
					slot0.view:UpdateMap(slot0.model.map)
					slot0.view:OnEnterMap(slot0.view.OnEnterMap, slot0.isInDecodeMap, slot0)
				end
			}, slot0)
		end

		seriesAsync({
			function (slot0)
				if not slot0.isIniting then
					slot0:PlayVoice(DecodeGameConst.SWITCH_MAP_VOCIE)
				end

				slot0.inSwitching = true

				slot0(slot0)
			end,
			function (slot0)
				slot0.mapId = slot0

				if not slot0.isInDecodeMap then
					slot0()

					return
				end

				slot0.isInComparison = true

				slot0:PlayVoice(DecodeGameConst.SCAN_MAP_VOICE)
				slot0.view:OnDecodeMap(slot0.model.map, slot0)
			end,
			function (slot0)
				slot0.inSwitching = nil

				if slot0.isInDecodeMap then
					slot0:ShowTip()
					slot0.view:ShowHelper(3, slot0)
				else
					slot0()
				end
			end
		}, slot2)
	end
end

function slot0.Unlock(slot0, slot1)
	if slot0.inSwitching then
		return
	end

	if slot0.isInDecodeMap then
		slot0:EnterPassWord(slot1)
	else
		slot0:UnlockMapItem(slot1)
	end
end

function slot0.EnterPassWord(slot0, slot1)
	if not slot0.model:IsMapKey(slot1) then
		return
	end

	if slot0.model:IsUsedMapKey(slot1) then
		return
	end

	if slot0.model:CheckIndex(slot1) then
		slot0.model:InsertMapKey(slot1)
		slot0.view:OnRightCode(slot1, slot0.model:GetMapKeyStr(slot1), slot0.model:GetCurrMapKeyIndex(slot1))

		if slot0.model:IsSuccess() then
			slot0.model:Finish()
			slot0:PlayVoice(DecodeGameConst.GET_AWARD_DONE_VOICE)
			slot0.view:OnSuccess(function ()
				if slot0.successCallback then
					slot0.successCallback()
				end
			end)
		else
			slot0:PlayVoice(DecodeGameConst.PASSWORD_IS_RIGHT_VOICE)
		end

		slot0:UpdateProgress()
	else
		slot0:PlayVoice(DecodeGameConst.PASSWORD_IS_FALSE_VOICE)
		slot0.view:OnFalseCode(slot1)
	end
end

function slot0.UnlockMapItem(slot0, slot1)
	if slot0.model.canUseCnt > 0 and not slot0.model:IsUnlock(slot1) then
		seriesAsync({
			function (slot0)
				slot0.inSwitching = true

				slot0.model:UnlockMapItem(slot0.model.UnlockMapItem)
				slot0.view:UnlockMapItem(slot0.view.UnlockMapItem, slot0)
			end,
			function (slot0)
				slot0.view:UpdateCanUseCnt(slot0.model.canUseCnt)

				if slot0.model:IsUnlockMap(slot0.model.map.id) then
					slot0:RepairMap()
				else
					slot0:PlayVoice(DecodeGameConst.INCREASE_PROGRESS_VOICE)
					slot0:UpdateProgress()

					if slot0.saveDataCallback then
						slot0.saveDataCallback()
					end

					slot0.inSwitching = nil
				end

				slot0:ShowTip()
				slot0()
			end
		})
	end
end

function slot0.RepairMap(slot0)
	seriesAsync({
		function (slot0)
			slot0.model:OnRepairMap()
			slot0.view:OnMapRepairing(slot0)
		end,
		function (slot0)
			if slot0.saveDataCallback then
				slot0:saveDataCallback()
			else
				slot0()
			end
		end,
		function (slot0)
			slot0:PlayVoice(DecodeGameConst.INCREASE_PROGRESS_VOICE)
			slot0.view:UpdateMap(slot0.model.map)
			slot0:UpdateProgress(slot0)
		end,
		function (slot0)
			if slot0.model:GetUnlockMapCnt() == DecodeGameConst.MAX_MAP_COUNT then
				slot0.view:ShowHelper(2, slot0)
			end

			slot0.inSwitching = nil
		end
	})
end

function slot0.CanSwitch(slot0)
	return not slot0.inSwitching
end

function slot0.SwitchToDecodeMap(slot0, slot1)
	if slot0.inSwitching then
		return
	end

	if slot1 then
		slot0:EnterDecodeMap()
	else
		slot0:ExitDeCodeMap()
	end
end

function slot0.ExitDeCodeMap(slot0)
	slot0.isFirstSwitch = false

	seriesAsync({
		function (slot0)
			slot0:PlayVoice(DecodeGameConst.PRESS_UP_PASSWORDBTN)

			slot0.finishCnt = 0
			slot0.isInComparison = nil
			slot0.inSwitching = true

			slot0.view:OnEnterNormalMapBefore(slot0)
		end,
		function (slot0)
			parallelAsync({
				function (slot0)
					slot0.view:OnEnterNormalMap(slot0.model.map, slot0)
				end,
				function (slot0)
					slot0.mapId = slot0.model.map.id

					slot0.view:OnEnterMap(slot0.mapId, false, slot0)
				end
			}, slot0)
		end,
		function ()
			slot0.model:ClearMapKeys()
			slot0.model.ClearMapKeys:UpdateProgress()

			slot0.model.ClearMapKeys.UpdateProgress.isInDecodeMap = nil
			slot0.model.ClearMapKeys.UpdateProgress.inSwitching = nil

			slot0.model.ClearMapKeys.UpdateProgress:ShowTip()
		end
	})
end

function slot0.EnterDecodeMap(slot0)
	slot0.isInDecodeMap = true
	slot0.isFirstSwitch = true

	seriesAsync({
		function (slot0)
			slot0:PlayVoice(DecodeGameConst.PRESS_DOWN_PASSWORDBTN)

			slot0.inSwitching = true

			parallelAsync({
				function (slot0)
					slot0.view:OnEnterDecodeMapBefore(slot0)
				end,
				function (slot0)
					slot0.view:OnExitMap(slot0.mapId, true, slot0)
				end
			}, slot0)
		end,
		function (slot0)
			slot0.mapId = nil

			slot0.view:OnEnterDecodeMap(slot0.model:GetMapKeyStrs(), slot0)
		end,
		function (slot0)
			slot0:ShowTip()

			slot0.inSwitching = nil
		end
	})
end

function slot0.ExitGame(slot0)
	if slot0.inSwitching then
		return
	end

	if slot0.exitCallBack then
		slot0.exitCallBack()
	end
end

function slot0.PlayVoice(slot0, slot1)
	if slot1 and slot1 ~= "" then
		slot0.view:PlayVoice(slot1)
	end
end

function slot0.GetSaveData(slot0)
	return slot0.model.unlocks
end

function slot0.Dispose(slot0)
	slot0.model:Dispose()
	slot0.view:Dispose()
end

return slot0
