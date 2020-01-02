class("PrepModelCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot0.facade:registerProxy(ContextProxy.New({}))
	slot0.facade:registerProxy(ServerProxy.New({}))
	slot0.facade:registerProxy(UserProxy.New())
	slot0.facade:registerProxy(GatewayNoticeProxy.New())
	slot0.facade:registerProxy(SettingsProxy.New())
end

return class("PrepModelCommand", pm.SimpleCommand)
