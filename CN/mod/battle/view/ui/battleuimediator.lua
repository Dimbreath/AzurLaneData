ys = ys or {}
slot1 = ys.Battle.BattleEvent
slot2 = ys.Battle.BattleUnitEvent
slot3 = ys.Battle.BattleConst
slot4 = ys.Battle.BattleVariable
slot5 = ys.Battle.BattleConfig
slot6 = class("BattleUIMediator", ys.MVC.Mediator)
ys.Battle.BattleUIMediator = slot6
slot6.__name = "BattleUIMediator"

function slot6.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot6.SetBattleUI(slot0)
	slot0._ui = slot0._state:GetUI()
end

function slot6.Initialize(slot0)
	slot0.super.Initialize(slot0)

	slot0._dataProxy = slot0._state:GetProxyByName(slot1.Battle.BattleDataProxy.__name)
	slot0._uiMGR = pg.UIMgr.GetInstance()

	slot0:SetBattleUI()
	slot0:AddUIEvent()
	slot0:InitCamera()
	slot0:InitGuide()
end

function slot6.Reinitialize(slot0)
	slot0._skillView:Dispose()
end

function slot6.EnableComponent(slot0, slot1)
	slot0._ui:findTF("PauseBtn"):GetComponent(typeof(Button)).enabled = slot1

	slot0._skillView:EnableWeaponButton(slot1)
end

function slot6.EnableJoystick(slot0, slot1)
	slot0._stickController.enabled = slot1

	setActive(slot0._joystick, slot1)
end

function slot6.EnableWeaponButton(slot0, slot1)
	slot0._skillView:EnableWeaponButton(slot1)
end

function slot6.EnableSkillFloat(slot0, slot1)
	slot0._ui:EnableSkillFloat(slot1)
end

function slot6.GetAppearFX(slot0)
	return slot0._appearEffect
end

function slot6.DisableComponent(slot0)
	slot0._ui:findTF("PauseBtn"):GetComponent(typeof(Button)).enabled = false

	slot0._skillView:DisableWeapnButton()
	SetActive(slot0._ui:findTF("HPBarContainer"), false)
	SetActive(slot0._ui:findTF("flagShipMark"), false)

	if slot0._jammingView then
		slot0._jammingView:Eliminate(false)
	end
end

function slot6.ActiveDebugConsole(slot0)
	slot0._debugConsoleView:SetActive(true)
end

function slot6.OpeningEffect(slot0, slot1, slot2)
	slot0._uiMGR:SetActive(false)

	if slot2 == SYSTEM_SUBMARINE_RUN then
		slot0._skillView:SubmarineButton()

		slot0._joystick.anchorMin = Vector2(slot0.JOY_STICK_DEFAULT_PREFERENCE.x, slot0.JOY_STICK_DEFAULT_PREFERENCE.y)
		slot0._joystick.anchorMax = Vector2(slot0.JOY_STICK_DEFAULT_PREFERENCE.x, slot0.JOY_STICK_DEFAULT_PREFERENCE.y)
	elseif slot2 == SYSTEM_SUB_ROUTINE then
		slot0._skillView:SubRoutineButton()
	elseif slot2 == SYSTEM_DEBUG then
		slot0._skillView:NormalButton()
	elseif pg.SeriesGuideMgr.GetInstance().currIndex and slot3:isEnd() then
		slot0._skillView:NormalButton()
	else
		slot0._skillView:CustomButton(slot0._dataProxy:GetDungeonData().skill_hide or {})
	end

	slot0._ui._go:GetComponent("DftAniEvent").SetEndEvent(slot3, function (slot0)
		slot0._uiMGR:SetActive(true)
		slot0:EnableComponent(true)

		if slot0.EnableComponent then
			slot1()
		end
	end)
	SetActive(slot0._ui._go, true)
end

function slot6.InitScene(slot0)
	slot0._mapId = slot0._dataProxy._mapId
	slot0._seaView = slot0.Battle.BattleMap.New(slot0._mapId)
end

function slot6.InitJoystick(slot0)
	slot0._joystick = slot0._ui:findTF("Stick")
	slot1 = slot0.JOY_STICK_DEFAULT_PREFERENCE
	slot2 = slot0._joystick

	if Screen.dpi / CameraUtil.finalWidth * 5 <= 0 then
		slot3 = 1
	end

	slot0._joystick.localScale = Vector3(slot3, slot3, 1)
	slot2.anchoredPosition = slot2.anchoredPosition * slot3 * PlayerPrefs.GetFloat("joystick_scale", slot1.scale)
	slot0._joystick.anchorMin = Vector2(slot5, slot6)
	slot0._joystick.anchorMax = Vector2(slot5, PlayerPrefs.GetFloat("joystick_anchorY", slot1.y))
	slot0._stickController = slot0._joystick:GetComponent("StickController")

	slot0._uiMGR:AttachStickOb(slot0._joystick)
end

function slot6.InitTimer(slot0)
	if slot0._dataProxy:GetInitData().battleType == SYSTEM_DUEL then
		slot0._timerView = slot0.Battle.BattleTimerView.New(slot0._ui:findTF("DuelTimer"))
	else
		slot0._timerView = slot0.Battle.BattleTimerView.New(slot0._ui:findTF("Timer"))
	end
end

function slot6.InitEnemyHpBar(slot0)
	slot0._enemyHpBar = slot0.Battle.BattleEnmeyHpBarView.New(slot0._ui:findTF("EnemyHPBar"))
end

function slot6.InitAirStrikeIcon(slot0)
	slot0._airStrikeView = slot0.Battle.BattleAirStrikeIconView.New(slot0._ui:findTF("AirFighterContainer/AirStrikeIcon"))
end

function slot6.InitSubmarineWarning(slot0)
	slot0._submarineView = slot0.Battle.BattleSubmarineView.New(slot0._ui:findTF("Submarine"))
end

function slot6.InitScoreBar(slot0)
	slot0._scoreBarView = slot0.Battle.BattleScoreBarView.New(slot0._ui:findTF("DodgemCountBar"))
end

function slot6.InitKizunaJamming(slot0)
	setParent(slot2, slot0._ui.uiCanvas, false)

	slot0._jammingView = slot0.Battle.BattleKizunaJammingView.New(slot2)

	slot0._jammingView:ConfigCallback(function ()
		slot0._dataProxy:KizunaJammingEliminate()
		SetActive(slot0._dataProxy, false)
	end)
	slot0._jammingView:Active()
end

function slot6.InitAutoBtn(slot0)
	slot0._autoBtn = slot0._ui:findTF("AutoBtn")
	slot0._autoBtn.localScale = Vector3(slot2, slot2, 1)
	slot0._autoBtn.anchorMin = Vector2(slot3, slot4)
	slot0._autoBtn.anchorMax = Vector2(PlayerPrefs.GetFloat("auto_anchorX", slot0.AUTO_DEFAULT_PREFERENCE.x), PlayerPrefs.GetFloat("auto_anchorY", slot0.AUTO_DEFAULT_PREFERENCE.y))
end

function slot6.InitDuelRateBar(slot0)
	slot0._duelRateBar = slot0.Battle.BattleDuelDamageRateView.New(slot0._ui:findTF("DuelDamageRate"))

	return slot0._duelRateBar
end

function slot6.InitSimulationBuffCounting(slot0)
	slot0._simulationBuffCountView = slot0.Battle.BattleSimulationBuffCountView.New(slot0._ui:findTF("SimulationWarning"))

	return slot0._simulationBuffCountView
end

function slot6.InitMainDamagedView(slot0)
	slot0._mainDamagedView = slot0.Battle.BattleMainDamagedView.New(slot0._ui:findTF("HPWarning"))
end

function slot6.InitDebugConsole(slot0)
	slot0._debugConsoleView = slot0._debugConsoleView or slot0.Battle.BattleDebugConsole.New(slot0._ui:findTF("Debug_Console"), slot0._state)
end

function slot6.InitCameraGestureSlider(slot0)
	slot0._gesture = slot0.Battle.BattleCameraSlider.New(slot0._ui:findTF("CameraController"))

	slot0.Battle.BattleCameraUtil.GetInstance():SetCameraSilder(slot0._gesture)
	slot0._cameraUtil:SwitchCameraPos("FOLLOW_GESTURE")
end

function slot6.InitGuide(slot0)
	return
end

function slot6.InitCamera(slot0)
	slot0._camera = GameObject.Find("MainCamera"):GetComponent(typeof(Camera))
	slot0._uiCamera = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
	slot0._cameraUtil = slot0.Battle.BattleCameraUtil.GetInstance()

	slot0._cameraUtil:RegisterEventListener(slot0, slot1.CAMERA_FOCUS, slot0.onCameraFocus)
	slot0._cameraUtil:RegisterEventListener(slot0, slot1.SHOW_PAINTING, slot0.onShowPainting)
	slot0._cameraUtil:RegisterEventListener(slot0, slot1.BULLET_TIME, slot0.onBulletTime)
end

function slot6.Update(slot0)
	slot0._skillView:Update()
	slot0._sightView:Update()
end

function slot6.AddUIEvent(slot0)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.STAGE_DATA_INIT_FINISH, slot0.onStageInit)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.COMMON_DATA_INIT_FINISH, slot0.onCommonInit)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.ADD_UNIT, slot0.onAddUnit)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.REMOVE_UNIT, slot0.onRemoveUnit)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.HIT_ENEMY, slot0.onEnemyHit)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.CAST_SKILL, slot0.onCastSkill)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.ADD_AIR_FIGHTER_ICON, slot0.onAddAirStrike)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.REMOVE_AIR_FIGHTER_ICON, slot0.onRemoveAirStrike)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.UPDATE_HOSTILE_SUBMARINE, slot0.onUpdateHostileSubmarine)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.UPDATE_COUNT_DOWN, slot0.onUpdateCountDown)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.KIZUNA_JAMMING, slot0.onJamming)
end

function slot6.RemoveUIEvent(slot0)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.COMMON_DATA_INIT_FINISH)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.STAGE_DATA_INIT_FINISH)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.ADD_UNIT)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.REMOVE_UNIT)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.HIT_ENEMY)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.CAST_SKILL)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.UPDATE_COUNT_DOWN)
	slot0._cameraUtil:UnregisterEventListener(slot0, slot0.SHOW_PAINTING)
	slot0._cameraUtil:UnregisterEventListener(slot0, slot0.CAMERA_FOCUS)
	slot0._cameraUtil:UnregisterEventListener(slot0, slot0.BULLET_TIME)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.ADD_SUBMARINE_WARINING)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.REMOVE_SUBMARINE_WARINING)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.UPDATE_DODGEM_SCORE)
	slot0._dataProxy:UnregisterEventListener(slot0, slot0.UPDATE_DODGEM_COMBO)
	slot0._userFleet:UnregisterEventListener(slot0, slot0.SHOW_BUFFER)
	slot0._userFleet:UnregisterEventListener(slot0, slot1.POINT_HIT_CHARGE)
	slot0._userFleet:UnregisterEventListener(slot0, slot1.POINT_HIT_CANCEL)
end

function slot6.ShowSkillPainting(slot0, slot1, slot2, slot3)
	slot0._ui:painting(slot1:GetTemplate(), slot3 or 1, slot1:GetIFF())
end

function slot6.ShowSkillFloat(slot0, slot1, slot2, slot3)
	slot0._ui:appendSkill(slot2, slot1, slot3)
end

function slot6.ShowSkillFloatCover(slot0, slot1, slot2, slot3)
	slot0._ui:appendSkillCover(slot2, slot1, slot3)
end

function slot6.SeaSurfaceShift(slot0, slot1, slot2, slot3, slot4)
	slot0._seaView:ShiftSurface(slot1, slot2, slot3 or slot0.Battle.BattleConfig.calcInterval, slot4)
end

function slot6.ShowAutoBtn(slot0)
	SetActive(slot0._autoBtn.transform, true)
	triggerToggle(slot0._autoBtn, slot0.Battle.BattleState.IsAutoBotActive())
end

function slot6.ShowTimer(slot0)
	slot0._timerView:SetActive(true)
end

function slot6.ShowDuelBar(slot0)
	slot0._duelRateBar:SetActive(true)
end

function slot6.ShowSimulationView(slot0)
	slot0._simulationBuffCountView:SetActive(true)
end

function slot6.ShowDodgemScoreBar(slot0)
	slot0:InitScoreBar()
	slot0._dataProxy:RegisterEventListener(slot0, slot0.UPDATE_DODGEM_SCORE, slot0.onUpdateDodgemScore)
	slot0._dataProxy:RegisterEventListener(slot0, slot0.UPDATE_DODGEM_COMBO, slot0.onUpdateDodgemCombo)
	slot0._scoreBarView:UpdateScore(0)
	slot0._scoreBarView:SetActive(true)
end

function slot6.onStageInit(slot0, slot1)
	slot0:InitJoystick()
	slot0:InitScene()
	slot0:InitTimer()
	slot0:InitEnemyHpBar()
	slot0:InitAirStrikeIcon()
	slot0:InitSubmarineWarning()
	slot0:InitAutoBtn()
	slot0:InitMainDamagedView()
end

function slot6.onEnemyHit(slot0, slot1)
	if slot1.Data:GetDiveInvisible() and not slot2:GetDiveDetected() then
		return
	end

	if slot0._enemyHpBar:GetCurrentTarget() then
		if slot3 ~= slot2 then
			slot0._enemyHpBar:SwitchTarget(slot2, slot0._dataProxy:GetUnitList())
		end
	else
		slot0._enemyHpBar:SwitchTarget(slot2, slot0._dataProxy:GetUnitList())
	end
end

function slot6.onEnemyHpUpdate(slot0, slot1)
	if slot1.Dispatcher == slot0._enemyHpBar:GetCurrentTarget() and (not slot2:GetDiveInvisible() or slot2:GetDiveDetected()) then
		slot0._enemyHpBar:UpdateHpBar()
	end
end

function slot6.onPlayerMainUnitHpUpdate(slot0, slot1)
	if slot1.Data.dHP < 0 then
		slot0._mainDamagedView:Play()
	end
end

function slot6.onCastSkill(slot0, slot1)
	slot4 = slot1.Data.caster

	if slot0.Battle.BattleDataFunction.GetSkillTemplate(slot3).uiEffect ~= "" then
		pg.EffectMgr.GetInstance():BattleUIEffect(slot6, function (slot0)
			slot0:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
				Destroy(slot0)
			end)
		end)
	end
end

function slot6.onCommonInit(slot0, slot1)
	slot0._skillView = slot0.Battle.BattleSkillView.New(slot0, slot1.Data)
	slot0._userFleet = slot0._dataProxy:GetFleetByIFF(slot1.FRIENDLY_CODE)

	slot0._userFleet:RegisterEventListener(slot0, slot2.SHOW_BUFFER, slot0.onShowBuffer)
	slot0._userFleet:RegisterEventListener(slot0, slot3.POINT_HIT_CHARGE, slot0.onPointHitSight)
	slot0._userFleet:RegisterEventListener(slot0, slot3.POINT_HIT_CANCEL, slot0.onPointHitSight)
	slot0._userFleet:RegisterEventListener(slot0, slot2.MANUAL_SUBMARINE_SHIFT, slot0.onManualSubShift)

	slot0._sightView = slot0.Battle.BattleOpticalSightView.New(slot0._ui:findTF("ChargeAreaContainer"))

	slot0._sightView:SetFleetVO(slot0._userFleet)

	slot2, slot3, slot8, slot9 = slot0._dataProxy:GetTotalBounds()

	slot0._sightView:SetAreaBound(slot4, slot5)
end

function slot6.onAddUnit(slot0, slot1)
	slot2 = slot1.Data.type

	if slot1.Data.unit.IsBoss and slot3:IsBoss() then
		if slot0._hasAppearEffect then
			return
		end

		slot0._hasAppearEffect = true

		slot0._dataProxy:BlockManualCast(true)
		LoadAndInstantiateAsync("UI", "MonsterAppearUI", function (slot0)
			if not slot0._seaView then
				slot0._hasAppearEffect = nil

				Destroy(slot0)

				return
			end

			slot0._state:SetTakeoverProcess(slot2)

			slot0._appearEffect = slot0
			slot0:GetComponent(typeof(Animator)).speed = 1 / slot0._state:GetTimeScaleRate()

			slot0.transform:SetParent(slot0._uiMGR.UIMain.transform, false)
			slot0:GetComponent(typeof(DftAniEvent)).SetEndEvent(slot4, function (slot0)
				slot0._userFleet:CoupleEncourage()
				slot0._dataProxy:BlockManualCast(false)
				slot0._state:ClearTakeoverProcess()

				slot0._appearEffect = nil
				slot0._hasAppearEffect = nil

				Destroy(Destroy)
			end)
			SetActive(slot0, true)
		end)
	elseif slot1.Data.type == slot0.UnitType.ENEMY_UNIT then
		slot0:registerUnitEvent(slot3)
	elseif slot1.Data.type == slot0.UnitType.NPC_UNIT and slot3:GetIFF() == slot1.FOE_CODE then
		slot0:registerUnitEvent(slot3)
	elseif slot1.Data.type == slot0.UnitType.PLAYER_UNIT and slot3:IsMainFleetUnit() and slot3:GetIFF() == slot1.FRIENDLY_CODE then
		slot0:registerPlayerMainUnitEvent(slot3)
	end
end

function slot6.onSubmarineDetected(slot0, slot1)
	slot2 = slot1.Dispatcher

	if slot0._enemyHpBar:GetCurrentTarget() and slot0._enemyHpBar:GetCurrentTarget() == slot2 and slot2:GetDiveDetected() == false then
		slot0._enemyHpBar:RemoveUnit()
	end
end

function slot6.onRemoveUnit(slot0, slot1)
	slot2 = slot1.Data.unit

	if slot1.Data.type == slot0.UnitType.ENEMY_UNIT and not slot2:IsBoss() then
		slot0:unregisterUnitEvent(slot2)
	elseif slot2:IsMainFleetUnit() and slot2:GetIFF() == slot1.FRIENDLY_CODE then
		slot0:unregisterPlayerMainUnitEvent(slot2)
	end

	if slot1.Data.deadReason == slot0.UnitDeathReason.LEAVE and slot0._enemyHpBar:GetCurrentTarget() and slot0._enemyHpBar:GetCurrentTarget() == slot1.Data.unit then
		slot0._enemyHpBar:RemoveUnit(slot1.Data.deadReason)
	end
end

function slot6.onUpdateCountDown(slot0, slot1)
	slot0._timerView:SetCountDownText(slot0._dataProxy:GetCountDown())
end

function slot6.onJamming(slot0, slot1)
	slot0:InitKizunaJamming()
end

function slot6.onUpdateDodgemScore(slot0, slot1)
	slot0._scoreBarView:UpdateScore(slot1.Data.totalScore)
end

function slot6.onUpdateDodgemCombo(slot0, slot1)
	slot0._scoreBarView:UpdateCombo(slot1.Data.combo)
end

function slot6.onAddAirStrike(slot0, slot1)
	slot0._airStrikeView:AppendIcon(slot1.Data.index, slot0._dataProxy:GetAirFighterInfo(slot2))
end

function slot6.onRemoveAirStrike(slot0, slot1)
	slot0._airStrikeView:RemoveIcon(slot1.Data.index, slot0._dataProxy:GetAirFighterInfo(slot2))
end

function slot6.onUpdateHostileSubmarine(slot0, slot1)
	slot0._submarineView:UpdateHostileSubmarineCount(slot1.Data.count)
end

function slot6.onCameraFocus(slot0, slot1)
	if slot1.Data.unit ~= nil then
		slot0:EnableComponent(false)
		slot0:EnableSkillFloat(slot2.skill or false)
	else
		LeanTween.delayedCall(slot0._ui._go, slot2.duration + slot2.extraBulletTime, System.Action(function ()
			slot0:EnableComponent(true)
			slot0.EnableComponent:EnableSkillFloat(true)
		end))
	end
end

function slot6.onShowPainting(slot0, slot1)
	slot0:ShowSkillPainting(slot1.Data.caster, slot1.Data.skill, slot1.Data.speed)
end

function slot6.onBulletTime(slot0, slot1)
	slot3 = slot1.Data.key

	if slot1.Data.rate then
		slot0.AppendMapFactor(slot3, slot4)
	else
		slot0.RemoveMapFactor(slot3)
	end

	slot0._seaView:UpdateSpeedScaler()
end

function slot6.onShowBuffer(slot0, slot1)
	slot0._seaView:UpdateBufferAlpha(slot1.Data.dist)
end

function slot6.onManualSubShift(slot0, slot1)
	slot0._skillView:ShiftSubmarineManualButton(slot1.Data.state)
end

function slot6.onPointHitSight(slot0, slot1)
	if slot1.ID == slot0.POINT_HIT_CHARGE then
		slot0._sightView:SetActive(true)
	elseif slot2 == slot0.POINT_HIT_CANCEL then
		slot0._sightView:SetActive(false)
	end
end

function slot6.registerUnitEvent(slot0, slot1)
	slot1:RegisterEventListener(slot0, slot0.UPDATE_HP, slot0.onEnemyHpUpdate)

	if table.contains(TeamType.SubShipType, slot1:GetTemplate().type) then
		slot1:RegisterEventListener(slot0, slot0.SUBMARINE_DETECTED, slot0.onSubmarineDetected)
	end
end

function slot6.registerPlayerMainUnitEvent(slot0, slot1)
	slot1:RegisterEventListener(slot0, slot0.UPDATE_HP, slot0.onPlayerMainUnitHpUpdate)
end

function slot6.unregisterUnitEvent(slot0, slot1)
	slot1:UnregisterEventListener(slot0, slot0.UPDATE_HP)

	if table.contains(TeamType.SubShipType, slot1:GetTemplate().type) then
		slot1:UnregisterEventListener(slot0, slot0.SUBMARINE_DETECTED)
	end
end

function slot6.unregisterPlayerMainUnitEvent(slot0, slot1)
	slot1:UnregisterEventListener(slot0, slot0.UPDATE_HP)
end

function slot6.Dispose(slot0)
	LeanTween.cancel(slot0._ui._go)
	slot0._uiMGR:ClearStick()

	slot0._uiMGR = nil

	if slot0._appearEffect then
		Destroy(slot0._appearEffect)
	end

	slot0:RemoveUIEvent()
	slot0._timerView:Dispose()
	slot0._enemyHpBar:Dispose()
	slot0._skillView:Dispose()
	slot0._seaView:Dispose()
	slot0._airStrikeView:Dispose()
	slot0._sightView:Dispose()
	slot0._mainDamagedView:Dispose()
	slot0._submarineView:Dispose()

	slot0._seaView = nil
	slot0._enemyHpBar = nil
	slot0._skillView = nil
	slot0._timerView = nil
	slot0._joystick = nil
	slot0._airStrikeView = nil
	slot0._submarineView = nil
	slot0._mainDamagedView = nil

	if slot0._duelRateBar then
		slot0._duelRateBar:Dispose()

		slot0._duelRateBar = nil
	end

	if slot0._simulationBuffCountView then
		slot0._simulationBuffCountView:Dispose()

		slot0._simulationBuffCountView = nil
	end

	if slot0._jammingView then
		slot0._jammingView:Dispose()

		slot0._jammingView = nil
	end

	slot0.super.Dispose(slot0)
end

return
