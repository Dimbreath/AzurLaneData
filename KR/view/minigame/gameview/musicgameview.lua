slot0 = class("MusicGameView", import("..BaseMiniGameView"))

function slot0.getUIName(slot0)
	return "MusicGameUI"
end

function slot0.OnSendMiniGameOPDone(slot0, slot1)
	return
end

function slot0.MyGetRuntimeData(slot0)
	slot0.achieve_times = checkExist(slot0:GetMGData():GetRuntimeData("elements"), {
		1
	}) or 0
	slot0.isFirstgame = PlayerPrefs.GetInt("musicgame_idolIsFirstgame")
	slot0.bestScorelist = {}

	for slot4 = 1, slot0.music_amount * 2, 1 do
		slot0.bestScorelist[slot4] = checkExist(slot0:GetMGData():GetRuntimeData("elements"), {
			slot4 + 2
		}) or 0
	end
end

function slot0.MyStoreDataToServer(slot0)
	slot1 = {
		slot0.achieve_times,
		1
	}

	PlayerPrefs.SetInt("musicgame_idolIsFirstgame", 1)

	for slot5 = 1, slot0.music_amount * 2, 1 do
		table.insert(slot1, slot5 + 2, slot0.bestScorelist[slot5])
	end

	slot0:StoreDataToServer(slot1)
end

function slot0.init(slot0)
	slot0.UIMgr = pg.UIMgr.GetInstance()
	slot0.useGetKey_flag = false
	slot0.Datalink_flag = false
	slot0.mySelectFistMusic = 1
	slot0.game_playingflag = false
	slot0.countingfive_flag = false
	slot0.downingleft_flag = false
	slot0.downingright_flag = false
	slot0.downingright_lastflag = false
	slot0.downingleft_lastflag = false
	slot0.SDmodeldoind_flag = false
	slot0.nowS_flag = false
	slot0.isFirstgame_flag = 0
	slot0.firstview_timerRunflag = false
	slot0.ahead_timeflag = false
	slot0.ahead_timerPauseFlag = false
	slot0.changeLocalposTimerflag = false
	slot0.piecelist_rf = {
		[0] = 0
	}
	slot0.piecelist_lf = {
		[0] = 0
	}
	slot0.piece_nowl = {}
	slot0.piece_nowr = {}
	slot0.downingleft_missflag = false
	slot0.downingright_missflag = false
	slot0.piece_nowl_downflag = false
	slot0.piece_nowr_downflag = false
	slot0.piece_nowl_aloneflag = false
	slot0.piece_nowr_aloneflag = false
	slot0.painting_namelist = {
		"chicheng_idolns",
		"xiefeierde_idolns",
		"jiasikenie_idolns",
		"kelifulan_idolns",
		"xipeier_idolns"
	}
	slot0.SDname = {
		"chicheng_idol",
		"xiefeierde_idol",
		"jiasikenie_idol",
		"kelifulan_idol",
		"xipeier_idol"
	}
	slot0.SDmodel = {}
	slot0.SDmodel_idolflag = false
	slot0.musicgame_nowtime = 0
	slot0.musicgame_lasttime = 0
	slot0.time_interval = 0.01666
	slot0.music_amount = 5
	slot0.music_amount_middle = 3
	slot0.game_speed = (PlayerPrefs.GetInt("musicgame_idol_speed") > 0 and PlayerPrefs.GetInt("musicgame_idol_speed")) or 1
	slot0.game_dgree = 1
	slot0.game_music = slot0.mySelectFistMusic
	slot0.BG = slot0:findTF("BG")
	slot0.top = slot0:findTF("top")
	slot0.btn_pause = slot0.top:Find("pause")
	slot0.score = slot0.top:Find("score")
	slot0.game_content = slot0:findTF("GameContent")
	slot0.music_piece = slot0.game_content:Find("MusicPiece")
	slot0.pauseview = slot0:findTF("Pauseview")
	slot0.selectview = slot0:findTF("Selectview")
	slot0.scoreview = slot0:findTF("ScoreView")
	slot0.scoreview_flag = false
end

function slot0.didEnter(slot0)
	slot1 = 0
	slot0.Getdata_timer = Timer.New(slot2, slot0.time_interval, -1)

	slot0.Getdata_timer:Start()

	slot0.score_number = 0
	slot0.combo_link = 0
	slot0.combo_number = 0
	slot0.perfect_number = 0
	slot0.good_number = 0
	slot0.miss_number = 0
	slot3 = slot0:GetMGData():getConfig("simple_config_data")
	slot0.piecelist_speed = slot3.speed
	slot0.piecelist_speedmin = slot3.speed_min
	slot0.piecelist_speedmax = slot3.speed_max
	slot0.score_blist = slot3.Blist
	slot0.score_alist = slot3.Alist
	slot0.score_slist = slot3.Slist
	slot0.score_sslist = slot3.SSlist
	slot0.specialcombo_number = slot3.special_combo
	slot0.specialscore_number = slot3.special_score
	slot0.score_perfect = slot3.perfect
	slot0.score_good = slot3.good
	slot0.score_miss = slot3.miss
	slot0.score_combo = slot3.combo
	slot0.time_perfect = slot3.perfecttime
	slot0.time_good = slot3.goodtime
	slot0.time_miss = slot3.misstime
	slot0.time_laterperfect = slot3.laterperfecttime
	slot0.time_latergood = slot3.latergoodtime
	slot0.combo_interval = slot3.combo_interval
	slot0.CeiMgr_ob = pg.CriMgr.GetInstance()
	slot0.CeiMgr_ob.bgmPlayer.loop = false
	slot0.leftBtmBg = slot0.game_content:Find("bottomList/bottom_leftbg")
	slot0.rightBtmBg = slot0.game_content:Find("bottomList/bottom_rightbg")

	setActive(slot0.leftBtmBg, false)
	setActive(slot0.rightBtmBg, false)

	slot0.BtnRightDelegate = GetOrAddComponent(slot0.game_content:Find("btn_right"), "EventTriggerListener")

	slot0.BtnRightDelegate:AddPointDownFunc(function ()
		slot0.mousedowningright_flag = true

		setActive(slot0.rightBtmBg, true)
	end)
	slot0.BtnRightDelegate:AddPointUpFunc(function ()
		slot0.mousedowningright_flag = false

		setActive(slot0.rightBtmBg, false)
	end)

	slot0.BtnLeftDelegate = GetOrAddComponent(slot0.game_content:Find("btn_left"), "EventTriggerListener")

	slot0.BtnLeftDelegate:AddPointDownFunc(function ()
		slot0.mousedowningleft_flag = true

		setActive(slot0.leftBtmBg, true)
	end)
	slot0.BtnLeftDelegate:AddPointUpFunc(function ()
		slot0.mousedowningleft_flag = false

		setActive(slot0.leftBtmBg, false)
	end)
	onButton(slot0, slot0.top:Find("pause"), function ()
		slot0.UIMgr:BlurPanel(slot0.pauseview)
		setActive(slot0.pauseview, true)

		setActive.game_playingflag = false

		setActive:effect_play("nothing")

		slot0 = setActive.effect_play.pauseview:Find("bottom/song"):GetComponent(typeof(Image))
		slot0.sprite = slot0.selectview:Find("Main/MusicList/img/" .. slot0.game_music):GetComponent(typeof(Image)).sprite

		if not slot0.ahead_timeflag then
			slot0.song_Tstamp:Pause()

			slot0 = tonumber(tostring(slot0.song_Tstamp:GetTime()))
			slot1 = tonumber(tostring(slot0.song_Tlength.length))

			setText(slot0.pauseview:Find("bottom/now"), slot4 .. ":" .. slot2(math.floor(slot0 % 60000 / 1000)))
			setText(slot0.pauseview:Find("bottom/total"), slot4 .. ":" .. slot3)
			setActive(slot0.pauseview:Find("bottom/triangle"), true)
			setActive(slot0.pauseview:Find("bottom/TimeSlider"), true)
			setActive(slot0.pauseview:Find("bottom/now"), true)
			setActive(slot0.pauseview:Find("bottom/total"), true)
			setSlider(slot0.pauseview:Find("bottom/TimeSlider"), 0, 1, slot0 / slot1)

			slot0.pauseview:Find("bottom/triangle/now").localPosition = Vector3(slot0.pauseview:Find("bottom/triangle/min").localPosition.x + slot0 / slot1 * (slot0.pauseview:Find("bottom/triangle/max").localPosition.x - slot0.pauseview.Find("bottom/triangle/min").localPosition.x), slot0.pauseview:Find("bottom/triangle/now").localPosition.y, slot0.pauseview.Find("bottom/triangle/now").localPosition.z)

			if slot0.SDname[1] and slot0.SDmodel[1] then
				slot0:setActionSDmodel("stand2")
			end
		else
			setActive(slot0.pauseview:Find("bottom/triangle"), false)
			setActive(slot0.pauseview:Find("bottom/TimeSlider"), false)
			setActive(slot0.pauseview:Find("bottom/now"), false)
			setActive(slot0.pauseview:Find("bottom/total"), false)

			setActive.ahead_timerPauseFlag = true
		end
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.pauseview:Find("bottom/back"), function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("reselect_music_game"),
			onYes = function ()
				slot0.UIMgr:UnblurPanel(slot0.pauseview, slot0._tf)
				setActive(slot0.pauseview, false)
				setActive.timer:Stop()

				if setActive.timer.Stop.ahead_timer then
					slot0.ahead_timer:Stop()

					slot0.ahead_timer.Stop.ahead_timeflag = false
				end

				slot0:piecelistALLTtoF()
				setActive(slot0.selectview, true)

				GetOrAddComponent(slot0.selectview, "CanvasGroup").blocksRaycasts = true

				GetOrAddComponent(slot0.selectview, "CanvasGroup").song_btns[slot0.game_music]:GetComponent(typeof(Animator)):Play("plate_out")

				GetOrAddComponent(slot0.selectview, "CanvasGroup").song_btns[slot0.game_music].GetComponent(typeof(Animator)).Play.game_playingflag = false

				GetOrAddComponent(slot0.selectview, "CanvasGroup").song_btns[slot0.game_music].GetComponent(typeof(Animator)).Play:loadAndPlayMusic()
				GetOrAddComponent(slot0.selectview, "CanvasGroup").song_btns[slot0.game_music].GetComponent(typeof(Animator)).Play.loadAndPlayMusic:rec_scorce()
			end
		})
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.pauseview:Find("bottom/restart"), function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("restart_music_game"),
			onYes = function ()
				slot0.UIMgr:UnblurPanel(slot0.pauseview, slot0._tf)
				setActive(slot0.pauseview, false)
				setActive.timer:Stop()

				if setActive.timer.Stop.ahead_timer then
					slot0.ahead_timer:Stop()

					slot0.ahead_timer.Stop.ahead_timeflag = false
				end

				slot0:piecelistALLTtoF()
				slot0.piecelistALLTtoF:rec_scorce()
				slot0.piecelistALLTtoF.rec_scorce:game_start()
				slot0.piecelistALLTtoF.rec_scorce.game_start:effect_play("prepare")
			end
		})
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.pauseview:Find("bottom/resume"), function ()
		slot0.UIMgr:UnblurPanel(slot0.pauseview, slot0._tf)
		setActive(slot0.pauseview, false)
		setActive:effect_play("prepare")

		if not setActive.effect_play.ahead_timeflag then
			slot0:count_five(function ()
				slot0.song_Tstamp:Resume(CriAtomEx.ResumeMode.PausedPlayback)

				slot0.song_Tstamp.Resume.game_playingflag = true
			end)
		else
			slot0:count_five(function ()
				slot0.ahead_timerPauseFlag = false
				slot0.game_playingflag = true

				setActive(slot0.pauseview:Find("bottom/triangle"), true)
				setActive(slot0.pauseview:Find("bottom/TimeSlider"), true)
				setActive(slot0.pauseview:Find("bottom/now"), true)
				setActive(slot0.pauseview:Find("bottom/total"), true)
			end)
		end
	end, SFX_UI_CLICK)
	slot0:addRingDragListenter()
	setActive(slot0.selectview, true)

	GetOrAddComponent(slot0.selectview, "CanvasGroup").blocksRaycasts = true
end

function slot0.onBackPressed(slot0)
	if not slot0.countingfive_flag and not slot0.firstview_timerRunflag then
		if slot0.game_playingflag then
			if not isActive(slot0.top:Find("pause_above")) then
				triggerButton(slot0.top:Find("pause"))
			end
		elseif isActive(slot0.selectview) then
			slot0:emit(slot0.ON_BACK)
		end
	end
end

function slot0.OnApplicationPaused(slot0, slot1)
	if slot1 and not slot0.countingfive_flag and not slot0.firstview_timerRunflag and slot0.game_playingflag and not isActive(slot0.top:Find("pause_above")) then
		triggerButton(slot0.top:Find("pause"))
	end
end

function slot0.willExit(slot0)
	if slot0.timer then
		slot0.timer:Stop()
	end

	if slot0.effecttimer then
		slot0.effecttimer:Stop()
	end

	if slot0.firstview_timer then
		slot0.firstview_timer:Stop()
	end

	if slot0.count_timer then
		slot0.count_timer:Stop()
	end

	if slot0.Scoceview_timer then
		slot0.Scoceview_timer:Stop()
	end

	if slot0.Getdata_timer then
		slot0.Getdata_timer:Stop()
	end

	if slot0.ahead_timer then
		slot0.ahead_timer:Stop()
	end

	if slot0.SDname[1] and slot0.SDmodel[1] then
		for slot4 = 1, 5, 1 do
			PoolMgr.GetInstance():ReturnSpineChar(slot0.SDname[slot4], slot0.SDmodel[slot4])
		end

		slot0.SDname = nil
		slot0.SDmodel = nil
	end

	slot0.piecelist_lt = {}
	slot0.piecelist_lf = {}
	slot0.musictable_l = {}
	slot0.piece_nowl = {}
	slot0.piecelist_rt = {}
	slot0.piecelist_rf = {}
	slot0.musictable_r = {}
	slot0.piece_nowr = {}

	retPaintingPrefab(slot0.scoreview:Find("paint"), slot0.painting_namelist[slot0.game_music])
	print("unload musicGame done")
end

function slot0.game_before(slot0)
	slot0.nowS_flag = false

	if #slot0.SDmodel == 0 then
		for slot4 = 1, 5, 1 do
			slot0:loadSDModel(slot4)
		end
	end

	slot0:setActionSDmodel("stand2")

	slot0.musictable_l = {
		[0] = 0
	}
	slot0.musictable_r = {
		[0] = 0
	}
	slot0.nowmusic_l = null
	slot0.nowmusic_r = null
	slot0.musicpu = require("view/miniGame/gameView/musicGame/bgm_song0" .. slot0.game_music .. "_" .. slot0.game_dgree)

	for slot4, slot5 in ipairs(slot0.musicpu.left_track) do
		slot0:list_push(slot0.musictable_l, slot5)
	end

	for slot4, slot5 in ipairs(slot0.musicpu.right_track) do
		slot0:list_push(slot0.musictable_r, slot5)
	end

	slot0.piecelist = {}
	slot0.piece_n = 0
	slot0.piecelist_lt = {
		[0] = 0
	}
	slot0.piecelist_rt = {
		[0] = 0
	}
	slot0.pieceinit_xyz = {
		left = slot0.music_piece:Find("piece_left").localPosition,
		right = slot0.music_piece:Find("piece_right").localPosition
	}
end

function slot0.list_push(slot0, slot1, slot2)
	slot1[slot1[0] + 1] = slot2
	slot1[0] = slot1[0] + 1
end

function slot0.list_pop(slot0, slot1)
	if slot1[0] == 0 then
		return
	end

	slot2 = slot1[1]

	for slot6 = 1, slot1[0] - 1, 1 do
		slot1[slot6] = slot1[slot6 + 1]
	end

	slot1[0] = slot1[0] - 1

	return slot2
end

function slot0.game_start(slot0)
	slot0:game_before()
	slot0:effect_play("prepare")

	slot0.game_playingflag = true
	slot0.SDmodel_jumpcount = 0
	slot0.gotspecialcombo_flag = false

	function slot1()
		slot0.downingright_lastflag = slot0.downingright_flag
		slot0.downingleft_lastflag = slot0.downingleft_flag

		if slot0.useGetKey_flag then
			if slot0.game_dgree == 2 then
				slot0.downingright_flag = Input.GetKey(KeyCode.J)
				slot0.downingleft_flag = Input.GetKey(KeyCode.F)
			elseif slot0.game_dgree == 1 then
				if Input.GetKey(KeyCode.J) or Input.GetKey(KeyCode.F) then
					slot0.downingright_flag = true
					slot0.downingleft_flag = true
				else
					slot0.downingright_flag = false
					slot0.downingleft_flag = false
				end
			end
		elseif slot0.game_dgree == 2 then
			slot0.downingright_flag = slot0.mousedowningright_flag
			slot0.downingleft_flag = slot0.mousedowningleft_flag
		elseif slot0.game_dgree == 1 then
			if slot0.mousedowningright_flag or slot0.mousedowningleft_flag then
				slot0.downingright_flag = true
				slot0.downingleft_flag = true
			else
				slot0.downingright_flag = false
				slot0.downingleft_flag = false
			end
		end

		slot0:SDmodeljump_btnup()

		slot1 = slot0.pieceinit_xyz.right.x / (slot0.SDmodeljump_btnup.piecelist_speedmin + (slot0.piecelist_speedmax - slot0.piecelist_speedmin) * slot0.game_speed * 5)
		slot2 = -slot0.pieceinit_xyz.left.x / (slot0.SDmodeljump_btnup.piecelist_speedmin + (slot0.piecelist_speedmax - slot0.piecelist_speedmin) * slot0.game_speed * 5)
		slot0.SDmodeljump_btnup.piecelist_speedmin + (slot0.piecelist_speedmax - slot0.piecelist_speedmin) * slot0.game_speed * 5.musicgame_lasttime = slot0.musicgame_nowtime or 0

		if slot0.song_Tstamp then
			if type(slot0.song_Tstamp) ~= "number" then
				slot0.musicgame_nowtime = tonumber(tostring(slot0.song_Tstamp:GetTime())) / 1000
			else
				slot0.musicgame_nowtime = slot0.song_Tstamp
			end
		else
			slot0.musicgame_nowtime = 0
		end

		if slot0.song_Tlength and not slot0.scoreview_flag and tonumber(tostring(slot0.song_Tlength.length)) / 1000 - slot0.musicgame_nowtime <= 0.01666 then
			slot0.game_playingflag = false

			slot0.CeiMgr_ob:UnloadCueSheet("bgm-song0" .. slot0.game_music)

			if (slot0.good_number > 0 or slot0.perfect_number > 0) and slot0.miss_number <= 0 then
				setActive(slot0.game_content:Find("yinyue_Fullcombo"), true)

				if not slot0.gotspecialcombo_flag then
					slot0.score_number = slot0.score_number + slot0.specialscore_number
					slot0.gotspecialcombo_flag = true
				end

				slot0.game_content:Find("yinyue_Fullcombo"):GetComponent(typeof(ParticleSystemEvent)):SetEndEvent(function ()
					slot0:locadScoreView()
				end)
			else
				slot0:locadScoreView()
			end
		end

		if slot0.nowmusic_l == null and slot0.musictable_l[0] ~= 0 then
			slot0.nowmusic_l = slot0:list_pop(slot0.musictable_l)
		end

		if slot0.nowmusic_r == null and slot0.musictable_r[0] ~= 0 then
			slot0.nowmusic_r = slot0:list_pop(slot0.musictable_r)
		end

		if slot0.musictable_l[0] == 0 and slot0.musictable_r[0] == 0 then
			setActive(slot0.top:Find("pause_above"), true)
		else
			setActive(slot0.top:Find("pause_above"), false)
			setActive(slot0.game_content:Find("yinyue_Fullcombo"), false)
		end

		slot0.nowmusic_l = slot3("left", slot0.nowmusic_l, slot2, slot0.piecelist_lf, slot0.piecelist_lt)
		slot0.nowmusic_r = slot3("right", slot0.nowmusic_r, slot1, slot0.piecelist_rf, slot0.piecelist_rt)

		slot4("left", slot2, slot0.piecelist_lt, slot0.piecelist_lf)
		slot4("right", slot1, slot0.piecelist_rt, slot0.piecelist_rf)

		if slot0.piece_nowr_downflag or (slot0.piece_nowl_downflag and slot0.game_playingflag) then
			slot0:effect_play("perfect_loop02", true)
		else
			slot0:effect_play("perfect_loop02", false)
		end

		slot0:scoresliderAcombo_update()
	end

	if slot0.song_Tstamp and type(slot0.song_Tstamp) ~= "number" then
		slot0.song_Tstamp:Pause()
	end

	slot0.song_Tlength = false
	slot0.song_Tstamp = false

	slot0:effect_play("nothing")
	slot0:effect_play("prepare")

	function slot2()
		if not slot0.timer then
			slot0.timer = Timer.New(Timer.New, slot0.time_interval, -1)
		end

		slot1 = 2
		slot0.ahead_timerPauseFlag = false
		slot0.ahead_timer = Timer.New(slot2, slot0.time_interval, -1)

		slot0:count_five(function ()
			slot0.ahead_timer:Start()
		end)
	end

	if slot0.isFirstgame == 0 then
		slot0:Firstshow(slot0.top, slot2, 2)
		slot0:MyStoreDataToServer()
	else
		slot2()
	end
end

function slot0.loadSDModel(slot0, slot1)
	PoolMgr.GetInstance():GetSpineChar(slot0.SDname[slot1], true, function (slot0)
		pg.UIMgr.GetInstance():LoadingOff()

		slot0.SDmodel[] = slot0
		tf(slot0).localScale = Vector3(1, 1, 1)

		slot0:GetComponent("SpineAnimUI"):SetAction("stand2", 0)
		setParent(slot0, slot0.game_content:Find("Spinelist/" .. setParent))
	end)
end

function slot0.SDmodeljump_btnup(slot0)
	if slot0.downingright_flag or slot0.downingleft_flag then
		slot0.SDmodel_jumpcount = slot0.SDmodel_jumpcount + slot0.time_interval
		slot0.SDmodel_jumpcount = (slot0.SDmodel_jumpcount > 1 and 1) or slot0.SDmodel_jumpcount
	else
		if slot0.SDmodel_jumpcount == 1 then
			slot0:setActionSDmodel("jump")

			slot0.SDmodel_idolflag = false
		end

		if slot0.SDmodel_jumpcount > 0 then
			slot0.SDmodel_jumpcount = slot0.SDmodel_jumpcount - slot0.time_interval
			slot0.SDmodel_jumpcount = (slot0.SDmodel_jumpcount < 0 and 0) or slot0.SDmodel_jumpcount
		end

		if slot0.SDmodel_jumpcount == 0 and not slot0.SDmodel_idolflag then
			slot0.SDmodel_idolflag = true

			slot0:setActionSDmodel("idol")
		end
	end
end

function slot0.setActionSDmodel(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.SDmodel) do
		slot6:GetComponent("SpineAnimUI"):SetAction(slot1, 0)
	end
end

function slot0.loadAndPlayMusic(slot0)
	slot0.CeiMgr_ob.bgmName = "bgm-song0" .. slot0.game_music

	slot0.CeiMgr_ob:LoadCueSheet("bgm-song0" .. slot0.game_music, function ()
		slot0.CeiMgr_ob.bgmPlayer.loop = false
		slot0.CeiMgr_ob.bgmPlayer.song_Tstamp, slot0.CeiMgr_ob.bgmPlayer.song_Tlength = slot0.CeiMgr_ob:Play(slot0.CeiMgr_ob.bgmPlayer, slot0.CeiMgr_ob.bgmPlayer, 0)
	end)
end

function slot0.rec_scorce(slot0)
	slot0.score_number = 0
	slot0.combo_link = 0
	slot0.combo_number = 0
	slot0.perfect_number = 0
	slot0.good_number = 0
	slot0.miss_number = 0
	slot0.gotspecialcombo_flag = false

	setActive(slot0.top:Find("ScoreSlider/B/bl"), false)
	setActive(slot0.top:Find("ScoreSlider/A/al"), false)
	setActive(slot0.top:Find("ScoreSlider/S/sl"), false)
	setSlider(slot0.top:Find("ScoreSlider"), 0, 1, 0)
	setText(slot0.top:Find("score"), 0)
	setText(slot0.game_content:Find("combo_n"), 0)
end

function slot0.effect_play(slot0, slot1, slot2)
	if slot1 == "nothing" then
		setActive(slot0.game_content:Find("yinyue_perfect_loop02"), false)
		setActive(slot0.top:Find("yinyue_S"), false)
		setActive(slot0.game_content:Find("yinyue_good"), false)
		setActive(slot0.game_content:Find("yinyue_perfect"), false)
	elseif slot1 == "prepare" then
	elseif slot1 == "good" then
		setActive(slot0.game_content:Find("yinyue_good"), true)
		slot0.game_content:Find("yinyue_good/liubianxing"):GetComponent("ParticleSystem"):Play()
		slot0.game_content:Find("yinyue_good/Particle System (1)"):GetComponent("ParticleSystem"):Play()
	elseif slot1 == "perfect" then
		setActive(slot0.game_content:Find("yinyue_perfect"), true)
		slot0.game_content:Find("yinyue_perfect/liubianxing"):GetComponent("ParticleSystem"):Play()
		slot0.game_content:Find("yinyue_perfect/Particle System (1)"):GetComponent("ParticleSystem"):Play()
	elseif slot1 == "perfect_loop02" then
		if slot2 then
			setActive(slot0.game_content:Find("yinyue_perfect_loop02"), true)
		else
			setActive(slot0.game_content:Find("yinyue_perfect_loop02"), false)
		end
	elseif slot1 == "S" then
		if slot2 then
			setActive(slot0.top:Find("yinyue_S"), true)

			slot3 = 0
			slot0.effecttimer = Timer.New(function ()
				slot0 = slot0 + 1

				setActive(slot1.top:Find("yinyue_S"), false)

				if setActive > 1 then
					slot1.effecttimer:Stop()
				end
			end, 1, -1)

			return
		end

		setActive(slot0.top:Find("yinyue_S"), false)
	end
end

function slot0.scoresliderAcombo_update(slot0)
	slot2 = 0

	setText(slot0.top:Find("score"), slot0.score_number)
	setSlider(slot0.top:Find("ScoreSlider"), 0, 1, (slot0.score_number < slot0.score_blist[slot0.game_music][slot0.game_dgree] and slot1 / slot0.score_blist[slot0.game_music][slot0.game_dgree] * 0.53) or (slot0.score_blist[slot0.game_music][slot0.game_dgree] <= slot1 and slot1 < slot0.score_alist[slot0.game_music][slot0.game_dgree] and 0.53 + (slot1 - slot0.score_blist[slot0.game_music][slot0.game_dgree]) / (slot0.score_alist[slot0.game_music][slot0.game_dgree] - slot0.score_blist[slot0.game_music][slot0.game_dgree]) * 0.19) or (slot0.score_alist[slot0.game_music][slot0.game_dgree] <= slot1 and slot1 < slot0.score_slist[slot0.game_music][slot0.game_dgree] and 0.72 + (slot1 - slot0.score_alist[slot0.game_music][slot0.game_dgree]) / (slot0.score_slist[slot0.game_music][slot0.game_dgree] - slot0.score_alist[slot0.game_music][slot0.game_dgree]) * 0.155) or 0.885 + (slot1 - slot0.score_slist[slot0.game_music][slot0.game_dgree]) / (slot0.score_sslist[slot0.game_music][slot0.game_dgree] - slot0.score_slist[slot0.game_music][slot0.game_dgree]) * 0.115)

	if ((slot0.score_number < slot0.score_blist[slot0.game_music][slot0.game_dgree] and slot1 / slot0.score_blist[slot0.game_music][slot0.game_dgree] * 0.53) or (slot0.score_blist[slot0.game_music][slot0.game_dgree] <= slot1 and slot1 < slot0.score_alist[slot0.game_music][slot0.game_dgree] and 0.53 + (slot1 - slot0.score_blist[slot0.game_music][slot0.game_dgree]) / (slot0.score_alist[slot0.game_music][slot0.game_dgree] - slot0.score_blist[slot0.game_music][slot0.game_dgree]) * 0.19) or (slot0.score_alist[slot0.game_music][slot0.game_dgree] <= slot1 and slot1 < slot0.score_slist[slot0.game_music][slot0.game_dgree] and 0.72 + (slot1 - slot0.score_alist[slot0.game_music][slot0.game_dgree]) / (slot0.score_slist[slot0.game_music][slot0.game_dgree] - slot0.score_alist[slot0.game_music][slot0.game_dgree]) * 0.155) or 0.885 + (slot1 - slot0.score_slist[slot0.game_music][slot0.game_dgree]) / (slot0.score_sslist[slot0.game_music][slot0.game_dgree] - slot0.score_slist[slot0.game_music][slot0.game_dgree]) * 0.115) < 0.53 then
		setActive(slot0.top:Find("ScoreSlider/B/bl"), false)
		setActive(slot0.top:Find("ScoreSlider/A/al"), false)
		setActive(slot0.top:Find("ScoreSlider/S/sl"), false)
	elseif slot2 >= 0.53 then
		setActive(slot0.top:Find("ScoreSlider/B/bl"), true)

		if slot2 >= 0.72 then
			setActive(slot0.top:Find("ScoreSlider/A/al"), true)

			if slot2 >= 0.885 then
				if not slot0.nowS_flag then
					slot0.nowS_flag = true

					slot0:effect_play("S", true)
				end

				setActive(slot0.top:Find("ScoreSlider/S/sl"), true)
			end
		end
	end

	setText(slot0.game_content:Find("combo_n"), slot0.combo_link)
end

function slot0.piecelistALLTtoF(slot0)
	for slot5 = 1, slot0.piecelist_lt[0], 1 do
		slot6 = slot0:list_pop(slot0.piecelist_lt)
		slot6.ob.localPosition = slot0.pieceinit_xyz.left

		setActive(slot6.ob, false)
		slot0:list_push(slot0.piecelist_lf, slot6.ob)
	end

	if slot0.piece_nowl.ob then
		slot0.piece_nowl.ob.localPosition = slot0.pieceinit_xyz.left

		setActive(slot0.piece_nowl.ob, false)
		slot0:list_push(slot0.piecelist_lf, slot0.piece_nowl.ob)

		slot0.piece_nowl.ob = false
	end

	for slot5 = 1, slot0.piecelist_rt[0], 1 do
		slot6 = slot0:list_pop(slot0.piecelist_rt)
		slot6.ob.localPosition = slot0.pieceinit_xyz.right

		setActive(slot6.ob, false)
		slot0:list_push(slot0.piecelist_rf, slot6.ob)
	end

	if slot0.piece_nowr.ob then
		slot0.piece_nowr.ob.localPosition = slot0.pieceinit_xyz.right

		setActive(slot0.piece_nowr.ob, false)
		slot0:list_push(slot0.piecelist_rf, slot0.piece_nowr.ob)

		slot0.piece_nowr.ob = false
	end
end

function slot0.score_update(slot0, slot1)
	slot2 = slot0.game_content:Find("evaluate")

	for slot6 = 1, 3, 1 do
		setActive(slot2:GetChild(slot6 - 1), false)
	end

	setActive(slot2:GetChild(slot1), true)

	if slot1 == 0 then
		slot0.combo_link = 0
		slot0.score_number = slot0.score_number + slot0.score_miss
		slot0.miss_number = slot0.miss_number + 1

		setActive(slot0.game_content:Find("combo"), false)
		setActive(slot0.game_content:Find("combo_n"), false)
	else
		slot0.combo_link = slot0.combo_link + 1
		slot0.combo_number = (slot0.combo_link < slot0.combo_number and slot0.combo_number) or slot0.combo_link

		if slot0.combo_link > 1 then
			setActive(slot0.game_content:Find("combo"), true)
			setActive(slot0.game_content:Find("combo_n"), true)
			slot0.game_content:Find("combo"):GetComponent(typeof(Animation)):Play()
			slot0.game_content:Find("combo_n"):GetComponent(typeof(Animation)):Play()
		else
			setActive(slot0.game_content:Find("combo"), false)
			setActive(slot0.game_content:Find("combo_n"), false)
		end

		pg.CriMgr.GetInstance():PlaySE("ui-maoudamashii")
	end

	slot3 = 0

	for slot7 = 1, #slot0.combo_interval, 1 do
		if slot0.combo_interval[slot7] < slot0.combo_link then
			slot3 = slot3 + 1
		else
			break
		end
	end

	if slot1 == 1 then
		slot0.score_number = slot0.score_number + slot0.score_good + slot3 * slot0.score_combo
		slot0.good_number = slot0.good_number + 1

		slot0:effect_play("good")
	elseif slot1 == 2 then
		slot0.score_number = slot0.score_number + slot0.score_perfect + slot3 * slot0.score_combo
		slot0.perfect_number = slot0.perfect_number + 1

		slot0:effect_play("perfect")
	end
end

function slot0.count_five(slot0, slot1)
	slot0.countingfive_flag = true

	setActive(slot0.BG, true)

	if slot0.SDname[1] and slot0.SDmodel[1] then
		slot0:setActionSDmodel("stand2")
	end

	setText(slot0.BG:Find("num"), slot2)

	slot0.count_timer = Timer.New(function ()
		slot0 = slot0 - 1

		setText(slot1.BG:Find("num"), setText)

		if setText <= 0 then
			slot1.count_timer:Stop()

			slot1.count_timer.countingfive_flag = false

			setActive(false.BG, false)
			false.BG:setActionSDmodel("idol")
			"idol"()
		end
	end, 1, -1)

	slot0.count_timer:Start()
end

function slot0.showSelevtView(slot0)
	if slot0.isFirstgame == 0 then
		slot0:Firstshow(slot0.selectview, function ()
			return
		end, 1)
	end

	slot1 = slot0.selectview:Find("Main")
	slot3 = slot1:Find("DgreeList")
	slot5 = slot1:Find("namelist")
	slot6 = slot0.selectview:Find("top")
	slot10 = slot0.selectview:GetComponent("Animator")

	slot0.selectview:GetComponent(typeof(DftAniEvent)).SetEndEvent(slot11, function (slot0)
		setActive(slot0.selectview, false)
	end)
	onButton(slot0, slot8, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_music_game.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot9, function ()
		slot0:emit(slot1.ON_BACK)
	end, SFX_PANEL)
	onButton(slot0, slot2, function ()
		slot0:Play("selectExitAnim")
		slot0:game_start()

		GetOrAddComponent(slot0.selectview, "CanvasGroup").blocksRaycasts = false
	end, SFX_UI_CONFIRM)
	onButton(slot0, slot3:Find("easy"), function ()
		slot0.game_dgree = 1

		setActive(1:Find("hard/frame"), false)
		setActive(1.Find("hard/frame"):Find("easy/frame"), true)
		setActive:updatSelectview()
	end, SFX_UI_CLICK)
	onButton(slot0, slot3:Find("hard"), function ()
		slot0.game_dgree = 2

		setActive(2:Find("easy/frame"), false)
		setActive(2.Find("easy/frame"):Find("hard/frame"), true)
		setActive:updatSelectview()
	end, SFX_UI_CLICK)
	onButton(slot0, slot7, function ()
		slot1 = slot0:Find("x" .. slot1.game_speed)

		setActive(slot1, false)

		slot1.game_speed = (slot1.game_speed + 1 > 4 and 1) or slot1.game_speed + 1

		PlayerPrefs.SetInt("musicgame_idol_speed", (slot1.game_speed + 1 > 4 and 1) or slot1.game_speed + 1.game_speed)
		setActive(slot1:Find("x" .. (slot1.game_speed + 1 > 4 and 1) or slot1.game_speed + 1.game_speed), true)
	end, SFX_UI_CLICK)

	slot0.song_btn = slot1:Find("MusicList").Find(slot4, "song")

	setActive(slot0.song_btn, false)

	slot0.song_btns = {}

	for slot15 = 1, slot0.music_amount, 1 do
		slot0.song_btns[slot15] = cloneTplTo(slot0.song_btn, slot4, "music" .. slot15)

		setActive(slot0.song_btns[slot15], true)

		slot0.song_btns[slot15].localPosition = Vector3(slot0.song_btn.localPosition.x + ((slot15 - slot0.game_music < slot0.music_amount_middle and math.abs(slot15 - slot0.game_music)) or slot15 - slot0.music_amount_middle * 2) * 1022, slot0.song_btn.localPosition.y, slot0.song_btn.localPosition.z)
		slot0.song_btns[slot15].localScale = Vector3(slot0.song_btn.localScale.x - math.abs((slot15 - slot0.game_music < slot0.music_amount_middle and math.abs(slot15 - slot0.game_music)) or slot15 - slot0.music_amount_middle * 2) * 0.2, slot0.song_btn.localScale.y - math.abs((slot15 - slot0.game_music < slot0.music_amount_middle and math.abs(slot15 - slot0.game_music)) or slot15 - slot0.music_amount_middle * 2) * 0.2, slot0.song_btn.localScale.z - math.abs((slot15 - slot0.game_music < slot0.music_amount_middle and math.abs(slot15 - slot0.game_music)) or slot15 - slot0.music_amount_middle * 2) * 0.2)
		slot0.song_btns[slot15]:Find("song"):GetComponent(typeof(Image)).sprite = slot4:Find("img/" .. slot15):GetComponent(typeof(Image)).sprite
		slot0.song_btns[slot15]:Find("zhuanji3/zhuanji2_5"):GetComponent(typeof(Image)).sprite = slot4:Find("img/" .. slot15 .. "_1"):GetComponent(typeof(Image)).sprite
		slot0.song_btns[slot15].Find("song").GetComponent(typeof(Image)).color = Color.New(1, 1, 1, 1 - math.abs((slot15 - slot0.game_music < slot0.music_amount_middle and math.abs(slot15 - slot0.game_music)) or slot15 - slot0.music_amount_middle * 2) * 0.6)

		onButton(slot0, slot0.song_btns[slot15], function ()
			setActive(slot0:Find("song" .. slot1.game_music), false)
			slot1.CeiMgr_ob:UnloadCueSheet("bgm-song0" .. slot1.game_music)
			slot1.CeiMgr_ob:MyGetRuntimeData()

			slot1.CeiMgr_ob.game_music = slot2

			slot2:loadAndPlayMusic()
			slot2:updatSelectview()
			slot2:changeLocalpos("bgm-song0" .. slot1.game_music)
			setActive(slot0:Find("song" .. slot1.game_music), true)
		end, SFX_UI_CLICK)

		if slot15 == slot0.game_music then
			slot0.song_btns[slot15]:GetComponent(typeof(Animator)):Play("plate_out")

			slot0.song_btns[slot15]:GetComponent(typeof(Button)).interactable = false
		end
	end

	setActive(slot5:Find("song" .. slot0.game_music), true)
	slot0:updatSelectview()
	slot0:loadAndPlayMusic()
end

function slot0.changeLocalpos(slot0, slot1)
	slot3 = slot0.music_amount_middle - slot1
	slot4 = 0.5
	slot5 = {}

	for slot9 = 1, slot0.music_amount, 1 do
		slot5[slot9] = slot0.song_btns[slot9].localPosition
	end

	slot6 = {}

	for slot10 = 1, slot0.music_amount, 1 do
		slot6[slot10] = slot0.song_btns[slot10].localScale
	end

	slot0.changeLocalpos_timer = Timer.New(function ()
		slot0 = slot0 - slot1.time_interval
		slot1.time_interval.changeLocalposTimerflag = true

		for slot3 = 1, true.music_amount, 1 do
			slot4 = slot3 + slot2

			if slot1.music_amount < slot3 + slot2 then
				slot4 = (slot3 + slot2) - slot1.music_amount
			end

			if slot3 + slot2 < 1 then
				slot4 = slot3 + slot2 + slot1.music_amount
			end

			if slot0 <= 0 then
				if slot4 == slot3 then
					slot1.song_btns[slot3]:GetComponent(typeof(Animator)):Play("plate_out")
				else
					slot1.song_btns[slot3]:GetComponent(typeof(Animator)):Play("plate_static")

					slot1.song_btns[slot3]:GetComponent(typeof(Button)).interactable = true
				end
			else
				slot1.song_btns[slot3]:GetComponent(typeof(Animator)):Play("plate_static")

				slot1.song_btns[slot3]:GetComponent(typeof(Button)).interactable = false
			end

			slot6 = math.abs(slot4 - slot3)
			slot8 = (slot4 - slot3 > 0 and 1) or -1
			slot1.song_btns[slot3].localPosition = Vector3(slot1.song_btn.localPosition.x, slot5.y, slot5.z)
			slot1.song_btns[slot3].localScale = Vector3(slot1.song_btn.localPosition.x, , (1 - slot6 * 0.2) * (1 - slot0 * 2) + slot5[slot3].x * slot0 * 2)
			slot7 = (1 - slot6 * 0.6) * (1 - slot0 * 2) + slot1.song_btns[slot3]:Find("song"):GetComponent(typeof(Image)).color.a * slot0 * 2
			slot1.song_btns[slot3].Find("song").GetComponent(typeof(Image)).color = Color.New(1, 1, 1, 1 - slot6 * 0.6)
		end

		if slot0 <= 0 then
			slot1.changeLocalposTimerflag = false

			slot1.changeLocalpos_timer:Stop()
		end
	end, slot0.time_interval, -1)

	slot0.changeLocalpos_timer:Start()
end

function slot0.addRingDragListenter(slot0)
	slot1 = GetOrAddComponent(slot0.selectview, "EventTriggerListener")
	slot2 = nil
	slot3 = 0
	slot4 = nil

	slot1:AddBeginDragFunc(function ()
		slot0 = 0
		slot1 = nil
	end)
	slot1:AddDragFunc(function (slot0, slot1)
		if not slot0.inPaintingView then
			slot2 = slot1.position

			if not slot1 then
				slot1 = slot2
			end

			slot2 = slot2.x - slot1.x
		end
	end)
	slot1:AddDragEndFunc(function (slot0, slot1)
		if not slot0.inPaintingView and not slot0.changeLocalposTimerflag then
			if slot1 < -50 then
				if slot0.game_music < slot0.music_amount then
					triggerButton(slot0.song_btns[slot0.game_music + 1])
				else
					triggerButton(slot0.song_btns[1])
				end
			elseif slot1 > 50 then
				if slot0.game_music > 1 then
					triggerButton(slot0.song_btns[slot0.game_music - 1])
				else
					triggerButton(slot0.song_btns[slot0.music_amount])
				end
			end
		end
	end)
end

function slot0.Firstshow(slot0, slot1, slot2, slot3)
	slot4 = 0
	slot5 = slot1:Find("firstview")

	LoadImageSpriteAsync("clutter/minigame_music_help" .. slot3, slot5:Find("num"))
	setActive(slot5, true)
	setActive(slot5:Find("num"), true)

	slot0.firstview_timerRunflag = true
	slot0.firstview_timer = Timer.New(function ()
		if slot0 + 1 > 3 then
			onButton(slot1, slot2:Find("firstview"), function ()
				if slot0 then
					slot0()
				end

				setActive(slot1:Find("firstview"), false)

				false.firstview_timerRunflag = false
			end, SFX_UI_CLICK)
			slot1.firstview_timer:Stop()
		end
	end, 1, -1)

	slot0.firstview_timer:Start()
end

function slot0.updatSelectview(slot0)
	setActive(slot0.selectview:Find("top/Speedlist/x" .. slot0.game_speed), true)

	for slot4 = 1, slot0.music_amount, 1 do
		setActive(slot0.song_btns[slot4]:Find("song/best"), false)
		slot0:setSelectview_pj("e", slot4)
	end

	slot1 = slot0.bestScorelist[slot0.game_music + (slot0.game_dgree - 1) * slot0.music_amount]

	if slot0.song_btns[slot0.game_music] and slot1 > 0 then
		setActive(slot0.song_btns[slot0.game_music]:Find("song/best"), true)
		setText(slot2, slot1)
		slot0:setSelectview_pj("e", slot0.game_music)

		if slot1 < slot0.score_blist[slot0.game_music][slot0.game_dgree] then
			slot0:setSelectview_pj("c", slot0.game_music)
		elseif slot0.score_blist[slot0.game_music][slot0.game_dgree] <= slot1 and slot1 < slot0.score_alist[slot0.game_music][slot0.game_dgree] then
			slot0:setSelectview_pj("b", slot0.game_music)
		elseif slot0.score_alist[slot0.game_music][slot0.game_dgree] <= slot1 and slot1 < slot0.score_slist[slot0.game_music][slot0.game_dgree] then
			slot0:setSelectview_pj("a", slot0.game_music)
		else
			slot0:setSelectview_pj("s", slot0.game_music)
		end
	end
end

function slot0.setSelectview_pj(slot0, slot1, slot2)
	if slot1 == "e" then
		setActive(slot0.song_btns[slot2]:Find("song/c"), false)
		setActive(slot0.song_btns[slot2]:Find("song/b"), false)
		setActive(slot0.song_btns[slot2]:Find("song/a"), false)
		setActive(slot0.song_btns[slot2]:Find("song/s"), false)
	elseif slot1 == "c" then
		setActive(slot0.song_btns[slot2]:Find("song/c"), true)
	elseif slot1 == "b" then
		setActive(slot0.song_btns[slot2]:Find("song/b"), true)
	elseif slot1 == "a" then
		setActive(slot0.song_btns[slot2]:Find("song/a"), true)
	elseif slot1 == "s" then
		setActive(slot0.song_btns[slot2]:Find("song/s"), true)
	end
end

function slot0.locadScoreView(slot0)
	slot0.song_Tstamp:Pause()
	slot0:effect_play("nothing")

	slot0.game_playingflag = false

	setActive(slot0.scoreview, true)

	slot0.scoreview_flag = true

	setPaintingPrefabAsync(slot0.scoreview:Find("paint"), slot0.painting_namelist[slot0.game_music], "jiesuan")
	setActive(slot0.scoreview:Find("img_list/square/easy"), slot0.game_dgree == 1)
	setActive(slot0.scoreview:Find("img_list/square/hard"), slot0.game_dgree == 2)
	setActive(slot0.scoreview:Find("scorelist/fullcombo"), slot0.miss_number == 0)
	setText(slot0.scoreview:Find("scorelist/perfect"), slot0.perfect_number)
	setText(slot0.scoreview:Find("scorelist/good"), slot0.good_number)
	setText(slot0.scoreview:Find("scorelist/miss"), slot0.miss_number)
	setText(slot0.scoreview:Find("scorelist/combo"), slot0.combo_number)
	setText(slot0.scoreview:Find("img_list/square/bestscore"), slot0.score_number)

	slot1 = slot0.scoreview:Find("img_list/square/name"):GetComponent(typeof(Image))
	slot1.sprite = slot0.selectview:Find("Main/namelist/song" .. slot0.game_music):GetComponent(typeof(Image)).sprite

	slot1:SetNativeSize()

	slot0.scoreview:Find("img_list/square/song"):GetComponent(typeof(Image)).sprite = slot0.selectview:Find("Main/MusicList/img/" .. slot0.game_music):GetComponent(typeof(Image)).sprite

	if slot0.bestScorelist[slot0.game_music + (slot0.game_dgree - 1) * slot0.music_amount] < slot0.score_number then
		setActive(slot0.scoreview:Find("img_list/square/bestscore_img"), true)

		slot0.bestScorelist[slot0.game_music + (slot0.game_dgree - 1) * slot0.music_amount] = slot0.score_number
	else
		setActive(slot0.scoreview:Find("img_list/square/bestscore_img"), false)
	end

	slot2 = nil
	slot2 = (slot0.score_number >= slot0.score_blist[slot0.game_music][slot0.game_dgree] or function ()
		slot0:setScoceview_pj("c")
		slot0.setScoceview_pj.CeiMgr_ob:stopStory()
	end) and (slot0.score_blist[slot0.game_music][slot0.game_dgree] > slot0.score_number or slot0.score_number >= slot0.score_alist[slot0.game_music][slot0.game_dgree] or function ()
		slot0:setScoceview_pj("b")
		slot0.setScoceview_pj:emit(BaseMiniGameMediator.MINI_GAME_SUCCESS, 0)
		slot0.setScoceview_pj.emit.CeiMgr_ob:stopStory()
	end) and (slot0.score_alist[slot0.game_music][slot0.game_dgree] > slot0.score_number or slot0.score_number >= slot0.score_slist[slot0.game_music][slot0.game_dgree] or function ()
		slot0:setScoceview_pj("a")
		slot0.setScoceview_pj:emit(BaseMiniGameMediator.MINI_GAME_SUCCESS, 0)
		slot0.setScoceview_pj.emit.CeiMgr_ob:stopStory()
	end) and function ()
		slot0:setScoceview_pj("s")
		slot0.setScoceview_pj:emit(BaseMiniGameMediator.MINI_GAME_SUCCESS, 0)
		slot0.setScoceview_pj.emit.CeiMgr_ob:stopStory()
	end
	slot4 = pg.StoryMgr.GetInstance()
	slot6 = (slot0:GetMGData():getConfig("simple_config_data").story[slot0:GetMGHubData().usedtime + 1] and slot5[slot3.usedtime + 1][1]) or nil

	if slot3.count > 0 and slot6 and not slot4:IsPlayed(slot6) and slot0.score_blist[slot0.game_music][slot0.game_dgree] <= slot0.score_number then
		slot4:Play(slot6, slot2)
	else
		slot2()
	end

	onButton(slot0, slot0.scoreview:Find("btnlist/share"), function ()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeSummary)
	end, SFX_PANEL)
	onButton(slot0, slot0.scoreview:Find("btnlist/restart"), function ()
		setActive(slot0.scoreview, false)

		setActive.scoreview_flag = false

		setActive.timer:Stop()
		setActive.timer.Stop:piecelistALLTtoF()
		setActive.timer.Stop.piecelistALLTtoF:rec_scorce()
		setActive.timer.Stop.piecelistALLTtoF.rec_scorce:game_start()
		setActive.timer.Stop.piecelistALLTtoF.rec_scorce.game_start:setScoceview_pj("e")
		retPaintingPrefab(slot0.scoreview:Find("paint"), slot0.painting_namelist[slot0.game_music])
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.scoreview:Find("btnlist/reselect"), function ()
		setActive(slot0.scoreview, false)

		setActive.scoreview_flag = false

		setActive.timer:Stop()
		setActive.timer.Stop:piecelistALLTtoF()
		setActive(slot0.selectview, true)

		GetOrAddComponent(slot0.selectview, "CanvasGroup").blocksRaycasts = true

		GetOrAddComponent(slot0.selectview, "CanvasGroup"):updatSelectview()
		GetOrAddComponent(slot0.selectview, "CanvasGroup").updatSelectview.song_btns[slot0.game_music]:GetComponent(typeof(Animator)):Play("plate_out")
		GetOrAddComponent(slot0.selectview, "CanvasGroup").updatSelectview.song_btns[slot0.game_music].GetComponent(typeof(Animator)).Play:loadAndPlayMusic()
		GetOrAddComponent(slot0.selectview, "CanvasGroup").updatSelectview.song_btns[slot0.game_music].GetComponent(typeof(Animator)).Play.loadAndPlayMusic:rec_scorce()
		GetOrAddComponent(slot0.selectview, "CanvasGroup").updatSelectview.song_btns[slot0.game_music].GetComponent(typeof(Animator)).Play.loadAndPlayMusic.rec_scorce:setScoceview_pj("e")
		retPaintingPrefab(slot0.scoreview:Find("paint"), slot0.painting_namelist[slot0.game_music])
	end, SFX_UI_CLICK)
	slot0:MyStoreDataToServer()
	slot0:MyGetRuntimeData()
	slot0:Scoceview_ani()
end

function slot0.setScoceview_pj(slot0, slot1)
	if slot1 == "e" then
		setActive(slot0.scoreview:Find("img_list/square/c"), false)
		setActive(slot0.scoreview:Find("img_list/square/b"), false)
		setActive(slot0.scoreview:Find("img_list/square/a"), false)
		setActive(slot0.scoreview:Find("img_list/square/s"), false)
	elseif slot1 == "c" then
		setActive(slot0.scoreview:Find("img_list/square/c"), true)
	elseif slot1 == "b" then
		setActive(slot0.scoreview:Find("img_list/square/b"), true)
	elseif slot1 == "a" then
		setActive(slot0.scoreview:Find("img_list/square/a"), true)
	elseif slot1 == "s" then
		setActive(slot0.scoreview:Find("img_list/square/s"), true)
	end
end

function slot0.Scoceview_ani(slot0)
	slot1 = 0

	setActive(slot0.scoreview:Find("btnlist/reselect"), false)
	setActive(slot0.scoreview:Find("btnlist/restart"), false)
	setActive(slot0.scoreview:Find("btnlist/share"), false)

	slot0.Scoceview_timer = Timer.New(slot2, slot0.time_interval, -1)

	slot0.Scoceview_timer:Start()
end

return slot0
