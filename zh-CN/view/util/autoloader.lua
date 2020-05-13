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
	slot0._insKeyDict = {}
	slot0._keyInsDict = {}
end

function slot0.GetPrefab(slot0, slot1, slot2, slot3, slot4)
	slot0:ClearRequest(slot4)

	slot5 = nil
	slot5 = uv0.New(slot1, slot2 or "", function (slot0)
		uv0._loadingRequest[uv1] = nil
		uv0._insKeyDict[slot0] = uv1
		uv0._keyInsDict[uv1] = slot0
		uv0._returnRequest[uv1] = uv2.New(uv3, uv4, slot0)

		if uv5 then
			uv5(slot0)
		end
	end)
	slot0._loadingRequest[slot4 or #slot0._loadingRequest + 1] = slot5

	slot5:Start()
end

function slot0.ReturnPrefab(slot0, slot1)
	slot0:ClearRequest(slot0._insKeyDict[go(slot1)])
end

function slot0.GetSpine(slot0, slot1, slot2, slot3)
	if not slot1 or #slot1 < 0 then
		return
	end

	slot0:ClearRequest(slot3)

	slot4 = nil
	slot4 = uv0.New(slot1 or "", function (slot0)
		uv0._loadingRequest[uv1] = nil
		uv0._insKeyDict[slot0] = uv1
		uv0._keyInsDict[uv1] = slot0
		uv0._returnRequest[uv1] = uv2.New(uv3, slot0)

		if uv4 then
			uv4(slot0)
		end
	end)
	slot0._loadingRequest[slot3 or #slot0._loadingRequest + 1] = slot4

	slot4:Start()
end

function slot0.ReturnSpine(slot0, slot1)
	slot0:ClearRequest(slot0._insKeyDict[go(slot1)])
end

function slot0.GetSprite(slot0, slot1, slot2, slot3, slot4)
	slot3:GetComponent(typeof(Image)).enabled = false
	slot6 = tf(slot3)

	slot0:ClearRequest(slot6)

	slot7 = nil
	slot7 = uv0.New(slot1, slot2 or "", function (slot0)
		uv0._loadingRequest[uv1] = nil
		uv2.enabled = true
		uv2.sprite = slot0

		if uv3 then
			uv2:SetNativeSize()
		end
	end)
	slot0._loadingRequest[slot6] = slot7

	slot7:Start()

	slot0._returnRequest["Atlas/" .. slot1] = uv1.New(slot1)
end

function slot0.GetOffSpriteRequest(slot0, slot1)
	slot0:ClearRequest(slot1)
end

function slot0.LoadPrefab(slot0, slot1, slot2, slot3, slot4)
	slot0:ClearRequest(slot4)

	slot5 = nil
	slot5 = uv0.New(slot1, slot2 or "", function (slot0)
		uv0._loadingRequest[uv1] = nil

		if uv2 then
			uv2(slot0)
		end
	end)
	slot0._loadingRequest[slot4 or #slot0._loadingRequest + 1] = slot5

	slot5:Start()
end

function slot0.LoadSprite(slot0, slot1, slot2, slot3, slot4)
	slot3:GetComponent(typeof(Image)).enabled = false
	slot6 = tf(slot3)

	slot0:ClearRequest(slot6)

	slot7 = nil
	slot7 = uv0.New(slot1, slot2 or "", typeof(Sprite), function (slot0)
		uv0._loadingRequest[uv1] = nil
		uv2.enabled = true
		uv2.sprite = slot0

		if uv3 then
			uv2:SetNativeSize()
		end
	end)
	slot0._loadingRequest[slot6] = slot7

	slot7:Start()
end

function slot0.ClearRequest(slot0, slot1)
	if slot0._loadingRequest[slot1] then
		slot0._loadingRequest[slot1]:Stop()

		slot0._loadingRequest[slot1] = nil
	end

	if slot0._returnRequest[slot1] then
		slot0._returnRequest[slot1]:Start()

		slot0._returnRequest[slot1] = nil
	end

	if slot0._keyInsDict[slot1] then
		slot0._insKeyDict[slot0._keyInsDict[slot1]] = nil
		slot0._keyInsDict[slot1] = nil
	end
end

function slot0.ClearRequests(slot0)
	for slot4, slot5 in pairs(slot0._loadingRequest) do
		slot5:Stop()
	end

	table.clear(slot0._loadingRequest)

	for slot4, slot5 in pairs(slot0._returnRequest) do
		slot5:Start()
	end

	table.clear(slot0._returnRequest)
	table.clear(slot0._insKeyDict)
	table.clear(slot0._keyInsDict)
end

function slot0.Clear(slot0)
	slot0:ClearRequests()
end

return slot0
