ys = ys or {}
slot1 = ys.Battle.BattleConst.WaveTriggerType
ys.Battle.BattleWaveInfo = class("BattleWaveInfo")
ys.Battle.BattleWaveInfo.__name = "BattleWaveInfo"
ys.Battle.BattleWaveInfo.LOGIC_AND = 0
ys.Battle.BattleWaveInfo.LGOIC_OR = 1
ys.Battle.BattleWaveInfo.STATE_DEACTIVE = "STATE_DEACTIVE"
ys.Battle.BattleWaveInfo.STATE_ACTIVE = "STATE_ACTIVE"
ys.Battle.BattleWaveInfo.STATE_PASS = "STATE_PASS"
ys.Battle.BattleWaveInfo.STATE_FAIL = "STATE_FAIL"

ys.Battle.BattleWaveInfo.Ctor = function (slot0)
	slot0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._preWaves = {}
	slot0._postWaves = {}
	slot0._branchWaves = {}
end

ys.Battle.BattleWaveInfo.IsReady = function (slot0)
	slot1 = #slot0._preWaves
	slot2 = nil

	if #slot0._preWaves == 0 then
		slot2 = true
	elseif slot0._logicType == slot0.LOGIC_AND then
		slot2 = true

		for slot6, slot7 in ipairs(slot0._preWaves) do
			if not slot7:IsFinish() then
				slot2 = false

				break
			end
		end
	elseif slot0._logicType == slot0.LGOIC_OR then
		slot2 = false

		for slot6, slot7 in ipairs(slot0._preWaves) do
			if slot7:IsFinish() then
				slot2 = true

				break
			end
		end
	end

	return slot2
end

ys.Battle.BattleWaveInfo.IsFinish = function (slot0)
	return slot0:GetState() == slot0.STATE_PASS or slot0:GetState() == slot0.STATE_FAIL
end

ys.Battle.BattleWaveInfo.DoBranch = function (slot0)
	slot1 = false

	for slot5, slot6 in ipairs(slot0._branchWaves) do
		if not slot0._branchWaveIDs[slot6:GetIndex()] or slot6:GetState() ~= slot0.STATE_PASS then
			if not slot7 and slot6:GetState() == slot0.STATE_FAIL then
			else
				slot0:doFail()

				return
			end
		end
	end

	slot0:DoWave()
end

ys.Battle.BattleWaveInfo.DoWave = function (slot0)
	slot0._state = slot0.STATE_ACTIVE
end

ys.Battle.BattleWaveInfo.AddMonster = function (slot0)
	return
end

ys.Battle.BattleWaveInfo.RemoveMonster = function (slot0)
	return
end

ys.Battle.BattleWaveInfo.SetWaveData = function (slot0, slot1)
	slot0._index = slot1.waveIndex
	slot0._isKeyWave = slot1.key
	slot0._logicType = slot1.conditionType or slot0.LOGIC_AND
	slot0._param = slot1.triggerParams or {}
	slot0._preWaveIDs = slot1.preWaves or {}
	slot0._branchWaveIDs = slot1.conditionWaves or {}
	slot0._state = slot0.STATE_DEACTIVE
end

ys.Battle.BattleWaveInfo.SetCallback = function (slot0, slot1, slot2)
	slot0._spawnFunc = slot1
	slot0._airFunc = slot2
end

ys.Battle.BattleWaveInfo.AppendBranchWave = function (slot0, slot1)
	slot0._branchWaves[#slot0._branchWaves + 1] = slot1
end

ys.Battle.BattleWaveInfo.AppendPreWave = function (slot0, slot1)
	slot0._preWaves[#slot0._preWaves + 1] = slot1
end

ys.Battle.BattleWaveInfo.AppendPostWave = function (slot0, slot1)
	slot0._postWaves[#slot0._postWaves + 1] = slot1
end

ys.Battle.BattleWaveInfo.IsKeyWave = function (slot0)
	return slot0._isKeyWave
end

ys.Battle.BattleWaveInfo.GetPostWaves = function (slot0)
	return slot0._postWaves
end

ys.Battle.BattleWaveInfo.GetIndex = function (slot0)
	return slot0._index
end

ys.Battle.BattleWaveInfo.GetType = function (slot0)
	return slot0._type
end

ys.Battle.BattleWaveInfo.GetState = function (slot0)
	return slot0._state
end

ys.Battle.BattleWaveInfo.GetPreWaveIDs = function (slot0)
	return slot0._preWaveIDs
end

ys.Battle.BattleWaveInfo.GetBranchWaveIDs = function (slot0)
	return slot0._branchWaveIDs
end

ys.Battle.BattleWaveInfo.Dispose = function (slot0)
	slot0.EventDispatcher.DetachEventDispatcher(slot0)
end

ys.Battle.BattleWaveInfo.doPass = function (slot0)
	if not slot0:IsFinish() then
		slot0._state = slot0.STATE_PASS

		slot0:DispatchEvent(slot1.Event.New(slot1.Battle.BattleEvent.WAVE_FINISH, {}))
	end
end

ys.Battle.BattleWaveInfo.doFail = function (slot0)
	if not slot0:IsFinish() then
		slot0._state = slot0.STATE_FAIL

		slot0:DispatchEvent(slot1.Event.New(slot1.Battle.BattleEvent.WAVE_FINISH, {}))
	end
end

return
