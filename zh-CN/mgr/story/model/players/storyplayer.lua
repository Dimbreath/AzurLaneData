slot0 = class("StoryPlayer", import("..animation.StoryAnimtion"))
slot1 = false

function slot0.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0)
	pg.DelegateInfo.New(slot0)

	slot0._go = slot1
	slot0._tf = slot1.transform
	slot0.goCG = GetOrAddComponent(slot0._tf, typeof(CanvasGroup))
	slot0.asidePanel = slot0:findTF("aside_panel")
	slot0.bgGlitch = slot0:findTF("bg_glitch")
	slot0.bgPanel = slot0:findTF("bg")
	slot0.bgPanelCg = slot0.bgPanel:GetComponent(typeof(CanvasGroup))
	slot0.bgImage = slot0:findTF("image", slot0.bgPanel):GetComponent(typeof(Image))
	slot0.dialoguePanel = slot0:findTF("dialogue")
	slot0.effectPanel = slot0:findTF("effect")
	slot0.curtain = slot0:findTF("curtain")
	slot0.curtainCg = slot0.curtain:GetComponent(typeof(CanvasGroup))
	slot0.flash = slot0:findTF("flash")
	slot0.flashImg = slot0.flash:GetComponent(typeof(Image))
	slot0.flashCg = slot0.flash:GetComponent(typeof(CanvasGroup))
	slot0.optionUIlist = UIItemList.New(slot0:findTF("options_panel/options"), slot0:findTF("options_panel/options/option_tpl"))
	slot0.optionPrint = slot0:findTF("options_panel/bg")
	slot0.optionsCg = slot0:findTF("options_panel"):GetComponent(typeof(CanvasGroup))
	slot0.bgs = {}
end

function slot0.Play(slot0, slot1, slot2, slot3)
	if not slot1 then
		slot3()

		return
	end

	if slot1:GetNextScriptName() then
		slot3()

		return
	end

	if not slot1:GetStepByIndex(slot2) then
		slot3()

		return
	end

	if slot4:ShouldJumpToNextScript() then
		slot1:SetNextScriptName(slot4:GetNextScriptName())
		slot3()

		return
	end

	if slot1:ShouldSkipAll() and slot4:ExistOption() and not slot1:IsPlayed() then
		slot1:StopSkip()
	elseif slot1:ShouldSkipAll() then
		slot3()

		return
	end

	slot0.callback = slot3
	slot5 = slot1:GetNextStep(slot2)
	slot6 = slot1:GetPrevStep(slot2)
	slot0.step = slot4

	seriesAsync({
		function (slot0)
			uv0:Reset(uv1, uv2)
			uv0:UpdateBg(uv1)
			uv0:PlayBgm(uv1)
			parallelAsync({
				function (slot0)
					uv0:LoadEffects(uv1, slot0)
				end,
				function (slot0)
					uv0:flashin(uv1, slot0)
				end
			}, slot0)
		end,
		function (slot0)
			parallelAsync({
				function (slot0)
					uv0:OnInit(uv1, slot0)
				end,
				function (slot0)
					uv0:PlaySoundEffect(uv1)
					uv0:StartUIAnimations(uv1, slot0)
				end,
				function (slot0)
					uv0:OnEnter(uv1, uv2, slot0)
				end
			}, slot0)
		end,
		function (slot0)
			if uv0:ExistOption() then
				uv1:InitBranches(uv2, uv0, slot0)
			else
				uv1:RegisetEvent(slot0)
			end
		end,
		function (slot0)
			parallelAsync({
				function (slot0)
					uv0:ClearAnimation()
					uv0:OnWillExit(uv1, uv2, slot0)
				end,
				function (slot0)
					if not uv0 then
						slot0()

						return
					end

					uv1:Flashout(uv0, slot0)
				end,
				function (slot0)
					if uv0 then
						slot0()

						return
					end

					uv1:FadeOutStory(uv2, slot0)
				end
			}, slot0)
		end,
		function (slot0)
			uv0:Clear(slot0)
		end
	}, slot3)
end

function slot0.CanSkip(slot0)
	return slot0.step and not slot0.step:ExistOption()
end

function slot0.Next(slot0)
	slot0.callback()
end

function slot0.InitBranches(slot0, slot1, slot2, slot3)
	slot4 = false

	slot0.optionUIlist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = slot2:Find("content")
			slot5 = uv0[slot1 + 1][2]

			onButton(uv1, slot3, function ()
				if not uv0 then
					return
				end

				uv1:SetBranchCode(uv2)
				uv3:ShowOrHideBranches(false, uv4)
			end, SFX_PANEL)
			setText(slot3:Find("Text"), uv0[slot1 + 1][1])
			setActive(slot3, false)
		end
	end)
	slot0.optionUIlist:align(#slot2:GetOptions())
	slot0:ShowOrHideBranches(true, function ()
		uv0 = true

		if uv1 then
			triggerButton(uv2.optionUIlist.container:GetChild(0):Find("content"))
		end
	end)
end

function slot0.ShowOrHideBranches(slot0, slot1, slot2)
	if LeanTween.isTweening(go(slot0.optionsCg)) then
		return
	end

	setActive(slot0.optionsCg.gameObject, true)

	if slot1 then
		slot0:TweenRotate(slot0.optionPrint, 360, 5, -1, 0)
	else
		slot0:CancelTween(slot0.optionPrint.gameObject)
	end

	slot3 = {}

	table.insert(slot3, function (slot0)
		slot2 = uv0 and 0 or 1264
		slot3 = uv0 and 1264 or 0

		uv1.optionUIlist:eachActive(function (slot0, slot1)
			setAnchoredPosition(slot1:Find("content"), {
				x = uv0
			})
			table.insert(uv1, function (slot0)
				setActive(uv0, true)
				uv1:TweenValue(uv0, uv0.localPosition.x, uv2, 0.5, uv3 * 0.1, function (slot0)
					setAnchoredPosition(uv0, {
						x = slot0
					})
				end, slot0)
			end)
		end)
		parallelAsync({}, slot0)
	end)
	table.insert(slot3, function (slot0)
		uv1:TweenMovex(rtf(uv1.optionPrint), uv0 and 0 or 525, uv0 and 525 or 0, 0.5, 0, nil, slot0)
	end)
	table.insert(slot3, function (slot0)
		uv1:TweenValue(go(uv1.optionsCg), uv0 and 0 or 1, uv0 and 1 or 0, 0.2, 0, function (slot0)
			uv0.optionsCg.alpha = slot0
		end, slot0)
	end)
	parallelAsync(slot3, slot2)
end

function slot0.FadeOutStory(slot0, slot1, slot2)
	if not slot1:ShouldFadeout() then
		slot2()

		return
	end

	if not slot1:ShouldWaitFadeout() then
		slot0:fadeTransform(slot0._go, 1, 0.3, slot1:GetFadeoutTime(), true)
		slot2()
	else
		slot0:fadeTransform(slot0._go, 1, 0.3, slot3, true, slot2)
	end
end

function slot0.fadeTransform(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = {}
	slot8 = {}

	for slot13 = 0, slot1:GetComponentsInChildren(typeof(Image)).Length - 1 do
		slot15 = {
			name = "_Color",
			color = Color.white
		}

		if slot9[slot13].material.shader.name == "UI/GrayScale" then
			slot15 = {
				name = "_GrayScale",
				color = Color.New(0.21176470588235294, 0.7137254901960784, 0.07058823529411765)
			}
		elseif slot14.material.shader.name == "UI/Line_Add_Blue" then
			slot15 = {
				name = "_GrayScale",
				color = Color.New(1, 1, 1, 0.5882352941176471)
			}
		end

		table.insert(slot8, slot15)

		if slot14.material == slot14.defaultGraphicMaterial then
			slot14.material = Material.Instantiate(slot14.defaultGraphicMaterial)
		end

		table.insert(slot7, slot14.material)
	end

	LeanTween.value(go(slot1), slot2, slot3, slot4):setOnUpdate(System.Action_float(function (slot0)
		for slot4, slot5 in ipairs(uv0) do
			if not IsNil(slot5) then
				slot5:SetColor(uv1[slot4].name, uv1[slot4].color * Color.New(slot0, slot0, slot0))
			end
		end
	end)):setOnComplete(System.Action(function ()
		if uv0 then
			for slot3, slot4 in ipairs(uv1) do
				if not IsNil(slot4) then
					slot4:SetColor(uv2[slot3].name, uv2[slot3].color)
				end
			end
		end

		if uv3 then
			uv3()
		end
	end))
end

function slot0.RegisetEvent(slot0, slot1)
	onButton(slot0, slot0._go, function ()
		removeOnButton(uv0._go)
		uv1()
	end, SFX_PANEL)

	if uv0 then
		triggerButton(slot0._go)
	end
end

function slot0.flashEffect(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.flashImg.color = slot4 and Color(0, 0, 0) or Color(1, 1, 1)
	slot0.flashCg.alpha = slot1

	setActive(slot0.flash, true)
	slot0:TweenValueForcanvasGroup(slot0.flashCg, slot1, slot2, slot3, slot5, slot6)
end

function slot0.Flashout(slot0, slot1, slot2)
	slot3, slot4, slot5, slot6 = slot1:GetFlashoutData()

	if not slot3 then
		slot2()

		return
	end

	slot0:flashEffect(slot3, slot4, slot5, slot6, 0, slot2)
end

function slot0.flashin(slot0, slot1, slot2)
	slot3, slot4, slot5, slot6, slot7 = slot1:GetFlashinData()

	if not slot3 then
		slot2()

		return
	end

	slot0:flashEffect(slot3, slot4, slot5, slot6, slot7, slot2)
end

function slot0.UpdateBg(slot0, slot1)
	if slot1:ShouldBgGlitchArt() then
		slot0:SetBgGlitchArt(slot1)
	else
		if slot1:GetBgName() then
			setActive(slot0.bgPanel, true)

			slot0.bgPanelCg.alpha = 1
			slot3 = slot0.bgImage
			slot3.color = Color.New(1, 1, 1)
			slot3.sprite = slot0:GetBg(slot2)
		end

		if slot1:GetBgShadow() then
			slot0:TweenValue(slot0.bgImage, slot3[1], slot3[2], slot3[3], 0, function (slot0)
				uv0.color = Color.New(slot0, slot0, slot0)
			end, nil)
		end

		if slot1:IsBlackBg() then
			setActive(slot0.curtain, true)

			slot0.curtainCg.alpha = 1
		end
	end

	slot0:OnBgUpdate(slot1)
end

function slot0.SetBgGlitchArt(slot0, slot1)
	setActive(slot0.bgPanel, false)
	setActive(slot0.bgGlitch, true)
end

function slot0.GetBg(slot0, slot1)
	if not slot0.bgs[slot1] then
		slot0.bgs[slot1] = LoadSprite("bg/" .. slot1)
	end

	return slot0.bgs[slot1]
end

function slot0.LoadEffects(slot0, slot1, slot2)
	if #slot1:GetEffects() <= 0 then
		slot2()

		return
	end

	slot4 = {}

	for slot8, slot9 in ipairs(slot3) do
		if slot0.effectPanel:Find(slot9.name) then
			setActive(slot12, slot9.active)
		else
			slot13 = ""

			if PathMgr.FileExists(PathMgr.getAssetBundle("ui/" .. slot10)) then
				slot13 = "ui"
			elseif PathMgr.FileExists(PathMgr.getAssetBundle("effect/" .. slot10)) then
				slot13 = "effect"
			end

			if slot13 and slot13 ~= "" then
				table.insert(slot4, function (slot0)
					LoadAndInstantiateAsync(uv0, uv1, function (slot0)
						setParent(slot0, uv0.effectPanel.transform)
						setActive(slot0, uv1)

						slot0.name = uv2

						uv3()
					end)
				end)
			else
				print("not found effect", slot10)
			end
		end
	end

	parallelAsync(slot4, slot2)
end

function slot0.ClearEffects(slot0)
	removeAllChildren(slot0.effectPanel)
end

function slot0.PlaySoundEffect(slot0, slot1)
	if slot1:ShouldPlaySoundEffect() then
		slot2, slot3 = slot1:GetSoundeffect()

		slot0:DelayCall(slot3, function ()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(uv0)
		end)
	end

	if slot1:ShouldPlayVoice() then
		slot0:PlayVoice(slot1)
	end
end

function slot0.PlayVoice(slot0, slot1)
	if slot0.voiceDelayTimer then
		slot0.voiceDelayTimer:Stop()

		slot0.voiceDelayTimer = nil
	end

	if slot0.currentVoice then
		slot0.currentVoice:Stop(true)

		slot0.currentVoice = nil
	end

	slot2, slot3 = slot1:GetVoice()
	slot4 = nil
	slot0.voiceDelayTimer = slot0:CreateDelayTimer(slot3, function ()
		if uv0 then
			uv0:Stop()
		end

		if uv1.voiceDelayTimer then
			uv1.voiceDelayTimer = nil
		end

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(uv2, function (slot0)
			if slot0 then
				uv0.currentVoice = slot0.playback
			end
		end)
	end)
end

function slot0.Reset(slot0, slot1, slot2)
	setActive(slot0.bgPanel, false)
	setActive(slot0.dialoguePanel, false)
	setActive(slot0.asidePanel, false)
	setActive(slot0.curtain, false)
	setActive(slot0.flash, false)
	setActive(slot0.optionsCg.gameObject, false)
	setActive(slot0.bgGlitch, false)

	slot0.flashCg.alpha = 1
	slot0.goCG.alpha = 1

	slot0:OnReset(slot1, slot2)
end

function slot0.Clear(slot0, slot1)
	slot0.bgs = {}
	slot0.goCG.alpha = 1

	slot0:OnClear()

	if slot1 then
		slot1()
	end

	pg.DelegateInfo.New(slot0)
end

function slot0.StoryStart(slot0)
	slot0:OnStart()
end

function slot0.StoryEnd(slot0)
	if slot0.voiceDelayTimer then
		slot0.voiceDelayTimer:Stop()

		slot0.voiceDelayTimer = nil
	end

	if slot0.currentVoice then
		slot0.currentVoice:Stop(true)

		slot0.currentVoice = nil
	end

	slot0:ClearEffects()
	slot0:Clear()
	slot0:OnEnd()
end

function slot0.PlayBgm(slot0, slot1)
	if slot1:ShouldStopBgm() then
		slot0:StopBgm()
	end

	if slot1:ShoulePlayBgm() then
		slot2, slot3 = slot1:GetBgmData()

		slot0:DelayCall(slot3, function ()
			pg.CriMgr.GetInstance():PlayBGM(uv0, "story")
		end)
	end
end

function slot0.StopBgm(slot0, slot1)
	pg.CriMgr.GetInstance():StopBGM(true)
end

function slot0.StartUIAnimations(slot0, slot1, slot2)
	parallelAsync({
		function (slot0)
			uv0:StartBlinkAnimation(uv1, slot0)
		end,
		function (slot0)
			uv0:StartBlinkWithColorAnimation(uv1, slot0)
		end,
		function (slot0)
			uv0:OnStartUIAnimations(uv1, slot0)
		end
	}, slot2)
end

function slot0.StartBlinkAnimation(slot0, slot1, slot2)
	if slot1:ShouldBlink() then
		slot3 = slot1:GetBlinkData()
		slot6 = slot3.dur
		slot7 = slot3.delay
		slot8 = slot3.alpha[1]
		slot9 = slot3.alpha[2]
		slot10 = slot3.wait
		slot0.flashImg.color = slot3.black and Color(0, 0, 0) or Color(1, 1, 1)

		setActive(slot0.flash, true)

		slot11 = {}

		for slot15 = 1, slot3.number do
			table.insert(slot11, function (slot0)
				uv0:TweenAlpha(uv0.flash, uv1, uv2, uv3 / 2, 0, function ()
					uv0:TweenAlpha(uv0.flash, uv1, uv2, uv3 / 2, uv4, uv5)
				end)
			end)
		end

		seriesAsync(slot11, function ()
			setActive(uv0.flash, false)
		end)
	end

	slot2()
end

function slot0.StartBlinkWithColorAnimation(slot0, slot1, slot2)
	if slot1:ShouldBlinkWithColor() then
		slot3 = slot1:GetBlinkWithColorData()
		slot4 = slot3.color
		slot10 = slot4[3]
		slot11 = slot4[4]
		slot0.flashImg.color = Color(slot4[1], slot4[2], slot10, slot11)

		setActive(slot0.flash, true)

		slot6 = {}

		for slot10, slot11 in ipairs(slot3.alpha) do
			slot12 = slot11[1]
			slot13 = slot11[2]
			slot14 = slot11[3]
			slot15 = slot11[4]

			table.insert(slot6, function (slot0)
				uv0:TweenValue(uv0.flash, uv1, uv2, uv3, uv4, function (slot0)
					uv0.flashCg.alpha = slot0
				end, slot0)
			end)
		end

		parallelAsync(slot6, function ()
			setActive(uv0.flash, false)
		end)
	end

	slot2()
end

function slot0.findTF(slot0, slot1, slot2)
	return findTF(slot2 or slot0._tf, slot1)
end

function slot0.OnStart(slot0)
end

function slot0.OnReset(slot0, slot1)
end

function slot0.OnBgUpdate(slot0, slot1)
end

function slot0.OnInit(slot0, slot1, slot2)
	if slot2 then
		slot2()
	end
end

function slot0.OnStartUIAnimations(slot0, slot1, slot2)
	if slot2 then
		slot2()
	end
end

function slot0.OnEnter(slot0, slot1, slot2, slot3)
	if slot3 then
		slot3()
	end
end

function slot0.OnWillExit(slot0, slot1, slot2, slot3)
	slot3()
end

function slot0.OnClear(slot0)
end

function slot0.OnEnd(slot0)
end

return slot0
