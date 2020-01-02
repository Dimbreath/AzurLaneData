class("StartupCommand", pm.MacroCommand).initializeMacroCommand = function (slot0)
	slot0:addSubCommand(PrepControllerCommand)
	slot0:addSubCommand(PrepModelCommand)
	slot0:addSubCommand(PrepViewCommand)
end

return class("StartupCommand", pm.MacroCommand)
