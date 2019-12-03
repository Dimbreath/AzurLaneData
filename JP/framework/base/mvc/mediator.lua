ys = ys or {}
ys or .MVC = ys.MVC or {}
ys or .MVC.Mediator = class("MVC.Mediator")
ys or .MVC.Mediator.__name = "MVC.Mediator"

ys or .MVC.Mediator.Ctor = function (slot0)
	return
end

ys or .MVC.Mediator.Initialize = function (slot0)
	slot0.EventDispatcher.AttachEventDispatcher(slot0)
	slot0.EventListener.AttachEventListener(slot0)
end

ys or .MVC.Mediator.Update = function (slot0)
	return
end

ys or .MVC.Mediator.UpdatePause = function (slot0)
	return
end

ys or .MVC.Mediator.Dispose = function (slot0)
	slot0.EventListener.DetachEventListener(slot0)
	slot0.EventDispatcher.DetachEventDispatcher(slot0)
end

ys or .MVC.Mediator.GetState = function (slot0)
	return slot0._state
end

return
