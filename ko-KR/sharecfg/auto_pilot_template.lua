pg = pg or {}
pg.auto_pilot_template = {
	[10001] = {
		id = 10001,
		name = "随机移动",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 3,
				param = {
					stopCount = 90,
					Z2 = 75,
					moveCount = 240,
					Z1 = 35,
					duration = -1,
					X1 = -20,
					X2 = -5
				}
			}
		}
	},
	[10002] = {
		id = 10002,
		name = "潜艇直线移动",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = -200,
					z = 0
				}
			},
			{
				index = 2,
				to = 1,
				type = 2,
				param = {
					x = -200,
					z = 0
				}
			}
		}
	},
	[10003] = {
		id = 10003,
		name = "潜艇攻击时间",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[10004] = {
		id = 10004,
		name = "潜艇绕圈攻击（上到下，半圈移动）",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 2,
				to = 3,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = false,
					duration = 9,
					x = -30
				}
			},
			{
				index = 3,
				to = 4,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 4,
				to = 1,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = true,
					duration = 9,
					x = -30
				}
			}
		}
	},
	[10005] = {
		id = 10005,
		name = "潜艇绕圈攻击（下到上，半圈移动）",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 2,
				to = 3,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = true,
					duration = 9,
					x = -30
				}
			},
			{
				index = 3,
				to = 4,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 4,
				to = 1,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = false,
					duration = 9,
					x = -30
				}
			}
		}
	},
	[10006] = {
		id = 10006,
		name = "我方潜艇随机移动",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 5,
				param = {
					stopCount = 90,
					Z2 = -10,
					moveCount = 240,
					Z1 = 10,
					duration = -1,
					X1 = -10,
					X2 = 10
				}
			}
		}
	},
	[10007] = {
		id = 10007,
		name = "潜艇BOSS随机移动",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 3,
				param = {
					stopCount = 90,
					Z2 = 77,
					moveCount = 360,
					Z1 = 37,
					duration = -1,
					X1 = -38,
					X2 = -22
				}
			}
		}
	},
	[15001] = {
		id = 15001,
		name = "角色用/技能用AI - U101向前进随机移动",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 25,
					z = 0
				}
			},
			{
				index = 2,
				to = 1,
				type = 5,
				param = {
					stopCount = 90,
					Z2 = -10,
					moveCount = 240,
					Z1 = 10,
					duration = -1,
					X1 = -10,
					X2 = 10
				}
			}
		}
	},
	[15002] = {
		id = 15002,
		name = "角色用/技能用AI - U101后撤后随机移动",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = -25,
					z = 0
				}
			},
			{
				index = 2,
				to = 1,
				type = 5,
				param = {
					stopCount = 90,
					Z2 = -10,
					moveCount = 240,
					Z1 = 10,
					duration = -1,
					X1 = -10,
					X2 = 10
				}
			}
		}
	},
	[20001] = {
		id = 20001,
		name = "蛋船固定移动ai-23",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = -23,
					z = 0
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[20002] = {
		id = 20002,
		name = "重巡Q版本使用AI",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = -2,
					z = 0
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[20003] = {
		id = 20003,
		name = "蛋船固定移动ai-6",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = -6,
					z = 0
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[20004] = {
		id = 20004,
		name = "蛋船固定移动ai-8",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 1,
					z = 0
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[20005] = {
		id = 20005,
		name = "蛋船向左移动",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = -150,
					z = 0
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[20006] = {
		id = 20006,
		name = "木头人",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[20007] = {
		id = 20007,
		name = "潜艇AI-1",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 2,
				param = {
					x = -30,
					z = -20
				}
			}
		}
	},
	[20008] = {
		id = 20008,
		name = "潜艇AI-2",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 2,
				param = {
					x = -30,
					z = 20
				}
			}
		}
	},
	[20009] = {
		id = 20009,
		name = "潜艇AI-3",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 2,
				param = {
					x = -500,
					z = 0
				}
			}
		}
	},
	[20010] = {
		id = 20010,
		name = "上半部分随机移动-靠前",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 3,
				param = {
					stopCount = 90,
					Z2 = 80,
					moveCount = 240,
					Z1 = 55,
					duration = -1,
					X1 = -30,
					X2 = 0
				}
			}
		}
	},
	[20011] = {
		id = 20011,
		name = "下半部分随机移动-靠前",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 3,
				param = {
					stopCount = 90,
					Z2 = 55,
					moveCount = 240,
					Z1 = 30,
					duration = -1,
					X1 = -30,
					X2 = 0
				}
			}
		}
	},
	[20012] = {
		id = 20012,
		name = "随机移动-靠前",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 3,
				param = {
					stopCount = 90,
					Z2 = 80,
					moveCount = 240,
					Z1 = 30,
					duration = -1,
					X1 = -30,
					X2 = 0
				}
			}
		}
	},
	[20013] = {
		id = 20013,
		name = "上半部分随机移动-靠中",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 3,
				param = {
					stopCount = 30,
					Z2 = 80,
					moveCount = 240,
					Z1 = 55,
					duration = -1,
					X1 = -20,
					X2 = 0
				}
			}
		}
	},
	[20014] = {
		id = 20014,
		name = "下半部分随机移动-靠中",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 3,
				param = {
					stopCount = 30,
					Z2 = 55,
					moveCount = 240,
					Z1 = 30,
					duration = -1,
					X1 = -20,
					X2 = 0
				}
			}
		}
	},
	[30000] = {
		id = 30000,
		name = "转圈小范围 顺时针",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 4,
				param = {
					radius = 13,
					z = 55,
					antiClockWise = true,
					duration = -1,
					x = -15
				}
			}
		}
	},
	[30001] = {
		id = 30001,
		name = "转圈小范围 逆时针",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 4,
				param = {
					radius = 13,
					z = 55,
					antiClockWise = false,
					duration = -1,
					x = -15
				}
			}
		}
	},
	[30002] = {
		id = 30002,
		name = "转圈大范围 顺时针",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = true,
					duration = -1,
					x = -10
				}
			}
		}
	},
	[30003] = {
		id = 30003,
		name = "转圈大范围 逆时针",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = false,
					duration = -1,
					x = -10
				}
			}
		}
	},
	[40001] = {
		id = 40001,
		name = "模拟战后排模仿boss的ai",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 3,
				param = {
					stopCount = 90,
					Z2 = 73,
					moveCount = 240,
					Z1 = 43,
					duration = -1,
					X1 = -22,
					X2 = -1
				}
			}
		}
	},
	[49000] = {
		id = 49000,
		name = "循环",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					valve = 1,
					z = 55,
					x = -70
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					valve = 1,
					z = 65,
					x = -67.5
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					valve = 1,
					z = 75,
					x = -62.5
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					valve = 1,
					z = 80,
					x = -57.5
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					valve = 1,
					z = 75,
					x = -52.5
				}
			},
			{
				index = 6,
				to = 7,
				type = 1,
				param = {
					valve = 1,
					z = 65,
					x = -47.5
				}
			},
			{
				index = 7,
				to = 8,
				type = 1,
				param = {
					valve = 1,
					z = 55,
					x = -45
				}
			},
			{
				index = 8,
				to = 9,
				type = 1,
				param = {
					valve = 1,
					z = 45,
					x = -47.5
				}
			},
			{
				index = 9,
				to = 10,
				type = 1,
				param = {
					valve = 1,
					z = 35,
					x = -52.5
				}
			},
			{
				index = 10,
				to = 11,
				type = 1,
				param = {
					valve = 1,
					z = 30,
					x = -57.5
				}
			},
			{
				index = 11,
				to = 12,
				type = 1,
				param = {
					valve = 1,
					z = 35,
					x = -62.5
				}
			},
			{
				index = 12,
				to = 1,
				type = 1,
				param = {
					valve = 1,
					z = 45,
					x = -67.5
				}
			}
		}
	},
	[50000] = {
		id = 50000,
		name = "上下移动-先往上，到头停了1秒，再往下到头停留循环",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = 25
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = 0,
					z = -50
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 5,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = 50
				}
			}
		}
	},
	[50001] = {
		id = 50001,
		name = "上下移动-先往下，到头停了1秒，再往上到头停留循环",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = -25
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = 0,
					z = 50
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 5,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = -50
				}
			}
		}
	},
	[50002] = {
		id = 50002,
		name = "上下移动-先往上，到头停了1秒，再往下到头停留循环",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = 15
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = 0,
					z = -30
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 5,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = 30
				}
			}
		}
	},
	[50003] = {
		id = 50003,
		name = "上下移动-先往下，到头停了1秒，再往上到头停留循环",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = -15
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = 0,
					z = 30
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 5,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = -30
				}
			}
		}
	},
	[50004] = {
		id = 50004,
		name = "上下移动-先往上，到头停了1秒，再往下到头停留循环",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = 10
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = 0,
					z = -20
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 5,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = 20
				}
			}
		}
	},
	[50005] = {
		id = 50005,
		name = "上下移动-先往下，到头停了1秒，再往上到头停留循环",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = -10
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = 0,
					z = 20
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 5,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = -20
				}
			}
		}
	},
	[50006] = {
		id = 50006,
		name = "前后移动-先往前，到头停了1秒，再往后到头停留循环",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = -30,
					z = 0
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 0.5
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = 60,
					z = 0
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 0.5
				}
			},
			{
				index = 5,
				to = 2,
				type = 2,
				param = {
					x = -60,
					z = 0
				}
			}
		}
	},
	[60000] = {
		id = 60000,
		name = "对角线移动-开始往左上，再右下",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = -10,
					z = 25
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = 20,
					z = -50
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 5,
				to = 2,
				type = 2,
				param = {
					x = -20,
					z = 50
				}
			}
		}
	},
	[60001] = {
		id = 60001,
		name = "对角线移动-开始往右上，再左下",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 10,
					z = 25
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = -20,
					z = -50
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 5,
				to = 2,
				type = 2,
				param = {
					x = 20,
					z = 50
				}
			}
		}
	},
	[60002] = {
		id = 60002,
		name = "对角线移动-开始往左下，再右上",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = -10,
					z = -25
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = 20,
					z = 50
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 5,
				to = 2,
				type = 2,
				param = {
					x = -20,
					z = -50
				}
			}
		}
	},
	[60003] = {
		id = 60003,
		name = "对角线移动-开始往右下，再左上",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 10,
					z = -25
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = -20,
					z = 50
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 5,
				to = 2,
				type = 2,
				param = {
					x = 20,
					z = -50
				}
			}
		}
	},
	[70001] = {
		id = 70001,
		name = "国庆BOSS 晓 AI",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = 20
				}
			},
			{
				index = 2,
				to = 3,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = false,
					duration = 3,
					x = -15
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 4,
				to = 5,
				type = 2,
				param = {
					x = 0,
					z = -20
				}
			},
			{
				index = 5,
				to = 6,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = true,
					duration = 3,
					x = -15
				}
			},
			{
				index = 6,
				to = 1,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			}
		}
	},
	[70002] = {
		id = 70002,
		name = "国庆BOSS 伊势 AI",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 4,
				param = {
					radius = 20,
					z = 75,
					antiClockWise = false,
					duration = 6,
					x = 0
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 4,
				to = 5,
				type = 4,
				param = {
					radius = 20,
					z = 35,
					antiClockWise = true,
					duration = 6,
					x = 0
				}
			},
			{
				index = 5,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			}
		}
	},
	[70003] = {
		id = 70003,
		name = "国庆BOSS 日向 AI",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 4,
				param = {
					radius = 20,
					z = 35,
					antiClockWise = true,
					duration = 6,
					x = 0
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 4,
				to = 5,
				type = 4,
				param = {
					radius = 20,
					z = 75,
					antiClockWise = false,
					duration = 6,
					x = 0
				}
			},
			{
				index = 5,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			}
		}
	},
	[70004] = {
		id = 70004,
		name = "国庆BOSS 山城改 AI",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = 20
				}
			},
			{
				index = 2,
				to = 3,
				type = 4,
				param = {
					radius = 15,
					z = 55,
					antiClockWise = true,
					duration = 8,
					x = -10
				}
			},
			{
				index = 3,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 40
				}
			}
		}
	},
	[70005] = {
		id = 70005,
		name = "国庆BOSS 野分 AI",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 75
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -15,
					z = 65
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = 0,
					z = -20
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = 0,
					z = 35
				}
			},
			{
				index = 5,
				to = 2,
				type = 4,
				param = {
					radius = 30,
					z = 55,
					antiClockWise = false,
					duration = 4.5,
					x = 10
				}
			}
		}
	},
	[70006] = {
		id = 70006,
		name = "国庆BOSS 翔鹤 AI",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 75
				}
			},
			{
				index = 2,
				to = 3,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = true,
					duration = 5,
					x = 0
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = 0,
					z = 10
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -20,
					z = 55
				}
			},
			{
				index = 5,
				to = 1,
				type = 1,
				param = {
					x = 0,
					z = 70
				}
			}
		}
	},
	[70007] = {
		id = 70007,
		name = "国庆BOSS 赤城 AI",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -5,
					z = 75
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -15,
					z = 75
				}
			},
			{
				index = 3,
				to = 4,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -5,
					z = 75
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = -5,
					z = 35
				}
			},
			{
				index = 6,
				to = 7,
				type = 1,
				param = {
					x = -15,
					z = 35
				}
			},
			{
				index = 7,
				to = 8,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 8,
				to = 1,
				type = 1,
				param = {
					x = -5,
					z = 35
				}
			}
		}
	},
	[70008] = {
		id = 70008,
		name = "国庆BOSS 加贺 AI",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 35
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -15,
					z = 35
				}
			},
			{
				index = 3,
				to = 4,
				type = 0,
				param = {
					duration = 0.9
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = 0,
					z = 35
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = 0,
					z = 75
				}
			},
			{
				index = 6,
				to = 7,
				type = 1,
				param = {
					x = -15,
					z = 75
				}
			},
			{
				index = 7,
				to = 8,
				type = 0,
				param = {
					duration = 0.9
				}
			},
			{
				index = 8,
				to = 1,
				type = 1,
				param = {
					x = 0,
					z = 75
				}
			}
		}
	},
	[70009] = {
		id = 70009,
		name = "10-1boss夕幕",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 4,
				param = {
					radius = 10,
					z = 65,
					antiClockWise = true,
					duration = 2,
					x = -5
				}
			},
			{
				index = 2,
				to = 3,
				type = 4,
				param = {
					radius = 10,
					z = 45,
					antiClockWise = false,
					duration = 4,
					x = -5
				}
			},
			{
				index = 3,
				to = 1,
				type = 4,
				param = {
					radius = 10,
					z = 65,
					antiClockWise = true,
					duration = 2,
					x = -5
				}
			}
		}
	},
	[70010] = {
		id = 70010,
		name = "10-1boss松风",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 4,
				param = {
					radius = 10,
					z = 45,
					antiClockWise = false,
					duration = 2,
					x = -5
				}
			},
			{
				index = 2,
				to = 3,
				type = 4,
				param = {
					radius = 10,
					z = 65,
					antiClockWise = true,
					duration = 4,
					x = -5
				}
			},
			{
				index = 3,
				to = 1,
				type = 4,
				param = {
					radius = 10,
					z = 45,
					antiClockWise = false,
					duration = 2,
					x = -5
				}
			}
		}
	},
	[70011] = {
		id = 70011,
		name = "10-2boss浜风",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 65
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = 0,
					z = 45
				}
			},
			{
				index = 3,
				to = 1,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			}
		}
	},
	[70012] = {
		id = 70012,
		name = "10-3boss 边敌人初雪",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 4,
				param = {
					radius = 15,
					z = 55,
					antiClockWise = false,
					duration = 2,
					x = -5
				}
			},
			{
				index = 2,
				to = 1,
				type = 4,
				param = {
					radius = 15,
					z = 55,
					antiClockWise = true,
					duration = 2,
					x = -5
				}
			}
		}
	},
	[70013] = {
		id = 70013,
		name = "10-3boss 边敌人野分",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 4,
				param = {
					radius = 15,
					z = 55,
					antiClockWise = true,
					duration = 2,
					x = -5
				}
			},
			{
				index = 2,
				to = 1,
				type = 4,
				param = {
					radius = 15,
					z = 55,
					antiClockWise = false,
					duration = 2,
					x = -5
				}
			}
		}
	},
	[70014] = {
		id = 70014,
		name = "10-3boss 雪风",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = false,
					duration = 1.5,
					x = 7
				}
			},
			{
				index = 2,
				to = 1,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = true,
					duration = 1.5,
					x = 7
				}
			}
		}
	},
	[70015] = {
		id = 70015,
		name = "10-4boss边敌人三日月",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -5,
					z = 30
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 4,
				to = 1,
				type = 1,
				param = {
					x = -5,
					z = 80
				}
			}
		}
	},
	[70016] = {
		id = 70016,
		name = "10-4boss边敌人水无月",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 3,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -10,
					z = 65
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 3,
					z = 55
				}
			},
			{
				index = 4,
				to = 1,
				type = 1,
				param = {
					x = -10,
					z = 45
				}
			}
		}
	},
	[70017] = {
		id = 70017,
		name = "10-4boss神通",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 65
				}
			},
			{
				index = 2,
				to = 1,
				type = 1,
				param = {
					x = 0,
					z = 45
				}
			}
		}
	},
	[70018] = {
		id = 70018,
		name = "万圣节 卡尔斯鲁厄",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -20,
					z = 60
				}
			},
			{
				index = 2,
				to = 1,
				type = 1,
				param = {
					x = -5,
					z = 80
				}
			}
		}
	},
	[70019] = {
		id = 70019,
		name = "万圣节 莱比锡",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -20,
					z = 50
				}
			},
			{
				index = 2,
				to = 1,
				type = 1,
				param = {
					x = -5,
					z = 30
				}
			}
		}
	},
	[70020] = {
		id = 70020,
		name = "万圣节 希佩尔海军上将boss",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -5,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = 5,
					z = 35
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -5,
					z = 55
				}
			},
			{
				index = 4,
				to = 1,
				type = 1,
				param = {
					x = 5,
					z = 75
				}
			}
		}
	},
	[70021] = {
		id = 70021,
		name = "万圣节 Z20 boss",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 4,
				param = {
					radius = 25,
					z = 55,
					antiClockWise = false,
					duration = 2,
					x = 15
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 4,
				param = {
					radius = 25,
					z = 55,
					antiClockWise = true,
					duration = 2,
					x = 15
				}
			},
			{
				index = 4,
				to = 1,
				type = 0,
				param = {
					duration = 1
				}
			}
		}
	},
	[70022] = {
		id = 70022,
		name = "万圣节 Z21 boss",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 4,
				param = {
					radius = 25,
					z = 55,
					antiClockWise = true,
					duration = 2,
					x = 15
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 4,
				param = {
					radius = 25,
					z = 55,
					antiClockWise = false,
					duration = 2,
					x = 15
				}
			},
			{
				index = 4,
				to = 1,
				type = 0,
				param = {
					duration = 1
				}
			}
		}
	},
	[70023] = {
		id = 70023,
		name = "万圣节 格奈森瑙boss",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 65
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 2
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 0,
					z = 45
				}
			},
			{
				index = 4,
				to = 1,
				type = 0,
				param = {
					duration = 2
				}
			}
		}
	},
	[70024] = {
		id = 70024,
		name = "万圣节 格奈森瑙boss 2",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 70
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 0,
					z = 40
				}
			}
		}
	},
	[70025] = {
		id = 70025,
		name = "万圣节 格奈森瑙boss",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 0,
					z = 45
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 6,
				to = 7,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 7,
				to = 8,
				type = 1,
				param = {
					x = 0,
					z = 65
				}
			},
			{
				index = 8,
				to = 1,
				type = 0,
				param = {
					duration = 1
				}
			}
		}
	},
	[70026] = {
		id = 70026,
		name = "万圣节 沙恩霍斯特",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -7,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 0,
					z = 75
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = -7,
					z = 55
				}
			},
			{
				index = 6,
				to = 7,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 7,
				to = 8,
				type = 1,
				param = {
					x = 0,
					z = 35
				}
			},
			{
				index = 8,
				to = 1,
				type = 0,
				param = {
					duration = 1
				}
			}
		}
	},
	[70027] = {
		id = 70027,
		name = "万圣节 格奈森瑙boss2",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 35
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = 0,
					z = 50
				}
			},
			{
				index = 3,
				to = 1,
				type = 1,
				param = {
					x = -15,
					z = 75
				}
			}
		}
	},
	[70028] = {
		id = 70028,
		name = "万圣节 沙恩霍斯特2",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 75
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = 0,
					z = 60
				}
			},
			{
				index = 3,
				to = 1,
				type = 1,
				param = {
					x = -15,
					z = 35
				}
			}
		}
	},
	[70029] = {
		id = 70029,
		name = "11-1 白露boss",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = true,
					duration = 5,
					x = 0
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = 0,
					z = 75
				}
			},
			{
				index = 3,
				to = 4,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = false,
					duration = 5,
					x = 0
				}
			},
			{
				index = 4,
				to = 1,
				type = 1,
				param = {
					x = 0,
					z = 35
				}
			}
		}
	},
	[70030] = {
		id = 70030,
		name = "11-1 时雨boss",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = false,
					duration = 5,
					x = 0
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = 0,
					z = 35
				}
			},
			{
				index = 3,
				to = 4,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = true,
					duration = 5,
					x = 0
				}
			},
			{
				index = 4,
				to = 1,
				type = 1,
				param = {
					x = 0,
					z = 75
				}
			}
		}
	},
	[70031] = {
		id = 70031,
		name = "11-2 妙高boss",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -5,
					z = 45
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = 10,
					z = 55
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -5,
					z = 65
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = 10,
					z = 35
				}
			},
			{
				index = 6,
				to = 7,
				type = 1,
				param = {
					x = 10,
					z = 75
				}
			},
			{
				index = 7,
				to = 1,
				type = 1,
				param = {
					x = -5,
					z = 65
				}
			}
		}
	},
	[70032] = {
		id = 70032,
		name = "11-3 卯月boss",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -15,
					z = 30
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 0,
					z = 30
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = 0,
					z = 80
				}
			},
			{
				index = 6,
				to = 1,
				type = 1,
				param = {
					x = -15,
					z = 80
				}
			}
		}
	},
	[70033] = {
		id = 70033,
		name = "11-3 阿贺野boss",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = 0,
					z = 80
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -15,
					z = 80
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = -15,
					z = 30
				}
			},
			{
				index = 6,
				to = 1,
				type = 1,
				param = {
					x = 0,
					z = 30
				}
			}
		}
	},
	[70034] = {
		id = 70034,
		name = "11-4 川内boss",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -15,
					z = 25
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -5,
					z = 25
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -5,
					z = 85
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = 5,
					z = 85
				}
			},
			{
				index = 6,
				to = 7,
				type = 1,
				param = {
					x = 5,
					z = 25
				}
			},
			{
				index = 7,
				to = 8,
				type = 1,
				param = {
					x = -15,
					z = 25
				}
			},
			{
				index = 8,
				to = 9,
				type = 1,
				param = {
					x = 12,
					z = 55
				}
			},
			{
				index = 9,
				to = 10,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 10,
				to = 11,
				type = 1,
				param = {
					x = -15,
					z = 85
				}
			},
			{
				index = 11,
				to = 12,
				type = 1,
				param = {
					x = -5,
					z = 85
				}
			},
			{
				index = 12,
				to = 13,
				type = 1,
				param = {
					x = -5,
					z = 25
				}
			},
			{
				index = 13,
				to = 9,
				type = 1,
				param = {
					x = -15,
					z = 25
				}
			}
		}
	},
	[70035] = {
		id = 70035,
		name = "冬活 C-1BOSS",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -15,
					z = 45
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -15,
					z = 65
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -25,
					z = 55
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = 0,
					z = 35
				}
			},
			{
				index = 6,
				to = 7,
				type = 1,
				param = {
					x = 0,
					z = 75
				}
			},
			{
				index = 7,
				to = 1,
				type = 1,
				param = {
					x = -15,
					z = 65
				}
			}
		}
	},
	[70036] = {
		id = 70036,
		name = "冬活 D-3BOSS1",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -5,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -20,
					z = 30
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -5,
					z = 30
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -20,
					z = 55
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = -5,
					z = 80
				}
			},
			{
				index = 6,
				to = 1,
				type = 1,
				param = {
					x = -20,
					z = 80
				}
			}
		}
	},
	[70037] = {
		id = 70037,
		name = "冬活 D-3BOSS2",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -20,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -5,
					z = 80
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -20,
					z = 80
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -5,
					z = 55
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = -20,
					z = 30
				}
			},
			{
				index = 6,
				to = 1,
				type = 1,
				param = {
					x = -5,
					z = 30
				}
			}
		}
	},
	[70038] = {
		id = 70038,
		name = "围剿斯佩伯爵 BOSS1",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -18,
					z = 60
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -10,
					z = 70
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -10,
					z = 40
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = -18,
					z = 50
				}
			},
			{
				index = 6,
				to = 7,
				type = 1,
				param = {
					x = -18,
					z = 35
				}
			},
			{
				index = 7,
				to = 8,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = true,
					duration = 3,
					x = -18
				}
			},
			{
				index = 8,
				to = 1,
				type = 1,
				param = {
					x = -18,
					z = 75
				}
			}
		}
	},
	[70039] = {
		id = 70039,
		name = "围剿斯佩伯爵 BOSS2",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -7,
					z = 80
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -5,
					z = 65
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -20,
					z = 55
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -5,
					z = 45
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = -7,
					z = 30
				}
			},
			{
				index = 6,
				to = 7,
				type = 1,
				param = {
					x = -17,
					z = 35
				}
			},
			{
				index = 7,
				to = 8,
				type = 1,
				param = {
					x = -10,
					z = 55
				}
			},
			{
				index = 8,
				to = 1,
				type = 1,
				param = {
					x = -17,
					z = 75
				}
			}
		}
	},
	[70040] = {
		id = 70040,
		name = "围剿斯佩伯爵 BOSS3",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -20,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 4,
				param = {
					radius = 30,
					z = 55,
					antiClockWise = true,
					duration = 6,
					x = -5
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 4,
				to = 1,
				type = 4,
				param = {
					radius = 15,
					z = 55,
					antiClockWise = false,
					duration = 4,
					x = -5
				}
			}
		}
	},
	[70041] = {
		id = 70041,
		name = "海王星 BOSS1",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -20,
					z = 75
				}
			},
			{
				index = 2,
				to = 3,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = false,
					duration = 3.8,
					x = -15
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -20,
					z = 35
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 2
				}
			},
			{
				index = 5,
				to = 6,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = true,
					duration = 3.8,
					x = -15
				}
			},
			{
				index = 6,
				to = 7,
				type = 1,
				param = {
					x = -20,
					z = 75
				}
			},
			{
				index = 7,
				to = 2,
				type = 0,
				param = {
					duration = 2
				}
			}
		}
	},
	[70042] = {
		id = 70042,
		name = "海王星 BOSS2",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -20,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 2
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -12,
					z = 45
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -16,
					z = 35
				}
			},
			{
				index = 5,
				to = 6,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 6,
				to = 7,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 7,
				to = 8,
				type = 1,
				param = {
					x = -16,
					z = 75
				}
			},
			{
				index = 8,
				to = 9,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 9,
				to = 1,
				type = 1,
				param = {
					x = -12,
					z = 65
				}
			}
		}
	},
	[70043] = {
		id = 70043,
		name = "海王星 BOSS3",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -20,
					z = 35
				}
			},
			{
				index = 3,
				to = 4,
				type = 0,
				param = {
					duration = 2
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = 0,
					z = 45
				}
			},
			{
				index = 5,
				to = 6,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = false,
					duration = 2.6,
					x = 0
				}
			},
			{
				index = 6,
				to = 7,
				type = 1,
				param = {
					x = 0,
					z = 65
				}
			},
			{
				index = 7,
				to = 8,
				type = 1,
				param = {
					x = -20,
					z = 75
				}
			},
			{
				index = 8,
				to = 1,
				type = 0,
				param = {
					duration = 2
				}
			}
		}
	},
	[70044] = {
		id = 70044,
		name = "海王星 BOSS4",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -18,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 2
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -13,
					z = 75
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -18,
					z = 75
				}
			},
			{
				index = 5,
				to = 6,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 6,
				to = 7,
				type = 1,
				param = {
					x = -15,
					z = 65
				}
			},
			{
				index = 7,
				to = 8,
				type = 1,
				param = {
					x = -15,
					z = 45
				}
			},
			{
				index = 8,
				to = 9,
				type = 1,
				param = {
					x = -18,
					z = 35
				}
			},
			{
				index = 9,
				to = 10,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 10,
				to = 1,
				type = 1,
				param = {
					x = -13,
					z = 35
				}
			}
		}
	},
	[70045] = {
		id = 70045,
		name = "英系活动追迹者I型 AI",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 75
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -15,
					z = 65
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = 0,
					z = -20
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = 0,
					z = 35
				}
			},
			{
				index = 5,
				to = 2,
				type = 4,
				param = {
					radius = 30,
					z = 55,
					antiClockWise = false,
					duration = 4.5,
					x = 10
				}
			}
		}
	},
	[70046] = {
		id = 70046,
		name = "英系活动领洋者I型 AI",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -5,
					z = 75
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -15,
					z = 75
				}
			},
			{
				index = 3,
				to = 4,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -5,
					z = 75
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = -5,
					z = 35
				}
			},
			{
				index = 6,
				to = 7,
				type = 1,
				param = {
					x = -15,
					z = 35
				}
			},
			{
				index = 7,
				to = 8,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 8,
				to = 1,
				type = 1,
				param = {
					x = -5,
					z = 35
				}
			}
		}
	},
	[70047] = {
		id = 70047,
		name = "英系活动沙恩霍斯特",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -7,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 0,
					z = 75
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = -7,
					z = 55
				}
			},
			{
				index = 6,
				to = 7,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 7,
				to = 8,
				type = 1,
				param = {
					x = 0,
					z = 35
				}
			},
			{
				index = 8,
				to = 1,
				type = 0,
				param = {
					duration = 1
				}
			}
		}
	},
	[70048] = {
		id = 70048,
		name = "英系活动 破局者I型boss",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 4,
				param = {
					radius = 25,
					z = 55,
					antiClockWise = false,
					duration = 2,
					x = 15
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 4,
				param = {
					radius = 25,
					z = 55,
					antiClockWise = true,
					duration = 2,
					x = 15
				}
			},
			{
				index = 4,
				to = 1,
				type = 0,
				param = {
					duration = 1
				}
			}
		}
	},
	[70049] = {
		id = 70049,
		name = "英系活动 执棋者I型 AI",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 35
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -15,
					z = 35
				}
			},
			{
				index = 3,
				to = 4,
				type = 0,
				param = {
					duration = 0.9
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = 0,
					z = 35
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = 0,
					z = 75
				}
			},
			{
				index = 6,
				to = 7,
				type = 1,
				param = {
					x = -15,
					z = 75
				}
			},
			{
				index = 7,
				to = 8,
				type = 0,
				param = {
					duration = 0.9
				}
			},
			{
				index = 8,
				to = 1,
				type = 1,
				param = {
					x = 0,
					z = 75
				}
			}
		}
	},
	[70050] = {
		id = 70050,
		name = "英系活动 锤头鲨",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -5,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = 5,
					z = 35
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -5,
					z = 55
				}
			},
			{
				index = 4,
				to = 1,
				type = 1,
				param = {
					x = 5,
					z = 75
				}
			}
		}
	},
	[70051] = {
		id = 70051,
		name = "万圣节 希佩尔海军上将boss",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -5,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = 5,
					z = 35
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -5,
					z = 55
				}
			},
			{
				index = 4,
				to = 1,
				type = 1,
				param = {
					x = 5,
					z = 75
				}
			}
		}
	},
	[70052] = {
		id = 70052,
		name = "万圣节 格奈森瑙boss",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 65
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 2
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 0,
					z = 45
				}
			},
			{
				index = 4,
				to = 1,
				type = 0,
				param = {
					duration = 2
				}
			}
		}
	},
	[70053] = {
		id = 70053,
		name = "上下移动-先往上，到头停了1秒，再往下到头停留循环",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = 15
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = 0,
					z = -30
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 5,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = 30
				}
			}
		}
	},
	[70054] = {
		id = 70054,
		name = "上下移动-先往下，到头停了1秒，再往上到头停留循环",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = -15
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = 0,
					z = 30
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 5,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = -30
				}
			}
		}
	},
	[70055] = {
		id = 70055,
		name = "国庆BOSS 伊势 AI",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 4,
				param = {
					radius = 20,
					z = 75,
					antiClockWise = false,
					duration = 6,
					x = 0
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 4,
				to = 5,
				type = 4,
				param = {
					radius = 20,
					z = 35,
					antiClockWise = true,
					duration = 6,
					x = 0
				}
			},
			{
				index = 5,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			}
		}
	},
	[70056] = {
		id = 70056,
		name = "国庆BOSS 日向 AI",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 4,
				param = {
					radius = 20,
					z = 35,
					antiClockWise = true,
					duration = 6,
					x = 0
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 4,
				to = 5,
				type = 4,
				param = {
					radius = 20,
					z = 75,
					antiClockWise = false,
					duration = 6,
					x = 0
				}
			},
			{
				index = 5,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			}
		}
	},
	[70057] = {
		id = 70057,
		name = "11-4 T字走位1 从外场走到隔离栏，然后往下走，往右走几步，往上走到头，往右走，再往下走到头，往左走到隔离栏，回到上下中间位置，结束",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -15,
					z = 75
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -5,
					z = 75
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -5,
					z = 25
				}
			},
			{
				index = 5,
				to = 1,
				type = 1,
				param = {
					x = -15,
					z = 25
				}
			}
		}
	},
	[70058] = {
		id = 70058,
		name = "红染赤城到中间",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -10,
					z = 55
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[70059] = {
		id = 70059,
		name = "红染赤城到上方",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -10,
					z = 75
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[70060] = {
		id = 70060,
		name = "红染赤城回中间停留",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -10,
					z = 55
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[70061] = {
		id = 70061,
		name = "红染加贺到中间",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[70062] = {
		id = 70062,
		name = "红染加贺到上方",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -10,
					z = 35
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[70063] = {
		id = 70063,
		name = "红染加贺回中间停留后二人转",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -5,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 4,
				param = {
					radius = 30,
					z = 55,
					antiClockWise = false,
					duration = 30,
					x = -10
				}
			},
			{
				index = 4,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[70064] = {
		id = 70064,
		name = "奥尔良活动bossAI1",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 1,
				param = {
					x = -10,
					z = 75
				}
			}
		}
	},
	[70065] = {
		id = 70065,
		name = "奥尔良活动bossAI1",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 1,
				param = {
					x = -10,
					z = 35
				}
			}
		}
	},
	[70066] = {
		id = 70066,
		name = "奥尔良活动bossAI2",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			}
		}
	},
	[70067] = {
		id = 70067,
		name = "奥尔良活动bossAI2",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 1,
				param = {
					x = -5,
					z = 55
				}
			}
		}
	},
	[70068] = {
		id = 70068,
		name = "法系EX敦刻尔克向前移动",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 65
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -15,
					z = 65
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 4,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[70069] = {
		id = 70069,
		name = "法系EX让巴尔向后移动",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -15,
					z = 45
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = 0,
					z = 45
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 4,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[70070] = {
		id = 70070,
		name = "法系EX让巴尔绕敦刻尔克",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 4,
				param = {
					radius = 30,
					z = 55,
					antiClockWise = false,
					duration = -1,
					x = -15
				}
			}
		}
	},
	[70071] = {
		id = 70071,
		name = "法系EX让巴尔去指定地点",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			}
		}
	},
	[70072] = {
		id = 70072,
		name = "法系EX敦刻尔克去指定地点",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			}
		}
	},
	[70073] = {
		id = 70073,
		name = "坠落之翼复刻新增AI1",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -15,
					z = 30
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 0,
					z = 30
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = 0,
					z = 80
				}
			},
			{
				index = 6,
				to = 1,
				type = 1,
				param = {
					x = -15,
					z = 80
				}
			}
		}
	},
	[70074] = {
		id = 70074,
		name = "坠落之翼复刻新增AI2",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = 0,
					z = 80
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -15,
					z = 80
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = -15,
					z = 30
				}
			},
			{
				index = 6,
				to = 1,
				type = 1,
				param = {
					x = 0,
					z = 30
				}
			}
		}
	},
	[70075] = {
		id = 70075,
		name = "坠落之翼复刻新增AI3",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = 10,
					z = 35
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 10,
					z = 75
				}
			},
			{
				index = 4,
				to = 5,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = true,
					duration = 5,
					x = 0
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = 10,
					z = 75
				}
			},
			{
				index = 6,
				to = 7,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			},
			{
				index = 7,
				to = 8,
				type = 1,
				param = {
					x = 10,
					z = 35
				}
			},
			{
				index = 8,
				to = 1,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = false,
					duration = 5,
					x = 0
				}
			}
		}
	},
	[70076] = {
		id = 70076,
		name = "随机移动-偏右，holo联动新增",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 3,
				param = {
					stopCount = 90,
					Z2 = 75,
					moveCount = 240,
					Z1 = 35,
					duration = -1,
					X1 = -3,
					X2 = 0
				}
			}
		}
	},
	[70077] = {
		id = 70077,
		name = "世界BOSS黛朵回中间",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -10,
					z = 60
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[70078] = {
		id = 70078,
		name = "构建者第一波浮游炮1",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 6,
				param = {
					duration = 3,
					z = -50,
					x = 2
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 3
				}
			},
			{
				index = 3,
				to = 1,
				type = 1,
				param = {
					x = -100,
					z = 5
				}
			}
		}
	},
	[70079] = {
		id = 70079,
		name = "构建者第一波浮游炮2",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 6,
				param = {
					duration = 3,
					z = -30,
					x = 2
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 3
				}
			},
			{
				index = 3,
				to = 1,
				type = 1,
				param = {
					x = -100,
					z = 25
				}
			}
		}
	},
	[70080] = {
		id = 70080,
		name = "构建者第一波浮游炮3",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 6,
				param = {
					duration = 3,
					z = -10,
					x = 2
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 3
				}
			},
			{
				index = 3,
				to = 1,
				type = 1,
				param = {
					x = -100,
					z = 45
				}
			}
		}
	},
	[70081] = {
		id = 70081,
		name = "构建者第一波浮游炮4",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 6,
				param = {
					duration = 3,
					z = 10,
					x = 2
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 3
				}
			},
			{
				index = 3,
				to = 1,
				type = 1,
				param = {
					x = -100,
					z = 65
				}
			}
		}
	},
	[70082] = {
		id = 70082,
		name = "构建者第二波浮游炮1",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 6,
				param = {
					duration = 3,
					z = -30,
					x = -7
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -5,
					z = 65
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -5,
					z = 5
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -5,
					z = 65
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = -5,
					z = 5
				}
			},
			{
				index = 6,
				to = 7,
				type = 1,
				param = {
					x = -5,
					z = 65
				}
			},
			{
				index = 7,
				to = 1,
				type = 1,
				param = {
					x = -100,
					z = 65
				}
			}
		}
	},
	[70083] = {
		id = 70083,
		name = "构建者第二波浮游炮2",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 6,
				param = {
					duration = 3,
					z = -10,
					x = -7
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -5,
					z = 5
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -5,
					z = 65
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -5,
					z = 5
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = -5,
					z = 65
				}
			},
			{
				index = 6,
				to = 7,
				type = 1,
				param = {
					x = -5,
					z = 5
				}
			},
			{
				index = 7,
				to = 1,
				type = 1,
				param = {
					x = -100,
					z = 5
				}
			}
		}
	},
	[70084] = {
		id = 70084,
		name = "构建者第二波浮游炮3",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 6,
				param = {
					duration = 3,
					z = -50,
					x = -17
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -70,
					z = 5
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 2,
					z = 5
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -70,
					z = 5
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = 2,
					z = 5
				}
			},
			{
				index = 6,
				to = 1,
				type = 1,
				param = {
					x = -100,
					z = 5
				}
			}
		}
	},
	[70085] = {
		id = 70085,
		name = "构建者第二波浮游炮4",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 6,
				param = {
					duration = 3,
					z = 10,
					x = -8
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -70,
					z = 65
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 2,
					z = 65
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -70,
					z = 65
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = 2,
					z = 65
				}
			},
			{
				index = 6,
				to = 1,
				type = 1,
				param = {
					x = -100,
					z = 65
				}
			}
		}
	},
	[70086] = {
		id = 70086,
		name = "常规BOSS返回中间",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			}
		}
	},
	[70087] = {
		id = 70087,
		name = "EX构建者第一波浮游炮1",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 6,
				param = {
					duration = 2,
					z = -5,
					x = 5
				}
			},
			{
				index = 2,
				to = 3,
				type = 4,
				param = {
					radius = 25,
					z = 35,
					antiClockWise = false,
					duration = 9,
					x = -10
				}
			},
			{
				index = 3,
				to = 1,
				type = 1,
				param = {
					x = -100,
					z = 155
				}
			}
		}
	},
	[70088] = {
		id = 70088,
		name = "EX构建者第一波浮游炮2",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 6,
				param = {
					duration = 2,
					z = -35,
					x = 5
				}
			},
			{
				index = 2,
				to = 3,
				type = 4,
				param = {
					radius = 25,
					z = 35,
					antiClockWise = false,
					duration = 9,
					x = -10
				}
			},
			{
				index = 3,
				to = 1,
				type = 1,
				param = {
					x = -100,
					z = -45
				}
			}
		}
	},
	[70089] = {
		id = 70089,
		name = "EX构建者第四波浮游炮1",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -30,
					z = 5
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = 0,
					z = 5
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 0,
					z = 65
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -78,
					z = 65
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = -78,
					z = 5
				}
			},
			{
				index = 6,
				to = 1,
				type = 1,
				param = {
					x = -100,
					z = 5
				}
			}
		}
	},
	[70090] = {
		id = 70090,
		name = "EX构建者第四波浮游炮2",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -30,
					z = 65
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = 0,
					z = 65
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = 0,
					z = 5
				}
			},
			{
				index = 4,
				to = 5,
				type = 1,
				param = {
					x = -78,
					z = 5
				}
			},
			{
				index = 5,
				to = 6,
				type = 1,
				param = {
					x = -78,
					z = 65
				}
			},
			{
				index = 6,
				to = 1,
				type = 1,
				param = {
					x = -100,
					z = 65
				}
			}
		}
	},
	[70091] = {
		id = 70091,
		name = "2020法系沃克兰回中心",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 1,
				param = {
					x = 0,
					z = 58
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[70092] = {
		id = 70092,
		name = "沃克兰人形有节奏的随机移动",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 3,
				param = {
					stopCount = 0,
					Z2 = 75,
					moveCount = 5000,
					Z1 = 35,
					duration = 2.9,
					X1 = -20,
					X2 = -5
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1.6
				}
			},
			{
				index = 3,
				to = 1,
				type = 3,
				param = {
					stopCount = 0,
					Z2 = 75,
					moveCount = 5000,
					Z1 = 35,
					duration = 5.1,
					X1 = -20,
					X2 = -5
				}
			}
		}
	},
	[70093] = {
		id = 70093,
		name = "2020法系阿尔及利亚回中心",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 1,
				param = {
					x = -5,
					z = 55
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[70094] = {
		id = 70094,
		name = "2020法系阿尔及利亚随机移动",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 3,
				param = {
					stopCount = 90,
					Z2 = 75,
					moveCount = 240,
					Z1 = 35,
					duration = -1,
					X1 = -15,
					X2 = 0
				}
			}
		}
	},
	[75001] = {
		id = 75001,
		name = "弹幕挑战1boss",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -15,
					z = 75
				}
			},
			{
				index = 2,
				to = 1,
				type = 1,
				param = {
					x = -15,
					z = 35
				}
			}
		}
	},
	[75002] = {
		id = 75002,
		name = "弹幕挑战3boss",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -10,
					z = 55
				}
			},
			{
				index = 2,
				to = 1,
				type = 1,
				param = {
					x = 10,
					z = 55
				}
			}
		}
	},
	[75003] = {
		id = 75003,
		name = "弹幕挑战4 上下AI",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = 15
				}
			},
			{
				index = 2,
				to = 3,
				type = 2,
				param = {
					x = 0,
					z = -50
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -15,
					z = 80
				}
			},
			{
				index = 4,
				to = 3,
				type = 1,
				param = {
					x = -15,
					z = 30
				}
			}
		}
	},
	[75004] = {
		id = 75004,
		name = "弹幕挑战4 下上I",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = -15
				}
			},
			{
				index = 2,
				to = 3,
				type = 2,
				param = {
					x = 0,
					z = 50
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -15,
					z = 30
				}
			},
			{
				index = 4,
				to = 3,
				type = 1,
				param = {
					x = -15,
					z = 80
				}
			}
		}
	},
	[75005] = {
		id = 75005,
		name = "弹幕挑战6重巡",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 2,
				to = 1,
				type = 1,
				param = {
					x = 0,
					z = 55
				}
			}
		}
	},
	[75006] = {
		id = 75006,
		name = "弹幕挑战拉菲向下移动",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 2,
				to = 3,
				type = 1,
				param = {
					x = -15,
					z = 35
				}
			},
			{
				index = 3,
				to = 2,
				type = 1,
				param = {
					x = -15,
					z = 75
				}
			}
		}
	},
	[75007] = {
		id = 75007,
		name = "弹幕挑战拉菲前往玩家地区",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -55,
					z = 55
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[80000] = {
		id = 80000,
		name = "自爆船AI",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 2,
				param = {
					x = -500,
					z = 0
				}
			}
		}
	},
	[80004] = {
		id = 80004,
		name = "运输船-跑路",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 200,
					z = 0
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[80006] = {
		id = 80006,
		name = "超时撤退",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 200,
					z = 0
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[80007] = {
		id = 80007,
		name = "水雷AI",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 2,
				param = {
					x = -500,
					z = 0
				}
			}
		}
	},
	[80008] = {
		id = 80008,
		name = "序章俾斯麦必杀前走位",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -5,
					z = 65
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[90000] = {
		id = 90000,
		name = "转圈",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 4,
				param = {
					radius = 10,
					z = 55,
					antiClockWise = true,
					duration = -1,
					x = -20
				}
			}
		}
	},
	[90001] = {
		id = 90001,
		name = "前进",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 2,
				param = {
					x = 500,
					z = 0
				}
			}
		}
	},
	[90002] = {
		id = 90002,
		name = "后退",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 2,
				param = {
					x = -500,
					z = 0
				}
			}
		}
	},
	[90003] = {
		id = 90003,
		name = "回中后停留",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 1,
				param = {
					x = -20,
					z = 55
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[90004] = {
		id = 90004,
		name = "回中后停留_偏右",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[90005] = {
		id = 90005,
		name = "回中后停留_中心",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 1,
				param = {
					x = -35,
					z = 55
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[90011] = {
		id = 90011,
		name = "往左移动20",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = -100,
					z = 0
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[90012] = {
		id = 90012,
		name = "往右移动20",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 20,
					z = 0
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[90013] = {
		id = 90013,
		name = "往上移动20",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = 20
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[90014] = {
		id = 90014,
		name = "移动到左上,停留",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -30,
					z = 75
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[90015] = {
		id = 90015,
		name = "往下移动20",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = -20
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[90016] = {
		id = 90016,
		name = "移动到左下,停留",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -30,
					z = 30
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[90017] = {
		id = 90017,
		name = "上下移动",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 1,
				param = {
					x = -30,
					z = 75
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 1
				}
			},
			{
				index = 3,
				to = 4,
				type = 1,
				param = {
					x = -30,
					z = 30
				}
			},
			{
				index = 4,
				to = 1,
				type = 0,
				param = {
					duration = 1
				}
			}
		}
	},
	[90018] = {
		id = 90018,
		name = "转圈小范围 顺时针",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 4,
				param = {
					radius = 15,
					z = 55,
					antiClockWise = true,
					duration = -1,
					x = -20
				}
			}
		}
	},
	[90019] = {
		id = 90019,
		name = "转圈小范围 顺时针_上",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 4,
				param = {
					radius = 15,
					z = 70,
					antiClockWise = true,
					duration = -1,
					x = -20
				}
			}
		}
	},
	[90020] = {
		id = 90020,
		name = "转圈小范围 逆时针",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 4,
				param = {
					radius = 15,
					z = 55,
					antiClockWise = false,
					duration = -1,
					x = -20
				}
			}
		}
	},
	[90021] = {
		id = 90021,
		name = "转圈小范围 逆时针_下",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 4,
				param = {
					radius = 15,
					z = 40,
					antiClockWise = false,
					duration = -1,
					x = -20
				}
			}
		}
	},
	[90022] = {
		id = 90022,
		name = "转圈大范围 顺时针",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = true,
					duration = -1,
					x = -10
				}
			}
		}
	},
	[90023] = {
		id = 90023,
		name = "转圈大范围 逆时针",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 4,
				param = {
					radius = 20,
					z = 55,
					antiClockWise = false,
					duration = -1,
					x = -10
				}
			}
		}
	},
	[90024] = {
		id = 90024,
		name = "随机移动_偏左",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 3,
				param = {
					stopCount = 90,
					Z2 = 80,
					moveCount = 240,
					Z1 = 30,
					duration = -1,
					X1 = -30,
					X2 = -10
				}
			}
		}
	},
	[90025] = {
		id = 90025,
		name = "上下移动-上部",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = 20
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 2
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = 0,
					z = -20
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 2
				}
			},
			{
				index = 5,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = 20
				}
			}
		}
	},
	[90026] = {
		id = 90026,
		name = "上下移动-下部",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = -20
				}
			},
			{
				index = 2,
				to = 3,
				type = 0,
				param = {
					duration = 2
				}
			},
			{
				index = 3,
				to = 4,
				type = 2,
				param = {
					x = 0,
					z = 20
				}
			},
			{
				index = 4,
				to = 5,
				type = 0,
				param = {
					duration = 2
				}
			},
			{
				index = 5,
				to = 2,
				type = 2,
				param = {
					x = 0,
					z = -20
				}
			}
		}
	},
	[90027] = {
		id = 90027,
		name = "随机移动_偏右",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 3,
				param = {
					stopCount = 90,
					Z2 = 80,
					moveCount = 240,
					Z1 = 30,
					duration = -1,
					X1 = -10,
					X2 = -10
				}
			}
		}
	},
	[90028] = {
		id = 90028,
		name = "回中后停留_中心",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 1,
				param = {
					x = -15,
					z = 55
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[90029] = {
		id = 90029,
		name = "回中后停留_偏右",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 1,
				param = {
					x = -5,
					z = 55
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[90030] = {
		id = 90030,
		name = "随机移动_偏左",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 3,
				param = {
					stopCount = 90,
					Z2 = 80,
					moveCount = 240,
					Z1 = 30,
					duration = -1,
					X1 = 10,
					X2 = -10
				}
			}
		}
	},
	[90031] = {
		id = 90031,
		name = "随机移动_弹幕",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 3,
				param = {
					stopCount = 90,
					Z2 = 80,
					moveCount = 240,
					Z1 = 35,
					duration = -1,
					X1 = 0,
					X2 = 5
				}
			}
		}
	},
	[90032] = {
		id = 90032,
		name = "随机移动_偏很右",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 3,
				param = {
					stopCount = 90,
					Z2 = 75,
					moveCount = 240,
					Z1 = 35,
					duration = -1,
					X1 = -5,
					X2 = 5
				}
			}
		}
	},
	[99990] = {
		id = 99990,
		name = "13章后撤释放地毯空袭",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 1,
				param = {
					z = 55,
					x = 8,
					y = 0
				}
			}
		}
	},
	[99991] = {
		id = 99991,
		name = "13章防空船往左移动30",
		default = 1,
		list = {
			{
				index = 1,
				to = 2,
				type = 2,
				param = {
					x = -30,
					z = 0
				}
			},
			{
				index = 2,
				to = 1,
				type = 0,
				param = {
					duration = -1
				}
			}
		}
	},
	[99997] = {
		id = 99997,
		name = "测试随机移动上",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 3,
				param = {
					stopCount = 80,
					Z2 = 85,
					moveCount = 240,
					Z1 = 55,
					duration = -1,
					X1 = -30,
					X2 = 0
				}
			}
		}
	},
	[99998] = {
		id = 99998,
		name = "测试随机移动下",
		default = 1,
		list = {
			{
				index = 1,
				to = 1,
				type = 3,
				param = {
					stopCount = 100,
					Z2 = 55,
					moveCount = 240,
					Z1 = 25,
					duration = -1,
					X1 = -30,
					X2 = 0
				}
			}
		}
	}
}
