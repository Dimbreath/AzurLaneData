slot0 = class("StoryAwardPage", import("...base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("bg")
	slot0.itemTpl = slot0:findTF("Item")
	slot0.taskItemTpl = slot0:findTF("TaskItem")
	slot0.scrollTF = slot0:findTF("Mask/ScrollView")
	slot0.container = slot0:findTF("Mask/ScrollView/Content")
	slot0.arrow = slot0:findTF("Mask/Arrow")
end

function slot0.OnDataSetting(slot0)
	slot0.config = pg.activity_event_chapter_award[slot0.activity:getConfig("config_id")]
	slot0.chapterIDList = slot0.config.chapter
end

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)

	for slot4 = 1, #slot0.chapterIDList, 1 do
		slot7 = cloneTplTo(slot0.taskItemTpl, slot0.container, "TaskItem" .. tostring(slot4))
		slot9 = slot0:findTF("ItemListContainer", slot7)
		slot10 = slot0:findTF("GotTag", slot7)
		slot11 = slot0:findTF("GetBtn", slot7)

		setText(slot8, slot6)

		for slot15 = 1, #slot0.config.award_display[slot4], 1 do
			updateDrop(slot16, slot18)
			onButton(slot0, cloneTplTo(slot0.itemTpl, slot9), function ()
				slot0:emit(BaseUI.ON_DROP, slot0)
			end, SFX_PANEL)
		end

		onButton(slot0, slot11, function ()
			slot0:emit(ActivityMediator.EVENT_OPERATION, {
				cmd = 1,
				activity_id = slot0.activity.id,
				arg1 = slot0
			})
		end, SFX_PANEL)
	end

	onScroll(slot0, slot0.scrollTF, function (slot0)
		setActive(slot0.arrow, slot0.y >= 0.01)
	end)
end

function slot0.OnUpdateFlush(slot0)
	for slot4 = 1, #slot0.chapterIDList, 1 do
		slot7 = slot0:findTF("GotTag", slot6)
		slot8 = slot0:findTF("GetBtn", slot6)

		if _.include(slot0.activity.data1_list, slot0.chapterIDList[slot4]) then
			slot6.transform:SetAsLastSibling()
		end

		setGray(slot10, slot9)
		setGray(slot11, slot9)
		setActive(slot7, slot9)
		setActive(slot8, getProxy(ChapterProxy):isClear(slot5) and not slot9)
	end
end

function slot0.OnDestroy(slot0)
	return
end

return slot0
