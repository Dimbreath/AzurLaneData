slot0 = class("SettingsProxy", pm.Proxy)

slot0.onRegister = function (slot0)
	slot0._isBgmEnble = PlayerPrefs.GetInt("ShipSkinBGM", 1) > 0
	slot0._ShowBg = PlayerPrefs.GetInt("disableBG", 1) > 0
	slot0._ShowLive2d = PlayerPrefs.GetInt("disableLive2d", 1) > 0
	slot0._selectedShipId = PlayerPrefs.GetInt("playerShipId")
	slot0._backyardFoodRemind = PlayerPrefs.GetString("backyardRemind")
	slot0._userAgreement = PlayerPrefs.GetInt("userAgreement", 0) > 0
	slot0._showMaxLevelHelp = PlayerPrefs.GetInt("maxLevelHelp", 0) > 0
	slot0.nextTipAoutBattleTime = PlayerPrefs.GetInt("AutoBattleTip", 0)
	slot0._setFlagShip = PlayerPrefs.GetInt("setFlagShip", 0) > 0
	slot0._screenRatio = PlayerPrefs.GetFloat("SetScreenRatio", ADAPT_TARGET)
	NotchAdapt.CheckNotchRatio = slot0._screenRatio
	slot0.nextTipActBossExchangeTicket = nil

	slot0:resetEquipSceneIndex()
end

slot0.IsBGMEnable = function (slot0)
	return slot0._isBgmEnble
end

slot0.SetBgmFlag = function (slot0, slot1)
	if slot0._isBgmEnble ~= slot1 then
		slot0._isBgmEnble = slot1

		PlayerPrefs.SetInt("ShipSkinBGM", (slot1 and 1) or 0)
		PlayerPrefs.Save()
	end
end

slot0.getSkinPosSetting = function (slot0, slot1)
	if PlayerPrefs.HasKey(tostring(slot1) .. "_scale") then
		return PlayerPrefs.GetFloat(tostring(slot1) .. "_x", 0), PlayerPrefs.GetFloat(tostring(slot1) .. "_y", 0), PlayerPrefs.GetFloat(tostring(slot1) .. "_scale", 1)
	else
		return nil
	end
end

slot0.setSkinPosSetting = function (slot0, slot1, slot2, slot3, slot4)
	PlayerPrefs.SetFloat(tostring(slot1) .. "_x", slot2)
	PlayerPrefs.SetFloat(tostring(slot1) .. "_y", slot3)
	PlayerPrefs.SetFloat(tostring(slot1) .. "_scale", slot4)
	PlayerPrefs.Save()
end

slot0.resetSkinPosSetting = function (slot0, slot1)
	PlayerPrefs.DeleteKey(tostring(slot1) .. "_x")
	PlayerPrefs.DeleteKey(tostring(slot1) .. "_y")
	PlayerPrefs.DeleteKey(tostring(slot1) .. "_scale")
	PlayerPrefs.Save()
end

slot0.getCharacterSetting = function (slot0, slot1, slot2)
	return PlayerPrefs.GetInt(tostring(slot1) .. "_" .. slot2, 1) > 0
end

slot0.setCharacterSetting = function (slot0, slot1, slot2, slot3)
	PlayerPrefs.SetInt(tostring(slot1) .. "_" .. slot2, (slot3 and 1) or 0)
	PlayerPrefs.Save()
end

slot0.getCurrentSecretaryIndex = function (slot0)
	if PlayerPrefs.GetInt("currentSecretaryIndex", 1) > #getProxy(PlayerProxy):getData().characters then
		slot0:setCurrentSecretaryIndex(1)

		return 1
	else
		return slot1
	end
end

slot0.rotateCurrentSecretaryIndex = function (slot0)
	if #getProxy(PlayerProxy):getData().characters < PlayerPrefs.GetInt("currentSecretaryIndex", 1) + 1 then
		slot1 = 1
	end

	slot0:setCurrentSecretaryIndex(slot1)

	return slot1
end

slot0.setCurrentSecretaryIndex = function (slot0, slot1)
	PlayerPrefs.SetInt("currentSecretaryIndex", slot1)
	PlayerPrefs.Save()
end

slot0.SetFlagShip = function (slot0, slot1)
	if slot0._setFlagShip ~= slot1 then
		slot0._setFlagShip = slot1

		PlayerPrefs.SetInt("setFlagShip", (slot1 and 1) or 0)
		PlayerPrefs.Save()
	end
end

slot0.GetSetFlagShip = function (slot0)
	return slot0._setFlagShip
end

slot0.getUserAgreement = function (slot0)
	return slot0._userAgreement
end

slot0.setUserAgreement = function (slot0)
	if not slot0._userAgreement then
		PlayerPrefs.SetInt("userAgreement", 1)
		PlayerPrefs.Save()

		slot0._userAgreement = true
	end
end

slot0.IsLive2dEnable = function (slot0)
	return slot0._ShowLive2d
end

slot0.IsBGEnable = function (slot0)
	return slot0._ShowBg
end

slot0.SetSelectedShipId = function (slot0, slot1)
	if slot0._selectedShipId ~= slot1 then
		slot0._selectedShipId = slot1

		PlayerPrefs.SetInt("playerShipId", slot1)
		PlayerPrefs.Save()
	end
end

slot0.GetSelectedShipId = function (slot0)
	return slot0._selectedShipId
end

slot0.setEquipSceneIndex = function (slot0, slot1)
	slot0._equipSceneIndex = slot1
end

slot0.getEquipSceneIndex = function (slot0)
	return slot0._equipSceneIndex
end

slot0.resetEquipSceneIndex = function (slot0)
	slot0._equipSceneIndex = StoreHouseConst.WARP_TO_MATERIAL
end

slot0.setActivityLayerIndex = function (slot0, slot1)
	slot0._activityLayerIndex = slot1
end

slot0.getActivityLayerIndex = function (slot0)
	return slot0._activityLayerIndex
end

slot0.resetActivityLayerIndex = function (slot0)
	slot0._activityLayerIndex = 1
end

slot0.setBackyardRemind = function (slot0)
	if slot0._backyardFoodRemind ~= tostring(GetZeroTime()) then
		PlayerPrefs.SetString("backyardRemind", slot1)
		PlayerPrefs.Save()

		slot0._backyardFoodRemind = slot1
	end
end

slot0.getBackyardRemind = function (slot0)
	if not slot0._backyardFoodRemind or slot0._backyardFoodRemind == "" then
		return 0
	else
		return tonumber(slot0._backyardFoodRemind)
	end
end

slot0.getMaxLevelHelp = function (slot0)
	return slot0._showMaxLevelHelp
end

slot0.setMaxLevelHelp = function (slot0, slot1)
	if slot0._showMaxLevelHelp ~= slot1 then
		slot0._showMaxLevelHelp = slot1

		PlayerPrefs.SetInt("maxLevelHelp", (slot1 and 1) or 0)
		PlayerPrefs.Save()
	end
end

slot0.setStopBuildSpeedupRemind = function (slot0)
	slot0.isStopBuildSpeedupReamind = true
end

slot0.getStopBuildSpeedupRemind = function (slot0)
	return slot0.isStopBuildSpeedupReamind
end

slot0.checkReadHelp = function (slot0, slot1)
	if not getProxy(PlayerProxy):getData() then
		return true
	end

	if slot1 == "help_backyard" then
		return true
	elseif pg.SeriesGuideMgr.GetInstance():isEnd() then
		slot4 = PlayerPrefs.GetInt(slot1, 0)

		return PlayerPrefs.GetInt(slot1, 0) > 0
	end

	return true
end

slot0.recordReadHelp = function (slot0, slot1)
	PlayerPrefs.SetInt(slot1, 1)
	PlayerPrefs.Save()
end

slot0.clearAllReadHelp = function (slot0)
	PlayerPrefs.DeleteKey("tactics_lesson_system_introduce")
	PlayerPrefs.DeleteKey("help_shipinfo_equip")
	PlayerPrefs.DeleteKey("help_shipinfo_detail")
	PlayerPrefs.DeleteKey("help_shipinfo_intensify")
	PlayerPrefs.DeleteKey("help_shipinfo_upgrate")
	PlayerPrefs.DeleteKey("help_backyard")
	PlayerPrefs.DeleteKey("has_entered_class")
	PlayerPrefs.DeleteKey("help_commander_info")
	PlayerPrefs.DeleteKey("help_commander_play")
	PlayerPrefs.DeleteKey("help_commander_ability")
end

slot0.setAoutBattleTip = function (slot0)
	slot0.nextTipAoutBattleTime = GetZeroTime()

	PlayerPrefs.SetInt("AutoBattleTip", GetZeroTime())
	PlayerPrefs.Save()
end

slot0.isTipAutoBattle = function (slot0)
	return slot0.nextTipAoutBattleTime < pg.TimeMgr.GetInstance():GetServerTime()
end

slot0.setActBossExchangeTicketTip = function (slot0, slot1)
	slot0.nextTipActBossExchangeTicket = slot1
end

slot0.isTipActBossExchangeTicket = function (slot0)
	return slot0.nextTipActBossExchangeTicket
end

slot0.SetScreenRatio = function (slot0, slot1)
	if slot0._screenRatio ~= slot1 then
		slot0._screenRatio = slot1

		PlayerPrefs.SetFloat("SetScreenRatio", slot1)
		PlayerPrefs.Save()
	end
end

slot0.GetScreenRatio = function (slot0)
	return slot0._screenRatio
end

slot0.CheckLargeScreen = function (slot0)
	return Screen.width / Screen.height > 2
end

return slot0
