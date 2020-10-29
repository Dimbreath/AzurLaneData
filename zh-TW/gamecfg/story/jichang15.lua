return {
	fadeOut = 1.5,
	mode = 2,
	fadeType = 1,
	once = true,
	id = "JICHANG15",
	fadein = 1.5,
	scripts = {
		{
			say = "歌に載せて、相手に伝えたい気持ち。感謝したい仲間たちとの絆。",
			side = 2,
			dir = 1,
			blackBg = true,
			bgm = "azumaster-ins",
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
			side = 2,
			dir = 1,
			blackBg = true,
			say = "それは決して思い浮かべないものではなく、むしろ少女たちの日常に既に綴られ、数々の瞬間として綴られていた。",
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
			side = 2,
			dir = 1,
			blackBg = true,
			say = "例え「μ兵装」実験任務においてもそれが決して変わることなく――",
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
			actor = 103240,
			side = 2,
			dir = 1,
			bgName = "bg_story_task",
			nameColor = "#a9f548",
			say = "アイドル活動か…確かにボルチモアがアイドルをやるのってちょっと想像できないよね",
			flashout = {
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				alpha = {
					1,
					0
				}
			},
			effects = {
				{
					active = true,
					name = "memoryFog"
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
			expression = 3,
			side = 2,
			bgName = "bg_story_task",
			dir = 1,
			actor = 103250,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "そうだな。「可愛い」とか、私がやってもほかの子から浮いたりしないか？",
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
			expression = 4,
			side = 2,
			bgName = "bg_story_task",
			dir = 1,
			actor = 103240,
			nameColor = "#a9f548",
			say = "そこはこの相談屋のブレマートンにおまかせ♪確かにブレマートンはサラトガちゃんみたいに「キラッ☆」とするのはちょっとヘンだけど…",
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
			actor = 103240,
			side = 2,
			bgName = "bg_story_task",
			nameColor = "#a9f548",
			dir = 1,
			say = "そこは参考系を変えて、レキシントンみたいにお姉さんっぽさを出してみてはどぉ？まあそのうち多分「これが一番自分らしい」ってのは分かるって",
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
			expression = 4,
			side = 2,
			bgName = "bg_story_task",
			dir = 1,
			actor = 103240,
			nameColor = "#a9f548",
			say = "練習相手がほしいならいつでもオッケーよ♪　あっ、んーこれは指揮官に見てもらったほうがいいかな…ちょっと声かけてくるね！",
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
			expression = 3,
			side = 2,
			bgName = "bg_story_task",
			dir = 1,
			actor = 103250,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "し、指揮官に見てもらうのか？！…ああ、ちょ、ちょっと…！",
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
			side = 2,
			bgName = "star_level_bg_113",
			dir = 1,
			actor = 202120,
			nameColor = "#a9f548",
			say = "「アイドル任務」ですか…なるほど、たしかに不安を感じますね",
			flashout = {
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
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
			actor = 202120,
			side = 2,
			bgName = "star_level_bg_113",
			nameColor = "#a9f548",
			dir = 1,
			say = "安心してください。これはダイドーだけでなく私たちメイド隊全員の問題です。サポートが必要でしたらいつでもお声掛けください",
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
			expression = 1,
			side = 2,
			bgName = "star_level_bg_113",
			dir = 1,
			actor = 202100,
			nameColor = "#a9f548",
			say = "ベルファスト、これはレクチャーを開催したほうがよろしいかと",
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
			side = 2,
			bgName = "star_level_bg_113",
			dir = 1,
			actor = 202280,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "レクチャー…ですか？",
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
			expression = 1,
			side = 2,
			bgName = "star_level_bg_113",
			dir = 1,
			actor = 202280,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "（アイドル活動にメイドのお仕事の時間を取られちゃいましたら…ご主人様に会える時間が減ってしまう…）",
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
			expression = 2,
			side = 2,
			bgName = "star_level_bg_113",
			dir = 1,
			actor = 202280,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "（でもご主人様から任された大切な任務をちゃんとこなきゃ…んんっ、ダイドーはどうしたら…）",
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
			expression = 2,
			side = 2,
			bgName = "star_level_bg_113",
			dir = 1,
			actor = 202270,
			nameColor = "#a9f548",
			say = "ダイドーちゃん、ご主人様と会えないことを心配しているのでしたら、キッチンのお仕事を私と交換しましょうか？",
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
			expression = 3,
			side = 2,
			bgName = "star_level_bg_113",
			dir = 1,
			actor = 202200,
			nameColor = "#a9f548",
			say = "シリアスも、キッチンのお手伝いでしたら…",
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
			expression = 1,
			side = 2,
			bgName = "star_level_bg_113",
			dir = 1,
			actor = 202280,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "みんな……シリアスはそのままでいいです！",
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
			side = 2,
			bgName = "bg_night",
			dir = 1,
			actor = 403054,
			nameColor = "#a9f548",
			say = "タシュケントってすごいね！あんなに難しい振り付けをこんなに上手にできるんだ…",
			flashout = {
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
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
			actor = 401463,
			side = 2,
			bgName = "bg_night",
			nameColor = "#a9f548",
			dir = 1,
			say = "舞踊の才能とはこういうことか",
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
			side = 2,
			bgName = "bg_night",
			dir = 1,
			actor = 701050,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "別に。ちゃんと練習すればこんなものよ。タシュケントはほかの子よりちょっと覚えが早いだけ",
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
			expression = 5,
			side = 2,
			bgName = "bg_night",
			dir = 1,
			actor = 403054,
			nameColor = "#a9f548",
			say = "でも本当にいいの？みんなに内緒して自主練なんて…",
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
			expression = 2,
			side = 2,
			bgName = "bg_night",
			dir = 1,
			actor = 701050,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "一度覚えたダンスを皆に合わせるから練習しないとダメよ。タシュケントが一人だけ上手くなったらユニットにならないでしょ？",
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
			expression = 3,
			side = 2,
			bgName = "bg_night",
			dir = 1,
			actor = 701050,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "それに、こういうのって特にバレてるわ。…あら",
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
			expression = 4,
			side = 2,
			bgName = "bg_night",
			dir = 1,
			actor = 701050,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "……同志ちゃんからのメッセージね。ふふっ",
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
			bgName = "star_level_bg_140",
			side = 2,
			dir = 1,
			actor = 207110,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "「♪～繋いだ声はきっと　次の奇跡を…」",
			flashout = {
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
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
			expression = 1,
			side = 2,
			bgName = "star_level_bg_140",
			dir = 1,
			actor = 207110,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "（この歌は光のように、満遍なく注ぐ――ううん、仲間たちと指揮官様にはもうちょっと……）",
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
			side = 2,
			bgName = "star_level_bg_140",
			dir = 1,
			actor = 207110,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "サラ先生、今のは何点でしょうか？",
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
			actor = 107030,
			side = 2,
			bgName = "star_level_bg_140",
			nameColor = "#a9f548",
			dir = 1,
			say = "今の80点かな？サラトガちゃんもっと点をあげちゃいたいけど、もうちょっとふわっと歌い上げたほうがいいかな？",
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
			side = 2,
			bgName = "star_level_bg_140",
			dir = 1,
			actor = 207110,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "ふふふ。はい、サラ先生♪",
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
			expression = 2,
			side = 2,
			dir = 1,
			bgName = "bg_story_room",
			actor = 307110,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "いつまで人様の部屋にいるつもり？このあと指揮官様にデートを誘いに行きますけど",
			flashout = {
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
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
			expression = 4,
			side = 2,
			bgName = "bg_story_room",
			dir = 1,
			actor = 108050,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "んーちょっとこの歌詞を見終わってから…",
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
			expression = 3,
			side = 2,
			bgName = "bg_story_room",
			dir = 1,
			actor = 108050,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "大鳳さぁ、なんでコンビを組むのにオッケーしたの？アタシてっきり大鳳なら絶対にソロだと思ったよ？",
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
			expression = 4,
			side = 2,
			bgName = "bg_story_room",
			dir = 1,
			actor = 307110,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "指揮官様には最高の大鳳を魅せるために決まっていますわ。あの赤城さんだってユニットに入りましたもの",
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
			expression = 1,
			side = 2,
			bgName = "bg_story_room",
			dir = 1,
			actor = 307110,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "あんたも参加しているなんて予想だにしなかったわ…はい、このステージ仕掛け、いくらなんでも無理じゃありません？",
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
			side = 2,
			bgName = "bg_story_room",
			dir = 1,
			actor = 108050,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "あ、本当だ…アタシってこんな凡ミスをするんだ～テヘッ",
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
			expression = 1,
			side = 2,
			bgName = "bg_story_room",
			dir = 1,
			actor = 108050,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "ちなみに大鳳、ここの振り付け思いっきり腕をあげたほうがいいんじゃない？",
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
			actor = 403070,
			side = 2,
			dir = 1,
			nameColor = "#a9f548",
			say = "準備ができたようね",
			flashout = {
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				alpha = {
					1,
					0
				}
			},
			effects = {
				{
					active = false,
					name = "memoryFog"
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
			actor = 102240,
			side = 2,
			nameColor = "#a9f548",
			dir = 1,
			say = "へへっ、ここからは本当の勝負ってやつだ",
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
			expression = 1,
			side = 2,
			dir = 1,
			actor = 103250,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "ああ、私たちは負けないよ",
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
			expression = 1,
			side = 2,
			dir = 1,
			actor = 202280,
			nameColor = "#a9f548",
			hidePaintObj = true,
			say = "仲間たちとご主人様のために、ダイドー…がんばります！",
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
