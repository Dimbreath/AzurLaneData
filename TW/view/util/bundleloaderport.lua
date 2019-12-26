slot0 = class("BundleLoaderPort")

function slot0.Ctor(slot0, slot1)
	slot0.pool = slot1 or BundlePool.New()

	slot0.pool:Bind(slot0)

	slot0._loadingRequest = {}
end

function slot0.GetPrefab(slot0, slot1, slot2, slot3, slot4)
	slot2 = slot2 or ""

	if slot4 and slot0._loadingRequest[slot4] then
		slot0:ClearRequest(slot4)
	end

	slot5 = nil
	slot5 = slot0.pool:GetPrefab(slot1, slot2, true, function (slot0)
		if slot0 or slot1 then
			slot2._loadingRequest[slot0 or slot2._loadingRequest] = nil
		end

		if slot3 then
			slot3(slot0)
		end
	end)

	if slot4 or slot5 then
		slot0._loadingRequest[slot4 or slot5] = slot5
	end

	return slot5
end

function slot0.ReturnPrefab(slot0, slot1, slot2, slot3, slot4)
	slot0.pool:ReturnPrefab(slot1, slot2, slot3, slot4)
end

function slot0.GetSpine(slot0, slot1, slot2, slot3)
	if not slot1 or #slot1 < 0 then
		return
	end

	if slot3 and slot0._loadingRequest[slot3] then
		slot0:ClearRequest(slot3)
	end

	slot4 = nil
	slot4 = slot0.pool:GetSpineChar(slot1, true, function (slot0)
		if slot0 or slot1 then
			slot2._loadingRequest[slot0 or slot2._loadingRequest] = nil
		end

		if slot3 then
			slot3(slot0)
		end
	end)

	if slot3 or slot4 then
		slot0._loadingRequest[slot3 or slot4] = slot4
	end

	return slot4
end

function slot0.ReturnSpine(slot0, slot1, slot2)
	slot0.pool:ReturnSpineChar(slot1, go(slot2))
end

function slot0.GetPainting(slot0, slot1, slot2, slot3)
	if not slot1 or #slot1 < 0 then
		return
	end

	if slot3 and slot0._loadingRequest[slot3] then
		slot0:ClearRequest(slot3)
	end

	slot4 = nil
	slot4 = slot0.pool:GetPainting(slot1, true, function (slot0)
		if slot0 or slot1 then
			slot2._loadingRequest[slot0 or slot2._loadingRequest] = nil
		end

		if slot3 then
			slot3(slot0)
		end
	end)

	if slot3 or slot4 then
		slot0._loadingRequest[slot3 or slot4] = slot4
	end

	return slot4
end

function slot0.ReturnPainting(slot0, slot1, slot2)
	slot0.pool:ReturnPainting(slot1, go(slot2))
end

function slot0.GetSprite(slot0, slot1, slot2, slot3, slot4)
	slot3:GetComponent(typeof(Image)).enabled = false
	slot2 = slot2 or ""

	if slot0._loadingRequest[tf(slot3)] then
		slot0:ClearRequest(slot6)
	end

	slot7 = nil
	slot0._loadingRequest[slot6] = slot0.pool:GetSprite(slot1, slot2, true, function (slot0)
		slot0._loadingRequest[] = nil
		slot0._loadingRequest.enabled = true
		slot2.sprite = slot0

		if nil then
			slot2:SetNativeSize()
		end
	end)
end

function slot0.DestroyPlural(slot0, slot1, slot2)
	slot0.pool:DestroyPlural(slot1, slot2)
end

function slot0.DestroyAtlas(slot0, slot1)
	slot0.pool:DestroyPack(slot1)
end

function slot0.GetOffSpriteRequest(slot0, slot1)
	slot0:ClearRequest(tf(slot1))
end

function slot0.ClearRequest(slot0, slot1)
	slot0.pool:CancelRequest(slot0._loadingRequest[slot1])

	slot0._loadingRequest[slot1] = nil
end

function slot0.ClearRequests(slot0)
	for slot4, slot5 in pairs(slot0._loadingRequest) do
		slot0.pool:CancelRequest(slot5)
	end

	table.clear(slot0._loadingRequest)
end

function slot0.Clear(slot0, slot1)
	slot0:ClearRequests()
	slot0.pool:UnBind(defaultValue(slot1, true))
end

return slot0
