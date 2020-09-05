slot0 = class("PreviewTemplatePage", import("....base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.btnList = slot0:findTF("btn_list", slot0.bg)
end

function slot0.OnFirstFlush(slot0)
	slot0:initBtn()
end

function slot0.initBtn(slot0)
	slot1 = {
		task = function (slot0)
			onButton(uv0, slot0, function ()
				uv0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK, {
					page = "activity"
				})
			end)
		end,
		shop = function (slot0)
			slot1 = _.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP), function (slot0)
				return slot0:getConfig("config_client").pt_id == pg.gameset.activity_res_id.key_value
			end)

			onButton(uv0, slot0, function ()
				uv0:emit(ActivityMediator.GO_SHOPS_LAYER, {
					warp = NewShopsScene.TYPE_ACTIVITY,
					actId = uv1 and uv1.id
				})
			end)
		end,
		build = function (slot0)
			onButton(uv0, slot0, function ()
				uv0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.GETBOAT, {
					projectName = BuildShipScene.PROJECTS.ACTIVITY
				})
			end)
		end,
		fight = function (slot0)
			onButton(uv0, slot0, function ()
				uv0:emit(ActivityMediator.BATTLE_OPERA)
			end)
		end,
		lottery = function (slot0)
			onButton(uv0, slot0, function ()
				uv0:emit(ActivityMediator.GO_LOTTERY)
			end)
		end,
		memory = function (slot0)
			onButton(uv0, slot0, function ()
			end)
		end,
		activity = function (slot0)
			onButton(uv0, slot0, function ()
			end)
		end
	}

	eachChild(slot0.btnList, function (slot0)
		uv0[slot0.name](slot0)
	end)
end

return slot0
