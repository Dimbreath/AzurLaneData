slot0 = class("BackYardFurnitureFactory")
slot1 = require("Mod/BackYard/view/BackYardTool")

function slot0.Ctor(slot0, slot1)
	slot0.poolMgr = slot1
end

function slot0.Make(slot0, slot1, slot2)
	slot3 = slot0.poolMgr:Dequeue(BackyardPoolMgr.POOL_NAME.FURNITURE)

	function slot4(slot0)
		slot2 = slot0:isFloor()

		for slot6, slot7 in ipairs(slot1) do
			SetParent(slot9, slot2:Find("grids"))
			setActive(slot1.poolMgr:Dequeue((slot2 and BackyardPoolMgr.POOL_NAME.GRID) or BackyardPoolMgr.POOL_NAME.WALL), false)
		end

		slot2.sizeDelta = Vector2(slot0.rect.width, slot0.rect.height)

		slot2(slot2)
	end

	if not slot1:isSpine() then
		slot0:loadImageFurniture(slot1, slot3, slot4)
	else
		slot0:loadSpineFurnitureModel(slot1, slot3, slot4)
	end
end

function slot0.loadImageFurniture(slot0, slot1, slot2, slot3)
	GetSpriteFromAtlasAsync("furniture/" .. slot1:GetPicture(), "", function (slot0)
		if slot0.isExist then
			if slot1 then
				slot1()
			end

			return
		end

		slot2.pivot = getSpritePivot(slot0)

		setImageSprite(slot1, slot0, true)

		slot2 = {}

		if slot0:hasInterActionMask() then
			table.insert(slot2, function (slot0)
				slot0:loadFurnituresMasks(slot0.loadFurnituresMasks, slot0, slot0)
			end)
		end

		if slot4:isArch() then
			table.insert(slot2, function (slot0)
				slot0:loadArchMask(slot0.loadArchMask, slot0, slot0)
			end)
		end

		seriesAsync(slot2, function ()
			slot0(slot1)
		end)
	end)
end

function slot0.loadArchMask(slot0, slot1, slot2, slot3)
	ResourceMgr.Inst:getAssetAsync("furniture/" .. slot4, "", typeof(Sprite), UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
		if slot0.isExist then
			if slot1 then
				slot1()
			end

			return
		end

		slot1 = slot2.createImage(BackYardConst.ARCH_MASK_NAME, false, , 2, true)

		setActive(slot1, false)
		setImageSprite(slot1, slot0, true)

		if slot1 then
			slot1()
		end
	end), true, true)
end

function slot0.loadFurnituresMasks(slot0, slot1, slot2, slot3)
	slot5 = {}

	for slot9, slot10 in pairs(slot4) do
		table.insert(slot5, function (slot0)
			ResourceMgr.Inst:getAssetAsync("furniture/" .. slot0, "", typeof(Sprite), UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
				if slot0.isExist then
					if slot1 then
						slot1()
					end

					return
				end

				setActive(slot1, false)
				setImageSprite(slot2.createImage(BackYardConst.FURNITRUE_MASK_ORDER_NAME .. slot3, false, slot4, 2, true), slot0, true)
				true()
			end), true, true)
		end)
	end

	seriesAsync(slot5, function ()
		if slot0 then
			slot0()
		end
	end)
end

function slot0.loadSpineFurnitureModel(slot0, slot1, slot2, slot3)
	slot8, slot5 = slot1:getSpineName()

	LoadAndInstantiateAsync("sfurniture", slot4, function (slot0)
		if slot0.isExist then
			if slot1 then
				slot1()
			end

			return
		end

		slot2.pivot = rtf(slot0).pivot

		slot3(slot1, "icon", 1, function (slot0, slot1, slot2, slot3)
			slot0.gameObject.name = slot1
			slot0.anchorMax = Vector2(slot0.x, slot0.y)
			slot0.anchorMin = Vector2(slot0.x, slot0.y)

			SetParent(slot0.gameObject, slot1)

			slot0.localPosition = Vector3(0, 0, 0)

			slot0:SetSiblingIndex(slot2)

			if slot3 then
				GetOrAddComponent(slot4, "SpineAnimUI"):SetAction(slot3, 0)
			end
		end)

		if slot3:hasSpineMask() then
			slot8, slot5 = slot4:getSpineMaskName()

			LoadAndInstantiateAsync("sfurniture", slot4, function (slot0)
				if slot0.isExist then
					if slot1 then
						slot1()
					end

					return
				end

				setActive(slot0, false)
				slot0(rtf(slot0), BackYardConst.FURNITRUE_MASK_NAME, 2)
				slot0:loadSpineAnimator(BackYardConst.FURNITRUE_MASK_NAME, 2, function ()
					slot0(slot1)
				end)
			end, true, true)
		else
			slot0:loadSpineAnimator(slot0.loadSpineAnimator, slot2, function ()
				slot0(slot1)
			end)
		end
	end, true, true)
end

function slot0.loadSpineAnimator(slot0, slot1, slot2, slot3)
	if slot1:hasAnimator() then
		slot4 = {}

		for slot9 = 1, slot1:getSpineMaxCnt(), 1 do
			for slot14, slot15 in ipairs(slot10) do
				table.insert(slot4, function (slot0)
					LoadAndInstantiateAsync("sfurniture", slot0, function (slot0)
						if slot0.isExist then
							if slot1 then
								slot1()
							end

							return
						end

						go(slot0).name = slot2:getAnimtorControlGoName(slot3 - 1, slot4)

						setActive(slot0, false)
						SetParent(slot0, slot5)
						slot6()
					end)
				end)
			end
		end

		parallelAsync(slot4, function ()
			if slot0 then
				slot0()
			end
		end)
	elseif slot3 then
		slot3()
	end
end

function slot0.MakeBoat(slot0, slot1, slot2)
	PoolMgr.GetInstance():GetSpineChar(slot1:getPrefab(), true, function (slot0)
		if not slot0.isExist then
			slot0.name = "model"
			rtf(slot0).sizeDelta = Vector2.New(200, 500)
			slot1 = GameObject("char_" .. slot1.id)

			slot1:AddComponent(typeof(RectTransform))
			SetParent(slot0, slot1)
			parallelAsync({
				function (slot0)
					slot0:LoadBoatEffect(slot0.LoadBoatEffect, slot0, slot0)
				end,
				function (slot0)
					slot0:LoadBoatPart(slot0.LoadBoatPart, slot0, slot0)
				end,
				function (slot0)
					slot0:LoadBoatMask(slot0.LoadBoatMask, slot0, slot0)
				end
			}, function ()
				slot0(slot1)
			end)
		end
	end)
end

function slot0.LoadBoatMask(slot0, slot1, slot2, slot3)
	LoadAndInstantiateAsync("sfurniture", "modelmask", function (slot0)
		if slot0.isExist then
			return
		end

		slot0.name = "bodyMask"

		SetParent(slot0, SetParent)
		tf(slot0):SetSiblingIndex(0)
		SetActive(slot0, false)
		slot0()
	end, true, true)
end

function slot0.LoadBoatEffect(slot0, slot1, slot2, slot3)
	slot5 = {}

	SetParent(slot6, slot1)

	for slot10, slot11 in pairs(slot4) do
		if slot11.attachment_cusual[1] ~= "" then
			table.insert(slot5, function (slot0)
				ResourceMgr.Inst:getAssetAsync("Effect/" .. slot0, slot0, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
					if not slot0.isExist then
						slot1 = Object.Instantiate(slot0)

						tf(slot1):SetParent(tf(slot1))

						tf(slot1).localPosition = BuildVector3(slot2.attachment_cusual[2])
					end

					slot3()
				end), true, true)
			end)
		end
	end

	parallelAsync(slot5, slot3)
end

function slot0.LoadBoatPart(slot0, slot1, slot2, slot3)
	slot4 = {
		{
			"addition",
			Vector3(0, 250, 0),
			Vector3(1, 1, 1)
		},
		{
			"chat",
			Vector3(145, 290, 0),
			Vector3(0, 0, 0)
		},
		{
			"click",
			Vector3(0, 130, 0),
			Vector3(1, 1, 1)
		},
		{
			"intimacy",
			Vector3(145, 290, 0),
			Vector3(2, 2, 2)
		},
		{
			"money",
			Vector3(145, 290, 0),
			Vector3(2, 2, 2)
		},
		{
			"shadow",
			Vector3(0, 0, 0),
			Vector3(1, 1, 1)
		}
	}

	PoolMgr.GetInstance():GetUI("backyardresui", true, function (slot0)
		slot1 = tf(slot0)

		for slot5, slot6 in ipairs(slot0) do
			slot7 = cloneTplTo(slot1:Find(slot6[1]), slot1)
			slot7.gameObject.name = slot6[1]
			slot7.localPosition = slot6[2]
			slot7.localScale = slot6[3]
		end

		PoolMgr.GetInstance():ReturnUI("backyardresui", slot0)
		PoolMgr.GetInstance().ReturnUI()
	end)
end

function slot0.Destroy(slot0)
	slot0.isExist = true
end

return slot0
