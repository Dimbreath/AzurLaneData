slot0 = class("SettingsProxy", pm.Proxy)

function slot0.onRegister(slot0)
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

	slot0._isShowCollectionHelp = PlayerPrefs.GetInt("collection_Help", 0) > 0
end

function slot0.GetDockYardLockBtnFlag(slot0)
	if not slot0.dockYardLockFlag then
		slot0.dockYardLockFlag = PlayerPrefs.GetInt("DockYardLockFlag" .. slot1, 0) > 0
	end

	return slot0.dockYardLockFlag
end

function slot0.SetDockYardLockBtnFlag(slot0, slot1)
	if slot0.dockYardLockFlag ~= slot1 then
		PlayerPrefs.SetInt("DockYardLockFlag" .. getProxy(PlayerProxy):getRawData().id, (slot1 and 1) or 0)
		PlayerPrefs.Save()
	end
end

function slot0.GetDockYardLevelBtnFlag(slot0)
	if not slot0.dockYardLevelFlag then
		slot0.dockYardLevelFlag = PlayerPrefs.GetInt("DockYardLevelFlag" .. slot1, 0) > 0
	end

	return slot0.dockYardLevelFlag
end

function slot0.SetDockYardLevelBtnFlag(slot0, slot1)
	if slot0.dockYardLevelFlag ~= slot1 then
		PlayerPrefs.SetInt("DockYardLevelFlag" .. getProxy(PlayerProxy):getRawData().id, (slot1 and 1) or 0)
		PlayerPrefs.Save()
	end
end

function slot0.IsShowCollectionHelp(slot0)
	return slot0._isShowCollectionHelp
end

function slot0.SetCollectionHelpFlag(slot0, slot1)
	if slot0._isShowCollectionHelp ~= slot1 then
		slot0._isShowCollectionHelp = slot1

		PlayerPrefs.SetInt("collection_Help", (slot1 and 1) or 0)
		PlayerPrefs.Save()
	end
end

function slot0.IsBGMEnable(slot0)
	return slot0._isBgmEnble
end

function slot0.SetBgmFlag(slot0, slot1)
	if slot0._isBgmEnble ~= slot1 then
		slot0._isBgmEnble = slot1

		PlayerPrefs.SetInt("ShipSkinBGM", (slot1 and 1) or 0)
		PlayerPrefs.Save()
	end
end

function slot0.getSkinPosSetting(slot0, slot1)
	if PlayerPrefs.HasKey(tostring(slot1) .. "_scale") then
		return PlayerPrefs.GetFloat(tostring(slot1) .. "_x", 0), PlayerPrefs.GetFloat(tostring(slot1) .. "_y", 0), PlayerPrefs.GetFloat(tostring(slot1) .. "_scale", 1)
	else
		return nil
	end
end

function slot0.setSkinPosSetting(slot0, slot1, slot2, slot3, slot4)
	PlayerPrefs.SetFloat(tostring(slot1) .. "_x", slot2)
	PlayerPrefs.SetFloat(tostring(slot1) .. "_y", slot3)
	PlayerPrefs.SetFloat(tostring(slot1) .. "_scale", slot4)
	PlayerPrefs.Save()
end

function slot0.resetSkinPosSetting(slot0, slot1)
	PlayerPrefs.DeleteKey(tostring(slot1) .. "_x")
	PlayerPrefs.DeleteKey(tostring(slot1) .. "_y")
	PlayerPrefs.DeleteKey(tostring(slot1) .. "_scale")
	PlayerPrefs.Save()
end

function slot0.getCharacterSetting(slot0, slot1, slot2)
	return PlayerPrefs.GetInt(tostring(slot1) .. "_" .. slot2, 1) > 0
end

function slot0.setCharacterSetting(slot0, slot1, slot2, slot3)
	PlayerPrefs.SetInt(tostring(slot1) .. "_" .. slot2, (slot3 and 1) or 0)
	PlayerPrefs.Save()
end

function slot0.getCurrentSecretaryIndex(slot0)
	if PlayerPrefs.GetInt("currentSecretaryIndex", 1) > #getProxy(PlayerProxy):getData().characters then
		slot0:setCurrentSecretaryIndex(1)

		return 1
	else
		return slot1
	end
end

function slot0.rotateCurrentSecretaryIndex(slot0)
	if #getProxy(PlayerProxy):getData().characters < PlayerPrefs.GetInt("currentSecretaryIndex", 1) + 1 then
		slot1 = 1
	end

	slot0:setCurrentSecretaryIndex(slot1)

	return slot1
end

function slot0.setCurrentSecretaryIndex(slot0, slot1)
	PlayerPrefs.SetInt("currentSecretaryIndex", slot1)
	PlayerPrefs.Save()
end

function slot0.SetFlagShip(slot0, slot1)
	if slot0._setFlagShip ~= slot1 then
		slot0._setFlagShip = slot1

		PlayerPrefs.SetInt("setFlagShip", (slot1 and 1) or 0)
		PlayerPrefs.Save()
	end
end

function slot0.GetSetFlagShip(slot0)
	return slot0._setFlagShip
end

function slot0.getUserAgreement(slot0)
	return slot0._userAgreement
end

function slot0.setUserAgreement(slot0)
	if not slot0._userAgreement then
		PlayerPrefs.SetInt("userAgreement", 1)
		PlayerPrefs.Save()

		slot0._userAgreement = true
	end
end

function slot0.IsLive2dEnable(slot0)
	return slot0._ShowLive2d
end

function slot0.IsBGEnable(slot0)
	return slot0._ShowBg
end

function slot0.SetSelectedShipId(slot0, slot1)
	if slot0._selectedShipId ~= slot1 then
		slot0._selectedShipId = slot1

		PlayerPrefs.SetInt("playerShipId", slot1)
		PlayerPrefs.Save()
	end
end

function slot0.GetSelectedShipId(slot0)
	return slot0._selectedShipId
end

function slot0.setEquipSceneIndex(slot0, slot1)
	slot0._equipSceneIndex = slot1
end

function slot0.getEquipSceneIndex(slot0)
	return slot0._equipSceneIndex
end

function slot0.resetEquipSceneIndex(slot0)
	slot0._equipSceneIndex = StoreHouseConst.WARP_TO_MATERIAL
end

function slot0.setActivityLayerIndex(slot0, slot1)
	slot0._activityLayerIndex = slot1
end

function slot0.getActivityLayerIndex(slot0)
	return slot0._activityLayerIndex
end

function slot0.resetActivityLayerIndex(slot0)
	slot0._activityLayerIndex = 1
end

function slot0.setBackyardRemind(slot0)
	if slot0._backyardFoodRemind ~= tostring(GetZeroTime()) then
		PlayerPrefs.SetString("backyardRemind", slot1)
		PlayerPrefs.Save()

		slot0._backyardFoodRemind = slot1
	end
end

function slot0.getBackyardRemind(slot0)
	if not slot0._backyardFoodRemind or slot0._backyardFoodRemind == "" then
		return 0
	else
		return tonumber(slot0._backyardFoodRemind)
	end
end

function slot0.getMaxLevelHelp(slot0)
	return slot0._showMaxLevelHelp
end

function slot0.setMaxLevelHelp(slot0, slot1)
	if slot0._showMaxLevelHelp ~= slot1 then
		slot0._showMaxLevelHelp = slot1

		PlayerPrefs.SetInt("maxLevelHelp", (slot1 and 1) or 0)
		PlayerPrefs.Save()
	end
end

function slot0.setStopBuildSpeedupRemind(slot0)
	slot0.isStopBuildSpeedupReamind = true
end

function slot0.getStopBuildSpeedupRemind(slot0)
	return slot0.isStopBuildSpeedupReamind
end

function slot0.checkReadHelp(slot0, slot1)
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

function slot0.recordReadHelp(slot0, slot1)
	PlayerPrefs.SetInt(slot1, 1)
	PlayerPrefs.Save()
end

function slot0.clearAllReadHelp(slot0)
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

function slot0.setAoutBattleTip(slot0)
	slot0.nextTipAoutBattleTime = GetZeroTime()

	PlayerPrefs.SetInt("AutoBattleTip", GetZeroTime())
	PlayerPrefs.Save()
end

function slot0.isTipAutoBattle(slot0)
	return slot0.nextTipAoutBattleTime < pg.TimeMgr.GetInstance():GetServerTime()
end

function slot0.setActBossExchangeTicketTip(slot0, slot1)
	slot0.nextTipActBossExchangeTicket = slot1
end

function slot0.isTipActBossExchangeTicket(slot0)
	return slot0.nextTipActBossExchangeTicket
end

function slot0.SetScreenRatio(slot0, slot1)
	if slot0._screenRatio ~= slot1 then
		slot0._screenRatio = slot1

		PlayerPrefs.SetFloat("SetScreenRatio", slot1)
		PlayerPrefs.Save()
	end
end

function slot0.GetScreenRatio(slot0)
	return slot0._screenRatio
end

function slot0.CheckLargeScreen(slot0)
	return Screen.width / Screen.height > 2
end

function slot0.IsShowBeatMonseterNianCurtain(slot0)
	return tonumber(PlayerPrefs.GetString("HitMonsterNianLayer2020" .. getProxy(PlayerProxy):getRawData().id, "0")) < pg.TimeMgr.GetInstance():GetServerTime()
end

function slot0.SetBeatMonseterNianFlag(slot0)
	PlayerPrefs.SetString("HitMonsterNianLayer2020" .. getProxy(PlayerProxy):getRawData().id, GetZeroTime())
	PlayerPrefs.Save()
end

return slot0
