class("ShipExpMediator", import("..base.ContextMediator")).register = function (slot0)
	slot0.contextData.type = slot0.contextData.type or ShipExpLayer.TypeDefault
end

return class("ShipExpMediator", import("..base.ContextMediator"))
