pg = pg or {}
pg.equip_siren_ability = {
	{
		attr_2 = "durability",
		name = "TBC",
		bonus = 1,
		id = 1,
		icon = "",
		attr_1 = "cannon",
		desc = "艾尔；炮击+$1；耐久+$2",
		effect = {
			29022
		}
	},
	{
		attr_2 = "antiaircraft",
		name = "WLK",
		bonus = 1,
		id = 2,
		icon = "",
		attr_1 = "air",
		desc = "凯旋；航空+$1；防空+$2",
		effect = {
			6220
		}
	},
	{
		attr_2 = "dodge",
		name = "CTM",
		bonus = 1,
		id = 3,
		icon = "",
		attr_1 = "hit",
		desc = "夕立；命中+$1；闪避+$2",
		effect = {
			29122
		}
	},
	{
		attr_2 = "reload",
		name = "PDA",
		bonus = 1,
		id = 4,
		icon = "",
		attr_1 = "speed",
		desc = "绫波；航速+$1；装填+$2",
		effect = {
			29112
		}
	},
	{
		attr_2 = "torpedo",
		name = "WOD",
		bonus = 1,
		id = 5,
		icon = "",
		attr_1 = "antisub",
		desc = "罗恩+防空；反潜+$1；雷击+$2",
		effect = {
			29242,
			1044
		}
	},
	all = {
		1,
		2,
		3,
		4,
		5
	}
}

return
