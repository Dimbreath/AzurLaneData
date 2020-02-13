ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = ys.Battle.BattleVariable
ys.Battle.BattleManualWeaponAutoBot = class("BattleManualWeaponAutoBot")
ys.Battle.BattleManualWeaponAutoBot.__name = "BattleManualWeaponAutoBot"

function ys.Battle.BattleManualWeaponAutoBot.Ctor(slot0, slot1)
	slot0.EventListener.AttachEventListener(slot0)

	slot0._fleetVO = slot1

	slot0:init(slot1)
end

function ys.Battle.BattleManualWeaponAutoBot.init(slot0)
	slot0._active = false
	slot0._isPlayFocus = true
	slot0._chargeVO = slot0._fleetVO:GetChargeWeaponVO()
	slot0._torpedoVO = slot0._fleetVO:GetTorpedoWeaponVO()
	slot0._AAVO = slot0._fleetVO:GetAirAssistVO()
	slot0._totalTime = 0
	slot0._lastActiveTimeStamp = nil
end

function ys.Battle.BattleManualWeaponAutoBot.Update(slot0)
	if slot0._active then
		if not slot0._torpedoVO:IsOverLoad() then
			slot0._fleetVO:QuickCastTorpedo()

			return
		end

		if not slot0._AAVO:IsOverLoad() then
			slot0._fleetVO:UnleashAllInStrike()

			return
		end

		if not slot0._chargeVO:IsOverLoad() then
			slot0._fleetVO:QuickTagChrageWeapon(slot0._isPlayFocus)

			return
		end
	end
end

function ys.Battle.BattleManualWeaponAutoBot.IsActive(slot0)
	return slot0._active
end

function ys.Battle.BattleManualWeaponAutoBot.SetActive(slot0, slot1, slot2)
	if slot0._active ~= slot1 and slot1 == true then
		slot0._lastActiveTimeStamp = pg.TimeMgr.GetInstance():GetCombatTime()
	elseif slot0._active ~= slot1 and slot1 == false and slot0._lastActiveTimeStamp ~= nil then
		slot0._totalTime = slot0._totalTime + pg.TimeMgr.GetInstance():GetCombatTime() - slot0._lastActiveTimeStamp
		slot0._lastActiveTimeStamp = nil
	end

	slot0._active = slot1
	slot0._isPlayFocus = slot2
end

function ys.Battle.BattleManualWeaponAutoBot.GetTotalActiveDuration(slot0)
	if slot0._lastActiveTimeStamp then
		slot0._totalTime = slot0._totalTime + pg.TimeMgr.GetInstance():GetCombatTime() - slot0._lastActiveTimeStamp
		slot0._lastActiveTimeStamp = nil
	end

	return slot0._totalTime
end

function ys.Battle.BattleManualWeaponAutoBot.Dispose(slot0)
	slot0._chargeVO = nil
	slot0._torpedoVO = nil
	slot0._AAVO = nil
	slot0._dataProxy = nil
	slot0._uiMediator = nil

	slot0.EventListener.DetachEventListener(slot0)
end

return
