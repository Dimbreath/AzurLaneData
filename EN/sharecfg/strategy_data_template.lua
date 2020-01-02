pg = pg or {}
pg.strategy_data_template = {
	{
		buff_id = 100,
		name = "Single Line Assault",
		type = 1,
		id = 1,
		icon = "1",
		desc = "Your fleet has 15% increased Firepower and Torpedo, and 10% reduced Evasion.",
		arg = {}
	},
	{
		buff_id = 110,
		name = "Double Line Advance",
		type = 1,
		id = 2,
		icon = "2",
		desc = "Your fleet Evasion has increased by 30%, while Firepower and Torpedo has reduced by 5%.",
		arg = {}
	},
	{
		buff_id = 120,
		name = "Circular Defence",
		type = 1,
		id = 3,
		icon = "3",
		desc = "Your fleet has 20% increased Anti-Air.",
		arg = {}
	},
	{
		buff_id = 0,
		name = "Emergency Repair",
		type = 2,
		id = 4,
		icon = "4",
		desc = "Restore 10%  HP to all ships in your current fleet",
		arg = {
			healthy,
			10
		}
	},
	[9] = {
		buff_id = 0,
		name = "Exchange location",
		type = 2,
		id = 9,
		icon = "9",
		desc = "Exchange location with friendly team",
		arg = {
			exchange
		}
	},
	[10] = {
		buff_id = 0,
		name = "Unrestricted Support",
		type = 4,
		id = 10,
		icon = "10",
		desc = "Submarine Support can be called in beyond the fleet's ASR boundaries.",
		arg = {
			map_call
		}
	},
	[11] = {
		buff_id = 0,
		name = "Positional Change",
		type = 3,
		id = 11,
		icon = "11",
		desc = "Changes the Submarine Fleet's position on the map.",
		arg = {
			sub_move,
			1.1
		}
	},
	[12] = {
		buff_id = 0,
		name = "Sonar Scan",
		type = 5,
		id = 12,
		icon = "12",
		desc = "Requisition land-based anti-submarine support. Perform an anti-submarine scan of the entire map, marking any submerged submarines.",
		arg = {
			area_scout
		}
	},
	[90] = {
		buff_id = 90,
		name = "RED ALERT!",
		type = 90,
		id = 90,
		icon = "90",
		desc = "Kizuna AI is going to harass you during your next battle: Submarine Call, Air Strike, Torpedo Attack, and Main Battery Fire functions will be locked (including manual control mode). Tap her face a bunch to make her go away.",
		arg = {}
	},
	[91] = {
		buff_id = 91,
		name = "Crisis Averted~",
		type = 90,
		id = 91,
		icon = "91",
		desc = "Crisis Averted~Nobody is going to harass you this time",
		arg = {}
	},
	[92] = {
		buff_id = 0,
		name = "Nightfall",
		type = 3,
		id = 92,
		icon = "92",
		desc = "Enemies will appear on Ambush tiles during nighttime.",
		arg = {}
	},
	[93] = {
		buff_id = 0,
		name = "Daybreak",
		type = 3,
		id = 93,
		icon = "93",
		desc = "Enemies won't appear on Ambush tiles during daytime.",
		arg = {}
	},
	[9500] = {
		buff_id = 9500,
		name = "Wisdom Cube Reactivity",
		type = 10,
		id = 9500,
		icon = "9500",
		desc = "Due to a highly reactive Wisdom Cube, the entire fleet's DMG increases by 20%, but their DMG taken also increases by 20%.",
		arg = {}
	},
	[10001] = {
		buff_id = 200,
		name = "Adequate Ammo",
		type = 1000,
		id = 10001,
		icon = "10001",
		desc = "Your fleet deals 10% increased DMG",
		arg = {}
	},
	[10002] = {
		buff_id = 210,
		name = "Out of Ammo",
		type = 1000,
		id = 10002,
		icon = "10002",
		desc = "Your fleet deals 50% reduced DMG",
		arg = {}
	},
	[10011] = {
		buff_id = 220,
		name = "制空权确保",
		type = 1001,
		id = 10011,
		icon = "10011",
		desc = "舰队全员航空攻击伤害提高20%，受到的航空攻击伤害降低10%，命中提高10%，受到伏击的概率降低8% (航空攻击伤害提高或降低不影响点燃进水伤害)",
		arg = {
			800
		}
	},
	[10012] = {
		buff_id = 230,
		name = "制空权优势",
		type = 1001,
		id = 10012,
		icon = "10012",
		desc = "舰队全员航空攻击伤害提高12%，受到的航空攻击伤害降低6%，命中提高5%，受到伏击的概率降低5% (航空攻击伤害提高或降低不影响点燃进水伤害)",
		arg = {
			500
		}
	},
	[10013] = {
		buff_id = 240,
		name = "势均力敌",
		type = 1001,
		id = 10013,
		icon = "10013",
		desc = "舰队全员航空攻击伤害降低6%，受到的航空攻击伤害降低3% (航空攻击伤害提高或降低不影响点燃进水伤害)",
		arg = {
			0
		}
	},
	[10014] = {
		buff_id = 250,
		name = "制空权劣势",
		type = 1001,
		id = 10014,
		icon = "10014",
		desc = "舰队全员航空攻击伤害降低12%，受到的航空攻击伤害提高6%，命中、机动降低3% (航空攻击伤害提高或降低不影响点燃进水伤害)",
		arg = {
			0
		}
	},
	[10015] = {
		buff_id = 260,
		name = "制空权丧失",
		type = 1001,
		id = 10015,
		icon = "10015",
		desc = "舰队全员航空攻击伤害降低20%，受到的航空攻击伤害提高10%，命中、机动降低8% (航空攻击伤害提高或降低不影响点燃进水伤害)",
		arg = {
			0
		}
	},
	all = {
		1,
		2,
		3,
		4,
		9,
		10,
		11,
		12,
		90,
		91,
		92,
		93,
		9500,
		10001,
		10002,
		10011,
		10012,
		10013,
		10014,
		10015
	}
}

return
