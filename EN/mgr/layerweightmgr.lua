pg = pg or {}
pg.LayerWeightMgr = singletonClass("LayerWeightMgr")
pg.LayerWeightMgr.DEBUG = false
pg.LayerWeightMgr.ADAPT_TAG = "(Adapt)"
pg.LayerWeightMgr.RECYCLE_ADAPT_TAG = "recycleAdapt"

function pg.LayerWeightMgr.Init(slot0, slot1)
	slot0.baseParent = tf(GameObject.Find("UICamera/Canvas"))
	slot0.uiOrigin = tf(instantiate(slot2))
	slot0.uiOrigin.name = "UIOrigin"

	slot0.uiOrigin:SetParent(slot0.baseParent, false)

	GetOrAddComponent(slot0.uiOrigin, typeof(CanvasGroup)).interactable = false
	GetOrAddComponent(slot0.uiOrigin, typeof(CanvasGroup)).blocksRaycasts = false
	GetOrAddComponent(slot0.uiOrigin, typeof(Canvas)).overrideSorting = true
	GetOrAddComponent(slot0.uiOrigin, typeof(Canvas)).sortingOrder = 200
	slot0.lvCameraTf = tf(GameObject.Find("LevelCamera"))
	slot0.lvParent = tf(GameObject.Find("LevelCamera/Canvas"))
	slot0.lvCamera = GetOrAddComponent(slot0.lvCameraTf, typeof(Camera))
	slot0.adaptPool = {}
	slot0.UIMain = rtf(GameObject.Find("UICamera/Canvas/UIMain"))
	slot0.OverlayMain = rtf(GameObject.Find("OverlayCamera/Overlay/UIMain"))
	slot0.OverlayAdapt = rtf(GameObject.Find("OverlayCamera/Overlay/UIAdapt"))
	slot0.storeUIs = {}

	if slot1 ~= nil then
		slot1()
	end
end

function pg.LayerWeightMgr.Add2Overlay(slot0, slot1, slot2, slot3)
	slot3.type = slot1
	slot3.ui = slot2
	slot3.pbList = slot3.pbList or {}
	slot3.weight = slot3.weight or LayerWeightConst.BASE_LAYER
	slot3.overlayType = slot3.overlayType or LayerWeightConst.OVERLAY_UI_MAIN

	if slot2.gameObject.name == "ResPanel(Clone)" then
		return
	end

	if (slot1 == LayerWeightConst.UI_TYPE_SYSTEM and #slot0.storeUIs > 0) or slot1 == LayerWeightConst.UI_TYPE_SUB then
		slot0:Log("ui：" .. slot2.gameObject.name .. " 加入了ui层级管理, weight:" .. slot3.weight)
		slot0:DelList(slot2)
		table.insert(slot0.storeUIs, slot3)
		slot0:LayerSortHandler()
	end
end

function pg.LayerWeightMgr.DelFromOverlay(slot0, slot1, slot2)
	if slot1.gameObject.name == "ResPanel(Clone)" then
		return
	end

	slot0:Log("ui：" .. slot1.gameObject.name .. " 去除了ui层级管理")

	if slot0:DelList(slot1) ~= nil then
		slot0:CheckRecycleAdaptObj(slot3.ui, slot2)

		if slot3.pbList ~= nil then
			slot0.UIMgr.GetInstance():RevertPBMaterial(slot3.pbList)
			slot0.UIMgr.GetInstance():ShutdownPartialBlur()
		end
	end

	slot0:LayerSortHandler()
end

function pg.LayerWeightMgr.DelList(slot0, slot1)
	slot2 = nil

	for slot6 = #slot0.storeUIs, 1, -1 do
		if slot0.storeUIs[slot6].ui == slot1 then
			slot2 = slot0.storeUIs[slot6]

			table.remove(slot0.storeUIs, slot6)

			break
		end
	end

	return slot2
end

function pg.LayerWeightMgr.LayerSortHandler(slot0)
	slot0:switchOriginParent()
	slot0:SortStoreUIs()

	slot1 = false
	slot2 = false
	slot3 = {}
	slot4 = nil
	slot5 = false
	slot6 = false
	slot7 = 0
	slot8 = 0

	for slot12 = #slot0.storeUIs, 1, -1 do
		slot14 = slot0.storeUIs[slot12].type
		slot15 = slot0.storeUIs[slot12].ui
		slot16 = slot0.storeUIs[slot12].pbList
		slot17 = slot0.storeUIs[slot12].globalBlur
		slot18 = slot0.storeUIs[slot12].groupName
		slot19 = slot0.storeUIs[slot12].overlayType
		slot20 = slot0.storeUIs[slot12].blurLevelCamera
		slot21 = slot0.storeUIs[slot12].hideLowerLayer
		slot22 = slot12 == #slot0.storeUIs

		if slot14 == LayerWeightConst.UI_TYPE_SYSTEM then
			slot1 = true
		end

		if slot22 then
			if slot18 ~= nil then
				slot4 = slot18
			end

			slot5 = slot17
			slot6 = slot20
		end

		function slot23()
			slot0:ShowOrHideTF(slot0, true)
			slot0.ShowOrHideTF:SetToOverlayParent(slot0.ShowOrHideTF, , )

			if not slot0.ShowOrHideTF and #slot5 > 0 then
				table.insertto(slot6, slot5)
			end
		end

		if slot14 == LayerWeightConst.UI_TYPE_SUB then
			if slot22 then
				slot23()
			elseif slot4 ~= nil and slot4 == slot18 then
				slot23()
			else
				slot0:SetToOrigin(slot15, slot8)

				if slot1 or slot2 then
					slot0:ShowOrHideTF(slot15, false)
				else
					slot0:ShowOrHideTF(slot15, true)

					if #slot16 > 0 then
						slot0.UIMgr.GetInstance():RevertPBMaterial(slot16)
					end
				end
			end
		end

		if slot21 then
			slot2 = true
		end
	end

	if #slot3 > 0 then
		slot0.UIMgr.GetInstance():PartialBlurTfs(slot3)
	else
		slot0.UIMgr.GetInstance():ShutdownPartialBlur()
	end

	if slot6 then
		slot0.UIMgr.GetInstance():BlurCamera(slot0.UIMgr.CameraLevel)
	else
		slot0.UIMgr.GetInstance():UnblurCamera(slot0.UIMgr.CameraLevel)
	end
end

function pg.LayerWeightMgr.SetToOverlayParent(slot0, slot1, slot2, slot3)
	slot4 = nil

	if slot2 == LayerWeightConst.OVERLAY_UI_ADAPT then
		if slot0:GetAdaptObjFromUI(slot1) ~= nil then
			SetParent(slot1.parent, slot0.OverlayMain, false)
		else
			slot0:GetAdaptObj().name = slot0:GetAdatpObjName(slot1)

			SetParent(slot1, slot0.GetAdaptObj(), false)
		end
	else
		SetParent(slot1, slot0.OverlayMain, false)
	end

	if slot3 ~= nil then
		slot4:SetSiblingIndex(slot3)
	end
end

function pg.LayerWeightMgr.SetToOrigin(slot0, slot1, slot2)
	SetParent((slot0:GetAdaptObjFromUI(slot1) == nil or slot1.parent) and slot1, slot0.uiOrigin, false)

	if slot2 ~= nil then
		slot3:SetSiblingIndex(slot2)
	end
end

function pg.LayerWeightMgr.SortStoreUIs(slot0)
	slot0:Log("-----------------------------------------")

	slot2 = {}

	for slot6, slot7 in ipairs(slot1) do
		for slot11, slot12 in ipairs(slot0.storeUIs) do
			if slot7 == slot12.weight then
				table.insert(slot2, slot12)
				slot0:Log(slot12.ui.gameObject.name .. "   globalBlur:" .. tostring(slot12.globalBlur))
			end
		end
	end

	slot0.storeUIs = slot2

	slot0:Log("-----------------------------------------")
end

function pg.LayerWeightMgr.ShowOrHideTF(slot0, slot1, slot2)
	GetOrAddComponent(slot1, typeof(CanvasGroup)).alpha = (slot2 and 1) or 0
end

function pg.LayerWeightMgr.switchOriginParent(slot0)
	if slot0.lvCamera.enabled then
		slot0.uiOrigin:SetParent(slot0.lvParent, false)
	else
		slot0.uiOrigin:SetParent(slot0.baseParent, false)
	end
end

function pg.LayerWeightMgr.GetAdaptObj(slot0)
	slot1 = nil

	if #slot0.adaptPool > 0 then
		slot1 = table.remove(slot0.adaptPool, #slot0.adaptPool)
	else
		slot2 = GameObject.New()

		slot2:AddComponent(typeof(NotchAdapt))

		slot1 = slot2:AddComponent(typeof(RectTransform))
	end

	SetParent(slot1, slot0.OverlayMain, false)

	slot1.anchorMin = Vector2.zero
	slot1.anchorMax = Vector2.one
	slot1.pivot = Vector2(0.5, 0.5)
	slot1.offsetMax = Vector2.zero
	slot1.offsetMin = Vector2.zero
	slot1.localPosition = Vector3.zero

	SetActive(slot1, true)
	slot0:ShowOrHideTF(slot1, true)

	return slot1
end

function pg.LayerWeightMgr.CheckRecycleAdaptObj(slot0, slot1, slot2)
	slot3 = slot0:GetAdaptObjFromUI(slot1)

	if slot2 ~= nil then
		SetParent(slot1, slot2, false)
	end

	if slot3 ~= nil then
		if #slot0.adaptPool < 4 then
			table.insert(slot0.adaptPool, slot3)
			SetParent(slot3, slot0.OverlayAdapt, false)

			slot3.name = slot0.RECYCLE_ADAPT_TAG

			SetActive(slot3, false)
		else
			Destory(slot3)
		end
	end
end

function pg.LayerWeightMgr.GetAdaptObjFromUI(slot0, slot1)
	if slot1.parent ~= nil and slot1.parent.name == slot0:GetAdatpObjName(slot1) then
		return slot1.parent
	end

	return nil
end

function pg.LayerWeightMgr.GetAdatpObjName(slot0, slot1)
	return slot1.name .. slot0.ADAPT_TAG
end

function pg.LayerWeightMgr.Log(slot0, slot1)
	if not slot0.DEBUG then
		return
	end

	print(slot1)
end

return
