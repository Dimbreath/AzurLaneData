slot0 = class("PrayPoolSelectPoolView", import("..base.BaseSubView"))

function slot0.getUIName(slot0)
	return "PrayPoolSelectPoolView"
end

function slot0.OnInit(slot0)
	slot0:initData()
	slot0:initUI()
	slot0:updateUI()
end

function slot0.OnDestroy(slot0)
	return
end

function slot0.OnBackPress(slot0)
	return
end

function slot0.initData(slot0)
	slot0.prayProxy = getProxy(PrayProxy)
	slot0.poolToggleList = {}
	slot0.selectedPoolType = nil
end

function slot0.initUI(slot0)
	slot0.poolListContainer = slot0:findTF("PoolList")
	slot0.poolTpl = slot0:findTF("PoolTpl")
	slot0.preBtn = slot0:findTF("PreBtn")
	slot0.nextBtn = slot0:findTF("NextBtn")
	slot0.nextBtnCom = GetComponent(slot0.nextBtn, "Button")
	slot0.poolList = UIItemList.New(slot0.poolListContainer, slot0.poolTpl)

	slot0.poolList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setImageSprite(slot4, GetSpriteFromAtlas("ui/prayselectpoolpage_atlas", "pool" .. slot3, true))
			onToggle(slot0, slot2, function (slot0)
				if slot0 then
					slot0.nextBtnCom.interactable = true
					slot0.selectedPoolType = slot0

					slot0.prayProxy:setSelectedPoolNum(slot0.prayProxy.setSelectedPoolNum)
				else
					slot0.nextBtnCom.interactable = false
					slot0.selectedPoolType = nil

					slot0.prayProxy:setSelectedPoolNum(nil)
				end
			end, SFX_PANEL)

			slot0.poolToggleList[slot1 + 1] = slot2
		end
	end)
	slot0.poolList:align(#pg.activity_ship_create.all)

	slot0.nextBtnCom.interactable = false

	onButton(slot0, slot0.preBtn, function ()
		slot0.prayProxy:updatePageState(PrayProxy.STATE_HOME)
		slot0.prayProxy.updatePageState:emit(PrayPoolConst.SWITCH_TO_HOME_PAGE, PrayProxy.STATE_HOME)
	end, SFX_PANEL)
	onButton(slot0, slot0.nextBtn, function ()
		slot0.prayProxy:updateSelectedPool(slot0.selectedPoolType)
		slot0.prayProxy.updateSelectedPool.prayProxy:updatePageState(PrayProxy.STAGE_SELECT_SHIP)
		slot0.prayProxy.updateSelectedPool.prayProxy.updatePageState:emit(PrayPoolConst.SWITCH_TO_SELECT_SHIP_PAGE, PrayProxy.STAGE_SELECT_SHIP)
	end, SFX_PANEL)
	slot0:Show()
end

function slot0.updateUI(slot0)
	if slot0.prayProxy:getSelectedPoolType() then
		triggerToggle(slot0.poolToggleList[slot1], true)
	else
		return
	end
end

return slot0
