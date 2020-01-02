ys = ys or {}
ys.EventListener = class("EventListener")
ys.EventListener.__name = "EventListener"

function ys.EventListener.AttachEventListener(slot0)
	slot0.EventListener.New(slot0)
end

function ys.EventListener.DetachEventListener(slot0)
	if slot0._eventListener_ == nil then
		return
	end

	slot0._eventListener_:_Destory_()

	slot0._eventListener_ = nil
end

function ys.EventListener.Ctor(slot0, slot1)
	slot0._target_ = slot1
	slot0._target_._eventListener_ = slot0
	slot0._routeMap_ = {}
end

function ys.EventListener._Destory_(slot0)
	slot0._routeMap_ = nil
	slot0._target_ = nil
end

function ys.EventListener._AddRoute_(slot0, slot1, slot2, slot3)
	if slot0._routeMap_[slot1] == nil then
		slot0._routeMap_[slot1] = {}
	end

	slot0._routeMap_[slot1][slot2] = slot3
end

function ys.EventListener._RemoveRoute_(slot0, slot1, slot2)
	slot0._routeMap_[slot1][slot2] = nil
end

function ys.EventListener._Handle_(slot0, slot1)
	slot0._routeMap_[slot1.ID][slot1.Dispatcher](slot0._target_, slot1)
end

return
