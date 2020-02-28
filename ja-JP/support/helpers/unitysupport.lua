function tf(slot0)
	return slot0.transform
end

function go(slot0)
	return tf(slot0).gameObject
end

function rtf(slot0)
	return slot0.transform
end

function findGO(slot0, slot1)
	return tf(slot0):Find(slot1) and slot2.gameObject
end

function findTF(slot0, slot1)
	return tf(slot0):Find(slot1)
end

function Instantiate(slot0)
	return Object.Instantiate(go(slot0))
end

instantiate = Instantiate

function Destroy(slot0)
	Object.Destroy(go(slot0))
end

destroy = Destroy

function SetActive(slot0, slot1)
	go(slot0):SetActive(tobool(slot1))
end

setActive = SetActive

function isActive(slot0)
	return go(slot0).activeSelf
end

function SetName(slot0, slot1)
	slot0.name = slot1
end

setName = SetName

function SetParent(slot0, slot1, slot2)
	tf(slot0):SetParent(tf(slot1), tobool(slot2))
end

setParent = SetParent

function setText(slot0, slot1)
	if not slot1 then
		return
	end

	slot0:GetComponent(typeof(Text)).text = tostring(slot1)
end

function setTextEN(slot0, slot1)
	if not slot1 then
		return
	end

	slot0:GetComponent(typeof(Text)).text = tostring(splitByWordEN(slot1, slot0))
end

function setBestFitTextEN(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot4 = slot0:GetComponent(typeof(Text))
	slot5 = slot2 or 20
	slot6 = slot0:GetComponent(typeof(RectTransform)).rect.width
	slot7 = slot0.GetComponent(typeof(RectTransform)).rect.height

	while slot5 > 0 do
		slot4.fontSize = slot5
		slot4.text = tostring(splitByWordEN(slot1, slot0))

		if slot4.preferredWidth <= slot6 and slot4.preferredHeight <= slot7 then
			break
		end

		slot5 = slot5 - 1
	end
end

function setTextFont(slot0, slot1)
	if not slot1 then
		return
	end

	slot0:GetComponent(typeof(Text)).font = slot1
end

function getText(slot0)
	return slot0:GetComponent(typeof(Text)).text
end

function setInputText(slot0, slot1)
	if not slot1 then
		return
	end

	slot0:GetComponent(typeof(InputField)).text = slot1
end

function getInputText(slot0)
	return slot0:GetComponent(typeof(InputField)).text
end

function onInputEndEdit(slot0, slot1, slot2)
	pg.DelegateInfo.Add(slot0, slot3)
	slot1:GetComponent(typeof(InputField)).onEndEdit.RemoveAllListeners(slot3)
	slot1.GetComponent(typeof(InputField)).onEndEdit:AddListener(slot2)
end

function activateInputField(slot0)
	slot0:GetComponent(typeof(InputField)):ActivateInputField()
end

function setButtonText(slot0, slot1, slot2)
	setWidgetText(slot0, slot1, slot2)
end

function setWidgetText(slot0, slot1, slot2)
	setText(findTF(slot0, slot2 or "Text"), slot1)
end

function setWidgetTextEN(slot0, slot1, slot2)
	setTextEN(findTF(slot0, slot2 or "Text"), slot1)
end

slot0 = true
slot1 = -1

function onButton(slot0, slot1, slot2, slot3, slot4)
	pg.DelegateInfo.Add(slot0, slot6)
	GetOrAddComponent(slot1, typeof(Button)).onClick.RemoveAllListeners(slot6)
	GetOrAddComponent(slot1, typeof(Button)).onClick:AddListener(function ()
		if slot0 == Time.frameCount and Input.touchCount > 1 then
			return
		end

		slot0 = Time.frameCount

		if slot1 and slot2 then
			playSoundEffect(slot1)
		end

		slot3()
	end)
end

function removeOnButton(slot0)
	if slot0:GetComponent(typeof(Button)) ~= nil then
		slot1.onClick:RemoveAllListeners()
	end
end

function setButtonEnabled(slot0, slot1)
	GetComponent(slot0, typeof(Button)).interactable = slot1
end

function setToggleEnabled(slot0, slot1)
	GetComponent(slot0, typeof(Toggle)).interactable = slot1
end

function triggerButton(slot0)
	slot1 = GetComponent(slot0, typeof(Button))
	slot0 = false

	-1.onClick:Invoke()

	slot0 = true
end

slot2 = true

function onToggle(slot0, slot1, slot2, slot3, slot4)
	GetComponent(slot1, typeof(Toggle)).onValueChanged.RemoveAllListeners(slot6)
	pg.DelegateInfo.Add(slot0, slot6)
	GetComponent(slot1, typeof(Toggle)).onValueChanged.AddListener(slot6, function (slot0)
		if slot0 then
			if slot0 and slot1 and slot2.isOn == slot0 then
				slot1 = SFX_UI_TAG

				playSoundEffect(playSoundEffect)
			elseif not slot0 and slot3 then
				playSoundEffect(slot3)
			end
		end

		slot4(slot0)
	end)

	if not IsNil(GetComponent(slot1, typeof(UIToggleEvent))) then
		slot7:Rebind()
	end
end

function triggerToggle(slot0, slot1)
	slot0 = false

	if GetComponent(slot0, typeof(Toggle)).isOn ~= slot1 then
		slot2.isOn = slot1
	else
		slot2.onValueChanged:Invoke(slot1)
	end

	slot0 = true
end

function onSlider(slot0, slot1, slot2)
	GetComponent(slot1, typeof(Slider)).onValueChanged.RemoveAllListeners(slot3)
	pg.DelegateInfo.Add(slot0, slot3)
	GetComponent(slot1, typeof(Slider)).onValueChanged:AddListener(slot2)
end

function setSlider(slot0, slot1, slot2, slot3)
	slot4 = GetComponent(slot0, typeof(Slider))
	slot4.minValue = slot1
	slot4.maxValue = slot2
	slot4.value = slot3
end

function eachChild(slot0, slot1)
	for slot7 = tf(slot0).childCount - 1, 0, -1 do
		slot1(slot2:GetChild(slot7))
	end
end

function removeAllChildren(slot0)
	eachChild(slot0, function (slot0)
		tf(slot0).transform:SetParent(nil, false)
		Destroy(slot0)
	end)
end

function scrollTo(slot0, slot1, slot2)
	Canvas.ForceUpdateCanvases()

	GetComponent(slot0, typeof(ScrollRect)).normalizedPosition = Vector2(slot1, slot2)

	GetComponent(slot0, typeof(ScrollRect)).onValueChanged:Invoke(Vector2(slot1, slot2))
end

function scrollToBottom(slot0)
	scrollTo(slot0, 0, 0)
end

function onScroll(slot0, slot1, slot2)
	GetComponent(slot1, typeof(ScrollRect)).onValueChanged.RemoveAllListeners(slot3)
	pg.DelegateInfo.Add(slot0, slot3)
	GetComponent(slot1, typeof(ScrollRect)).onValueChanged:AddListener(slot2)
end

function ClearEventTrigger(slot0)
	slot0:RemovePointClickFunc()
	slot0:RemovePointDownFunc()
	slot0:RemovePointEnterFunc()
	slot0:RemovePointExitFunc()
	slot0:RemovePointUpFunc()
	slot0:RemoveCheckDragFunc()
	slot0:RemoveBeginDragFunc()
	slot0:RemoveDragFunc()
	slot0:RemoveDragEndFunc()
	slot0:RemoveDropFunc()
	slot0:RemoveScrollFunc()
	slot0:RemoveSelectFunc()
	slot0:RemoveUpdateSelectFunc()
	slot0:RemoveMoveFunc()
end

function GetComponent(slot0, slot1)
	return slot0:GetComponent(slot1)
end

function GetOrAddComponent(slot0, slot1)
	slot2 = slot1

	if type(slot1) == "string" then
		slot2 = typeof(_G[slot1])
	end

	if slot0:GetComponent(slot2) ~= nil then
		return slot3
	else
		return go(slot0):AddComponent(slot2)
	end
end

function RemoveComponent(slot0, slot1)
	if slot0:GetComponent(slot1) then
		Object.Destroy(slot2)
	end
end

function GetInChildren(slot0, slot1)
	return 
	-- Decompilation error in this vicinity:
	function (slot0, slot1)
		if not slot0 then
			return nil
		end

		if slot0.name == slot1 then
			return slot0
		end

		for slot5 = 0, slot0.childCount - 1, 1 do
			if slot1 == slot0:GetChild(slot5).name then
				return slot6
			end

			if slot0(slot6, slot1) then
				return slot7
			end
		end

		return nil
	end(slot0, slot1)
end

function onNextTick(slot0)
	Timer.New(slot0, 0.001, 1):Start()
end

function onDelayTick(slot0, slot1)
	Timer.New(slot0, slot1, 1):Start()
end

function seriesAsync(slot0, slot1)
	slot2 = 0
	slot3 = #slot0
	slot4 = nil


	-- Decompilation error in this vicinity:
	function (...)
		if slot0 + 1 <= slot1 then
			slot2[](slot3, ...)
		elseif slot4 then
			slot4()
		end
	end()
end

function parallelAsync(slot0, slot1)
	if #slot0 == 0 then
		slot1()

		return
	end

	function slot3()
		if slot0 - 1 == 0 then
			slot1()
		end
	end

	for slot7, slot8 in ipairs(slot0) do
		slot8(slot3)
	end
end

function limitedParallelAsync(slot0, slot1, slot2)
	if #slot0 == 0 then
		slot2()

		return
	end

	function slot6()
		if slot0 - 1 == 0 then
			slot1()
		elseif slot2 + 1 <= slot3 then
			slot4[slot2](slot5)
		end
	end

	for slot10 = 1, math.min(slot1, slot3), 1 do
		slot0[slot10](slot6)
	end
end

function setImageSprite(slot0, slot1, slot2)
	if IsNil(slot0) or IsNil(slot1) then
		return
	end

	if IsNil(GetComponent(slot0, typeof(Image))) then
		return
	end

	slot3.sprite = slot1

	if slot2 then
		slot3:SetNativeSize()
	end
end

function clearImageSprite(slot0)
	GetComponent(slot0, typeof(Image)).sprite = nil
end

function getImageSprite(slot0)
	return GetComponent(slot0, typeof(Image)) and slot1.sprite
end

function tex2sprite(slot0)
	return UnityEngine.Sprite.Create(slot0, UnityEngine.Rect.New(0, 0, slot0.width, slot0.height), Vector2(0.5, 0.5), 100)
end

function setFillAmount(slot0, slot1)
	GetComponent(slot0, typeof(Image)).fillAmount = slot1
end

function string2vector3(slot0)
	slot1 = string.split(slot0, ",")

	return Vector3(slot1[1], slot1[2], slot1[3])
end

function getToggleState(slot0)
	return slot0:GetComponent(typeof(Toggle)).isOn
end

function setLocalPosition(slot0, slot1)
	slot1.x = slot1.x or tf(slot0).localPosition.x
	slot1.y = slot1.y or tf(slot0).localPosition.y
	slot1.z = slot1.z or tf(slot0).localPosition.z
	tf(slot0).localPosition = slot1
end

function setAnchoredPosition(slot0, slot1)
	slot1.x = slot1.x or rtf(slot0).anchoredPosition.x
	slot1.y = slot1.y or rtf(slot0).anchoredPosition.y
	slot2.anchoredPosition = slot1
end

function getAnchoredPosition(slot0)
	return rtf(slot0).anchoredPosition
end

function setLocalScale(slot0, slot1)
	slot1.x = slot1.x or tf(slot0).localScale.x
	slot1.y = slot1.y or tf(slot0).localScale.y
	slot1.z = slot1.z or tf(slot0).localScale.z
	tf(slot0).localScale = slot1
end

function setLocalRotation(slot0, slot1)
	slot1.x = slot1.x or tf(slot0).localRotation.x
	slot1.y = slot1.y or tf(slot0).localRotation.y
	slot1.z = slot1.z or tf(slot0).localRotation.z
	tf(slot0).localRotation = slot1
end

function ActivateInputField(slot0)
	GetComponent(slot0, typeof(InputField)):ActivateInputField()
end

function onInputChanged(slot0, slot1, slot2)
	GetComponent(slot1, typeof(InputField)).onValueChanged.RemoveAllListeners(slot3)
	pg.DelegateInfo.Add(slot0, slot3)
	GetComponent(slot1, typeof(InputField)).onValueChanged:AddListener(slot2)
end

function getImageColor(slot0)
	return GetComponent(slot0, typeof(Image)).color
end

function setImageColor(slot0, slot1)
	GetComponent(slot0, typeof(Image)).color = slot1
end

function getImageAlpha(slot0)
	return GetComponent(slot0, typeof(Image)).color.a
end

function setImageAlpha(slot0, slot1)
	GetComponent(slot0, typeof(Image)).color.a = slot1
	GetComponent(slot0, typeof(Image)).color = GetComponent(slot0, typeof(Image)).color
end

function getImageAlpha(slot0)
	return GetComponent(slot0, typeof(Image)).color.a
end

function getTextColor(slot0)
	return GetComponent(slot0, typeof(Text)).color
end

function setTextColor(slot0, slot1)
	GetComponent(slot0, typeof(Text)).color = slot1
end

function getTextAlpha(slot0)
	return GetComponent(slot0, typeof(Text)).color.a
end

function setTextAlpha(slot0, slot1)
	GetComponent(slot0, typeof(Text)).color.a = slot1
	GetComponent(slot0, typeof(Text)).color = GetComponent(slot0, typeof(Text)).color
end

function getOutlineColor(slot0)
	return GetComponent(slot0, typeof(Outline)).effectColor
end

function setOutlineColor(slot0, slot1)
	GetComponent(slot0, typeof(Outline)).effectColor = slot1
end

function pressPersistTrigger(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot6 = defaultValue(slot6, 0.25)
	slot8 = GetOrAddComponent(slot0, typeof(EventTriggerListener))
	slot9 = nil

	function slot10()
		if slot0 then
			slot0:Stop()

			slot0 = nil
		end
	end

	slot8:AddPointDownFunc(function ()
		slot0()
		Timer.New(function ()
			if slot0 then
				slot1.duration - slot2 / 10.duration = math.max(slot1.duration - slot2 / 10, slot3)
			end

			if slot4 then
				slot4(slot5)
			end
		end, slot3, -1):Start()

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-19, warpins: 1 ---
			slot1.func()
			--- END OF BLOCK #0 ---



		end

		if slot7 and slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-28, warpins: 1 ---
			playSoundEffect(slot7)
			--- END OF BLOCK #0 ---



		end
	end)
	slot8:AddPointUpFunc(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0()

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-7, warpins: 1 ---
			slot1()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-8, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)
	slot8:AddPointExitFunc(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0()

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-7, warpins: 1 ---
			slot1()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-8, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	return slot8
end

function getSpritePivot(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	return Vector2(-slot0.bounds.center.x / slot0.bounds.extents.x / 2 + 0.5, -slot0.bounds.center.y / slot0.bounds.extents.y / 2 + 0.5)
	--- END OF BLOCK #0 ---



end

function resetAspectRatio(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	GetComponent(slot0, "AspectRatioFitter").aspectRatio = GetComponent(slot0, "Image").preferredWidth / GetComponent(slot0, "Image").preferredHeight

	return
	--- END OF BLOCK #0 ---



end

function cloneTplTo(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	slot3 = tf(Instantiate(slot0))

	slot3:SetParent(tf(slot1), false)
	SetActive(slot3, true)

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-19, warpins: 1 ---
		slot3.name = slot2
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-20, warpins: 2 ---
	return slot3
	--- END OF BLOCK #1 ---



end

function setGray(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	GetOrAddComponent(slot0, "UIGrayScale").recursive = (slot2 ~= nil and slot2) or true
	GetOrAddComponent(slot0, "UIGrayScale").enabled = slot1

	return
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-12, warpins: 2 ---
	--- END OF BLOCK #1 ---



end

function long2int(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1, slot2 = int64.tonum2(slot0)

	return slot1
	--- END OF BLOCK #0 ---



end

function addSlip(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	slot4 = GetOrAddComponent(slot1, "EventTriggerListener")
	slot5 = nil
	slot6 = 0
	slot7 = 50

	slot4:AddBeginDragFunc(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot0 = 0
		slot1 = nil

		return
		--- END OF BLOCK #0 ---



	end)
	slot4:AddDragFunc(function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot2 = slot1.position

		if not slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			slot0 = slot2
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-9, warpins: 2 ---
		if slot1 == SLIP_TYPE_HRZ then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-15, warpins: 1 ---
			slot2 = slot2.x - slot0.x
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-19, warpins: 1 ---
			if slot1 == SLIP_TYPE_VERT then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 20-24, warpins: 1 ---
				slot2 = slot2.y - slot0.y
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 25-25, warpins: 3 ---
		return
		--- END OF BLOCK #2 ---



	end)
	slot4:AddDragEndFunc(function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		if slot0 < -slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-8, warpins: 1 ---
			if slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-11, warpins: 1 ---
				slot2()
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-15, warpins: 1 ---
			if slot1 < slot0 and slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 19-20, warpins: 1 ---
				slot3()
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-21, warpins: 5 ---
		return
		--- END OF BLOCK #1 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

return
