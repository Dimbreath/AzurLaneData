return {
	id = "WorldG190",
	events = {
		{
			alpha = 0.4,
			style = {
				text = "대형 작전에서 애쉬 비콘 데이터를  수집할 수 있습니다. 이 데이터는 애쉬 비콘 기록기에 기록됩니다.",
				mode = 2,
				dir = 1,
				char = "1",
				posY = -74.7,
				posX = -471.5
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/AwardInfoUI(Clone)/items/close",
				triggerType = {
					1
				},
				fingerPos = {
					rotateY = 0,
					posY = -53.42,
					rotateX = 0,
					rotateZ = 0,
					posX = 149.32
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "수집한 비콘 데이터는 여기서 확인할 수 있습니다.",
				mode = 2,
				dir = 1,
				char = "1",
				posY = 335.5,
				posX = 0,
				ui = {
					lineMode = true,
					path = "OverlayCamera/Overlay/UIMain/top/adapt/top_stage/resources/WorldResPanel(Clone)/res/boss_progress"
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "새로운 기능이 해제되었습니다. 메인 화면으로 돌아가 확인하세요.",
				mode = 2,
				dir = -1,
				char = "1",
				posY = 245.23,
				posX = -552.4
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/top/adapt/top_stage/back_button",
				triggerType = {
					1
				},
				fingerPos = {
					rotateY = 0,
					posY = 0,
					rotateX = 0,
					rotateZ = 238.9,
					posX = -76.32
				}
			}
		}
	}
}
