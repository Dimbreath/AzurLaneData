slot0 = class("WSDragProxy", import("...BaseEntity"))
slot0.Fields = {
	map = "table",
	gid = "number",
	topExtend = "number",
	transform = "userdata",
	bottomExtend = "number",
	leftExtend = "number",
	twFocusId = "number",
	dragTrigger = "userdata",
	wsTimer = "table",
	onDragFunction = "function",
	rightExtend = "number"
}

function slot0.Setup(slot0)
	slot0.dragTrigger = GetOrAddComponent(slot0.transform, "EventTriggerListener")
	slot0.dragTrigger.enabled = true
end

function slot0.Dispose(slot0)
	slot0.transform.localPosition = Vector3.zero

	ClearEventTrigger(slot0.dragTrigger)

	slot0.dragTrigger.enabled = true

	slot0:Clear()
end

function slot0.Focus(slot0, slot1, slot2, slot3)
	slot5 = slot0.transform:Find("plane")
	slot6 = slot0.transform.parent:InverseTransformVector(slot1 - slot5.position)
	slot6.x = slot6.x + slot5.localPosition.x
	slot6.y = slot6.y + slot5.localPosition.y - slot5.localPosition.z * math.tan(math.pi / 180 * slot0.map.theme.angle)
	slot6.x = math.clamp(-slot6.x, -slot0.rightExtend, slot0.leftExtend)
	slot6.y = math.clamp(-slot6.y, -slot0.topExtend, slot0.bottomExtend)
	slot6.z = 0

	if slot0.twFocusId then
		slot0.wsTimer:RemoveInMapTween(slot0.twFocusId)
	end

	if slot2 then
		table.insert({}, function (slot0)
			uv0.dragTrigger.enabled = false
			uv0.twFocusId = LeanTween.moveLocal(uv0.transform.gameObject, uv1, (uv0.transform.localPosition - uv1).magnitude > 0 and slot1 / (40 * math.sqrt(slot1)) or 0):setEase(uv2 == 1 and LeanTweenType.linear or LeanTweenType.easeInOutSine):setOnComplete(System.Action(slot0)).uniqueId

			uv0.wsTimer:AddInMapTween(uv0.twFocusId)
		end)
	else
		slot0.transform.localPosition = slot6
	end

	seriesAsync(slot7, function ()
		uv0.dragTrigger.enabled = true

		if uv1 then
			uv1()
		end
	end)
end

function slot0.UpdateMap(slot0, slot1)
	if slot0.map ~= slot1 or slot0.gid ~= slot1.gid then
		slot0.map = slot1
		slot0.gid = slot1.gid

		slot0:UpdateDrag()
	end
end

function slot0.UpdateDrag(slot0)
	slot1 = pg.UIMgr.GetInstance().UIMain.transform
	slot2 = slot1.rect.width
	slot3 = slot1.rect.height
	slot4 = Vector2.New(slot2 / UnityEngine.Screen.width, slot3 / UnityEngine.Screen.height)
	slot5 = slot0.map.theme
	slot6 = slot2 * 0.5 / math.tan(math.pi / 180 * slot5.fov)
	slot4.x = slot4.x * math.clamp((slot6 - (Vector3(0, slot5.offsety, slot5.offsetz) + WorldConst.DefaultMapOffset).magnitude) / slot6, 0, 1)
	slot0.leftExtend, slot0.rightExtend, slot0.topExtend, slot0.bottomExtend = slot0:GetDragExtend(slot2, slot3)
	slot0.transform.sizeDelta = Vector2(slot2 + math.max(slot0.leftExtend, slot0.rightExtend) * 2, slot3 + math.max(slot0.topExtend, slot0.bottomExtend) * 2)

	slot0.dragTrigger:AddDragFunc(function (slot0, slot1)
		if uv0.onDragFunction then
			uv0.onDragFunction()
		end

		slot2 = uv0.transform.localPosition
		slot2.x = math.clamp(slot2.x + slot1.delta.x * uv1.x, -uv0.rightExtend, uv0.leftExtend)
		slot2.y = math.clamp(slot2.y + slot1.delta.y * uv1.y, -uv0.topExtend, uv0.bottomExtend)
		uv0.transform.localPosition = slot2
	end)
end

function slot0.GetDragExtend(slot0, slot1, slot2)
	slot3 = slot0.map
	slot5 = slot0.transform:Find("plane")
	slot6 = slot5.localPosition.x
	slot7 = slot5.localPosition.y - slot5.localPosition.z * math.tan(math.pi / 180 * slot3.theme.angle)
	slot9 = 0
	slot10 = 0

	for slot14, slot15 in pairs(slot3.cells) do
		if slot15.row < 99999999 then
			slot8 = slot15.row
		end

		if slot9 < slot15.row then
			slot9 = slot15.row
		end

		if slot10 < slot15.column then
			slot10 = slot15.column
		end
	end

	slot11 = slot3.theme.cellSize + slot3.theme.cellSpace

	return 1000 - slot6, math.max(slot10 * slot11.x - slot1 * 0.5, 0) + slot6, math.max((WorldConst.MaxRow * 0.5 - slot8) * slot11.y, 0) + slot7, math.max((slot9 - WorldConst.MaxRow * 0.5) * slot11.y, 0) - slot7
end

function slot0.ShakePlane(slot0, slot1, slot2, slot3, slot4, slot5)
	slot3 = math.max(slot3, 1)
	slot4 = math.max(slot4, 1)
	slot6 = math.pi / 180 * math.clamp(slot2, 0, 90)
	slot7 = Vector3(math.cos(slot6), math.sin(slot6), 0) * slot1
	slot8 = slot0.transform.anchoredPosition3D
	slot11 = 0.0333
	slot12 = slot11 * slot3 * 0.5
	slot13 = slot11 * slot3
	slot0.dragTrigger.enabled = false

	slot0.wsTimer:AddInMapTween(LeanTween.moveLocal(slot0.transform.gameObject, slot8 + slot7, slot12).uniqueId)
	slot0.wsTimer:AddInMapTween(LeanTween.moveLocal(slot0.transform.gameObject, slot8 - slot7, slot13):setDelay(slot12):setLoopPingPong(slot4).uniqueId)
	slot0.wsTimer:AddInMapTween(LeanTween.moveLocal(slot0.transform.gameObject, slot8, slot11 * slot3 * 0.5):setDelay(slot12 + slot13 * slot4 * 2):setOnComplete(System.Action(function ()
		uv0.dragTrigger.enabled = true

		uv1()
	end)).uniqueId)
end

return slot0
