ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = class("BattleDropsView")
ys.Battle.BattleDropsView = slot2
slot2.__name = "BattleDropsView"
slot2.FLOAT_DURATION = 0.4

function slot2.Ctor(slot0, slot1, slot2)
	slot0._go = slot1
	slot0._tf = slot1.transform
	slot0._container = slot2
	slot0._containerTF = slot0._container.transform

	slot0:init()
end

function slot2.SetActive(slot0, slot1)
	setActive(slot0._go, slot1)
end

function slot2.AddCamera(slot0, slot1, slot2)
	slot0._camera = slot1
	slot0._uiCamera = slot2
	slot0._cameraTF = slot0._camera.transform
	slot0._cameraSrcX = slot0._cameraTF.localPosition.x
	slot0._cameraSrcZ = slot0._cameraTF.localPosition.z
	slot0._cameraXRotate = slot0._cameraTF.localEulerAngles.x
end

function slot2.RefreshScaleRate(slot0)
	slot0._xScale = UnityEngine.Screen.width / slot0._camera:ScreenToWorldPoint(Vector3(UnityEngine.Screen.width, UnityEngine.Screen.height, 0)).x
	slot0._yScale = UnityEngine.Screen.height / slot0._camera.ScreenToWorldPoint(Vector3(UnityEngine.Screen.width, UnityEngine.Screen.height, 0)).y
end

function slot2.Update(slot0)
	if #slot0._resourceList == #slot0._resourcePool then
		return
	end

	slot0:updateContainerPosition()
end

function slot2.init(slot0)
	slot0._resourceIcon = slot0._tf:Find("resourceIcon")
	slot0._resourceText = slot0._tf:Find("resourceText"):GetComponent(typeof(Text))
	slot0._resourceGO = slot0._containerTF:Find("spin_gold")
	slot0._resourceIconX = slot0._resourceIcon.transform.anchoredPosition.x + slot0._tf.rect.width / 2
	slot0._resourceIconY = slot0._resourceIcon.transform.anchoredPosition.y + slot0._tf.rect.height / 2
	slot0._itemPool = {}
	slot0._resourcePool = {}
	slot0._resourceList = {}
	slot0._itemCount = 0
	slot0._resourceCount = 0

	slot0:updateCountText(slot0._resourceText)

	slot0._timerList = {}
	slot3 = {}

	for slot7 = 1, 5, 1 do
		table.insert(slot3, slot0:pop(slot0._resourcePool))
	end

	for slot7 = 1, 5, 1 do
		slot0:push(slot3[slot7], slot0._resourcePool)
	end

	slot3 = nil
end

function slot2.pop(slot0, slot1)
	slot2 = nil

	if #slot1 == 0 then
		if slot1 == slot0._resourcePool then
			slot0._resourceList[#slot0._resourceList + 1] = Object.Instantiate(slot0._resourceGO, Vector3.zero, Quaternion.identity)
		end

		slot2.transform:SetParent(slot0._go, false)
	else
		slot2 = slot1[#slot1]
		slot1[#slot1] = nil
	end

	return slot2
end

function slot2.push(slot0, slot1, slot2)
	slot1.transform.localScale = Vector3(0.35, 0.35, 0.35)
	slot1:GetComponent(typeof(Animator)).enabled = false

	SetActive(slot1, false)

	slot2[#slot2 + 1] = slot1
end

function slot2.updateCountText(slot0, slot1)
	slot2 = nil

	if slot1 == slot0._resourceText then
		slot2 = slot0._resourceCount
	end

	if slot2 > 999 then
		slot1.text = string.format("%s%.1f%s", "x", slot2 / 1000, "k")
	else
		slot1.text = string.format("%s%d", "x", slot2)
	end
end

function slot2.ShowDrop(slot0, slot1)
	if #slot0._resourceList == #slot0._resourcePool then
		slot0:updateContainerPosition()
	end

	slot3 = Vector3(slot0.Battle.BattleVariable.CameraPosToUICamera(slot1.scenePos:Clone()).x, slot0.Battle.BattleVariable.CameraPosToUICamera(slot1.scenePos.Clone()).y, 2)
	slot5, slot6 = math.modf(slot1.drops.resourceCount / slot1.RESOURCE_STEP)

	if slot6 > 0 then
		slot0:makeFloatAnima(slot3, slot0._resourcePool, slot0._resourceIconX, slot0._resourceIconY, slot0._resourceIcon, "_resourceCount", slot6 * slot1.RESOURCE_STEP, slot0._resourceText, 0)
	end

	while slot5 > 0 do
		slot0:makeFloatAnima(slot3, slot0._resourcePool, slot0._resourceIconX, slot0._resourceIconY, slot0._resourceIcon, "_resourceCount", slot1.RESOURCE_STEP, slot0._resourceText, slot5)

		slot5 = slot5 - 1
	end
end

function slot2.updateContainerPosition(slot0)
	slot0._containerTF.localPosition = Vector3(slot0._xScale * (slot0._cameraSrcX - slot0._cameraTF.localPosition.x), slot0._yScale * (slot0._cameraSrcZ - slot0._cameraTF.localPosition.z), 0)
end

function slot2.makeFloatAnima(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot10 = slot0:pop(slot2)

	SetActive(slot10, true)

	slot10.transform.position = slot1
	slot10.transform.localPosition = slot10.transform.localPosition - slot0._containerTF.localPosition

	slot0:Update()
	slot10.transform.SetParent(slot11, slot0._container, false)
	LeanTween.moveX(rtf(slot10), slot10.transform.anchoredPosition.x + math.random() * 200 - 100, slot0.RESOURCE_STAY_DURATION + slot9 * 0.05):setOnComplete(System.Action(function ()
		LeanTween.scale(go(slot0), Vector3(0.2, 0.2, 1), slot1.FLOAT_DURATION)

		0.localPosition = slot3.localPosition + slot5._containerTF.localPosition

		slot3:SetParent(slot5._go, false)
		LeanTween.move(rtf(slot0), slot0, slot1.FLOAT_DURATION):setOnComplete(System.Action(function ()
			slot0:push(slot0, )

			slot3.transform.localScale = Vector3(0.35, 0.35, 0.35)
			slot3.transform[slot4] = slot0[slot4] + slot5

			slot3.transform:updateCountText(slot6)
			LeanTween.scale(go(slot3), Vector3(0.5, 0.5, 0.5), 0.12):setEase(LeanTweenType.easeOutExpo):setOnComplete(System.Action(function ()
				LeanTween.scale(go(slot0), Vector3(0.35, 0.35, 0.35), 0.3)
			end))
		end))
	end))
	LeanTween.moveY(rtf(slot10), slot10.transform.anchoredPosition.y + math.random() * 200, 0.5 * (math.random() * 200) / 200):setOnComplete(System.Action(function ()
		slot0:GetComponent("Animator").enabled = true

		LeanTween.moveY(rtf(slot0), slot1.anchoredPosition.y - , 1.5 * slot1.anchoredPosition.y):setEase(LeanTweenType.easeOutBounce)
	end))
end

function slot2.Dispose(slot0)
	for slot4, slot5 in pairs(slot0._timerList) do
		if slot5 then
			pg.TimeMgr.GetInstance():RemoveBattleTimer(slot4)
		end
	end

	for slot4, slot5 in ipairs(slot0._resourceList) do
		LeanTween.cancel(go(slot5))
	end

	slot0._timerList = nil
	slot0._go = nil
	slot0._resourceIcon = nil
	slot0._resourceText = nil
	slot0._itemIcon = nil
	slot0._itemText = nil
	slot0._camera = nil
	slot0._uiCamera = nil
end

return
