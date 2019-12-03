pg = pg or {}
pg.questionnaire_template = {
	{
		bonus = 0,
		id = 1,
		title = "测试问卷标题",
		desc = "测试问卷描述",
		problem_list = {
			101,
			102,
			103
		}
	},
	{
		bonus = 4003,
		id = 2,
		title = "问卷测试demo",
		desc = "这是一个问卷测试demo，有八道题，其中七道是必答的，最后一道选答，必答题全部答完之后可以领取3000石油",
		problem_list = {
			201,
			202,
			203,
			204,
			205,
			206,
			207,
			208
		}
	},
	all = {
		1,
		2
	}
}

return
