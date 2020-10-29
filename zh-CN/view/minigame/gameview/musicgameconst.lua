slot0 = class("MusicGameConst")
slot0.music_game_data = {
	{
		light = 2,
		music_id = 1,
		comboEffect = 1,
		music_piece = 2,
		bg = 1,
		bgm = "06",
		pu = "06",
		settlement_painting = {
			"daiduo_idol_n",
			"baerdimo_idol_n",
			"guanghui_idol_n",
			"tashigan_idol_n",
			"daqinghuayu_idolns"
		},
		ships = {
			"daiduo_idol",
			"baerdimo_idol",
			"guanghui_idol",
			"tashigan_idol",
			"daqinghuayu_idol"
		}
	},
	{
		light = 3,
		music_id = 2,
		comboEffect = 1,
		music_piece = 2,
		bg = 2,
		bgm = "08",
		pu = "08",
		settlement_painting = {
			"luoen_idol_n",
			"dafeng_idol_n"
		},
		ships = {
			false,
			"dafeng_idol",
			false,
			"luoen_idol",
			false
		}
	},
	{
		light = 1,
		music_id = 3,
		comboEffect = 1,
		music_piece = 2,
		bg = 3,
		bgm = "07",
		pu = "07",
		settlement_painting = {
			"edu_idol_n"
		},
		ships = {
			false,
			false,
			"edu_idol",
			false,
			false
		}
	},
	{
		light = false,
		music_id = 4,
		comboEffect = 1,
		music_piece = 2,
		bg = 4,
		bgm = "09",
		pu = "09",
		settlement_painting = {
			"chicheng_idolns",
			"xiefeierde_idolns",
			"jiasikenie_idolns",
			"kelifulan_idolns",
			"xipeier_idolns"
		},
		ships = {
			"chicheng_idol",
			"xiefeierde_idol",
			"jiasikenie_idol",
			"kelifulan_idol",
			"xipeier_idol"
		}
	},
	{
		pu = "010",
		music_id = 5,
		comboEffect = 1,
		music_piece = 2,
		bg = 4,
		bgm = "10"
	},
	{
		light = false,
		music_id = 6,
		comboEffect = 1,
		music_piece = 2,
		bg = 4,
		bgm = "01",
		pu = "01",
		settlement_painting = {
			"chicheng_idol"
		},
		ships = {
			"chicheng_idol",
			"xiefeierde_idol",
			"jiasikenie_idol",
			"kelifulan_idol",
			"xipeier_idol"
		}
	},
	{
		pu = "02",
		music_id = 7,
		comboEffect = 1,
		music_piece = 2,
		bg = 4,
		bgm = "02"
	},
	{
		pu = "03",
		music_id = 8,
		comboEffect = 1,
		music_piece = 2,
		bg = 4,
		bgm = "03"
	},
	{
		pu = "04",
		music_id = 9,
		comboEffect = 1,
		music_piece = 2,
		bg = 4,
		bgm = "04"
	},
	{
		pu = "05",
		music_id = 10,
		comboEffect = 1,
		music_piece = 2,
		bg = 4,
		bgm = "05"
	}
}

function slot0.getRandomBand()
	return MusicGameConst.random_band[math.random(1, #MusicGameConst.random_band)]
end

slot0.random_band = {
	{
		light = false,
		bg = 4,
		settlement_painting = {
			"chicheng_idolns",
			"xiefeierde_idolns",
			"jiasikenie_idolns",
			"kelifulan_idolns",
			"xipeier_idolns"
		},
		ships = {
			"chicheng_idol",
			"xiefeierde_idol",
			"jiasikenie_idol",
			"kelifulan_idol",
			"xipeier_idol"
		}
	},
	{
		light = 2,
		bg = 1,
		settlement_painting = {
			"daiduo_idol_n",
			"baerdimo_idol_n",
			"guanghui_idol_n",
			"tashigan_idol_n",
			"daqinghuayu_idolns"
		},
		ships = {
			"daiduo_idol",
			"baerdimo_idol",
			"guanghui_idol",
			"tashigan_idol",
			"daqinghuayu_idol"
		}
	},
	{
		light = 1,
		bg = 3,
		settlement_painting = {
			"edu_idol_n"
		},
		ships = {
			false,
			false,
			"edu_idol",
			false,
			false
		}
	},
	{
		light = 3,
		bg = 2,
		settlement_painting = {
			"luoen_idol_n",
			"dafeng_idol_n"
		},
		ships = {
			false,
			"dafeng_idol",
			false,
			"luoen_idol",
			false
		}
	}
}
slot0.music_all_ship = {
	"chicheng_idol",
	"xiefeierde_idol",
	"jiasikenie_idol",
	"kelifulan_idol",
	"xipeier_idol",
	"luoen_idol",
	"baerdimo_idol",
	"edu_idol",
	"dafeng_idol",
	"daiduo_idol",
	"guanghui_idol",
	"tashigan_idol",
	"daqinghuayu_idol"
}
slot0.music_all_painting = {
	"chicheng_idolns",
	"xiefeierde_idolns",
	"jiasikenie_idolns",
	"kelifulan_idolns",
	"xipeier_idolns",
	"baerdimo_idol_n",
	"dafeng_idol_n",
	"daiduo_idol_n",
	"daqinghuayu_idolns",
	"edu_idol_n",
	"guanghui_idol_n",
	"luoen_idol_n",
	"tashigan_idol_n"
}

return slot0
