slot0 = class("ActivityMainScene", import("..base.BaseUI"))
slot0.LOCK_ACT_MAIN = "ActivityMainScene:LOCK_ACT_MAIN"
slot0.UPDATE_ACTIVITY = "ActivityMainScene:UPDATE_ACTIVITY"
slot0.SELECT_ACTIVITY_OPEN = "ActivityMainScene:SELECT_ACTIVITY_OPEN"
slot1 = {
	[ActivityConst.DAY7_LOGIN_ACTIVITY_ID] = {
		className = "Day7LoginPage",
		uiName = "day7loginpage"
	},
	[ActivityConst.LEVEL_AWARD_ACTIVITY_ID] = {
		className = "LevelAwardPage",
		uiName = "levelawardpage"
	},
	[ActivityConst.MONTH_SIGN_ACTIVITY_ID] = {
		uiName = "monthsignpage",
		className = "MonthSignPage",
		uiName2 = "monthsignpage_special"
	},
	[ActivityConst.CHARGE_AWARD_ACTIVITY_ID] = {
		className = "ChargeAwardPage",
		uiName = "chargeawardpage"
	},
	[ActivityConst.ACTIVITY_TYPE_RETURN_AWARD_ID3] = {
		className = "Returner.ReturnAwardPage",
		uiName = "returnawardpage"
	},
	[ActivityConst.SUB_RED_POCKET] = {
		className = "RedPocketShipPage",
		uiName = "redpocketshippage"
	},
	[ActivityConst.BISMARCK_PT_ID] = {
		className = "BismarckPtPage",
		uiName = "bismarckptpage"
	},
	[ActivityConst.BISMARCK_CHAPTER_ID] = {
		className = "BismarckChapterPage",
		uiName = "bismarckchapterpage"
	},
	[ActivityConst.SKIN_U73] = {
		className = "U73SkinPage",
		uiName = "u73skinpage"
	},
	[ActivityConst.SKIN_Z23] = {
		className = "Z23SkinPage",
		uiName = "z23skinpage"
	},
	[ActivityConst.XIMU_LOGIN_ID] = {
		className = "XimuLoginPage",
		uiName = "ximuloginpage"
	},
	[ActivityConst.SANDIEGO_PT_ID] = {
		className = "SanDiegoPtPage",
		uiName = "sandiegoptpage"
	},
	[ActivityConst.ANNIVERSARY_ID] = {
		className = "SecondAnniversaryPage",
		uiName = "secondanniversarypage"
	},
	[ActivityConst.SIPEI_PAGE_ID] = {
		className = "SipeiTaskPage",
		uiName = "sipeitaskpage"
	},
	[ActivityConst.GLORY_PAGE_ID] = {
		className = "GloryTaskPage",
		uiName = "glorytaskpage"
	},
	[ActivityConst.FRANCE_RE_MAIN] = {
		className = "FranceRestartMainPage",
		uiName = "francerestartmainpage"
	},
	[ActivityConst.FRANCE_RE_PT] = {
		className = "FranceRestartPtPage",
		uiName = "francerestartptpage"
	},
	[ActivityConst.FRANCE_RE_OIL] = {
		className = "FranceRestartOilPage",
		uiName = "francerestartoilpage"
	},
	[ActivityConst.HONGRAN_RE_PREVIEW_ID] = {
		className = "HongranPreviewPage",
		uiName = "hongranpreviewpage"
	},
	[ActivityConst.HONGRAN_RE_PT_ID] = {
		className = "HongranPtPage",
		uiName = "hongranptpage"
	},
	[ActivityConst.JAVELIN_COMIC_NINE_DAY_TASK] = {
		className = "JavelinComicSkinPage",
		uiName = "javelincomicskinpage"
	},
	[ActivityConst.CENTAUR_ACTIVITY_ID] = {
		className = "CentaurAwardPage",
		uiName = "centaurawardpage"
	},
	[ActivityConst.I56_SKIN_ACTIVITY_ID] = {
		className = "I56SkinPage",
		uiName = "i56skinPage"
	},
	[ActivityConst.ACTIVITY_ID_US_SKIRMISH] = {
		className = "USSkirmishPage",
		uiName = "usskirmishpage"
	},
	[ActivityConst.US_DEFENCE_COLLECTION_MAIN] = {
		className = "USDefenceMainPage",
		uiName = "usdefencemainpage"
	},
	[ActivityConst.US_DEFENCE_PT_ID] = {
		className = "USDefencePTPage",
		uiName = "usdefenceptpage"
	},
	[ActivityConst.US_DEFENCE_OIL_ID] = {
		className = "USDefenceOilPage",
		uiName = "usdefenceoilpage"
	},
	[ActivityConst.SARATOGA_WF_SKIN_ID] = {
		className = "SaratogaWFSkinPage",
		uiName = "saratogawfskinpage"
	},
	[ActivityConst.SKIN_XIXUEGUI] = {
		className = "XixueguiSkinPage",
		uiName = "xixueguiskinpage"
	},
	[ActivityConst.WUDAOLOGIN_ID] = {
		className = "WudaoLoginPage",
		uiName = "wudaologinpage"
	},
	[ActivityConst.SUMMER_REMAKE] = {
		className = "SummerRemakePage",
		uiName = "summerremakepage"
	},
	[ActivityConst.SUMMER_REMAKEPT] = {
		className = "SummerRemakePTPage",
		uiName = "summerremakeptpage"
	},
	[ActivityConst.VOTE_ORDER_BOOK_PHASE_1] = {
		className = "VoteOrderBookPage",
		uiName = "VotePage"
	},
	[ActivityConst.VOTE_ORDER_BOOK_PHASE_2] = {
		className = "VoteOrderBookPage",
		uiName = "VotePage"
	},
	[ActivityConst.VOTE_ORDER_BOOK_PHASE_3] = {
		className = "VoteOrderBookPage",
		uiName = "VotePage"
	},
	[ActivityConst.VOTE_ORDER_BOOK_PHASE_4] = {
		className = "VoteOrderBookPage",
		uiName = "VotePage"
	},
	[ActivityConst.VOTE_ORDER_BOOK_PHASE_5] = {
		className = "VoteOrderBookPage",
		uiName = "VotePage"
	},
	[ActivityConst.VOTE_ORDER_BOOK_PHASE_6] = {
		className = "VoteOrderBookPage",
		uiName = "VotePage"
	},
	[ActivityConst.VOTE_ORDER_BOOK_PHASE_7] = {
		className = "VoteOrderBookPage",
		uiName = "VotePage"
	},
	[ActivityConst.VOTE_ORDER_BOOK_PHASE_8] = {
		className = "VoteOrderBookPage",
		uiName = "VotePage"
	},
	[ActivityConst.SHADOW_PLAY_ID] = {
		className = "ShadowPlayPage",
		uiName = "shadowPlayPage"
	},
	[ActivityConst.SANDIEGO_REFORM] = {
		className = "SandiegoReformPage",
		uiName = "sandiegoreformpage"
	},
	[ActivityConst.SKIN_YAMASHIRO_II] = {
		className = "YamashiroSkinPage",
		uiName = "yamashiroskinpage"
	},
	[ActivityConst.SHENSHENGXVMU_ID] = {
		className = "ShenshengxvmuPage",
		uiName = "shenshengxvmupage"
	},
	[ActivityConst.SITANLI_LOGIN_ID] = {
		className = "SitanliLoginPage",
		uiName = "sitanliloginpage"
	},
	[ActivityConst.AVRORA_TW_CBT] = {
		className = "AvroraTWCBTPage",
		uiName = "avroratwcbtpage"
	},
	[ActivityConst.ACTIVITY_ID_STORY_AWARD] = {
		className = "StoryAwardPage",
		uiName = "storyawardpage"
	},
	[ActivityConst.ANNIVERSARY_LOGIN_ID] = {
		className = "AnniversaryLoginPage",
		uiName = "anniversaryloginpage"
	},
	[ActivityConst.YIDALI_PT_ID] = {
		className = "YidaliPTPage",
		uiName = "yidaliptpage"
	},
	[ActivityConst.YIDALI_MAIN_ID] = {
		className = "YidaliMainPage",
		uiName = "yidalimainpage"
	},
	[ActivityConst.CARDPAIR_ZQ] = {
		className = "CardPairZQPage",
		uiName = "cardpairzqpage"
	},
	[ActivityConst.AVRORA_TW_CBT] = {
		className = "AvroraTWCBTPage",
		uiName = "avroratwcbtpage"
	},
	[ActivityConst.ACTIVITY_ID_ATRE_FURNITURE] = {
		className = "AtreFurniturePage",
		uiName = "atrefurniturepage"
	},
	[ActivityConst.CHUIXUE_RE_PT] = {
		className = "ChuixuePTRePage",
		uiName = "chuixueptrepage"
	},
	[ActivityConst.SHANCHENG_PT_OIL] = {
		className = "ShanchengPTOilPage",
		uiName = "shanchengptoilpage"
	},
	[ActivityConst.DACHAOLIFU_SKIN] = {
		className = "DachaolifuSkinPage",
		uiName = "dachaolifuskinpage"
	},
	[ActivityConst.SECOND_ANNIVERSARY_COLLECT] = {
		className = "SecondAnniversaryCollectPage",
		uiName = "secondanniversarycollectpage"
	},
	[ActivityConst.ACTIVITY_JAMAICA_SKIN_PAGE] = {
		className = "JamaicaSkinPage",
		uiName = "jamaicaskinpage"
	},
	[ActivityConst.TWCELEBRATION_1] = {
		className = "TWCelebrationPage1",
		uiName = "twcelebration1"
	},
	[ActivityConst.TWCELEBRATION_2] = {
		className = "TWCelebrationPage2",
		uiName = "twcelebration2"
	},
	[ActivityConst.TWCELEBRATION_3] = {
		className = "TWCelebrationPage3",
		uiName = "twcelebration3"
	},
	[ActivityConst.TWCELEBRATION_4] = {
		className = "TWCelebrationPage4",
		uiName = "twcelebration4"
	},
	[ActivityConst.MIKASA_REPAIRE_ACTIVITY] = {
		className = "MikasaRepairePage",
		uiName = "mikasarepairePage"
	},
	[ActivityConst.MIKASA_MAIN_ACTIVITY] = {
		className = "MikasaPreviewPage",
		uiName = "mikasamainPage"
	},
	[ActivityConst.CYGENT_SWIMSUIT] = {
		className = "CygentSwimsuitPage",
		uiName = "cygentswimsuit"
	},
	[ActivityConst.ACTIVITY_U110_BATTLE_PAGE] = {
		className = "U110BattlePage",
		uiName = "U110BattlePage"
	},
	[ActivityConst.LINDONG_REMAKE_KR] = {
		className = "LindongMainPage",
		uiName = "lindongmainpage"
	},
	[ActivityConst.CYGENT_SWIMSUIT] = {
		className = "CygentSwimsuitPage",
		uiName = "cygentswimsuit"
	},
	[ActivityConst.TWHALLOWEENSKIN] = {
		className = "HalloweenSkinPage",
		uiName = "HalloweenSkinUI"
	},
	[ActivityConst.BAILEY_HALLOWEEN_REMAKE] = {
		className = "BaileyHalloweenPage",
		uiName = "baileyhalloweenpage"
	},
	[ActivityConst.MEMPHIS_HALLOWEEN] = {
		className = "MemphisHalloweenPage",
		uiName = "memphishalloweenpage"
	},
	[ActivityConst.BAILEY_HALLOWEEN] = {
		className = "BaileyHalloweenPage",
		uiName = "baileyhalloweenpage"
	},
	[ActivityConst.IDOL_PT_ID] = {
		className = "IdolPTPage",
		uiName = "idolptpage"
	},
	[ActivityConst.MUSIC_CHUIXUE7DAY_ID] = {
		className = "Chuixue7daySkinPage",
		uiName = "chuixue7dayskinpage"
	},
	[ActivityConst.ANIME_LOGIN] = {
		className = "AnimeLoginPage",
		uiName = "AnimeLoginPage"
	},
	[ActivityConst.MUSIC_FESTIVAL_ID] = {
		className = "XiefeierIdolMusicPage",
		uiName = "xiefeieridolmusicpage"
	},
	[ActivityConst.POCKY_LOGIN] = {
		className = "PockyPage",
		uiName = "pockypage"
	},
	[ActivityConst.POCKY_SKIN_LOGIN] = {
		className = "PockySkinPage",
		uiName = "PockySkinPage"
	},
	[ActivityConst.WARSPITE_TRANS] = {
		className = "WarspiteTransformationPage",
		uiName = "WarspiteTransformationPage"
	},
	[ActivityConst.HOLOLIVE_PT_ID] = {
		className = "HoloLivePTPage",
		uiName = "HoloLivePTPage"
	},
	[ActivityConst.HOLOLIVE_MORNING_ID] = {
		className = "HoloLiveMorningPage",
		uiName = "HoloLiveMorningPage"
	},
	[ActivityConst.HOLOLIVE_MAIN] = {
		className = "HoloLivePage",
		uiName = "HoloLivePage"
	},
	[ActivityConst.HOLOLIVE_MIO_ID] = {
		className = "HoloLiveMioPage",
		uiName = "HoloLiveMioPage"
	},
	[ActivityConst.ZPROJECT_TW] = {
		className = "ZProjectPage",
		uiName = "zprojectpage"
	},
	[ActivityConst.JP_SKIRMISH_HEADFRAME_ID] = {
		className = "JPSkirmishHeadFramePage",
		uiName = "JPSkirmishHeadFramePage"
	},
	[ActivityConst.WAKABA_CHRIS_SKIN_ID] = {
		className = "WakabaChrisSkinPage",
		uiName = "WakabaChrisSkinPage"
	},
	[ActivityConst.SHIO_SKIN_RE_ID] = {
		className = "ShioSkinRePage",
		uiName = "ShioSkinRePage"
	},
	[ActivityConst.ANIME_MIDTERM_LOGIN] = {
		className = "AnimeMidtermLoginPage",
		uiName = "AnimeMidtermLoginPage"
	},
	[ActivityConst.NEWYEAR_SHRINE_PAGE_ID] = {
		className = "NewYearShrinePage",
		uiName = "NewYearShrinePage"
	},
	[ActivityConst.CYGNET_BATHROBE_PAGE_ID] = {
		className = "CygnetBathrobePage",
		uiName = "CygnetBathrobePage"
	},
	[ActivityConst.JAPANESE_NEWYEAR] = {
		className = "JapaneseNewyearPage",
		uiName = "JapaneseNewyearPage"
	},
	[ActivityConst.NEW_JAPANESE_PT] = {
		className = "JapanesePTPage",
		uiName = "JapanesePTPage"
	},
	[ActivityConst.SKIN_GELIDELI] = {
		className = "SkinGelideliPage",
		uiName = "SkinGelideliPage"
	},
	[ActivityConst.BEAT_MONSTER_NIAN_2020] = {
		className = "BeatMonsterNian.BeatMonsterPage",
		uiName = "BeatMonsterPage"
	},
	[ActivityConst.SKIN_KISARAGI] = {
		className = "SkinKisaragiPage",
		uiName = "SkinKisaragiPage"
	},
	[ActivityConst.MONOPOLY_2020] = {
		className = "Monopoly.MonopolyPage",
		uiName = "MonopolyPage"
	},
	[ActivityConst.MUTSUKI_NEWYEAR_SKIN_ID] = {
		className = "MutsukiNewYearSkinPage",
		uiName = "MutsukiNewYearSkinPage"
	},
	[ActivityConst.MORAN_KR_PT_ID] = {
		className = "MoranPtPage",
		uiName = "MoranPtPage"
	},
	[ActivityConst.MORAN_KR_PREVIEW_ID] = {
		className = "MoranMainPage",
		uiName = "MoranMainPage"
	},
	[ActivityConst.UNICORN_STARDUST] = {
		className = "UnicornStardustPage",
		uiName = "UnicornStardustPage"
	},
	[ActivityConst.TEATIME_TW] = {
		className = "TeaTimePuzzlePage",
		uiName = "TeaTimePuzzlePage"
	},
	[ActivityConst.SPRING_FES_MAIN_TW] = {
		className = "SpringFesMainPage",
		uiName = "SpringFesMainPage"
	},
	[ActivityConst.SICHUANOPERA] = {
		className = "SiChuanOperaPage",
		uiName = "SichuanOperaPage"
	},
	[ActivityConst.VALENTINE] = {
		className = "ValentinePage",
		uiName = "ValentinePage"
	},
	[ActivityConst.CARD_PAIR_FX_PAGE] = {
		className = "CardPairFXPage",
		uiName = "CardPairFXPage"
	},
	[ActivityConst.MAOZI_PT] = {
		className = "MaoziPtPage",
		uiName = "MaoziPtPage"
	},
	[ActivityConst.SANDIEGO_REFORM_RE] = {
		className = "SandiegoReformPage",
		uiName = "sandiegoreformpage"
	},
	[ActivityConst.FALLENWING_CHT] = {
		className = "FallenWingMainPage",
		uiName = "FallenWingMainPage"
	},
	[ActivityConst.SN_MAIN_PAGE] = {
		className = "SNMainPage",
		uiName = "SNMainPage"
	},
	[ActivityConst.SN_PT_PAGE] = {
		className = "SNPtPage",
		uiName = "SNPtPage"
	},
	[ActivityConst.LONGXIANG_ACTIVITY_PT_ID] = {
		className = "RyujoPtPage",
		uiName = "ryujoptpage"
	},
	[ActivityConst.SOFMAP_PT_PAGE] = {
		className = "SofmapPTPage",
		uiName = "SofmapPTPage"
	},
	[ActivityConst.MATCH3_PAGE] = {
		className = "Match3Page",
		uiName = "match3page"
	},
	[ActivityConst.SARATOGA_SKIN] = {
		className = "SaratogaSkinPage",
		uiName = "saratogaskinpage"
	},
	[ActivityConst.OUTPOST_PT] = {
		className = "OutPostPtPage",
		uiName = "OutPostPtPage"
	},
	[ActivityConst.AMERICAN_MAIN] = {
		className = "AmericanMainPage",
		uiName = "AmericanMainPage"
	},
	[ActivityConst.AMERICAN_PT] = {
		className = "AmericanPtPage",
		uiName = "AmericanPtPage"
	},
	[ActivityConst.APRILFOOL_DISCOVERY] = {
		className = "AprilFoolDiscoveryPage",
		uiName = "AprilFoolDiscoveryPage"
	},
	[ActivityConst.ANIME_END] = {
		className = "AnimeEndPage",
		uiName = "AnimeEndPage"
	},
	[ActivityConst.ACTIVITY_JAMAICA_SKIN_RE_PAGE] = {
		className = "JamaicaSkinRePage",
		uiName = "JamaicaSkinRePage"
	},
	[ActivityConst.TIAN_CHENG_PT_RE_PAGE] = {
		className = "TianChengPTRePage",
		uiName = "TianChengPTRePage"
	},
	[ActivityConst.TIAN_CHENG_RE_MAIN_PAGE] = {
		className = "TianChengReMainPage",
		uiName = "TianChengReMainPage"
	},
	[ActivityConst.LITTLE_RENOWN_PAGE] = {
		className = "LittleRenownPage",
		uiName = "LittleRenownPage"
	},
	[ActivityConst.TWXIAOBEIFA_ID] = {
		className = "XiaobeiFaPage",
		uiName = "XiaobeiFaPage"
	},
	[ActivityConst.FRANCE_SP] = {
		className = "FranceSpPage",
		uiName = "FranceSpPage"
	},
	[ActivityConst.LEMARS_RE_OIL_PAGE] = {
		className = "LeMarsReOilPage",
		uiName = "LeMarsReOilPage"
	},
	[ActivityConst.FRANCE_ICON_TASK] = {
		className = "FranceIconTaskPage",
		uiName = "FranceIconTaskPage"
	},
	[ActivityConst.FRANCE_SP] = {
		className = "FranceSpPage",
		uiName = "FranceSpPage"
	},
	[ActivityConst.PIZZAHUT_PT_PAGE] = {
		className = "PizzahutPTPage",
		uiName = "PizzahutPTPage"
	},
	[ActivityConst.FRANCE_MIAN_PAGE] = {
		className = "FranceMainPage",
		uiName = "FranceMainPage"
	},
	[ActivityConst.TOWERCLIMBING_SIGN] = {
		className = "TowerClimbingSignPage",
		uiName = "TowerClimbingSignPage"
	},
	[ActivityConst.FRANCE_PT_PAGE] = {
		className = "FrancePTPage",
		uiName = "FrancePTPage"
	}
}
slot2 = {
	[ActivityConst.IDOL_INS_ID] = ActivityConst.IDOL_PT_ID,
	[ActivityConst.POCKY_SKIN_PT] = ActivityConst.POCKY_SKIN_LOGIN,
	[ActivityConst.POCKY_SKIN_TASKLIST] = ActivityConst.POCKY_SKIN_LOGIN,
	[ActivityConst.POCKY_SKIN_FINAL] = ActivityConst.POCKY_SKIN_LOGIN
}

function slot0.preload(slot0, slot1)
	slot1()
end

function slot0.getUIName(slot0)
	return "ActivityMainUI"
end

function slot0.onBackPressed(slot0)
	if slot0.locked then
		return
	end

	for slot4, slot5 in pairs(slot0.windowList) do
		if isActive(slot5._tf) then
			slot0:HideWindow(slot5.class)

			return
		end
	end

	slot0:emit(uv0.ON_BACK_PRESSED)
end

slot3 = nil

function slot0.init(slot0)
	slot0.btnBack = slot0:findTF("blur_panel/adapt/top/back_btn")
	slot0.pageContainer = slot0:findTF("pages")
	slot0.tabs = slot0:findTF("scroll/viewport/content")
	slot0.tab = slot0:findTF("tab", slot0.tabs)
	slot0.entranceList = UIItemList.New(slot0:findTF("enter/viewport/content"), slot0:findTF("enter/viewport/content/btn"))
	slot0.windowList = {}
	slot0.lockAll = slot0:findTF("blur_panel/lock_all")

	setActive(slot0.lockAll, false)
	setActive(slot0.tab, false)

	slot0.shareData = ActivityShareData.New()
	uv0 = require("GameCfg.activity.EntranceData")
	slot0.pageDic = {}

	for slot7, slot8 in pairs(uv1) do
		if getProxy(ActivityProxy):getActivityById(slot7) and not slot9:isEnd() and slot9:isShow() then
			if slot7 == ActivityConst.MONTH_SIGN_ACTIVITY_ID and tonumber(pg.TimeMgr.GetInstance():CTimeDescC(pg.TimeMgr.GetInstance():GetServerTime(), "%m")) == pg.activity_template[ActivityConst.MONTH_SIGN_ACTIVITY_ID].config_client[1] then
				import("view.activity.subPages." .. slot8.className).New(slot0.pageContainer, slot0.event, slot0.contextData):SetUIName(slot8.uiName2)
			else
				slot11:SetUIName(slot8.uiName)
			end

			slot11:SetShareData(slot0.shareData)

			slot0.pageDic[slot7] = slot11
		end
	end
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.btnBack, function ()
		uv0:emit(uv1.ON_BACK)
	end, SOUND_BACK)
	slot0:updateEntrances()
	slot0:emit(ActivityMediator.SHOW_NEXT_ACTIVITY)
	slot0:bind(uv0.LOCK_ACT_MAIN, function (slot0, slot1)
		uv0.locked = slot1

		setActive(uv0.lockAll, slot1)
	end)
	slot0:bind(uv0.UPDATE_ACTIVITY, function (slot0, slot1)
		uv0:updateActivity(slot1)
	end)
	slot0:bind(uv0.SELECT_ACTIVITY_OPEN, function ()
		uv0:selectActivityOpen()
	end)
end

function slot0.setPlayer(slot0, slot1)
	slot0.shareData:SetPlayer(slot1)
end

function slot0.setFlagShip(slot0, slot1)
	slot0.shareData:SetFlagShip(slot1)
end

function slot0.setAllActivity(slot0, slot1)
	slot0.allActivity = slot1
end

function slot0.updateTaskLayers(slot0)
	if not slot0.activity then
		return
	end

	slot0:updateActivity(slot0.activity)
end

function slot0.setActivities(slot0, slot1)
	slot0.activities = slot1 or {}
	slot0.activity = nil

	table.sort(slot0.activities, function (slot0, slot1)
		if slot0:getShowPriority() == slot1:getShowPriority() then
			return slot1.id < slot0.id
		end

		return slot3 < slot2
	end)
	slot0:flushTabs()
end

function slot0.updateActivity(slot0, slot1)
	slot0.allActivity[slot1.id] = slot1

	if not slot1:isShow() then
		if uv0[slot1.id] then
			slot1 = getProxy(ActivityProxy):getActivityById(uv0[slot1.id])
		else
			return
		end
	end

	slot0.activities[function ()
		for slot3, slot4 in ipairs(uv0.activities) do
			if slot4.id == uv1.id then
				return slot3
			end
		end

		return #uv0.activities + 1
	end()] = slot1

	slot0:flushTabs()

	if slot0.activity and slot0.activity.id == slot1.id then
		slot0.activity = slot1

		slot0.pageDic[slot1.id]:ActionInvoke("Flush", slot1)
	end
end

function slot0.updateEntrances(slot0)
	slot0.entranceList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot4 = "empty"

			removeOnButton(slot2)

			slot5 = false

			if uv0[slot1 + 1] and table.getCount(slot3) ~= 0 and slot3.isShow() then
				onButton(uv1, slot2, function ()
					uv0:emit(uv1.event, uv1.data[1], uv1.data[2])
				end, SFX_PANEL)

				slot4 = slot3.banner

				if slot3.isTip then
					slot5 = slot3.isTip()
				end
			end

			setActive(slot2:Find("tip"), slot5)
			LoadImageSpriteAsync("activitybanner/" .. slot4, slot2)
		end
	end)
	slot0.entranceList:align(math.max(#_.select(uv0, function (slot0)
		return slot0.isShow and slot0.isShow()
	end), 5))
end

function slot0.flushTabs(slot0)
	if not slot0.tabsList then
		slot0.tabsList = UIItemList.New(slot0.tabs, slot0.tab)

		slot0.tabsList:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				if uv0.pageDic[uv0.activities[slot1 + 1].id] ~= nil then
					if slot3:getConfig("title_res_tag") then
						setImageSprite(uv0:findTF("off/text", slot2), GetSpriteFromAtlas("ui/activityui_atlas", slot5 .. "_text") or GetSpriteFromAtlas("ui/activityui_atlas", "activity_text"), true)
						setImageSprite(uv0:findTF("on/text", slot2), GetSpriteFromAtlas("ui/activityui_atlas", slot5 .. "_text_selected") or GetSpriteFromAtlas("ui/activityui_atlas", "activity_text_selected"), true)
						setActive(uv0:findTF("red", slot2), slot3:readyToAchieve())
						onToggle(uv0, slot2, function (slot0)
							if slot0 then
								uv0:selectActivity(uv1)
							end
						end, SFX_PANEL)
					else
						onToggle(uv0, slot2, function (slot0)
							uv0:loadActivityPanel(slot0, uv1)
						end, SFX_PANEL)
					end
				end
			end
		end)
	end

	slot0.tabsList:align(#slot0.activities)
end

function slot0.selectActivity(slot0, slot1)
	if slot1 and (not slot0.activity or slot0.activity.id ~= slot1.id) then
		slot2 = slot0.pageDic[slot1.id]

		slot2:Load()
		slot2:ActionInvoke("Flush", slot1)
		slot2:ActionInvoke("ShowOrHide", true)

		if slot0.activity and slot0.activity.id ~= slot1.id then
			slot0.pageDic[slot0.activity.id]:ActionInvoke("ShowOrHide", false)
		end

		slot0.activity = slot1
		slot0.contextData.id = slot1.id

		if slot0.openPageId ~= slot1.id then
			slot0.openPageId = nil
			slot0.openPageFlag = nil
		end
	end
end

function slot0.verifyTabs(slot0, slot1)
	slot2 = 1

	for slot6, slot7 in ipairs(slot0.activities) do
		if slot7.id == slot1 then
			slot2 = slot6

			break
		end
	end

	triggerToggle(slot0.tabs:GetChild(slot2 - 1), true)
end

function slot0.loadActivityPanel(slot0, slot1, slot2)
	slot3 = slot2:getConfig("type")

	if nil and slot1 then
		slot0:emit(ActivityMediator.OPEN_LAYER, slot4)
	elseif slot4 and not slot1 then
		slot0:emit(ActivityMediator.CLOSE_LAYER, slot4.mediator)
	else
		print("------活动id为" .. slot2.id .. "类型为" .. slot2:getConfig("type") .. "的页面不存在")
	end
end

function slot0.getBonusWindow(slot0, slot1, slot2)
	if not slot0:findTF(slot1) then
		PoolMgr.GetInstance():GetUI("ActivitybonusWindow", true, function (slot0)
			SetParent(slot0, uv0._tf, false)

			slot0.name = uv1

			uv2(slot0)
		end)
	else
		slot2(slot3)
	end
end

function slot0.ShowWindow(slot0, slot1, slot2)
	if not slot0.windowList[slot1.__cname] then
		slot0:getBonusWindow(slot3, function (slot0)
			uv0.windowList[uv1] = uv2.New(tf(slot0), uv0)

			uv0.windowList[uv1]:Show(uv3)
		end)
	else
		slot0.windowList[slot3]:Show(slot2)
	end
end

function slot0.HideWindow(slot0, slot1)
	if not slot0.windowList[slot1.__cname] then
		return
	end

	slot0.windowList[slot2]:Hide()
end

function slot0.selectActivityOpen(slot0)
	if slot0.activity ~= nil then
		slot0.openPageFlag = true

		if slot0.openPageCallBack and slot0.openPageId == slot0.activity.id then
			slot0.openPageCallBack()

			slot0.openPageCallBack = nil
		end
	end
end

function slot0.setSelectOpenHandle(slot0, slot1, slot2)
	if slot0.openPageFlag and slot1 == slot0.activity.id then
		slot2()
	else
		slot0.openPageId = slot1
		slot0.openPageCallBack = slot2
	end
end

function slot0.willExit(slot0)
	slot0.shareData = nil

	for slot4, slot5 in pairs(slot0.pageDic) do
		slot5:Destroy()
	end

	for slot4, slot5 in pairs(slot0.windowList) do
		slot5:Dispose()
	end
end

return slot0
