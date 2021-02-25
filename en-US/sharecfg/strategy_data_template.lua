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
		name = "Circular Defense",
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
	[47] = {
		buff_id = 0,
		name = "High-Efficiency Operation",
		type = 10,
		id = 47,
		icon = "tebiezuozhan",
		desc = "Increases the Oil spent on this current stage by 100%;\nIn the process, increases the Commander EXP, Meowfficer EXP, and Ship EXP gained by 100%, and grants an additional drop chance. Mood consumption and Affection gain are both increased by 100%. ",
		arg = {}
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
	[8650] = {
		buff_id = 8650,
		name = "Searchlight",
		type = 10,
		id = 8650,
		icon = "",
		desc = "Under the effect of a searchlight.",
		arg = {}
	},
	[8732] = {
		buff_id = 8732,
		name = "Blessing of the Butterfly",
		type = 10,
		id = 8732,
		icon = "8732",
		desc = "When activated: Shinano fires 3 rounds of supporting fire and increases your fleet's FP, TRP, and AVI by 5.0%.",
		arg = {}
	},
	[8744] = {
		buff_id = 8744,
		name = "Blessing of the Butterfly",
		type = 10,
		id = 8744,
		icon = "8732",
		desc = "When activated: Shinano fires 3 rounds of supporting fire and increases your fleet's FP, TRP, and AVI by 5.0%.",
		arg = {}
	},
	[8745] = {
		buff_id = 8745,
		name = "Blessing of the Butterfly",
		type = 10,
		id = 8745,
		icon = "8732",
		desc = "When activated: Shinano fires 3 rounds of supporting fire and increases your fleet's FP, TRP, and AVI by 5.0%.",
		arg = {}
	},
	[8746] = {
		buff_id = 8746,
		name = "Blessing of the Butterfly",
		type = 10,
		id = 8746,
		icon = "8732",
		desc = "When activated: Shinano fires 3 rounds of supporting fire and increases your fleet's FP, TRP, and AVI by 5.0%.",
		arg = {}
	},
	[8750] = {
		buff_id = 8750,
		name = "Searchlight",
		type = 10,
		id = 8750,
		icon = "",
		desc = "Under the effect of a searchlight.",
		arg = {}
	},
	[8801] = {
		buff_id = 8801,
		name = "Control Lost",
		type = 10,
		id = 8801,
		icon = "8801",
		desc = "You've lost control of the Floating Fortress! During battle, enemy forces will be reinforced by additional aircraft!",
		arg = {}
	},
	[8802] = {
		buff_id = 8802,
		name = "Secured Control",
		type = 10,
		id = 8802,
		icon = "8802",
		desc = "You've secured the Floating Fortress! During battle, allied aircraft will arrive to attack the enemies!",
		arg = {}
	},
	[8803] = {
		buff_id = 8803,
		name = "Allied Air Support",
		type = 10,
		id = 8803,
		icon = "",
		desc = "Allied Air Support",
		arg = {}
	},
	[8806] = {
		buff_id = 8806,
		name = "Allied Air Support",
		type = 10,
		id = 8806,
		icon = "",
		desc = "Allied Air Support",
		arg = {}
	},
	[8809] = {
		buff_id = 8809,
		name = "Allied Air Support",
		type = 10,
		id = 8809,
		icon = "",
		desc = "Allied Air Support",
		arg = {}
	},
	[8812] = {
		buff_id = 8812,
		name = "Allied Air Support",
		type = 10,
		id = 8812,
		icon = "",
		desc = "Allied Air Support",
		arg = {}
	},
	[8815] = {
		buff_id = 8815,
		name = "Allied Air Support",
		type = 10,
		id = 8815,
		icon = "",
		desc = "Allied Air Support",
		arg = {}
	},
	[8841] = {
		buff_id = 8841,
		name = "Radiance",
		type = 10,
		id = 8841,
		icon = "8841",
		desc = "In battle, your fleet will receive bombardment support.",
		arg = {}
	},
	[8842] = {
		buff_id = 8842,
		name = "Afterglow",
		type = 10,
		id = 8842,
		icon = "8842",
		desc = "The light has faded, and a mysterious foe appears in the enemy's fleet.",
		arg = {}
	},
	[8843] = {
		buff_id = 8843,
		name = "RadianceLV1",
		type = 10,
		id = 8843,
		icon = "",
		desc = "不显示图标及说明",
		arg = {}
	},
	[8846] = {
		buff_id = 8846,
		name = "RadianceLV2",
		type = 10,
		id = 8846,
		icon = "",
		desc = "不显示图标及说明",
		arg = {}
	},
	[8849] = {
		buff_id = 8849,
		name = "RadianceLV3",
		type = 10,
		id = 8849,
		icon = "",
		desc = "不显示图标及说明",
		arg = {}
	},
	[8852] = {
		buff_id = 8852,
		name = "RadianceLV4",
		type = 10,
		id = 8852,
		icon = "",
		desc = "不显示图标及说明",
		arg = {}
	},
	[8855] = {
		buff_id = 8855,
		name = "RadianceLV5",
		type = 10,
		id = 8855,
		icon = "",
		desc = "不显示图标及说明",
		arg = {}
	},
	[8858] = {
		buff_id = 8858,
		name = "Confluence of Dawn",
		type = 10,
		id = 8858,
		icon = "8858",
		desc = "Your fleet will receive bombardment support, but a mysterious foe also appears in the enemy's fleet.",
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
	[9502] = {
		buff_id = 9502,
		name = "Heavy Mist",
		type = 10,
		id = 9502,
		icon = "9502",
		desc = "An ominous mist surrounds the battlefield. The Accuracy of all your ships is decreased by 5%.",
		arg = {}
	},
	[9505] = {
		buff_id = 9505,
		name = "Iron Blood Aerial Support",
		type = 10,
		id = 9505,
		icon = "10017",
		desc = "Enemy Air Squads will appear on this stage, and your fleets will take 10% more damage from Airstrikes.",
		arg = {}
	},
	[9508] = {
		buff_id = 9508,
		name = "Endless Night",
		type = 10,
		id = 9508,
		icon = "10016",
		desc = "Darkness shrouds the battlefield, making it impossible to check the composition of enemy fleets before battle.",
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
		name = "Air Supremacy",
		type = 1001,
		id = 10011,
		icon = "10011",
		desc = "The DMG of your fleets' Airstrikes is increased by 20% and the DMG your fleets take from enemy aircraft is decreased by 10% (Flooding and Burn DMG are unaffected). Your fleets' Accuracy is increased by 10% and your Ambush encounter rate is decreased by 8%.",
		arg = {
			800
		}
	},
	[10012] = {
		buff_id = 230,
		name = "Air Superiority",
		type = 1001,
		id = 10012,
		icon = "10012",
		desc = "The DMG of your fleets' Airstrikes is increased by 12% and the DMG your fleets take from enemy aircraft is decreased by 6% (Flooding and Burn DMG are unaffected). Your fleets' Accuracy is increased by 5% and your Ambush encounter rate is decreased by 5%.",
		arg = {
			500
		}
	},
	[10013] = {
		buff_id = 240,
		name = "Air Parity",
		type = 1001,
		id = 10013,
		icon = "10013",
		desc = "The DMG of your fleets' Airstrikes is decreased by 6% and the DMG your fleets take from enemy aircraft is increased by 3% (Flooding and Burn DMG are unaffected).",
		arg = {
			0
		}
	},
	[10014] = {
		buff_id = 250,
		name = "Air Denial",
		type = 1001,
		id = 10014,
		icon = "10014",
		desc = "The DMG of your fleets' Airstrikes is decreased by 12% and the DMG your fleets take from enemy aircraft is increased by 6% (Flooding and Burn DMG are unaffected). Your fleets' Accuracy and EVA is decreased by 3%.",
		arg = {
			0
		}
	},
	[10015] = {
		buff_id = 260,
		name = "Air Incapability",
		type = 1001,
		id = 10015,
		icon = "10015",
		desc = "The DMG of your fleets' Airstrikes is decreased by 20% and the DMG your fleets take from enemy aircraft is increased by 10% (Flooding and Burn DMG are unaffected). Your fleets' Accuracy and EVA is decreased by 8%.",
		arg = {
			0
		}
	},
	[10021] = {
		buff_id = 8761,
		name = "Fever Mode",
		type = 1000,
		id = 10021,
		icon = "10021",
		desc = "Your fleet is in Fever Mode, and will restore 2% Max HP at the beginning of battle.",
		arg = {}
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
		47,
		90,
		91,
		92,
		93,
		8650,
		8732,
		8744,
		8745,
		8746,
		8750,
		8801,
		8802,
		8803,
		8806,
		8809,
		8812,
		8815,
		8841,
		8842,
		8843,
		8846,
		8849,
		8852,
		8855,
		8858,
		9500,
		9502,
		9505,
		9508,
		10001,
		10002,
		10011,
		10012,
		10013,
		10014,
		10015,
		10021
	}
}
