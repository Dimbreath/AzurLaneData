slot0 = class("ZProjectPage", import(".TemplatePage.PreviewTemplatePage"))

slot0.OnInit = function (slot0)
	slot0.super.OnInit(slot0)

	slot0.awardTF = slot0:findTF("AD/award")
end

slot0.OnFirstFlush = function (slot0)
	slot0.super.OnFirstFlush(slot0)
	updateDrop(slot0.awardTF, slot1)
	onButton(slot0, slot0.awardTF, function ()
		slot0:emit(BaseUI.ON_DROP, slot0)
	end, SFX_PANEL)
end

return slot0
