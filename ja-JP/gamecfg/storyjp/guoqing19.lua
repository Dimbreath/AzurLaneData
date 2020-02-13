return {
	fadeOut = 1.5,
	mode = 2,
	noWaitFade = true,
	once = true,
	id = "GUOQING19",
	fadeType = 1,
	fadein = 1.5,
	scripts = {
		{
			actor = 307010,
			nameColor = "#ff0000",
			side = 2,
			dir = -1,
			say = "ああ…この魂のぶつかり合いで生まれた素晴らしき輝き…カミさま、どうかご覧あれ…これこそあなた様が求める「覚醒」…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 307010,
			nameColor = "#ff0000",
			side = 2,
			dir = -1,
			say = "こうも美しく…こうも脆い…握りつぶしたくなるわ…ふふふ、ふふフフフ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 307020,
			nameColor = "#ff0000",
			side = 0,
			dir = -1,
			say = "やっぱりこうなってしまったか…良い。どうやら今回の演目はここまでのようだ。",
			paintingFadeOut = {
				time = 0.5,
				side = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 307010,
			nameColor = "#ff0000",
			side = 1,
			dir = -1,
			say = "そう…？残念ね～では準備しましょ…うふふ…新しい「聖域」――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 307060,
			nameColor = "#a9f548",
			side = 2,
			dir = 1,
			say = "うっ…ま、待て！まだ話が――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			withoutPainting = true,
			side = 0,
			actorName = "システム",
			dir = 0,
			soundeffect = "event:/ui/alarm",
			actor = 900011,
			nameColor = "#ff0000",
			say = "――カイシュウシーケンスキドウ――サギョウエリアヨリシキュウタイヒシテクダサイ――",
			typewriter = {
				speed = 0.02,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			say = "――クリカエシマス――カイシュウシーケンスキドウ――サギョウエリアヨリシキュウタイヒシテクダサイ――",
			side = 0,
			nameColor = "#ff0000",
			dir = 0,
			actor = 900011,
			actorName = "システム",
			withoutPainting = true,
			typewriter = {
				speed = 0.02,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			say = "――カイシュウシーケンスキドウ――サギョウエリアヨリシキュウタイヒシテクダサイ――",
			side = 0,
			nameColor = "#ff0000",
			dir = 0,
			actor = 900011,
			actorName = "システム",
			withoutPainting = true,
			typewriter = {
				speed = 0.02,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 307020,
			nameColor = "#ff0000",
			side = 2,
			dir = 1,
			say = "同胞よ。この世の全ては因果応報。無限に続く輪廻の中で、もう一つの可能性を探すことこそ私たちの役目……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 307020,
			nameColor = "#ff0000",
			side = 2,
			dir = 1,
			say = "いつかわかるはずだ。私たちのやったことの意味、理由を……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 307020,
			nameColor = "#ff0000",
			side = 2,
			dir = 1,
			say = "あなたにもヤオヨロズのカミガミのご加護があらんことを…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actorName = "試験者?型",
			side = 2,
			blackBg = true,
			actor = 900011,
			nameColor = "#ff0000",
			say = "試験場γ…テスト完了。",
			flashout = {
				dur = 1.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 2,
				dur = 2,
				alpha = {
					1,
					0
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900012,
			nameColor = "#ff0000",
			side = 2,
			actorName = "観察者?型",
			blackBg = true,
			say = "うん？見せて見せて…試験場γ？…なんだ、あの「小動物」たちのとこか…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900011,
			nameColor = "#ff0000",
			side = 2,
			actorName = "試験者?型",
			blackBg = true,
			say = "そうよ。「支配から逃れようと、そして同胞を救おうとする時の底力」、か。予想以上の成績ね。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900012,
			nameColor = "#ff0000",
			side = 2,
			actorName = "観察者?型",
			blackBg = true,
			say = "なかなか面白いじゃない？定められた運命の輪から抜け出そうとしながら、自らの将来には枷を掛ける…全てを手中に収めたと思いきや、その全てが偽りであることとも知らず…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900011,
			nameColor = "#ff0000",
			side = 2,
			actorName = "試験者?型",
			blackBg = true,
			say = "テストデータとしては上々よ。意外とこのコたち、「創造主」さまに気に入られているらしいわ。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900012,
			nameColor = "#ff0000",
			side = 2,
			actorName = "観察者?型",
			blackBg = true,
			say = "ふん！…そんなの「創造主」さまの悪趣味にすぎないわ。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900011,
			nameColor = "#ff0000",
			side = 2,
			actorName = "試験者?型",
			blackBg = true,
			say = "今のデータから予測すると…まだ、少なくとも……会わせるわけにはいかないわね。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900012,
			nameColor = "#ff0000",
			side = 2,
			actorName = "観察者?型",
			blackBg = true,
			say = "オッケー。じゃあ【駒】・テストデータ全部リセットして、パラメータは5％マシマシ、っと……「カギ」開放完了。次のテストに移る――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		}
	}
}
