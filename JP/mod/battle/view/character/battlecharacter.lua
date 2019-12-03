ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = ys.Battle.BattleConst
slot3 = ys.Battle.BattleConfig
slot4 = ys.Battle.BattleResourceManager
slot5 = class("BattleCharacter", ys.Battle.BattleSceneObject)
ys.Battle.BattleCharacter = slot5
slot5.__name = "BattleCharacter"
slot6 = Vector2(-1200, 0)
slot7 = Vector3.New(0.3, -1.8, 0)

function slot5.Ctor(slot0)
	slot0.super.Ctor(slot0)
	slot0:Init()
end

function slot5.Init(slot0)
	slot0.EventListener.AttachEventListener(slot0)
	slot0:InitBulletFactory()
	slot0:InitEffectView()

	slot0._tagFXList = {}
	slot0._cacheFXList = {}
	slot0._allFX = {}
	slot0._bulletCache = {}
	slot0._attachWeaponList = {}
	slot0._characterPos = Vector3.zero
	slot0._inViewArea = false
	slot0._alwaysHideArrow = false
	slot0._hideHP = false
	slot0._referenceVector = Vector3.zero
	slot0._referenceVectorTemp = Vector3.zero
	slot0._hpBarPos = Vector3.zero
	slot0._arrowVector = Vector3.zero
	slot0._arrowAngleVector = Vector3.zero
end

function slot5.InitBulletFactory(slot0)
	slot0._bulletFactoryList = slot0.Battle.BattleBulletFactory.GetFactoryList()
end

function slot5.SetUnitData(slot0, slot1)
	slot0._unitData = slot1

	slot0:AddUnitEvent()
end

function slot5.SetBoneList(slot0)
	slot0._boneList = {}
	slot0._bonePosTable = nil
	slot0._posMatrix = nil
	slot1 = slot0:GetInitScale()

	for slot5, slot6 in pairs(slot0._unitData:GetTemplate().bound_bone) do
		if slot5 ~= "remote" then
			slot7 = {}

			for slot11, slot12 in ipairs(slot6) do
				if type(slot12) == "table" then
					slot7[#slot7 + 1] = Vector3(slot12[1], slot12[2], slot12[3])
				else
					slot7[#slot7 + 1] = Vector3.zero
				end
			end

			slot0._boneList[slot5] = slot7
		end
	end
end

function slot5.SpawnBullet(slot0, slot1, slot2, slot3)
	slot0._bulletFactoryList[slot1:GetTemplate().type]:CreateBullet(slot0._tf, slot1, slot0:GetBonePos(slot2), slot3, slot0._unitData:GetDirection())
end

function slot5.GetBonePos(slot0, slot1)
	if slot0._boneList[slot1] == nil or #slot2 == 0 then
		return Vector3.zero
	end

	slot3 = nil

	if not slot0._posMatrix then
		slot0._posMatrix = slot0._tf.localToWorldMatrix
		slot0._bonePosTable = {}
	else
		slot3 = slot0._posMatrix
	end

	if slot0._bonePosTable[slot1] == nil then
		slot4 = {}

		for slot8, slot9 in ipairs(slot2) do
			slot4[#slot4 + 1] = slot3:MultiplyPoint3x4(slot9)
		end

		slot0._bonePosTable[slot1] = slot4
	end

	if #slot4 == 1 then
		return slot4[1]
	else
		return slot4[math.floor(math.Random(0, #slot4)) + 1]
	end
end

function slot5.AddFXOffsets(slot0, slot1, slot2)
	slot0._FXAttachPoint = slot1
	slot0._FXOffset = slot2
end

function slot5.GetFXOffsets(slot0, slot1)
	return slot0._FXOffset[slot1 or 1]
end

function slot5.GetAttachPoint(slot0)
	return slot0._FXAttachPoint
end

function slot5.GetSpecificFXScale(slot0)
	return {}
end

function slot5.PlayFX(slot0, slot1)
	pg.EffectMgr.GetInstance():PlayBattleEffect(slot0:GetFactory():GetFXPool():GetFX(slot1), slot0:GetPosition(), true)
end

function slot5.AddFX(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0:GetFactory():GetFXPool():GetCharacterFX(slot1, slot0, not slot2, function (slot0)
		if slot0 then
			slot0()
		end

		slot1._allFX[slot0] = nil
	end, slot3)

	if slot2 then
		slot0._cacheFXList[slot1] = slot5
	end

	slot0._allFX[slot5] = true

	return slot5
end

function slot5.RemoveFX(slot0, slot1)
	if slot0._allFX and slot0._allFX[slot1] then
		slot0._allFX[slot1] = nil

		slot0.GetInstance():DestroyOb(slot1)
	end
end

function slot5.RemoveCacheFX(slot0, slot1)
	if slot0._cacheFXList[slot1] ~= nil then
		slot0._allFX[slot2] = nil

		slot0.GetInstance():DestroyOb(slot2)

		slot0._cacheFXList[slot1] = nil
	end
end

function slot5.AddWaveFX(slot0, slot1)
	slot0._waveFX = slot0:AddFX(slot1)
end

function slot5.AddBlink(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if slot0._unitData:GetDiveInvisible() then
		return nil
	end

	slot8 = nil

	return SpineAnim.CharBlink(slot0._go, slot1, slot2, slot3, slot7 or 0.18, slot4 or 0.1, slot5 or 0.1, slot6 or false)
end

function slot5.RemoveBlink(slot0, slot1)
	SpineAnim.RemoveBlink(slot0._go, slot1)
end

function slot5.AddShaderColor(slot0, slot1)
	slot0._animator:ShiftShader(slot0:GetTf():GetComponent(typeof(Renderer)).material.shader, slot1 or Color.New(0, 0, 0, 0))
end

function slot5.GetPosition(slot0)
	return slot0._characterPos
end

function slot5.GetUnitData(slot0)
	return slot0._unitData
end

function slot5.GetDestroyFXID(slot0)
	return slot0:GetUnitData():GetTemplate().bomb_fx
end

function slot5.GetOffsetPos(slot0)
	return BuildVector3(slot0._unitData:GetTemplate().position_offset)
end

function slot5.GetReferenceVector(slot0, slot1)
	if slot1 == nil then
		return slot0._referenceVector
	else
		slot0._referenceVectorTemp:Set(slot0._characterPos.x, slot0._characterPos.y, slot0._characterPos.z)
		slot0._referenceVectorTemp:Sub(slot1)
		slot0.Battle.BattleVariable.CameraPosToUICameraByRef(slot0._referenceVectorTemp)

		slot0._referenceVectorTemp.z = 2

		return slot0._referenceVectorTemp
	end
end

function slot5.GetInitScale(slot0)
	return slot0._unitData:GetTemplate().scale / 50
end

function slot5.AddUnitEvent(slot0)
	slot0._unitData:RegisterEventListener(slot0, slot0.SPAWN_CACHE_BULLET, slot0.onSpawnCacheBullet)
	slot0._unitData:RegisterEventListener(slot0, slot0.CREATE_TEMPORARY_WEAPON, slot0.onNewWeapon)
	slot0._unitData:RegisterEventListener(slot0, slot0.ADD_TAG, slot0.onAddTag)
	slot0._unitData:RegisterEventListener(slot0, slot0.REMOVE_TAG, slot0.onRemoveTag)
	slot0._unitData:RegisterEventListener(slot0, slot0.POP_UP, slot0.onPopup)
	slot0._unitData:RegisterEventListener(slot0, slot0.VOICE, slot0.onVoice)
	slot0._unitData:RegisterEventListener(slot0, slot0.PLAY_FX, slot0.onPlayFX)
	slot0._unitData:RegisterEventListener(slot0, slot0.REMOVE_WEAPON, slot0.onRemoveWeapon)
	slot0._unitData:RegisterEventListener(slot0, slot0.ADD_BLINK, slot0.onBlink)
	slot0._unitData:RegisterEventListener(slot0, slot0.SUBMARINE_VISIBLE, slot0.onUpdateDiveInvisible)
	slot0._unitData:RegisterEventListener(slot0, slot0.SUBMARINE_DETECTED, slot0.onDetected)
	slot0._unitData:RegisterEventListener(slot0, slot0.INIT_ANIT_SUB_VIGILANCE, slot0.onInitVigilantState)
	slot0._unitData:RegisterEventListener(slot0, slot1.Battle.BattleBuffEvent.BUFF_EFFECT_CHNAGE_SIZE, slot0.onChangeSize)
	slot0._unitData:RegisterEventListener(slot0, slot1.Battle.BattleBuffEvent.BUFF_EFFECT_NEW_WEAPON, slot0.onNewWeapon)
	slot0._unitData:RegisterEventListener(slot0, slot0.UPDATE_SCORE, slot0.onUpdateScore)

	for slot5, slot6 in ipairs(slot1) do
		slot0:RegisterWeaponListener(slot6)
	end

	slot0._effectOb:SetUnitDataEvent(slot0._unitData)
end

function slot5.RemoveUnitEvent(slot0)
	slot0._unitData:UnregisterEventListener(slot0, slot0.UPDATE_HP)
	slot0._unitData:UnregisterEventListener(slot0, slot0.CREATE_TEMPORARY_WEAPON)
	slot0._unitData:UnregisterEventListener(slot0, slot0.CHANGE_ACTION)
	slot0._unitData:UnregisterEventListener(slot0, slot0.SPAWN_CACHE_BULLET)
	slot0._unitData:UnregisterEventListener(slot0, slot0.ADD_TAG)
	slot0._unitData:UnregisterEventListener(slot0, slot0.REMOVE_TAG)
	slot0._unitData:UnregisterEventListener(slot0, slot0.POP_UP)
	slot0._unitData:UnregisterEventListener(slot0, slot0.VOICE)
	slot0._unitData:UnregisterEventListener(slot0, slot0.PLAY_FX)
	slot0._unitData:UnregisterEventListener(slot0, slot0.REMOVE_WEAPON)
	slot0._unitData:UnregisterEventListener(slot0, slot0.ADD_BLINK)
	slot0._unitData:UnregisterEventListener(slot0, slot0.SUBMARINE_VISIBLE)
	slot0._unitData:UnregisterEventListener(slot0, slot0.UPDATE_SCORE)
	slot0._unitData:UnregisterEventListener(slot0, slot0.CHANGE_ANTI_SUB_VIGILANCE)
	slot0._unitData:UnregisterEventListener(slot0, slot0.INIT_ANIT_SUB_VIGILANCE)
	slot0._unitData:UnregisterEventListener(slot0, slot0.ANTI_SUB_VIGILANCE_SONAR_CHECK)
	slot0._unitData:UnregisterEventListener(slot0, slot1.Battle.BattleBuffEvent.BUFF_EFFECT_CHNAGE_SIZE)
	slot0._unitData:UnregisterEventListener(slot0, slot1.Battle.BattleBuffEvent.BUFF_EFFECT_NEW_WEAPON)

	for slot5, slot6 in ipairs(slot1) do
		slot0:UnregisterWeaponListener(slot6)
	end

	for slot6, slot7 in ipairs(slot2) do
		slot0:UnregisterWeaponListener(slot7)
	end
end

function slot5.Update(slot0)
	slot0._bonePosSet = nil

	slot0:UpdateUIComponentPosition()
	slot0:UpdateHPPop()
	slot0:UpdateAniEffect(slot1)
	slot0:UpdateTagEffect(pg.TimeMgr.GetInstance():GetCombatTime())
	slot0:UpdateHPBarPostition()
	slot0:UpdateChatPosition()
	slot0:UpdateHpBar()
	slot0:updateSomkeFX()
end

function slot5.RegisterWeaponListener(slot0, slot1)
	slot1:RegisterEventListener(slot0, slot0.CREATE_BULLET, slot0.onCreateBullet)
	slot1:RegisterEventListener(slot0, slot0.FIRE, slot0.onCannonFire)
end

function slot5.UnregisterWeaponListener(slot0, slot1)
	slot1:UnregisterEventListener(slot0, slot0.CREATE_BULLET)
	slot1:UnregisterEventListener(slot0, slot0.FIRE)
end

function slot5.onCreateBullet(slot0, slot1)
	slot0:SpawnBullet(slot1.Data.bullet, slot1.Data.spawnBound, slot1.Data.fireFxID)
end

function slot5.onCannonFire(slot0, slot1)
	slot2 = slot1.Dispatcher
	slot3 = slot1.Data.target
	slot4 = slot1.Data.actionIndex or "attack"
	slot6 = nil

	if not slot0._unitData:NeedWeaponCache() then
		if slot0._cacheWeapon == nil then
			slot6 = false
		else
			slot6 = true
		end
	else
		slot0._cacheWeapon = {}
		slot6 = true

		slot0._unitData:StateChange(slot0.Battle.UnitState.STATE_ATTACK, slot4)
	end

	if slot6 == true then
		slot0._cacheWeapon[#slot0._cacheWeapon + 1] = {
			weapon = slot2,
			target = slot3,
			weapon = slot2,
			target = slot3
		}
	else
		slot2:DoAttack(slot3)
	end
end

function slot5.onSpawnCacheBullet(slot0)
	if slot0._cacheWeapon then
		for slot4, slot5 in ipairs(slot0._cacheWeapon) do
			slot5.weapon:DoAttack(slot5.target)

			if not slot0._unitData:IsAlive() then
				break
			end
		end

		slot0._cacheWeapon = nil
	end
end

function slot5.onNewWeapon(slot0, slot1)
	table.insert(slot0._attachWeaponList, slot2)
	slot0:RegisterWeaponListener(slot1.Data.weapon)
end

function slot5.onAddTag(slot0, slot1)
	slot3 = slot0:GetFactory():MakeTag(slot1.Data.tagID)

	slot3:SetTagCount(slot4)
	slot3:Mark(slot1.Data.requiredTime)

	slot0._tagFXList[slot1.Data.tagID] = slot3
end

function slot5.onRemoveTag(slot0, slot1)
	slot0._tagFXList[slot1.Data.tagID] = nil

	slot0._tagFXList[slot1.Data.tagID]:Dispose()
end

function slot5.onPopup(slot0, slot1)
	slot0:SetPopup(slot1.Data.content, slot1.Data.duration, slot1.Data.key)
end

function slot5.onVoice(slot0, slot1)
	slot0:Voice(slot1.Data.content, slot1.Data.key)
end

function slot5.onPlayFX(slot0, slot1)
	slot2 = slot1.Data.fxName

	if slot1.Data.notAttach then
		slot0:PlayFX(slot2)
	else
		slot0:AddFX(slot2)
	end
end

function slot5.onRemoveWeapon(slot0, slot1)
	slot2 = slot1.Data.weapon

	if slot0._cacheWeapon then
		for slot6, slot7 in ipairs(slot0._cacheWeapon) do
			if slot7.weapon == slot2 then
				table.remove(slot0._cacheWeapon, slot6)

				break
			end
		end
	end

	slot0:UnregisterWeaponListener(slot2)
end

function slot5.onBlink(slot0, slot1)
	slot0:AddBlink(slot1.Data.blink.red, slot1.Data.blink.green, slot1.Data.blink.blue, slot1.Data.blink.peroid, slot1.Data.blink.duration, true, slot1.Data.blink.alpha)
end

function slot5.onUpdateDiveInvisible(slot0, slot1)
	slot0:UpdateDiveInvisible()
end

function slot5.UpdateDiveInvisible(slot0)
	slot1 = slot0._unitData:GetDiveInvisible()
	slot2 = slot0._unitData:GetIFF() == slot0.FOE_CODE

	if slot1 then
		if slot0._waveFX then
			SetActive(slot0._waveFX.transform, false)
		end

		slot3 = slot0:GetFactory():GetDivingFilterColor()

		if slot2 then
			slot0:SwitchShader(slot1.GetInstance():GetShader("GRID_TRANSPARENT"), slot3)
			slot0:updateComponentDiveInvisible()
		else
			slot0:SwitchShader(slot1.GetInstance():GetShader("SEMI_TRANSPARENT"), slot3)
		end

		slot0._animator:ChangeRenderQueue(2999)
	else
		if slot0._waveFX then
			SetActive(slot0._waveFX.transform, true)
		end

		if slot2 then
			slot0:SwitchShader()
			slot0:updateComponentDiveInvisible()
		else
			slot0:SwitchShader()
			slot0:AddShaderColor()
		end

		slot0._animator:ChangeRenderQueue(3000)
	end
end

function slot5.onDetected(slot0, slot1)
	slot3 = slot1.Data.duration

	if slot0._unitData:GetDiveDetected() and slot0._unitData:GetIFF() == slot0.FOE_CODE then
		SpineAnim.CharFade(slot0._go, slot3, slot3, 0.7, true)

		slot0._shockFX = slot0:AddFX("shock", true, true)
	else
		slot0:RemoveCacheFX(slot0._shockFX)
	end

	slot0:updateComponentDiveInvisible()
end

function slot5.updateComponentDiveInvisible(slot0)
	slot3 = nil

	SetActive(slot0._arrowBarTf, not (not (slot0._unitData:GetDiveDetected() and slot0._unitData:GetIFF() == slot0.FOE_CODE) and slot0._unitData:GetDiveInvisible()))
	SetActive(slot0._HPBarTf, not (not (slot0._unitData.GetDiveDetected() and slot0._unitData.GetIFF() == slot0.FOE_CODE) and slot0._unitData.GetDiveInvisible()))
	SetActive(slot0._FXAttachPoint, not (not (slot0._unitData.GetDiveDetected() and slot0._unitData.GetIFF() == slot0.FOE_CODE) and slot0._unitData.GetDiveInvisible()))
end

function slot5.onInitVigilantState(slot0, slot1)
	slot0._factory:MakeVigilantBar(slot0)

	range = slot1.Data.sonarRange * 0.5
	slot0:AddFX("AntiSubArea", true).transform.localScale = Vector3(range, 0, range)

	slot0._unitData:RegisterEventListener(slot0, slot0.CHANGE_ANTI_SUB_VIGILANCE, slot0.onVigilantStateChange)
	slot0._unitData:RegisterEventListener(slot0, slot0.ANTI_SUB_VIGILANCE_SONAR_CHECK, function ()
		slot0 = slot0:Find("Quad"):GetComponent(typeof(Animator))
		slot0.enabled = true

		slot0:Play("antiSubZoom", -1, 0)
	end)
end

function slot5.onVigilantStateChange(slot0, slot1)
	slot0:updateVigilantMark()
end

function slot5.updateVigilantMark(slot0)
	if slot0._vigilantBar then
		slot0._vigilantBar:UpdateVigilantMark()
	end
end

function slot5.OnActionChange(slot0, slot1)
	slot0:PlayAction(slot1.Data.actionType)
end

function slot5.PlayAction(slot0, slot1)
	slot0._animator:SetAction(slot1, 0, slot0.ActionLoop[slot1])
end

function slot5.SetAnimaSpeed(slot0, slot1)
	slot0._skeleton = slot0._skeleton or slot0:GetTf():GetComponent("SkeletonAnimation")
	slot0._skeleton.timeScale = slot1 or 1
end

function slot5.UpdatePosition(slot0)
	if not slot0._go then
		return
	end

	slot0._characterPos = slot0._unitData:GetPosition()
	slot0._tf.localPosition = slot0._unitData.GetPosition()
end

function slot5.UpdateMatrix(slot0)
	slot0._bonePosTable = nil
	slot0._posMatrix = nil
end

function slot5.UpdateUIComponentPosition(slot0)
	slot1 = slot0._unitData:GetPosition()

	slot0._referenceVector:Set(slot1.x, slot1.y, slot1.z)
	slot0.Battle.BattleVariable.CameraPosToUICameraByRef(slot0._referenceVector)

	slot0._referenceVector.z = 10
end

function slot5.UpdateHPBarPostition(slot0)
	if not slot0._hideHP then
		slot0._hpBarPos:Copy(slot0._referenceVector):Add(slot0._hpBarOffset)

		slot0._HPBarTf.position = slot0._hpBarPos
	end
end

function slot5.SetBarHidden(slot0, slot1, slot2)
	slot0._alwaysHideArrow = slot1
	slot0._hideHP = slot2

	if slot0._arrowBar then
		if slot0._alwaysHideArrow then
			slot0._arrowBarTf.anchoredPosition = slot0
		else
			slot0._arrowBarTf.position = slot0._arrowVector
		end
	end
end

function slot5.SetSkeletonAutoCalcComplex(slot0, slot1)
	return
end

function slot5.UpdateCastClockPosition(slot0)
	slot0._castClock:UpdateCastClockPosition(slot0._referenceVector)
end

function slot5.SetArrowPoint(slot0)
	slot0._arrowVector:Set()

	slot0._cameraUtil = slot0.Battle.BattleCameraUtil.GetInstance()
	slot0._arrowCenterPos = slot0._cameraUtil:GetArrowCenterPos()
end

slot8 = Vector3(-1, 1, 1)
slot9 = Vector3(1, 1, 1)

function slot5.UpdateArrowBarPostition(slot0)
	if not slot0._cameraUtil:GetCharacterArrowBarPosition(slot0._referenceVector, slot0._arrowVector) then
		if not slot0._inViewArea then
			slot0._inViewArea = true
			slot0._arrowBarTf.anchoredPosition = slot0
		end
	else
		slot0._arrowVector = slot1
		slot0._inViewArea = false

		if not slot0._alwaysHideArrow then
			slot0._arrowBarTf.position = slot0._arrowVector

			if slot0._arrowVector.x > 0 then
				slot0._arrowBarTf.localScale = slot1
			else
				slot0._arrowBarTf.localScale = slot0._arrowBarTf
			end
		end
	end
end

function slot5.UpdateArrowBarRotation(slot0)
	if slot0._inViewArea then
		return
	end

	slot0._arrowAngleVector.z = math.rad2Deg * math.atan2(slot0._arrowVector.y - slot0._arrowCenterPos.y, slot0._arrowVector.x - slot0._arrowCenterPos.x)
	slot0._arrowBarTf.eulerAngles = slot0._arrowAngleVector
end

function slot5.UpdateChatPosition(slot0)
	if not slot0._popGO then
		return
	end

	if slot0._inViewArea then
		slot0._popTF.position = slot0:GetReferenceVector()
	else
		slot0._popTF.position = slot0._arrowVector + slot0
	end
end

function slot5.Dispose(slot0)
	if slot0._popGO then
		LeanTween.cancel(slot0._popGO)
	end

	Object.Destroy(slot0._popGO)

	if slot0._voice then
		slot0._voice:Stop(true)
	end

	slot0._voice = nil
	slot0._popGO = nil
	slot0._popTF = nil
	slot0._cacheWeapon = nil
	slot0._popNumPool = nil

	for slot4, slot5 in pairs(slot0._allFX) do
		slot0.GetInstance():DestroyOb(slot4)
	end

	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._voiceTimer)

	slot0._voiceTimer = nil

	slot0._effectOb:RemoveUnitEvent(slot0._unitData)
	slot0._effectOb:Dispose()

	slot0._HPProgressBar = nil
	slot0._HPProgress = nil

	slot0._factory:GetHPBarPool():DestroyObj(slot0._HPBar)

	slot0._HPBar = nil
	slot0._HPBarTf = nil
	slot0._arrowBar = nil
	slot0._arrowBarTf = nil
	slot0._animator = nil
	slot0._skeleton = nil
	slot0._posMatrix = nil
	slot0._shockFX = nil
	slot0._waveFX = nil

	slot0:RemoveUnitEvent()
	slot0.RemoveUnitEvent.EventListener.DetachEventListener(slot0)

	slot0._bulletFactoryList = nil

	for slot4, slot5 in pairs(slot0._tagFXList) do
		slot5:Dispose()
	end

	slot0._tagFXList = nil
	slot0._attachWeaponList = {}

	slot2.super.Dispose(slot0)
end

function slot5.AddModel(slot0, slot1)
	slot0:SetGO(slot1)

	slot0._hpBarOffset = Vector3(0, slot0._unitData:GetBoxSize().y, 0)
	slot0._animator = slot0:GetTf():GetComponent(typeof(SpineAnim))

	if slot0._animator then
		slot0._animator.autoCalcComplex = true

		slot0._animator:Start()
	end

	slot0:SetBoneList()

	slot0._tf.position = slot0._unitData:GetPosition()

	slot0:UpdateMatrix()
	slot0._unitData:ActiveCldBox()

	slot2 = slot0:GetInitScale()
	slot0._tf.localScale = Vector3(slot2 * slot0._unitData:GetDirection(), slot2, slot2)

	if slot0._unitData:GetOxyState() and slot3:GetCurrentDiveState() == slot0.Battle.BattleConst.OXY_STATE.DIVE then
		slot0:PlayAction(slot0.Battle.BattleConst.ActionName.DIVE)
	else
		slot0:PlayAction(slot0.Battle.BattleConst.ActionName.MOVE)
	end

	slot0._animator:SetActionCallBack(function (slot0)
		if slot0 == "finish" then
			slot0:OnAnimatorEnd()
		elseif slot0 == "action" then
			slot0:OnAnimatorTrigger()
		end
	end)
	slot0._unitData:RegisterEventListener(slot0, slot1.CHANGE_ACTION, slot0.OnActionChange)
end

function slot5.AddSmokeFXs(slot0, slot1)
	slot0._smokeList = slot1

	slot0:updateSomkeFX()
end

function slot5.AddShadow(slot0, slot1)
	slot0._shadow = slot1
end

function slot5.AddHPBar(slot0, slot1)
	slot0._HPBar = slot1
	slot0._HPBarTf = slot1.transform
	slot0._HPProgressBar = slot0._HPBarTf:Find("blood")
	slot0._HPProgress = slot0._HPProgressBar:GetComponent(typeof(Image))

	slot0._unitData:RegisterEventListener(slot0, slot0.UPDATE_HP, slot0.OnUpdateHP)

	slot0._HPBarTf.position = slot0._referenceVector + slot0._hpBarOffset
end

function slot5.AddUIComponentContainer(slot0, slot1)
	slot0:UpdateUIComponentPosition()
end

function slot5.AddPopNumPool(slot0, slot1)
	slot0._popNumPool = slot1
	slot0._hpPopIndex_put = 1
	slot0._hpPopIndex_get = 1
	slot0._hpPopCount = 0
	slot0._hpPopCatch = {}
end

function slot5.AddArrowBar(slot0, slot1)
	slot0._arrowBar = slot1
	slot0._arrowBarTf = slot1.transform

	slot0:SetArrowPoint()
end

function slot5.AddCastClock(slot0, slot1)
	SetActive(slot2, false)

	slot0._castClock = slot0.Battle.BattleCastBar.New(slot2)

	slot0:UpdateCastClockPosition()
end

function slot5.AddVigilantBar(slot0, slot1)
	slot0._vigilantBar = slot0.Battle.BattleVigilantBar.New(slot1.transform)

	slot0._vigilantBar:ConfigVigilant(slot0._unitData:GetAntiSubState())
	slot0._vigilantBar:UpdateVigilantProgress()
	slot0:updateVigilantMark()
end

function slot5.UpdateVigilantBarPosition(slot0)
	slot0._vigilantBar:UpdateVigilantBarPosition(slot0._hpBarPos)
end

function slot5.OnUpdateHP(slot0, slot1)
	slot0:_DealHPPop(slot1.Data)
end

function slot5._DealHPPop(slot0, slot1)
	if slot0._hpPopIndex_put == slot0._hpPopIndex_get and slot0._hpPopCount == 0 then
		slot0:_PlayHPPop(slot1)

		slot0._hpPopCount = 1
	elseif slot0._unitData:IsAlive() then
		slot0._hpPopCatch[slot0._hpPopIndex_put] = slot1
		slot0._hpPopIndex_put = slot0._hpPopIndex_put + 1
	else
		slot0:_PlayHPPop(slot1)
	end
end

function slot5.UpdateHPPop(slot0)
	if slot0._hpPopIndex_put == slot0._hpPopIndex_get then
		return
	else
		slot0._hpPopCount = slot0._hpPopCount + 1

		if slot0:_CalcHPPopCount() <= slot0._hpPopCount then
			slot0:_PlayHPPop(slot0._hpPopCatch[slot0._hpPopIndex_get])

			slot0._hpPopCatch[slot0._hpPopIndex_get] = nil
			slot0._hpPopIndex_get = slot0._hpPopIndex_get + 1
			slot0._hpPopCount = 0
		end
	end
end

function slot5._PlayHPPop(slot0, slot1)
	slot8 = slot0._popNumPool:GetPop(slot1.isHeal, slot1.isCri, slot1.isMiss, slot1.dHP, slot1.font)

	slot8:SetReferenceCharacter(slot0, slot1.posOffset or Vector3.zero)
	slot8:Play()
end

function slot5._CalcHPPopCount(slot0)
	if slot0._hpPopIndex_put - slot0._hpPopIndex_get > 5 then
		return 1
	else
		return 5
	end
end

function slot5.onUpdateScore(slot0, slot1)
	slot3 = slot0._popNumPool:GetScorePop(slot2)

	slot3:SetReferenceCharacter(slot0, Vector3.zero)
	slot3:Play()
end

function slot5.UpdateHpBar(slot0)
	slot1 = slot0._unitData:GetCurrentHP()

	if slot0._HPProgress and slot0._cacheHP ~= slot1 then
		slot0._HPProgress.fillAmount = slot0._unitData:GetHPRate()
		slot0._cacheHP = slot1
	end
end

function slot5.onChangeSize(slot0, slot1)
	slot0:doChangeSize(slot1)
end

function slot5.updateSomkeFX(slot0)
	slot1 = slot0._unitData:GetHPRate()

	for slot5, slot6 in ipairs(slot0._smokeList) do
		if slot1 < slot6.rate then
			if slot6.active == false then
				slot6.active = true

				for slot11, slot12 in pairs(slot7) do
					if slot11.unInitialize then
						slot13 = slot0:AddFX(slot11.resID)
						slot13.transform.localPosition = slot11.pos
						slot7[slot11] = slot13

						SetActive(slot13, true)

						slot11.unInitialize = false
					else
						SetActive(slot12, true)
					end
				end
			end
		elseif slot6.active == true then
			slot6.active = false

			for slot11, slot12 in pairs(slot7) do
				if slot11.unInitialize then
				else
					SetActive(slot12, false)
				end
			end
		end
	end
end

function slot5.doChangeSize(slot0, slot1)
	slot0._tf.localScale = slot0._tf.localScale * slot1.Data.size_ratio
end

function slot5.InitEffectView(slot0)
	slot0._effectOb = slot0.Battle.BattleEffectComponent.New(slot0)
end

function slot5.UpdateAniEffect(slot0, slot1)
	slot0._effectOb:Update(slot1)
end

function slot5.UpdateTagEffect(slot0, slot1)
	slot2 = slot0._unitData:GetBoxSize().y * 0.5

	for slot6, slot7 in pairs(slot0._tagFXList) do
		slot7:Update(slot1)
		slot7:SetPosition(slot0._referenceVector + Vector3(0, slot2, 0))
	end
end

function slot5.SetPopup(slot0, slot1, slot2, slot3)
	if slot0._voiceTimer then
		if slot0._voiceKey == slot3 then
			slot0._voiceKey = nil
		else
			return
		end
	end

	if slot0._popGO then
		LeanTween.cancel(slot0._popGO)
		LeanTween.scale(rtf(slot0._popGO.gameObject), Vector3.New(0, 0, 1), 0.1):setEase(LeanTweenType.easeInBack):setOnComplete(System.Action(function ()
			slot0:chatPop(slot0, )
		end))
	else
		slot0._popGO = slot0._factory:MakePopup()
		slot0._popTF = slot0._popGO.transform
		slot0._popTF.localScale = Vector3(0, 0, 0)

		slot0:chatPop(slot1, slot2)
	end

	SetActive(slot0._popGO, true)
end

function slot5.chatPop(slot0, slot1, slot2)
	slot2 = slot2 or 2.5
	findTF(slot0._popGO, "Text"):GetComponent(typeof(Text)).text = slot1:gsub("%s", " ")

	if CHAT_POP_STR_LEN < #findTF(slot0._popGO, "Text").GetComponent(typeof(Text)).text then
		slot3.alignment = TextAnchor.MiddleLeft
	else
		slot3.alignment = TextAnchor.MiddleCenter
	end

	LeanTween.scale(rtf(slot0._popGO.gameObject), Vector3.New(1, 1, 1), 0.3):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function ()
		LeanTween.scale(rtf(slot0._popGO.gameObject), Vector3.New(0, 0, 1), 0.3):setEase(LeanTweenType.easeInBack):setDelay(LeanTween.scale(rtf(slot0._popGO.gameObject), Vector3.New(0, 0, 1), 0.3).setEase(LeanTweenType.easeInBack)):setOnComplete(System.Action(function ()
			SetActive(slot0._popGO, false)
		end))
	end))
end

function slot5.Voice(slot0, slot1, slot2)
	if slot0._voiceTimer then
		return
	end

	slot3 = nil
	slot0._voice, slot3 = playSoundEffect(slot1)

	if slot5 then
		slot0._voiceKey = slot2
		slot0._voiceTimer = pg.TimeMgr.GetInstance():AddBattleTimer("", 0, long2int(slot3.length) * 0.001, function ()
			pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._voiceTimer)

			pg.TimeMgr.GetInstance().RemoveBattleTimer._voiceKey = nil
			pg.TimeMgr.GetInstance().RemoveBattleTimer._voiceTimer = nil
		end)
	end
end

function slot5.SonarAcitve(slot0, slot1)
	return
end

function slot5.SwitchShader(slot0, slot1, slot2)
	slot2 = slot2 or Color.New(1, 0, 0, 1)

	if slot1 then
		slot0._animator:ShiftShader(slot1, slot2)
	else
		slot0._animator:ClearOverrideMaterial()
	end
end

function slot5.GetFactory(slot0)
	return slot0._factory
end

function slot5.SetFactory(slot0, slot1)
	slot0._factory = slot1
end

return
