slot0 = class("TWCelebrationPage1", import("...base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.shop = slot0:findTF("go", slot0.bg)
end

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)

	slot1 = _.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP), function (slot0)
		return slot0:getConfig("config_client").pt_id == pg.gameset.activity_res_id.key_value
	end)

	onButton(slot0, slot0.shop, function ()
		slot0.emit(slot1, ActivityMediator.GO_SHOPS_LAYER, {
			warp = ShopsLayer.TYPE_ACTIVITY,
			actId = slot0.emit and slot1.id
		})
	end)
end

return slot0
