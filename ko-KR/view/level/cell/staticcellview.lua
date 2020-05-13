slot0 = class("StaticCellView")
slot1 = import("view.util.RequestPackages.LoadPrefabRequestPackage")
slot2 = import("view.util.RequestPackages.LoadReferenceRequestPackage")
slot3 = import("view.util.RequestPackages.GetSpineRequestPackage")
slot4 = import("view.util.RequestPackages.GetPrefabRequestPackage")
slot5 = import("view.util.RequestPackages.ReturnPrefabRequestPackage")
slot6 = import("view.util.RequestPackages.ReturnSpineRequestPackage")

function slot0.Ctor(slot0, slot1)
	slot0.parent = slot1
	slot0.go = nil
	slot0.tf = nil
	slot0.info = nil
	slot0._loadingRequest = {}
	slot0._returnRequest = {}
end

function slot0.SetTpl(slot0, slot1)
	slot0._tpl = slot1
end

function slot0.UpdateGO(slot0)
	if slot0._tpl and slot0._currentTpl ~= slot1 then
		if not IsNil(slot0.go) then
			slot0:ClearRequests()
			Destroy(slot0.go)
		end

		slot0.go = Instantiate(slot1)

		setParent(slot0.go, slot0.parent)

		slot0.tf = slot0.go.transform
		slot0._currentTpl = slot1
	end
end

function slot0.UpdateGOAsync(slot0, slot1, slot2, slot3)
	if slot0._loadingRequest.main and slot4.name == slot3 then
		return
	elseif slot0._loadedMainName == slot3 then
		slot1()

		return
	end

	slot0:ClearRequests()
	slot0:LoadMain(slot2, slot3, function (slot0)
		uv0:DestroyGO()

		uv0.go = slot0

		setParent(uv0.go, uv0.parent)

		uv0.tf = uv0.go.transform
		uv0._loadedMainName = uv1

		uv2()
	end)
end

function slot0.LoadMain(slot0, slot1, slot2, slot3)
	slot4 = uv0.New(slot1, slot2 or "", function (slot0)
		if uv0 then
			uv0(slot0)
		end

		uv1._loadingRequest.main = nil
	end)
	slot0._loadingRequest.main = slot4

	slot4()
end

function slot0.GetPrefab(slot0, slot1, slot2, slot3)
	slot2 = slot2 or ""
	slot4 = uv0.New(slot1, slot2, function (slot0)
		if uv0 then
			uv0(slot0)
		end

		uv1._loadingRequest[uv2 .. uv3] = nil
		uv1._returnRequest[uv2 .. uv3] = uv4.New(uv2, uv3, slot0)
	end)
	slot0._loadingRequest[slot1 .. slot2] = slot4

	slot4()
end

function slot0.GetSpine(slot0, slot1, slot2)
	if not slot1 or #slot1 < 0 then
		return
	end

	slot1 = slot1 or ""
	slot3 = uv0.New(slot1, function (slot0)
		if uv0 then
			uv0(slot0)
		end

		uv1._loadingRequest["spine/" .. uv2] = nil
		uv1._returnRequest["spine/" .. uv2] = uv3.New(uv2, slot0)
	end)
	slot0._loadingRequest["spine/" .. slot1] = slot3

	slot3()
end

function slot0.LoadPrefab(slot0, slot1, slot2, slot3)
	slot2 = slot2 or ""
	slot4 = uv0.New(slot1, slot2, function (slot0)
		if uv0 then
			uv0(slot0)
		end

		uv1._loadingRequest[uv2 .. uv3] = nil
	end)
	slot0._loadingRequest[slot1 .. slot2] = slot4

	slot4()
end

function slot0.LoadSprite(slot0, slot1, slot2, slot3, slot4, slot5)
	slot3:GetComponent(typeof(Image)).enabled = false
	slot2 = slot2 or ""
	slot7 = uv0.New(slot1, slot2, typeof(Sprite), function (slot0)
		uv0.enabled = true
		uv0.sprite = slot0

		if uv1 then
			uv0:SetNativeSize()
		end

		if uv2 then
			uv2(slot0)
		end

		uv3._loadingRequest[uv4 .. uv5] = nil
	end)
	slot0._loadingRequest[slot1 .. slot2] = slot7

	slot7()
end

function slot0.SetActive(slot0, slot1)
	setActive(slot0.go, slot1)
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
end

function slot0.DestroyGO(slot0)
	slot0:ClearRequests()

	if not IsNil(slot0.go) then
		Destroy(slot0.go)

		slot0.go = nil
		slot0.tf = nil
	end
end

function slot0.Clear(slot0)
	slot0.parent = nil
	slot0._tpl = nil
	slot0._currentTpl = nil
	slot0.info = nil

	slot0:DestroyGO()
	slot0:ClearRequests()
end

return slot0
