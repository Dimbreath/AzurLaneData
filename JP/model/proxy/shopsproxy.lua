slot0 = class("ShopsProxy", import(".NetProxy"))
slot0.MERITOROUS_SHOP_UPDATED = "ShopsProxy:MERITOROUS_SHOP_UPDATED"
slot0.SHOPPINGSTREET_UPDATE = "ShopsProxy:SHOPPINGSTREET_UPDATE"
slot0.FIRST_CHARGE_IDS_UPDATED = "ShopsProxy:FIRST_CHARGE_IDS_UPDATED"
slot0.CHARGED_LIST_UPDATED = "ShopsProxy:CHARGED_LIST_UPDATED"
slot0.NORMAL_LIST_UPDATED = "ShopsProxy:NORMAL_LIST_UPDATED"
slot0.NORMAL_GROUP_LIST_UPDATED = "ShopsProxy:NORMAL_GROUP_LIST_UPDATED"
slot0.ACTIVITY_SHOP_UPDATED = "ShopsProxy:ACTIVITY_SHOP_UPDATED"
slot0.GUILD_SHOP_ADDED = "ShopsProxy:GUILD_SHOP_ADDED"
slot0.GUILD_SHOP_UPDATED = "ShopsProxy:GUILD_SHOP_UPDATED"
slot0.ACTIVITY_SHOPS_UPDATED = "ShopsProxy:ACTIVITY_SHOPS_UPDATED"
slot0.SHAM_SHOP_UPDATED = "SHAM_SHOP_UPDATED"
slot0.FRAGMENT_SHOP_UPDATED = "FRAGMENT_SHOP_UPDATED"

function slot0.register(slot0)
	slot0.shopStreet = nil
	slot0.meritorousShop = nil
	slot0.guildShop = nil

	slot0:on(22102, function (slot0)
		getProxy(ShopsProxy):setShopStreet(ShoppingStreet.New(slot0.street), true)
	end)
	slot0:on(60034, function (slot0)
		slot1 = GuildShop.New(slot0.info)

		if slot0.guildShop then
			slot0:updateGuildShop(slot1, true)
		else
			slot0:setGuildShop(slot1)
		end
	end)

	slot0.shamShop = ShamBattleShop.New()
	slot0.fragmentShop = FragmentShop.New()

	slot0:on(16200, function (slot0)
		slot0.shamShop:update(pg.TimeMgr.GetInstance():STimeDescS(pg.TimeMgr.GetInstance():GetServerTime(), "*t").month, slot0.core_shop_list)
		slot0.fragmentShop:update(pg.TimeMgr.GetInstance().STimeDescS(pg.TimeMgr.GetInstance().GetServerTime(), "*t").month, slot0.blue_shop_list)
	end)

	slot0.timers = {}
end

function slot0.setShopStreet(slot0, slot1, slot2)
	slot0.shopStreet = slot1

	slot0:sendNotification(slot0.SHOPPINGSTREET_UPDATE, {
		shopStreet = Clone(slot0.shopStreet),
		reset = slot2
	})
end

function slot0.getShopStreet(slot0)
	return Clone(slot0.shopStreet)
end

function slot0.getMeritorousShop(slot0)
	return Clone(slot0.meritorousShop)
end

function slot0.addMeritorousShop(slot0, slot1)
	slot0.meritorousShop = slot1
end

function slot0.updateMeritorousShop(slot0, slot1)
	slot0.meritorousShop = slot1

	slot0:sendNotification(slot0.MERITOROUS_SHOP_UPDATED, Clone(slot1))
end

function slot0.setNormalList(slot0, slot1)
	slot0.normalList = slot1 or {}
end

function slot0.GetNormalList(slot0)
	return Clone(slot0.normalList)
end

function slot0.GetNormalByID(slot0, slot1)
	if not slot0.normalList then
		slot0.normalList = {}
	end

	slot0.normalList[slot1] = slot0.normalList[slot1] or Goods.New({
		buyCount = 0,
		id = slot1
	}, Goods.TYPE_GIFT_PACKAGE)

	return slot0.normalList[slot1]
end

function slot0.updateNormalByID(slot0, slot1)
	slot0.normalList[slot1.id] = slot1
end

function slot0.setNormalGroupList(slot0, slot1)
	slot0.normalGroupList = slot1
end

function slot0.GetNormalGroupList(slot0)
	return slot0.normalGroupList
end

function slot0.updateNormalGroupList(slot0, slot1, slot2)
	if slot1 <= 0 then
		return
	end

	for slot6, slot7 in ipairs(slot0.normalGroupList) do
		if slot7.shop_id == slot1 then
			slot0.normalGroupList[slot6].pay_count = (slot0.normalGroupList[slot6].pay_count or 0) + slot2

			return
		end
	end

	table.insert(slot0.normalGroupList, {
		shop_id = slot1,
		pay_count = slot2
	})
end

function slot0.addActivityShops(slot0, slot1)
	slot0.activityShops = slot1

	slot0:sendNotification(slot0.ACTIVITY_SHOPS_UPDATED)
end

function slot0.getActivityShopById(slot0, slot1)
	return slot0.activityShops[slot1]
end

function slot0.updateActivityShop(slot0, slot1, slot2)
	slot0.activityShops[slot1] = slot2

	slot0:sendNotification(slot0.ACTIVITY_SHOP_UPDATED, {
		activityId = slot1,
		shop = slot2:clone()
	})
end

function slot0.getActivityShops(slot0)
	return slot0.activityShops
end

function slot0.setFirstChargeList(slot0, slot1)
	slot0.firstChargeList = slot1

	slot0:sendNotification(slot0.FIRST_CHARGE_IDS_UPDATED, Clone(slot1))
end

function slot0.getFirstChargeList(slot0)
	return Clone(slot0.firstChargeList)
end

function slot0.setChargedList(slot0, slot1)
	slot0.chargeList = slot1

	slot0:sendNotification(slot0.CHARGED_LIST_UPDATED, Clone(slot1))
end

function slot0.getChargedList(slot0)
	return Clone(slot0.chargeList)
end

slot1 = 3
slot2 = 10

function slot0.chargeFailed(slot0, slot1, slot2)
	if not slot0.timers[slot1] then
		pg.UIMgr.GetInstance():LoadingOn()

		slot0.timers[slot1] = Timer.New(function ()
			if slot0.timers[slot1].loop == 1 then
				pg.UIMgr.GetInstance():LoadingOff()
			end

			PaySuccess(slot1, slot2)
		end, slot0, slot1)

		slot0.timers[slot1]:Start()
	end
end

function slot0.removeChargeTimer(slot0, slot1)
	if slot0.timers[slot1] then
		pg.UIMgr.GetInstance():LoadingOff()
		slot0.timers[slot1]:Stop()

		slot0.timers[slot1] = nil
	end
end

function slot0.addWaitTimer(slot0)
	pg.UIMgr.GetInstance():LoadingOn()

	slot0.waitBiliTimer = Timer.New(function ()
		slot0:removeWaitTimer()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = i18n("charge_time_out")
		})
	end, 25, 1)

	slot0.waitBiliTimer:Start()
end

function slot0.removeWaitTimer(slot0)
	if slot0.waitBiliTimer then
		pg.UIMgr.GetInstance():LoadingOff()
		slot0.waitBiliTimer:Stop()

		slot0.waitBiliTimer = nil
	end
end

function slot0.setGuildShop(slot0, slot1)
	slot0.guildShop = slot1

	slot0:addGuildShopRefreshTimer()
	slot0:sendNotification(slot0.GUILD_SHOP_ADDED, slot0.guildShop)
end

function slot0.addGuildShopRefreshTimer(slot0)
	if slot0.guildShopTimer then
		slot0.guildShopTimer:Stop()

		slot0.guildShopTimer = nil
	end

	if slot0.guildShop.nextRefreshTime - pg.TimeMgr.GetInstance():GetServerTime() + 1 > 0 then
		slot0.guildShopTimer = Timer.New(function ()
			slot0.guildShopTimer:Stop()

			slot0.guildShopTimer.Stop.guildShopTimer = nil

			slot0.guildShopTimer.Stop:sendNotification(GAME.GET_GUILD_SHOP, {
				type = GuildShop.AUTO_REFRESH
			})
		end, slot1, 1)
	else
		slot0:sendNotification(GAME.GET_GUILD_SHOP, {
			type = GuildShop.AUTO_REFRESH
		})
	end

	slot0.guildShopTimer:Start()
end

function slot0.getGuildShop(slot0)
	return slot0.guildShop
end

function slot0.updateGuildShop(slot0, slot1, slot2)
	slot0.guildShop = slot1

	slot0:sendNotification(slot0.GUILD_SHOP_UPDATED, {
		shop = slot0.guildShop,
		reset = slot2
	})
end

function slot0.updateShamShop(slot0, slot1)
	slot0.shamShop = slot1

	slot0:sendNotification(slot0.SHAM_SHOP_UPDATED, slot1)
end

function slot0.getShamShop(slot0)
	return slot0.shamShop
end

function slot0.updateFragmentShop(slot0, slot1)
	slot0.fragmentShop = slot1

	slot0:sendNotification(slot0.FRAGMENT_SHOP_UPDATED, slot1)
end

function slot0.getFragmentShop(slot0)
	return slot0.fragmentShop
end

function slot0.remove(slot0)
	for slot4, slot5 in pairs(slot0.timers) do
		slot5:Stop()
	end

	slot0.timers = nil

	if slot0.guildShopTimer then
		slot0.guildShopTimer:Stop()

		slot0.guildShopTimer = nil
	end

	slot0:removeWaitTimer()
end

return slot0
