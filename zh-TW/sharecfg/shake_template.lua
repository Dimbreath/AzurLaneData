pg = pg or {}
pg.shake_template = {
	[0] = {
		description = "无震动",
		verticalDeltaDeep = 0,
		time = 0,
		horizontalDeltaDeep = 0,
		verticalDeep = 0,
		horizontalRatio = 0,
		verticalRatio = 0,
		loop = 0,
		horizontalDeep = 0,
		id = 0
	},
	[103] = {
		description = "水平微弱震动",
		verticalDeltaDeep = 0,
		time = 2.5,
		horizontalDeltaDeep = 0,
		verticalDeep = 0,
		horizontalRatio = 0.93,
		verticalRatio = 0,
		loop = 3,
		horizontalDeep = 30,
		id = 103
	},
	[109] = {
		description = "水平强烈震动",
		verticalDeltaDeep = 0,
		time = 3,
		horizontalDeltaDeep = 0,
		verticalDeep = 0,
		horizontalRatio = 0.98,
		verticalRatio = 0,
		loop = 2,
		horizontalDeep = 100,
		id = 109
	},
	[203] = {
		description = "垂直微弱震动",
		verticalDeltaDeep = 0,
		time = 2.5,
		horizontalDeltaDeep = 0,
		verticalDeep = 30,
		horizontalRatio = 0,
		verticalRatio = 0.93,
		loop = 3,
		horizontalDeep = 0,
		id = 203
	},
	[209] = {
		description = "垂直剧烈震动",
		verticalDeltaDeep = 0,
		time = 3,
		horizontalDeltaDeep = 0,
		verticalDeep = 100,
		horizontalRatio = 0,
		verticalRatio = 0.98,
		loop = 2,
		horizontalDeep = 0,
		id = 209
	},
	[301] = {
		description = "玩家被击中",
		verticalDeltaDeep = 0,
		time = 2,
		horizontalDeltaDeep = 0,
		verticalDeep = 0,
		horizontalRatio = 0.7,
		verticalRatio = 0,
		loop = 2,
		horizontalDeep = 0.5,
		id = 301
	},
	[302] = {
		description = "大炮后坐力",
		verticalDeltaDeep = 0,
		time = 2,
		horizontalDeltaDeep = 0,
		verticalDeep = 0,
		horizontalRatio = 0.6,
		verticalRatio = 0,
		loop = 3,
		horizontalDeep = -1,
		id = 302
	},
	[303] = {
		description = "机枪后坐力",
		verticalDeltaDeep = 0,
		time = 10,
		horizontalDeltaDeep = 0,
		verticalDeep = 0,
		horizontalRatio = -1,
		verticalRatio = 0,
		loop = 7,
		horizontalDeep = 20,
		id = 303
	},
	all = {
		0,
		103,
		109,
		203,
		209,
		301,
		302,
		303
	}
}

return
