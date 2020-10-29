return {
	fadeOut = 1.5,
	mode = 2,
	fadeType = 1,
	once = true,
	id = "JICHANG1",
	fadein = 1.5,
	scripts = {
		{
			stopbgm = true,
			mode = 1,
			sequence = {
				{
					"<size=51>「航路を導く灯火、それは『星』」</size>",
					1
				},
				{
					"<size=51>「ときにはセントエルモの火として、ときには過洋牽星（かようけんせい）として、ときには名も知れぬ導くの光として――」</size>",
					2
				},
				{
					"<size=51>「古より伝わってきた伝説の中では、『星』は光となって、炎となって船を、旅人を守り続ける」</size>",
					3
				},
				{
					"<size=51>「そして人々もまた星々に想いを載せ、讃える歌をもって相手に伝えようとする」</size> ",
					4
				},
				{
					"<size=51>「仮形の星、想いの象徴、愛されるべき尊き導く光。それは敬虔に思われしき偶像、そして空高く輝くスター」</size> ",
					5
				},
				{
					"<size=51>「北極星（「Polaris」）だけでなく、海を照らす星々の光は、一体どんな想いが寄せられているのかしら？」</size> ",
					6
				},
				{
					"<size=51>「見せてご覧なさい。あなたたちの物語を――」</size> ",
					7
				}
			}
		},
		{
			mode = 1,
			stopbgm = true,
			blackBg = true,
			effects = {
				{
					active = true,
					name = "jichang"
				}
			},
			sequence = {
				{
					"",
					2
				}
			}
		}
	}
}
