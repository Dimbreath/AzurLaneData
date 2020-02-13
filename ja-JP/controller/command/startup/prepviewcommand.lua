class("PrepViewCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot0.facade:registerMediator(GameMediator.New())
end

return class("PrepViewCommand", pm.SimpleCommand)
