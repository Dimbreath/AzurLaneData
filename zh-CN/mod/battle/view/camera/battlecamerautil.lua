ys = ys or {}
slot1 = ys.Battle.BattleVariable
slot2 = ys.Battle.BattleEvent
slot3 = ys.Battle.BattleConfig
slot4 = singletonClass("BattleCameraUtil")
ys.Battle.BattleCameraUtil = slot4
slot4.__name = "BattleCameraUtil"
slot4.FOCUS_PILOT = "FOCUS_PILOT"
slot4.TWEEN_TO_CHARACTER = "TWEEN_TO_CHARACTER"
slot4.FOLLOW_GESTURE = "FOLLOW_GESTURE"

function slot4.Ctor(slot0)
	slot0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._camera = GameObject.Find("MainCamera"):GetComponent(typeof(Camera))
	slot0._cameraTF = slot0._camera.transform
	slot0._uiCamera = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
end

function slot4.Initialize(slot0)
	slot0._cameraTF.localPosition = slot0.CAMERA_INIT_POS

	slot0._cameraTF.UpdateCameraPositionArgs()
	slot0:setArrowPoint()

	slot0._boundFix = slot2.Battle.BattleCameraBoundFixDecorate.New()
	slot0._followPilot = slot2.Battle.BattleCameraFollowPilot.New()
	slot0._focusCharacter = slot2.Battle.BattleCameraFocusChar.New()
	slot0._fromTo = slot2.Battle.BattleCameraTween.New()
	slot0._gesture = slot2.Battle.BattleCameraFollowGesture.New()

	slot0:active()
	slot0:SwitchCameraPos()

	slot0._uiMediator = slot2.Battle.BattleState.GetInstance():GetMediatorByName(slot2.Battle.BattleUIMediator.__name)
end

function slot4.Clear(slot0)
	LeanTween.cancel(go(slot0._camera))
	slot0:deactive()
	slot0:StopShake()
	slot0._boundFix:Dispose()
	slot0._followPilot:Dispose()
	slot0._focusCharacter:Dispose()
	slot0._fromTo:Dispose()
	slot0._gesture:Dispose()

	slot0._cameraTF.localPosition = Vector3(0, 62, -10)
	slot0._camera.orthographicSize = 20
	slot0._uiMediator = nil
end

function slot4.SetMapData(slot0, slot1, slot2, slot3, slot4)
	slot0._boundFix:SetMapData(slot1, slot2, slot3, slot4)
	slot0._followPilot:SetGoldenRation(slot0._camera:ScreenToWorldPoint(Vector3(slot0._actualWidth * slot1.CAMERA_GOLDEN_RATE, 0, 0)).x)
end

function slot4.SetFocusFleet(slot0, slot1)
	slot0._followPilot:SetFleetVO(slot1)

	slot0._cameraTF.position = slot0._boundFix:GetCameraPos(slot0._followPilot:GetCameraPos())

	slot0.UpdateCameraPositionArgs()
end

function slot4.SetCameraSilder(slot0, slot1)
	slot0._gesture:SetGestureComponent(slot1)
end

function slot4.SwitchCameraPos(slot0, slot1)
	if slot1 == "TWEEN_TO_CHARACTER" then
		function slot0._currentCameraPos()
			return slot0._fromTo:GetCameraPos()
		end
	elseif slot1 == "FOLLOW_GESTURE" then
		function slot0._currentCameraPos()
			return slot0._boundFix:GetCameraPos(slot0._gesture:GetCameraPos(slot0._cameraTF.position))
		end
	else
		function slot0._currentCameraPos()
			return slot0._boundFix:GetCameraPos(slot0._followPilot:GetCameraPos())
		end
	end
end

function slot4.GetS2WPoint(slot0, slot1)
	return slot0._camera:ScreenToWorldPoint(slot1)
end

function slot4.setArrowPoint(slot0)
	slot0._arrowLeftBottomPos = slot0._uiCamera:ScreenToWorldPoint(slot0._leftBottomVector) + Vector3(slot1, slot1, 0)
	slot0._arrowRightTopPos = slot0._uiCamera:ScreenToWorldPoint(slot0._rightTopVector) - Vector3(1, , 0)
	slot0._arrowCenterPos = (slot0._arrowLeftBottomPos + slot0._arrowRightTopPos) * 0.5
	slot0._arrowFieldHalfWidth = slot0._arrowRightTopPos.x - slot0._arrowCenterPos.x
	slot0._arrowRightHorizon = slot0._arrowRightTopPos.x + 4
	slot0._arrowTopHorizon = slot0._arrowRightTopPos.y + 4
	slot0._arrowBottomHorizon = slot0._arrowLeftBottomPos.y - 4
	slot0._arrowLeftHorizon = slot0._arrowLeftBottomPos.x - 4
end

function slot4.Update(slot0)
	if slot0._cameraTF.position.x ~= slot0:GetCameraPoint().x or slot2.z ~= slot1 then
		slot0._cameraTF.position = slot1

		slot0.UpdateCameraPositionArgs()
	end

	if slot0._shakeInfo then
		slot0:DoShake()
	end
end

function slot4.StartShake(slot0, slot1)
	if slot0._shakeInfo ~= nil then
		return
	end

	slot0._shakeInfo = {
		_elapsed = 0,
		_duration = slot1.time or 0,
		_count = 0,
		_loop = slot1.loop or 1,
		_direction = 1,
		_horizontalDeep = slot1.horizontalDeep or 0,
		_horizontalDeltaDeep = slot1.horizontalDeltaDeep or 0,
		_horizontalRatio = slot1.horizontalRatio or 1,
		_verticalDeep = slot1.verticalDeep or 0,
		_verticalDeltaDeep = slot1.verticalDeep or 0,
		_verticalRatio = slot1.verticalRatio or 1,
		_diff = Vector3.zero
	}
end

function slot4.StopShake(slot0)
	slot0._shakeInfo = nil
end

function slot4.DoShake(slot0)
	slot0._shakeInfo._count = slot0._shakeInfo._count + 1
	slot0._shakeInfo._elapsed = slot0._shakeInfo._elapsed + Time.deltaTime

	LuaHelper.UpdateTFLocalPos(slot0._cameraTF, Vector3(slot1, slot2, 0):Mul(slot0._shakeInfo._direction) - slot0._shakeInfo._diff)

	if slot0._shakeInfo._loop <= slot0._shakeInfo._count then
		slot0._shakeInfo._horizontalDeep = slot0._shakeInfo._horizontalDeep * slot0._shakeInfo._horizontalRatio + slot0._shakeInfo._horizontalDeltaDeep
		slot0._shakeInfo._verticalDeep = slot0._shakeInfo._verticalDeep * slot0._shakeInfo._verticalRatio + slot0._shakeInfo._verticalDeltaDeep
		slot0._shakeInfo._direction = -slot0._shakeInfo._direction
		slot0._shakeInfo._count = 0
	end

	if slot0._shakeInfo._duration < slot0._shakeInfo._elapsed then
		slot0:StopShake()
	else
		slot0._shakeInfo._diff = slot3
	end
end

function slot4.active(slot0)
	UpdateBeat:Add(slot0.Update, slot0)
end

function slot4.deactive(slot0)
	UpdateBeat:Remove(slot0.Update, slot0)
end

function slot4.CutInPainting(slot0, slot1, slot2)
	slot0:DispatchEvent(slot0.Event.New(slot1.SHOW_PAINTING, {
		caster = slot1,
		speed = slot2
	}))
end

function slot4.BulletTime(slot0, slot1, slot2, slot3)
	slot0:DispatchEvent(slot0.Event.New(slot1.BULLET_TIME, {
		key = slot1,
		speed = slot2,
		exemptUnit = slot3
	}))
	slot0.Battle.BattleState.GetInstance():ScaleTimer(slot2)

	if slot0._uiMediator:GetAppearFX() ~= nil then
		slot0._uiMediator:GetAppearFX():GetComponent(typeof(Animator)).speed = 1 / (slot2 or 1)
	end
end

function slot4.ZoomCamara(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-5, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 8-9, warpins: 2 ---
	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot3 = 1.6
		--- END OF BLOCK #0 ---



	end

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		slot2 = slot0.CAMERA_SIZE
		--- END OF BLOCK #0 ---



	end

	slot1 = slot1 or slot0._camera.orthographicSize
	slot5 = LeanTween.value(go(slot0._camera), slot1 or slot0._camera.orthographicSize, slot2, slot3):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot0._camera.orthographicSize = slot0

		return
		--- END OF BLOCK #0 ---



	end))
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 10-11, warpins: 1 ---
	slot1 = slot0._camera.orthographicSize

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 12-29, warpins: 2 ---
	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-34, warpins: 1 ---
		slot5:setEase(LeanTweenType.easeOutExpo)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 35-36, warpins: 2 ---
	return
	--- END OF BLOCK #5 ---



end

function slot4.FocusCharacter(slot0, slot1, slot2, slot3, slot4, slot5)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0:StopShake()

	if not delay then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 1 ---
		slot6 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-14, warpins: 2 ---
	delay = slot6
	slot6 = {
		unit = slot1,
		duration = slot2,
		extraBulletTime = slot3
	}

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-15, warpins: 1 ---
		slot7 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-26, warpins: 2 ---
	slot6.skill = slot7

	LeanTween.cancel(go(slot0._camera))

	slot7 = slot0._cameraTF.position

	if slot1 ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-37, warpins: 1 ---
		slot0._focusCharacter:SetUnit(slot1)

		slot8 = slot0._focusCharacter:GetCameraPos()

		if slot5 == nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-38, warpins: 1 ---
			slot5 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 39-54, warpins: 2 ---
		slot0._fromTo:SetFromTo(slot0._camera, slot7, slot8, slot2, delay, slot5)
		slot0:SwitchCameraPos(slot0.TWEEN_TO_CHARACTER)
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-65, warpins: 1 ---
		slot8 = slot0._boundFix:GetCameraPos(slot0._followPilot:GetCameraPos())

		function slot9()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			slot0:SwitchCameraPos()

			return
			--- END OF BLOCK #0 ---



		end

		if slot5 == nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 66-66, warpins: 1 ---
			slot5 = false
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 67-82, warpins: 2 ---
		slot0._fromTo:SetFromTo(slot0._camera, slot7, slot8, slot2, delay, slot5, slot9)
		slot0:SwitchCameraPos(slot0.TWEEN_TO_CHARACTER)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 83-94, warpins: 2 ---
	slot0:DispatchEvent(slot1.Event.New(slot2.CAMERA_FOCUS, slot6))

	return
	--- END OF BLOCK #3 ---



end

function slot4.ResetFocus(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-50, warpins: 1 ---
	slot0:StopShake()
	LeanTween.cancel(go(slot0._camera))
	LeanTween.cancel(go(slot0._uiCamera))
	LeanTween.move(go(slot0._camera), slot1, slot0.CAM_RESET_DURATION):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot0.UpdateCameraPositionArgs()

		return
		--- END OF BLOCK #0 ---



	end))
	slot0:DispatchEvent(slot2.Event.New(slot3.CAMERA_FOCUS_RESET, {}))

	return
	--- END OF BLOCK #0 ---



end

function slot4.GetCharacterArrowBarPosition(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot3 = slot0._arrowLeftBottomPos
	slot4 = slot0._arrowRightTopPos
	slot5 = slot0._arrowCenterPos

	if slot0._arrowLeftHorizon <= slot1.x and slot1.x < slot0._arrowRightHorizon and slot0._arrowBottomHorizon <= slot1.y and slot1.y <= slot0._arrowTopHorizon then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-22, warpins: 1 ---
		return nil
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-30, warpins: 4 ---
		slot6 = slot1.y - slot5.y
		slot7, slot8, slot9, slot10 = nil

		if slot5.x < slot1.x then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-35, warpins: 1 ---
			slot9 = slot4.x
			slot10 = slot1.x - slot5.x
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 36-39, warpins: 1 ---
			slot9 = slot3.x
			slot10 = slot5.x - slot1.x
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 40-45, warpins: 2 ---
		if slot4.y < slot6 / slot10 * slot0._arrowFieldHalfWidth then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 46-51, warpins: 1 ---
			slot9 = slot10 / slot6 * (slot4.y - slot5.y)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 52-54, warpins: 1 ---
			if slot8 < slot3.y then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 55-59, warpins: 1 ---
				slot9 = slot10 / slot6 * (slot3.y - slot5.y)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 60-61, warpins: 3 ---
		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 62-69, warpins: 1 ---
			slot2:Set(slot9, slot8, 10)

			return slot2
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 70-74, warpins: 1 ---
			return Vector3(slot9, slot8, 10)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 75-75, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

function slot4.GetCameraPoint(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._currentCameraPos()
	--- END OF BLOCK #0 ---



end

function slot4.GetArrowCenterPos(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._arrowCenterPos
	--- END OF BLOCK #0 ---



end

function slot4.GetCamera(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._camera
	--- END OF BLOCK #0 ---



end

return
