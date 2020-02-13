slot0 = class("MusicGameSelectView", import("...base.BaseSubView"))

function slot0.getUIName(slot0)
	return "MusicGameSelectUI"
end

function slot0.OnInit(slot0)
	slot0.music_amount = 5
	slot0.music_amount_middle = 3
	slot0.configList = {
		speed = 1,
		dgree = 1,
		music = slot0.music_amount_middle
	}

	slot0:initUI()
end

function slot0.OnDestroy(slot0)
	return
end

function slot0.initData(slot0)
	return
end

function slot0.initUI(slot0)
	slot0.main = slot0:findTF("Main")
	slot0.start_btn = slot0.main:Find("Start_btn")
	slot0.speed_list = slot0.main:Find("Speedlist")
	slot0.dgreelist = slot0.main:Find("DgreeList")
	slot0.musiclist = slot0.main:Find("MusicList")
	slot0.top = slot0:findTF("top")
	slot0.btn_help = slot0.top:Find("help_btn")
	slot0.btn_back = slot0.top:Find("back")
	slot0.btn_home = slot0.top:Find("home")

	onButton(slot0, slot0.btn_help, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_summer_shooting.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.btn_back, function ()
		slot0.contextData.Onbtn_back()
	end)
	onButton(slot0, slot0.btn_home, function ()
		slot0:emit(BaseUI.ON_HOME)
	end)
	onButton(slot0, slot0.start_btn, function ()
		slot0.contextData.setGameView(slot0.configList)
		slot0.contextData.setGameView.contextData.goGameView()
	end, SFX_UI_CONFIRM)
	onButton(slot0, slot0.dgreelist:Find("easy"), function ()
		slot0.configList.dgree = 1
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.dgreelist:Find("hard"), function ()
		slot0.configList.dgree = 2
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.speed_list, function ()
		slot0.speed = (slot0.configList.speed + 1 > 4 and 1) or slot0.configList.speed + 1
		slot0.localEulerAngles = Vector3(0, 0, (slot0.configList.speed == 1 and 0) or slot0.speed_list.localEulerAngles.z - 22.5)
	end, SFX_UI_CLICK)
	slot0:initSongUI()
end

function slot0.initSongUI(slot0)
	slot0.song_btn = slot0.musiclist:Find("song")

	setActive(slot0.song_btn, false)

	slot0.song_btns = {}

	for slot4 = 1, slot0.music_amount, 1 do
		slot0.song_btns[slot4] = cloneTplTo(slot0.song_btn, slot0.musiclist, "music" .. slot4)

		setActive(slot0.song_btns[slot4], true)

		slot7 = math.abs(slot4 - slot0.music_amount_middle)
		slot0.song_btns[slot4].localPosition = Vector3(slot0.song_btn.localPosition.x + ((slot4 - slot0.music_amount_middle > 0 and 1) or -1) * slot7 * 300, slot5.y, slot5.z)
		slot0.song_btns[slot4].localScale = Vector3(slot0.song_btn.localScale.x - slot7 * 0.2, slot0.song_btn.localScale.y - slot7 * 0.2, slot0.song_btn.localScale.z - slot7 * 0.2)
		slot0.song_btns[slot4]:GetComponent(typeof(Image)).sprite = slot0.musiclist:Find("img/" .. slot4):GetComponent(typeof(Image)).sprite

		onButton(slot0, slot0.song_btns[slot4], function ()
			slot0.configList.music = slot1

			slot0.configList:changeLocalpos(slot0.configList)
		end, SFX_UI_CLICK)
	end
end

function slot0.changeLocalpos(slot0, slot1)
	slot3 = slot0.music_amount_middle - slot1

	for slot7 = 1, slot0.music_amount, 1 do
		slot8 = slot7 + slot3

		if slot0.music_amount < slot7 + slot3 then
			slot8 = (slot7 + slot3) - slot0.music_amount
		end

		if slot7 + slot3 < 1 then
			slot8 = slot7 + slot3 + slot0.music_amount
		end

		slot10 = math.abs(slot8 - slot2)
		slot0.song_btns[slot7].localPosition = Vector3(slot0.song_btn.localPosition.x + ((slot8 - slot2 > 0 and 1) or -1) * slot10 * 300, slot9.y, slot9.z)
		slot9 = slot0.song_btn.localScale
		slot0.song_btns[slot7].localScale = Vector3(1.4 - slot10 * 0.2, 1.4 - slot10 * 0.2, 1.4 - slot10 * 0.2)
	end
end

return slot0
