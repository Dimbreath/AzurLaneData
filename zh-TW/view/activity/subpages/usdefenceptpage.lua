class("USDefencePTPage", import(".TemplatePage.PtTemplatePage")).OnUpdateFlush = function (slot0)
	slot0.super.OnUpdateFlush(slot0)

	slot1, slot2, slot3 = slot0.ptData:GetResProgress()

	setText(slot0.progress, ((slot3 >= 1 and setColorStr(slot1, "#588CFEFF")) or slot1) .. "/" .. slot2)
end

return class("USDefencePTPage", import(".TemplatePage.PtTemplatePage"))
