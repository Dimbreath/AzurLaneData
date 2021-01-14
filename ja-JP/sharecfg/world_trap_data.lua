pg = pg or {}
pg.world_trap_data = {
	{
		buff_id = 301,
		name = "磁気異常",
		obstacle = 2,
		repeat_trap = 0,
		id = 1,
		trap_fx = "shanguang01",
		desc = "電磁ジャミングが検出されている区域。進入すうるとナビゲーションシステムの表示に異常が生じてしまう。表示異常がしばらく持続する。"
	},
	{
		buff_id = 302,
		name = "渦巻海域",
		obstacle = 2,
		repeat_trap = 1,
		id = 2,
		trap_fx = "SLG_xuanwo",
		desc = "荒れ狂う流れが渦巻いている。艦船の移動が一定の確率で失敗する。"
	},
	{
		buff_id = 303,
		name = "燃え盛る海",
		obstacle = 2,
		repeat_trap = 1,
		id = 3,
		trap_fx = "shanguang02",
		desc = "燃え盛る海がこの区域に進入した艦隊にダメージを与えてしまう。火災によるダメージが艦隊が行動する度に発生し、しばらく持続する。"
	},
	{
		buff_id = 304,
		name = "電波撹乱TypeⅠ",
		obstacle = 2,
		repeat_trap = 0,
		id = 4,
		trap_fx = "shanguang01",
		desc = "この区域がセイレーンの電波撹乱を強く受けており、中に入った艦船のナビゲーションシステムは正常に作動できなくなり、正しい方向へと航行できなくなってしまう。"
	},
	{
		buff_id = 305,
		name = "電波撹乱TypeⅡ",
		obstacle = 2,
		repeat_trap = 0,
		id = 5,
		trap_fx = "shanguang01",
		desc = "この区域がセイレーンの電波撹乱を強く受けており、中に入った艦船のナビゲーションシステムは正常に作動できなくなり、移動距離が大きく制限されてしまう。"
	},
	{
		buff_id = 306,
		name = "凍結海域",
		obstacle = 2,
		repeat_trap = 1,
		id = 6,
		trap_fx = "shanguang02",
		desc = "この区域の気温が著しく低下しており、中に入った艦隊の兵装が凍結され、本来のパフォーマンスを発揮できなくなる。凍結状態はしばらく持続する。"
	},
	[100] = {
		buff_id = 307,
		name = "電波撹乱TypeⅡ",
		obstacle = 2,
		repeat_trap = 0,
		id = 100,
		trap_fx = "",
		desc = "この区域がセイレーンの電波撹乱を強く受けており、中に入った艦船のナビゲーションシステムは正常に作動できなくなり、移動距離が大きく制限されてしまう。"
	},
	[101] = {
		buff_id = 308,
		name = "燃え盛る海",
		obstacle = 2,
		repeat_trap = 0,
		id = 101,
		trap_fx = "SLG_xuanwo",
		desc = "燃え盛る海がこの区域に進入した艦隊にダメージを与えてしまう。火災によるダメージが艦隊が行動する度に発生し、しばらく持続する。"
	},
	[102] = {
		buff_id = 309,
		name = "電波撹乱TypeⅠ",
		obstacle = 2,
		repeat_trap = 0,
		id = 102,
		trap_fx = "shanguang01",
		desc = "この区域がセイレーンの電波撹乱を強く受けており、中に入った艦船のナビゲーションシステムは正常に作動できなくなり、正しい方向へと航行できなくなってしまう。"
	},
	[103] = {
		buff_id = 310,
		name = "電波撹乱TypeⅡ",
		obstacle = 2,
		repeat_trap = 0,
		id = 103,
		trap_fx = "shanguang01",
		desc = "この区域がセイレーンの電波撹乱を強く受けており、中に入った艦船のナビゲーションシステムは正常に作動できなくなり、移動距離が大きく制限されてしまう。"
	},
	[110] = {
		buff_id = 308,
		name = "燃え盛る海",
		obstacle = 2,
		repeat_trap = 0,
		id = 110,
		trap_fx = "SLG_qipao",
		desc = "燃え盛る海がこの区域に進入した艦隊にダメージを与えてしまう。火災によるダメージが艦隊が行動する度に発生し、しばらく持続する。"
	},
	[1001] = {
		buff_id = 311,
		name = "電波撹乱TypeⅠ",
		obstacle = 2,
		repeat_trap = 0,
		id = 1001,
		trap_fx = "shanguang01",
		desc = "この区域がセイレーンの電波撹乱を強く受けており、中に入った艦船のナビゲーションシステムは正常に作動できなくなり、正しい方向へと航行できなくなってしまう。"
	},
	[1002] = {
		buff_id = 312,
		name = "電波撹乱TypeⅡ",
		obstacle = 2,
		repeat_trap = 0,
		id = 1002,
		trap_fx = "shanguang01",
		desc = "この区域がセイレーンの電波撹乱を強く受けており、中に入った艦船のナビゲーションシステムは正常に作動できなくなり、移動距離が大きく制限されてしまう。"
	},
	[1003] = {
		buff_id = 313,
		name = "磁気異常",
		obstacle = 2,
		repeat_trap = 0,
		id = 1003,
		trap_fx = "shanguang01",
		desc = "電磁ジャミングが検出されている区域。進入すうるとナビゲーションシステムの表示に異常が生じてしまう。表示異常がしばらく持続する。"
	},
	[1004] = {
		buff_id = 314,
		name = "磁気異常",
		obstacle = 2,
		repeat_trap = 0,
		id = 1004,
		trap_fx = "shanguang01",
		desc = "電磁ジャミングが検出されている区域。進入すうるとナビゲーションシステムの表示に異常が生じてしまう。表示異常がしばらく持続する。"
	},
	[1005] = {
		buff_id = 315,
		name = "燃え盛る海",
		obstacle = 2,
		repeat_trap = 1,
		id = 1005,
		trap_fx = "SLG_huo01",
		desc = "燃え盛る海がこの区域に進入した艦隊にダメージを与えてしまう。火災によるダメージが艦隊が行動する度に発生し、しばらく持続する。"
	},
	[1006] = {
		buff_id = 316,
		name = "凍結海域",
		obstacle = 2,
		repeat_trap = 1,
		id = 1006,
		trap_fx = "SLG_bingwu",
		desc = "この区域の気温が著しく低下しており、中に入った艦隊の兵装が凍結され、本来のパフォーマンスを発揮できなくなる。凍結状態はしばらく持続する。"
	},
	[1007] = {
		buff_id = 317,
		name = "渦巻海域",
		obstacle = 2,
		repeat_trap = 1,
		id = 1007,
		trap_fx = "SLG_xuanwo",
		desc = "荒れ狂う流れが渦巻いている。艦船の移動が一定の確率で失敗する。"
	},
	[1008] = {
		buff_id = 318,
		name = "電波撹乱TypeⅠ",
		obstacle = 1,
		repeat_trap = 0,
		id = 1008,
		trap_fx = "SLG_EMP01_1",
		desc = "この区域がセイレーンの電波撹乱を強く受けており、中に入った艦船のナビゲーションシステムは正常に作動できなくなり、正しい方向へと航行できなくなってしまう。"
	},
	[1011] = {
		buff_id = 321,
		name = "磁気異常",
		obstacle = 2,
		repeat_trap = 0,
		id = 1011,
		trap_fx = "SLG_qipao",
		desc = "電磁ジャミングが検出されている区域。進入すうるとナビゲーションシステムの表示に異常が生じてしまう。表示異常がしばらく持続する。"
	},
	[1012] = {
		buff_id = 322,
		name = "渦巻海域",
		obstacle = 2,
		repeat_trap = 1,
		id = 1012,
		trap_fx = "SLG_xuanwo",
		desc = "荒れ狂う流れが渦巻いている。艦船の移動が一定の確率で失敗する。"
	},
	[1013] = {
		buff_id = 323,
		name = "燃え盛る海",
		obstacle = 2,
		repeat_trap = 1,
		id = 1013,
		trap_fx = "SLG_huo01",
		desc = "燃え盛る海がこの区域に進入した艦隊にダメージを与えてしまう。火災によるダメージが艦隊が行動する度に発生し、しばらく持続する。"
	},
	[1014] = {
		buff_id = 324,
		name = "電波撹乱TypeⅠ",
		obstacle = 1,
		repeat_trap = 0,
		id = 1014,
		trap_fx = "SLG_EMP01_1",
		desc = "この区域がセイレーンの電波撹乱を強く受けており、中に入った艦船のナビゲーションシステムは正常に作動できなくなり、正しい方向へと航行できなくなってしまう。"
	},
	[1015] = {
		buff_id = 325,
		name = "電波撹乱TypeⅡ",
		obstacle = 1,
		repeat_trap = 0,
		id = 1015,
		trap_fx = "SLG_EMP02_1",
		desc = "この区域がセイレーンの電波撹乱を強く受けており、中に入った艦船のナビゲーションシステムは正常に作動できなくなり、移動距離が大きく制限されてしまう。"
	},
	[1016] = {
		buff_id = 326,
		name = "凍結海域",
		obstacle = 2,
		repeat_trap = 1,
		id = 1016,
		trap_fx = "SLG_bingwu",
		desc = "この区域の気温が著しく低下しており、中に入った艦隊の兵装が凍結され、本来のパフォーマンスを発揮できなくなる。凍結状態はしばらく持続する。"
	},
	[1021] = {
		buff_id = 321,
		name = "磁気異常",
		obstacle = 2,
		repeat_trap = 0,
		id = 1021,
		trap_fx = "SLG_qipao",
		desc = "電磁ジャミングが検出されている区域。進入すうるとナビゲーションシステムの表示に異常が生じてしまう。表示異常がしばらく持続する。"
	},
	[1022] = {
		buff_id = 322,
		name = "渦巻海域",
		obstacle = 2,
		repeat_trap = 1,
		id = 1022,
		trap_fx = "SLG_xuanwo",
		desc = "荒れ狂う流れが渦巻いている。艦船の移動が一定の確率で失敗する。"
	},
	[1023] = {
		buff_id = 323,
		name = "燃え盛る海",
		obstacle = 2,
		repeat_trap = 1,
		id = 1023,
		trap_fx = "SLG_huo01",
		desc = "燃え盛る海がこの区域に進入した艦隊にダメージを与えてしまう。火災によるダメージが艦隊が行動する度に発生し、しばらく持続する。"
	},
	[1024] = {
		buff_id = 324,
		name = "電波撹乱TypeⅠ",
		obstacle = 1,
		repeat_trap = 0,
		id = 1024,
		trap_fx = "SLG_EMP01_1",
		desc = "この区域がセイレーンの電波撹乱を強く受けており、中に入った艦船のナビゲーションシステムは正常に作動できなくなり、正しい方向へと航行できなくなってしまう。"
	},
	[1025] = {
		buff_id = 325,
		name = "電波撹乱TypeⅡ",
		obstacle = 1,
		repeat_trap = 0,
		id = 1025,
		trap_fx = "SLG_EMP02_1",
		desc = "この区域がセイレーンの電波撹乱を強く受けており、中に入った艦船のナビゲーションシステムは正常に作動できなくなり、移動距離が大きく制限されてしまう。"
	},
	[1026] = {
		buff_id = 326,
		name = "凍結海域",
		obstacle = 2,
		repeat_trap = 1,
		id = 1026,
		trap_fx = "SLG_bingwu",
		desc = "この区域の気温が著しく低下しており、中に入った艦隊の兵装が凍結され、本来のパフォーマンスを発揮できなくなる。凍結状態はしばらく持続する。"
	},
	[2001] = {
		buff_id = 315,
		name = "燃え盛る海",
		obstacle = 2,
		repeat_trap = 0,
		id = 2001,
		trap_fx = "SLG_huo01",
		desc = "燃え盛る海がこの区域に進入した艦隊にダメージを与えてしまう。火災によるダメージが艦隊が行動する度に発生し、しばらく持続する。"
	},
	[2002] = {
		buff_id = 317,
		name = "渦巻海域",
		obstacle = 2,
		repeat_trap = 1,
		id = 2002,
		trap_fx = "SLG_xuanwo",
		desc = "荒れ狂う流れが渦巻いている。艦船の移動が一定の確率で失敗する。"
	},
	[2003] = {
		buff_id = 311,
		name = "電波撹乱TypeⅠ",
		obstacle = 1,
		repeat_trap = 0,
		id = 2003,
		trap_fx = "SLG_EMP01_1",
		desc = "この区域がセイレーンの電波撹乱を強く受けており、中に入った艦船のナビゲーションシステムは正常に作動できなくなり、正しい方向へと航行できなくなってしまう。"
	},
	[2010] = {
		buff_id = 320,
		name = "異常燃焼",
		obstacle = 2,
		repeat_trap = 0,
		id = 2010,
		trap_fx = "SLG_huo02",
		desc = "海を青く照らす、複数の化合物からなる炎がこの区域に進入した艦隊にダメージを与えてしまう。火災によるダメージが艦隊が行動する度に発生し、しばらく持続する。"
	},
	[2011] = {
		buff_id = 323,
		name = "燃え盛る海",
		obstacle = 2,
		repeat_trap = 0,
		id = 2011,
		trap_fx = "SLG_huo01",
		desc = "燃え盛る海がこの区域に進入した艦隊にダメージを与えてしまう。火災によるダメージが艦隊が行動する度に発生し、しばらく持続する。"
	},
	all = {
		1,
		2,
		3,
		4,
		5,
		6,
		100,
		101,
		102,
		103,
		110,
		1001,
		1002,
		1003,
		1004,
		1005,
		1006,
		1007,
		1008,
		1011,
		1012,
		1013,
		1014,
		1015,
		1016,
		1021,
		1022,
		1023,
		1024,
		1025,
		1026,
		2001,
		2002,
		2003,
		2010,
		2011
	}
}
