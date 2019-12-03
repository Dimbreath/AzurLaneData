ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = ys.Battle.BattleBuffEvent
slot3 = ys.Battle.BattleConst
slot4 = ys.Battle.BattleVariable
slot5 = ys.Battle.BattleConfig
slot6 = ys.Battle.BattleAttr
slot7 = ys.Battle.BattleDataFunction
slot8 = ys.Battle.UnitState
slot9 = class("BattleUnit")
ys.Battle.BattleUnit = slot9
slot9.__name = "BattleUnit"

slot9.Ctor = function (slot0, slot1, slot2)
	slot0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._uniqueID = slot1
	slot0._speedExemptKey = "unit_" .. slot1
	slot0._unitState = slot0.Battle.UnitState.New(slot0)
	slot0._move = slot0.Battle.MoveComponent.New()
	slot0._weaponQueue = slot0.Battle.WeaponQueue.New()

	slot0:Init()
	slot0:SetIFF(slot2)

	slot0._distanceBackup = {}
	slot0._battleProxy = slot0.Battle.BattleDataProxy.GetInstance()
	slot0._frame = 0
end

slot9.Retreat = function (slot0)
	slot0:TriggerBuff(slot0.BuffEffectType.ON_RETREAT, {})
end

slot9.SetMotion = function (slot0, slot1)
	slot0._move:SetMotionVO(slot1)
end

slot9.SetBound = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0._move:SetCorpsArea(slot5, slot6)
	slot0._move:SetBorder(slot3, slot4, slot1, slot2)
end

slot9.ActiveCldBox = function (slot0)
	slot0._cldComponent:SetActive(true)
end

slot9.DeactiveCldBox = function (slot0)
	slot0._cldComponent:SetActive(false)
end

slot9.Init = function (slot0)
	slot0._hostileCldList = {}
	slot0._currentHPRate = 1
	slot0._tagCount = 0
	slot0._tagIndex = 0
	slot0._tagList = {}
	slot0._aliveState = true
	slot0._isMainFleetUnit = false
	slot0._bulletCache = {}
	slot0._speed = Vector3.zero
	slot0._dir = slot0.UnitDir.RIGHT
	slot0._extraInfo = {}
	slot0._GCDTimerList = {}
	slot0._buffList = {}
	slot0._labelTagList = {}
	slot0._sonarDetectedCount = 0
	slot0._sonarDuration = 0
	slot0._moveCast = true
end

slot9.Update = function (slot0, slot1)
	if slot0:IsAlive() and not slot0._isSickness then
		slot0._move:Update()
		slot0._move:FixSpeed(slot0._cldComponent)
		slot0._move:Move(slot0:GetSpeedRatio())
	end

	slot0:UpdateAction()
end

slot9.UpdateWeapon = function (slot0, slot1)
	if not slot0:IsAlive() or slot0._isSickness then
		return
	end

	if not slot0._antiSubVigilanceState or slot0._antiSubVigilanceState:IsWeaponUseable() then
		slot2 = slot0._move:GetPos()
		slot4 = slot0._weaponLowerBound

		if (slot0._weaponRightBound == nil or slot2.x < slot3) and (slot4 == nil or slot4 < slot2.z) then
			slot0._weaponQueue:Update(slot1)
		end
	end

	if not slot0:IsAlive() then
		return
	end

	slot0:UpdateBuff(slot1)
end

slot9.UpdateAirAssist = function (slot0)
	if slot0._airAssistList then
		for slot4, slot5 in ipairs(slot0._airAssistList) do
			slot5:Update()
		end
	end
end

slot9.UpdatePhaseSwitcher = function (slot0)
	if slot0._phaseSwitcher then
		slot0._phaseSwitcher:Update()
	end
end

slot9.StateChange = function (slot0, slot1, slot2)
	slot0._unitState:ChangeState(slot1, slot2)
end

slot9.SetInterruptSickness = function (slot0, slot1)
	slot0._isSickness = slot1
end

slot9.SummonSickness = function (slot0, slot1)
	if slot0._isSickness == true then
		return
	end

	slot0._isSickness = true
	slot0._sicknessTimer = pg.TimeMgr.GetInstance():AddBattleTimer("summonSickness", 0, slot1, function ()
		slot0:RemoveSummonSickness()
	end, true)
end

slot9.RemoveSummonSickness = function (slot0)
	slot0._isSickness = false

	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._sicknessTimer)
	slot0:DispatchEvent(slot0.Event.New(slot1.SUBMARINE_VISIBLE))

	slot0._sicknessTimer = nil
end

slot9.Tag = function (slot0, slot1)
	slot0._tagCount = slot0._tagCount + 1
	slot0._tagIndex = slot0._tagIndex + 1

	if slot0._tagList[slot1] == nil then
		slot0._tagList[slot1] = {}
	end

	slot0._tagList[slot1][#slot0._tagList[slot1] + 1] = slot0._tagIndex

	slot0:DispatchEvent(slot0.Event.New(slot1.ADD_TAG, {
		tagID = slot0._tagIndex,
		requiredTime = slot1:GetLockRequiredTime()
	}))
end

slot9.UnTag = function (slot0, slot1)
	if slot0._tagList[slot1] ~= nil and #slot2 > 0 then
		slot0._tagCount = slot0._tagCount - 1

		slot0:DispatchEvent(slot0.Event.New(slot1.REMOVE_TAG, {
			tagID = slot2[#slot2]
		}))

		slot2[#slot2] = nil

		if #slot2 == 0 then
			slot0._tagList[slot1] = nil
		end
	end
end

slot9.GetAllTagCount = function (slot0)
	return slot0._tagCount
end

slot9.Detected = function (slot0, slot1)
	slot0._sonarDetectedCount = slot0._sonarDetectedCount + 1
	slot0._sonarDetectedStartTime = slot0._sonarDetectedStartTime or pg.TimeMgr.GetInstance():GetCombatTime()
	slot0._sonarDuration = slot0._sonarDuration + slot1

	slot0:DispatchEvent(slot0.Event.New(slot1.SUBMARINE_DETECTED, {
		duration = (slot0._sonarDuration - pg.TimeMgr.GetInstance():GetCombatTime() - slot0._sonarDetectedStartTime) * 0.5
	}))
end

slot9.Undetected = function (slot0)
	slot0._sonarDetectedCount = math.max(0, slot0._sonarDetectedCount - 1)

	if slot0._sonarDetectedCount == 0 then
		slot0._sonarDetectedStartTime = nil
		slot0._sonarDuration = 0

		slot0:DispatchEvent(slot0.Event.New(slot1.SUBMARINE_DETECTED, {
			detected = false
		}))
	end
end

slot9.GetSingleWeaponTagCount = function (slot0, slot1)
	if slot0._tagList[slot1] == nil then
		return 0
	else
		return #slot0._tagList[slot1]
	end
end

slot9.PlayFX = function (slot0, slot1, slot2)
	slot0:DispatchEvent(slot0.Event.New(slot1.PLAY_FX, {
		fxName = slot1,
		notAttach = not slot2
	}))
end

slot9.SwitchShader = function (slot0, slot1, slot2)
	slot0:DispatchEvent(slot0.Event.New(slot1.SWITCH_SHADER, {
		shader = slot1,
		color = slot2
	}))
end

slot9.SendAttackTrigger = function (slot0)
	slot0:DispatchEvent(slot0.Event.New(slot1.SPAWN_CACHE_BULLET, {}))
end

slot9.HandleDamageToDeath = function (slot0)
	slot0:UpdateHP(math.floor(-slot0._currentHP), {
		isMiss = false,
		isCri = true,
		isHeal = false,
		damageReason = slot0.UnitDeathReason.DESTRUCT
	})
end

slot9.UpdateHP = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = slot2.isMiss
	slot6 = slot2.isCri
	slot8 = slot2.isShare
	slot9 = slot2.attr
	slot10 = slot0:IsAlive()

	if not slot2.isHeal then
		slot0:TriggerBuff(slot0.BuffEffectType.ON_TAKE_DAMAGE, {
			damage = -slot1,
			isShare = slot8,
			miss = slot5,
			cri = slot6,
			damageAttr = slot9
		})

		if slot0._currentHP <= ()["damage"] then
			slot0:TriggerBuff(slot0.BuffEffectType.ON_DYING, {})
		end

		if slot1.IsInvincible(slot0) then
			return
		end
	else
		slot0:TriggerBuff(slot0.BuffEffectType.ON_TAKE_HEALING, {
			damage = slot1,
			isHeal = slot7
		})

		slot7 = ()["isHeal"]
		slot1 = ()["damage"]
	end

	slot0:SetCurrentHP(math.min(slot0:GetMaxHP(), math.max(0, slot0._currentHP + slot1)))

	slot13 = {
		dHP = slot1,
		validDHP = math.min(slot0.GetMaxHP(), math.max(0, slot0._currentHP + slot1)) - slot0._currentHP,
		isMiss = slot5,
		isCri = slot6,
		isHeal = slot7,
		font = slot4
	}

	if slot3 and not slot3:EqualZero() then
		slot14 = slot0:GetPosition()
		slot18 = slot3:Clone()
		slot18.x = Mathf.Clamp(slot18.x, slot14.x - slot0:GetBoxSize().x, slot14.x + slot0.GetBoxSize().x)
		slot13.posOffset = slot14 - slot18
	end

	slot0:DispatchEvent(slot2.Event.New(slot3.UPDATE_HP, slot13))

	if not slot0:IsAlive() and slot10 then
		slot0:SetDeathReason(slot2.damageReason)
		slot0:DeadAction()
	end

	if slot0:IsAlive() then
		slot0:TriggerBuff(slot0.BuffEffectType.ON_HP_RATIO_UPDATE, {
			dHP = slot1,
			unit = slot0
		})
	end
end

slot9.DeadAction = function (slot0)
	slot0._aliveState = false

	slot0:Spirit()
	slot0:Whosyourdaddy()
	slot0:ClearWeapon()

	for slot4, slot5 in pairs(slot0._tagList) do
		slot6 = #slot5

		while slot6 > 0 do
			slot4:UnlockUnit(slot0)

			slot6 = slot6 - 1
		end
	end

	slot0:DeadActionEvent()
end

slot9.DeadActionEvent = function (slot0)
	slot0:DispatchEvent(slot0.Event.New(slot1.WILL_DIE, {}))
	slot0:DispatchEvent(slot0.Event.New(slot1.DYING, {}))
end

slot9.SendDeadEvent = function (slot0)
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.DYING, {}))
end

slot9.SetDeathReason = function (slot0, slot1)
	slot0._deathReason = slot1
end

slot9.GetDeathReason = function (slot0)
	return slot0._deathReason or slot0.UnitDeathReason.KILLED
end

slot9.DispatchScorePoint = function (slot0, slot1)
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.UPDATE_SCORE, {
		score = slot1
	}))
end

slot9.SetTemplate = function (slot0, slot1, slot2)
	slot0._tmpID = slot1
end

slot9.GetTemplateID = function (slot0)
	return slot0._tmpID
end

slot9.SetRepress = function (slot0, slot1)
	slot0._repress = slot1
end

slot9.GetRepress = function (slot0)
	return slot0._repress or false
end

slot9.SetRepressReduce = function (slot0, slot1)
	slot0._repressReduce = slot1
end

slot9.GetRepressReduce = function (slot0)
	return slot0._repressReduce or 1
end

slot9.SetSkinId = function (slot0)
	return
end

slot9.SetGearScore = function (slot0, slot1)
	slot0._GS = slot1
end

slot9.GetGearScore = function (slot0)
	return slot0._GS or 0
end

slot9.GetSkinID = function (slot0)
	return slot0._tmpID
end

slot9.GetDefaultSkinID = function (slot0)
	return slot0._tmpID
end

slot9.GetSkinAttachmentInfo = function (slot0)
	return slot0._skinAttachment
end

slot9.GetWeaponBoundBone = function (slot0)
	return slot0._tmpData.bound_bone
end

slot9.GetLabelTag = function (slot0)
	return slot0._labelTagList
end

slot9.ContainsLabelTag = function (slot0, slot1)
	if slot0._labelTagList == nil then
		return false
	end

	for slot5, slot6 in ipairs(slot1) do
		if table.contains(slot0._labelTagList, slot6) then
			return true
		end
	end

	return false
end

slot9.AddLabelTag = function (slot0, slot1)
	table.insert(slot0._labelTagList, slot1)

	slot2[slot1] = (slot0:GetCurrent("labelTag")[slot1] or 0) + 1
end

slot9.RemoveLabelTag = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0._labelTagList) do
		if slot6 == slot1 then
			table.remove(slot0._labelTagList, slot5)

			slot0:GetCurrent("labelTag")[slot1] = slot0.GetCurrent("labelTag")[slot1] - 1

			break
		end
	end
end

slot9.setStandardLabelTag = function (slot0)
	slot0:AddLabelTag(slot1)
	slot0:AddLabelTag("T_" .. slot0._tmpData.type)
end

slot9.GetRarity = function (slot0)
	return
end

slot9.IsBoss = function (slot0)
	return false
end

slot9.GetSpeedRatio = function (slot0)
	return slot0.GetSpeedRatio(slot0:GetSpeedExemptKey(), slot0._IFF)
end

slot9.GetSpeedExemptKey = function (slot0)
	return slot0._speedExemptKey
end

slot9.SetMoveCast = function (slot0, slot1)
	slot0._moveCast = slot1
end

slot9.IsMoveCast = function (slot0)
	return slot0._moveCast
end

slot9.SetCrash = function (slot0, slot1)
	slot0._isCrash = slot1

	if slot1 then
		slot0:AddBuff(slot0.Battle.BattleBuffUnit.New(slot1.SHIP_CLD_BUFF))
	else
		slot0:RemoveBuff(slot1.SHIP_CLD_BUFF)
	end
end

slot9.IsCrash = function (slot0)
	return slot0._isCrash
end

slot9.UpdateAction = function (slot0)
	slot1 = slot0:GetSpeed().x * slot0._IFF

	if slot0._oxyState and slot0._oxyState:GetCurrentDiveState() == slot0.OXY_STATE.DIVE then
		if slot1 >= 0 then
			slot0._unitState:ChangeState(slot1.STATE_DIVE)
		else
			slot0._unitState:ChangeState(slot1.STATE_DIVELEFT)
		end
	elseif slot1 >= 0 then
		slot0._unitState:ChangeState(slot1.STATE_MOVE)
	else
		slot0._unitState:ChangeState(slot1.STATE_MOVELEFT)
	end
end

slot9.GetCurrentState = function (slot0)
	return slot0._unitState:GetCurrentStateName()
end

slot9.NeedWeaponCache = function (slot0)
	return slot0._unitState:NeedWeaponCache()
end

slot9.SetEquipment = function (slot0, slot1)
	slot0._equipmentList = slot1
	slot0._autoWeaponList = {}
	slot0._manualTorpedoList = {}
	slot0._chargeList = {}
	slot0._AAList = {}
	slot0._fleetAAList = {}
	slot0._hiveList = {}
	slot0._totalWeapon = {}

	slot0:setWeapon(slot1)
end

slot9.GetEquipment = function (slot0)
	return slot0._equipmentList
end

slot9.SetProficiencyList = function (slot0, slot1)
	slot0._proficiencyList = slot1
end

slot9.setWeapon = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		for slot11, slot12 in ipairs(slot7) do
			if slot12 ~= -1 then
				slot13 = slot0.Battle.BattleDataFunction.CreateWeaponUnit(slot12, slot0, nil, slot5)
				slot0._totalWeapon[#slot0._totalWeapon + 1] = slot13

				if slot13:GetTemplateData().type == slot1.EquipmentType.MANUAL_TORPEDO then
					slot0._manualTorpedoList[#slot0._manualTorpedoList + 1] = slot13

					slot0._weaponQueue:AppendWeapon(slot13)
				elseif slot14 == slot1.EquipmentType.PASSIVE_SCOUT then
				else
					slot0:AddAutoWeapon(slot13)
				end

				if slot14 == slot1.EquipmentType.SCOUT or slot14 == slot1.EquipmentType.PASSIVE_SCOUT then
					slot0._hiveList[#slot0._hiveList + 1] = slot13
				end

				if slot14 == slot1.EquipmentType.ANTI_AIR then
					slot0._AAList[#slot0._AAList + 1] = slot13
				end
			end
		end
	end
end

slot9.CheckWeaponInitial = function (slot0)
	slot0._weaponQueue:CheckWeaponInitalCD()

	if slot0._airAssistQueue then
		slot0._airAssistQueue:CheckWeaponInitalCD()
	end

	slot0:DispatchEvent(slot0.Event.New(slot1.INIT_COOL_DOWN, {}))
end

slot9.FlushReloadingWeapon = function (slot0)
	slot0._weaponQueue:FlushWeaponReloadRequire()

	if slot0._airAssistQueue then
		slot0._airAssistQueue:FlushWeaponReloadRequire()
	end
end

slot9.AddNewAutoWeapon = function (slot0, slot1)
	slot2 = slot0.CreateWeaponUnit(slot1, slot0)

	slot0:AddAutoWeapon(slot2)
	slot0:DispatchEvent(slot1.Event.New(slot1.Battle.BattleBuffEvent.BUFF_EFFECT_NEW_WEAPON, {
		weapon = slot2
	}))

	return slot2
end

slot9.AddAutoWeapon = function (slot0, slot1)
	slot0._autoWeaponList[#slot0._autoWeaponList + 1] = slot1

	slot0._weaponQueue:AppendWeapon(slot1)
end

slot9.RemoveAutoWeapon = function (slot0, slot1)
	slot1:Clear()
	slot0._weaponQueue:RemoveWeapon(slot1)

	slot2 = 1
	slot3 = #slot0._autoWeaponList

	while slot2 <= slot3 do
		if slot0._autoWeaponList[slot2] == slot1 then
			slot0:DispatchEvent(slot0.Event.New(slot1.REMOVE_WEAPON, {
				weapon = slot1
			}))
			table.remove(slot0._autoWeaponList, slot2)

			break
		end

		slot2 = slot2 + 1
	end
end

slot9.RemoveAutoWeaponByWeaponID = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0._autoWeaponList) do
		if slot6:GetWeaponId() == slot1 then
			slot0:RemoveAutoWeapon(slot6)

			break
		end
	end
end

slot9.ShiftWeapon = function (slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot1) do
		slot0:RemoveAutoWeaponByWeaponID(slot7)
	end

	for slot6, slot7 in ipairs(slot2) do
		slot0:AddNewAutoWeapon(slot7)
	end
end

slot9.ExpandWeaponMount = function (slot0, slot1)
	if slot1 == "airAssist" then
		slot0:ExpandAllinStrike()
	end
end

slot9.ReduceWeaponMount = function (slot0, slot1)
	return
end

slot9.GetAllWeapon = function (slot0)
	return slot0._totalWeapon
end

slot9.GetTotalWeapon = function (slot0)
	return slot0._weaponQueue:GetTotalWeaponUnit()
end

slot9.GetAutoWeapons = function (slot0)
	return slot0._autoWeaponList
end

slot9.GetChargeList = function (slot0)
	return slot0._chargeList
end

slot9.GetChargeQueue = function (slot0)
	return slot0._weaponQueue:GetChargeWeaponQueue()
end

slot9.GetAntiAirWeapon = function (slot0)
	return slot0._AAList
end

slot9.GetFleetAntiAirList = function (slot0)
	return slot0._fleetAAList
end

slot9.GetTorpedoList = function (slot0)
	return slot0._manualTorpedoList
end

slot9.GetTorpedoQueue = function (slot0)
	return slot0._weaponQueue:GetManualTorpedoQueue()
end

slot9.GetWeaponByIndex = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0._totalWeapon) do
		if slot6:GetEquipmentIndex() == slot1 then
			return slot6
		end
	end
end

slot9.GetHiveList = function (slot0)
	return slot0._hiveList
end

slot9.SetAirAssistList = function (slot0, slot1)
	slot0._airAssistList = slot1
	slot0._airAssistQueue = slot0.Battle.ManualWeaponQueue.New(slot0:GetManualWeaponParallel()[slot1.ManualWeaponIndex.AIR_ASSIST])

	for slot5, slot6 in ipairs(slot0._airAssistList) do
		slot0._airAssistQueue:AppendWeapon(slot6)
	end
end

slot9.GetAirAssistList = function (slot0)
	return slot0._airAssistList
end

slot9.GetAirAssistQueue = function (slot0)
	return slot0._airAssistQueue
end

slot9.GetManualWeaponParallel = function (slot0)
	return {
		1,
		1,
		1
	}
end

slot9.configWeaponQueueParallel = function (slot0)
	slot0._weaponQueue:ConfigParallel(slot0:GetManualWeaponParallel()[slot0.ManualWeaponIndex.CALIBRATION], slot0.GetManualWeaponParallel()[slot0.ManualWeaponIndex.TORPEDO])
end

slot9.ClearWeapon = function (slot0)
	slot0._weaponQueue:ClearAllWeapon()

	if slot0._airAssistList then
		for slot5, slot6 in ipairs(slot1) do
			slot6:Clear()
		end
	end
end

slot9.GetSpeed = function (slot0)
	return slot0._move:GetSpeed()
end

slot9.GetPosition = function (slot0)
	return slot0._move:GetPos()
end

slot9.GetCLDCenterPosition = function (slot0)
	if slot0._centerFrame ~= slot0._battleProxy.FrameIndex then
		slot0._centerFrame = slot1
		slot2 = slot0._move:GetPos()
		slot0._cldCenterCache = Vector3(slot2.x + slot0:GetBoxSize().x, slot2.y, slot2.z + slot0.GetBoxSize().z)
	end

	return slot0._cldCenterCache
end

slot9.GetCLDZCenterPosition = function (slot0)
	if slot0._zCenterFrame ~= slot0._battleProxy.FrameIndex then
		slot0._zCenterFrame = slot1
		slot2 = slot0._move:GetPos()
		slot0._cldZCenterCache = Vector3(slot2.x, slot2.y, slot2.z + slot0:GetBoxSize().z)
	end

	return slot0._cldZCenterCache
end

slot9.CancelFollowTeam = function (slot0)
	slot0._move:CancelFormationCtrl()
end

slot9.UpdateFormationOffset = function (slot0, slot1)
	slot0._move:SetFormationCtrlInfo(Vector3(slot1.x, slot1.y, slot1.z))
end

slot9.GetDistance = function (slot0, slot1)
	if slot0._frame ~= slot0._battleProxy.FrameIndex then
		slot0._distanceBackup = {}
		slot0._frame = slot2
	end

	if slot0._distanceBackup[slot1] == nil then
		slot0._distanceBackup[slot1] = Vector3.Distance(slot0:GetPosition(), slot1:GetPosition())

		slot1:backupDistance(slot0, Vector3.Distance(slot0.GetPosition(), slot1.GetPosition()))
	end

	return slot3
end

slot9.backupDistance = function (slot0, slot1, slot2)
	if slot0._frame ~= slot0._battleProxy.FrameIndex then
		slot0._distanceBackup = {}
		slot0._frame = slot3
	end

	slot0._distanceBackup[slot1] = slot2
end

slot9.GetDirection = function (slot0)
	return slot0._dir
end

slot9.SetPosition = function (slot0, slot1)
	slot0._move:SetPos(slot1)
end

slot9.IsMoving = function (slot0)
	return slot0._move:GetSpeed().x ~= 0 or slot1.z ~= 0
end

slot9.SetUncontrollableSpeedWithYAngle = function (slot0, slot1, slot2, slot3)
	slot0:SetUncontrollableSpeed(Vector3(math.cos(slot4), 0, math.sin(slot4)), slot2, slot3)
end

slot9.SetUncontrollableSpeedWithDir = function (slot0, slot1, slot2, slot3)
	slot0:SetUncontrollableSpeed(slot1 / math.sqrt(slot1.x * slot1.x + slot1.z * slot1.z), slot2, slot3)
end

slot9.SetUncontrollableSpeed = function (slot0, slot1, slot2, slot3)
	if not slot2 or not slot3 then
		return
	end

	slot0._move:SetForceMove(slot1, slot2, slot3, slot2 / slot3)
end

slot9.Boost = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0._move:SetForceMove(slot1, slot2, slot3, slot4, slot5)
end

slot9.SetWeaponPreCastBound = function (slot0, slot1)
	slot0._preCastBound = slot1

	slot0:UpdatePrecastMoveLimit()
end

slot9.EnterGCD = function (slot0, slot1, slot2)
	if slot0._GCDTimerList[slot2] ~= nil then
		return
	end

	slot0._weaponQueue:QueueEnterGCD(slot2, slot1)

	slot0._GCDTimerList[slot2] = pg.TimeMgr.GetInstance():AddBattleTimer("weaponGCD", 0, slot1, function ()
		slot0:RemoveGCDTimer(slot0)
	end, true)

	slot0:UpdatePrecastMoveLimit()
end

slot9.RemoveGCDTimer = function (slot0, slot1)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._GCDTimerList[slot1])

	slot0._GCDTimerList[slot1] = nil

	slot0:UpdatePrecastMoveLimit()
end

slot9.UpdatePrecastMoveLimit = function (slot0)
	slot0:UpdateMoveLimit()
end

slot9.UpdateMoveLimit = function (slot0)
	slot0._move:SetStaticState(not slot0:IsMoveAble())
end

slot9.AddBuff = function (slot0, slot1)
	slot3 = {
		unit_id = slot0._uniqueID,
		buff_id = slot1:GetID()
	}

	if slot0:GetBuff(slot1.GetID()) then
		if slot1:GetLv() <= slot4:GetLv() then
			slot4:Stack(slot0)
			slot0:DispatchEvent(slot0.Event.New(slot1.BUFF_STACK, slot3))
		else
			slot0:RemoveBuff(slot2)

			slot0._buffList[slot2] = slot1

			slot1:Attach(slot0)
			slot0:DispatchEvent(slot0.Event.New(slot1.BUFF_ATTACH, slot3))
		end
	else
		slot0._buffList[slot2] = slot1

		slot1:Attach(slot0)
		slot0:DispatchEvent(slot0.Event.New(slot1.BUFF_ATTACH, slot3))
	end
end

slot9.SetBuffStack = function (slot0, slot1, slot2, slot3)
	if slot3 <= 0 then
		slot0:RemoveBuff(slot1)
	elseif slot0:GetBuff(slot1) then
		slot4:UpdateStack(slot0, slot3)

		return slot4
	else
		slot5 = slot0.Battle.BattleBuffUnit.New(slot1, slot2)

		slot0:AddBuff(slot5)
		slot5:UpdateStack(slot0, slot3)

		return slot5
	end
end

slot9.UpdateBuff = function (slot0, slot1)
	for slot6, slot7 in pairs(slot2) do
		slot7:Update(slot0, slot1)

		if not slot0:IsAlive() then
			break
		end
	end
end

slot9.RemoveBuff = function (slot0, slot1)
	if slot0:GetBuff(slot1) then
		slot2:Remove()
	end
end

slot9.ClearBuff = function (slot0)
	for slot5, slot6 in pairs(slot1) do
		slot6:Clear()
	end
end

slot9.TriggerBuff = function (slot0, slot1, slot2)
	slot0.Battle.BattleBuffUnit.Trigger(slot0, slot1, slot2)
end

slot9.GetBuffList = function (slot0)
	return slot0._buffList
end

slot9.GetBuff = function (slot0, slot1)
	slot0._buffList = slot0._buffList

	return slot0._buffList[slot1]
end

slot9.SetAI = function (slot0, slot1)
	slot0._move:CancelFormationCtrl()

	slot0._autoPilotAI = slot1.Battle.AutoPilot.New(slot0, slot2)
end

slot9.AddPhaseSwitcher = function (slot0, slot1)
	slot0._phaseSwitcher = slot1
end

slot9.GetPhaseSwitcher = function (slot0)
	return slot0._phaseSwitcher
end

slot9.CharacterActionTriggerCallback = function (slot0)
	slot0._unitState:OnActionTrigger()
end

slot9.CharacterActionEndCallback = function (slot0)
	slot0._unitState:OnActionEnd()
end

slot9.CharacterActionStartCallback = function (slot0)
	return
end

slot9.DispatchChat = function (slot0, slot1, slot2, slot3)
	slot0:DispatchEvent(slot0.Event.New(slot1.POP_UP, {
		content = slot1,
		duration = slot2,
		key = slot3
	}))
end

slot9.DispatchVoice = function (slot0, slot1)
	slot2, slot3 = nil

	if string.find(slot1, "link") then
		slot3 = Ship.getCVPath(slot0:GetSkinID(), slot1)
	else
		slot2, slot3 = Ship.getWords(slot0:GetSkinID(), slot1)
	end

	if slot3 then
		slot0:DispatchEvent(slot0.Event.New(slot1.VOICE, {
			content = slot3,
			key = slot1
		}))
	end
end

slot9.GetHostileCldList = function (slot0)
	return slot0._hostileCldList
end

slot9.AppendHostileCld = function (slot0, slot1, slot2)
	slot0._hostileCldList[slot1] = slot2
end

slot9.RemoveHostileCld = function (slot0, slot1)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._hostileCldList[slot1])

	slot0._hostileCldList[slot1] = nil
end

slot9.GetExtraInfo = function (slot0)
	return slot0._extraInfo
end

slot9.GetTemplate = function (slot0)
	return nil
end

slot9.GetUniqueID = function (slot0)
	return slot0._uniqueID
end

slot9.SetIFF = function (slot0, slot1)
	slot0._IFF = slot1

	if slot1 == slot0.FRIENDLY_CODE then
		slot0._dir = slot1.UnitDir.RIGHT
	elseif slot1 == slot0.FOE_CODE then
		slot0._dir = slot1.UnitDir.LEFT
	end
end

slot9.GetIFF = function (slot0)
	return slot0._IFF
end

slot9.GetUnitType = function (slot0)
	return slot0._type
end

slot9.GetHPRate = function (slot0)
	return slot0._currentHPRate
end

slot9.GetHP = function (slot0)
	return slot0._currentHP, slot0:GetMaxHP()
end

slot9.GetCurrentHP = function (slot0)
	return slot0._currentHP
end

slot9.SetCurrentHP = function (slot0, slot1)
	slot0._currentHP = slot1
	slot0._currentHPRate = slot0._currentHP / slot0:GetMaxHP()
end

slot9.GetAttr = function (slot0)
	return slot0:GetAttr()
end

slot9.GetAttrByName = function (slot0, slot1)
	return slot0:GetCurrent(slot1)
end

slot9.GetMaxHP = function (slot0)
	return slot0:GetAttrByName("maxHP")
end

slot9.GetReload = function (slot0)
	return slot0:GetAttrByName("loadSpeed")
end

slot9.GetTorpedoPower = function (slot0)
	return slot0:GetAttrByName("torpedoPower")
end

slot9.CanDoAntiSub = function (slot0)
	return slot0:GetAttrByName("antiSubPower") > 0
end

slot9.IsShowHPBar = function (slot0)
	return false
end

slot9.IsAlive = function (slot0)
	return slot0._aliveState and slot0._currentHP > 0
end

slot9.SetMainFleetUnit = function (slot0)
	slot0._isMainFleetUnit = true

	slot0:SetMainUnitStatic(true)
end

slot9.IsMainFleetUnit = function (slot0)
	return slot0._isMainFleetUnit
end

slot9.SetMainUnitStatic = function (slot0, slot1)
	slot0._isMainStatic = slot1

	slot0._move:SetStaticState(slot1)
end

slot9.SetMainUnitIndex = function (slot0, slot1)
	slot0._mainUnitIndex = slot1
end

slot9.GetMainUnitIndex = function (slot0)
	return slot0._mainUnitIndex or 1
end

slot9.IsMoveAble = function (slot0)
	return not slot0._isMainStatic and (slot0:IsMoveCast() or not (table.getCount(slot0._GCDTimerList) > 0 or slot0._preCastBound)) and not slot0:IsStun()
end

slot9.Reinforce = function (slot0)
	slot0._isReinforcement = true
end

slot9.IsReinforcement = function (slot0)
	return slot0._isReinforcement
end

slot9.SetReinforceCastTime = function (slot0, slot1)
	slot0._reinforceCastTime = slot1
end

slot9.GetReinforceCastTime = function (slot0)
	return slot0._reinforceCastTime
end

slot9.SetFormationIndex = function (slot0, slot1)
	return
end

slot9.Clear = function (slot0)
	for slot4, slot5 in pairs(slot0._hostileCldList) do
		slot0:RemoveHostileCld(slot4)
	end

	slot0:ClearWeapon()
	slot0:ClearBuff()

	slot0._distanceBackup = {}
end

slot9.Dispose = function (slot0)
	slot0._phaseSwitcher = nil

	slot0._weaponQueue:Dispose()

	if slot0._airAssistQueue then
		slot0._airAssistQueue:Clear()

		slot0._airAssistQueue = nil
	end

	slot0._equipmentList = nil
	slot0._totalWeapon = nil

	if slot0._airAssistList then
		for slot5, slot6 in ipairs(slot1) do
			slot6:Dispose()
		end
	end

	for slot5, slot6 in ipairs(slot0._fleetAAList) do
		slot6:Dispose()
	end

	for slot6, slot7 in pairs(slot2) do
		slot7:Dispose()
	end

	slot0._buffList = nil
	slot0._cldZCenterCache = nil
	slot0._cldCenterCache = nil

	slot0:RemoveSummonSickness()
	slot0.EventDispatcher.DetachEventDispatcher(slot0)
end

slot9.InitCldComponent = function (slot0)
	slot1 = slot0:GetTemplate().cld_box
	slot3 = slot0:GetTemplate().cld_offset[1]

	if slot0:GetDirection() == slot0.UnitDir.LEFT then
		slot3 = slot3 * -1
	end

	slot0._cldComponent = slot1.Battle.BattleCubeCldComponent.New(slot1[1], slot1[2], slot1[3], slot3, slot2[3] + slot1[3] / 2)
end

slot9.GetBoxSize = function (slot0)
	return slot0._cldComponent:GetCldBoxSize()
end

slot9.GetCldBox = function (slot0)
	return slot0._cldComponent:GetCldBox(slot0:GetPosition())
end

slot9.GetCldData = function (slot0)
	return slot0._cldComponent:GetCldData()
end

slot9.InitOxygen = function (slot0)
	slot0._maxOxy = slot0:GetAttrByName("oxyMax")
	slot0._currentOxy = slot0:GetAttrByName("oxyMax")
	slot0._oxyRecovery = slot0:GetAttrByName("oxyRecovery")
	slot0._oxyRecoveryBench = slot0:GetAttrByName("oxyRecoveryBench")
	slot0._oxyConsume = slot0:GetAttrByName("oxyCost")
	slot0._oxyState = slot0.Battle.OxyState.New(slot0)

	slot0._oxyState:OnDiveState()
	slot0:ConfigBubbleFX()
end

slot9.UpdateOxygen = function (slot0, slot1)
	if slot0._oxyState then
		slot0._lastOxyUpdateStamp = slot0._lastOxyUpdateStamp or slot1

		slot0._oxyState:UpdateOxygen()

		if slot0._oxyState:GetNextBubbleStamp() and slot0._oxyState:GetNextBubbleStamp() < slot1 then
			slot0._oxyState:FlashBubbleStamp(slot1)
			slot0:PlayFX(slot0._bubbleFX, true)
		end

		slot0._lastOxyUpdateStamp = slot1
	end
end

slot9.OxyRecover = function (slot0, slot1)
	slot2 = nil
	slot0._currentOxy = math.min(slot0._maxOxy, slot0._currentOxy + ((not slot1 or slot0._oxyRecoveryBench) and slot0._oxyRecovery) * (pg.TimeMgr.GetInstance():GetCombatTime() - slot0._lastOxyUpdateStamp))
end

slot9.OxyConsume = function (slot0)
	slot0._currentOxy = math.max(0, slot0._currentOxy - slot0._oxyConsume * (pg.TimeMgr.GetInstance():GetCombatTime() - slot0._lastOxyUpdateStamp))
end

slot9.ChangeOxygenState = function (slot0, slot1)
	slot0._oxyState:ChangeState(slot1)
end

slot9.ChangeWeaponDiveState = function (slot0)
	for slot4, slot5 in ipairs(slot0._autoWeaponList) do
		slot5:ChangeDiveState()
	end
end

slot9.GetOxygenProgress = function (slot0)
	slot1 = 1

	if slot0._oxyState:GetCurrentStateName() == slot0.Battle.RaidOxyState.__name then
		slot1 = 1 - slot0._phaseSwitcher:GetPhaseProgress()
	elseif slot2 == slot0.Battle.FreeDiveOxyState.__name or slot2 == slot0.Battle.FreeFloatOxyState.__name or slot2 == slot0.Battle.FreeBenchOxyState.__name then
		slot1 = slot0._currentOxy / slot0._maxOxy
	end

	return slot1
end

slot9.ConfigBubbleFX = function (slot0)
	return
end

slot9.SetDiveInvisible = function (slot0, slot1)
	slot0._diveInvisible = slot1

	slot0:DispatchEvent(slot0.Event.New(slot1.SUBMARINE_VISIBLE))
end

slot9.GetDiveInvisible = function (slot0)
	return slot0._diveInvisible
end

slot9.GetOxygenVisible = function (slot0)
	return slot0._oxyState and slot0._oxyState:GetBarVisible()
end

slot9.IsRunMode = function (slot0)
	return slot0._oxyState and slot0._oxyState:GetRundMode()
end

slot9.GetDiveDetected = function (slot0)
	return slot0:GetDiveInvisible() and slot0._sonarDetectedCount > 0
end

slot9.GetRaidDuration = function (slot0)
	return slot0:GetAttrByName("oxyMax") / slot0:GetAttrByName("oxyCost")
end

slot9.EnterRaidRange = function (slot0)
	if slot0._subRaidLine < slot0:GetPosition().x then
		return true
	else
		return false
	end
end

slot9.EnterRetreatRange = function (slot0)
	if slot0:GetPosition().x < slot0._subRetreatLine then
		return true
	else
		return false
	end
end

slot9.GetOxyState = function (slot0)
	return slot0._oxyState
end

slot9.GetCurrentOxyState = function (slot0)
	if not slot0._oxyState then
		return slot0.OXY_STATE.FLOAT
	else
		return slot0._oxyState:GetCurrentDiveState()
	end
end

slot9.InitAntiSubState = function (slot0, slot1, slot2)
	slot0._antiSubVigilanceState = slot0.Battle.AntiSubState.New(slot0)

	slot0:DispatchEvent(slot0.Event.New(slot1.INIT_ANIT_SUB_VIGILANCE, {
		sonarRange = slot1
	}))

	return slot0._antiSubVigilanceState
end

slot9.GetAntiSubState = function (slot0)
	return slot0._antiSubVigilanceState
end

return
