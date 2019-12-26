ys.Battle.BattleConst = ys.Battle.BattleConst or {}
ys.Battle.BattleConst.BATTLE_GLOBAL_BUFF = "battle_buff"
ys.Battle.BattleConst.NORMALIZE_FLEET_SPEED = Vector3.right
ys.Battle.BattleConst.SUMMONING_SICKNESS_DURATION = 1.5
ys.Battle.BattleConst.NON_QUEUE_WEAPON = 0
ys.Battle.BattleConst.SMOKING_HP_RATE = 0.3
ys.Battle.BattleConst.NORMAL_TEXT_SCALE = 1
ys.Battle.BattleConst.SMALL_TEXT_SCALE = 0.8
ys.Battle.BattleConst.TEXT_MOVE_TIME = 0.4
ys.Battle.BattleConst.TEXT_FADEOUT_TIME = 0.6
ys.Battle.BattleConst.TEXT_SCALE_TIME = 0.4
ys.Battle.BattleConst.CRI_TEXT_OFFSET = 1
ys.Battle.BattleConst.MAX_EQUIPMENT_COUNT = 6
ys.Battle.BattleConst.DEAD_FLAG = "flagDead"
ys.Battle.BattleConst.WaveTriggerType = {
	NORMAL = 0,
	TIMER = 1,
	RANGE = 2,
	STORY = 3,
	AID = 4,
	BGM = 5,
	GUIDE = 6,
	CAMERA = 7,
	CLEAR = 8,
	JAMMING = 9,
	ENVIRONMENT = 10
}
ys.Battle.BattleConst.UnitType = {
	PLAYER_UNIT = 1,
	ENEMY_UNIT = 2,
	BOSS_UNIT = 3,
	AIRCRAFT_UNIT = 4,
	AIRFIGHTER_UNIT = 5,
	NPC_UNIT = 6,
	MAIN_UNIT = 7,
	FUNNEL_UNIT = 8,
	UAV_UNIT = 9,
	SUB_UNIT = 10
}
ys.Battle.BattleConst.EquipmentType = {
	MAIN_CANNON = 1,
	SUB_CANNON = 2,
	TORPEDO = 3,
	ANTI_AIR = 4,
	ARMOR = 5,
	ENGINE = 6,
	RADAR = 7,
	PASSIVE_SCOUT = 10,
	SCOUT = 11,
	CREW = 12,
	CHARGE = 13,
	SPECIAL = 14,
	MEGA_CHARGE = 15,
	MANUAL_TORPEDO = 16,
	ANTI_SEA = 17,
	HAMMER_HEAD = 18,
	BOMBER_PRE_CAST_ALERT = 19,
	MULTI_LOCK = 20,
	MANUAL_SUB = 21,
	FLEET_ANTI_AIR = 22,
	POINT_HIT_AND_LOCK = 23,
	BEAM = 24,
	DEPTH_CHARGE = 25,
	REPEATER_ANTI_AIR = 26,
	DISPOSABLE_TORPEDO = 27,
	PREVIEW_ARICRAFT = 99,
	AIR_ASSIST = "airAssist"
}
ys.Battle.BattleConst.OXY_STATE = {
	FLOAT = 1,
	DIVE = 2
}
ys.Battle.BattleConst.ActionName = {
	ATTACK = "attack",
	ATTACKLEFT = "attack_left",
	DEFAULT_ATTACK = "attack",
	DEAD = "dead",
	DEAD_SWIM = "dead_swim",
	MOVE = "move",
	IDLE = "normal",
	STAND = "stand",
	VICTORY = "victory",
	VICTORY_SWIM = "victory_swim",
	WALK = "walk",
	MOVELEFT = "move_left",
	SKILL = "skill",
	SPELL = "suoquan",
	DIVE = "swim",
	DIVELEFT = "swim_left",
	RAID = "attack_swim",
	RAIDLEFT = "attack_swim_left",
	INTERRUPT = "break",
	DIVING = "xiaqian"
}
ys.Battle.BattleConst.ActionLoop = {
	attack = false,
	attack_left = false,
	fire = false,
	fire_left = false,
	dead = false,
	dead_swim = false,
	skill = false,
	move = true,
	normal = true,
	stand = true,
	victory = true,
	victory_swim = true,
	walk = true,
	move_left = true,
	suoquan = true,
	swim = true,
	swim_left = true,
	swim_attack = false,
	swim_attack_left = false,
	xiaqian = false
}
ys.Battle.BattleConst.CldType = {
	BULLET = "bullet",
	SHIP = "ship",
	AIRCRAFT = "aircraft",
	AOE = "AOE",
	WALL = "Wall"
}
ys.Battle.BattleConst.CldMass = {
	L1 = 1,
	L2 = 2,
	L3 = 3,
	L4 = 4
}
ys.Battle.BattleConst.UnitDir = {
	RIGHT = 1,
	LEFT = -1,
	MIDDLE = 0
}
ys.Battle.BattleConst.WeaponSearchType = {
	SECTOR = 1,
	SQUARE = 2
}
ys.Battle.BattleConst.WeaponAimType = {
	FORWARD = 0,
	AIM = 1
}
ys.Battle.BattleConst.WeaponSuppressType = {
	NONE = 1,
	SUPPRESSION = 0
}
ys.Battle.BattleConst.WeaponDamageAttr = {
	CANNON = 1,
	TORPEDO = 2,
	ANTI_AIR = 3,
	AIR = 4,
	ANIT_SUB = 5
}
ys.Battle.BattleConst.BulletType = {
	CANNON = 1,
	BOMB = 2,
	TORPEDO = 3,
	DIRECT = 4,
	SHRAPNEL = 5,
	ANTI_AIR = 6,
	ANTI_SEA = 7,
	STRAY = 8,
	EFFECT = 9,
	BEAM = 10,
	G_BULLET = 11
}
ys.Battle.BattleConst.BulletDamageType = {
	NORMAL = 1,
	BOMBER = 2,
	REAL = 3
}
ys.Battle.BattleConst.BulletField = {
	SURFACE = 1,
	UNDER_WATER = 2,
	AIR = 3
}
ys.Battle.BattleConst.AOEField = {
	SURFACE = 1,
	UNDER_WATER = 2,
	AIR = 3
}
ys.Battle.BattleConst.AreaType = {
	CUBE = 1,
	COLUMN = 2
}
ys.Battle.BattleConst.ShakeType = {
	HIT = 301,
	FIRE = 302,
	UNIT_DIE = 302
}
ys.Battle.BattleConst.BuffEffectType = {
	ON_INIT_GAME = "onInitGame",
	ON_START_GAME = "onStartGame",
	ON_FLAG_SHIP = "onFlagShip",
	ON_CONSORT = "onConsort",
	ON_LEADER = "onLeader",
	ON_REAR = "onRear",
	ON_SUB_LEADER = "onSubLeader",
	ON_SUB_CONSORT = "onSubConsort",
	ON_ATTACH = "onAttach",
	ON_REMOVE = "onRemove",
	ON_STACK = "onStack",
	ON_UPDATE = "onUpdate",
	ON_BULLET_CREATE = "onBulletCreate",
	ON_CHARGE_BULLET_CREATE = "onChargeWeaponBulletCreate",
	ON_TORPEDO_BULLET_CREATE = "onTorpedoWeaponBulletCreate",
	ON_ANTIAIR_BULLET_CREATE = "onAntiAirWeaponBulletCreate",
	ON_INTERNAL_BULLET_CREATE = "onInternalBulletCreate",
	ON_MANUAL_BULLET_CREATE = "onManualBulletCreate",
	ON_BOMB_BULLET_BANG = "onBombBulletBang",
	ON_BULLET_COLLIDE = "onBulletCollide",
	ON_BULLET_HIT_BEFORE = "onBulletHitBefore",
	ON_BULLET_HIT = "onBulletHit",
	ON_BULLET_KILL = "onBulletKill",
	ON_BE_HIT = "onBeHit",
	ON_TAKE_DAMAGE = "onTakeDamage",
	ON_TAKE_HEALING = "onTakeHealing",
	ON_COMBO = "onCombo",
	ON_WEAPON_STEDAY = "onWeaponSteday",
	ON_FIRE = "onFire",
	ON_CHARGE_FIRE = "onChargeWeaponFire",
	ON_TORPEDO_FIRE = "onTorpedoWeaponFire",
	ON_ANTIAIR_FIRE = "onAntiAirWeaponFire",
	ON_ALL_IN_STRIKE_STEADY = "onAllInStrikeSteady",
	ON_ALL_IN_STRIKE = "onAllInStrike",
	ON_DEPTH_CHARGE_DROP = "onDepthChargeDrop",
	ON_CHARGE_READY = "onChargeWeaponReady",
	ON_MANUAL_TORPEDO_READY = "onManualTorpedoReady",
	ON_AIR_ASSIST_READY = "onAirAssistReady",
	ON_DYING = "onDying",
	ON_FRIENDLY_AIRCRAFT_DYING = "onFriendlyAircraftDying",
	ON_FRIENDLY_SHIP_DYING = "onFriendlyShipDying",
	ON_FOE_DYING = "onFoeDying",
	ON_FOE_AIRCRAFT_DYING = "onFoeAircraftDying",
	ON_RETREAT = "onRetreat",
	ON_FRIENDLY_HP_RATIO_UPDATE = "onFriendlyHpRatioUpdate",
	ON_TEAMMATE_HP_RATIO_UPDATE = "onTeammateHpRatioUpdate",
	ON_HP_RATIO_UPDATE = "onHPRatioUpdate",
	ON_BATTLE_BUFF_COUNT = "onBattleBuffCount",
	ON_DAMAGE_PREVENT = "onDamagePrevent",
	ON_SHIELD_BROKEN = "onShieldBroken",
	ON_SUBMARINE_AID = "onSubmarineAid",
	ON_SUBMARINE_FREE_DIVE = "onSubmarinFreeDive",
	ON_SUBMARINE_FREE_FLOAT = "onSubmarinFreeFloat",
	ON_SUBMARINE_FREE_SPECIAL = "onSubmarineFreeSpecial",
	ON_SUBMARINE_DIVE = "onSubmarineDive",
	ON_SUBMARINE_RAID = "onSubmarineRaid",
	ON_SUBMARINE_FLOAT = "onSubmarineFloat",
	ON_SUBMARINE_RETREAT = "onSubmarineRetreat",
	ON_ANTI_SUB_HATE_CHAIN = "onAntiSubHateChain",
	ON_RECORD = "onRecord"
}
ys.Battle.BattleConst.FXContainerIndex = {
	"center",
	"top",
	"bottom",
	"auradown"
}
ys.Battle.BattleConst.UnitDeathReason = {
	KILLED = 1,
	LEAVE = 2,
	DESTRUCT = 3,
	TOUCHDOWN = 4,
	CRUSH = 5
}
ys.Battle.BattleConst.BattleScore = {
	D = 0,
	C = 1,
	B = 2,
	A = 3,
	S = 4
}
ys.Battle.BattleConst.CPChatType = {
	GROUP_ID = 0,
	SHIP_TYPE = 1,
	RARE = 2,
	NATIONALITY = 3,
	ILLUSTRATOR = 4
}
ys.Battle.BattleConst.AIStepType = {
	STAY = 0,
	MOVE_TO = 1,
	MOVE = 2,
	BROWNIAN = 3,
	CIRCLE = 4,
	RELATIVE_BROWNIAN = 5
}
ys.Battle.BattleConst.BossPhaseSwitchType = {
	NONE = 0,
	DURATION = 1,
	HP = 2,
	POSITION_X_GREATER = 3,
	POSITION_X_LESS = 4
}
ys.Battle.BattleConst.SubAidFlag = {
	AMMO_EMPTY = 0,
	AID_EMPTY = -1,
	OIL_EMPTY = -2
}
ys.Battle.BattleConst.ManualWeaponIndex = {
	CALIBRATION = 1,
	TORPEDO = 2,
	AIR_ASSIST = 3
}
ys.Battle.BattleConst.EnviroumentBehaviour = {
	PLAY_FX = 1,
	DAMAGE = 2,
	BUFF = 3,
	MOVEMENT = 4,
	FORCE = 5
}

return
