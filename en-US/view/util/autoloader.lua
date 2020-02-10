slot0 = class("AutoLoader")
slot1 = import("view.util.RequestPackages.LoadPrefabRequestPackage")
slot2 = import("view.util.RequestPackages.LoadReferenceRequestPackage")
slot3 = import("view.util.RequestPackages.GetSpineRequestPackage")
slot4 = import("view.util.RequestPackages.GetPrefabRequestPackage")
slot5 = import("view.util.RequestPackages.GetSpriteRequestPackage")
slot6 = import("view.util.RequestPackages.ReturnPrefabRequestPackage")
slot7 = import("view.util.RequestPackages.ReturnSpineRequestPackage")
slot8 = import("view.util.RequestPackages.DestroyAtlasPoolRequestPackage")

function slot0.Ctor(slot0)
	slot0._loadingRequest = {}
	slot0._returnRequest = {}
end

function slot0.GetPrefab(slot0, slot1, slot2, slot3)
	slot5 = nil
	slot5 = uv0.New(slot1, slot2 or "", function (slot0)
		table.removebyvalue(uv0._loadingRequest[uv1], uv2)

		if #uv0._loadingRequest[uv1] == 0 then
			uv0._loadingRequest[uv1] = nil
		end

		if uv3 then
			uv3(slot0)
		end

		uv0.InsertList(uv0._returnRequest, slot0, uv4.New(uv5, uv6, slot0))
	end)

	slot0.InsertList(slot0._loadingRequest, slot1, slot5)
	slot5:Start()
end

function slot0.ReturnPrefab(slot0, slot1)
	slot0:ClearRequest(go(slot1))
end

function slot0.GetSpine(slot0, slot1, slot2)
	if not slot1 or #slot1 < 0 then
		return
	end

	slot1 = slot1 or ""
	slot4 = nil
	slot4 = uv0.New(slot1, function (slot0)
		table.removebyvalue(uv0._loadingRequest[uv1], uv2)

		if #uv0._loadingRequest[uv1] == 0 then
			uv0._loadingRequest[uv1] = nil
		end

		if uv3 then
			uv3(slot0)
		end

		uv0.InsertList(uv0._returnRequest, slot0, uv4.New(uv5, slot0))
	end)

	slot0.InsertList(slot0._loadingRequest, slot1, slot4)
	slot4:Start()
end

function slot0.ReturnSpine(slot0, slot1)
	slot0:ClearRequest(go(slot1))
end

function slot0.GetSprite(slot0, slot1, slot2, slot3, slot4)
	slot3:GetComponent(typeof(Image)).enabled = false
	slot7 = nil
	slot7 = uv0.New(slot1, slot2 or "", function (slot0)
		table.removebyvalue(uv0._loadingRequest[uv1], uv2)

		if #uv0._loadingRequest[uv1] == 0 then
			uv0._loadingRequest[uv1] = nil
		end

		uv3.enabled = true
		uv3.sprite = slot0

		if uv4 then
			uv3:SetNativeSize()
		end
	end)

	slot0.InsertList(slot0._loadingRequest, tf(slot3), slot7)
	slot7:Start()

	if not slot0._returnRequest["Atlas/" .. slot1] then
		slot0.InsertList(slot0._returnRequest, "Atlas/" .. slot1, uv1.New(slot1))
	end
end

function slot0.GetOffSpriteRequest(slot0, slot1)
	slot0:ClearRequest(slot1)
end

function slot0.LoadPrefab(slot0, slot1, slot2, slot3)
	slot5 = nil
	slot5 = uv0.New(slot1, slot2 or "", function (slot0)
		table.removebyvalue(uv0._loadingRequest[uv1], uv2)

		if #uv0._loadingRequest[uv1] == 0 then
			uv0._loadingRequest[uv1] = nil
		end

		if uv3 then
			uv3(slot0)
		end
	end)

	slot0.InsertList(slot0._loadingRequest, slot1, slot5)
	slot5:Start()
end

function slot0.LoadSprite(slot0, slot1, slot2, slot3, slot4)
	slot3:GetComponent(typeof(Image)).enabled = false
	slot7 = nil
	slot7 = uv0.New(slot1, slot2 or "", typeof(Sprite), function (slot0)
		table.removebyvalue(uv0._loadingRequest[uv1], uv2)

		if #uv0._loadingRequest[uv1] == 0 then
			uv0._loadingRequest[uv1] = nil
		end

		uv3.enabled = true
		uv3.sprite = slot0

		if uv4 then
			uv3:SetNativeSize()
		end
	end)

	slot0.InsertList(slot0._loadingRequest, tf(slot3), slot7)
	slot7:Start()
end

function slot0.InsertList(slot0, slot1, slot2)
	slot0[slot1] = slot0[slot1] or {}

	table.insert(slot0[slot1], slot2)
end

function slot0.ClearRequest(slot0, slot1)
	if slot0._loadingRequest[slot1] then
		for slot5, slot6 in ipairs(slot0._loadingRequest[slot1]) do
			slot6:Stop()
		end

		slot0._loadingRequest[slot1] = nil
	end

	if slot0._returnRequest[slot1] then
		for slot5, slot6 in ipairs(slot0._returnRequest[slot1]) do
			slot6:Start()
		end

		slot0._returnRequest[slot1] = nil
	end
end

function slot0.ClearRequests(slot0)
	for slot4, slot5 in pairs(slot0._loadingRequest) do
		for slot9, slot10 in ipairs(slot5) do
			slot10:Stop()
		end
	end

	table.clear(slot0._loadingRequest)

	for slot4, slot5 in pairs(slot0._returnRequest) do
		for slot9, slot10 in ipairs(slot5) do
			slot10:Start()
		end
	end

	table.clear(slot0._returnRequest)
end

function slot0.Clear(slot0)
	slot0:ClearRequests()
end

return slot0
