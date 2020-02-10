slot1.event = ActivityMediator.EVENT_GO_SCENE
slot2[1] = SCENE.SUMMARY
slot1.data = {}

function slot1.isShow()
	slot0 = getProxy(ActivityProxy)

	return slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SUMMARY) and not slot0:isEnd()
end

slot0[1] = {
	banner = "summary"
}
slot1.event = ActivityMediator.GO_PRAY_POOL
slot1.data = {}

function slot1.isShow()
	slot0 = getProxy(ActivityProxy)

	return slot0:getActivityById(ActivityConst.ACTIVITY_PRAY_POOL) and not slot0:isEnd()
end

slot0[2] = {
	banner = "build_pray"
}
slot1.event = ActivityMediator.EVENT_GO_SCENE
slot2[1] = SCENE.GETBOAT
slot3.projectName = BuildShipScene.PROJECTS.ACTIVITY
slot2[2] = {}
slot1.data = {}

function slot1.isShow()
	slot0 = getProxy(ActivityProxy)

	return slot0:getActivityById(ActivityConst.BUILD_BISMARCK_ID) and not slot0:isEnd()
end

slot0[3] = {
	banner = "build_bisimai"
}
slot1.event = ActivityMediator.EVENT_GO_SCENE
slot2[1] = SCENE.COLORING
slot1.data = {}

function slot1.isShow()
	slot0 = getProxy(ActivityProxy)

	return slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_COLORING_ALPHA) and not slot0:isEnd()
end

function slot1.isTip()
	return getProxy(ColoringProxy):CheckTodayTip()
end

slot0[4] = {
	banner = "ming_paint"
}
slot1.event = ActivityMediator.EVENT_GO_SCENE
slot2[1] = SCENE.SKINSHOP
slot3.type = SkinShopScene.SHOP_TYPE_TIMELIMIT
slot2[2] = {}
slot1.data = {}

function slot1.isShow()
	return pg.TimeMgr.GetInstance():inTime(ActivityConst.LIMIT_SKIN_SHOP_TIME)
end

function slot1.isTip()
	return getProxy(PlayerProxy):getRawData():getResource(pg.gameset.skin_ticket.key_value) and slot2 > 0
end

slot0[5] = {
	banner = "limit_skin"
}
slot1.event = ActivityMediator.GO_SHOPS_LAYER
slot3.actId = ActivityConst.BISMARCK_PT_SHOP_ID
slot2[1] = {
	warp = "activity"
}
slot1.data = {}

function slot1.isShow()
	slot0 = getProxy(ActivityProxy)

	return slot0:getActivityById(ActivityConst.BISMARCK_PT_SHOP_ID) and not slot0:isEnd()
end

slot0[6] = {
	banner = "banai_shop"
}
slot1.event = ActivityMediator.GO_SHOPS_LAYER
slot3.actId = ActivityConst.BILIBILI_PT_SHOP_ID
slot2[1] = {
	warp = "activity"
}
slot1.data = {}

function slot1.isShow()
	slot0 = getProxy(ActivityProxy)

	return slot0:getActivityById(ActivityConst.BILIBILI_PT_SHOP_ID) and not slot0:isEnd()
end

slot0[7] = {
	banner = "bili_shop"
}
slot0[8] = {}
slot1.event = ActivityMediator.EVENT_GO_SCENE
slot2[1] = SCENE.GETBOAT
slot3.projectName = BuildShipScene.PROJECTS.ACTIVITY
slot2[2] = {}
slot1.data = {}

function slot1.isShow()
	slot0 = getProxy(ActivityProxy)

	return slot0:getActivityById(ActivityConst.FRANCE_RE_BUILD) and not slot0:isEnd()
end

slot0[9] = {
	banner = "commom_build"
}
slot1.event = ActivityMediator.GO_SHOPS_LAYER
slot3.actId = ActivityConst.FRANCE_RE_PT_SHOP
slot2[1] = {
	warp = "activity"
}
slot1.data = {}

function slot1.isShow()
	slot0 = getProxy(ActivityProxy)

	return slot0:getActivityById(ActivityConst.FRANCE_RE_PT_SHOP) and not slot0:isEnd()
end

slot0[10] = {
	banner = "commom_pt_shop"
}
slot1.event = ActivityMediator.EVENT_GO_SCENE
slot2[1] = SCENE.SKINSHOP
slot1.data = {}

function slot1.isShow()
	slot3[1] = {
		2019,
		6,
		27
	}
	slot3[2] = {
		0,
		0,
		0
	}
	slot2[1] = {}
	slot3[1] = {
		2019,
		7,
		10
	}
	slot3[2] = {
		23,
		59,
		59
	}
	slot2[2] = {}

	return pg.TimeMgr.GetInstance():inTime({})
end

slot0[11] = {
	banner = "commom_skin_shop"
}
slot1.event = ActivityMediator.EVENT_GO_SCENE
slot2[1] = SCENE.SUMMER_FEAST
slot1.data = {}

function slot1.isShow()
	slot0 = getProxy(ActivityProxy)

	return slot0:getActivityById(ActivityConst.SUMMER_FEAST_ID) and not slot0:isEnd()
end

slot0[12] = {
	banner = "summer_feast"
}
slot1.event = ActivityMediator.GO_FISRT_VOTE
slot1.data = {}

function slot1.isShow()
	return getProxy(ActivityProxy):GetVoteBookActivty() and not slot1:isEnd() and PLATFORM_CODE ~= PLATFORM_US
end

function slot1.isTip()
	return _.any(VoteFameHallLayer.configs, function (slot0)
		slot1 = getProxy(TaskProxy)

		return slot1:getTaskById(slot0[2]) and slot1:isFinish() and not slot1:isReceive()
	end)
end

slot0[13] = {
	banner = "vote_frame_hall"
}
slot1.event = ActivityMediator.EVENT_GO_SCENE
slot2[1] = SCENE.NEWYEAR_SQUARE
slot1.data = {}

function slot1.isShow()
	slot0 = getProxy(ActivityProxy)

	return slot0:getActivityById(ActivityConst.NEWYEAR_ACTIVITY) and not slot0:isEnd()
end

slot0[14] = {
	banner = "event_square"
}
slot1.event = ActivityMediator.OPEN_RED_PACKET_LAYER
slot1.data = {}

function slot1.isShow()
	slot0 = getProxy(ActivityProxy)

	return slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_RED_PACKETS) and not slot0:isEnd()
end

function slot1.isTip()
	return RedPacketLayer.isShowRedPoint()
end

slot0[15] = {
	banner = "activity_redpacket"
}
slot1.event = ActivityMediator.GO_MINI_GAME
slot1.data = {
	10
}

function slot1.isShow()
	slot0 = getProxy(ActivityProxy)

	return slot0:getActivityById(ActivityConst.LANTERNFESTIVAL) and not slot0:isEnd()
end

function slot1.isTip()
	slot0 = getProxy(ActivityProxy)

	if slot0:getActivityById(ActivityConst.LANTERNFESTIVAL) and not slot0:isEnd() then
		return getProxy(MiniGameProxy):GetHubByHubId(slot0:getConfig("config_id")).count > 0 and slot2.usedtime < 7
	end
end

slot0[16] = {
	banner = "LanternFestival"
}

return {}
