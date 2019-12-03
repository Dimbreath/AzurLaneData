slot0 = class("PrayPoolSuccessView", import("..base.BaseSubView"))

function slot0.getUIName(slot0)
	return "PrayPoolSuccessView"
end

function slot0.OnInit(slot0)
	slot0:initData()
	slot0:initUI()
	slot0:updateUI()
	slot0:Show()
end

function slot0.OnDestroy(slot0)
	slot0.buildMsgBox:hide()
end

function slot0.OnBackPress(slot0)
	if isActive(slot0.boxTF) then
		slot0.buildMsgBox:hide()

		return true
	end
end

function slot0.initData(slot0)
	slot0.prayProxy = getProxy(PrayProxy)
	slot0.poolType = slot0.prayProxy:getSelectedPoolType()
	slot0.playerProxy = getProxy(PlayerProxy)
	slot0.bagProxy = getProxy(BagProxy)
	slot0.useItem = pg.ship_data_create_material[1].use_item

	print("useitem " .. slot0.useItem)

	slot0.buildShipProxy = getProxy(BuildShipProxy)
end

function slot0.initUI(slot0)
	slot0.shipTF = {
		slot0:findTF("Ship1"),
		slot0:findTF("Ship2")
	}
	slot0.boxTF = slot0:findTF("build_msg")
	slot0.buildMsgBox = slot0.MsgBox(slot0.boxTF)
	slot0.buildBtn = slot0:findTF("BuildBtn")
	slot0.buildCubeNumText = slot0:findTF("BuildInfo/CubeNum")
	slot0.buildGoldNumText = slot0:findTF("BuildInfo/GoldNum")
	slot0.curCubeNumText = slot0:findTF("CubeImg/NumText")
	slot0.material1 = slot0:findTF("material1")
	slot0.material2 = slot0:findTF("material2")

	onButton(slot0, slot0.buildBtn, function ()
		slot0.buildMsgBox:show(math.max(1, _.min({
			math.floor(slot0.playerProxy:getData().gold / pg.ship_data_create_material[pg.activity_ship_create[slot0.poolType].create_id].use_gold),
			math.floor(slot0.bagProxy:getItemCountById(slot0.useItem) / pg.ship_data_create_material[pg.activity_ship_create[slot0.poolType].create_id].number_1),
			MAX_BUILD_WORK_COUNT - table.getCount(slot5)
		})), function (slot0)
			if slot0 < slot0 or slot1.gold < slot0 * slot2.use_gold or slot3 < slot0 * slot2.number_1 then
				return false
			end

			return true
		end, function (slot0)
			slot0:emit(PrayPoolConst.START_BUILD_SHIP_EVENT, slot1.id, slot0)
		end, function (slot0)
			return i18n("build_ship_tip", slot0, slot0.name, slot1, slot0 * slot0.number_1, (slot1(slot0) and COLOR_GREEN) or COLOR_RED)
		end)
	end, SFX_UI_BUILDING_STARTBUILDING)
end

function slot0.updateUI(slot0)
	slot0:updatePaint(slot1)

	slot2 = nil

	setText(slot0.curCubeNumText, slot0.bagProxy:getItemById(slot0.useItem) or {
		count = 0
	}.count)
	setText(slot0.buildCubeNumText, pg.ship_data_create_material[pg.activity_ship_create[slot0.poolType].create_id].number_1)
	setText(slot0.buildGoldNumText, pg.ship_data_create_material[pg.activity_ship_create[slot0.poolType].create_id].use_gold)
end

function slot0.updatePaint(slot0, slot1)
	for slot5 = 1, 2, 1 do
		setPaintingPrefabAsync(slot11, Ship.getPaintingName(slot6), "build", slot12)
		setImageColor(slot13, slot0.Rarity_To_Light_Color_1[pg.ship_data_statistics[slot1[slot5]].rarity])
		setImageColor(slot14, slot0.Rarity_To_Light_Color_1[pg.ship_data_statistics[slot1[slot5]].rarity])
		setImageColor(slot15, slot0.Rarity_To_Light_Color_1[pg.ship_data_statistics[slot1[slot5]].rarity])
		setImageColor(slot16, slot0.Rarity_To_Light_Color_2[pg.ship_data_statistics[slot1[slot5]].rarity])
		setText(slot17, slot7)
		setText(slot18, slot8)
		setImageSprite(slot0:findTF("Rarity/NumImg", slot10), GetSpriteFromAtlas("ui/praybuildsuccesspage_atlas", "ratio_" .. pg.ship_data_statistics[slot1[slot5]].rarity), true)
	end
end

function slot0.MsgBox(slot0)
	pg.DelegateInfo.New(slot1)

	function slot2(slot0, slot1)
		slot0.valueTxt.text = slot0

		if slot1 then
			slot0.text.text = slot1(slot0)
		else
			slot0.text.text = ""
		end
	end

	return {
		_go = slot0,
		__cname = "buildmsgbox",
		_tf = tf(slot0),
		inited = false,
		cancenlBtn = findTF(()["_go"], "window/btns/cancel_btn"),
		confirmBtn = findTF(()["_go"], "window/btns/confirm_btn"),
		closeBtn = findTF(()["_go"], "window/close_btn"),
		count = 1,
		minusBtn = findTF(()["_go"], "window/content/calc_panel/minus"),
		addBtn = findTF(()["_go"], "window/content/calc_panel/add"),
		maxBtn = findTF(()["_go"], "window/content/max"),
		valueTxt = findTF(()["_go"], "window/content/calc_panel/Text"):GetComponent(typeof(Text)),
		text = findTF(()["_go"], "window/content/Text"):GetComponent(typeof(Text)),
		buildUI = slot0.parent,
		active = false,
		init = function (slot0)
			slot0.inited = true

			onButton(slot0, slot0._tf, function ()
				slot0:hide()
			end, SFX_PANEL)
			onButton(slot0, slot0.cancenlBtn, function ()
				slot0:hide()
			end, SFX_PANEL)
			onButton(slot0, slot0.confirmBtn, function ()
				if slot0.onConfirm then
					slot0.onConfirm(slot0.count)
				end

				slot0:hide()
			end, SFX_PANEL)
			onButton(slot0, slot0.closeBtn, function ()
				slot0:hide()
			end, SFX_PANEL)
			onButton(slot0, slot0.minusBtn, function ()
				if slot0:verifyCount(slot0.count - 1) then
					slot0.count = math.max(slot0.count - 1, 1)

					math.max(slot0.count - 1, 1)(slot0.count, slot0.updateText)
				end
			end, SFX_PANEL)
			onButton(slot0, slot0.addBtn, function ()
				if slot0:verifyCount(slot0.count + 1) then
					slot0.count = math.min(slot0.count + 1, slot0.max)

					math.min(slot0.count + 1, slot0.max)(slot0.count, slot0.updateText)
				end
			end, SFX_PANEL)
			onButton(slot0, slot0.maxBtn, function ()
				if slot0:verifyCount(slot0.max) then
					slot0.count = slot0.max

					slot0.max(slot0.count, slot0.updateText)
				end
			end, SFX_PANEL)
		end,
		verifyCount = function (slot0, slot1)
			if slot0.verify then
				return slot0.verify(slot1)
			end

			return true
		end,
		isActive = function (slot0)
			return slot0.active
		end,
		show = function (slot0, slot1, slot2, slot3, slot4)
			slot0.verify = slot2
			slot0.onConfirm = slot3
			slot0.active = true
			slot0.max = slot1 or 1
			slot0.count = 1
			slot0.updateText = slot4

			slot0(slot0.count, slot4)
			setActive(slot1._go, true)

			if not slot0.inited then
				slot0:init()
			end

			pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
		end,
		hide = function (slot0)
			if slot0:isActive() then
				slot0.onConfirm = nil
				slot0.active = false
				slot0.updateText = nil
				slot0.count = 1
				slot0.max = 1
				slot0.verify = nil

				setActive(slot0._go, false)
				pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0.buildUI)
			end
		end,
		close = function (slot0)
			slot0:hide()
			pg.DelegateInfo.Dispose(slot0)
		end
	}
end

slot0.Rarity_To_Light_Color_1 = {
	[2] = Color(0.5568627450980392, 0.5568627450980392, 0.5568627450980392, 1),
	[3] = Color(0.1568627450980392, 0.26666666666666666, 0.615686274509804, 1),
	[4] = Color(0.32941176470588235, 0.1568627450980392, 0.615686274509804, 1),
	[5] = Color(1, 0.8313725490196079, 0.3137254901960784, 1)
}
slot0.Rarity_To_Light_Color_2 = {
	[2] = Color(0.6235294117647059, 0.6549019607843137, 0.7411764705882353, 1),
	[3] = Color(0.34901960784313724, 0.5294117647058824, 0.996078431372549, 1),
	[4] = Color(0.9058823529411765, 0.615686274509804, 0.996078431372549, 1),
	[5] = Color(0.996078431372549, 0.8705882352941177, 0.3215686274509804, 1)
}

return slot0
