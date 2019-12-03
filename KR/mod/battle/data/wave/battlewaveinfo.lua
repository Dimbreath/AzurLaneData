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

function ys.Battle.BattleWaveInfo.Ctor(slot0)
	slot0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._preWaves = {}
	slot0._postWaves = {}
	slot0._branchWaves = {}
end

function ys.Battle.BattleWaveInfo.IsReady(slot0)
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

function ys.Battle.BattleWaveInfo.IsFinish(slot0)
	return slot0:GetState() == slot0.STATE_PASS or slot0:GetState() == slot0.STATE_FAIL
end

function ys.Battle.BattleWaveInfo.DoBranch(slot0)
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

function ys.Battle.BattleWaveInfo.DoWave(slot0)
	slot0._state = slot0.STATE_ACTIVE
end

function ys.Battle.BattleWaveInfo.AddMonster(slot0)
	return
end

function ys.Battle.BattleWaveInfo.RemoveMonster(slot0)
	return
end

function ys.Battle.BattleWaveInfo.SetWaveData(slot0, slot1)
	slot0._index = slot1.waveIndex
	slot0._isKeyWave = slot1.key
	slot0._logicType = slot1.conditionType or slot0.LOGIC_AND
	slot0._param = slot1.triggerParams or {}
	slot0._preWaveIDs = slot1.preWaves or {}
	slot0._branchWaveIDs = slot1.conditionWaves or {}
	slot0._state = slot0.STATE_DEACTIVE
end

function ys.Battle.BattleWaveInfo.SetCallback(slot0, slot1, slot2)
	slot0._spawnFunc = slot1
	slot0._airFunc = slot2
end

function ys.Battle.BattleWaveInfo.AppendBranchWave(slot0, slot1)
	slot0._branchWaves[#slot0._branchWaves + 1] = slot1
end

function ys.Battle.BattleWaveInfo.AppendPreWave(slot0, slot1)
	slot0._preWaves[#slot0._preWaves + 1] = slot1
end

function ys.Battle.BattleWaveInfo.AppendPostWave(slot0, slot1)
	slot0._postWaves[#slot0._postWaves + 1] = slot1
end

function ys.Battle.BattleWaveInfo.IsKeyWave(slot0)
	return slot0._isKeyWave
end

function ys.Battle.BattleWaveInfo.GetPostWaves(slot0)
	return slot0._postWaves
end

function ys.Battle.BattleWaveInfo.GetIndex(slot0)
	return slot0._index
end

function ys.Battle.BattleWaveInfo.GetType(slot0)
	return slot0._type
end

function ys.Battle.BattleWaveInfo.GetState(slot0)
	return slot0._state
end

function ys.Battle.BattleWaveInfo.GetPreWaveIDs(slot0)
	return slot0._preWaveIDs
end

function ys.Battle.BattleWaveInfo.GetBranchWaveIDs(slot0)
	return slot0._branchWaveIDs
end

function ys.Battle.BattleWaveInfo.Dispose(slot0)
	slot0.EventDispatcher.DetachEventDispatcher(slot0)
end

function ys.Battle.BattleWaveInfo.doPass(slot0)
	if not slot0:IsFinish() then
		slot0._state = slot0.STATE_PASS

		slot0:DispatchEvent(slot1.Event.New(slot1.Battle.BattleEvent.WAVE_FINISH, {}))
	end
end

function ys.Battle.BattleWaveInfo.doFail(slot0)
	if not slot0:IsFinish() then
		slot0._state = slot0.STATE_FAIL

		slot0:DispatchEvent(slot1.Event.New(slot1.Battle.BattleEvent.WAVE_FINISH, {}))
	end
end

return
