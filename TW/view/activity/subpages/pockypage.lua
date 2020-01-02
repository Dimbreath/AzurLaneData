slot0 = class("PockyPage", import(".TemplatePage.LoginTemplatePage"))

function slot0.OnInit(slot0)
	slot0.super.OnInit(slot0)

	slot0.title = slot0:findTF("day", slot0.bg)
end

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
	setActive(slot0.item, false)
	slot0.itemList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventInit then
			updateDrop(slot3, slot5)
			onButton(slot0, slot2, function ()
				slot0:emit(BaseUI.ON_DROP, slot0)
			end, SFX_PANEL)

			return
		end

		if slot0 == UIItemList.EventUpdate then
			setActive(slot0:findTF("got", slot2), slot1 < slot0.nday)
		end
	end)
end

function slot0.OnUpdateFlush(slot0)
	slot0.nday = slot0.activity.data1

	setText(slot0.title, slot0.nday)
	slot0.itemList:align(slot0.Day)
end

return slot0
