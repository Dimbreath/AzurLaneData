slot0 = class("ChargeCard")

function slot0.Ctor(slot0, slot1)
	slot0.go = slot1
	slot0.tr = tf(slot1)
	slot0.icon = slot0.tr:Find("item_icon")
	slot0.iconTF = slot0.icon:GetComponent(typeof(Image))
	slot0.tipTF = slot0.tr:Find("tip")
	slot0.tipText = slot0.tipTF:GetComponent(typeof(Text))
	slot0.count = slot0.tr:Find("count")
	slot0.resIcon = slot0.tr:Find("count/icon"):GetComponent(typeof(Image))
	slot0.resCount = slot0.tr:Find("count/Text"):GetComponent(typeof(Text))
	slot0.price = slot0.tr:Find("prince_bg/contain/Text"):GetComponent(typeof(Text))
	slot0.contain = slot0.tr:Find("prince_bg/contain")
	slot0.rmb = slot0.tr:Find("prince_bg/contain/icon_rmb")
	slot0.gem = slot0.tr:Find("prince_bg/contain/icon_gem")
	slot0.mask = slot0.tr:Find("mask")
	slot0.maskState = slot0.mask:Find("state")
	slot0.name = slot0.tr:Find("item_name")
	slot0.important = slot0.tr:Find("important")
	slot0.grid = slot0.tr:Find("important/grid")
	slot0.importantTip = slot0.tr:Find("important/tip")
	slot0.desc = slot0.tr:Find("desc")
	slot0.selfTpl = slot0.tr:Find("important/item")
	slot0.limitText = slot0.tr:Find("LimitText")
	slot0.countDown = slot0.tr:Find("countDown")
	slot0.countDownTm = slot0.countDown:Find("Text")
	slot0.tag = slot0.tr:Find("tag")
	slot0.tags = {}

	table.insert(slot0.tags, slot0.tr:Find("tag/hot"))
	table.insert(slot0.tags, slot0.tr:Find("tag/new"))
	table.insert(slot0.tags, slot0.tr:Find("tag/advice"))
	table.insert(slot0.tags, slot0.tr:Find("tag/double"))
	table.insert(slot0.tags, slot0.tr:Find("tag/activity"))
	table.insert(slot0.tags, slot0.tr:Find("tag/time"))
	table.insert(slot0.tags, slot0.tr:Find("tag/discount"))
	setActive(slot0.countDown, false)
end

function slot0.update(slot0, slot1, slot2, slot3)
	slot0.goods = slot1

	setActive(slot0.desc, true)
	setText(slot0.desc, "")
	setActive(slot0.rmb, slot1:isChargeType())
	setActive(slot0.gem, not slot1:isChargeType())
	setActive(slot0.icon, slot1:isChargeType())
	setActive(slot0.contain, true)
	setActive(slot0.countDown, false)

	if slot1:isChargeType() then
		slot0:updateCharge(slot1, slot2, slot3)
	else
		slot0:updateGemItem(slot1, slot2)
	end

	slot0:destoryTimer()
end

function slot0.updateCharge(slot0, slot1, slot2, slot3)
	setActive(slot0.tag, true)
	setActive(slot0.mask, false)
	setActive(slot0.maskState, false)

	slot0.tipText.text = ""

	setText(slot0.desc, "")
	setActive(slot0.tag, (((table.contains(slot3, slot1.id) or slot1:firstPayDouble()) and 4) or slot1:getConfig("tag")) > 0)

	if slot6 > 0 then
		for slot10, slot11 in ipairs(slot0.tags) do
			setActive(slot11, slot10 == slot6)
		end
	end

	setActive(slot0.resIcon, not slot1:isItemBox())
	setActive(slot0.resCount, not slot1:isItemBox())
	setActive(slot0.name, not slot1:isGem())
	setText(slot0.name, slot1:getConfig("name"))
	setActive(slot0.important, slot1:isItemBox() or slot1:isGiftBox())
	setActive(slot0.count, slot7 or slot1:isMonthCard())

	if slot1:isItemBox() or slot1:isGiftBox() then
		slot0:updateImport(slot1:getConfig("display"), slot1:getConfig("descrip"))
	end

	slot9 = slot1.buyCount
	slot10 = slot1:getLimitCount()

	if slot1:getConfig("limit_type") == 2 then
		setText(slot0.limitText, i18n("charge_limit_all", slot10 - slot9, slot10))
		setActive(slot0.mask, slot10 - slot9 <= 0)
	else
		setText(slot0.limitText, "")
	end

	if slot1:isMonthCard() then
		if slot2:getCardById(VipCard.MONTH) and not slot11:isExpire() then
			setActive(slot0.mask, (slot1:getConfig("limit_arg") or 0) < math.floor((slot11:getLeftDate() - pg.TimeMgr.GetInstance():GetServerTime()) / 86400))
			setText(slot0.limitText, i18n("charge_month_card_lefttime_tip", math.floor((slot11.getLeftDate() - pg.TimeMgr.GetInstance().GetServerTime()) / 86400)))
		end

		setText(slot0.desc, string.gsub(slot1:getConfig("descrip"), "$1", (slot4 and slot1:getConfig("gem")) or slot1:getConfig("extra_gem")))
	elseif slot1:isGiftBox() then
	elseif slot1:isGem() then
		setActive(slot0.tipTF, true)

		if slot5 then
			slot0.tipText.text = i18n("charge_double_gem_tip", slot1:getConfig("gem") * slot1:getConfig("first_pay_double"))
		elseif slot1:hasExtraGem() then
			slot0.tipText.text = i18n("charge_extra_gem_tip", slot1:getConfig("extra_gem"))
		else
			setActive(slot0.tipTF, false)
		end
	elseif slot1:isItemBox() then
	end

	slot0.resCount.text = "x" .. slot1:getConfig("gem")
	slot0.price.text = slot1:getConfig("money")
	slot0.iconTF.sprite = GetSpriteFromAtlas("chargeicon/1", "")

	LoadSpriteAsync("chargeicon/" .. slot1:getConfig("picture"), function (slot0)
		if slot0 then
			slot0.iconTF.sprite = slot0
		end
	end)
	setButtonEnabled(slot0.tr, not isActive(slot0.mask))
end

function slot0.updateGemItem(slot0, slot1, slot2)
	setActive(slot0.mask, false)
	setActive(slot0.maskState, false)
	setText(slot0.limitText, "")

	slot0.tipText.text = ""
	slot3 = slot1:getLimitCount()
	slot4 = slot1.buyCount or 0

	if slot3 > 0 then
		setText(slot0.limitText, i18n("charge_limit_all", slot3 - slot4, slot3))
		setActive(slot0.mask, slot3 <= slot4)
	end

	if slot1:getConfig("group_limit") > 0 then
		if (slot1:getConfig("group_type") or 0) == 1 then
			setText(slot0.limitText, i18n("charge_limit_daily", slot5 - slot1.groupCount, slot5))
		elseif slot6 == 2 then
			setText(slot0.limitText, i18n("charge_limit_weekly", slot5 - slot1.groupCount, slot5))
		end
	end

	slot0.price.text = slot1:getConfig("resource_num")
	slot0.tipText.text = ""

	setActive(slot0.count, false)
	setActive(slot0.icon, true)
	setText(slot0.desc, "")
	setActive(slot0.tag, slot1:getConfig("tag") > 0)

	if slot6 > 0 then
		for slot10, slot11 in ipairs(slot0.tags) do
			setActive(slot11, slot10 == slot6)
		end
	end

	setActive(slot0.name, true)

	if #slot1:getConfig("effect_args") > 0 then
		if pg.item_data_statistics[slot7[1]] then
			setText(slot0.name, slot8.name)
			slot0:updateImport(slot8.display_icon, slot8.display)
		end

		slot0.iconTF.sprite = GetSpriteFromAtlas("chargeicon/1", "")

		LoadSpriteAsync(slot8.icon, function (slot0)
			if slot0 then
				slot0.iconTF.sprite = slot0
			end
		end)
	end

	setButtonEnabled(slot0.tr, not isActive(slot0.mask))
end

function slot0.updateImport(slot0, slot1, slot2)
	setActive(slot0.important, true)

	slot3 = {}

	for slot7, slot8 in ipairs(slot1) do
		table.insert(slot3, {
			type = slot8[1],
			id = slot8[2],
			count = slot8[3]
		})
	end

	for slot7 = 1, slot0.grid.childCount, 1 do
		slot8 = slot0.grid:GetChild(slot7 - 1)

		if slot7 <= #slot3 then
			setActive(slot8, true)
			updateDrop(slot8, slot3[slot7])
		else
			setActive(slot8, false)
		end
	end

	setText(slot0.importantTip, string.gsub(slot2, "$1", #slot3))
end

function slot0.updateCountdown(slot0, slot1)
	slot2 = false

	if slot1 then
		slot3 = pg.TimeMgr.GetInstance()

		setActive(slot0.countDown, slot3:DiffDay(slot3:GetServerTime(), pg.TimeMgr.GetInstance():Table2ServerTime(slot1)) < 365)
		slot4()

		slot5 = pg.TimeMgr.GetInstance().Table2ServerTime(slot3, slot1)
		slot0.updateTimer = Timer.New(function ()
			if slot0 < slot0:GetServerTime() then
				slot2()
			end

			if slot1 - slot0 < 0 then
				slot1 = 0
			end

			if math.floor(slot1 / 86400) > 0 then
				setText(slot3.countDownTm, i18n("skin_remain_time") .. slot2 .. i18n("word_date"))
			elseif math.floor(slot1 / 3600) > 0 then
				setText(slot3.countDownTm, i18n("skin_remain_time") .. slot3 .. i18n("word_hour"))
			elseif math.floor(slot1 / 60) > 0 then
				setText(slot3.countDownTm, i18n("skin_remain_time") .. slot4 .. i18n("word_minute"))
			else
				setText(slot3.countDownTm, i18n("skin_remain_time") .. slot1 .. i18n("word_second"))
			end
		end, 1, -1)

		slot0.updateTimer:Start()
		slot0.updateTimer.func()

		return
	end
end

function slot0.destoryTimer(slot0)
	if slot0.updateTimer then
		slot0.updateTimer:Stop()

		slot0.updateTimer = nil
	end
end

return slot0
