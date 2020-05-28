slot0 = class("ItemShowPanel", BaseSubPanel)

function slot0.GetUIName(slot0)
	return "ItemChangeNoticeBox"
end

function slot0.Load(slot0)
	if slot0._state ~= uv0.STATES.NONE then
		return
	end

	slot0._state = uv0.STATES.LOADING

	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetUI(slot0:GetUIName(), false, function (slot0)
		uv0:Loaded(slot0)
		uv0:Init()
	end)
end

function slot0.UpdateView(slot0, slot1)
	slot0:PreRefresh(slot1)

	rtf(slot0.viewParent._window).sizeDelta = Vector2.New(1000, 638)

	slot0:PostRefresh(slot1)
end

function slot0.PreRefresh(slot0, slot1)
	slot0.viewParent:commonSetting(slot1)
	slot0:Show()
end

function slot0.PostRefresh(slot0, slot1)
	slot0.viewParent:Loaded(slot1)
end

return slot0
