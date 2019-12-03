slot0 = class("AtreFurniturePage", import(".TemplatePage.LoginTemplatePage"))

function slot0.OnInit(slot0)
	slot0.super.OnInit(slot0)

	slot0.dayText = slot0:findTF("AD/DayText")
end

function slot0.OnFirstFlush(slot0)
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
	slot0.super.OnUpdateFlush(slot0)
	setText(slot0.dayText, string.format("%02d", slot0.nday))
end

return slot0
