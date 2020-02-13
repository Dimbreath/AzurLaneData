class("AutoSubCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().toggle

	PlayerPrefs.SetInt("autoSubIsAcitve", (not slot1.getBody().isActiveSub and 1) or 0)
end

return class("AutoSubCommand", pm.SimpleCommand)
