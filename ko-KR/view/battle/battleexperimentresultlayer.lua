slot0 = class("BattleExperimentResultLayer", import(".BattleContributionResultLayer"))

function slot0.getUIName(slot0)
	return "BattleResultUI"
end

function slot0.setPoint(slot0)
	slot0._contributionPoint = 0
end

function slot0.skip(slot0)
	for slot4, slot5 in ipairs(slot0._delayLeanList) do
		LeanTween.cancel(slot5)
	end

	if slot0._stateFlag == slot0.STATE_RANK_ANIMA then
	elseif slot0._stateFlag == slot0.STATE_REPORT then
		slot1 = slot0._conditionContainer.childCount

		while slot1 > 0 do
			SetActive(slot0._conditionContainer:GetChild(slot1 - 1), true)

			slot1 = slot1 - 1
		end

		SetActive(slot0:findTF("jieuan01/tips", slot0._bg), true)

		slot0._stateFlag = slot0.STATE_REPORTED
	elseif slot0._stateFlag == slot0.STATE_REPORTED then
		slot0:displayBG()
		SetActive(slot0:findTF("jieuan01/tips", slot0._bg), false)
	end
end

function slot0.displayBG(slot0)
	LeanTween.moveX(rtf(slot0._conditions), 1300, slot0.DURATION_MOVE)
	LeanTween.scale(slot0._grade, Vector3(0.6, 0.6, 0), slot0.DURATION_MOVE)
	LeanTween.moveLocal(go(slot1), slot0._gradeUpperLeftPos, slot0.DURATION_MOVE):setOnComplete(System.Action(function ()
		slot0:displayShips()
		slot0.displayShips:showRightBottomPanel()
		triggerButton(slot0._statisticsBtn)
		triggerButton:skipAtkAnima(slot0._atkContainerNext)
		triggerButton.skipAtkAnima:skipAtkAnima(slot0._atkContainer)
		setActive(slot0._statisticsBtn, false)

		setActive._stateFlag = slot0._statisticsBtn.STATE_DISPLAY
	end))
	setActive(slot0:findTF("jieuan01/Bomb", slot0._bg), false)
end

function slot0.closeStatistics(slot0)
	return
end

function slot0.displayShips(slot0)
	slot0._expTFs = {}
	slot0._nameTxts = {}
	slot0._initExp = {}
	slot0._skipExp = {}
	slot0._subSkipExp = {}
	slot0._subCardAnimaFuncList = {}
	slot1 = {}

	for slot6, slot7 in ipairs(slot2) do
		slot1[slot7.id] = slot7
	end

	slot3 = slot0.contextData.statistics

	for slot7, slot8 in ipairs(slot2) do
		if slot3[slot8.id] then
			slot3[slot8.id].vo = slot8
		end
	end

	slot5 = 0

	for slot9, slot10 in ipairs(slot4) do
		if slot3[slot10.id] and slot5 < slot11.output then
			slot0.mvpShipVO = slot10
			slot5 = slot11.output
		end
	end

	slot0._atkFuncs = {}
	slot0._commonAtkTplList = {}
	slot0._subAtkTplList = {}
	slot6, slot7 = nil

	SetActive(slot0._atkToggle, #slot4 > 6)

	if #slot4 > 6 then
		onToggle(slot0, slot0._atkToggle, function (slot0)
			SetActive(slot0._atkContainer, slot0)
			SetActive(slot0._atkContainerNext, not slot0)

			if slot0 then
				slot0:skipAtkAnima(slot0._atkContainerNext)
			else
				slot0:skipAtkAnima(slot0._atkContainer)
			end
		end, SFX_PANEL)
	end

	slot8 = {}
	slot9 = {}

	for slot13, slot14 in ipairs(slot4) do
		slot15 = slot1[slot14.id]

		if slot3[slot14.id] then
			slot17 = table.contains(TeamType.SubShipType, slot16)
			slot18, slot19 = nil
			slot20 = 0

			if slot13 > 6 then
				slot19 = slot0._atkContainerNext
				slot20 = 7
			else
				slot19 = slot0._atkContainer
				slot20 = 1
			end

			cloneTplTo(slot0._atkTpl, slot19).localPosition.x = cloneTplTo(slot0._atkTpl, slot19).localPosition.x + (slot13 - slot20) * 74
			cloneTplTo(slot0._atkTpl, slot19).localPosition.y = cloneTplTo(slot0._atkTpl, slot19).localPosition.y + (slot13 - slot20) * -124
			cloneTplTo(slot0._atkTpl, slot19).localPosition = cloneTplTo(slot0._atkTpl, slot19).localPosition
			slot0:findTF("result/mask/icon", slot18).GetComponent(slot22, typeof(Image)).sprite = LoadSprite("herohrzicon/" .. slot14:getPainting())

			setImageSprite(slot23, slot25, true)
			slot0:setAtkAnima(cloneTplTo(slot0._atkTpl, slot19), slot19, slot3[slot14.id].output / slot5, slot5, slot0.mvpShipVO == slot14, slot3[slot14.id].output, slot3[slot14.id].kill_count)

			if slot14.id == slot3._flagShipID then
				slot0.flagShipVO = slot14
			end
		end
	end
end

return slot0
