slot0 = class("TestView", import("..BaseMiniGameView"))

slot0.getUIName = function (slot0)
	return "MailBoxUI2"
end

slot0.init = function (slot0)
	print("初始化")

	slot0._closeBtn = slot0:findTF("main/top/btnBack")
	slot0._btn1 = slot0:findTF("main/delete_all_button")
	slot0._btn2 = slot0:findTF("main/get_all_button")
end

slot0.didEnter = function (slot0)
	onButton(slot0, slot0._closeBtn, function ()
		slot0:emit(slot1.ON_BACK)
	end)
	onButton(slot0, slot0._btn1, function ()
		slot0:SendSuccess(1)
	end)
	onButton(slot0, slot0._btn2, function ()
		slot0:SendFailure(1)
	end)
end

return slot0
