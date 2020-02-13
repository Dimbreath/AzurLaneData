
-- Decompilation error in this vicinity:
--- BLOCK #0 1-3, warpins: 1 ---
slot0 = ys or {}
ys = ys or 
ys.Battle.BattleVariable = ys.Battle.BattleVariable or {}
slot2 = ys or .Battle.BattleConfig

ys or .Battle.BattleVariable.Init = function ()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	slot0.speedRatioByIFF = {
		[0] = 1,
		1,
		[-1.0] = 1
	}
	slot0.focusExemptList = {}
	slot0.MapSpeedRatio = 1
	slot0.MapSpeedFacotrList = {}
	slot0.IFFFactorList = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-26, warpins: 0 ---
	for slot3, slot4 in pairs(slot0.speedRatioByIFF) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-24, warpins: 1 ---
		slot0.IFFFactorList[slot3] = {}
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-26, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-40, warpins: 1 ---
	slot0._lastCameraPos = nil

	if CameraUtil.AspectRatio <= UnityEngine.Screen.width / UnityEngine.Screen.height then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-64, warpins: 1 ---
		slot0._actualWidth = slot1 * slot2
		slot0._actualHeight = slot1
		slot0._leftBottomVector = Vector3(slot4, 0, 0)
		slot0._rightTopVector = Vector3(slot0 - (slot0 - slot0._actualWidth) * 0.5, slot1, 0)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 65-87, warpins: 1 ---
		slot0._actualWidth = slot0
		slot0._actualHeight = slot0 / slot2
		slot0._leftBottomVector = Vector3(0, slot4, 0)
		slot0._rightTopVector = Vector3(slot0, slot1 - (slot1 - slot0._actualHeight) * 0.5, 0)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 88-163, warpins: 2 ---
	slot0._camera = GameObject.Find("MainCamera"):GetComponent(typeof(Camera))
	slot0._cameraTF = slot0._camera.transform
	slot0._uiCamera = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
	slot0._camera_radian_x_sin = math.sin(slot4)
	slot0._camera_radian_x_cos = math.cos(slot4)
	slot0._camera_radian_x_tan = slot0._camera_radian_x_sin / slot0._camera_radian_x_cos
	slot0.CameraNormalHeight = slot0._camera_radian_x_cos * slot1.CAMERA_SIZE + slot1.CAMERA_BASE_HEIGH
	slot0.CameraFocusHeight = slot0._camera_radian_x_cos * slot1.CAST_CAM_ZOOM_SIZE + slot1.CAMERA_BASE_HEIGH

	return
	--- END OF BLOCK #3 ---



end

ys or .Battle.BattleVariable.Clear = function ()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-49, warpins: 1 ---
	slot0.speedRatioByIFF = nil
	slot0.focusExemptList = nil
	slot0.MapSpeedRatio = nil
	slot0.MapSpeedFacotrList = nil
	slot0.IFFFactorList = nil
	slot0._lastCameraPos = nil
	slot0._leftBottomVector = nil
	slot0._rightTopVector = nil
	slot0._camera = nil
	slot0._cameraTF = nil
	slot0._uiCamera = nil
	slot0._camera_radian_x_sin = nil
	slot0._camera_radian_x_cos = nil
	slot0._camera_radian_x_tan = nil
	slot0.CameraNormalHeight = nil
	slot0.CameraFocusHeight = nil

	return
	--- END OF BLOCK #0 ---



end

slot3 = 0
slot4 = 0
slot5 = 0
slot6 = 0
slot7 = 0
slot8 = 0

ys or .Battle.BattleVariable.UpdateCameraPositionArgs = function ()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot1 = slot0._camera.orthographicSize

	if slot0._lastCameraPos == slot0._cameraTF.position and slot0._lastCameraSize == slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-16, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-20, warpins: 2 ---
		slot0._lastCameraPos = slot0
		slot0._lastCameraSize = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-80, warpins: 2 ---
	slot1 = slot0._camera:ScreenToWorldPoint(slot0._leftBottomVector).x
	slot6 = (slot0._uiCamera:ScreenToWorldPoint(slot0._leftBottomVector).x.y * 0.866 + slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x.z * 0.5.y.y - slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x.y * 0.866 + slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x.z * 0.5.y) / (((slot0._uiCamera:ScreenToWorldPoint(slot0._rightTopVector).x - slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x) / (slot0._camera:ScreenToWorldPoint(slot0._rightTopVector).x - slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x.x).y * 0.866 + (slot0._uiCamera.ScreenToWorldPoint(slot0._rightTopVector).x - slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x) / (slot0._camera.ScreenToWorldPoint(slot0._rightTopVector).x - slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x.x).z * 0.5) - (slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x.y * 0.866 + slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x.z * 0.5))

	return
	--- END OF BLOCK #1 ---



end

ys or .Battle.BattleVariable.CameraPosToUICamera = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0:CameraPosToUICameraByRef()

	return slot0
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleVariable.CameraPosToUICameraByRef = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	slot0.x = (slot0.x - slot0) * () + slot0.x - slot0
	slot0.y = ((slot0.y * 0.866 + slot0.z * 0.5) - slot0.z * 0.5) * slot4 + slot5
	slot0.z = 0

	return
	--- END OF BLOCK #0 ---



end

ys or .Battle.BattleVariable.AppendMapFactor = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if slot0.MapSpeedFacotrList[slot0] ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-9, warpins: 1 ---
		slot0:RemoveMapFactor()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-18, warpins: 2 ---
	slot0.MapSpeedRatio = slot0.MapSpeedRatio * slot1
	slot0.MapSpeedFacotrList[slot0] = slot1

	return
	--- END OF BLOCK #1 ---



end

ys or .Battle.BattleVariable.RemoveMapFactor = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if slot0.MapSpeedFacotrList[slot0] ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-14, warpins: 1 ---
		slot0.MapSpeedRatio = slot0.MapSpeedRatio / slot1
		slot0.MapSpeedFacotrList[slot0] = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-15, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

ys or .Battle.BattleVariable.AppendIFFFactor = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	if slot0.IFFFactorList[slot0][slot1] ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-11, warpins: 1 ---
		slot0:RemoveIFFFactor(slot1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-23, warpins: 2 ---
	slot0.speedRatioByIFF[slot0] = slot0.speedRatioByIFF[slot0] * slot2
	slot3[slot1] = slot2
	slot0.focusExemptList = {}

	return
	--- END OF BLOCK #1 ---



end

ys or .Battle.BattleVariable.RemoveIFFFactor = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	if slot0.IFFFactorList[slot0][slot1] ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-18, warpins: 1 ---
		slot0.speedRatioByIFF[slot0] = slot0.speedRatioByIFF[slot0] / slot3
		slot2[slot1] = nil
		slot0.focusExemptList = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

ys or .Battle.BattleVariable.GetSpeedRatio = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if not slot0.focusExemptList[slot0] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-8, warpins: 1 ---
		slot2 = slot0.speedRatioByIFF[slot1]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-9, warpins: 2 ---
	return slot2
	--- END OF BLOCK #1 ---



end

ys or .Battle.BattleVariable.AddExempt = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	if slot0.IFFFactorList[slot1][slot2] ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-13, warpins: 1 ---
		slot0.focusExemptList[slot0] = slot0.speedRatioByIFF[slot1] / slot4
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-14, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

return

--- END OF BLOCK #0 ---

FLOW; TARGET BLOCK #2



-- Decompilation error in this vicinity:
--- BLOCK #1 4-4, warpins: 1 ---
slot0 = 
--- END OF BLOCK #1 ---

FLOW; TARGET BLOCK #2



-- Decompilation error in this vicinity:
--- BLOCK #2 5-11, warpins: 2 ---
--- END OF BLOCK #2 ---

FLOW; TARGET BLOCK #4



-- Decompilation error in this vicinity:
--- BLOCK #3 12-12, warpins: 1 ---
slot2 = 
--- END OF BLOCK #3 ---

FLOW; TARGET BLOCK #4



-- Decompilation error in this vicinity:
--- BLOCK #4 13-47, warpins: 2 ---
--- END OF BLOCK #4 ---



