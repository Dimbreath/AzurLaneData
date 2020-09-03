slot0 = class("SaratogaSkinPage", import(".TemplatePage.PreviewTemplatePage"))

function slot0.OnInit(slot0)
	slot0.super.OnInit(slot0)

	slot0.fightBtn = slot0:findTF("btn_list/fight", slot0.bg)
	slot0.shopBtn = slot0:findTF("btn_list/shop", slot0.bg)
end

function slot0.OnFirstFlush(slot0)
	slot0.super.OnFirstFlush(slot0)
	onButton(slot0, slot0.fightBtn, function ()
		slot0, slot1 = getProxy(ChapterProxy):getLastMapForActivity()

		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
			chapterId = slot1,
			mapIdx = slot0
		})
	end)
	onButton(slot0, slot0.shopBtn, function ()
		uv0:emit(ActivityMediator.GO_SHOPS_LAYER, {
			warp = NewShopsScene.TYPE_ACTIVITY,
			actId = uv0.activity.id
		})
	end)
end

return slot0
