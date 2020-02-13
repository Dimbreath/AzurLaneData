slot0 = class("SiChuanOperaPage", import(".TemplatePage.LoginTemplatePage"))

function slot0.OnInit(slot0)
	slot0.super.OnInit(slot0)

	slot0.dayText = slot0:findTF("AD/DayText")
	slot0.url = slot0:findTF("AD/url")
end

function slot0.OnFirstFlush(slot0)
	slot0.super.OnFirstFlush(slot0)
	onButton(slot0, slot0.url, function ()
		Application.OpenURL(slot0.activity:getConfig("config_client"))
	end, SFX_PANEL)
end

function slot0.OnUpdateFlush(slot0)
	slot0.super.OnUpdateFlush(slot0)
	setText(slot0.dayText, string.format("%02d", slot0.nday))
end

return slot0
