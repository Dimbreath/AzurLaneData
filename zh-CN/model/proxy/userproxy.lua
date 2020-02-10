slot0 = class("UserProxy", import(".NetProxy"))

function slot0.setLastLogin(slot0, slot1)
	if slot1.type == 1 then
		PlayerPrefs.SetString("user.type", "1")
		PlayerPrefs.SetString("user.arg1", slot1.arg1)
		PlayerPrefs.SetString("user.arg2", slot1.arg2)
		PlayerPrefs.SetString("user.arg3", slot1.arg3)
	elseif slot1.type == 2 then
		PlayerPrefs.SetString("user.type", "1")
		PlayerPrefs.SetString("user.arg1", "yongshi")
		PlayerPrefs.SetString("user.arg2", slot1.arg1)
		PlayerPrefs.SetString("user.arg3", slot1.token)
	elseif slot1.type == 3 then
		PlayerPrefs.SetString("user.type", "3")
		PlayerPrefs.SetString("user.arg1", slot1.arg1)
		PlayerPrefs.SetString("user.arg2", "")
		PlayerPrefs.SetString("user.arg3", "")
		PlayerPrefs.SetString("guest_uuid", slot1.arg1)
	end

	PlayerPrefs.Save()

	slot0.data = slot1:clone()

	slot0.data:display("logged in")
end

function slot0.getLastLoginUser(slot0)
	slot1 = tonumber(PlayerPrefs.GetString("user.type"))
	slot3 = PlayerPrefs.GetString("user.arg2")

	print("last login:", slot1, " arg1:", PlayerPrefs.GetString("user.arg1"))

	if slot1 ~= "" and slot2 ~= "" and slot3 ~= "" then
		return User.New({
			type = slot1,
			arg1 = slot2,
			arg2 = slot3,
			arg3 = PlayerPrefs.GetString("user.arg3")
		})
	end

	return nil
end

function slot0.saveTranscode(slot0, slot1)
	PlayerPrefs.SetString("transcode", slot1)
	PlayerPrefs.Save()
end

function slot0.getTranscode(slot0)
	if PlayerPrefs.GetString("transcode") then
		return slot1
	end

	return ""
end

function slot0.clearTranscode(slot0)
	PlayerPrefs.DeleteKey("transcode")
end

return slot0
