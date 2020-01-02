class("GatewayNotice", import(".Notice")).prefKey = function (slot0)
	return "GatewayNotice" .. slot0.id
end

return class("GatewayNotice", import(".Notice"))
