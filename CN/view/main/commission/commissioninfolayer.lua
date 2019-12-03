slot0 = class("CommissionInfoLayer", import("...base.BaseUI"))

function slot0.getUIName(slot0)
	return "CommissionInfoUI"
end

function slot0.setProxies(slot0, slot1, slot2, slot3)
	slot0.eventProxy = slot1
	slot0.navalAcademyProxy = slot2
	slot0.technologyProxy = slot3
end

function slot0.init(slot0)
	slot0.frame = slot0:findTF("frame")
	slot0.resourcesTF = slot0:findTF("resources", slot0.frame)
	slot0.oilTF = slot0:findTF("canteen/bubble/Text", slot0.resourcesTF):GetComponent(typeof(Text))
	slot0.goldTF = slot0:findTF("merchant/bubble/Text", slot0.resourcesTF):GetComponent(typeof(Text))
	slot0.oilbubbleTF = slot0:findTF("canteen/bubble", slot0.resourcesTF)
	slot0.goldbubbleTF = slot0:findTF("merchant/bubble", slot0.resourcesTF)
	slot0.projectContainer = slot0:findTF("main/content", slot0.frame)

	pg.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {
		weight = LayerWeightConst.SECOND_LAYER
	})

	slot0.linkBtnPanel = slot0:findTF("frame/link_btns")
	slot0.activityInsBtn = slot0:findTF("frame/link_btns/ins")
end

function slot0.NotifyIns(slot0, slot1)
	setActive(slot0.activityInsBtn, slot1:ExistMsg())

	if slot1.ExistMsg() then
		onButton(slot0, slot0.activityInsBtn, function ()
			slot0:emit(CommissionInfoMediator.ON_INS)
		end, SFX_PANEL)
	end
end

function slot0.UpdateLinkPanel(slot0)
	slot1 = false

	for slot5 = 1, slot0.linkBtnPanel.childCount, 1 do
		if isActive(slot0.linkBtnPanel:GetChild(slot5 - 1)) then
			slot1 = true

			break
		end
	end

	setActive(slot0.linkBtnPanel, slot1)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.oilbubbleTF, function ()
		if LeanTween.isTweening(go(slot0.frame)) then
			return
		end

		slot0:emit(CommissionInfoMediator.GET_OIL_RES)
	end, SFX_PANEL)
	onButton(slot0, slot0.goldbubbleTF, function ()
		if LeanTween.isTweening(go(slot0.frame)) then
			return
		end

		slot0:emit(CommissionInfoMediator.GET_GOLD_RES)
	end, SFX_PANEL)
	onButton(slot0, slot0._tf, function ()
		if LeanTween.isTweening(go(slot0.frame)) then
			return
		end

		if slot0.contextData.inFinished then
			return
		end

		slot0:emit(slot1.ON_CLOSE)
	end, SOUND_BACK)
	slot0:initProjects()
end

function slot0.initProjects(slot0)
	slot0.projectCards = {}

	for slot5, slot6 in ipairs(slot1) do
		slot7 = CommissionCard.New(slot0, slot6)
		slot0.projectCards[slot6[1]] = slot7

		slot7:update()
		onToggle(slot0, slot7.toggle, function (slot0)
			slot0:updateTips(slot0)

			if slot0 then
				slot1, slot2 = nil

				if slot0._type == CommissionCard.TYPE_TECHNOLOGY then
					slot1, slot2 = pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getData().level, "TechnologyMediator")
				else
					slot1 = true
				end

				if not slot1 then
					pg.TipsMgr.GetInstance():ShowTips(slot2)
					triggerToggle(slot0.toggle)

					return
				end

				slot1.projectContainer.localPosition = Vector3(slot1.projectContainer.localPosition.x, math.abs(slot0._tf.localPosition.y), 0)
			end
		end, SFX_PANEL)
		onButton(slot0, slot7.goBtn, function ()
			if slot0._type == CommissionCard.TYPE_EVENT then
				slot1:emit(CommissionInfoMediator.ON_ACTIVE_EVENT)
			elseif slot0._type == CommissionCard.TYPE_CLASS then
				slot1:emit(CommissionInfoMediator.ON_ACTIVE_CLASS)
			elseif slot0._type == CommissionCard.TYPE_TECHNOLOGY then
				slot1:emit(CommissionInfoMediator.ON_ACTIVE_TECH)
			end
		end, SFX_PANEL)
	end
end

function slot0.updateProject(slot0, slot1)
	slot0.projectCards[slot1]:update()
end

function slot0.setPlayer(slot0, slot1)
	slot0.playerVO = slot1

	slot0:updateResource(slot1)
end

function slot0.updateResource(slot0, slot1)
	setActive(slot0.oilbubbleTF, slot1.oilField ~= 0)
	setActive(slot0.goldbubbleTF, slot1.goldField ~= 0)

	slot0.oilTF.text = slot1.oilField
	slot0.goldTF.text = slot1.goldField
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)
	triggerButton(slot0._tf)
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)

	for slot4, slot5 in pairs(slot0.projectCards) do
		slot5:dispose()
	end
end

return slot0
