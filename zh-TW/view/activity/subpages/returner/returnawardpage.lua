slot0 = class("ReturnAwardPage", import("....base.BaseActivityPage"))
slot0.INVITER = 1
slot0.RETURNER = 2

function slot0.SetUIName(slot0, slot1)
	slot4.class = InviterPage
	slot3[1] = {
		ui = "ReturnAwardPage"
	}
	slot4.class = ReturnerPage
	slot3[2] = {
		ui = "ReturnAward4RetrunerPage"
	}
	uv0.PAGES = {}
	slot0._uiName = uv0.PAGES[math.max(getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RETURN_AWARD).data1, 1)].ui
end

function slot0.OnFirstFlush(slot0)
	slot1 = slot0.activity
	slot2 = uv0.PAGES[slot1.data1]

	print(slot2.class)
	print(slot1.data1)

	slot0.page = slot2.class.New(slot0._tf, slot0._event)

	onButton(slot0, slot0.page.help, function ()
		slot2.type = MSGBOX_TYPE_HELP
		slot2.helps = pg.gametip.returner_help.tip

		pg.MsgboxMgr.GetInstance():ShowMsgBox({})
	end)
end

function slot0.OnUpdateFlush(slot0)
	slot0.page:Update(slot0.activity)
end

function slot0.OnDestroy(slot0)
	slot0.page:Dispose()
end

return slot0
