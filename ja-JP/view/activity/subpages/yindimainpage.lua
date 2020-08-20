slot0 = class("YinDiMainPage", import(".TemplatePage.PreviewTemplatePage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.btnList = slot0:findTF("btn_list", slot0.bg)

	onButton(slot0, findTF(slot0.bg, "fightM"), function ()
		uv0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.LEVEL, {
			chapterId = getProxy(ChapterProxy):getActiveChapter() and slot1.id,
			mapIdx = slot1 and slot1:getConfig("map")
		})
	end)
end

return slot0
