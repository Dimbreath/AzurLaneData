pg = pg or {}
pg.SceneMgr = singletonClass("SceneMgr")

function pg.SceneMgr.prepare(slot0, slot1, slot2, slot3)
	slot4 = slot2.viewComponent.New()

	slot4:setContextData(slot2.data)

	slot5 = nil

	function slot5()
		slot0.event:disconnect(BaseUI.LOADED, slot0.event)

		slot0 = slot2.mediator.New(slot2.mediator.New)

		slot0:setContextData(slot2.data)
		slot3:registerMediator(slot0)

		slot1 = getProxy(ContextProxy)

		if not ContextProxy.isLayer then
			if slot1.lastContext then
				slot1:TriggerDelegate(slot1.lastContext, "_POP")
				slot1:TriggerInterjectedDelegate(slot1.lastContext, slot1.TriggerInterjectedDelegate, "_TO_")
			end

			slot1.lastContext = slot2

			slot1:TriggerDelegate(slot1.TriggerDelegate, "_PUSH")
		end

		slot4(slot0)
	end

	if slot4:isLoaded() then
		slot5()
	else
		slot4.event:connect(BaseUI.LOADED, slot5)
		slot4:load()
	end
end

function pg.SceneMgr.prepareLayer(slot0, slot1, slot2, slot3, slot4)
	slot5 = {}
	slot6 = {}

	if slot2 ~= nil then
		if slot2:getContextByMediator(slot3.mediator) then
			print("mediator already exist: " .. slot3.mediator.__cname)
			slot4(slot6)

			return
		end

		table.insert(slot5, slot3)
		slot2:addChild(slot3)
	else
		for slot10, slot11 in ipairs(slot3.children) do
			table.insert(slot5, slot11)
		end
	end

	slot7 = nil

	function ()
		if #slot0 > 0 then
			for slot4, slot5 in ipairs(table.remove(table.remove, 1).children) do
				table.insert(slot0, slot5)
			end

			slot2 = slot1:retrieveMediator(slot0.parent.mediator.__cname)
			slot3 = slot2:getViewComponent()

			slot2:prepare(slot0.parent, slot0, function (slot0)
				slot0.viewComponent:attach(slot0)
				table.insert(table.insert, slot0)
				table.insert()
			end)

			return
		end

		slot5(slot3)
	end()
end

function pg.SceneMgr.enter(slot0, slot1, slot2)
	if #slot1 == 0 then
		slot2()
	end

	slot3 = #slot1

	for slot7, slot8 in ipairs(slot1) do
		slot10 = nil

		slot8.viewComponent.event:connect(BaseUI.AVALIBLE, function ()
			slot0.event:disconnect(BaseUI.AVALIBLE, slot0.event)

			if slot2 - 1 == 0 then
				slot3()
			end
		end)
		slot8.viewComponent:enter()
	end
end

function pg.SceneMgr.removeLayer(slot0, slot1, slot2, slot3)
	slot4 = {
		slot2
	}
	slot5 = {}

	while #slot4 > 0 do
		if table.remove(slot4, 1).mediator then
			table.insert(slot5, slot6)
		end

		for slot10, slot11 in ipairs(slot6.children) do
			table.insert(slot4, slot11)
		end
	end

	if slot2.parent == nil then
		table.remove(slot5, 1)
	else
		slot2.parent:removeChild(slot2)
	end

	slot6 = {}

	for slot10 = #slot5, 1, -1 do
		slot12 = slot1:removeMediator(slot5[slot10].mediator.__cname)

		table.insert(slot6, function (slot0)
			if slot0 then
				slot1:remove(slot0:getViewComponent(), function ()
					slot0:onContextRemoved()
					slot0()
				end)
			else
				slot0()
			end
		end)
	end

	seriesAsync(slot6, slot3)
end

function pg.SceneMgr.remove(slot0, slot1, slot2)
	slot3 = nil

	function slot3()
		slot0.event:disconnect(BaseUI.DID_EXIT, slot0.event)
		slot0.event.disconnect.event:clear()
		slot2:gc(slot2.gc)
		slot0.event()
	end

	if slot1 == nil then
		slot2()
	else
		slot1.event:connect(BaseUI.DID_EXIT, slot3)
		slot1:exit()
	end
end

function pg.SceneMgr.gc(slot0, slot1)
	table.clear(slot1)

	slot1.exited = true

	gcAll()
end

return
