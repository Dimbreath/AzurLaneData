ys = ys or {}
ys.Battle.BattleVigilantBar = class("BattleVigilantBar")
ys.Battle.BattleVigilantBar.__name = "BattleVigilantBar"
ys.Battle.BattleVigilantBar.MIN = 0.267
ys.Battle.BattleVigilantBar.MAX = 0.7335
ys.Battle.BattleVigilantBar.METER_LENGTH = ys.Battle.BattleVigilantBar.MAX - ys.Battle.BattleVigilantBar.MIN
ys.Battle.BattleVigilantBar.STATE_CALM = 0
ys.Battle.BattleVigilantBar.STATE_SUSPICIOUS = 1
ys.Battle.BattleVigilantBar.STATE_VIGILANT = 2
ys.Battle.BattleVigilantBar.STATE_ENGAGE = 3

function ys.Battle.BattleVigilantBar.Ctor(slot0, slot1)
	slot0._vigilantBar = slot1
	slot0._vigilantBarGO = slot0._vigilantBar.gameObject
	slot0._progress = slot0._vigilantBar:Find("progress"):GetComponent(typeof(Image))
	slot0._markList = {
		[slot0.STATE_CALM] = slot0._vigilantBar:Find("mark/" .. slot0.STATE_CALM),
		[slot0.STATE_SUSPICIOUS] = slot0._vigilantBar:Find("mark/" .. slot0.STATE_SUSPICIOUS),
		[slot0.STATE_VIGILANT] = slot0._vigilantBar:Find("mark/" .. slot0.STATE_VIGILANT),
		[slot0.STATE_ENGAGE] = slot0._vigilantBar:Find("mark/" .. slot0.STATE_ENGAGE)
	}
end

function ys.Battle.BattleVigilantBar.ConfigVigilant(slot0, slot1)
	slot0._vigilantState = slot1
end

function ys.Battle.BattleVigilantBar.UpdateVigilantProgress(slot0)
	slot0._progress.fillAmount = slot0.meterConvert(slot0._vigilantState:GetVigilantRate())
end

function ys.Battle.BattleVigilantBar.UpdateVigilantMark(slot0)
	slot1 = slot0._vigilantState:GetVigilantMark()

	for slot5, slot6 in ipairs(slot0._markList) do
		SetActive(slot6, slot1 == slot5)
	end
end

function ys.Battle.BattleVigilantBar.UpdateVigilantBarPosition(slot0, slot1)
	slot0._vigilantBar.position = slot1
end

function ys.Battle.BattleVigilantBar.meterConvert(slot0)
	return slot0.METER_LENGTH * slot0 + slot0.MIN
end

function ys.Battle.BattleVigilantBar.Dispose(slot0)
	slot0._vigilantState = nil

	Object.Destroy(slot0._vigilantBarGO)

	slot0._vigilantBar = nil
	slot0._vigilantBarGO = nil
	slot0._markList = nil
	slot0._progress = nil
end

return
