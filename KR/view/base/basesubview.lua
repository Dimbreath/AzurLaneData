slot0 = class("BaseSubView", import("view.base.BaseEventLogic"))
slot0.STATES = {
	LOADED = 3,
	DESTROY = 5,
	LOADING = 2,
	INITED = 4,
	NONE = 1
}

slot0.Ctor = function (slot0, slot1, slot2, slot3)
	slot0.super.Ctor(slot0, slot2)

	slot0.contextData = slot3
	slot0._parentTf = slot1
	slot0._event = slot2
	slot0._go = nil
	slot0._tf = nil
	slot0._state = slot0.STATES.NONE
	slot0._funcQueue = {}
	slot0._loadedQueue = {}
end

slot0.Load = function (slot0)
	if slot0._state ~= slot0.STATES.NONE then
		return
	end

	slot0._state = slot0.STATES.LOADING

	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetUI(slot0:getUIName(), true, function (slot0)
		slot0:Loaded(slot0)
		slot0:Init()
	end)
end

slot0.Loaded = function (slot0, slot1)
	pg.UIMgr.GetInstance():LoadingOff()

	if slot0._state == slot0.STATES.DESTROY then
		slot0:DisposeGO(slot0:getUIName(), slot1)

		return
	end

	if slot0._state ~= slot0.STATES.LOADING then
		return
	end

	slot0._state = slot0.STATES.LOADED
	slot0._go = slot1
	slot0._tf = tf(slot1)

	pg.DelegateInfo.New(slot0)
	print(slot0:getUIName())
	SetParent(slot0._tf, slot0._parentTf, false)
	slot0:OnLoaded()
end

slot0.Init = function (slot0)
	if slot0._state ~= slot0.STATES.LOADED then
		return
	end

	slot0._state = slot0.STATES.INITED

	slot0:OnInit()
	slot0:HandleFuncQueue()
	slot0:HandleLoadedQueue()
end

slot0.HandleFuncQueue = function (slot0)
	if slot0._state == slot0.STATES.INITED then
		while #slot0._funcQueue > 0 do
			slot0[slot0._funcQueue[1].funcName](slot0, unpack(slot0._funcQueue[1].params))
			table.remove(slot0._funcQueue, 1)
		end
	end
end

slot0.HandleLoadedQueue = function (slot0)
	if slot0._state == slot0.STATES.INITED then
		while #slot0._loadedQueue > 0 do
			slot0._loadedQueue[1].funcBody(unpack(slot0._loadedQueue[1].params))
			table.remove(slot0._loadedQueue, 1)
		end
	end
end

slot0.Reset = function (slot0)
	slot0._state = slot0.STATES.NONE
end

slot0.ActionInvoke = function (slot0, slot1, ...)
	slot0._funcQueue[#slot0._funcQueue + 1] = {
		funcName = slot1,
		params = {
			...
		}
	}

	slot0:HandleFuncQueue()
end

slot0.ExecuteAction = function (slot0, slot1, ...)
	slot2 = {
		...
	}

	function slot3()
		slot0:ActionInvoke(slot0, unpack(slot0))
	end

	if slot0:GetLoaded() then
		slot3()
	else
		slot0:Load()
		slot0:AddLoadedCallback(slot3)
	end
end

slot0.GetLoaded = function (slot0)
	return slot0.STATES.LOADED <= slot0._state
end

slot0.CheckState = function (slot0, slot1)
	return slot0._state == slot1
end

slot0.AddLoadedCallback = function (slot0, slot1, ...)
	slot0._loadedQueue[#slot0._loadedQueue + 1] = {
		funcBody = slot1,
		params = {
			...
		}
	}

	slot0:HandleLoadedQueue()
end

slot0.Hide = function (slot0)
	setActive(slot0._tf, false)
end

slot0.Show = function (slot0)
	setActive(slot0._tf, true)
end

slot0.isShowing = function (slot0)
	return isActive(slot0._tf)
end

slot0.Destroy = function (slot0)
	if slot0._state == slot0.STATES.DESTROY then
		return
	end

	if not slot0:GetLoaded() then
		slot0._state = slot0.STATES.DESTROY

		return
	end

	slot0:OnDestroy()
	pg.DelegateInfo.Dispose(slot0)
	setParent(slot0._tf, pg.UIMgr.GetInstance().UIMain, false)
	slot0:DisposeGO(slot0:getUIName(), slot0._go)

	slot0._go = nil

	slot0:disposeEvent()

	slot0._state = slot0.STATES.DESTROY
end

slot0.DisposeGO = function (slot0, slot1, slot2)
	PoolMgr.GetInstance():DelTempCache(slot1)

	if slot2 ~= nil and slot1 then
		slot3:ReturnUI(slot1, slot2)
	end
end

slot0.findTF = function (slot0, slot1, slot2)
	return findTF(slot2 or slot0._tf, slot1)
end

slot0.getTpl = function (slot0, slot1, slot2)
	slot3 = slot0:findTF(slot1, slot2)

	slot3:SetParent(slot0._tf, false)
	SetActive(slot3, false)

	return slot3
end

slot0.getUIName = function (slot0)
	return nil
end

slot0.OnLoaded = function (slot0)
	return
end

slot0.OnInit = function (slot0)
	return
end

slot0.OnDestroy = function (slot0)
	return
end

return slot0
