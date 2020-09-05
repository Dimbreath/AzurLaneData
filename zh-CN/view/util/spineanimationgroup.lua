slot0 = class("SpineAnimationGroup")
slot1 = import("view.util.RequestPackages.ReturnSpineRequestPackage")
slot2 = import("view.util.RequestPackages.GetSpineRequestPackage")

function slot0.Ctor(slot0, slot1)
	slot0.name = nil
	slot0.model = nil
	slot0.anim = nil
	slot0.AnimIndex = nil
	slot0.group = {}
	slot0.lastClearRequest = nil
	slot0.lastLoadRequest = nil
	slot0.timer = nil
	slot0.parent = slot1
	slot0.position = Vector2(0, -15)
	slot0.scale = Vector3(0.4, 0.4, 0.4)
end

function slot0.Set(slot0, slot1)
	if slot0.name == slot1 then
		return
	end

	slot0:ClearModel()

	for slot5 = #slot0.group, 1, -1 do
		table.remove(slot0.group, slot5)
	end

	slot0.name = slot1

	if slot0.lastLoadRequest then
		slot0.lastLoadRequest:Stop()
	end

	slot0.lastLoadRequest = uv0.New(slot1, function (slot0)
		if uv0.lastClearRequest then
			uv0.lastClearRequest()
		end

		uv0.lastLoadRequest = nil
		uv0.model = slot0
		uv0.anim = slot0:GetComponent("SpineAnimUI")

		setParent(slot0, uv0.parent)

		slot0.transform.anchoredPosition = uv0.position
		slot0.transform.localScale = uv0.scale

		uv0:PlayAction(uv0.AnimIndex)
	end)

	slot0.lastLoadRequest()
end

function slot0.SetRoutine(slot0, slot1)
	table.clear(slot0.group)

	for slot5, slot6 in ipairs(slot1 or {}) do
		slot0.group[slot5] = slot6
	end

	if #slot0.group < 1 then
		table.insert(slot0.group, {
			action = "default",
			duration = 9999
		})
	end

	slot0:PlayAction(math.min(#slot0.group, 1))
end

function slot0.PlayAction(slot0, slot1)
	if not slot1 or slot1 <= 0 or slot1 > #slot0.group or slot0.AnimIndexPlaying == slot1 then
		return
	end

	slot0.AnimIndex = slot1

	if slot0.lastLoadRequest or not slot0.anim then
		return
	end

	slot2 = slot0.group[slot1]

	slot0:ClearTimer()

	slot0.timer = Timer.New(function ()
		uv0 = uv0 + 1

		if uv0 > #uv1.group then
			uv0 = math.min(#uv1.group, 1)
		end

		uv1:PlayAction(uv0)
	end, slot2.duration)

	slot0.anim:SetAction(slot2.action, 0)
	slot0.timer:Start()

	slot0.AnimIndexPlaying = slot1
end

function slot0.ClearModel(slot0)
	if slot0.model and not slot0.lastClearRequest then
		slot0.lastClearRequest = uv0.New(slot0.name, slot0.model, function ()
			uv0.model = nil
			uv0.anim = nil
		end)
	end
end

function slot0.ClearTimer(slot0)
	if slot0.timer then
		slot0.timer:Stop()

		slot0.timer = nil
	end
end

function slot0.ClearAll(slot0)
	slot0:ClearTimer()
	slot0:ClearModel()

	slot0.name = nil
	slot1 = slot0.lastClearRequest and slot0.lastClearRequest()

	if slot0.lastLoadRequest then
		slot0.lastLoadRequest:Stop()
	end
end

return slot0
