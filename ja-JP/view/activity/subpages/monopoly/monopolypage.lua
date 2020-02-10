slot0 = class("MonopolyPage", import("....base.BaseActivityPage"))
slot0.ON_START = "MonopolyGame:ON_START"
slot0.ON_MOVE = "MonopolyGame:ON_MOVE"
slot0.ON_TRIGGER = "MonopolyGame:ON_TRIGGER"
slot0.ON_AWARD = "MonopolyGame:ON_AWARD"

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("AD")

	slot0:bind(uv0.ON_START, function (slot0, slot1, slot2)
		slot6.activity_id = slot1
		slot6.cmd = ActivityConst.MONOPOLY_OP_THROW
		slot6.callback = slot2

		pg.m02:sendNotification(GAME.MONOPOLY_OP, {})
	end)
	slot0:bind(uv0.ON_MOVE, function (slot0, slot1, slot2)
		slot6.activity_id = slot1
		slot6.cmd = ActivityConst.MONOPOLY_OP_MOVE
		slot6.callback = slot2

		pg.m02:sendNotification(GAME.MONOPOLY_OP, {})
	end)
	slot0:bind(uv0.ON_TRIGGER, function (slot0, slot1, slot2)
		slot6.activity_id = slot1
		slot6.cmd = ActivityConst.MONOPOLY_OP_TRIGGER
		slot6.callback = slot2

		pg.m02:sendNotification(GAME.MONOPOLY_OP, {})
	end)
	slot0:bind(uv0.ON_AWARD, function (slot0)
		if PLATFORM_CHT == PLATFORM_CODE then
			slot4.activity_id = uv0.activity.id
			slot4.cmd = ActivityConst.MONOPOLY_OP_AWARD

			pg.m02:sendNotification(GAME.MONOPOLY_OP, {})
		else
			slot5.mediator = RedPacketMediator
			slot5.viewComponent = RedPacketLayer

			uv0:emit(ActivityMediator.OPEN_LAYER, Context.New({}))
		end
	end)
end

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
end

function slot0.OnUpdateFlush(slot0)
	if not slot0.game then
		slot0.game = import("view.activity.subPages.Monopoly.game.MomopolyGame").New()

		slot0.game:SetUp(slot0, slot0.activity)
	else
		slot0.game:NetActivity(slot0.activity)
	end
end

function slot0.OnDestroy(slot0)
	slot0.game:Destroy()
end

return slot0
