pg = pg or {}
pg.world_collection_record_template = {
	[100001] = {
		group_ID = 1,
		name = "작전 브리핑",
		mask = "bg/bg_memory",
		id = 100001,
		icon = "memory_dashijie",
		condition = "「대형 작전」 시작",
		story = "WORLD100A"
	},
	[100002] = {
		group_ID = 2,
		name = "서막I",
		mask = "bg/bg_memory",
		id = 100002,
		icon = "memory_dashijie",
		condition = "챕터1 시작-서막",
		story = "GWORLD101A"
	},
	[100003] = {
		group_ID = 3,
		name = "서막II",
		mask = "bg/bg_memory",
		id = 100003,
		icon = "memory_dashijie",
		condition = "호넷 조우",
		story = "GWORLD101B"
	},
	[100004] = {
		group_ID = 4,
		name = "서막III",
		mask = "bg/bg_memory",
		id = 100004,
		icon = "memory_dashijie",
		condition = "호넷 격파",
		story = "GWORLD101C"
	},
	[100005] = {
		group_ID = 5,
		name = "서막IV",
		mask = "bg/bg_memory",
		id = 100005,
		icon = "memory_dashijie",
		condition = "후퇴 완료 후",
		story = "GWORLD101D"
	},
	[100006] = {
		group_ID = 6,
		name = "나팔",
		mask = "bg/bg_memory",
		id = 100006,
		icon = "memory_dashijie",
		condition = "연습 해역 내 NY항 입장",
		story = "WORLD102A"
	},
	[100007] = {
		group_ID = 7,
		name = "익숙한 얼굴",
		mask = "bg/bg_memory",
		id = 100007,
		icon = "memory_dashijie",
		condition = "챕터 1-2 시작",
		story = "WORLD105A"
	},
	[100008] = {
		group_ID = 8,
		name = "TB 시스템",
		mask = "bg/bg_memory",
		id = 100008,
		icon = "memory_dashijie",
		condition = "첫 번째 탐색 포인트로 이동",
		story = "WORLD105B"
	},
	[100009] = {
		group_ID = 9,
		name = "회상",
		mask = "bg/bg_memory",
		id = 100009,
		icon = "memory_dashijie",
		condition = "1구역 모든 적 처치",
		story = "WORLD105C"
	},
	[100010] = {
		group_ID = 10,
		name = "불빛",
		mask = "bg/bg_memory",
		id = 100010,
		icon = "memory_dashijie",
		condition = "2구역 모든 적 처치",
		story = "WORLD105D"
	},
	[100011] = {
		group_ID = 11,
		name = "또 다른 누군가",
		mask = "bg/bg_memory",
		id = 100011,
		icon = "memory_dashijie",
		condition = "두 번째 탐색 포인트로 이동",
		story = "WORLD105E"
	},
	[100012] = {
		group_ID = 12,
		name = "적의 적",
		mask = "bg/bg_memory",
		id = 100012,
		icon = "memory_dashijie",
		condition = "챕터 1-3 시작",
		story = "WORLD106A"
	},
	[100013] = {
		group_ID = 13,
		name = "탐색I",
		mask = "bg/bg_memory",
		id = 100013,
		icon = "memory_dashijie",
		condition = "첫 번째 탐색 포인트로 이동",
		story = "WORLD106B"
	},
	[100014] = {
		group_ID = 14,
		name = "탐색II",
		mask = "bg/bg_memory",
		id = 100014,
		icon = "memory_dashijie",
		condition = "두 번째 탐색 포인트로 이동",
		story = "WORLD106C"
	},
	[100015] = {
		group_ID = 15,
		name = "탐색III",
		mask = "bg/bg_memory",
		id = 100015,
		icon = "memory_dashijie",
		condition = "세 번째 탐색 포인트로 이동",
		story = "WORLD106D"
	},
	[100016] = {
		group_ID = 16,
		name = "단계적 발전",
		mask = "bg/bg_memory",
		id = 100016,
		icon = "memory_dashijie",
		condition = "모든 적 처치",
		story = "WORLD106E"
	},
	[100017] = {
		group_ID = 17,
		name = "단계적 발전",
		mask = "bg/bg_memory",
		id = 100017,
		icon = "memory_dashijie",
		condition = "챕터 1-4 시작",
		story = "WORLD107A"
	},
	[100018] = {
		group_ID = 18,
		name = "붉은 함대",
		mask = "bg/bg_memory",
		id = 100018,
		icon = "memory_dashijie",
		condition = "적 함대 5개 처치",
		story = "WORLD107B"
	},
	[100019] = {
		group_ID = 19,
		name = "통신",
		mask = "bg/bg_memory",
		id = 100019,
		icon = "memory_dashijie",
		condition = "챕터 1-5 첫 번째 탐색 포인트로 이동",
		story = "WORLD108A"
	},
	[100020] = {
		group_ID = 20,
		name = "공중전",
		mask = "bg/bg_memory",
		id = 100020,
		icon = "memory_dashijie",
		condition = "두 번째 탐색 포인트로 이동",
		story = "WORLD108B"
	},
	[100021] = {
		group_ID = 21,
		name = "휴전",
		mask = "bg/bg_memory",
		id = 100021,
		icon = "memory_dashijie",
		condition = "메탈 블러드 주력 함대 격파",
		story = "WORLD108C"
	},
	[100022] = {
		group_ID = 22,
		name = "준비 작업",
		mask = "bg/bg_memory",
		id = 100022,
		icon = "memory_dashijie",
		condition = "챕터 1-6 첫 번째 탐색 포인트로 이동",
		story = "WORLD109A"
	},
	[100023] = {
		group_ID = 23,
		name = "준비 완료",
		mask = "bg/bg_memory",
		id = 100023,
		icon = "memory_dashijie",
		condition = "세 번째 탐색 포인트로 이동",
		story = "WORLD109B"
	},
	[100024] = {
		group_ID = 24,
		name = "비콘·애쉬",
		mask = "bg/bg_memory",
		id = 100024,
		icon = "memory_dashijie",
		condition = "「비콘·애쉬」 시스템 해제",
		story = "GWORLD109A"
	},
	[100025] = {
		group_ID = 1,
		name = "여왕의 의무",
		mask = "bg/bg_memory",
		id = 100025,
		icon = "memory_dashijie",
		condition = "챕터 2-1 내 리버풀 항 진입",
		story = "WORLD200A"
	},
	[100026] = {
		group_ID = 2,
		name = "집결",
		mask = "bg/bg_memory",
		id = 100026,
		icon = "memory_dashijie",
		condition = "첫 번째 탐색 포인트로 이동",
		story = "WORLD200B"
	},
	[100027] = {
		group_ID = 3,
		name = "공동 작전",
		mask = "bg/bg_memory",
		id = 100027,
		icon = "memory_dashijie",
		condition = "챕터 2-2 첫 번째 탐색 포인트로 이동",
		story = "WORLD201A"
	},
	[100028] = {
		group_ID = 4,
		name = "외곽 청소",
		mask = "bg/bg_memory",
		id = 100028,
		icon = "memory_dashijie",
		condition = "챕터 2-3 시작",
		story = "WORLD202A"
	},
	[100029] = {
		group_ID = 5,
		name = "구조 신호",
		mask = "bg/bg_memory",
		id = 100029,
		icon = "memory_dashijie",
		condition = "모든 적 처치",
		story = "WORLD202B"
	},
	[100030] = {
		group_ID = 6,
		name = "사고 지점",
		mask = "bg/bg_memory",
		id = 100030,
		icon = "memory_dashijie",
		condition = "챕터 2-4 시작",
		story = "WORLD203A"
	},
	[100031] = {
		group_ID = 7,
		name = "잔해",
		mask = "bg/bg_memory",
		id = 100031,
		icon = "memory_dashijie",
		condition = "첫 번째 탐색 포인트로 이동",
		story = "WORLD203B"
	},
	[100032] = {
		group_ID = 8,
		name = "잔영",
		mask = "bg/bg_memory",
		id = 100032,
		icon = "memory_dashijie",
		condition = "두 번째 탐색 포인트로 이동",
		story = "WORLD203C"
	},
	[100033] = {
		group_ID = 9,
		name = "연구 임무",
		mask = "bg/bg_memory",
		id = 100033,
		icon = "memory_dashijie",
		condition = "세 번째 탐색 포인트로 이동",
		story = "WORLD203D"
	},
	[100034] = {
		group_ID = 10,
		name = "여왕의 연락",
		mask = "bg/bg_memory",
		id = 100034,
		icon = "memory_dashijie",
		condition = "챕터 2-5 첫 번째 탐색 포인트로 이동",
		story = "WORLD204A"
	},
	[100035] = {
		group_ID = 11,
		name = "중력 이상",
		mask = "bg/bg_memory",
		id = 100035,
		icon = "memory_dashijie",
		condition = "챕터 2-6 시작",
		story = "WORLD205A"
	},
	[100036] = {
		group_ID = 12,
		name = "워밍 업",
		mask = "bg/bg_memory",
		id = 100036,
		icon = "memory_dashijie",
		condition = "모든 적 처치",
		story = "WORLD205B"
	},
	[100037] = {
		group_ID = 13,
		name = "강적",
		mask = "bg/bg_memory",
		id = 100037,
		icon = "memory_dashijie",
		condition = "챕터 2-6 내 모든 특수 유닛 처치",
		story = "WORLD205C"
	},
	[100038] = {
		group_ID = 14,
		name = "두 번째 전초 기지",
		mask = "bg/bg_memory",
		id = 100038,
		icon = "memory_dashijie",
		condition = "적 특수 유닛 처치",
		story = "WORLD205D"
	},
	[100039] = {
		group_ID = 1,
		name = "또 다른 공격",
		mask = "bg/bg_memory",
		id = 100039,
		icon = "memory_dashijie",
		condition = "챕터 3-1 항구 진입",
		story = "WORLD300A"
	},
	[100040] = {
		group_ID = 2,
		name = "TB 시스템 테스트",
		mask = "bg/bg_memory",
		id = 100040,
		icon = "memory_dashijie",
		condition = "첫 번째 탐색 포인트로 이동",
		story = "WORLD300B"
	},
	[100041] = {
		group_ID = 3,
		name = "메탈 블러드의 동향",
		mask = "bg/bg_memory",
		id = 100041,
		icon = "memory_dashijie",
		condition = "챕터 3-2 첫 번째 탐색 포인트로 이동",
		story = "WORLD301A"
	},
	[100042] = {
		group_ID = 4,
		name = "아군의 신호",
		mask = "bg/bg_memory",
		id = 100042,
		icon = "memory_dashijie",
		condition = "챕터 3-3 첫 번째 탐색 포인트로 이동",
		story = "WORLD302A"
	},
	[100043] = {
		group_ID = 5,
		name = "교란",
		mask = "bg/bg_memory",
		id = 100043,
		icon = "memory_dashijie",
		condition = "두 번째 탐색 포인트로 이동",
		story = "WORLD302B"
	},
	[100044] = {
		group_ID = 6,
		name = "구원",
		mask = "bg/bg_memory",
		id = 100044,
		icon = "memory_dashijie",
		condition = "챕터 3-4 시작",
		story = "WORLD303A"
	},
	[100045] = {
		group_ID = 7,
		name = "의혹",
		mask = "bg/bg_memory",
		id = 100045,
		icon = "memory_dashijie",
		condition = "첫 번째 탐색 포인트로 이동",
		story = "WORLD303B"
	},
	[100046] = {
		group_ID = 8,
		name = "분산 계획",
		mask = "bg/bg_memory",
		id = 100046,
		icon = "memory_dashijie",
		condition = "챕터 3-5 시작",
		story = "WORLD304A"
	},
	[100047] = {
		group_ID = 9,
		name = "잔영",
		mask = "bg/bg_memory",
		id = 100047,
		icon = "memory_dashijie",
		condition = "첫 번째 탐색 포인트로 이동",
		story = "WORLD304B"
	},
	[100048] = {
		group_ID = 10,
		name = "중재 기관",
		mask = "bg/bg_memory",
		id = 100048,
		icon = "memory_dashijie",
		condition = "두 번째 탐색 포인트로 이동",
		story = "WORLD304C"
	},
	[100049] = {
		group_ID = 11,
		name = "증원",
		mask = "bg/bg_memory",
		id = 100049,
		icon = "memory_dashijie",
		condition = "모든 적 처치",
		story = "WORLD304D"
	},
	[100050] = {
		group_ID = 12,
		name = "용의주도",
		mask = "bg/bg_memory",
		id = 100050,
		icon = "memory_dashijie",
		condition = "적 특수 유닛 처치",
		story = "WORLD304E"
	},
	[100051] = {
		group_ID = 13,
		name = "단숨에",
		mask = "bg/bg_memory",
		id = 100051,
		icon = "memory_dashijie",
		condition = "챕터 3-6 시작",
		story = "WORLD305A"
	},
	[100052] = {
		group_ID = 14,
		name = "수정",
		mask = "bg/bg_memory",
		id = 100052,
		icon = "memory_dashijie",
		condition = "첫 번째 탐색 포인트로 이동",
		story = "WORLD305B"
	},
	[100053] = {
		group_ID = 1,
		name = "지중해 진입",
		mask = "bg/bg_memory",
		id = 100053,
		icon = "memory_dashijie",
		condition = "챕터 4-1 첫 번째 탐색 포인트로 이동",
		story = "WORLD400A"
	},
	[100054] = {
		group_ID = 2,
		name = "사르데냐",
		mask = "bg/bg_memory",
		id = 100054,
		icon = "memory_dashijie",
		condition = "두 번째 탐색 포인트로 이동",
		story = "WORLD400B"
	},
	[100055] = {
		group_ID = 3,
		name = "타란토 항",
		mask = "bg/bg_memory",
		id = 100055,
		icon = "memory_dashijie",
		condition = "챕터 4-2 시작",
		story = "WORLD401A"
	},
	[100056] = {
		group_ID = 4,
		name = "중도 이탈",
		mask = "bg/bg_memory",
		id = 100056,
		icon = "memory_dashijie",
		condition = "첫 번째 탐색 포인트로 이동",
		story = "WORLD401B"
	},
	[100057] = {
		group_ID = 5,
		name = "다카르 항",
		mask = "bg/bg_memory",
		id = 100057,
		icon = "memory_dashijie",
		condition = "챕터 4-3 시작",
		story = "WORLD402A"
	},
	[100058] = {
		group_ID = 6,
		name = "단독 행동",
		mask = "bg/bg_memory",
		id = 100058,
		icon = "memory_dashijie",
		condition = "첫 번째 탐색 포인트로 이동",
		story = "WORLD402B"
	},
	[100059] = {
		group_ID = 7,
		name = "의혹",
		mask = "bg/bg_memory",
		id = 100059,
		icon = "memory_dashijie",
		condition = "챕터 4-4 모든 적 처치",
		story = "WORLD403A"
	},
	[100060] = {
		group_ID = 8,
		name = "습격",
		mask = "bg/bg_memory",
		id = 100060,
		icon = "memory_dashijie",
		condition = "챕터 4-5 시작",
		story = "WORLD404A"
	},
	[100061] = {
		group_ID = 9,
		name = "이상",
		mask = "bg/bg_memory",
		id = 100061,
		icon = "memory_dashijie",
		condition = "첫 번째 탐색 포인트로 이동",
		story = "WORLD404B"
	},
	[100062] = {
		group_ID = 10,
		name = "AF 작전",
		mask = "bg/bg_memory",
		id = 100062,
		icon = "memory_dashijie",
		condition = "두 번째 탐색 포인트로 이동",
		story = "WORLD404C"
	},
	[100063] = {
		group_ID = 11,
		name = "대체품",
		mask = "bg/bg_memory",
		id = 100063,
		icon = "memory_dashijie",
		condition = "세 번째 탐색 포인트로 이동",
		story = "WORLD404D"
	},
	[100064] = {
		group_ID = 12,
		name = "군사의 전승",
		mask = "bg/bg_memory",
		id = 100064,
		icon = "memory_dashijie",
		condition = "챕터 4-6 첫 번째 탐색 포인트로 이동",
		story = "WORLD405A"
	},
	[100065] = {
		group_ID = 13,
		name = "적의 그림자",
		mask = "bg/bg_memory",
		id = 100065,
		icon = "memory_dashijie",
		condition = "모든 적 처치",
		story = "WORLD405B"
	},
	[100066] = {
		group_ID = 14,
		name = "수정",
		mask = "bg/bg_memory",
		id = 100066,
		icon = "memory_dashijie",
		condition = "적 특수 유닛 처치",
		story = "WORLD405C"
	},
	[100071] = {
		group_ID = 1,
		name = "DMRECX074: META",
		mask = "bg/bg_memory",
		id = 100071,
		icon = "memory_dashijie",
		condition = "챕터 1-6 두 번째 탐색 포인트로 이동",
		story = "WORLD9901A"
	},
	all = {
		100001,
		100002,
		100003,
		100004,
		100005,
		100006,
		100007,
		100008,
		100009,
		100010,
		100011,
		100012,
		100013,
		100014,
		100015,
		100016,
		100017,
		100018,
		100019,
		100020,
		100021,
		100022,
		100023,
		100024,
		100025,
		100026,
		100027,
		100028,
		100029,
		100030,
		100031,
		100032,
		100033,
		100034,
		100035,
		100036,
		100037,
		100038,
		100039,
		100040,
		100041,
		100042,
		100043,
		100044,
		100045,
		100046,
		100047,
		100048,
		100049,
		100050,
		100051,
		100052,
		100053,
		100054,
		100055,
		100056,
		100057,
		100058,
		100059,
		100060,
		100061,
		100062,
		100063,
		100064,
		100065,
		100066,
		100071
	}
}
