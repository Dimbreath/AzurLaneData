slot0 = class("MonthCardSetLayer", import("..base.BaseUI"))
slot0.PIECES = 100

slot0.getUIName = function (slot0)
	return "MonthCardSetUI"
end

slot0.setPlayer = function (slot0, slot1)
	slot0.player = slot1
end

slot0.setRatio = function (slot0, slot1)
	slot0.ratio = math.clamp(slot1, 0, slot0.PIECES)
end

slot0.init = function (slot0)
	slot0.name = slot0:findTF("window/bg/name")
	slot0.desc = slot0:findTF("window/bg/desc")
	slot0.oil = slot0:findTF("window/black/oil/icon_bg/count")
	slot0.gold = slot0:findTF("window/black/gold/icon_bg/count")
	slot0.slider = slot0:findTF("window/black/slider")
	slot0.rate = slot0:findTF("window/black/misc/rate")
	slot0.confirm = slot0:findTF("window/confirm")
	slot0.cancel = slot0:findTF("window/cancel")
end

slot0.didEnter = function (slot0)
	onButton(slot0, slot0._tf, function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(slot0, slot0.cancel, function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(slot0, slot0.confirm, function ()
		slot0:emit(MonthCardSetMediator.ON_SET_RATIO, slot0.ratio)
	end, SFX_CANCEL)
	onSlider(slot0, slot0.slider, function (slot0)
		slot0:setRatio(slot0)
		slot0:updateRatioView()
	end)
	slot0:updateView()
	slot0:updateRatioView()
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
end

slot0.updateView = function (slot0)
	setText(slot0.name, string.format("贸易许可证（剩余%s天）", math.floor((slot0.player:getCardById(VipCard.MONTH).getLeftDate(slot1) - pg.TimeMgr.GetInstance():GetServerTime()) / 86400)))
	setText(slot0.rate, "1 : 5")
end

slot0.updateRatioView = function (slot0)
	setSlider(slot0.slider, 0, slot0.PIECES, slot0.ratio)
	setText(slot0.oil, (400 * slot0.ratio) / slot0.PIECES)
	setText(slot0.gold, (2000 * (slot0.PIECES - slot0.ratio)) / slot0.PIECES)
end

slot0.willExit = function (slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
end

return slot0
