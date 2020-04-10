slot0 = class("SaratogaSkinPage", import(".TemplatePage.PreviewTemplatePage"))

function slot0.OnInit(slot0)
	slot0.super.OnInit(slot0)

	slot0.shopBtn = slot0:findTF("btn_list/shop", slot0.bg)
end

function slot0.OnFirstFlush(slot0)
	slot0.super.OnFirstFlush(slot0)
	onButton(slot0, slot0.shopBtn, function ()
		slot0:emit(ActivityMediator.GO_SHOPS_LAYER, {
			warp = NewShopsScene.TYPE_ACTIVITY,
			actId = slot0.activity.id
		})
	end)
end

return slot0
