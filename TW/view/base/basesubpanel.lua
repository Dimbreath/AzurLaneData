slot0 = class("BaseSubPanel")
slot1 = import("view.util.FuncBuffer")
slot2 = import("view.util.AutoLoader")
slot0.STATES = {
	LOADED = 3,
	DESTROY = 5,
	LOADING = 2,
	INITED = 4,
	NONE = 1
}

function slot0.Ctor(slot0, slot1)
	slot0._state = slot0.STATES.NONE
	slot0.buffer = slot1.New()
	slot0.loader = slot1.New().New()

	if slot1 then
		slot0.buffer:Attach(slot1)
	end
end

function slot0.emit(slot0, slot1, ...)
	if slot0.viewParent then
		slot0.viewParent:emit(slot1, ...)
	end
end

function slot0.Attach(slot0, slot1)
	slot0.viewParent = slot1
	slot0.contextData = slot1.contextData

	if slot0:GetLoaded() then
		SetParent(slot0._tf, slot1._tf, false)
		slot0:Show()
	end
end

function slot0.Detach(slot0)
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

function slot0.Load(slot0)
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

function slot0.Loaded(slot0, slot1)
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

function slot0.Init(slot0)
	if slot0._state ~= slot0.STATES.LOADED then
		return
	end

	slot0._state = slot0.STATES.INITED

	slot0:OnInit()
	slot0.buffer:SetNotifier(slot0)
	slot0.buffer:ExcuteAll()
end

function slot0.InvokeParent(slot0, slot1, ...)
	if slot0.viewParent then
		slot0.viewParent[slot1](slot0.viewParent, ...)
	end
end

function slot0.GetLoaded(slot0)
	return slot0.STATES.LOADED <= slot0._state
end

function slot0.CheckState(slot0, slot1)
	return slot0._state == slot1
end

function slot0.Hide(slot0)
	slot0:OnHide()
	setActive(slot0._go, false)
end

function slot0.RawHide(slot0)
	setActive(slot0._go, false)
end

function slot0.Show(slot0)
	setActive(slot0._go, true)
	slot0:OnShow()
end

function slot0.RawShow(slot0)
	setActive(slot0._go, true)
end

function slot0.IsShowing(slot0)
	return isActive(slot0._go)
end

function slot0.Destroy(slot0)
	if slot0._state == slot0.STATES.DESTROY then
		return
	end

	if not slot0:GetLoaded() then
		slot0._state = slot0.STATES.DESTROY

		return
	end

	slot0:Hide()
	slot0:OnDestroy()
	slot0.loader:Clear()
	pg.DelegateInfo.Dispose(slot0)
	setParent(slot0._tf, pg.UIMgr.GetInstance().UIMain, false)
	slot0:DisposeGO(slot0:GetUIName(), slot0._go)

	slot0._go = nil
	slot0._state = slot0.STATES.DESTROY
end

function slot0.DisposeGO(slot0, slot1, slot2)
	slot3 = PoolMgr.GetInstance()

	if not IsNil(slot2) then
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

function slot0.GetUIName(slot0)
	return nil
end

function slot0.OnLoaded(slot0)
	return
end

function slot0.OnInit(slot0)
	return
end

function slot0.OnShow(slot0)
	return
end

function slot0.OnHide(slot0)
	return
end

function slot0.OnDestroy(slot0)
	return
end

return slot0
