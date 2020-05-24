slot0 = class("GameMediator", pm.Mediator)

function slot0.listNotificationInterests(slot0)
	return {
		GAME.GO_SCENE,
		GAME.GO_MINI_GAME,
		GAME.LOAD_SCENE_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()
	slot4 = nil

	if slot1:getName() == GAME.GO_SCENE then
		Context.New():extendData(slot1:getType())

		if slot3 == SCENE.LOGIN then
			slot4.mediator = LoginMediator
			slot4.viewComponent = LoginScene
			slot4.cleanStack = true
		elseif slot3 == SCENE.CREATE_PLAYER then
			slot4.mediator = NewPlayerMediator
			slot4.viewComponent = NewPlayerScene
		elseif slot3 == SCENE.DOCKYARD then
			slot4.mediator = DockyardMediator
			slot4.viewComponent = DockyardScene
		elseif slot3 == SCENE.GETBOAT then
			slot4.mediator = BuildShipMediator
			slot4.viewComponent = BuildShipScene
		elseif slot3 == SCENE.CHANGEEQUIP then
			-- Nothing
		elseif slot3 == SCENE.BACKYARD then
			slot4.mediator = BackYardMediator
			slot4.viewComponent = BackYardScene
		elseif slot3 == SCENE.LEVEL then
			slot4.mediator = LevelMediator2
			slot4.viewComponent = LevelScene
		elseif slot3 == SCENE.WORLD then
			slot4.mediator = WorldMediator
			slot4.viewComponent = WorldScene
		elseif slot3 == SCENE.WORLD_PORT then
			slot4.mediator = WorldPortMediator
			slot4.viewComponent = WorldPortScene
		elseif slot3 == SCENE.WORLD_FORMATION then
			slot4.mediator = WorldFormationMediator
			slot4.viewComponent = WorldFormationUI
		elseif slot3 == SCENE.BIANDUI then
			slot4.mediator = FormationMediator
			slot4.viewComponent = FormationUI
		elseif slot3 == SCENE.EQUIPDEV then
			slot4.mediator = EquipDevMediator
			slot4.viewComponent = EquipDevUI
		elseif slot3 == SCENE.SHIPINFO then
			slot4.mediator = ShipMainMediator
			slot4.viewComponent = ShipMainScene
		elseif slot3 == SCENE.EQUIPSCENE then
			slot4.mediator = EquipmentMediator
			slot4.viewComponent = StoreHouseScene
		elseif slot3 == SCENE.MAINUI then
			slot4.mediator = MainUIMediator
			slot4.viewComponent = MainUI
			slot4.cleanStack = true
		elseif slot3 == SCENE.TRANSITION then
			slot4.mediator = TransitionMediator
			slot4.viewComponent = TransitionUI
			slot4.ignoreBack = true
		elseif slot3 == SCENE.COMBATLOAD then
			slot4.mediator = CombatLoadMediator
			slot4.viewComponent = CombatLoadUI
			slot4.ignoreBack = true
		elseif slot3 == SCENE.BATTLE then
			slot4.mediator = BattleMediator
			slot4.viewComponent = BattleScene
			slot4.ignoreBack = true
		elseif slot3 == SCENE.EQUIPSYNTHESIS then
			slot4.mediator = EquipSynthesisMediator
			slot4.viewComponent = EquipSynthesisScene
		elseif slot3 == SCENE.TASK then
			slot4.mediator = TaskMediator
			slot4.viewComponent = TaskScene
		elseif slot3 == SCENE.NAVALACADEMYSCENE then
			slot4.mediator = NavalAcademyMediator
			slot4.viewComponent = NavalAcademyScene
		elseif slot3 == SCENE.NAVALTACTICS then
			slot4.mediator = NavalTacticsMediator
			slot4.viewComponent = NavalTacticsLayer
		elseif slot3 == SCENE.SETTINGS then
			slot4.mediator = SettingsMediator
			slot4.viewComponent = SettingsScene
		elseif slot3 == SCENE.COLLECTSHIP then
			slot4.mediator = CollectionMediator
			slot4.viewComponent = CollectionScene
		elseif slot3 == SCENE.EVENT then
			slot4.mediator = EventMediator
			slot4.viewComponent = EventListScene
		elseif slot3 == SCENE.MILITARYEXERCISE then
			slot4.mediator = MilitaryExerciseMediator
			slot4.viewComponent = MilitaryExerciseScene
		elseif slot3 == SCENE.PLAYER_INFO then
			slot4.mediator = PlayerInfoMediator
			slot4.viewComponent = PlayerInfoLayer
		elseif slot3 == SCENE.SHIP_PROFILE then
			slot4.mediator = ShipProfileMediator
			slot4.viewComponent = ShipProfileScene
		elseif slot3 == SCENE.FRIEND then
			slot4.mediator = FriendMediator
			slot4.viewComponent = FriendScene
		elseif slot3 == SCENE.EXERCISEFORMATION then
			slot4.mediator = DefenseFormationMedator
			slot4.viewComponent = DefenseFormationScene
		elseif slot3 == SCENE.DAILYLEVEL then
			slot4.mediator = DailyLevelMediator
			slot4.viewComponent = DailyLevelScene
		elseif slot3 == SCENE.CHARGE then
			slot4.mediator = ChargeMediator
			slot4.viewComponent = ChargeScene
		elseif slot3 == SCENE.ACTIVITY then
			slot4.mediator = ActivityMediator
			slot4.viewComponent = ActivityMainScene
		elseif slot3 == SCENE.GUILD then
			slot4.mediator = GuildMainMediator
			slot4.viewComponent = GuildMainScene
		elseif slot3 == SCENE.NEWGUILD then
			slot4.mediator = NewGuildMediator
			slot4.viewComponent = NewGuildScene
		elseif slot3 == SCENE.BILLBOARD then
			slot4.mediator = BillboardMediator
			slot4.viewComponent = BillboardScene
		elseif slot3 == SCENE.SHOP then
			slot4.mediator = NewShopsMediator
			slot4.viewComponent = NewShopsScene
		elseif slot3 == SCENE.VOTE then
			slot4.mediator = VoteMediator
			slot4.viewComponent = VoteScene
		elseif slot3 == SCENE.CLASS then
			slot4.mediator = ClassMediator
			slot4.viewComponent = ClassLayer
		elseif slot3 == SCENE.COMMANDROOM then
			slot4.mediator = CommandRoomMediator
			slot4.viewComponent = CommandRoomScene
		elseif slot3 == SCENE.COMMANDERINFO then
			slot4.mediator = CommanderInfoMediator
			slot4.viewComponent = CommanderInfoScene
		elseif slot3 == SCENE.COLORING then
			slot4.mediator = ColoringMediator
			slot4.viewComponent = ColoringScene
		elseif slot3 == SCENE.CARD_PAIRS then
			slot4.mediator = CardPairsMediator
			slot4.viewComponent = CardPairsScene
		elseif slot3 == SCENE.LINK_LINK then
			slot4.mediator = LinkLinkMediator
			slot4.viewComponent = LinkLinkScene
		elseif slot3 == SCENE.ANSWER then
			slot4.mediator = AnswerMediator
			slot4.viewComponent = AnswerScene
		elseif slot3 == SCENE.TECHNOLOGY then
			slot4.mediator = TechnologyMediator
			slot4.viewComponent = TechnologyScene
		elseif slot3 == SCENE.SHIPBLUEPRINT then
			slot4.mediator = ShipBluePrintMediator
			slot4.viewComponent = ShipBluePrintScene
		elseif slot3 == SCENE.SELTECHNOLOGY then
			slot4.mediator = SelectTechnologyMediator
			slot4.viewComponent = SelectTechnologyLayer
		elseif slot3 == SCENE.ANNIVERSARY then
			slot4.mediator = AnniversaryMediator
			slot4.viewComponent = AnniversaryScene
		elseif slot3 == SCENE.REFLUX then
			slot4.mediator = RefluxMediator
			slot4.viewComponent = RefluxScene
		elseif slot3 == SCENE.SUMMARY then
			slot4.mediator = PlayerSummaryInfoMediator
			slot4.viewComponent = PlayerSecondSummaryInfoScene
		elseif slot3 == SCENE.SNAPSHOT then
			slot4.mediator = SnapshotSceneMediator
			slot4.viewComponent = SnapshotScene
		elseif slot3 == SCENE.TRAININGCAMP then
			slot4.mediator = TrainingCampMediator
			slot4.viewComponent = TrainingCampScene
		elseif slot3 == SCENE.ACT_BOSS_BATTLE then
			slot4.mediator = ActivityBossBattleMediator3
			slot4.viewComponent = ActivityBossBattleScene3
		elseif slot3 == SCENE.BULLETINBOARD then
			slot4.mediator = BulletinBoardMediator
			slot4.viewComponent = BulletinBoardLayer
		elseif slot3 == SCENE.SKINSHOP then
			slot4.mediator = SkinShopMediator
			slot4.viewComponent = SkinShopScene
		elseif slot3 == SCENE.WORLDBOSS then
			slot4.mediator = WorldBossMediator
			slot4.viewComponent = WorldBossScene
		elseif slot3 == SCENE.ITEM_ORIGIN_PAGE then
			slot6 = getSpecialItemPage(slot4.data.open_ui)
			slot4.mediator = slot6.mediator
			slot4.viewComponent = slot6.viewComponent
		elseif slot3 == SCENE.SUMMER_FEAST then
			slot4.mediator = SummerFeastMediator
			slot4.viewComponent = SummerFeastScene
		elseif slot3 == SCENE.MUSIC_FESTIVAL then
			slot4.mediator = MusicFestivalMediator
			slot4.viewComponent = MusicFestivalScene
		elseif slot3 == SCENE.HOLOLIVE_MEDAL then
			slot4.mediator = HololiveMedalCollectionMediator
			slot4.viewComponent = HololiveMedalCollectionView
		elseif slot3 == SCENE.NEWYEAR_SQUARE then
			slot4.mediator = NewYearFestivalMediator
			slot4.viewComponent = NewYearFestivalScene
		elseif slot3 == SCENE.SPRING_TOWN then
			slot4.mediator = NewYearFestivalMediator
			slot4.viewComponent = SpringFestivalTownScene
		elseif slot3 == SCENE.ACT_BOSS_SPF then
			slot4.mediator = ActivityBossMediatorTemplate
			slot4.viewComponent = ActivityBossSPFScene
		elseif slot3 == SCENE.TECHNOLOGY_TREE_SCENE then
			slot4.mediator = TechnologyTreeMediator
			slot4.viewComponent = TechnologyTreeScene
		elseif slot3 == SCENE.CHALLENGE_MAIN_SCENE then
			slot4.mediator = ChallengeMainMediator
			slot4.viewComponent = ChallengeMainScene
		elseif slot3 == SCENE.HOLOLIVE_LINKLINK_SELECT_SCENE then
			slot4.mediator = HoloLiveLinkLinkSelectMediator
			slot4.viewComponent = HoloLiveLinkLinkSelectScene
		elseif slot3 == SCENE.ATTIRE then
			slot4.mediator = AttireMediator
			slot4.viewComponent = AttireScene
		elseif slot3 == SCENE.IDOL_MEDAL_COLLECTION_SCENE then
			slot4.mediator = IdolMedalCollectionMediator
			slot4.viewComponent = IdolMedalCollectionView
		elseif slot3 == SCENE.PHYSICS2D_TEST then
			slot4.mediator = Physics2dMediator
			slot4.viewComponent = Physics2dScene
		elseif slot3 == SCENE.THIRD_ANNIVERSARY_SQUARE then
			slot4.mediator = ThirdAnniversarySquareMediator
			slot4.viewComponent = ThirdAnniversarySquareScene
		elseif slot3 == SCENE.BACKYARD_THEME_TEMPLATE then
			slot4.mediator = NewBackYardThemeTemplateMediator
			slot4.viewComponent = NewBackYardThemeTemplateLayer
		end

		print("load scene: " .. slot3)

		slot4.scene = slot3

		slot0:sendNotification(GAME.LOAD_SCENE, {
			context = slot4
		})
	elseif slot2 == GAME.GO_MINI_GAME then
		slot5 = slot3
		slot6 = slot1:getType()
		slot4 = Context.New()

		slot4:extendData({
			miniGameId = slot5
		})

		slot7 = pg.mini_game[slot5]
		slot4.mediator = require("view.miniGame.gameMediator." .. slot7.mediator_name)
		slot4.viewComponent = require("view.miniGame.gameView." .. slot7.view_name)

		print("load minigame: " .. slot7.view_name)

		slot4.scene = slot7.view_name

		slot0:sendNotification(GAME.LOAD_SCENE, {
			context = slot4
		})
	elseif slot2 == GAME.LOAD_SCENE_DONE then
		print("scene loaded: ", slot3)

		if slot3 == SCENE.LOGIN then
			pg.UIMgr.GetInstance():displayLoadingBG(false)
			pg.UIMgr.GetInstance():LoadingOff()
		end
	end
end

return slot0
