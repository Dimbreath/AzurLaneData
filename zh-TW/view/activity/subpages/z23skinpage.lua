class("Z23SkinPage", import(".TemplatePage.SkinTemplatePage")).OnUpdateFlush = function (slot0)
	slot0.super.OnUpdateFlush(slot0)
	setText(slot0.dayTF, slot0.nday .. "/" .. #slot0.taskGroup)
	eachChild(slot0.items, function (slot0)
		setButtonEnabled(slot2, false)
		setButtonEnabled(slot0:findTF("get_btn", slot0), not isActive(slot2))

		if isActive(slot2) then
			setActive(slot1, true)
		end
	end)
end

return class("Z23SkinPage", import(".TemplatePage.SkinTemplatePage"))
