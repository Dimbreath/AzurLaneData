slot0 = class("MonthSignPage", import("...base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("bg")
	slot0.items = slot0:findTF("items")
	slot0.item = slot0:findTF("item", slot0.items)
end

function slot0.OnDataSetting(slot0)
	slot0.config = pg.activity_month_sign[slot0.activity.data2]

	if not slot0.config then
		return true
	end

	slot0.monthDays = pg.TimeMgr.GetInstance():CalcMonthDays(slot0.activity.data1, slot0.activity.data2)

	if tonumber(pg.TimeMgr.GetInstance():CTimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%m")) == pg.activity_template[ActivityConst.MONTH_SIGN_ACTIVITY_ID].config_client[1] then
		slot0.specialTag = true
		slot0.specialDay = pg.activity_template[ActivityConst.MONTH_SIGN_ACTIVITY_ID].config_client[2]
		slot0.isShowFrame = pg.activity_template[ActivityConst.MONTH_SIGN_ACTIVITY_ID].config_client[3]
	end
end

function slot0.OnFirstFlush(slot0)
	slot1 = pg.TimeMgr.GetInstance():GetServerTime()

	if slot0.specialTag then
		-- Nothing
	else
		LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
	end

	slot0.list = UIItemList.New(slot0.items, slot0.item)

	slot0.list:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = slot1 + 1

			updateDrop(slot2, _.map(uv0.config["day" .. slot3], function (slot0)
				slot1.type = slot0[1]
				slot1.id = slot0[2]
				slot1.count = slot0[3]

				return {}
			end)[1])
			onButton(uv0, slot2, function ()
				if #uv0 == 1 then
					uv1:emit(BaseUI.ON_DROP, uv0[1])
				else
					slot3.itemList = uv0

					uv1:emit(BaseUI.ON_DROP_LIST, {
						content = "",
						item2Row = true
					})
				end
			end, SFX_PANEL)
			setText(slot2:Find("day/Text"), "Day " .. slot3)
			setActive(slot2:Find("got"), slot3 <= #uv0.activity.data1_list)
			setActive(slot2:Find("today"), slot3 == #uv0.activity.data1_list)

			if uv0.specialTag and slot3 == uv0.specialDay then
				if uv0.isShowFrame == 1 then
					setActive(uv0:findTF("icon_bg/SpecialFrame", slot2), false)
				else
					setActive(slot5, true)
				end
			end
		end
	end)
end

function slot0.OnUpdateFlush(slot0)
	if pg.TimeMgr.GetInstance():GetServerTime() < 1572537600 then
		slot0.monthDays = 28
	end

	slot0.list:align(slot0.monthDays)

	if slot0.specialTag then
		slot1 = slot0:findTF("DayNumText")

		if slot0.specialDay - #slot0.activity.data1_list < 0 then
			slot2 = 0
		end

		setText(slot1, slot2)

		GetComponent(slot0:findTF("ProgressBar"), "Slider").value = #slot0.activity.data1_list
	end
end

function slot0.OnDestroy(slot0)
	removeAllChildren(slot0.items)
end

return slot0
