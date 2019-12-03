slot0 = import("...core.Controller")
slot1 = import("...core.Model")
slot2 = import("...core.View")
slot3 = import("..observer.Notification")
slot4 = class("Facade")

slot4.Ctor = function (slot0, slot1)
	if slot0.instanceMap[slot1] ~= nil then
		error(slot0.MULTITON_MSG)
	end

	slot0:initializeNotifier(slot1)

	slot0.instanceMap[slot1] = slot0

	slot0:initializeFacade()
end

slot4.initializeFacade = function (slot0)
	slot0:initializeModel()
	slot0:initializeController()
	slot0:initializeView()
end

slot4.getInstance = function (slot0)
	if slot0 == nil then
		return nil
	end

	if slot0.instanceMap[slot0] == nil then
		slot0.instanceMap[slot0] = slot0:New()
	end

	return slot0.instanceMap[slot0]
end

slot4.initializeController = function (slot0)
	if slot0.controller ~= nil then
		return
	end

	slot0.controller = slot0.getInstance(slot0.multitonKey)
end

slot4.initializeModel = function (slot0)
	if slot0.model ~= nil then
		return
	end

	slot0.model = slot0.getInstance(slot0.multitonKey)
end

slot4.initializeView = function (slot0)
	if slot0.view ~= nil then
		return
	end

	slot0.view = slot0.getInstance(slot0.multitonKey)
end

slot4.registerCommand = function (slot0, slot1, slot2)
	slot0.controller:registerCommand(slot1, slot2)
end

slot4.removeCommand = function (slot0, slot1)
	slot0.controller:removeCommand(slot1)
end

slot4.hasCommand = function (slot0, slot1)
	return slot0.controller:hasCommand(slot1)
end

slot4.registerProxy = function (slot0, slot1)
	slot0.model:registerProxy(slot1)
end

slot4.retrieveProxy = function (slot0, slot1)
	return slot0.model:retrieveProxy(slot1)
end

slot4.removeProxy = function (slot0, slot1)
	slot2 = nil

	if slot0.model ~= nil then
		slot2 = slot0.model:removeProxy(slot1)
	end

	return slot2
end

slot4.hasProxy = function (slot0, slot1)
	return slot0.model:hasProxy(slot1)
end

slot4.registerMediator = function (slot0, slot1)
	if slot0.view ~= nil then
		slot0.view:registerMediator(slot1)
	end
end

slot4.retrieveMediator = function (slot0, slot1)
	return slot0.view:retrieveMediator(slot1)
end

slot4.removeMediator = function (slot0, slot1)
	slot2 = nil

	if slot0.view ~= nil then
		slot2 = slot0.view:removeMediator(slot1)
	end

	return slot2
end

slot4.hasMediator = function (slot0, slot1)
	return slot0.view:hasMediator(slot1)
end

slot4.sendNotification = function (slot0, slot1, slot2, slot3)
	slot0:notifyObservers(slot0.New(slot1, slot2, slot3))
end

slot4.notifyObservers = function (slot0, slot1)
	if slot0.view ~= nil then
		slot0.view:notifyObservers(slot1)
	end
end

slot4.initializeNotifier = function (slot0, slot1)
	slot0.multitonKey = slot1
end

slot4.hasCore = function (slot0)
	return slot0.instanceMap[slot0] ~= nil
end

slot4.removeCore = function (slot0)
	if slot0.instanceMap[slot0] == nil then
		return
	end

	slot1.removeModel(slot0)
	slot2.removeView(slot0)
	slot3.removeController(slot0)

	slot0.instanceMap[slot0] = nil
end

slot4.instanceMap = {}
slot4.MULTITON_MSG = "Facade instance for this Multiton key already constructed!"

return slot4
