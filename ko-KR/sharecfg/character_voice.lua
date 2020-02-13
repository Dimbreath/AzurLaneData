pg = pg or {}
pg.character_voice = {
	unlock = {
		voice_name = "입수 시",
		key = "unlock",
		resource_key = "get",
		spine_action = "stand",
		profile_index = 1,
		l2d_action = "",
		unlock_condition = {
			0,
			0
		}
	},
	login = {
		voice_name = "로그인",
		key = "login",
		resource_key = "login",
		spine_action = "stand2",
		profile_index = 2,
		l2d_action = "login",
		unlock_condition = {
			0,
			0
		}
	},
	detail = {
		voice_name = "상세확인",
		key = "detail",
		resource_key = "detail",
		spine_action = "normal",
		profile_index = 3,
		l2d_action = "",
		unlock_condition = {
			0,
			0
		}
	},
	main1 = {
		voice_name = "메인1",
		key = "main1",
		resource_key = "main_1",
		spine_action = "normal",
		profile_index = 4,
		l2d_action = "main_1",
		unlock_condition = {
			0,
			0
		}
	},
	main2 = {
		voice_name = "메인2",
		key = "main2",
		resource_key = "main_2",
		spine_action = "normal",
		profile_index = 5,
		l2d_action = "main_2",
		unlock_condition = {
			0,
			0
		}
	},
	main3 = {
		voice_name = "메인3",
		key = "main3",
		resource_key = "main_3",
		spine_action = "normal",
		profile_index = 6,
		l2d_action = "main_3",
		unlock_condition = {
			0,
			0
		}
	},
	main4 = {
		voice_name = "메인4",
		key = "main4",
		resource_key = "main_4",
		spine_action = "normal",
		profile_index = 7,
		l2d_action = "main_3",
		unlock_condition = {
			0,
			0
		}
	},
	main5 = {
		voice_name = "메인5",
		key = "main5",
		resource_key = "main_5",
		spine_action = "normal",
		profile_index = 8,
		l2d_action = "main_3",
		unlock_condition = {
			0,
			0
		}
	},
	main6 = {
		voice_name = "메인6",
		key = "main6",
		resource_key = "main_6",
		spine_action = "normal",
		profile_index = 9,
		l2d_action = "main_3",
		unlock_condition = {
			0,
			0
		}
	},
	touch = {
		voice_name = "터치1",
		key = "touch",
		resource_key = "touch_1",
		spine_action = "touch",
		profile_index = 10,
		l2d_action = "touch_body",
		unlock_condition = {
			0,
			0
		}
	},
	touch2 = {
		voice_name = "터치2",
		key = "touch2",
		resource_key = "touch_2",
		spine_action = "tuozhuai",
		profile_index = 11,
		l2d_action = "touch_special",
		unlock_condition = {
			0,
			0
		}
	},
	headtouch = {
		voice_name = "터치3",
		key = "headtouch",
		resource_key = "touch_head",
		spine_action = "tuozhuai2",
		profile_index = 12,
		l2d_action = "touch_head",
		unlock_condition = {
			0,
			0
		}
	},
	mission = {
		voice_name = "임무",
		key = "mission",
		resource_key = "task",
		spine_action = "move",
		profile_index = 13,
		l2d_action = "mission",
		unlock_condition = {
			0,
			0
		}
	},
	mission_complete = {
		voice_name = "임무완료",
		key = "mission_complete",
		resource_key = "mission_complete",
		spine_action = "victory",
		profile_index = 14,
		l2d_action = "mission_complete",
		unlock_condition = {
			0,
			0
		}
	},
	mail = {
		voice_name = "우편",
		key = "mail",
		resource_key = "mail",
		spine_action = "victory",
		profile_index = 15,
		l2d_action = "mail",
		unlock_condition = {
			0,
			0
		}
	},
	home = {
		voice_name = "모항귀환",
		key = "home",
		resource_key = "home",
		spine_action = "walk",
		profile_index = 16,
		l2d_action = "home",
		unlock_condition = {
			0,
			0
		}
	},
	feeling1 = {
		voice_name = "실망",
		key = "feeling1",
		resource_key = "feeling1",
		spine_action = "normal",
		profile_index = 17,
		l2d_action = "",
		unlock_condition = {
			1,
			0
		}
	},
	feeling2 = {
		voice_name = "낯섦",
		key = "feeling2",
		resource_key = "feeling2",
		spine_action = "normal",
		profile_index = 18,
		l2d_action = "",
		unlock_condition = {
			1,
			3100
		}
	},
	feeling3 = {
		voice_name = "호감",
		key = "feeling3",
		resource_key = "feeling3",
		spine_action = "normal",
		profile_index = 19,
		l2d_action = "",
		unlock_condition = {
			1,
			6100
		}
	},
	feeling4 = {
		voice_name = "기쁨",
		key = "feeling4",
		resource_key = "feeling4",
		spine_action = "normal",
		profile_index = 20,
		l2d_action = "",
		unlock_condition = {
			1,
			8100
		}
	},
	feeling5 = {
		voice_name = "사랑",
		key = "feeling5",
		resource_key = "feeling5",
		spine_action = "normal",
		profile_index = 21,
		l2d_action = "",
		unlock_condition = {
			1,
			10000
		}
	},
	propose = {
		voice_name = "서약",
		key = "propose",
		resource_key = "propose",
		spine_action = "normal",
		profile_index = 22,
		l2d_action = "wedding",
		unlock_condition = {
			2,
			0
		}
	},
	expedition = {
		voice_name = "의뢰완료",
		key = "expedition",
		resource_key = "expedition",
		spine_action = "victory",
		profile_index = 23,
		l2d_action = "complete",
		unlock_condition = {
			0,
			0
		}
	},
	upgrade = {
		voice_name = "강화성공",
		key = "upgrade",
		resource_key = "upgrade",
		spine_action = "victory",
		profile_index = 24,
		l2d_action = "",
		unlock_condition = {
			0,
			0
		}
	},
	battle = {
		voice_name = "전투개시",
		key = "battle",
		resource_key = "warcry",
		spine_action = "attack",
		profile_index = 25,
		l2d_action = "",
		unlock_condition = {
			0,
			0
		}
	},
	win_mvp = {
		voice_name = "승리",
		key = "win_mvp",
		resource_key = "mvp",
		spine_action = "victory",
		profile_index = 26,
		l2d_action = "",
		unlock_condition = {
			0,
			0
		}
	},
	lose = {
		voice_name = "실패",
		key = "lose",
		resource_key = "lose",
		spine_action = "dead",
		profile_index = 27,
		l2d_action = "",
		unlock_condition = {
			0,
			0
		}
	},
	skill = {
		voice_name = "스킬",
		key = "skill",
		resource_key = "skill",
		spine_action = "skill",
		profile_index = 28,
		l2d_action = "",
		unlock_condition = {
			0,
			0
		}
	},
	hp_warning = {
		voice_name = "HP 경고",
		key = "hp_warning",
		resource_key = "hp",
		spine_action = "dead",
		profile_index = 29,
		l2d_action = "",
		unlock_condition = {
			0,
			0
		}
	},
	link1 = {
		voice_name = "상호 반응1",
		key = "link1",
		resource_key = "link1",
		spine_action = "attcak",
		profile_index = 30,
		l2d_action = "",
		unlock_condition = {
			-1,
			0
		}
	},
	link2 = {
		voice_name = "상호 반응2",
		key = "link2",
		resource_key = "link2",
		spine_action = "attcak",
		profile_index = 31,
		l2d_action = "",
		unlock_condition = {
			-1,
			0
		}
	},
	link3 = {
		voice_name = "상호 반응3",
		key = "link3",
		resource_key = "link3",
		spine_action = "attcak",
		profile_index = 32,
		l2d_action = "",
		unlock_condition = {
			-1,
			0
		}
	},
	link4 = {
		voice_name = "상호 반응4",
		key = "link4",
		resource_key = "link4",
		spine_action = "attcak",
		profile_index = 33,
		l2d_action = "",
		unlock_condition = {
			-1,
			0
		}
	},
	link5 = {
		voice_name = "상호 반응5",
		key = "link5",
		resource_key = "link5",
		spine_action = "attcak",
		profile_index = 34,
		l2d_action = "",
		unlock_condition = {
			-1,
			0
		}
	},
	link6 = {
		voice_name = "상호 반응6",
		key = "link6",
		resource_key = "link6",
		spine_action = "attcak",
		profile_index = 35,
		l2d_action = "",
		unlock_condition = {
			-1,
			0
		}
	},
	profile = {
		voice_name = "도감",
		key = "profile",
		resource_key = "profile",
		spine_action = "stand2",
		profile_index = 36,
		l2d_action = "",
		unlock_condition = {
			-1,
			0
		}
	}
}

return
