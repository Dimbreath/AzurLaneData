ys = ys or {}
slot2 = ys.Battle.BattleConfig
slot3 = class("BattleEnvironmentBehaviour")
ys.Battle.BattleEnvironmentBehaviour = slot3
slot3.__name = "BattleEnvironmentBehaviour"
slot3.STATE_READY = "STATE_READY"
slot3.STATE_OVERHEAT = "STATE_OVERHEAT"

function slot3.Ctor(slot0, slot1, slot2)
	slot0._cldUnitList = {}
end

function slot3.SetTemplate(slot0, slot1)
	slot0._tmpData = slot1
	slot0._state = slot0.STATE_READY
end

function slot3.UpdateCollideUnitList(slot0, slot1)
	slot0._cldUnitList = slot1
end

function slot3.OnUpdate(slot0)
	slot0:UpdateReload()

	if slot0._state == slot0.STATE_READY then
		slot0:doBehaviour()
	end
end

function slot3.Dispose(slot0)
	slot0._cldUnitList = nil
	slot0._tmpData = nil
	slot0._CDstartTime = nil
end

function slot3.OnCollide(slot0, slot1)
	return
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
	slot0._state = slot0.STATE_READY
end

function slot3.doBehaviour(slot0)
	if slot0._tmpData.reload_time then
		slot0._CDstartTime = pg.TimeMgr.GetInstance():GetCombatTime()
		slot0._state = slot0.STATE_OVERHEAT
	end
end

slot3.BehaviourClassEnum = {
	[ys.Battle.BattleConst.EnviroumentBehaviour.PLAY_FX] = nil,
	[ys.Battle.BattleConst.EnviroumentBehaviour.DAMAGE] = "BattleEnvironmentBehaviourDamage",
	[ys.Battle.BattleConst.EnviroumentBehaviour.BUFF] = "BattleEnvironmentBehaviourBuff"
}

function slot3.CreateBehaviour(slot0)
	return slot0.Battle[slot1.BehaviourClassEnum[slot0.type]].New()
end

return
