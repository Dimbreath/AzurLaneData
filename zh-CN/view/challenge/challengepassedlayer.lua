slot0 = class("ChallengePassedLayer", import("..base.BaseUI"))
slot0.BOSS_NUM = 5
slot0.GROW_TIME = 0.55

function slot0.getUIName(slot0)
	return "ChallengePassedUI"
end

function slot0.init(slot0)
	slot0:findUI()
	slot0:initData()
	slot0:addListener()
end

function slot0.didEnter(slot0)
	slot0.tweenObjs = {}

	pg.UIMgr.GetInstance():OverlayPanel(slot0._tf)
	slot0:updatePainting(slot0.paintingName, slot0.paintingTF, slot0.paintingShadow1, true)

	if slot0.paintingNamemNext then
		slot0:updatePainting(slot0.paintingNamemNext, slot0.paintingNextTF, slot0.paintingNextShadow1)
	end

	slot0:updateSlider(slot0.curIndex)
	slot0:moveSlider(slot0.curIndex)
	onButton(slot0, slot0._tf, function ()
		slot0:emit(slot1.ON_CLOSE)
	end)
	slot0._tf:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)
		slot0:emit(slot1.ON_CLOSE)
	end)
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0._tf)
	LeanTween.cancel(go(slot0.slider))

	for slot4, slot5 in ipairs(slot0.tweenObjs) do
		LeanTween.cancel(slot5)
	end

	slot0.tweenObjs = {}
end

function slot0.onBackPressed(slot0)
	triggerButton(slot0._tf)
end

function slot0.findUI(slot0)
	slot0.bg = slot0:findTF("BG")
	slot0.paintingTF = slot0:findTF("Painting")
	slot0.paintingShadow1 = slot0:findTF("Painting/PaintingShadow1")
	slot0.paintingNextTF = slot0:findTF("PaintingNext")
	slot0.paintingNextShadow1 = slot0:findTF("PaintingNext/PaintingShadow1")
	slot0.material1 = slot0:findTF("material1"):GetComponent(typeof(Image)).material
	slot0.slider = slot0:findTF("Slider")
	slot0.squareContainer = slot0:findTF("SquareList", slot0.slider)
	slot0.squareTpl = slot0:findTF("Squre", slot0.slider)
	slot0.squareList = UIItemList.New(slot0.squareContainer, slot0.squareTpl)
	slot0.sliderSC = GetComponent(slot0.slider, "Slider")
end

function slot0.initData(slot0)
	slot0.curIndex = getProxy(ChallengeProxy):getUserChallengeInfo(slot1).getLevel(slot2)

	if slot0.curIndex % ChallengeConst.BOSS_NUM == 0 then
		slot3 = ChallengeConst.BOSS_NUM
	end

	slot5 = slot2:getDungeonIDList()[slot3]
	slot6 = 0

	if slot1 == ChallengeProxy.MODE_CASUAL and slot3 ~= ChallengeConst.BOSS_NUM then
		slot6 = slot4[slot3 + 1]
	end

	slot0.paintingName = pg.expedition_challenge_template[slot5].char_icon[1]

	if ((slot3 ~= ChallengeConst.BOSS_NUM or slot2:getNextInfiniteDungeonIDList()[1]) and slot4[slot3 + 1]) ~= 0 then
		slot0.paintingNamemNext = pg.expedition_challenge_template[slot6].char_icon[1]
	end
end

function slot0.addListener(slot0)
	onButton(slot0, slot0._tf, function ()
		LeanTween.cancel(go(slot0.slider))
		LeanTween.cancel:emit(slot1.ON_CLOSE)
	end, SFX_CANCEL)
end

function slot0.updatePainting(slot0, slot1, slot2, slot3, slot4)
	function slot5(slot0)
		slot0.material:SetFloat("_LineGray", 0.3)
		slot0.material:SetFloat("_TearDistance", 0)
		LeanTween.cancel(slot0.gameObject)
		table.insert(slot0.tweenObjs, slot0.gameObject)
		LeanTween.value(slot0.gameObject, 0, 2, 2):setLoopClamp():setOnUpdate(System.Action_float(function (slot0)
			if slot0 >= 1.2 then
				slot0.material:SetFloat("_LineGray", 0.3)
			elseif slot0 >= 1.1 then
				slot0.material:SetFloat("_LineGray", 0.45)
			elseif slot0 >= 1.03 then
				slot0.material:SetFloat("_TearDistance", 0)
			elseif slot0 >= 1 then
				slot0.material:SetFloat("_TearDistance", 0.3)
			elseif slot0 >= 0.35 then
				slot0.material:SetFloat("_LineGray", 0.3)
			elseif slot0 >= 0.3 then
				slot0.material:SetFloat("_LineGray", 0.4)
			elseif slot0 >= 0.25 then
				slot0.material:SetFloat("_LineGray", 0.3)
			elseif slot0 >= 0.2 then
				slot0.material:SetFloat("_LineGray", 0.4)
			end
		end))
	end

	setPaintingPrefabAsync(slot2, slot1, "chuanwu", function ()
		if slot0:findTF("fitter", slot0):GetChild(0) then
			slot1 = GetComponent(slot0, "MeshImage")

			if slot0 then
				slot1.material = slot0.material1

				slot1.material:SetFloat("_LineDensity", 7)
				slot1:material()
			end
		end
	end)
	setPaintingPrefabAsync(slot3, slot1, "chuanwu", function ()
		if slot0:findTF("fitter", slot0):GetChild(0) then
			slot0:GetComponent("Image").color = Color.New(1, 1, 1, 0.15)
		end

		slot1.localScale = Vector3(2.2, 2.2, 1)
	end)
end

function slot0.updateSlider(slot0, slot1)
	if ChallengeConst.BOSS_NUM < (slot1 or slot0.curIndex) then
		slot0.sliderSC.value = (((slot2 % ChallengeConst.BOSS_NUM == 0 and ChallengeConst.BOSS_NUM) or slot2 % ChallengeConst.BOSS_NUM) - 1) * 1 / (ChallengeConst.BOSS_NUM - 1)

		slot0.squareList:make(function (slot0, slot1, slot2)
			slot3 = slot0:findTF("UnFinished", slot2)
			slot4 = slot0:findTF("Finished", slot2)
			slot5 = slot0:findTF("Challengeing", slot2)
			slot6 = slot0:findTF("Arrow", slot2)

			function slot7()
				setActive(setActive, true)
				setActive(setActive, false)
				setActive(false, false)
			end

			function slot8()
				setActive(setActive, false)
				setActive(setActive, true)
				setActive(true, false)
			end

			function slot9()
				setActive(setActive, false)
				setActive(setActive, false)
				setActive(false, true)
			end

			if slot0 == UIItemList.EventUpdate then
				if slot1 + 1 < slot1 then
					setActive(slot6, false)
					slot7()
				elseif slot1 + 1 == slot1 then
					setActive(slot6, true)
					slot9()
				elseif slot1 < slot1 + 1 then
					setActive(slot6, false)
					slot8()
				end
			end
		end)
		slot0.squareList:align(ChallengeConst.BOSS_NUM)

		return
	end
end

function slot0.moveSlider(slot0, slot1)
	if ChallengeConst.BOSS_NUM < (slot1 or slot0.curIndex) then
		slot2 = (slot2 % ChallengeConst.BOSS_NUM == 0 and ChallengeConst.BOSS_NUM) or slot2 % ChallengeConst.BOSS_NUM

		LeanTween.value(go(slot0.slider), slot4, slot5, slot0.GROW_TIME):setDelay(1.4):setOnUpdate(System.Action_float(function (slot0)
			slot0.sliderSC.value = slot0
		end)):setOnComplete(System.Action(function ()
			slot0:updateSlider(slot1 + 1)
		end))

		return
	end
end

return slot0
