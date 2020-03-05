return {
	{
		banner = "summary",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.SUMMARY
		},
		isShow = function ()
			return getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_SUMMARY) and not slot0:isEnd()
		end
	},
	{
		banner = "build_pray",
		event = ActivityMediator.GO_PRAY_POOL,
		data = {},
		isShow = function ()
			return getProxy(ActivityProxy):getActivityById(ActivityConst.ACTIVITY_PRAY_POOL) and not slot0:isEnd()
		end
	},
	{
		banner = "build_bisimai",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.GETBOAT,
			{
				projectName = BuildShipScene.PROJECTS.ACTIVITY
			}
		},
		isShow = function ()
			return getProxy(ActivityProxy):getActivityById(ActivityConst.BUILD_BISMARCK_ID) and not slot0:isEnd()
		end
	},
	{
		banner = "ming_paint",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.COLORING
		},
		isShow = function ()
			return getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_COLORING_ALPHA) and not slot0:isEnd()
		end,
		isTip = function ()
			return getProxy(ColoringProxy):CheckTodayTip()
		end
	},
	{
		banner = "limit_skin",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.SKINSHOP,
			{
				type = SkinShopScene.SHOP_TYPE_TIMELIMIT
			}
		},
		isShow = function ()
			return pg.TimeMgr.GetInstance():inTime(ActivityConst.LIMIT_SKIN_SHOP_TIME)
		end,
		isTip = function ()
			return getProxy(PlayerProxy):getRawData():getResource(pg.gameset.skin_ticket.key_value) and slot2 > 0
		end
	},
	{
		banner = "banai_shop",
		event = ActivityMediator.GO_SHOPS_LAYER,
		data = {
			{
				warp = "activity",
				actId = ActivityConst.BISMARCK_PT_SHOP_ID
			}
		},
		isShow = function ()
			return getProxy(ActivityProxy):getActivityById(ActivityConst.BISMARCK_PT_SHOP_ID) and not slot0:isEnd()
		end
	},
	{
		banner = "bili_shop",
		event = ActivityMediator.GO_SHOPS_LAYER,
		data = {
			{
				warp = "activity",
				actId = ActivityConst.BILIBILI_PT_SHOP_ID
			}
		},
		isShow = function ()
			return getProxy(ActivityProxy):getActivityById(ActivityConst.BILIBILI_PT_SHOP_ID) and not slot0:isEnd()
		end
	},
	{},
	{
		banner = "commom_build",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.GETBOAT,
			{
				projectName = BuildShipScene.PROJECTS.ACTIVITY
			}
		},
		isShow = function ()
			return getProxy(ActivityProxy):getActivityById(ActivityConst.FRANCE_RE_BUILD) and not slot0:isEnd()
		end
	},
	{
		banner = "commom_pt_shop",
		event = ActivityMediator.GO_SHOPS_LAYER,
		data = {
			{
				warp = "activity",
				actId = ActivityConst.FRANCE_RE_PT_SHOP
			}
		},
		isShow = function ()
			return getProxy(ActivityProxy):getActivityById(ActivityConst.FRANCE_RE_PT_SHOP) and not slot0:isEnd()
		end
	},
	{
		banner = "commom_skin_shop",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.SKINSHOP
		},
		isShow = function ()
			return pg.TimeMgr.GetInstance():inTime({
				{
					{
						2019,
						6,
						27
					},
					{
						0,
						0,
						0
					}
				},
				{
					{
						2019,
						7,
						10
					},
					{
						23,
						59,
						59
					}
				}
			})
		end
	},
	{
		banner = "summer_feast",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.SUMMER_FEAST
		},
		isShow = function ()
			return getProxy(ActivityProxy):getActivityById(ActivityConst.SUMMER_FEAST_ID) and not slot0:isEnd()
		end
	},
	{
		banner = "event_square",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.NEWYEAR_SQUARE
		},
		isShow = function ()
			return getProxy(ActivityProxy):getActivityById(ActivityConst.NEWYEAR_ACTIVITY) and not slot0:isEnd()
		end
	},
	{
		banner = "activity_redpacket",
		event = ActivityMediator.OPEN_RED_PACKET_LAYER,
		data = {},
		isShow = function ()
			return getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RED_PACKETS) and not slot0:isEnd()
		end,
		isTip = function ()
			return RedPacketLayer.isShowRedPoint()
		end
	},
	{
		banner = "LanternFestival",
		event = ActivityMediator.GO_MINI_GAME,
		data = {
			10
		},
		isShow = function ()
			return getProxy(ActivityProxy):getActivityById(ActivityConst.LANTERNFESTIVAL) and not slot0:isEnd()
		end,
		isTip = function ()
			if getProxy(ActivityProxy):getActivityById(ActivityConst.LANTERNFESTIVAL) and not slot0:isEnd() then
				return getProxy(MiniGameProxy).GetHubByHubId(slot1, slot0:getConfig("config_id")).count > 0 and slot2.usedtime < 7
			end
		end
	},
	{
		banner = "encode_game",
		event = ActivityMediator.GO_DECODE_MINI_GAME,
		data = {
			11
		},
		isShow = function ()
			return getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME) and not slot0:isEnd() and 
			-- Decompilation error in this vicinity:
			function ()
				slot0 = getProxy(MiniGameProxy)

				return slot0:GetHubByHubId(slot0:getConfig("config_id")) and slot1.id == 7
			end()
		end,
		isTip = function ()
			if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME) and not slot0:isEnd() then
				return getProxy(MiniGameProxy):GetHubByHubId(slot0:getConfig("config_id")) and slot2.id == 7 and slot2.count > 0
			end
		end
	}
}
