ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleConst
slot2 = slot0.Battle.BattleConfig
slot3 = class("BattleEnvironmentBehaviour")
slot0.Battle.BattleEnvironmentBehaviour = slot3
slot3.__name = "BattleEnvironmentBehaviour"
slot3.STATE_READY = "STATE_READY"
slot3.STATE_OVERHEAT = "STATE_OVERHEAT"

function slot3.Ctor(slot0, slot1, slot2)
	slot0._cldUnitList = {}
end

function slot3.SetTemplate(slot0, slot1)
	slot0._tmpData = slot1
	slot0._state = uv0.STATE_READY
end

function slot3.UpdateCollideUnitList(slot0, slot1)
	slot0._cldUnitList = slot1
end

function slot3.OnUpdate(slot0)
	slot0:UpdateReload()

	if slot0._state == uv0.STATE_READY then
		slot0:doBehaviour()
	end
end

function slot3.Dispose(slot0)
	slot0._cldUnitList = nil
	slot0._tmpData = nil
	slot0._CDstartTime = nil
end

function slot3.OnCollide(slot0, slot1)
end

function slot3.GetCurrentState(slot0)
	return slot0._state
end

function slot3.UpdateReload(slot0)
	if slot0._CDstartTime then
		if slot0:getReloadFinishTimeStamp() <= pg.TimeMgr.GetInstance():GetCombatTime() then
			slot0:handleCoolDown()
		else
			return
		end
	end
end

function slot3.getReloadFinishTimeStamp(slot0)
	return slot0._tmpData.reload_time + slot0._CDstartTime
end

function slot3.handleCoolDown(slot0)
	slot0._state = uv0.STATE_READY
end

function slot3.doBehaviour(slot0)
	if slot0._tmpData.reload_time then
		slot0._CDstartTime = pg.TimeMgr.GetInstance():GetCombatTime()
		slot0._state = uv0.STATE_OVERHEAT
	end
end

slot3.BehaviourClassEnum = {
	[slot1.EnviroumentBehaviour.PLAY_FX] = nil,
	[slot1.EnviroumentBehaviour.DAMAGE] = "BattleEnvironmentBehaviourDamage",
	[slot1.EnviroumentBehaviour.BUFF] = "BattleEnvironmentBehaviourBuff"
}

function slot3.CreateBehaviour(slot0)
	return uv0.Battle[uv1.BehaviourClassEnum[slot0.type]].New()
end
