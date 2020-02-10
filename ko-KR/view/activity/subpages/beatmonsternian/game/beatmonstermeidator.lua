slot0 = class("BeatMonsterMeidator")
slot1 = 1
slot2 = 0.1
slot3 = 1

function slot0.Ctor(slot0, slot1)
	pg.DelegateInfo.New(slot0)

	slot0.controller = slot1
end

function slot0.SetUI(slot0, slot1)
	slot0._go = slot1
	slot0._tf = tf(slot1)
	slot0.monsterNian = slot0:findTF("AD/monster")
	slot0.fushun = slot0:findTF("AD/fushun")
	slot0.hpTF = slot0:findTF("AD/hp"):GetComponent(typeof(Slider))
	slot2 = slot0:findTF("AD/attack_count/Text")
	slot0.attackCntTF = slot2:GetComponent(typeof(Text))
	slot0.actions = slot0:findTF("AD/actions")
	slot2[1] = slot0.actions:Find("content/1")
	slot2[2] = slot0.actions:Find("content/2")
	slot2[MULTRES] = slot0.actions:Find("content/3")
	slot0.actionKeys = {}
	slot0.curtainTF = slot0:findTF("AD/curtain")
	slot0.startLabel = slot0.curtainTF:Find("start_label")
	slot0.ABtn = slot0:findTF("AD/A_btn")
	slot0.joyStick = slot0:findTF("AD/joyStick")
end

function slot0.DoCurtainUp(slot0, slot1)
	slot2 = getProxy(SettingsProxy)

	if slot2:IsShowBeatMonseterNianCurtain() then
		slot2:SetBeatMonseterNianFlag()
		slot0:StartCurtainUp(slot1)
	else
		slot1()
	end
end

function slot0.StartCurtainUp(slot0, slot1)
	setActive(slot0.curtainTF, true)
	LeanTween.color(slot0.curtainTF, Color.white, uv0):setFromColor(Color.black):setOnComplete(System.Action(function ()
		setActive(uv0.startLabel, true)
		blinkAni(uv0.startLabel, uv1, 2):setOnComplete(System.Action(function ()
			LeanTween.alpha(uv0.curtainTF, 0, uv1):setFrom(1)
			LeanTween.alpha(uv0.startLabel, 0, uv1):setFrom(1):setOnComplete(System.Action(uv2))
		end))
	end))
end

function slot0.OnInited(slot0)
	function slot1()
		if uv0.attackCnt <= 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("activity_hit_monster_nocount"))

			return false
		end

		if uv0.hp <= 0 then
			slot2.content = i18n("activity_hit_monster_reset_tip")

			function slot2.onYes()
				uv0.controller:ReStartGame()
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({})

			return false
		end

		return true
	end

	slot0:OnTrigger(slot0.ABtn, slot1, function ()
		uv0.controller:Input(BeatMonsterNianConst.ACTION_NAME_A)
	end)
	slot0:OnSwitch(slot0.joyStick, slot1, function (slot0)
		uv0.controller:Input(slot0 and BeatMonsterNianConst.ACTION_NAME_L or BeatMonsterNianConst.ACTION_NAME_R)
	end)
end

function slot0.OnAttackCntUpdate(slot0, slot1)
	slot0.attackCnt = slot1
	slot0.attackCntTF.text = slot1
end

function slot0.OnMonsterHpUpdate(slot0, slot1)
	slot0.hp = slot1

	slot0.fuShun:SetInteger("hp", slot1)
	slot0.nian:SetInteger("hp", slot1)
end

function slot0.OnUIHpUpdate(slot0, slot1, slot2, slot3)
	LeanTween.value(slot0.hpTF.gameObject, slot0.hpTF.value, slot1 / slot2, 0.3):setOnUpdate(System.Action_float(function (slot0)
		uv0.hpTF.value = slot0
	end)):setOnComplete(System.Action(function ()
		if uv0 then
			uv0()
		end
	end))
end

function slot0.OnAddFuShun(slot0, slot1)
	slot0.fuShun = slot0.fushun:GetComponent(typeof(Animator))

	slot0.fuShun:SetInteger("hp", slot1)
end

function slot0.OnAddMonsterNian(slot0, slot1, slot2)
	slot0.hp = slot1
	slot0.nian = slot0.monsterNian:GetComponent(typeof(Animator))
	slot0.hpTF.value = slot1 / slot2

	slot0.nian:SetInteger("hp", slot1)
end

function slot0.OnChangeFuShunAction(slot0, slot1)
	slot0.fuShun:SetTrigger(slot1)
end

function slot0.OnChangeNianAction(slot0, slot1)
	slot0.nian:SetTrigger(slot1)
end

function slot0.OnInputChange(slot0, slot1)
	if slot1 and slot1 ~= "" then
		for slot6, slot7 in ipairs(slot0.actionKeys) do
			slot8 = string.sub(slot1, slot6, slot6) or ""

			setActive(slot7:Find("A"), slot8 == BeatMonsterNianConst.ACTION_NAME_A)
			setActive(slot7:Find("L"), slot8 == BeatMonsterNianConst.ACTION_NAME_L)
			setActive(slot7:Find("R"), slot8 == BeatMonsterNianConst.ACTION_NAME_R)
		end
	end

	setActive(slot0.actions, slot2)
end

function slot0.PlayStory(slot0, slot1, slot2)
	pg.StoryMgr.GetInstance():Play(slot1, slot2)
end

function slot0.DisplayAwards(slot0, slot1, slot2)
	slot6.awards = slot1
	slot6.callback = slot2

	pg.m02:sendNotification(ActivityProxy.ACTIVITY_SHOW_AWARDS, {})
end

function slot0.Dispose(slot0)
	pg.DelegateInfo.Dispose(slot0)
end

function slot0.OnTrigger(slot0, slot1, slot2, slot3)
	slot4 = slot1:Find("off")
	slot5 = true
	slot6 = GetOrAddComponent(slot1, typeof(EventTriggerListener))

	slot6:AddPointDownFunc(function (slot0, slot1)
		uv0 = uv1()

		if uv0 then
			setActive(uv2, false)
		end
	end)
	slot6:AddPointUpFunc(function (slot0, slot1)
		if uv0 then
			setActive(uv1, true)

			if uv2 then
				uv2()
			end
		end
	end)
end

function slot0.OnSwitch(slot0, slot1, slot2, slot3)
	onButton(slot0, slot1, function ()
		if uv0() then
			uv1 = not uv1

			uv2(uv1)

			if uv3 then
				uv3(uv1)
			end
		end
	end, SFX_PANEL)
	function (slot0)
		setActive(uv0:Find("on"), slot0)
		setActive(uv0:Find("off"), not slot0)
	end(false)
end

function slot0.findTF(slot0, slot1, slot2)
	return findTF(slot2 or slot0._tf, slot1)
end

return slot0
