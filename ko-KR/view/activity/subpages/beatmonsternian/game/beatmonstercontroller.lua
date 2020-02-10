slot0 = class("BeatMonsterController")

function slot0.Ctor(slot0)
	slot0.mediator = BeatMonsterMeidator.New(slot0)
	slot0.model = BeatMonsterModel.New(slot0)
end

function slot0.SetUp(slot0, slot1)
	slot3[1] = function (slot0)
		uv0:InitStage(uv1)

		if not uv0.model:GetPlayableStory() then
			slot0()

			return
		end

		uv0.mediator:PlayStory(slot1, slot0)
	end

	slot3[2] = function (slot0)
		if uv0.hp > 0 then
			uv1.mediator:DoCurtainUp(slot0)
		else
			slot0()
		end
	end

	slot3[3] = function (slot0)
		uv0.mediator:OnInited()
	end

	seriesAsync({})
end

function slot0.NetData(slot0, slot1)
	slot0.model:UpdateData(slot1)
	slot0.mediator:OnMonsterHpUpdate(slot0.model.mosterNian.hp)
	slot0.mediator:OnAttackCntUpdate(slot0.model.attackCnt)
end

function slot0.InitStage(slot0, slot1)
	slot0.model:AddMonsterNian(slot1.hp, slot1.maxHp)
	slot0.model:AddFuShun()

	slot2 = slot0.model.mosterNian.hp

	slot0.mediator:OnAddMonsterNian(slot2, slot0.model.mosterNian.maxHp)
	slot0.mediator:OnAddFuShun(slot2)
	slot0.model:SetAttackCnt(slot1.leftCount)
	slot0.mediator:OnAttackCntUpdate(slot0.model.attackCnt)
	slot0.model:SetStorys(slot1.storys)
end

function slot0.Input(slot0, slot1)
	if slot0.isOnAction then
		return
	end

	slot0:RemoveInputTimer()
	slot0:UpdateActionStr(slot1)

	slot2 = slot0.model
	slot3 = slot2:IsMatchAction() and 0.5 or BeatMonsterNianConst.INPUT_TIME

	if slot2 then
		slot0.isOnAction = true
	end

	slot0.inputTimer = Timer.New(function ()
		uv0:UpdateActionStr("")

		if uv1 then
			uv0:StartAction(uv0.model:GetMatchAction(), uv0.model:GetMonsterAction())
		end
	end, slot3, 1)

	slot0.inputTimer:Start()
end

function slot0.StartAction(slot0, slot1, slot2)
	slot0:RemoveAnimationTimer()

	slot3 = nil

	slot5[1] = function (slot0)
		uv0:SendRequestToServer(function (slot0)
			uv0 = slot0

			uv1()
		end)
	end

	slot5[2] = function (slot0)
		uv0.mediator:OnChangeFuShunAction(uv1)
		uv0.mediator:OnChangeNianAction(uv2)

		uv0.animationTimer = Timer.New(slot0, 2, 1)

		uv0.animationTimer:Start()
	end

	slot5[3] = function (slot0)
		uv0.mediator:OnUIHpUpdate(uv0.model.mosterNian.hp, uv0.model.mosterNian.maxHp, slot0)
	end

	slot5[4] = function (slot0)
		if not uv0.model:GetPlayableStory() then
			slot0()

			return
		end

		uv0.mediator:PlayStory(slot1, slot0)
	end

	slot5[5] = function (slot0)
		if not uv0 or #uv0 == 0 then
			slot0()

			return
		end

		uv1.mediator:DisplayAwards(uv0, slot0)
	end

	slot5[6] = function (slot0)
		uv0.isOnAction = false
	end

	seriesAsync({})
end

function slot0.SendRequestToServer(slot0, slot1)
	if slot0.isFake then
		slot4.hp = slot0.model:RandomDamage()
		slot4.maxHp = slot0.model:GetMonsterMaxHp()
		slot4.leftCount = slot0.model:GetAttackCount() - 1
		slot4.storys = {}

		slot0:NetData({})
		slot1()
	else
		slot5.activity_id = ActivityConst.BEAT_MONSTER_NIAN_2020
		slot5.callback = slot1

		pg.m02:sendNotification(GAME.ACT_BEAT_MONSTER_NIAN, {
			cmd = 1
		})
	end
end

function slot0.UpdateActionStr(slot0, slot1)
	slot0.model:UpdateActionStr(slot1)
	slot0.mediator:OnInputChange(slot0.model:GetActionStr())
end

function slot0.RemoveInputTimer(slot0)
	if slot0.inputTimer then
		slot0.inputTimer:Stop()

		slot0.inputTimer = nil
	end
end

function slot0.RemoveAnimationTimer(slot0)
	if slot0.animationTimer then
		slot0.animationTimer:Stop()

		slot0.animationTimer = nil
	end
end

function slot0.ReStartGame(slot0)
	slot0.isFake = true
	slot3.storys = {}

	slot0:NetData({
		leftCount = 10,
		hp = 10,
		maxHp = 10
	})
	slot0.mediator:OnUIHpUpdate(10, 10)
end

function slot0.Dispose(slot0)
	slot0:RemoveAnimationTimer()
	slot0:RemoveInputTimer()
	slot0.mediator:Dispose()
	slot0.model:Dispose()
end

return slot0
