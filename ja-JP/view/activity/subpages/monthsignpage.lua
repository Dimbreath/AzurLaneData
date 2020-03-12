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

	if tonumber(pg.TimeMgr.GetInstance():STimeDescS(pg.TimeMgr.GetInstance():GetServerTime(), "%m")) == pg.activity_template[ActivityConst.MONTH_SIGN_ACTIVITY_ID].config_client[1] then
		slot0.specialTag = true
		slot0.specialDay = pg.activity_template[ActivityConst.MONTH_SIGN_ACTIVITY_ID].config_client[2]
		slot0.isShowFrame = pg.activity_template[ActivityConst.MONTH_SIGN_ACTIVITY_ID].config_client[3]
	end
end

function slot0.OnFirstFlush(slot0)
	slot1 = pg.TimeMgr.GetInstance():GetServerTime()

	if slot0.specialTag then
	else
		LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
	end

	slot0.list = UIItemList.New(slot0.items, slot0.item)

	slot0.list:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			updateDrop(slot2, _.map(slot0.config["day" .. slot3], function (slot0)
				return {
					type = slot0[1],
					id = slot0[2],
					count = slot0[3]
				}
			end)[1])
			onButton(slot0, slot2, function ()
				if #slot0 == 1 then
					slot1:emit(BaseUI.ON_DROP, slot0[1])
				else
					slot1:emit(BaseUI.ON_DROP_LIST, {
						content = "",
						item2Row = true,
						itemList = slot1.emit
					})
				end
			end, SFX_PANEL)
			setText(slot2:Find("day/Text"), "Day " .. slot3)
			setActive(slot2:Find("got"), slot1 + 1 <= #slot0.activity.data1_list)
			setActive(slot2:Find("today"), slot3 == #slot0.activity.data1_list)

			if slot0.specialTag and slot3 == slot0.specialDay then
				slot5 = slot0:findTF("icon_bg/SpecialFrame", slot2)

				if slot0.isShowFrame == 1 then
					setActive(slot5, false)
				else
					setActive(slot5, true)
				end
			end
		end
	end)
end

function slot0.OnUpdateFlush(slot0)
	slot0.list:align(slot0.monthDays)

	if slot0.specialTag then
		slot1 = slot0:findTF("DayNumText")

		if slot0.specialDay - #slot0.activity.data1_list < 0 then
			slot2 = 0
		end

		setText(slot1, slot2)

		GetComponent(slot3, "Slider").value = #slot0.activity.data1_list
	end
end

function slot0.OnDestroy(slot0)
	removeAllChildren(slot0.items)
end

return slot0
