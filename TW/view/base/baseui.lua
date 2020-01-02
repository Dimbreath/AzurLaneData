slot0 = class("BaseUI", import("view.base.BaseEventLogic"))
slot0.LOADED = "BaseUI:LOADED"
slot0.DID_ENTER = "BaseUI:DID_ENTER"
slot0.AVALIBLE = "BaseUI:AVALIBLE"
slot0.DID_EXIT = "BaseUI:DID_EXIT"
slot0.ON_BACK = "BaseUI:ON_BACK"
slot0.ON_HOME = "BaseUI:ON_HOME"
slot0.ON_CLOSE = "BaseUI:ON_CLOSE"
slot0.ON_DROP = "BaseUI.ON_DROP"
slot0.ON_DROP_LIST = "BaseUI.ON_DROP_LIST"
slot0.ON_ITEM = "BaseUI:ON_ITEM"
slot0.ON_SHIP = "BaseUI:ON_SHIP"
slot0.ON_AWARD = "BaseUI:ON_AWARD"
slot0.ON_ACHIEVE = "BaseUI:ON_ACHIEVE"
slot0.ON_EQUIPMENT = "BaseUI:ON_EQUIPMENT"
slot0.ON_SHIP_EXP = "BaseUI.ON_SHIP_EXP"
slot0.ON_BACK_PRESSED = "BaseUI:ON_BACK_PRESS"

function slot0.Ctor(slot0)
	slot0.super.Ctor(slot0)

	slot0._isLoaded = false
	slot0._go = nil
	slot0._tf = nil
end

function slot0.setContextData(slot0, slot1)
	slot0.contextData = slot1
end

function slot0.getUIName(slot0)
	return nil
end

function slot0.getGroupName(slot0)
	return nil
end

function slot0.getBGM(slot0)
	return nil
end

function slot0.preload(slot0, slot1)
	slot1()
end

function slot0.loadUISync(slot0, slot1)
	LoadAndInstantiateSync("UI", slot1, true, false).transform:SetParent(pg.UIMgr.GetInstance().UIMain.transform, false)

	return LoadAndInstantiateSync("UI", slot1, true, false)
end

function slot0.load(slot0)
	slot1 = nil
	slot2 = Time.realtimeSinceStartup

	seriesAsync({
		function (slot0)
			PoolMgr.GetInstance():GetUI(slot0:getUIName(), true, function (slot0)
				slot0 = slot0

				slot1()
			end)
		end,
		function (slot0)
			slot0:preload(slot0)
		end
	}, function ()
		print("load " .. slot0.name .. " time cost: " .. Time.realtimeSinceStartup - "load ")
		slot0.transform:SetParent(pg.UIMgr.GetInstance().UIMain.transform, false)
		slot0:SetActive(true)
		slot0:onUILoaded(pg.UIMgr.GetInstance().UIMain)
		slot0:PlayBGM()
	end)
end

function slot0.PlayBGM(slot0)
	if slot0:getBGM() and slot0.bgm ~= slot1 then
		playBGM(slot1)

		slot0.bgm = slot1
	end
end

function slot0.isLoaded(slot0)
	return slot0._isLoaded
end

function slot0.getGroupNameFromData(slot0)
	slot1 = nil

	return (slot0.contextData == nil or not slot0.contextData.LayerWeightMgr_groupName or slot0.contextData.LayerWeightMgr_groupName) and slot0:getGroupName()
end

function slot0.getWeightFromData(slot0)
	slot1 = nil

	if slot0.contextData ~= nil and slot0.contextData.LayerWeightMgr_weight then
		slot1 = slot0.contextData.LayerWeightMgr_weight
	end

	return slot1
end

function slot0.isLayer(slot0)
	return slot0.contextData ~= nil and slot0.contextData.isLayer
end

function slot0.addToLayerMgr(slot0)
	pg.LayerWeightMgr.GetInstance():Add2Overlay(LayerWeightConst.UI_TYPE_SYSTEM, slot0._tf, {
		globalBlur = false,
		groupName = slot0:getGroupNameFromData(),
		weight = slot0:getWeightFromData()
	})
end

function slot0.onUILoaded(slot0, slot1)
	slot0._go = slot1
	slot0._tf = slot1 and slot1.transform
	slot0.animTF = slot0:findTF("blur_panel")

	if slot0:isLayer() then
		slot0:addToLayerMgr()
	end

	pg.SeriesGuideMgr.GetInstance():dispatch({
		view = slot0.__cname
	})

	slot0._isLoaded = true

	pg.DelegateInfo.New(slot0)

	slot0.optionBtns = {
		slot0:findTF("top/option"),
		slot0:findTF("top/left_top/option"),
		slot0:findTF("blur_container/top/title/option"),
		slot0:findTF("blur_container/top/option"),
		slot0:findTF("top/top_chapter/option"),
		slot0:findTF("top/top/option"),
		slot0:findTF("common/top/option"),
		slot0:findTF("blur_panel/top/option"),
		slot0:findTF("blurPanel/top/option"),
		slot0:findTF("blur_container/top/option"),
		slot0:findTF("top/title/option"),
		slot0:findTF("blur_panel/adapt/top/option"),
		slot0:findTF("mainPanel/top/option"),
		slot0:findTF("bg/top/option"),
		slot0:findTF("blur_container/adapt/top/title/option"),
		slot0:findTF("blur_container/adapt/top/option"),
		slot0:findTF("ForNorth/top/option")
	}

	slot0:init()
	setActive(slot0._tf, not slot0.event:chectConnect(slot0.LOADED))
	slot0:emit(slot0.LOADED)
end

function slot0.onUIAnimEnd(slot0, slot1)
	slot1()
end

function slot0.init(slot0)
	return
end

function slot0.quckExitFunc(slot0)
	slot0:emit(slot0.ON_HOME)
end

function slot0.quickExit(slot0)
	for slot4, slot5 in pairs(slot0.optionBtns) do
		if not IsNil(slot5) then
			onButton(slot0, slot5, function ()
				slot0:quckExitFunc()
			end, SFX_PANEL)
		end
	end
end

function slot0.enter(slot0)
	slot0:quickExit()
	slot0:prepareAnimtion()
	setActive(slot0._tf, true)

	function slot1()
		slot0:emit(slot1.DID_ENTER)
		slot0.emit:didEnter()
		slot0.emit.didEnter:emit(slot1.AVALIBLE)
		slot0.emit.didEnter.emit:onUIAnimEnd(function ()
			pg.SeriesGuideMgr.GetInstance():start({
				view = slot0.__cname,
				code = {
					pg.SeriesGuideMgr.CODES.MAINUI
				}
			})
			pg.GuideMgr.GetInstance():onSceneAnimDone({
				view = slot0.__cname
			})
		end)
	end

	slot2 = false

	if slot0.animTF ~= nil then
		slot4 = slot0.animTF:GetComponent(typeof(UIEventTrigger))

		if slot0.animTF:GetComponent(typeof(Animation)) ~= nil and slot4 ~= nil then
			if slot3:get_Item("enter") == nil then
				print("cound not found enter animation")
			else
				slot3:Play("enter")
			end
		elseif slot3 ~= nil then
			print("cound not found [UIEventTrigger] component")
		elseif slot4 ~= nil then
			print("cound not found [Animation] component")
		end
	end

	if not slot2 then
		slot1()
	end
end

function slot0.prepareAnimtion(slot0)
	if slot0.animTF then
		slot2 = slot0.animTF:Find("top_bg")
		slot3 = slot0.animTF:Find("adapt/left_length")

		if slot0.animTF:Find("adapt/top") and slot2 then
			setAnchoredPosition(slot1, Vector2(slot1.anchoredPosition.x, 180))
			setAnchoredPosition(slot2, Vector2(slot2.anchoredPosition.x, 180))
		end

		if slot3 then
			setAnchoredPosition(slot3, Vector2(-180, slot3.anchoredPosition.y))
		end
	end
end

function slot0.didEnter(slot0)
	return
end

function slot0.closeView(slot0)
	if slot0.contextData.isLayer then
		slot0:emit(slot0.ON_CLOSE)
	else
		slot0:emit(slot0.ON_BACK)
	end
end

function slot0.willExit(slot0)
	return
end

function slot0.exit(slot0)
	slot0.exited = true

	pg.DelegateInfo.Dispose(slot0)

	function slot1()
		slot0:willExit()
		slot0.willExit:detach()
		pg.GuideMgr.GetInstance():onSceneExit({
			view = slot0.__cname
		})
		pg.GuideMgr.GetInstance().onSceneExit:emit(slot1.DID_EXIT)
	end

	if not false then
		slot1()
	end
end

function slot0.attach(slot0, slot1)
	return
end

function slot0.detach(slot0, slot1)
	slot0._isLoaded = false

	pg.LayerWeightMgr.GetInstance():DelFromOverlay(slot0._tf)
	pg.DynamicBgMgr.GetInstance():ClearBg(slot0:getUIName())
	slot0:disposeEvent()
	slot0:cleanManagedTween()

	slot0._tf = nil

	PoolMgr.GetInstance():DelTempCache(slot0:getUIName())

	if slot0._go ~= nil and slot3 then
		slot2:ReturnUI(slot3, slot0._go)

		slot0._go = nil
	end
end

function slot0.findGO(slot0, slot1, slot2)
	return findGO(slot2 or slot0._go, slot1)
end

function slot0.findTF(slot0, slot1, slot2)
	return findTF(slot2 or slot0._tf, slot1)
end

function slot0.getTpl(slot0, slot1, slot2)
	slot3 = slot0:findTF(slot1, slot2)

	slot3:SetParent(slot0._tf, false)
	SetActive(slot3, false)

	return slot3
end

function slot0.setSpriteTo(slot0, slot1, slot2, slot3)
	slot2:GetComponent(typeof(Image)).sprite = slot0:findTF(slot1):GetComponent(typeof(Image)).sprite

	if slot3 then
		slot4:SetNativeSize()
	end
end

function slot0.setImageAmount(slot0, slot1, slot2)
	slot1:GetComponent(typeof(Image)).fillAmount = slot2
end

function slot0.onBackPressed(slot0)
	slot0:emit(slot0.ON_BACK_PRESSED)
end

return slot0
