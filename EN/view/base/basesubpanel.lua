slot0 = class("BaseSubPanel")
slot1 = import("view.util.FuncBuffer")
slot0.STATES = {
	LOADED = 3,
	DESTROY = 5,
	LOADING = 2,
	INITED = 4,
	NONE = 1
}

slot0.Ctor = function (slot0, slot1)
	slot0._state = slot0.STATES.NONE
	slot0.buffer = slot1.New()

	if slot1 then
		slot0.buffer:Attach(slot1)
	end
end

slot0.emit = function (slot0, slot1, ...)
	if slot0.viewParent then
		slot0.viewParent:emit(slot1, ...)
	end
end

slot0.Attach = function (slot0, slot1)
	slot0.viewParent = slot1
	slot0.contextData = slot1.contextData

	if slot0:GetLoaded() then
		SetParent(slot0._tf, slot1._tf, false)
		slot0:Show()
	end
end

slot0.Detach = function (slot0)
	if slot0._state == slot0.STATES.DESTROY then
		return
	end

	if slot0:GetLoaded() then
		SetParent(slot0._tf, pg.UIMgr.GetInstance().UIMain, false)
		slot0:Hide()
	end

	slot0.contextData = nil
	slot0.viewParent = nil
end

slot0.Load = function (slot0)
	if slot0._state ~= slot0.STATES.NONE then
		return
	end

	slot0._state = slot0.STATES.LOADING

	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetUI(slot0:GetUIName(), true, function (slot0)
		slot0:Loaded(slot0)
		slot0:Init()
	end)
end

slot0.Loaded = function (slot0, slot1)
	pg.UIMgr.GetInstance():LoadingOff()

	if slot0._state == slot0.STATES.DESTROY then
		slot0:DisposeGO(slot0:GetUIName(), slot1)

		return
	end

	if slot0._state ~= slot0.STATES.LOADING then
		return
	end

	slot0._state = slot0.STATES.LOADED
	slot0._go = slot1
	slot0._tf = tf(slot1)

	setActive(slot0._go, false)
	pg.DelegateInfo.New(slot0)
	slot0:OnLoaded()
end

slot0.Init = function (slot0)
	if slot0._state ~= slot0.STATES.LOADED then
		return
	end

	slot0._state = slot0.STATES.INITED

	slot0:OnInit()
	slot0.buffer:SetNotifier(slot0)
	slot0.buffer:ExcuteAll()
end

slot0.InvokeParent = function (slot0, slot1, ...)
	if slot0.viewParent then
		slot0.viewParent[slot1](slot0.viewParent, ...)
	end
end

slot0.GetLoaded = function (slot0)
	return slot0.STATES.LOADED <= slot0._state
end

slot0.CheckState = function (slot0, slot1)
	return slot0._state == slot1
end

slot0.Hide = function (slot0)
	slot0:OnHide()
	setActive(slot0._go, false)
end

slot0.RawHide = function (slot0)
	setActive(slot0._go, false)
end

slot0.Show = function (slot0)
	setActive(slot0._go, true)
	slot0:OnShow()
end

slot0.RawShow = function (slot0)
	setActive(slot0._go, true)
end

slot0.IsShowing = function (slot0)
	return isActive(slot0._go)
end

slot0.Destroy = function (slot0)
	if slot0._state == slot0.STATES.DESTROY then
		return
	end

	if not slot0:GetLoaded() then
		slot0._state = slot0.STATES.DESTROY

		return
	end

	slot0:Hide()
	slot0:OnDestroy()
	pg.DelegateInfo.Dispose(slot0)
	setParent(slot0._tf, pg.UIMgr.GetInstance().UIMain, false)
	slot0:DisposeGO(slot0:GetUIName(), slot0._go)

	slot0._go = nil
	slot0._state = slot0.STATES.DESTROY
end

slot0.DisposeGO = function (slot0, slot1, slot2)
	slot3 = PoolMgr.GetInstance()

	if not IsNil(slot2) then
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

slot0.GetUIName = function (slot0)
	return nil
end

slot0.OnLoaded = function (slot0)
	return
end

slot0.OnInit = function (slot0)
	return
end

slot0.OnShow = function (slot0)
	return
end

slot0.OnHide = function (slot0)
	return
end

slot0.OnDestroy = function (slot0)
	return
end

return slot0
