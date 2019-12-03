slot0 = class("BackYardBaseView")
slot1 = require("Framework.notify.event")
slot2 = require("Mod/BackYard/view/BackYardTool")

slot0.Ctor = function (slot0, slot1, slot2, slot3, slot4)
	slot0.event = slot0.New()
	slot0._go = slot1
	slot0._tf = tf(slot1)
	slot0.mode = slot2
	slot0.bgm = slot4

	pg.DelegateInfo.New(slot0)

	slot0.backyardPoolMgr = slot3
	slot0.factory = BackYardFactory.New(slot0.backyardPoolMgr)
	slot0.zoom = slot0:findTF("bg"):GetComponent("Zoom")
end

slot0.init = function (slot0)
	slot0:OnInit()
	slot0:OnDidEnter()
end

slot0.willExit = function (slot0)
	slot0:OnWillExit()
	slot0.event:clear()
	pg.DelegateInfo.Dispose(slot0)
	slot0.factory:Destroy()

	slot0.backyardPoolMgr = nil
	slot0.isExist = true
end

slot0.enableZoom = function (slot0, slot1)
	slot0.zoom.enabled = slot1
end

slot0.emit = function (slot0, ...)
	if slot0.event then
		slot0.event:emit(...)
	end
end

slot0.findTF = function (slot0, slot1, slot2)
	return findTF(slot2 or slot0._tf, slot1)
end

slot0.IsVisitMode = function (slot0)
	return slot0.mode == BackYardConst.MODE_VISIT
end

slot0.change2ScrPos = function (slot0, slot1, slot2)
	return slot0.change2ScrPos(slot1, slot2)
end

slot0.getMapPos = function (slot0, slot1)
	return slot0.getMapPos(slot1)
end

slot0.EnableMultiTouch = function (slot0, slot1)
	Input.multiTouchEnabled = slot1
end

slot0.OnInit = function (slot0)
	return
end

slot0.OnDidEnter = function (slot0)
	return
end

slot0.OnWillExit = function (slot0)
	return
end

return slot0
