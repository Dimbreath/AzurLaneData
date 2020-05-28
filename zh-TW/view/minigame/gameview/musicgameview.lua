slot0 = class("MusicGameView", import("..BaseMiniGameView"))

function slot0.getUIName(slot0)
	return "MusicGameUI"
end

function slot0.OnSendMiniGameOPDone(slot0, slot1)
end

function slot0.MyGetRuntimeData(slot0)
	slot0.achieve_times = checkExist(slot0:GetMGData():GetRuntimeData("elements"), {
		1
	}) or 0
	slot0.isFirstgame = PlayerPrefs.GetInt("musicgame_idolIsFirstgame")
	slot0.bestScorelist = {}

	for slot4 = 1, slot0.music_amount * 2 do
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

	for slot5 = 1, slot0.music_amount * 2 do
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
	slot0.game_speed = PlayerPrefs.GetInt("musicgame_idol_speed") > 0 and PlayerPrefs.GetInt("musicgame_idol_speed") or 1
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
	slot0.Getdata_timer = Timer.New(function ()
		uv0 = uv0 + uv1.time_interval

		if uv0 == uv1.time_interval then
			uv1:MyGetRuntimeData()
			uv1:showSelevtView()
		elseif uv0 == uv1.time_interval * 2 then
			uv1:updatSelectview()
			uv1.Getdata_timer:Stop()
		end
	end, slot0.time_interval, -1)

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
		uv0.mousedowningright_flag = true

		setActive(uv0.rightBtmBg, true)
	end)
	slot0.BtnRightDelegate:AddPointUpFunc(function ()
		uv0.mousedowningright_flag = false

		setActive(uv0.rightBtmBg, false)
	end)

	slot0.BtnLeftDelegate = GetOrAddComponent(slot0.game_content:Find("btn_left"), "EventTriggerListener")

	slot0.BtnLeftDelegate:AddPointDownFunc(function ()
		uv0.mousedowningleft_flag = true

		setActive(uv0.leftBtmBg, true)
	end)
	slot0.BtnLeftDelegate:AddPointUpFunc(function ()
		uv0.mousedowningleft_flag = false

		setActive(uv0.leftBtmBg, false)
	end)
	onButton(slot0, slot0.top:Find("pause"), function ()
		uv0.UIMgr:BlurPanel(uv0.pauseview)
		setActive(uv0.pauseview, true)

		uv0.game_playingflag = false

		uv0:effect_play("nothing")

		uv0.pauseview:Find("bottom/song"):GetComponent(typeof(Image)).sprite = uv0.selectview:Find("Main/MusicList/img/" .. uv0.game_music):GetComponent(typeof(Image)).sprite

		if not uv0.ahead_timeflag then
			uv0.song_Tstamp:Pause()

			slot0 = long2int(uv0.song_Tstamp:GetTime())
			slot1 = long2int(uv0.song_Tlength.length)

			function slot2(slot0)
				if slot0 < 10 then
					return "0" .. slot0
				else
					return slot0
				end
			end

			setText(uv0.pauseview:Find("bottom/now"), slot2(math.floor(slot0 / 60000)) .. ":" .. slot2(math.floor(slot0 % 60000 / 1000)))
			setText(uv0.pauseview:Find("bottom/total"), slot2(math.floor(slot1 / 60000)) .. ":" .. slot2(math.floor(slot1 % 60000 / 1000)))
			setActive(uv0.pauseview:Find("bottom/triangle"), true)
			setActive(uv0.pauseview:Find("bottom/TimeSlider"), true)
			setActive(uv0.pauseview:Find("bottom/now"), true)
			setActive(uv0.pauseview:Find("bottom/total"), true)
			setSlider(uv0.pauseview:Find("bottom/TimeSlider"), 0, 1, slot0 / slot1)

			slot5 = uv0.pauseview:Find("bottom/triangle/min").localPosition.x
			slot7 = uv0.pauseview:Find("bottom/triangle/now").localPosition
			uv0.pauseview:Find("bottom/triangle/now").localPosition = Vector3(slot5 + slot0 / slot1 * (uv0.pauseview:Find("bottom/triangle/max").localPosition.x - slot5), slot7.y, slot7.z)

			if uv0.SDname[1] and uv0.SDmodel[1] then
				uv0:setActionSDmodel("stand2")
			end
		else
			setActive(uv0.pauseview:Find("bottom/triangle"), false)
			setActive(uv0.pauseview:Find("bottom/TimeSlider"), false)
			setActive(uv0.pauseview:Find("bottom/now"), false)
			setActive(uv0.pauseview:Find("bottom/total"), false)

			uv0.ahead_timerPauseFlag = true
		end
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.pauseview:Find("bottom/back"), function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("reselect_music_game"),
			onYes = function ()
				uv0.UIMgr:UnblurPanel(uv0.pauseview, uv0._tf)
				setActive(uv0.pauseview, false)
				uv0.timer:Stop()

				if uv0.ahead_timer then
					uv0.ahead_timer:Stop()

					uv0.ahead_timeflag = false
				end

				uv0:piecelistALLTtoF()
				setActive(uv0.selectview, true)

				GetOrAddComponent(uv0.selectview, "CanvasGroup").blocksRaycasts = true

				uv0.song_btns[uv0.game_music]:GetComponent(typeof(Animator)):Play("plate_out")

				uv0.game_playingflag = false

				uv0:loadAndPlayMusic()
				uv0:rec_scorce()
			end
		})
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.pauseview:Find("bottom/restart"), function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("restart_music_game"),
			onYes = function ()
				uv0.UIMgr:UnblurPanel(uv0.pauseview, uv0._tf)
				setActive(uv0.pauseview, false)
				uv0.timer:Stop()

				if uv0.ahead_timer then
					uv0.ahead_timer:Stop()

					uv0.ahead_timeflag = false
				end

				uv0:piecelistALLTtoF()
				uv0:rec_scorce()
				uv0:game_start()
				uv0:effect_play("prepare")
			end
		})
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.pauseview:Find("bottom/resume"), function ()
		uv0.UIMgr:UnblurPanel(uv0.pauseview, uv0._tf)
		setActive(uv0.pauseview, false)
		uv0:effect_play("prepare")

		if not uv0.ahead_timeflag then
			uv0:count_five(function ()
				uv0.song_Tstamp:Resume(CriAtomEx.ResumeMode.PausedPlayback)

				uv0.game_playingflag = true
			end)
		else
			uv0:count_five(function ()
				uv0.ahead_timerPauseFlag = false
				uv0.game_playingflag = true

				setActive(uv0.pauseview:Find("bottom/triangle"), true)
				setActive(uv0.pauseview:Find("bottom/TimeSlider"), true)
				setActive(uv0.pauseview:Find("bottom/now"), true)
				setActive(uv0.pauseview:Find("bottom/total"), true)
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
			slot0:emit(uv0.ON_BACK)
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
		for slot4 = 1, 5 do
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
		for slot4 = 1, 5 do
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
	slot4 = "_"
	slot5 = slot0.game_dgree
	slot0.musicpu = require("view/miniGame/gameView/musicGame/bgm_song0" .. slot0.game_music .. slot4 .. slot5)

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

	for slot6 = 1, slot1[0] - 1 do
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
		uv0.downingright_lastflag = uv0.downingright_flag
		uv0.downingleft_lastflag = uv0.downingleft_flag

		if uv0.useGetKey_flag then
			if uv0.game_dgree == 2 then
				uv0.downingright_flag = Input.GetKey(KeyCode.J)
				uv0.downingleft_flag = Input.GetKey(KeyCode.F)
			elseif uv0.game_dgree == 1 then
				if Input.GetKey(KeyCode.J) or Input.GetKey(KeyCode.F) then
					uv0.downingright_flag = true
					uv0.downingleft_flag = true
				else
					uv0.downingright_flag = false
					uv0.downingleft_flag = false
				end
			end
		elseif uv0.game_dgree == 2 then
			uv0.downingright_flag = uv0.mousedowningright_flag
			uv0.downingleft_flag = uv0.mousedowningleft_flag
		elseif uv0.game_dgree == 1 then
			if uv0.mousedowningright_flag or uv0.mousedowningleft_flag then
				uv0.downingright_flag = true
				uv0.downingleft_flag = true
			else
				uv0.downingright_flag = false
				uv0.downingleft_flag = false
			end
		end

		uv0:SDmodeljump_btnup()

		slot0 = uv0.piecelist_speedmin + (uv0.piecelist_speedmax - uv0.piecelist_speedmin) * uv0.game_speed * 5
		slot1 = uv0.pieceinit_xyz.right.x / slot0
		slot2 = -uv0.pieceinit_xyz.left.x / slot0
		uv0.musicgame_lasttime = uv0.musicgame_nowtime or 0

		if uv0.song_Tstamp then
			if type(uv0.song_Tstamp) ~= "number" then
				uv0.musicgame_nowtime = long2int(uv0.song_Tstamp:GetTime()) / 1000
			else
				uv0.musicgame_nowtime = uv0.song_Tstamp
			end
		else
			uv0.musicgame_nowtime = 0
		end

		if uv0.song_Tlength and not uv0.scoreview_flag and long2int(uv0.song_Tlength.length) / 1000 - uv0.musicgame_nowtime <= 0.01666 then
			uv0.game_playingflag = false

			uv0.CeiMgr_ob:UnloadCueSheet("bgm-song0" .. uv0.game_music)

			if (uv0.good_number > 0 or uv0.perfect_number > 0) and uv0.miss_number <= 0 then
				setActive(uv0.game_content:Find("yinyue_Fullcombo"), true)

				if not uv0.gotspecialcombo_flag then
					uv0.score_number = uv0.score_number + uv0.specialscore_number
					uv0.gotspecialcombo_flag = true
				end

				uv0.game_content:Find("yinyue_Fullcombo"):GetComponent(typeof(ParticleSystemEvent)):SetEndEvent(function ()
					uv0:locadScoreView()
				end)
			else
				uv0:locadScoreView()
			end
		end

		if uv0.nowmusic_l == null and uv0.musictable_l[0] ~= 0 then
			uv0.nowmusic_l = uv0:list_pop(uv0.musictable_l)
		end

		if uv0.nowmusic_r == null and uv0.musictable_r[0] ~= 0 then
			uv0.nowmusic_r = uv0:list_pop(uv0.musictable_r)
		end

		if uv0.musictable_l[0] == 0 and uv0.musictable_r[0] == 0 then
			setActive(uv0.top:Find("pause_above"), true)
		else
			setActive(uv0.top:Find("pause_above"), false)
			setActive(uv0.game_content:Find("yinyue_Fullcombo"), false)
		end

		function slot3(slot0, slot1, slot2, slot3, slot4)
			if slot1 ~= null and tonumber(slot1.begin_time) - slot2 <= uv0.musicgame_nowtime then
				if not uv0:list_pop(slot3) then
					uv0.piece_n = uv0.piece_n + 1
					slot5 = cloneTplTo(uv0.music_piece:Find("piece_" .. slot0), uv0.music_piece, uv0.piece_n)
				end

				setActive(slot5, true)
				uv0:list_push(slot4, {
					ob = slot5,
					begin_time = slot1.begin_time,
					end_time = slot1.end_time,
					key_flag = slot1.key_flag
				})
				slot5:GetComponent(typeof(Transform)):SetAsFirstSibling()

				if uv0.game_dgree == 1 then
					setActive(slot5:Find("1"), true)
					setActive(slot5:Find("2"), false)
				elseif uv0.game_dgree == 2 then
					setActive(slot5:Find("1"), false)
					setActive(slot5:Find("2"), true)
				end

				if slot1.begin_time == slot1.end_time then
					if slot1.key_flag == "K_BOTH" then
						setActive(slot5:Find(uv0.game_dgree .. "/note_2"), true)

						slot5:Find(uv0.game_dgree .. "/note_2"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, 1)

						setActive(slot5:Find(uv0.game_dgree .. "/notelong_2"), false)
						setActive(slot5:Find(uv0.game_dgree .. "/note_1"), false)
						setActive(slot5:Find(uv0.game_dgree .. "/notelong_1"), false)
					else
						setActive(slot5:Find(uv0.game_dgree .. "/note_1"), true)

						slot5:Find(uv0.game_dgree .. "/note_1"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, 1)

						setActive(slot5:Find(uv0.game_dgree .. "/notelong_1"), false)
						setActive(slot5:Find(uv0.game_dgree .. "/note_2"), false)
						setActive(slot5:Find(uv0.game_dgree .. "/notelong_2"), false)
					end
				elseif slot1.key_flag == "K_BOTH" then
					setActive(slot5:Find(uv0.game_dgree .. "/note_2"), false)
					setActive(slot5:Find(uv0.game_dgree .. "/notelong_2"), true)
					setActive(slot5:Find(uv0.game_dgree .. "/note_1"), false)
					setActive(slot5:Find(uv0.game_dgree .. "/notelong_1"), false)

					slot5:Find(uv0.game_dgree .. "/notelong_2/note_above/below"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, 1)
					slot5:Find(uv0.game_dgree .. "/notelong_2/note_above/above"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, 1)
					slot8 = slot5:Find(uv0.game_dgree .. "/notelong_2/note_above"):GetComponent(typeof(RectTransform)).offsetMax

					if slot0 == "left" then
						slot5:Find(uv0.game_dgree .. "/notelong_2/note_above"):GetComponent(typeof(RectTransform)).offsetMin = Vector2(274 - 1142 / uv1 * (slot1.end_time - slot1.begin_time) < 274 and slot9 or 274, slot5:Find(uv0.game_dgree .. "/notelong_2/note_above"):GetComponent(typeof(RectTransform)).offsetMin.y)
					elseif slot0 == "right" then
						slot5:Find(uv0.game_dgree .. "/notelong_2/note_above"):GetComponent(typeof(RectTransform)).offsetMax = Vector2(-slot9, slot8.y)
					end
				else
					setActive(slot5:Find(uv0.game_dgree .. "/note_1"), false)
					setActive(slot5:Find(uv0.game_dgree .. "/notelong_1"), true)
					setActive(slot5:Find(uv0.game_dgree .. "/note_2"), false)
					setActive(slot5:Find(uv0.game_dgree .. "/notelong_2"), false)

					slot5:Find(uv0.game_dgree .. "/notelong_1/note_above/below"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, 1)
					slot5:Find(uv0.game_dgree .. "/notelong_1/note_above/above"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, 1)
					slot8 = slot5:Find(uv0.game_dgree .. "/notelong_1/note_above"):GetComponent(typeof(RectTransform)).offsetMax

					if slot0 == "left" then
						slot5:Find(uv0.game_dgree .. "/notelong_1/note_above"):GetComponent(typeof(RectTransform)).offsetMin = Vector2(274 - 1142 / uv1 * (slot1.end_time - slot1.begin_time) < 274 and slot9 or 274, slot5:Find(uv0.game_dgree .. "/notelong_1/note_above"):GetComponent(typeof(RectTransform)).offsetMin.y)
					elseif slot0 == "right" then
						slot5:Find(uv0.game_dgree .. "/notelong_1/note_above"):GetComponent(typeof(RectTransform)).offsetMax = Vector2(-slot9, slot8.y)
					end
				end

				return null
			end

			return slot1
		end

		uv0.nowmusic_l = slot3("left", uv0.nowmusic_l, slot2, uv0.piecelist_lf, uv0.piecelist_lt)
		uv0.nowmusic_r = slot3("right", uv0.nowmusic_r, slot1, uv0.piecelist_rf, uv0.piecelist_rt)

		function slot4(slot0, slot1, slot2, slot3)
			if uv0.game_dgree == 1 then
				if slot0 == "left" and (uv0.piece_nowl.ob or uv0.piece_nowr.ob) and uv0.downingleft_flag and not uv0.downingleft_lastflag and not uv0.piece_nowl_aloneflag then
					if uv0.piece_nowl.ob and uv0.piece_nowr.ob then
						if uv0.piece_nowl.begin_time - uv0.piece_nowr.begin_time < 0 then
							if uv0.musicgame_nowtime - uv0.piece_nowl.begin_time < uv0.time_laterperfect then
								uv0:score_update(2)
							else
								uv0:score_update(1)
							end

							uv0.piece_nowl.ob.localPosition = uv0.pieceinit_xyz.left

							setActive(uv0.piece_nowl.ob, false)
							uv0:list_push(uv0.piecelist_lf, uv0.piece_nowl.ob)

							uv0.piece_nowl.ob = false
						else
							if uv0.musicgame_nowtime - uv0.piece_nowr.begin_time < uv0.time_laterperfect then
								uv0:score_update(2)
							else
								uv0:score_update(1)
							end

							uv0.piece_nowr.ob.localPosition = uv0.pieceinit_xyz.right

							setActive(uv0.piece_nowr.ob, false)
							uv0:list_push(uv0.piecelist_rf, uv0.piece_nowr.ob)

							uv0.piece_nowr.ob = false
						end
					elseif uv0.piece_nowl.ob and not uv0.piece_nowr.ob then
						if uv0.musicgame_nowtime - uv0.piece_nowl.begin_time < uv0.time_laterperfect then
							uv0:score_update(2)
						else
							uv0:score_update(1)
						end

						uv0.piece_nowl.ob.localPosition = uv0.pieceinit_xyz.left

						setActive(uv0.piece_nowl.ob, false)
						uv0:list_push(uv0.piecelist_lf, uv0.piece_nowl.ob)

						uv0.piece_nowl.ob = false
					elseif not uv0.piece_nowl.ob and uv0.piece_nowr.ob then
						if uv0.musicgame_nowtime - uv0.piece_nowr.begin_time < uv0.time_laterperfect then
							uv0:score_update(2)
						else
							uv0:score_update(1)
						end

						uv0.piece_nowr.ob.localPosition = uv0.pieceinit_xyz.right

						setActive(uv0.piece_nowr.ob, false)
						uv0:list_push(uv0.piecelist_rf, uv0.piece_nowr.ob)

						uv0.piece_nowr.ob = false
					end

					uv0.piece_nowl_aloneflag = true
				elseif slot0 == "left" and uv0.piece_nowl.ob and uv0.piece_nowl.begin_time == uv0.piece_nowl.end_time and not uv0.downingleft_flag and uv0.downingleft_lastflag then
					uv0.piece_nowl_aloneflag = false
					uv0.piece_nowl_downflag = false
				elseif slot0 == "left" and (uv0.piecelist_lt[0] ~= 0 and uv0.piecelist_lt[1].ob or uv0.piecelist_rt[0] ~= 0 and uv0.piecelist_rt[1].ob) and uv0.downingleft_flag and not uv0.downingleft_lastflag then
					if uv0.piecelist_lt[0] ~= 0 and uv0.piecelist_lt[1].ob and uv0.piecelist_rt[0] ~= 0 and uv0.piecelist_rt[1].ob then
						if uv0.piecelist_lt[1].begin_time - uv0.piecelist_rt[1].begin_time < 0 then
							if uv0.piecelist_lt[1].begin_time - uv0.musicgame_nowtime < uv0.time_miss then
								if uv0.piecelist_lt[1].begin_time - uv0.musicgame_nowtime < uv0.time_good then
									if uv0.piecelist_lt[1].begin_time - uv0.musicgame_nowtime < uv0.time_perfect then
										uv0:score_update(2)
									else
										uv0:score_update(1)
									end
								else
									uv0:score_update(0)
								end

								uv0.piecelist_lt[1].ob.localPosition = uv0.pieceinit_xyz.left

								setActive(uv0.piecelist_lt[1].ob, false)
								uv0:list_push(uv0.piecelist_lf, uv0:list_pop(uv0.piecelist_lt).ob)
							end
						elseif uv0.piecelist_rt[1].begin_time - uv0.musicgame_nowtime < uv0.time_miss then
							if uv0.piecelist_rt[1].begin_time - uv0.musicgame_nowtime < uv0.time_good then
								if uv0.piecelist_rt[1].begin_time - uv0.musicgame_nowtime < uv0.time_perfect then
									uv0:score_update(2)
								else
									uv0:score_update(1)
								end
							else
								uv0:score_update(0)
							end

							uv0.piecelist_rt[1].ob.localPosition = uv0.pieceinit_xyz.right

							setActive(uv0.piecelist_rt[1].ob, false)
							uv0:list_push(uv0.piecelist_rf, uv0:list_pop(uv0.piecelist_rt).ob)
						end
					elseif uv0.piecelist_lt[0] ~= 0 and uv0.piecelist_lt[1].ob and (uv0.piecelist_rt[0] == 0 or not uv0.piecelist_rt[1].ob) then
						if uv0.piecelist_lt[1].begin_time - uv0.musicgame_nowtime < uv0.time_miss then
							if uv0.piecelist_lt[1].begin_time - uv0.musicgame_nowtime < uv0.time_good then
								if uv0.piecelist_lt[1].begin_time - uv0.musicgame_nowtime < uv0.time_perfect then
									uv0:score_update(2)
								else
									uv0:score_update(1)
								end
							else
								uv0:score_update(0)
							end

							uv0.piecelist_lt[1].ob.localPosition = uv0.pieceinit_xyz.left

							setActive(uv0.piecelist_lt[1].ob, false)
							uv0:list_push(uv0.piecelist_lf, uv0:list_pop(uv0.piecelist_lt).ob)
						end
					elseif (uv0.piecelist_lt[0] == 0 or not uv0.piecelist_lt[1].ob) and uv0.piecelist_rt[0] ~= 0 and uv0.piecelist_rt[1].ob and uv0.piecelist_rt[1].begin_time - uv0.musicgame_nowtime < uv0.time_miss then
						if uv0.piecelist_rt[1].begin_time - uv0.musicgame_nowtime < uv0.time_good then
							if uv0.piecelist_rt[1].begin_time - uv0.musicgame_nowtime < uv0.time_perfect then
								uv0:score_update(2)
							else
								uv0:score_update(1)
							end
						else
							uv0:score_update(0)
						end

						uv0.piecelist_rt[1].ob.localPosition = uv0.pieceinit_xyz.right

						setActive(uv0.piecelist_rt[1].ob, false)
						uv0:list_push(uv0.piecelist_rf, uv0:list_pop(uv0.piecelist_rt).ob)
					end

					uv0.piece_nowl_aloneflag = true
				elseif slot0 == "left" and slot2[0] ~= 0 and slot2[1].ob and slot2[1].begin_time == slot2[1].end_time and not uv0.downingleft_flag and uv0.downingleft_lastflag then
					uv0.piece_nowl_aloneflag = false
					uv0.piece_nowl_downflag = false
				elseif not uv0.downingleft_flag then
					uv0.piece_nowl_aloneflag = false
					uv0.piece_nowl_downflag = false
				end
			end

			if uv0.game_dgree == 2 then
				function slot5()
					if uv0.musicgame_nowtime - uv0.piece_nowr.begin_time < uv0.time_laterperfect then
						uv0:score_update(2)
					elseif uv0.musicgame_nowtime - uv0.piece_nowr.begin_time < uv0.time_latergood then
						uv0:score_update(1)
					end

					uv0.piece_nowr.ob.localPosition = uv0.pieceinit_xyz.right

					setActive(uv0.piece_nowr.ob, false)
					uv0:list_push(uv0.piecelist_rf, uv0.piece_nowr.ob)

					uv0.piece_nowr.ob = false
					uv0.piece_nowr_aloneflag = true
				end

				function slot6()
					if uv0.piecelist_lt[1].begin_time - uv0.musicgame_nowtime < uv0.time_miss then
						if uv0.piecelist_lt[1].begin_time - uv0.musicgame_nowtime < uv0.time_good then
							if uv0.piecelist_lt[1].begin_time - uv0.musicgame_nowtime < uv0.time_perfect then
								uv0:score_update(2)
							else
								uv0:score_update(1)
							end
						else
							uv0:score_update(0)
						end

						uv0.piecelist_lt[1].ob.localPosition = uv0.pieceinit_xyz.left

						setActive(uv0.piecelist_lt[1].ob, false)
						uv0:list_push(uv0.piecelist_lf, uv0:list_pop(uv0.piecelist_lt).ob)

						uv0.piece_nowl_aloneflag = true
					end
				end

				function slot7()
					if uv0.piecelist_rt[1].begin_time - uv0.musicgame_nowtime < uv0.time_miss then
						if uv0.piecelist_rt[1].begin_time - uv0.musicgame_nowtime < uv0.time_good then
							if uv0.piecelist_rt[1].begin_time - uv0.musicgame_nowtime < uv0.time_perfect then
								uv0:score_update(2)
							else
								uv0:score_update(1)
							end
						else
							uv0:score_update(0)
						end

						uv0.piecelist_rt[1].ob.localPosition = uv0.pieceinit_xyz.right

						setActive(uv0.piecelist_rt[1].ob, false)
						uv0:list_push(uv0.piecelist_rf, uv0:list_pop(uv0.piecelist_rt).ob)

						uv0.piece_nowr_aloneflag = true
					end
				end

				function slot8()
					if uv0.musicgame_nowtime - uv0.piece_nowl.begin_time <= uv0.time_laterperfect then
						if not uv0.piece_nowl_downflag then
							uv0.piece_nowl_downflag = true

							uv0:score_update(2)
						end
					elseif uv0.musicgame_nowtime - uv0.piece_nowl.begin_time <= uv0.time_latergood and not uv0.piece_nowl_downflag then
						uv0.piece_nowl_downflag = true

						uv0:score_update(1)
					end

					if uv0.musicgame_nowtime - uv0.piece_nowl.end_time > uv0.time_latergood - uv0.time_interval and uv0.piece_nowl_downflag then
						uv0.piece_nowl_downflag = false

						uv0:score_update(0)
					end
				end

				function slot9()
					if uv0.musicgame_nowtime - uv0.piece_nowr.begin_time <= uv0.time_laterperfect then
						if not uv0.piece_nowr_downflag then
							uv0.piece_nowr_downflag = true

							uv0:score_update(2)
						end
					elseif uv0.musicgame_nowtime - uv0.piece_nowr.begin_time <= uv0.time_latergood and not uv0.piece_nowr_downflag then
						uv0.piece_nowr_downflag = true

						uv0:score_update(1)
					end

					if uv0.musicgame_nowtime - uv0.piece_nowr.end_time > uv0.time_latergood - uv0.time_interval and uv0.piece_nowr_downflag then
						uv0.piece_nowr_downflag = false

						uv0:score_update(0)
					end
				end

				function slot10()
					if uv0.piece_nowl.end_time - uv0.musicgame_nowtime < uv0.time_good and uv0.piece_nowl_downflag and uv0.musicgame_nowtime - uv0.piece_nowl.end_time < uv0.time_latergood then
						if uv0.piece_nowl.end_time - uv0.musicgame_nowtime < uv0.time_perfect and uv0.musicgame_nowtime - uv0.piece_nowl.end_time < uv0.time_laterperfect then
							uv0:score_update(2)
						else
							uv0:score_update(1)
						end
					else
						uv0:score_update(0)
					end

					uv0.piece_nowl.ob.localPosition = uv0.pieceinit_xyz.left

					setActive(uv0.piece_nowl.ob, false)
					uv0:list_push(uv0.piecelist_lf, uv0.piece_nowl.ob)

					uv0.piece_nowl.ob = false
					uv0.piece_nowl_downflag = false
					uv0.piece_nowl_aloneflag = false
				end

				function slot11()
					if uv0.piece_nowr.end_time - uv0.musicgame_nowtime < uv0.time_good and uv0.piece_nowr_downflag and uv0.musicgame_nowtime - uv0.piece_nowr.end_time < uv0.time_latergood then
						if uv0.piece_nowr.end_time - uv0.musicgame_nowtime < uv0.time_perfect and uv0.musicgame_nowtime - uv0.piece_nowr.end_time < uv0.time_laterperfect then
							uv0:score_update(2)
						else
							uv0:score_update(1)
						end
					else
						uv0:score_update(0)
					end

					uv0.piece_nowr.ob.localPosition = uv0.pieceinit_xyz.right

					setActive(uv0.piece_nowr.ob, false)
					uv0:list_push(uv0.piecelist_rf, uv0.piece_nowr.ob)

					uv0.piece_nowr.ob = false
					uv0.piece_nowr_downflag = false
					uv0.piece_nowr_aloneflag = false
				end

				function slot12()
					if uv0.musicgame_nowtime - uv0.piece_nowl.begin_time > uv0.time_latergood - uv0.time_interval then
						uv0.piece_nowl_downflag = false
						uv0.piece_nowl.ob.localPosition = uv0.pieceinit_xyz.left

						setActive(uv0.piece_nowl.ob, false)
						uv0:list_push(uv0.piecelist_lf, uv0.piece_nowl.ob)

						uv0.piece_nowl.ob = false

						uv0:score_update(0)
						uv0:score_update(0)
					end
				end

				function slot13()
					if uv0.musicgame_nowtime - uv0.piece_nowr.begin_time > uv0.time_latergood - uv0.time_interval then
						uv0.piece_nowr_downflag = false
						uv0.piece_nowr.ob.localPosition = uv0.pieceinit_xyz.right

						setActive(uv0.piece_nowr.ob, false)
						uv0:list_push(uv0.piecelist_rf, uv0.piece_nowr.ob)

						uv0.piece_nowr.ob = false

						uv0:score_update(0)
						uv0:score_update(0)
					end
				end

				function slot14()
					if uv1.time_good < uv0[1].begin_time - uv1.musicgame_nowtime and uv0[1].begin_time - uv1.musicgame_nowtime < uv1.time_miss then
						uv0[1].ob.localPosition = uv1.pieceinit_xyz.left

						setActive(uv0[1].ob, false)
						uv1:list_push(uv1.piecelist_lf, uv1:list_pop(uv0).ob)

						uv1.piece_nowl_downflag = false

						uv1:score_update(0)
						uv1:score_update(0)
					end
				end

				function slot15()
					if uv1.time_good < uv0[1].begin_time - uv1.musicgame_nowtime and uv0[1].begin_time - uv1.musicgame_nowtime < uv1.time_miss then
						uv0[1].ob.localPosition = uv1.pieceinit_xyz.right

						setActive(uv0[1].ob, false)
						uv1:list_push(uv1.piecelist_rf, uv1:list_pop(uv0).ob)

						uv1.piece_nowr_downflag = false

						uv1:score_update(0)
						uv1:score_update(0)
					end
				end

				function slot16()
					if not uv0.piece_nowl_aloneflag and uv1[1].begin_time - uv0.musicgame_nowtime <= uv0.time_good and not uv0.piece_nowl_downflag then
						uv0.piece_nowl_downflag = true

						if uv1[1].begin_time - uv0.musicgame_nowtime <= uv0.time_perfect then
							uv0:score_update(2)
						else
							uv0:score_update(1)
						end
					end
				end

				function slot17()
					if not uv0.piece_nowr_aloneflag and uv1[1].begin_time - uv0.musicgame_nowtime <= uv0.time_good and not uv0.piece_nowr_downflag then
						uv0.piece_nowr_downflag = true

						if uv1[1].begin_time - uv0.musicgame_nowtime <= uv0.time_perfect then
							uv0:score_update(2)
						else
							uv0:score_update(1)
						end
					end
				end

				function slot18()
					if not uv0.piece_nowl_aloneflag and uv0.piece_nowl_downflag then
						uv1[1].ob.localPosition = uv0.pieceinit_xyz.left

						setActive(uv1[1].ob, false)
						uv0:list_push(uv0.piecelist_lf, uv0:list_pop(uv1).ob)

						uv0.piece_nowl_downflag = false

						uv0:score_update(0)
						uv0:score_update(0)
					end

					uv0.piece_nowl_aloneflag = false
				end

				function slot19()
					if not uv0.piece_nowr_aloneflag and uv0.piece_nowr_downflag then
						uv1[1].ob.localPosition = uv0.pieceinit_xyz.right

						setActive(uv1[1].ob, false)
						uv0:list_push(uv0.piecelist_rf, uv0:list_pop(uv1).ob)

						uv0.piece_nowr_downflag = false

						uv0:score_update(0)
						uv0:score_update(0)
					end

					uv0.piece_nowr_aloneflag = false
				end

				if slot0 == "left" and uv0.piece_nowl.ob and uv0.piece_nowl.begin_time == uv0.piece_nowl.end_time and uv0.downingleft_flag and not uv0.downingleft_lastflag then
					if uv0.piece_nowl.key_flag ~= "K_BOTH" and not uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag then
						function ()
							if uv0.musicgame_nowtime - uv0.piece_nowl.begin_time < uv0.time_laterperfect then
								uv0:score_update(2)
							elseif uv0.musicgame_nowtime - uv0.piece_nowl.begin_time < uv0.time_latergood then
								uv0:score_update(1)
							end

							uv0.piece_nowl.ob.localPosition = uv0.pieceinit_xyz.left

							setActive(uv0.piece_nowl.ob, false)
							uv0:list_push(uv0.piecelist_lf, uv0.piece_nowl.ob)

							uv0.piece_nowl.ob = false
							uv0.piece_nowl_aloneflag = true
						end()
					elseif uv0.piece_nowr.key_flag == "K_BOTH" and uv0.piece_nowr.ob and uv0.downingright_flag and not uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag and not uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag then
						slot4()
						slot5()
					end
				elseif slot0 == "left" and uv0.piece_nowl.ob and uv0.piece_nowl.begin_time == uv0.piece_nowl.end_time and not uv0.downingleft_flag and uv0.downingleft_lastflag then
					uv0.piece_nowl_aloneflag = false
					uv0.piece_nowl_downflag = false
				elseif slot0 == "left" and uv0.piece_nowl.ob and uv0.piece_nowl.begin_time ~= uv0.piece_nowl.end_time and uv0.downingleft_flag and uv0.downingleft_lastflag and not uv0.piece_nowl_aloneflag and uv0.piece_nowl.key_flag ~= "K_BOTH" then
					if uv0.piece_nowl.key_flag ~= "K_BOTH" and not uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag then
						slot8()
					elseif uv0.piece_nowr.key_flag == "K_BOTH" and uv0.piece_nowr.ob and uv0.downingright_flag and not uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag and not uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag then
						slot8()
						slot9()
					end
				elseif slot0 == "left" and uv0.piece_nowl.ob and uv0.piece_nowl.begin_time ~= uv0.piece_nowl.end_time and not uv0.downingleft_flag and uv0.downingleft_lastflag and uv0.piece_nowl.key_flag ~= "K_BOTH" then
					if uv0.piece_nowl.key_flag ~= "K_BOTH" and uv0.piece_nowl_downflag then
						slot10()
					elseif uv0.piece_nowr.key_flag == "K_BOTH" and uv0.piece_nowr.ob and uv0.piece_nowl_downflag and not uv0.downingright_flag then
						slot10()
						slot11()
					end
				elseif slot0 == "left" and uv0.piece_nowl.ob and uv0.piece_nowl.begin_time ~= uv0.piece_nowl.end_time and (not uv0.downingleft_flag or not uv0.downingleft_lastflag) and uv0.piece_nowl.key_flag ~= "K_BOTH" then
					slot12()
				elseif slot0 == "left" and slot2[0] ~= 0 and slot2[1].ob and slot2[1].begin_time == slot2[1].end_time and uv0.downingleft_flag and not uv0.downingleft_lastflag then
					if slot2[1].key_flag ~= "K_BOTH" and not uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag then
						slot6()
					elseif uv0.piecelist_rt[1].key_flag == "K_BOTH" and uv0.piecelist_rt[1].ob and uv0.downingright_flag and not uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag and uv0.downingleft_flag and not uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag then
						slot6()
						slot7()
					end
				elseif slot0 == "left" and slot2[0] ~= 0 and slot2[1].ob and slot2[1].begin_time == slot2[1].end_time and not uv0.downingleft_flag and uv0.downingleft_lastflag then
					uv0.piece_nowl_aloneflag = false
					uv0.piece_nowl_downflag = false
				elseif slot0 == "left" and slot2[0] ~= 0 and slot2[1].ob and slot2[1].begin_time ~= slot2[1].end_time and uv0.downingleft_flag and not uv0.downingleft_lastflag and slot2[1].key_flag ~= "K_BOTH" then
					if slot2[1].key_flag ~= "K_BOTH" and not uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag then
						slot14()
					elseif uv0.piecelist_rt[1].key_flag == "K_BOTH" and uv0.piecelist_rt[1].ob and uv0.downingright_flag and not uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag and uv0.downingleft_flag and not uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag then
						slot14()
						slot15()
					end
				elseif slot0 == "left" and slot2[0] ~= 0 and slot2[1].ob and slot2[1].begin_time ~= slot2[1].end_time and uv0.downingleft_flag and uv0.downingleft_lastflag and not uv0.piece_nowl_aloneflag and slot2[1].key_flag ~= "K_BOTH" then
					if slot2[1].key_flag ~= "K_BOTH" and not uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag then
						slot16()
					elseif uv0.piecelist_rt[1].key_flag == "K_BOTH" and uv0.piecelist_rt[1].ob and uv0.downingright_flag and not uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag and uv0.downingleft_flag and not uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag then
						slot16()
						slot17()
					end
				elseif slot0 == "left" and slot2[0] ~= 0 and slot2[1].ob and slot2[1].begin_time ~= slot2[1].end_time and not uv0.downingleft_flag and uv0.downingleft_lastflag and slot2[1].key_flag ~= "K_BOTH" then
					if slot2[1].key_flag ~= "K_BOTH" and uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag then
						slot18()
					elseif uv0.piecelist_rt[1].key_flag == "K_BOTH" and uv0.piecelist_rt[1].ob and uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag and uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag then
						slot18()
						slot19()
					end
				elseif not uv0.downingleft_flag and not uv0.downingleft_lastflag then
					uv0.piece_nowl_aloneflag = false
					uv0.piece_nowl_downflag = false
				end

				if slot0 == "right" and uv0.piece_nowr.ob and uv0.piece_nowr.begin_time == uv0.piece_nowr.end_time and uv0.downingright_flag and not uv0.downingright_lastflag then
					if uv0.piece_nowr.key_flag ~= "K_BOTH" and not uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag then
						slot5()
					elseif uv0.piece_nowl.key_flag == "K_BOTH" and uv0.piece_nowl.ob and uv0.downingleft_flag and not uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag and not uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag then
						slot5()
						slot4()
					end
				elseif slot0 == "right" and uv0.piece_nowr.ob and uv0.piece_nowr.begin_time == uv0.piece_nowr.end_time and not uv0.downingright_flag and uv0.downingright_lastflag then
					uv0.piece_nowr_aloneflag = false
					uv0.piece_nowr_downflag = false
				elseif slot0 == "right" and uv0.piece_nowr.ob and uv0.piece_nowr.begin_time ~= uv0.piece_nowr.end_time and uv0.downingright_flag and uv0.downingright_lastflag and not uv0.piece_nowr_aloneflag and uv0.piece_nowr.key_flag ~= "K_BOTH" then
					if uv0.piece_nowr.key_flag ~= "K_BOTH" and not uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag then
						slot9()
					elseif uv0.piece_nowl.key_flag == "K_BOTH" and uv0.piece_nowl.ob and uv0.downingleft_flag and not uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag and not uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag then
						slot9()
						slot8()
					end
				elseif slot0 == "right" and uv0.piece_nowr.ob and uv0.piece_nowr.begin_time ~= uv0.piece_nowr.end_time and not uv0.downingright_flag and uv0.downingright_lastflag and uv0.piece_nowr.key_flag ~= "K_BOTH" then
					if uv0.piece_nowr.key_flag ~= "K_BOTH" and uv0.piece_nowr_downflag then
						slot11()
					elseif uv0.piece_nowl.key_flag == "K_BOTH" and uv0.piece_nowl.ob and uv0.piece_nowr_downflag and not uv0.downingleft_flag then
						slot11()
						slot10()
					end
				elseif slot0 == "right" and uv0.piece_nowr.ob and uv0.piece_nowr.begin_time ~= uv0.piece_nowr.end_time and (not uv0.downingright_flag or not uv0.downingright_lastflag) and uv0.piece_nowr.key_flag ~= "K_BOTH" then
					slot13()
				elseif slot0 == "right" and slot2[0] ~= 0 and slot2[1].ob and slot2[1].begin_time == slot2[1].end_time and uv0.downingright_flag and not uv0.downingright_lastflag then
					if slot2[1].key_flag ~= "K_BOTH" and not uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag then
						slot7()
					elseif uv0.piecelist_lt[1].key_flag == "K_BOTH" and uv0.piecelist_lt[1].ob and uv0.downingright_flag and not uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag and uv0.downingleft_flag and not uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag then
						slot7()
						slot6()
					end
				elseif slot0 == "right" and slot2[0] ~= 0 and slot2[1].ob and slot2[1].begin_time == slot2[1].end_time and uv0.downingright_flag and not uv0.downingright_lastflag then
					uv0.piece_nowr_aloneflag = false
					uv0.piece_nowr_downflag = false
				elseif slot0 == "right" and slot2[0] ~= 0 and slot2[1].ob and slot2[1].begin_time ~= slot2[1].end_time and uv0.downingright_flag and not uv0.downingright_lastflag and slot2[1].key_flag ~= "K_BOTH" then
					if slot2[1].key_flag ~= "K_BOTH" and not uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag then
						slot15()
					elseif uv0.piecelist_lt[1].key_flag == "K_BOTH" and uv0.piecelist_lt[1].ob and uv0.downingright_flag and not uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag and uv0.downingleft_flag and not uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag then
						slot15()
						slot14()
					end
				elseif slot0 == "right" and slot2[0] ~= 0 and slot2[1].ob and slot2[1].begin_time ~= slot2[1].end_time and uv0.downingright_flag and uv0.downingright_lastflag and not uv0.piece_nowr_aloneflag and slot2[1].key_flag ~= "K_BOTH" then
					if slot2[1].key_flag ~= "K_BOTH" and not uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag then
						slot17()
					elseif uv0.piecelist_lt[1].key_flag == "K_BOTH" and uv0.piecelist_lt[1].ob and uv0.downingright_flag and not uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag and uv0.downingleft_flag and not uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag then
						slot17()
						slot16()
					end
				elseif slot0 == "right" and slot2[0] ~= 0 and slot2[1].ob and slot2[1].begin_time ~= slot2[1].end_time and not uv0.downingright_flag and uv0.downingright_lastflag and slot2[1].key_flag ~= "K_BOTH" then
					if slot2[1].key_flag ~= "K_BOTH" and uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag then
						slot19()
					elseif uv0.piecelist_lt[1].key_flag == "K_BOTH" and uv0.piecelist_lt[1].ob and uv0.piece_nowr_downflag and not uv0.piece_nowr_aloneflag and uv0.piece_nowl_downflag and not uv0.piece_nowl_aloneflag then
						slot19()
						slot18()
					end
				elseif not uv0.downingright_flag and not uv0.downingright_lastflag then
					uv0.piece_nowr_aloneflag = false
					uv0.piece_nowr_downflag = false
				end
			end

			for slot8 = 1, slot2[0] do
				slot9 = uv0:list_pop(slot2)
				slot10 = slot9.ob.localPosition

				if slot0 == "left" then
					slot9.ob.localPosition = Vector3(uv0.pieceinit_xyz[slot0].x + (uv0.musicgame_nowtime - slot9.begin_time + slot1) * uv1, slot10.y, slot10.z)

					if slot9.ob.localPosition.x < 0 then
						uv0:list_push(slot2, slot9)
					else
						slot9.ob.localPosition = Vector3(0, slot10.y, slot10.z)

						if uv0.piece_nowl.ob then
							uv0.piece_nowl.ob.localPosition = Vector3(uv0.pieceinit_xyz.left.x, slot10.y, slot10.z)

							setActive(uv0.piece_nowl.ob, false)
							uv0:list_push(slot3, uv0.piece_nowl.ob)
						end

						uv0.piece_nowl.ob = slot9.ob
						uv0.piece_nowl.begin_time = slot9.begin_time
						uv0.piece_nowl.end_time = slot9.end_time
						uv0.piece_nowl.key_flag = slot9.key_flag

						uv0.piece_nowl.ob:GetComponent(typeof(Transform)):SetAsFirstSibling()
					end
				elseif slot0 == "right" then
					slot9.ob.localPosition = Vector3(uv0.pieceinit_xyz[slot0].x - slot11, slot10.y, slot10.z)

					if slot9.ob.localPosition.x > 0 then
						uv0:list_push(slot2, slot9)
					else
						slot9.ob.localPosition = Vector3(0, slot10.y, slot10.z)

						if uv0.piece_nowr.ob then
							uv0.piece_nowr.ob.localPosition = Vector3(uv0.pieceinit_xyz.right.x, slot10.y, slot10.z)

							setActive(uv0.piece_nowr.ob, false)
							uv0:list_push(slot3, uv0.piece_nowr.ob)
						end

						uv0.piece_nowr.ob = slot9.ob
						uv0.piece_nowr.begin_time = slot9.begin_time
						uv0.piece_nowr.end_time = slot9.end_time
						uv0.piece_nowr.key_flag = slot9.key_flag

						uv0.piece_nowr.ob:GetComponent(typeof(Transform)):SetAsFirstSibling()
					end
				end
			end

			if slot0 == "left" and uv0.piece_nowl.ob and uv0.piece_nowl.begin_time == uv0.piece_nowl.end_time then
				if uv0.piece_nowl.key_flag == "K_BOTH" then
					uv0.piece_nowl.ob:Find(uv0.game_dgree .. "/note_2"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, uv0.piece_nowl.ob:Find(uv0.game_dgree .. "/note_2"):GetComponent(typeof(Image)).color.a - (uv0.musicgame_nowtime - uv0.musicgame_lasttime) / uv0.time_latergood)

					if uv0.piece_nowl.ob:Find(uv0.game_dgree .. "/note_2"):GetComponent(typeof(Image)).color.a <= 0 then
						uv0.piece_nowl.ob.localPosition = uv0.pieceinit_xyz.left

						setActive(uv0.piece_nowl.ob, false)
						uv0:list_push(slot3, uv0.piece_nowl.ob)

						uv0.piece_nowl.ob = false

						uv0:score_update(0)
					end
				else
					uv0.piece_nowl.ob:Find(uv0.game_dgree .. "/note_1"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, uv0.piece_nowl.ob:Find(uv0.game_dgree .. "/note_1"):GetComponent(typeof(Image)).color.a - (uv0.musicgame_nowtime - uv0.musicgame_lasttime) / uv0.time_latergood)

					if uv0.piece_nowl.ob:Find(uv0.game_dgree .. "/note_1"):GetComponent(typeof(Image)).color.a <= 0 then
						uv0.piece_nowl.ob.localPosition = uv0.pieceinit_xyz.left

						setActive(uv0.piece_nowl.ob, false)
						uv0:list_push(slot3, uv0.piece_nowl.ob)

						uv0.piece_nowl.ob = false

						uv0:score_update(0)
					end
				end
			end

			if slot0 == "right" and uv0.piece_nowr.ob and uv0.piece_nowr.begin_time == uv0.piece_nowr.end_time then
				if uv0.piece_nowl.key_flag == "K_BOTH" then
					uv0.piece_nowr.ob:Find(uv0.game_dgree .. "/note_2"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, uv0.piece_nowr.ob:Find(uv0.game_dgree .. "/note_2"):GetComponent(typeof(Image)).color.a - (uv0.musicgame_nowtime - uv0.musicgame_lasttime) / uv0.time_latergood)

					if uv0.piece_nowr.ob:Find(uv0.game_dgree .. "/note_2"):GetComponent(typeof(Image)).color.a <= 0 then
						uv0.piece_nowr.ob.localPosition = uv0.pieceinit_xyz.right

						setActive(uv0.piece_nowr.ob, false)
						uv0:list_push(slot3, uv0.piece_nowr.ob)

						uv0.piece_nowr.ob = false

						uv0:score_update(0)
					end
				else
					uv0.piece_nowr.ob:Find(uv0.game_dgree .. "/note_1"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, uv0.piece_nowr.ob:Find(uv0.game_dgree .. "/note_1"):GetComponent(typeof(Image)).color.a - (uv0.musicgame_nowtime - uv0.musicgame_lasttime) / uv0.time_latergood)

					if uv0.piece_nowr.ob:Find(uv0.game_dgree .. "/note_1"):GetComponent(typeof(Image)).color.a <= 0 then
						uv0.piece_nowr.ob.localPosition = uv0.pieceinit_xyz.right

						setActive(uv0.piece_nowr.ob, false)
						uv0:list_push(slot3, uv0.piece_nowr.ob)

						uv0.piece_nowr.ob = false

						uv0:score_update(0)
					end
				end
			end

			if slot0 == "left" and uv0.piece_nowl.ob and uv0.piece_nowl.begin_time ~= uv0.piece_nowl.end_time then
				if uv0.piece_nowl.key_flag == "K_BOTH" then
					uv0.piece_nowl.ob:Find(uv0.game_dgree .. "/notelong_2/note_above/below"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, uv0.piece_nowl_downflag and 1 or 0.4)
					uv0.piece_nowl.ob:Find(uv0.game_dgree .. "/notelong_2/note_above/above"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, uv0.piece_nowl_downflag and 1 or 0.8)
					uv0.piece_nowl.ob:Find(uv0.game_dgree .. "/notelong_2/note_above"):GetComponent(typeof(RectTransform)).offsetMin = Vector2(274 - 1142 / uv2 * (uv0.piece_nowl.end_time - uv0.musicgame_nowtime) < 274 and slot6 or 274, uv0.piece_nowl.ob:Find(uv0.game_dgree .. "/notelong_2/note_above"):GetComponent(typeof(RectTransform)).offsetMin.y)

					if uv0.time_latergood < uv0.musicgame_nowtime - uv0.piece_nowl.end_time then
						uv0.piece_nowl.ob.localPosition = uv0.pieceinit_xyz.left

						setActive(uv0.piece_nowl.ob, false)
						uv0:list_push(slot3, uv0.piece_nowl.ob)

						uv0.piece_nowl.ob = false
						uv0.piece_nowl_downflag = false
						uv0.downingleft_missflag = false

						uv0:score_update(0)
					end
				else
					uv0.piece_nowl.ob:Find(uv0.game_dgree .. "/notelong_1/note_above/below"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, uv0.piece_nowl_downflag and 1 or 0.4)
					uv0.piece_nowl.ob:Find(uv0.game_dgree .. "/notelong_1/note_above/above"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, uv0.piece_nowl_downflag and 1 or 0.8)
					uv0.piece_nowl.ob:Find(uv0.game_dgree .. "/notelong_1/note_above"):GetComponent(typeof(RectTransform)).offsetMin = Vector2(274 - 1142 / uv2 * (uv0.piece_nowl.end_time - uv0.musicgame_nowtime) < 274 and slot6 or 274, uv0.piece_nowl.ob:Find(uv0.game_dgree .. "/notelong_1/note_above"):GetComponent(typeof(RectTransform)).offsetMin.y)

					if uv0.time_latergood < uv0.musicgame_nowtime - uv0.piece_nowl.end_time then
						uv0.piece_nowl.ob.localPosition = uv0.pieceinit_xyz.left

						setActive(uv0.piece_nowl.ob, false)
						uv0:list_push(slot3, uv0.piece_nowl.ob)

						uv0.piece_nowl.ob = false
						uv0.piece_nowl_downflag = false
						uv0.downingleft_missflag = false

						uv0:score_update(0)
					end
				end
			end

			if slot0 == "right" and uv0.piece_nowr.ob and uv0.piece_nowr.begin_time ~= uv0.piece_nowr.end_time then
				if uv0.piece_nowl.key_flag == "K_BOTH" then
					uv0.piece_nowr.ob:Find(uv0.game_dgree .. "/notelong_2/note_above/below"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, uv0.piece_nowr_downflag and 1 or 0.4)
					uv0.piece_nowr.ob:Find(uv0.game_dgree .. "/notelong_2/note_above/above"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, uv0.piece_nowr_downflag and 1 or 0.8)
					uv0.piece_nowr.ob:Find(uv0.game_dgree .. "/notelong_2/note_above"):GetComponent(typeof(RectTransform)).offsetMax = Vector2(-(274 - 1142 / uv2 * (uv0.piece_nowr.end_time - uv0.musicgame_nowtime) < 274 and slot6 or 274), uv0.piece_nowr.ob:Find(uv0.game_dgree .. "/notelong_2/note_above"):GetComponent(typeof(RectTransform)).offsetMax.y)

					if uv0.time_latergood < uv0.musicgame_nowtime - uv0.piece_nowr.end_time then
						uv0.piece_nowr.ob.localPosition = uv0.pieceinit_xyz.right

						setActive(uv0.piece_nowr.ob, false)
						uv0:list_push(slot3, uv0.piece_nowr.ob)

						uv0.piece_nowr.ob = false
						uv0.piece_nowr_downflag = false
						uv0.downingright_missflag = false

						uv0:score_update(0)
					end
				else
					uv0.piece_nowr.ob:Find(uv0.game_dgree .. "/notelong_1/note_above/below"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, uv0.piece_nowr_downflag and 1 or 0.4)
					uv0.piece_nowr.ob:Find(uv0.game_dgree .. "/notelong_1/note_above/above"):GetComponent(typeof(Image)).color = Color.New(1, 1, 1, uv0.piece_nowr_downflag and 1 or 0.8)
					uv0.piece_nowr.ob:Find(uv0.game_dgree .. "/notelong_1/note_above"):GetComponent(typeof(RectTransform)).offsetMax = Vector2(-(274 - 1142 / uv2 * (uv0.piece_nowr.end_time - uv0.musicgame_nowtime) < 274 and slot6 or 274), uv0.piece_nowr.ob:Find(uv0.game_dgree .. "/notelong_1/note_above"):GetComponent(typeof(RectTransform)).offsetMax.y)

					if uv0.time_latergood < uv0.musicgame_nowtime - uv0.piece_nowr.end_time then
						uv0.piece_nowr.ob.localPosition = uv0.pieceinit_xyz.right

						setActive(uv0.piece_nowr.ob, false)
						uv0:list_push(slot3, uv0.piece_nowr.ob)

						uv0.piece_nowr.ob = false
						uv0.piece_nowr_downflag = false
						uv0.downingright_missflag = false

						uv0:score_update(0)
					end
				end
			end
		end

		slot4("left", slot2, uv0.piecelist_lt, uv0.piecelist_lf)
		slot4("right", slot1, uv0.piecelist_rt, uv0.piecelist_rf)

		if uv0.piece_nowr_downflag or uv0.piece_nowl_downflag and uv0.game_playingflag then
			uv0:effect_play("perfect_loop02", true)
		else
			uv0:effect_play("perfect_loop02", false)
		end

		uv0:scoresliderAcombo_update()
	end

	if slot0.song_Tstamp and type(slot0.song_Tstamp) ~= "number" then
		slot0.song_Tstamp:Pause()
	end

	slot0.song_Tlength = false
	slot0.song_Tstamp = false

	slot0:effect_play("nothing")
	slot0:effect_play("prepare")

	if slot0.isFirstgame == 0 then
		slot0:Firstshow(slot0.top, function ()
			if not uv0.timer then
				uv0.timer = Timer.New(uv1, uv0.time_interval, -1)
			end

			slot0 = 0
			slot1 = 2
			uv0.ahead_timerPauseFlag = false
			uv0.ahead_timer = Timer.New(function ()
				uv0.ahead_timeflag = true

				if not uv0.ahead_timerPauseFlag then
					uv1 = uv1 + uv0.time_interval
					uv0.song_Tstamp = uv1 - uv2

					uv3()

					if uv2 < uv1 then
						uv0.CeiMgr_ob:UnloadCueSheet("bgm-song0" .. uv0.game_music)
						uv0:loadAndPlayMusic()
						uv0.timer:Start()

						uv0.ahead_timeflag = false
						uv0.gotspecialcombo_flag = false

						uv0.ahead_timer:Stop()
					end
				end
			end, uv0.time_interval, -1)

			uv0:count_five(function ()
				uv0.ahead_timer:Start()
			end)
		end, 2)
		slot0:MyStoreDataToServer()
	else
		slot2()
	end
end

function slot0.loadSDModel(slot0, slot1)
	PoolMgr.GetInstance():GetSpineChar(slot0.SDname[slot1], true, function (slot0)
		pg.UIMgr.GetInstance():LoadingOff()

		uv0.SDmodel[uv1] = slot0
		tf(slot0).localScale = Vector3(1, 1, 1)

		slot0:GetComponent("SpineAnimUI"):SetAction("stand2", 0)
		setParent(slot0, uv0.game_content:Find("Spinelist/" .. uv1))
	end)
end

function slot0.SDmodeljump_btnup(slot0)
	if slot0.downingright_flag or slot0.downingleft_flag then
		slot0.SDmodel_jumpcount = slot0.SDmodel_jumpcount + slot0.time_interval
		slot0.SDmodel_jumpcount = slot0.SDmodel_jumpcount > 1 and 1 or slot0.SDmodel_jumpcount
	else
		if slot0.SDmodel_jumpcount == 1 then
			slot0:setActionSDmodel("jump")

			slot0.SDmodel_idolflag = false
		end

		if slot0.SDmodel_jumpcount > 0 then
			slot0.SDmodel_jumpcount = slot0.SDmodel_jumpcount - slot0.time_interval
			slot0.SDmodel_jumpcount = slot0.SDmodel_jumpcount < 0 and 0 or slot0.SDmodel_jumpcount
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
	slot1 = "bgm-song0" .. slot0.game_music
	slot0.CeiMgr_ob.bgmName = slot1

	slot0.CeiMgr_ob:LoadCueSheet(slot1, function ()
		uv0.CeiMgr_ob.bgmPlayer.loop = false
		uv0.song_Tstamp, uv0.song_Tlength = uv0.CeiMgr_ob:Play(uv0.CeiMgr_ob.bgmPlayer, uv1, 0)
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
		-- Nothing
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
				uv0 = uv0 + 1

				setActive(uv1.top:Find("yinyue_S"), false)

				if uv0 > 1 then
					uv1.effecttimer:Stop()
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

	slot2 = slot0.score_number < slot0.score_blist[slot0.game_music][slot0.game_dgree] and slot1 / slot0.score_blist[slot0.game_music][slot0.game_dgree] * 0.53 or slot0.score_blist[slot0.game_music][slot0.game_dgree] <= slot1 and slot1 < slot0.score_alist[slot0.game_music][slot0.game_dgree] and 0.53 + (slot1 - slot0.score_blist[slot0.game_music][slot0.game_dgree]) / (slot0.score_alist[slot0.game_music][slot0.game_dgree] - slot0.score_blist[slot0.game_music][slot0.game_dgree]) * 0.19 or slot0.score_alist[slot0.game_music][slot0.game_dgree] <= slot1 and slot1 < slot0.score_slist[slot0.game_music][slot0.game_dgree] and 0.72 + (slot1 - slot0.score_alist[slot0.game_music][slot0.game_dgree]) / (slot0.score_slist[slot0.game_music][slot0.game_dgree] - slot0.score_alist[slot0.game_music][slot0.game_dgree]) * 0.155 or 0.885 + (slot1 - slot0.score_slist[slot0.game_music][slot0.game_dgree]) / (slot0.score_sslist[slot0.game_music][slot0.game_dgree] - slot0.score_slist[slot0.game_music][slot0.game_dgree]) * 0.115

	setSlider(slot0.top:Find("ScoreSlider"), 0, 1, slot2)

	if slot2 < 0.53 then
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
	for slot5 = 1, slot0.piecelist_lt[0] do
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

	for slot5 = 1, slot0.piecelist_rt[0] do
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

	for slot6 = 1, 3 do
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
		slot0.combo_number = slot0.combo_link < slot0.combo_number and slot0.combo_number or slot0.combo_link

		if slot0.combo_link > 1 then
			setActive(slot0.game_content:Find("combo"), true)
			setActive(slot0.game_content:Find("combo_n"), true)
			slot0.game_content:Find("combo"):GetComponent(typeof(Animation)):Play()
			slot0.game_content:Find("combo_n"):GetComponent(typeof(Animation)):Play()
		else
			setActive(slot0.game_content:Find("combo"), false)
			setActive(slot0.game_content:Find("combo_n"), false)
		end

		pg.CriMgr.GetInstance():PlaySE_V3("ui-maoudamashii")
	end

	for slot7 = 1, #slot0.combo_interval do
		if slot0.combo_interval[slot7] < slot0.combo_link then
			slot3 = 0 + 1
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

	setText(slot0.BG:Find("num"), 5)

	slot0.count_timer = Timer.New(function ()
		uv0 = uv0 - 1

		setText(uv1.BG:Find("num"), uv0)

		if uv0 <= 0 then
			uv1.count_timer:Stop()

			uv1.countingfive_flag = false

			setActive(uv1.BG, false)
			uv1:setActionSDmodel("idol")
			uv2()
		end
	end, 1, -1)

	slot0.count_timer:Start()
end

function slot0.showSelevtView(slot0)
	if slot0.isFirstgame == 0 then
		slot0:Firstshow(slot0.selectview, function ()
		end, 1)
	end

	slot1 = slot0.selectview:Find("Main")
	slot3 = slot1:Find("DgreeList")
	slot5 = slot1:Find("namelist")
	slot6 = slot0.selectview:Find("top")
	slot10 = slot0.selectview:GetComponent("Animator")

	slot0.selectview:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
		setActive(uv0.selectview, false)
	end)
	onButton(slot0, slot6:Find("help_btn"), function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_music_game.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot6:Find("back"), function ()
		uv0:emit(uv1.ON_BACK)
	end, SFX_PANEL)
	onButton(slot0, slot1:Find("Start_btn"), function ()
		uv0:Play("selectExitAnim")
		uv1:game_start()

		GetOrAddComponent(uv1.selectview, "CanvasGroup").blocksRaycasts = false
	end, SFX_UI_CONFIRM)
	onButton(slot0, slot3:Find("easy"), function ()
		uv0.game_dgree = 1

		setActive(uv1:Find("hard/frame"), false)
		setActive(uv1:Find("easy/frame"), true)
		uv0:updatSelectview()
	end, SFX_UI_CLICK)
	onButton(slot0, slot3:Find("hard"), function ()
		uv0.game_dgree = 2

		setActive(uv1:Find("easy/frame"), false)
		setActive(uv1:Find("hard/frame"), true)
		uv0:updatSelectview()
	end, SFX_UI_CLICK)

	function slot15()
		setActive(uv0:Find("x" .. uv1.game_speed), false)

		uv1.game_speed = uv1.game_speed + 1 > 4 and 1 or uv1.game_speed + 1

		PlayerPrefs.SetInt("musicgame_idol_speed", uv1.game_speed)
		setActive(uv0:Find("x" .. uv1.game_speed), true)
	end

	onButton(slot0, slot6:Find("Speedlist"), slot15, SFX_UI_CLICK)

	slot0.song_btn = slot1:Find("MusicList"):Find("song")

	setActive(slot0.song_btn, false)

	slot0.song_btns = {}

	for slot15 = 1, slot0.music_amount do
		slot0.song_btns[slot15] = cloneTplTo(slot0.song_btn, slot4, "music" .. slot15)

		setActive(slot0.song_btns[slot15], true)

		slot16 = slot0.song_btn.localPosition
		slot17 = slot0.game_music
		slot19 = slot15 - slot17 < slot0.music_amount_middle and math.abs(slot15 - slot17) or slot15 - slot0.music_amount_middle * 2
		slot0.song_btns[slot15].localPosition = Vector3(slot16.x + slot19 * 1022, slot16.y, slot16.z)
		slot16 = slot0.song_btn.localScale
		slot0.song_btns[slot15].localScale = Vector3(slot16.x - math.abs(slot19) * 0.2, slot16.y - math.abs(slot19) * 0.2, slot16.z - math.abs(slot19) * 0.2)
		slot20 = slot0.song_btns[slot15]:Find("song"):GetComponent(typeof(Image))
		slot20.sprite = slot4:Find("img/" .. slot15):GetComponent(typeof(Image)).sprite
		slot0.song_btns[slot15]:Find("zhuanji3/zhuanji2_5"):GetComponent(typeof(Image)).sprite = slot4:Find("img/" .. slot15 .. "_1"):GetComponent(typeof(Image)).sprite
		slot20.color = Color.New(1, 1, 1, 1 - math.abs(slot19) * 0.6)

		onButton(slot0, slot0.song_btns[slot15], function ()
			setActive(uv0:Find("song" .. uv1.game_music), false)
			uv1.CeiMgr_ob:UnloadCueSheet("bgm-song0" .. uv1.game_music)
			uv1:MyGetRuntimeData()

			uv1.game_music = uv2

			uv1:loadAndPlayMusic()
			uv1:updatSelectview()
			uv1:changeLocalpos(uv2)
			setActive(uv0:Find("song" .. uv1.game_music), true)
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
	slot5 = {
		[slot9] = slot0.song_btns[slot9].localPosition
	}

	for slot9 = 1, slot0.music_amount do
	end

	slot6 = {
		[slot10] = slot0.song_btns[slot10].localScale
	}

	for slot10 = 1, slot0.music_amount do
	end

	slot0.changeLocalpos_timer = Timer.New(function ()
		uv0 = uv0 - uv1.time_interval
		uv1.changeLocalposTimerflag = true

		for slot3 = 1, uv1.music_amount do
			slot4 = slot3 + uv2

			if uv1.music_amount < slot3 + uv2 then
				slot4 = slot3 + uv2 - uv1.music_amount
			end

			if slot3 + uv2 < 1 then
				slot4 = slot3 + uv2 + uv1.music_amount
			end

			if uv0 <= 0 then
				if slot4 == uv3 then
					uv1.song_btns[slot3]:GetComponent(typeof(Animator)):Play("plate_out")
				else
					uv1.song_btns[slot3]:GetComponent(typeof(Animator)):Play("plate_static")

					uv1.song_btns[slot3]:GetComponent(typeof(Button)).interactable = true
				end
			else
				uv1.song_btns[slot3]:GetComponent(typeof(Animator)):Play("plate_static")

				uv1.song_btns[slot3]:GetComponent(typeof(Button)).interactable = false
			end

			slot6 = math.abs(slot4 - uv3)
			uv1.song_btns[slot3].localPosition = Vector3((uv1.song_btn.localPosition.x + (slot4 - uv3 > 0 and 1 or -1) * slot6 * 1022) * (1 - uv0 * 2) + uv4[slot3].x * uv0 * 2, slot5.y, slot5.z)
			slot5 = uv1.song_btns[slot3].localScale
			slot7 = (1 - slot6 * 0.2) * (1 - uv0 * 2) + uv5[slot3].x * uv0 * 2
			uv1.song_btns[slot3].localScale = Vector3(slot7, slot7, slot7)
			slot8 = uv1.song_btns[slot3]:Find("song"):GetComponent(typeof(Image))
			slot7 = (1 - slot6 * 0.6) * (1 - uv0 * 2) + slot8.color.a * uv0 * 2
			slot8.color = Color.New(1, 1, 1, 1 - slot6 * 0.6)
		end

		if uv0 <= 0 then
			uv1.changeLocalposTimerflag = false

			uv1.changeLocalpos_timer:Stop()
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
		uv0 = 0
		uv1 = nil
	end)
	slot1:AddDragFunc(function (slot0, slot1)
		if not uv0.inPaintingView then
			slot2 = slot1.position

			if not uv1 then
				uv1 = slot2
			end

			uv2 = slot2.x - uv1.x
		end
	end)
	slot1:AddDragEndFunc(function (slot0, slot1)
		if not uv0.inPaintingView and not uv0.changeLocalposTimerflag then
			if uv1 < -50 then
				if uv0.game_music < uv0.music_amount then
					triggerButton(uv0.song_btns[uv0.game_music + 1])
				else
					triggerButton(uv0.song_btns[1])
				end
			elseif uv1 > 50 then
				if uv0.game_music > 1 then
					triggerButton(uv0.song_btns[uv0.game_music - 1])
				else
					triggerButton(uv0.song_btns[uv0.music_amount])
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
		uv0 = uv0 + 1

		if uv0 > 3 then
			onButton(uv1, uv2:Find("firstview"), function ()
				if uv0 then
					uv0()
				end

				setActive(uv1:Find("firstview"), false)

				uv2.firstview_timerRunflag = false
			end, SFX_UI_CLICK)
			uv1.firstview_timer:Stop()
		end
	end, 1, -1)

	slot0.firstview_timer:Start()
end

function slot0.updatSelectview(slot0)
	slot4 = "top/Speedlist/x" .. slot0.game_speed

	setActive(slot0.selectview:Find(slot4), true)

	for slot4 = 1, slot0.music_amount do
		setActive(slot0.song_btns[slot4]:Find("song/best"), false)
		slot0:setSelectview_pj("e", slot4)
	end

	slot1 = slot0.bestScorelist[slot0.game_music + (slot0.game_dgree - 1) * slot0.music_amount]

	if slot0.song_btns[slot0.game_music] and slot1 > 0 then
		setActive(slot0.song_btns[slot0.game_music]:Find("song/best"), true)
		setText(slot0.song_btns[slot0.game_music]:Find("song/best/score"), slot1)
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
	slot4 = pg.StoryMgr.GetInstance()
	slot6 = slot0:GetMGData():getConfig("simple_config_data").story[slot0:GetMGHubData().usedtime + 1] and slot5[slot3.usedtime + 1][1] or nil

	if slot3.count > 0 and slot6 and not slot4:IsPlayed(slot6) and slot0.score_blist[slot0.game_music][slot0.game_dgree] <= slot0.score_number then
		slot4:Play(slot6, (slot0.score_number >= slot0.score_blist[slot0.game_music][slot0.game_dgree] or function ()
			uv0:setScoceview_pj("c")
			uv0.CeiMgr_ob:StopBGM()
		end) and (slot0.score_blist[slot0.game_music][slot0.game_dgree] > slot0.score_number or slot0.score_number >= slot0.score_alist[slot0.game_music][slot0.game_dgree] or function ()
			uv0:setScoceview_pj("b")
			uv0:emit(BaseMiniGameMediator.MINI_GAME_SUCCESS, 0)
			uv0.CeiMgr_ob:StopBGM()
		end) and (slot0.score_alist[slot0.game_music][slot0.game_dgree] > slot0.score_number or slot0.score_number >= slot0.score_slist[slot0.game_music][slot0.game_dgree] or function ()
			uv0:setScoceview_pj("a")
			uv0:emit(BaseMiniGameMediator.MINI_GAME_SUCCESS, 0)
			uv0.CeiMgr_ob:StopBGM()
		end) and function ()
			uv0:setScoceview_pj("s")
			uv0:emit(BaseMiniGameMediator.MINI_GAME_SUCCESS, 0)
			uv0.CeiMgr_ob:StopBGM()
		end)
	else
		slot2()
	end

	onButton(slot0, slot0.scoreview:Find("btnlist/share"), function ()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeSummary)
	end, SFX_PANEL)
	onButton(slot0, slot0.scoreview:Find("btnlist/restart"), function ()
		setActive(uv0.scoreview, false)

		uv0.scoreview_flag = false

		uv0.timer:Stop()
		uv0:piecelistALLTtoF()
		uv0:rec_scorce()
		uv0:game_start()
		uv0:setScoceview_pj("e")
		retPaintingPrefab(uv0.scoreview:Find("paint"), uv0.painting_namelist[uv0.game_music])
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.scoreview:Find("btnlist/reselect"), function ()
		setActive(uv0.scoreview, false)

		uv0.scoreview_flag = false

		uv0.timer:Stop()
		uv0:piecelistALLTtoF()
		setActive(uv0.selectview, true)

		GetOrAddComponent(uv0.selectview, "CanvasGroup").blocksRaycasts = true

		uv0:updatSelectview()
		uv0.song_btns[uv0.game_music]:GetComponent(typeof(Animator)):Play("plate_out")
		uv0:loadAndPlayMusic()
		uv0:rec_scorce()
		uv0:setScoceview_pj("e")
		retPaintingPrefab(uv0.scoreview:Find("paint"), uv0.painting_namelist[uv0.game_music])
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

	slot0.Scoceview_timer = Timer.New(function ()
		uv0 = uv0 + uv1.time_interval

		if uv0 >= 0.99 then
			setActive(uv1.scoreview:Find("btnlist/reselect"), true)
			setActive(uv1.scoreview:Find("btnlist/restart"), true)
			setActive(uv1.scoreview:Find("btnlist/share"), true)
			setText(uv1.scoreview:Find("scorelist/perfect"), uv1.perfect_number)
			setText(uv1.scoreview:Find("scorelist/good"), uv1.good_number)
			setText(uv1.scoreview:Find("scorelist/miss"), uv1.miss_number)
			setText(uv1.scoreview:Find("scorelist/combo"), uv1.combo_number)
			setText(uv1.scoreview:Find("img_list/square/bestscore"), uv1.score_number)
		else
			setText(uv1.scoreview:Find("scorelist/perfect"), math.floor(uv1.perfect_number * uv0))
			setText(uv1.scoreview:Find("scorelist/good"), math.floor(uv1.good_number * uv0))
			setText(uv1.scoreview:Find("scorelist/miss"), math.floor(uv1.miss_number * uv0))
			setText(uv1.scoreview:Find("scorelist/combo"), math.floor(uv1.combo_number * uv0))
			setText(uv1.scoreview:Find("img_list/square/bestscore"), math.floor(uv1.score_number * uv0))
		end

		if uv0 >= 1.03 then
			uv1.Scoceview_timer:Stop()
		end
	end, slot0.time_interval, -1)

	slot0.Scoceview_timer:Start()
end

return slot0
