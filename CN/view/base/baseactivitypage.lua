slot0 = class("BaseActivityPage", import(".BaseSubView"))

slot0.SetShareData = function (slot0, slot1)
	slot0.shareData = slot1
end

slot0.SetUIName = function (slot0, slot1)
	slot0._uiName = slot1
end

slot0.getUIName = function (slot0)
	return slot0._uiName
end

slot0.Flush = function (slot0, slot1)
	slot2 = slot0.activity == nil
	slot0.activity = slot1

	if slot0:OnDataSetting() then
		slot0.activity = nil

		return
	end

	if slot2 then
		slot0:OnFirstFlush()
	end

	slot0:OnUpdateFlush()
end

slot0.ShowOrHide = function (slot0, slot1)
	SetActive(slot0._go, slot1)
end

slot0.GetBgImg = function (slot0)
	return slot0.activity:getConfig("bg")[1]
end

slot0.OnInit = function (slot0)
	return
end

slot0.OnDataSetting = function (slot0)
	return
end

slot0.OnFirstFlush = function (slot0)
	return
end

slot0.OnUpdateFlush = function (slot0)
	return
end

slot0.OnDestroy = function (slot0)
	return
end

return slot0
