slot0 = class("AutoSubCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.toggle

	PlayerPrefs.SetInt("autoSubIsAcitve", not slot2.isActiveSub and 1 or 0)
end

return slot0
