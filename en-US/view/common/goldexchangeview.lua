slot0 = class("GoldExchangeView", import("..base.BaseUI"))
slot0.itemid1 = 12
slot0.itemid2 = 24
slot0.const = 5
slot0.goldNum = {
	[1.0] = 3000,
	[2.0] = 15000
}
slot0.gemNum = {
	[1.0] = 100,
	[2.0] = 450
}

function slot0.Ctor(slot0)
	slot0.super.Ctor(slot0)
	PoolMgr.GetInstance():GetUI("GoldExchangeWindow", false, function (slot0)
		slot0.transform:SetParent(pg.UIMgr.GetInstance().UIMain.transform, false)
		slot0:onUILoaded(slot0)
	end)
end

function slot0.init(slot0)
	slot0:initData()
	slot0:initUI()
	slot0:addListener()
	slot0:overLayMyself(true)
	slot0:updateView()
end

function slot0.willExit(slot0)
	slot0:overLayMyself(false)
	PoolMgr.GetInstance():ReturnUI("GoldExchangeWindow", slot0._go)

	pg.goldExchangeMgr = nil
end

function slot0.initData(slot0)
	slot0.selectedIndex = 1
	slot0.selectedNum = 1
	slot0.selectedMax = 10
	slot0.player = getProxy(PlayerProxy):getData()
end

function slot0.initUI(slot0)
	slot0.bg = slot0:findTF("BG")
	slot0.btnBack = slot0:findTF("Window/top/btnBack")
	slot0.contentTF = slot0:findTF("Window/Content")
	slot0.goldTF = {
		{}
	}
	slot0.goldTF_1 = slot0:findTF("Gold1", slot0.contentTF)
	slot0.goldTF[1].itemTF = slot0.goldTF_1
	slot0.goldTF[1].countTF = slot0:findTF("item/icon_bg/count", slot0.goldTF_1)
	slot0.goldTF[1].priceTF = slot0:findTF("item/consume/contain/price", slot0.goldTF_1)
	slot0.goldTF[1].selectedTF = slot0:findTF("item/selected", slot0.goldTF_1)
	slot0.goldTF[1].selectedNumTF = slot0:findTF("reduce/Text", slot0.goldTF[1].selectedTF)

	setText(slot0.goldTF[1].countTF, slot0.goldNum[1])
	setText(slot0.goldTF[1].priceTF, slot0.gemNum[1])

	slot0.goldTF[2] = {}
	slot0.goldTF_2 = slot0:findTF("Gold2", slot0.contentTF)
	slot0.goldTF[2].itemTF = slot0.goldTF_2
	slot0.goldTF[2].countTF = slot0:findTF("item/icon_bg/count", slot0.goldTF_2)
	slot0.goldTF[2].priceTF = slot0:findTF("item/consume/contain/price", slot0.goldTF_2)
	slot0.goldTF[2].selectedTF = slot0:findTF("item/selected", slot0.goldTF_2)
	slot0.goldTF[2].selectedNumTF = slot0:findTF("reduce/Text", slot0.goldTF[2].selectedTF)

	setText(slot0.goldTF[2].countTF, slot0.goldNum[2])
	setText(slot0.goldTF[2].priceTF, slot0.gemNum[2])

	slot0.gemCountText = slot0:findTF("Tip/DiamondCount", slot0.contentTF)
	slot0.goldCountText = slot0:findTF("Tip/GoldCount", slot0.contentTF)
	slot0.shopBtn = slot0:findTF("Window/button_container/ShopBtn")
	slot0.confirmBtn = slot0:findTF("Window/button_container/ConfirmBtn")
end

function slot0.addListener(slot0)
	onButton(slot0, slot0.bg, function ()
		slot0:exit()
	end, SFX_CANCEL)
	onButton(slot0, slot0.btnBack, function ()
		slot0:exit()
	end, SFX_CANCEL)
	onButton(slot0, slot0.shopBtn, function ()
		if getProxy(ContextProxy):getContextByMediator(ChargeMediator) then
			slot0:exit()
		else
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
				wrap = ChargeScene.TYPE_ITEM
			})
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.confirmBtn, function ()
		if slot0.selectedIndex == 1 then
			slot0 = slot1.itemid1
		elseif slot0.selectedIndex == 2 then
			slot0 = slot1.itemid2
		end

		pg.m02:sendNotification(GAME.SHOPPING, {
			id = slot0,
			count = slot0.selectedNum
		})
		slot0:exit()
	end, SFX_PANEL)

	for slot4 = 1, 2, 1 do
		onButton(slot0, slot0.goldTF[slot4].itemTF, function ()
			if slot0.selectedIndex == slot1 then
				slot0.selectedNum = math.min(slot0.selectedNum + 1, slot0.selectedMax)
			else
				slot0.selectedIndex = slot1
				slot0.selectedNum = 1
			end

			slot0:updateView()
		end, SFX_PANEL)
		onButton(slot0, slot0.goldTF[slot4].selectedTF, function ()
			if slot0.selectedNum > 1 then
				slot0.selectedNum = slot0.selectedNum - 1

				slot0:updateView()
			end
		end, SFX_PANEL)
	end
end

function slot0.updateView(slot0)
	for slot4 = 1, 2, 1 do
		setActive(slot0.goldTF[slot4].selectedTF, slot4 == slot0.selectedIndex)
		setActive(slot0.goldTF[3 - slot4].selectedTF, slot4 ~= slot0.selectedIndex)

		if slot4 == slot0.selectedIndex then
			setText(slot0.goldTF[slot4].selectedNumTF, slot0.selectedNum)
		end
	end

	slot1, slot2 = nil
	slot2 = slot0.goldNum[slot0.selectedIndex] * slot0.selectedNum

	setText(slot0.gemCountText, slot0.gemNum[slot0.selectedIndex] * slot0.selectedNum)

	if slot0.player:getTotalGem() < slot0.gemNum[slot0.selectedIndex] * slot0.selectedNum then
		setTextColor(slot0.gemCountText, Color.red)
	else
		setTextColor(slot0.gemCountText, Color.yellow)
	end

	setText(slot0.goldCountText, slot2)
end

function slot0.overLayMyself(slot0, slot1)
	if slot1 == true then
		pg.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {
			weight = LayerWeightConst.TOP_LAYER
		})
	else
		pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
	end
end

return slot0
