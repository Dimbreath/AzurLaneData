slot0 = class("FurnitureCard")

slot0.Ctor = function (slot0, slot1)
	slot0.go = slot1
	slot0.tr = slot1.transform
	slot0.dormMoneytxt = findTF(slot0.tr, "price/content/dorm_money/Text")
	slot0.gemtxt = findTF(slot0.tr, "price/content/gem/Text")
	slot0.lineTF = findTF(slot0.tr, "price/content/line")
	slot0.descTF = findTF(slot0.tr, "desc")
	slot0.nameTF = findTF(slot0.tr, "name/Text")
	slot0.iconTF = findTF(slot0.tr, "icon")
	slot0.maskTF = findTF(slot0.tr, "mask")
	slot0.maskLockTF = findTF(slot0.maskTF, "lock_bg/lock")
	slot0.maskBought = findTF(slot0.maskTF, "lock_bg/bought")
	slot0.countTF = findTF(slot0.tr, "count")
	slot0.countdownTF = findTF(slot0.tr, "countDown")
	slot0.countDownTm = slot0.countdownTF:Find("Text"):GetComponent(typeof(Text))
	slot0.tags = findTF(slot1, "tags")
end

slot0.update = function (slot0, slot1, slot2)
	slot0.furnitureVO = slot1

	if slot1 then
		slot3, slot4 = slot1:inTime()

		setActive(slot0.countdownTF, slot1:isTimeLimit() and slot3)

		if slot5 and slot3 then
			slot0:updateCountdown(slot4)
		else
			slot0:destoryTimer()
		end

		setActive(slot0.dormMoneytxt.parent, slot6)
		setActive(slot0.gemtxt.parent, slot1:canPurchaseByGem())
		setActive(slot0.lineTF, slot1:canPurchaseByDormMoeny() and slot7)
		setText(slot0.dormMoneytxt, slot1:getPrice(6))
		setText(slot0.gemtxt, slot1:getPrice(4))
		setText(slot0.descTF, i18n("word_comfort_level") .. "+" .. slot1:getConfig("comfortable"))
		setText(slot0.nameTF, slot1:getConfig("name"))
		setImageSprite(slot0.iconTF, GetSpriteFromAtlas("furnitureicon/" .. slot1:getConfig("icon"), ""))
		setActive(slot0.maskTF, (slot1:inTheme() and slot2.level < pg.backyard_theme_template[slot1:getConfig("themeId")].deblocking) or not slot1:canPurchase())
		setActive(slot0.maskLockTF, slot1.inTheme() and slot2.level < pg.backyard_theme_template[slot1.getConfig("themeId")].deblocking)
		setActive(slot0.maskBought, not (slot1.inTheme() and slot2.level < pg.backyard_theme_template[slot1.getConfig("themeId")].deblocking) and not slot1:canPurchase())

		if not IsNil(slot0.tags) then
			setActive(slot0.tags, true)
			setActive(slot0.tags:Find("tag_new"), slot1:getConfig("new") == 1)
			setActive(slot0.tags:Find("tag_discount"), slot1:isDisCount())

			if slot1.isDisCount() then
				setText(findTF(slot11, "Text"), slot1:getConfig("discount") .. "%off")
			end
		end

		if slot1:getConfig("count") > 1 then
			setText(slot0.countTF, slot1.count .. "/" .. slot10)
		else
			setText(slot0.countTF, "")
		end
	end
end

slot0.updateCountdown = function (slot0, slot1)
	slot0:destoryTimer()

	slot3 = pg.TimeMgr.GetInstance().Table2ServerTime(slot2, slot1)
	slot0.updateTimer = Timer.New(function ()
		if slot0 < slot0:GetServerTime() then
			slot2.countDownTm.text = ""

			"":destoryTimer()

			return
		end

		if slot1 - slot0 < 0 then
			slot1 = 0
		end

		if math.floor(slot1 / 86400) > 0 then
			slot2.countDownTm.text = i18n("time_remaining_tip") .. slot2 .. i18n("word_date")
		elseif math.floor(slot1 / 3600) > 0 then
			slot2.countDownTm.text = i18n("time_remaining_tip") .. slot3 .. i18n("word_hour")
		elseif math.floor(slot1 / 60) > 0 then
			slot2.countDownTm.text = i18n("time_remaining_tip") .. slot4 .. i18n("word_minute")
		else
			slot2.countDownTm.text = i18n("time_remaining_tip") .. slot1 .. i18n("word_second")
		end
	end, 1, -1)

	slot0.updateTimer:Start()
	slot0.updateTimer.func()
end

slot0.destoryTimer = function (slot0)
	if slot0.updateTimer then
		slot0.updateTimer:Stop()

		slot0.updateTimer = nil
	end
end

slot0.dispose = function (slot0)
	slot0:destoryTimer()
end

return slot0
