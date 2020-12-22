return {
	id = "NG0024",
	events = {
		{
			alpha = 0.4,
			style = {
				text = "META研究室中拥有<color=#ff5c5c>能量激活</color>、<color=#ff5c5c>舰装强化</color>、<color=#ff5c5c>战术养成</color>、<color=#ff5c5c>资讯同步</color>四个系统模块。",
				mode = 2,
				dir = 1,
				posY = -230.2,
				posX = -332.5
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "来看看META角色的战术养成吧。",
				mode = 2,
				dir = 1,
				posY = -186.8,
				posX = 634.32
			},
			ui = {
				path = "UICamera/Canvas/UIMain/MetaCharacterUI(Clone)/HidePanel/MenuPanel/TacticsBtn",
				triggerType = {
					1
				},
				fingerPos = {
					rotateY = 0,
					posY = -58.49,
					rotateX = 0,
					rotateZ = 0,
					posX = 81.69
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "META角色的技能在进行升级之前首先需要解锁。",
				mode = 2,
				dir = 1,
				posY = -133,
				posX = 0
			},
			ui = {
				pathIndex = 0,
				path = "OverlayCamera/Overlay/UIMain/MetaCharacterTacticsUI(Clone)/SkillPanel/Skills/Content",
				triggerType = {
					1
				},
				fingerPos = {
					rotateY = 0,
					posY = 0,
					rotateX = 0,
					rotateZ = 0,
					posX = 0
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "需要消耗一定数量与技能类型相同的技能书进行解锁操作。",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 383.59
			}
		}
	}
}
