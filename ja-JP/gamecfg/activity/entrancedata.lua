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
			if not getProxy(PlayerProxy):getRawData():getResource(pg.gameset.skin_ticket.key_value) or slot2 <= 0 then
				return false
			end

			return _.any(getProxy(ShipSkinProxy):GetAllSkins(), function (slot0)
				return slot0:getConfig("genre") == ShopArgs.SkinShopTimeLimit and not uv0:hasSkin(slot0:getSkinId())
			end)
		end
	},
	{
		banner = "banai_shop",
		event = ActivityMediator.GO_SHOPS_LAYER,
		data = {
			{
				warp = NewShopsScene.TYPE_ACTIVITY,
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
				warp = NewShopsScene.TYPE_ACTIVITY,
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
				warp = NewShopsScene.TYPE_ACTIVITY,
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
		banner = "vote_frame_hall",
		event = ActivityMediator.GO_FISRT_VOTE,
		data = {},
		isShow = function ()
			return getProxy(ActivityProxy):GetVoteBookActivty() and not slot1:isEnd() and PLATFORM_CODE ~= PLATFORM_US
		end,
		isTip = function ()
			return _.any(VoteFameHallLayer.configs, function (slot0)
				return getProxy(TaskProxy):getTaskById(slot0[2]) and slot1:isFinish() and not slot1:isReceive()
			end)
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
				return getProxy(MiniGameProxy):GetHubByHubId(slot0:getConfig("config_id")).count > 0 and slot2.usedtime < 7
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
			return getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME) and not slot0:isEnd() and function ()
				return getProxy(MiniGameProxy):GetHubByHubId(uv0:getConfig("config_id")) and slot1.id == 7
			end()
		end,
		isTip = function ()
			if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME) and not slot0:isEnd() then
				return getProxy(MiniGameProxy):GetHubByHubId(slot0:getConfig("config_id")) and slot2.id == 7 and slot2.count > 0
			end
		end
	},
	{
		banner = "air_fight",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.AIRFORCE_DRAGONEMPERY
		},
		isShow = function ()
			return getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_AIRFIGHT_BATTLE) and not slot0:isEnd()
		end,
		isTip = function ()
			if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_AIRFIGHT_BATTLE) and not slot0:isEnd() then
				for slot6 = 1, slot0:getConfig("config_client")[1] do
					slot1 = 0 + (slot0:getKVPList(1, slot6) or 0)
				end

				slot3 = pg.TimeMgr.GetInstance()

				return slot1 < math.min((slot3:DiffDay(slot0.data1, slot3:GetServerTime()) + 1) * 2, slot2 * 3)
			end
		end
	},
	{
		banner = "doa_medal",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.DOA_MEDAL_COLLECTION_SCENE
		},
		isShow = function ()
			return getProxy(ActivityProxy):getActivityById(ActivityConst.DOA_MEDAL_ACT_ID) and not slot0:isEnd()
		end,
		isTip = function ()
			return DoaMedalCollectionView.isHaveActivableMedal()
		end
	},
	{
		banner = "meta_entrance_970701",
		event = ActivityMediator.EVENT_GO_SCENE,
		data = {
			SCENE.METACHARACTER,
			{
				autoOpenShipConfigID = 9707011
			}
		},
		isShow = function ()
			return getProxy(ActivityProxy):getActivityById(802) and not slot1:isEnd()
		end,
		isTip = function ()
			slot0 = 970701
			slot1 = getProxy(MetaCharacterProxy):getMetaProgressVOByID(970701)

			slot1:setDataBeforeGet()

			if slot1:isBuildType() then
				return false
			end

			if not slot1:isShow() then
				return false
			end

			slot2 = false

			if slot1.metaPtData then
				slot2 = slot1.metaPtData:CanGetAward()
			end

			return slot2
		end
	}
}
