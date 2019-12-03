ys = ys or {}
ys or .MVC = ys.MVC or {}
ys or .MVC.Proxy = singletonClass("MVC.Proxy")
ys or .MVC.Proxy.__name = "MVC.Proxy"

ys or .MVC.Proxy.Ctor = function (slot0)
	return
end

ys or .MVC.Proxy.ActiveProxy = function (slot0)
	slot0.EventDispatcher.AttachEventDispatcher(slot0)
end

ys or .MVC.Proxy.DeactiveProxy = function (slot0)
	slot0.EventDispatcher.DetachEventDispatcher(slot0)
end

return
