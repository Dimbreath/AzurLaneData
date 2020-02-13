slot0 = class("ZProjectPage", import(".TemplatePage.PreviewTemplatePage"))

function slot0.OnInit(slot0)
	slot0.super.OnInit(slot0)

	slot0.awardTF = slot0:findTF("AD/award")
end

function slot0.OnFirstFlush(slot0)
	slot0.super.OnFirstFlush(slot0)
	updateDrop(slot0.awardTF, slot1)
	onButton(slot0, item, function ()
		slot0:emit(BaseUI.ON_DROP, slot0)
	end, SFX_PANEL)
end

return slot0
