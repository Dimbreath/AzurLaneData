slot0 = class("DialogueStoryPlayer", import(".StoryPlayer"))

function slot0.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)

	slot0.actorPanel = slot0:findTF("actor", slot0.dialoguePanel)
	slot0.actorLeft = slot0:findTF("actor_left", slot0.actorPanel)
	slot0.initActorLeftPos = slot0.actorLeft.localPosition
	slot0.actorMiddle = slot0:findTF("actor_middle", slot0.actorPanel)
	slot0.initActorMiddlePos = slot0.actorMiddle.localPosition
	slot0.actorRgiht = slot0:findTF("actor_right", slot0.actorPanel)
	slot0.initActorRgihtPos = slot0.actorRgiht.localPosition
	slot0.mainPanel = slot0:findTF("main", slot0.dialoguePanel)
	slot0.conentTxt = slot0:findTF("content", slot0.mainPanel):GetComponent(typeof(Text))
	slot0.typewriter = slot0:findTF("content", slot0.mainPanel):GetComponent(typeof(Typewriter))
	slot0.nameLeft = slot0:findTF("name_left", slot0.mainPanel)
	slot0.nameRight = slot0:findTF("name_right", slot0.mainPanel)
	slot0.nameLeftTxt = slot0:findTF("Text", slot0.nameLeft):GetComponent(typeof(Text))
	slot0.nameRightTxt = slot0:findTF("Text", slot0.nameRight):GetComponent(typeof(Text))
	slot0.subActorMiddle = UIItemList.New(slot0:findTF("actor_middle/sub", slot0.actorPanel), slot0:findTF("actor_middle/sub/tpl", slot0.actorPanel))
	slot0.subActorRgiht = UIItemList.New(slot0:findTF("actor_right/sub", slot0.actorPanel), slot0:findTF("actor_right/sub/tpl", slot0.actorPanel))
	slot0.subActorLeft = UIItemList.New(slot0:findTF("actor_left/sub", slot0.actorPanel), slot0:findTF("actor_left/sub/tpl", slot0.actorPanel))
	slot0.glitchArtMaterial = slot0:findTF("material1"):GetComponent(typeof(Image)).material
end

function slot0.OnReset(slot0, slot1, slot2)
	slot0:ResetActorTF(slot1, slot2)
	setActive(slot0.nameLeft, false)
	setActive(slot0.nameRight, false)
	setActive(slot0.dialoguePanel, true)

	slot0.conentTxt.text = ""
end

function slot0.ResetActorTF(slot0, slot1, slot2)
	if slot0:GetSideTF(slot1:GetSide()) then
		slot0:CancelTween(slot4.gameObject)

		slot4.localScale = Vector3(1, 1, 1)
		slot4.eulerAngles = Vector3(0, 0, 0)

		if slot4 == slot0.actorRgiht then
			slot4.localPosition = slot0.initActorRgihtPos
		elseif slot4 == slot0.actorMiddle then
			slot4.localPosition = slot0.initActorMiddlePos
		elseif slot4 == slot0.actorLeft then
			slot4.localPosition = slot0.initActorLeftPos
		end
	end

	if slot1:HideOtherPainting() then
		slot0:RecyclePainting({
			"actorLeft",
			"actorMiddle",
			"actorRgiht"
		})
	else
		if slot2 and slot2:IsDialogueMode() and slot1:IsSameSide(slot2) and slot1:IsDialogueMode() then
			slot0:RecyclePainting(slot4)
		end

		if slot3 == DialogueStep.SIDE_MIDDLE then
			slot0:RecyclePainting({
				"actorLeft",
				"actorRgiht"
			})
		end
	end

	slot0:RecyclesSubPantings(slot0.subActorMiddle)
	slot0:RecyclesSubPantings(slot0.subActorRgiht)
	slot0:RecyclesSubPantings(slot0.subActorLeft)
end

function slot0.OnInit(slot0, slot1, slot2)
	parallelAsync({
		function (slot0)
			uv0:UpdateContent(uv1, slot0)
		end,
		function (slot0)
			uv0:UpdatePainting(uv1, slot0)
		end
	}, slot2)
end

function slot0.OnStartUIAnimations(slot0, slot1, slot2)
	if not slot1:ShouldShakeDailogue() then
		slot2()

		return
	end

	slot3 = slot1:GetShakeDailogueData()

	slot0:TweenMovex(slot0.dialoguePanel, slot3.x, slot0.dialoguePanel.localPosition.x, slot3.speed, slot3.delay, slot3.number, slot2)
end

function slot0.OnEnter(slot0, slot1, slot2, slot3)
	parallelAsync({
		function (slot0)
			uv0:FadeInPaiting(uv1, uv2, slot0)
		end,
		function (slot0)
			uv0:StartMovePrevPaitingToSide(uv1, uv2, slot0)
		end,
		function (slot0)
			uv0:FadeOutPrevPaiting(uv1, uv2, uv3)
		end
	}, slot3)
end

function slot0.FadeOutPrevPaiting(slot0, slot1, slot2, slot3)
	if not slot1 or not slot1:IsDialogueMode() then
		slot3()

		return
	end

	if slot0:GetSideTF(slot2:GetPrevSide(slot1)) and slot2 and slot2:IsDialogueMode() and slot2:GetPainting() ~= nil and not slot2:IsSameSide(slot1) then
		slot5 = slot1:GetPaintingData()

		slot0:FadePainting(slot4, 1, slot5.alpha, slot5.time, slot3)
	else
		slot3()
	end
end

function slot0.FadeInPaiting(slot0, slot1, slot2, slot3)
	if slot2 and slot2:IsDialogueMode() and slot2:GetPainting() ~= nil and not slot1:IsSameSide(slot2) then
		slot5 = slot1:GetPaintingData()

		if not IsNil(slot0:GetSideTF(slot1:GetSide())) then
			slot0:FadePainting(slot4, slot5.alpha, 1, slot5.time)
		end
	end

	slot3()
end

function slot0.FadePainting(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = {}
	slot7 = {}

	for slot12 = 0, slot1:GetComponentsInChildren(typeof(Image)).Length - 1 do
		slot14 = {
			name = "_Color",
			color = Color.white
		}

		if slot8[slot12].material.shader.name == "UI/GrayScale" then
			slot14 = {
				name = "_GrayScale",
				color = Color.New(0.21176470588235294, 0.7137254901960784, 0.07058823529411765)
			}
		elseif slot13.material.shader.name == "UI/Line_Add_Blue" then
			slot14 = {
				name = "_GrayScale",
				color = Color.New(1, 1, 1, 0.5882352941176471)
			}
		end

		table.insert(slot7, slot14)

		if slot13.material == slot13.defaultGraphicMaterial then
			slot13.material = Material.Instantiate(slot13.defaultGraphicMaterial)
		end

		table.insert(slot6, slot13.material)
	end

	LeanTween.value(go(slot1), slot2, slot3, slot4):setOnUpdate(System.Action_float(function (slot0)
		for slot4, slot5 in ipairs(uv0) do
			if not IsNil(slot5) then
				slot5:SetColor(uv1[slot4].name, uv1[slot4].color * Color.New(slot0, slot0, slot0))
			end
		end
	end)):setOnComplete(System.Action(slot5))
end

function slot0.UpdateTypeWriter(slot0, slot1, slot2)
	if not slot1:GetTypewriter() then
		slot2()

		return
	end

	function slot0.typewriter.endFunc()
		uv0.typewriter.endFunc = nil

		removeOnButton(uv0._tf)
		uv1()
	end

	slot4 = slot3.speed or 0.1
	slot5 = slot3.speedUp or slot4

	slot0.typewriter:setSpeed(slot4)
	slot0.typewriter:Play()
	onButton(slot0, slot0._tf, function ()
		uv0.typewriter:setSpeed(uv1)
	end, SFX_PANEL)
end

function slot0.UpdatePainting(slot0, slot1, slot2)
	slot4, slot5, slot6, slot7 = slot0:GetSideTF(slot1:GetSide())

	if slot1:GetPainting() then
		setPaintingPrefab(slot4, slot3, "duihua")

		slot4.localScale = Vector3(slot8, (slot1:GetPaintingDir() > 1 or slot8 < -1) and math.abs(slot8) or 1, 1)
		slot10 = findTF(slot4, "fitter"):GetChild(0)
		slot10.name = slot3

		slot0:UpdateActorPostion(slot4, slot1)
		slot0:UpdateExpression(slot10, slot1)
		slot0:StartPatiningActions(slot4, slot1)
		slot0:AddGlitchArtEffectForPating(slot4, slot1)
		slot0:InitSubPainting(slot7, slot1)
		slot4:SetAsLastSibling()

		if slot1:ShouldGrayPainting() then
			setGray(slot10, true, true)
		end
	end

	if slot5 then
		setActive(slot5, slot1:GetNameWithColor() and slot8 ~= "")

		slot6.text = slot8
	end

	slot2()
end

function slot0.InitSubPainting(slot0, slot1, slot2)
	function slot3(slot0, slot1)
		setPaintingPrefab(slot1, slot0.name, "duihua")

		slot3 = findTF(findTF(slot1, "fitter"):GetChild(0), "face")

		if slot0.expression then
			setImageSprite(slot3, GetSpriteFromAtlas("paintingface/" .. slot0.name, slot0.expression))
		end

		setActive(slot3, slot0.expression)

		if slot0.pos then
			setAnchoredPosition(slot1, slot0.pos)
		end

		if slot0.dir then
			slot1.transform.localScale = Vector3(slot0.dir, 1, 1)
		end
	end

	slot1:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			uv0(uv1[slot1 + 1], slot2)
		end
	end)
	slot1:align(#slot2:GetSubPaintings())
end

function slot0.UpdateActorPostion(slot0, slot1, slot2)
	if slot2:GetPaitingOffst() then
		slot1.localPosition = Vector3(slot1.localPosition.x + (slot3.x or 0), slot4.y + (slot3.y or 0), 0)
	end
end

function slot0.UpdateExpression(slot0, slot1, slot2)
	if slot2:GetExPression() then
		slot4 = findTF(slot1, "face")

		setActive(slot4, true)
		setImageSprite(slot4, GetSpriteFromAtlas("paintingface/" .. slot2:GetPainting(), slot3))
	end
end

function slot0.StartPatiningActions(slot0, slot1, slot2, slot3)
	parallelAsync({
		function (slot0)
			uv0:StartPatiningMoveAction(uv1, uv2, slot0)
		end,
		function (slot0)
			uv0:StartPatiningShakeAction(uv1, uv2, slot0)
		end,
		function (slot0)
			uv0:StartPatiningZoomAction(uv1, uv2, slot0)
		end,
		function (slot0)
			uv0:StartPatiningRotateAction(uv1, uv2, slot0)
		end
	}, function ()
		if uv0 then
			uv0()
		end
	end)
end

function slot0.StartPatiningShakeAction(slot0, slot1, slot2, slot3)
	if not slot2:GetPaintingAction(DialogueStep.PAINTING_ACTION_SHAKE) then
		slot3()

		return
	end

	slot10 = tf(slot1).localPosition

	slot0:TweenMove(slot1, Vector3(slot10.x + (slot4.x or 0), slot10.y + (slot4.y or 10), 0), slot4.dur or 1, slot4.number or 1, slot4.delay or 0, slot3)
end

function slot0.StartPatiningZoomAction(slot0, slot1, slot2, slot3)
	if not slot2:GetPaintingAction(DialogueStep.PAINTING_ACTION_ZOOM) then
		slot3()

		return
	end

	slot5 = slot4.from or {
		0,
		0,
		0
	}
	slot6 = slot4.to or {
		1,
		1,
		1
	}

	slot0:TweenScale(slot1, Vector3(slot6[1], slot6[2], slot6[3]), slot4.dur or 0, slot4.delay or 0, slot3)
end

function slot0.StartPatiningRotateAction(slot0, slot1, slot2, slot3)
	if not slot2:GetPaintingAction(DialogueStep.PAINTING_ACTION_ROTATE) then
		slot3()

		return
	end

	slot0:TweenRotate(slot1, slot4.value, slot4.dur or 1, slot4.number or 1, slot4.delay or 0, slot3)
end

function slot0.StartPatiningMoveAction(slot0, slot1, slot2, slot3)
	if not slot2:GetPaintingAction(DialogueStep.PAINTING_ACTION_MOVE) then
		slot3()

		return
	end

	slot9 = tf(slot1).localPosition

	slot0:TweenMove(slot1, Vector3(slot9.x + (slot4.x or 0), slot9.y + (slot4.y or 0), 0), slot4.dur or 1, 1, slot4.delay or 0, slot3)
end

function slot0.StartMovePrevPaitingToSide(slot0, slot1, slot2, slot3)
	if not slot1:GetPaintingMoveToSide() or not slot2 then
		slot3()

		return
	end

	if not slot0:GetSideTF(slot2:GetSide()) then
		slot3()

		return
	end

	slot6 = slot4.time

	if not slot0:GetSideTF(slot4.side) then
		slot3()

		return
	end

	if slot5:Find("fitter").childCount > 0 then
		setParent(slot5:Find("fitter"):GetChild(0), slot8:Find("fitter"))

		slot8.localScale = Vector3(slot2:GetPaintingDir(), 1, 1)
	end

	slot0:TweenValue(slot8, slot5.localPosition.x, tf(slot8).localPosition.x, slot6, 0, function (slot0)
		setAnchoredPosition(uv0, {
			x = slot0
		})
	end, slot3)
end

function slot0.AddGlitchArtEffectForPating(slot0, slot1, slot2)
	if slot2:ShouldAddGlitchArtEffect() then
		for slot7 = 0, slot1:GetComponentsInChildren(typeof(Image)).Length - 1 do
			slot8 = slot3[slot7]
			slot8.material = slot0.glitchArtMaterial

			slot8.material:SetFloat("_LineDensity", 7)
			slot0:TweenValueLoop(slot8.gameObject, 0, 2, 2, 0, function (slot0)
				if slot0 >= 1.2 then
					uv0.material:SetFloat("_LineGray", 0.3)
				elseif slot0 >= 1.1 then
					uv0.material:SetFloat("_LineGray", 0.45)
				elseif slot0 >= 1.03 then
					uv0.material:SetFloat("_TearDistance", 0)
				elseif slot0 >= 1 then
					uv0.material:SetFloat("_TearDistance", 0.3)
				elseif slot0 >= 0.35 then
					uv0.material:SetFloat("_LineGray", 0.3)
				elseif slot0 >= 0.3 then
					uv0.material:SetFloat("_LineGray", 0.4)
				elseif slot0 >= 0.25 then
					uv0.material:SetFloat("_LineGray", 0.3)
				elseif slot0 >= 0.2 then
					uv0.material:SetFloat("_LineGray", 0.4)
				end
			end, function ()
			end)
		end
	end
end

function slot0.UpdateContent(slot0, slot1, slot2)
	slot3 = slot1:GetContent()
	slot0.conentTxt.text = slot3

	if slot3 and slot3 ~= "" then
		slot0:UpdateTypeWriter(slot1, slot2)
	else
		slot2()
	end
end

function slot0.GetSideTF(slot0, slot1)
	slot2, slot3, slot4, slot5 = nil

	if DialogueStep.SIDE_LEFT == slot1 then
		slot5 = slot0.subActorLeft
		slot4 = slot0.nameLeftTxt
		slot3 = slot0.nameLeft
		slot2 = slot0.actorLeft
	elseif DialogueStep.SIDE_RIGHT == slot1 then
		slot5 = slot0.subActorRgiht
		slot4 = slot0.nameRightTxt
		slot3 = slot0.nameRight
		slot2 = slot0.actorRgiht
	elseif DialogueStep.SIDE_MIDDLE == slot1 then
		slot5 = slot0.subActorMiddle
		slot4 = slot0.nameLeftTxt
		slot3 = slot0.nameLeft
		slot2 = slot0.actorMiddle
	end

	return slot2, slot3, slot4, slot5
end

function slot0.RecyclesSubPantings(slot0, slot1)
	slot1:each(function (slot0, slot1)
		uv0:RecyclePainting(slot1)
	end)
end

function slot0.RecyclePainting(slot0, slot1)
	function slot2(slot0)
		if slot0:Find("fitter").childCount == 0 then
			return
		end

		if slot0:Find("fitter"):GetChild(0) then
			for slot6 = 0, slot0:GetComponentsInChildren(typeof(Image)).Length - 1 do
				slot7 = slot2[slot6]

				if slot7.material ~= slot7.defaultGraphicMaterial then
					slot7.material = slot7.defaultGraphicMaterial

					slot7.material:SetColor("_Color", Color.white)
				end
			end

			setGray(slot0, false, true)
			retPaintingPrefab(slot0, slot1.name)
		end
	end

	if type(slot1) == "table" then
		for slot6, slot7 in ipairs(slot1) do
			slot2(slot0[slot7])
		end
	else
		slot2(slot1)
	end
end

function slot0.OnEnd(slot0)
	slot0:RecyclePainting({
		"actorLeft",
		"actorMiddle",
		"actorRgiht"
	})

	slot0.conentTxt.text = ""
	slot0.nameLeftTxt.text = ""
	slot0.nameRightTxt.text = ""
end

return slot0
