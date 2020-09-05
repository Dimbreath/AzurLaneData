slot0 = class("BaseSubView", import("view.base.BaseEventLogic"))
slot0.STATES = {
	LOADED = 3,
	DESTROY = 5,
	LOADING = 2,
	INITED = 4,
	NONE = 1
}

function slot0.Ctor(slot0, slot1, slot2, slot3)
	uv0.super.Ctor(slot0, slot2)

	slot0.contextData = slot3
	slot0._parentTf = slot1
	slot0._event = slot2
	slot0._go = nil
	slot0._tf = nil
	slot0._state = uv0.STATES.NONE
	slot0._funcQueue = {}
	slot0._loadedQueue = {}
end

function slot0.Load(slot0)
	if slot0._state ~= uv0.STATES.NONE then
		return
	end

	slot0._state = uv0.STATES.LOADING

	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetUI(slot0:getUIName(), true, function (slot0)
		uv0:Loaded(slot0)
		uv0:Init()
	end)
end

function slot0.Loaded(slot0, slot1)
	pg.UIMgr.GetInstance():LoadingOff()

	if slot0._state == uv0.STATES.DESTROY then
		slot0:DisposeGO(slot0:getUIName(), slot1)

		return
	end

	if slot0._state ~= uv0.STATES.LOADING then
		return
	end

	slot0._state = uv0.STATES.LOADED
	slot0._go = slot1
	slot0._tf = tf(slot1)

	pg.DelegateInfo.New(slot0)
	SetParent(slot0._tf, slot0._parentTf, false)
	slot0:OnLoaded()
end

function slot0.Init(slot0)
	if slot0._state ~= uv0.STATES.LOADED then
		return
	end

	slot0._state = uv0.STATES.INITED

	slot0:OnInit()
	slot0:HandleFuncQueue()
	slot0:HandleLoadedQueue()
end

function slot0.HandleFuncQueue(slot0)
	if slot0._state == uv0.STATES.INITED then
		while #slot0._funcQueue > 0 do
			slot1 = slot0._funcQueue[1]

			slot0[slot1.funcName](slot0, unpack(slot1.params, 1, slot1.params.len))
			table.remove(slot0._funcQueue, 1)
		end
	end
end

function slot0.HandleLoadedQueue(slot0)
	if slot0._state == uv0.STATES.INITED then
		while #slot0._loadedQueue > 0 do
			slot1 = slot0._loadedQueue[1]

			slot1.funcBody(unpack(slot1.params, 1, slot1.params.len))
			table.remove(slot0._loadedQueue, 1)
		end
	end
end

function slot0.Reset(slot0)
	slot0._state = uv0.STATES.NONE
end

function slot0.ActionInvoke(slot0, slot1, ...)
	slot0._funcQueue[#slot0._funcQueue + 1] = {
		funcName = slot1,
		params = {
			len = select("#", ...),
			...
		}
	}

	slot0:HandleFuncQueue()
end

function slot0.ExecuteAction(slot0, slot1, ...)
	slot2 = {
		len = select("#", ...),
		...
	}

	if slot0:GetLoaded() then
		function ()
			uv0:ActionInvoke(uv1, unpack(uv2, 1, uv2.len))
		end()
	else
		slot0:Load()
		slot0:AddLoadedCallback(slot3)
	end
end

function slot0.GetLoaded(slot0)
	return uv0.STATES.LOADED <= slot0._state
end

function slot0.CheckState(slot0, slot1)
	return slot0._state == slot1
end

function slot0.AddLoadedCallback(slot0, slot1, ...)
	slot0._loadedQueue[#slot0._loadedQueue + 1] = {
		funcBody = slot1,
		params = {
			len = select("#", ...),
			...
		}
	}

	slot0:HandleLoadedQueue()
end

function slot0.Hide(slot0)
	setActive(slot0._tf, false)
end

function slot0.Show(slot0)
	setActive(slot0._tf, true)
end

function slot0.isShowing(slot0)
	return isActive(slot0._tf)
end

function slot0.Destroy(slot0)
	if slot0._state == uv0.STATES.DESTROY then
		return
	end

	if not slot0:GetLoaded() then
		slot0._state = uv0.STATES.DESTROY

		return
	end

	slot0:OnDestroy()
	pg.DelegateInfo.Dispose(slot0)
	setParent(slot0._tf, pg.UIMgr.GetInstance().UIMain, false)
	slot0:DisposeGO(slot0:getUIName(), slot0._go)

	slot0._go = nil

	slot0:disposeEvent()
	slot0:cleanManagedTween()

	slot0._state = uv0.STATES.DESTROY
end

function slot0.DisposeGO(slot0, slot1, slot2)
	PoolMgr.GetInstance():DelTempCache(slot1)

	if slot2 ~= nil and slot1 then
		slot3:ReturnUI(slot1, slot2)
	end
end

function slot0.findTF(slot0, slot1, slot2)
	return findTF(slot2 or slot0._tf, slot1)
end

function slot0.getTpl(slot0, slot1, slot2)
	slot3 = slot0:findTF(slot1, slot2)

	slot3:SetParent(slot0._tf, false)
	SetActive(slot3, false)

	return slot3
end

function slot0.getUIName(slot0)
	return nil
end

function slot0.OnLoaded(slot0)
end

function slot0.OnInit(slot0)
end

function slot0.OnDestroy(slot0)
end

return slot0
