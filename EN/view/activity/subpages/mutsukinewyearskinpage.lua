class("MutsukiNewYearSkinPage", import(".TemplatePage.SkinTemplatePage")).OnUpdateFlush = function (slot0)
	slot0.super.OnUpdateFlush(slot0)
	setText(slot0.dayTF, slot0.nday .. "/" .. #slot0.taskGroup)
end

return class("MutsukiNewYearSkinPage", import(".TemplatePage.SkinTemplatePage"))
