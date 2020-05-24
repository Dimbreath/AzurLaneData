slot0 = class("BackYardSelfThemeTemplate", import(".BackYardBaseThemeTemplate"))

function slot0.GetType(slot0)
	return BackYardConst.THEME_TEMPLATE_USAGE_TYPE_SELF
end

function slot0.IsCollected(slot0)
	return true
end

function slot0.IsLiked(slot0)
	return true
end

function slot0.UnLoad(slot0)
	slot0.time = 0
end

function slot0.Upload(slot0)
	slot0.time = pg.TimeMgr.GetInstance():GetServerTime()
end

function slot0.CanDispaly(slot0)
	return slot0:IsPushed() or not slot1 and slot0:ExistLocalImage()
end

return slot0
