class("AmericanPtPage", import(".TemplatePage.PtTemplatePage")).OnUpdateFlush = function (slot0)
	slot0.super.OnUpdateFlush(slot0)

	slot1, slot2, slot3 = slot0.ptData:GetLevelProgress()
	slot10, slot11, slot6 = slot0.ptData:GetResProgress()

	setText(slot0.progress, setColorStr(slot4, "#4465DEFF") .. "/" .. slot5)
end

return class("AmericanPtPage", import(".TemplatePage.PtTemplatePage"))
