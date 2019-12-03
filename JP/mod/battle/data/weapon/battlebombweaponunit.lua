ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = class("BattleBombWeaponUnit", ys.Battle.BattleWeaponUnit)
ys.Battle.BattleBombWeaponUnit = slot2
slot2.__name = "BattleBombWeaponUnit"

function slot2.Ctor(slot0)
	slot0.super.Ctor(slot0)

	slot0._alertCache = {}
	slot0._cacheList = {}
end

function slot2.Clear(slot0)
	if slot0._alertTimer then
		pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._alertTimer)
	end

	slot0._alertTimer = nil

	for slot4, slot5 in pairs(slot0._cacheList) do
		slot5:Destroy()
	end

	slot0._cacheList = nil

	slot0.super.Clear(slot0)
end

function slot2.HostOnEnemy(slot0)
	slot0.super.HostOnEnemy(slot0)

	if slot0._preCastInfo.alertTime ~= nil then
		slot0._showPrecastAlert = true
		slot0._alertTimer = pg.TimeMgr.GetInstance():AddBattleTimer("", -1, slot0._preCastInfo.alertTime or 3, function ()
			slot0._alertTimer:Stop()
			slot0._alertTimer.Stop:Fire()
		end, true, true)
	end
end

function slot2.Update(slot0, slot1)
	slot0:UpdateReload()

	if slot0._currentState == slot0.STATE_READY then
		slot0:updateMovementInfo()

		if slot0:Tracking() then
			if slot0._showPrecastAlert then
				slot0:PreCast(slot2)
			else
				slot0._currentState = slot0.STATE_PRECAST_FINISH
			end
		end
	end

	if slot0._currentState == slot0.STATE_PRECAST_FINISH then
		slot0:updateMovementInfo()

		slot2 = slot0:Tracking()
		slot3 = slot0:GetDirection()
		slot4 = slot0:GetAttackAngle()

		for slot8, slot9 in ipairs(slot0._majorEmitterList) do
			slot9:Ready()
		end

		for slot8, slot9 in ipairs(slot0._majorEmitterList) do
			slot9:Fire(slot2, slot3, slot4)
		end

		slot0.super.Fire(slot0, slot2)
	end
end

function slot2.PreCast(slot0, slot1)
	for slot5, slot6 in ipairs(slot0._majorEmitterList) do
		slot6:Ready()
	end

	for slot5, slot6 in ipairs(slot0._majorEmitterList) do
		slot6:Fire(slot1, slot0:GetDirection(), slot0:GetAttackAngle())
	end

	slot0.super.PreCast(slot0)
	slot0._alertTimer:Start()
end

function slot2.AddPreCastTimer(slot0)
	slot0._precastTimer = pg.TimeMgr.GetInstance():AddBattleTimer("weaponPrecastTimer", 0, slot0._preCastInfo.time, function ()
		slot0._currentState = slot0.STATE_OVER_HEAT

		slot0:RemovePrecastTimer()
		slot0._host:SetWeaponPreCastBound(false)
		slot0:DispatchEvent(slot0.Event.New(slot1.Battle.BattleUnitEvent.WEAPON_PRE_CAST_FINISH, slot0))
	end, true)
end

function slot2.createMajorEmitter(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = {}
	slot7 = nil
	slot9 = nil
	slot0._cacheList[slot0.Battle.BattleBulletEmitter.New(slot8, slot10, slot1)] = slot0.Battle.BattleBulletEmitter.New(slot8, slot10, slot1)

	slot1.super.createMajorEmitter(slot0, slot1, slot2, nil, function (slot0, slot1, slot2, slot3, slot4)
		slot6 = slot0:Spawn(slot5, slot4)

		slot6:SetOffsetPriority(slot3)
		slot6:SetShiftInfo(slot0, slot1)

		if slot0._tmpData.aim_type == slot2.Battle.BattleConst.WeaponAimType.AIM and slot4 ~= nil then
			slot6:SetRotateInfo(slot4:GetCLDZCenterPosition(), slot0:GetBaseAngle(), slot2)
		else
			slot6:SetRotateInfo(nil, slot0:GetBaseAngle(), slot2)
		end

		table.insert(slot3, slot6)
		slot0:showBombAlert(slot6)
	end, function ()
		return
	end)
end

function slot2.DoAttack(slot0)
	slot0:TriggerBuffOnSteday()

	for slot4, slot5 in pairs(slot0._cacheList) do
		slot5:Ready()
	end

	for slot4, slot5 in pairs(slot0._cacheList) do
		slot5:Fire(nil, slot0:GetDirection())
	end

	slot0.Battle.PlayBattleSFX(slot0._tmpData.fire_sfx)
	slot0:TriggerBuffOnFire()
	slot0:CheckAndShake()
end

function slot2.showBombAlert(slot0, slot1)
	slot1:SetExist(false)

	if slot1:GetTemplate().alert_fx ~= "" then
		slot0.Battle.BattleBombBulletFactory.CreateBulletAlert(slot1)
	end
end

return
