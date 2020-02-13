slot0 = class("LoadContextCommand", pm.SimpleCommand)
slot0.queue = {}

function slot0.execute(slot0, slot1)
	slot0:load(slot1:getBody())
end

function slot0.load(slot0, slot1)
	table.insert(slot0.queue, slot1)

	if #slot0.queue == 1 then
		slot0:loadNext()
	end
end

function slot0.loadNext(slot0)
	if #slot0.queue > 0 then
		function slot2()
			if slot0.callback then
				slot0.callback()
			end

			table.remove(slot1.queue, 1)
			slot2:loadNext()
		end

		if slot0.queue[1].type == LOAD_TYPE_SCENE then
			slot0:loadScene(slot1.context, slot1.prevContext, slot2)
		elseif slot1.type == LOAD_TYPE_LAYER then
			slot0:loadLayer(slot1.context, slot1.parentContext, slot2)
		end
	end
end

function slot0.loadScene(slot0, slot1, slot2, slot3)
	slot5 = pg.SceneMgr.GetInstance()
	slot6, slot7 = nil
	slot8 = {}
	slot2 = slot2 or getProxy(ContextProxy):getCurrentContext()

	seriesAsync({
		function (slot0)
			pg.UIMgr.GetInstance():LoadingOn()

			if slot0 ~= nil then
				slot1:extendData({
					fromMediatorName = slot0.mediator.__cname
				})
				slot1:removeLayer(()["facade"], slot0, function ()
					slot2 = slot0.facade:removeMediator(slot1.mediator.__cname).getViewComponent(slot0)

					slot3()
				end)
			else
				slot0()
			end
		end,
		function (slot0)
			slot0:prepare(slot1.facade, slot0, function (slot0)
				slot0 = slot0

				slot1()
			end)
		end,
		function (slot0)
			slot0:prepareLayer(slot1.facade, nil, slot0, function (slot0)
				slot0 = slot0

				slot1()
			end)
		end,
		function (slot0)
			if slot0.cleanStack then
				slot1:cleanContext()
			end

			slot1:pushContext(slot0)
			slot0()
		end,
		function (slot0)
			slot0:remove(slot0.remove, function ()
				if slot0 then
					slot0:onContextRemoved()
				end

				slot1()
			end)
		end,
		function (slot0)
			slot0:enter({
				slot1
			}, slot0)
		end,
		function (slot0)
			slot0:enter(slot0.enter, slot0)
		end,
		function ()
			if slot0 then
				slot0()
			end

			pg.UIMgr.GetInstance():LoadingOff()
			pg.UIMgr.GetInstance():sendNotification(GAME.LOAD_SCENE_DONE, slot2.scene)
		end
	})
end

function slot0.loadLayer(slot0, slot1, slot2, slot3)
	slot4 = pg.SceneMgr.GetInstance()
	slot5 = {}

	seriesAsync({
		function (slot0)
			pg.UIMgr.GetInstance():LoadingOn()
			slot0:prepareLayer(slot1.facade, slot0, , function (slot0)
				for slot4, slot5 in ipairs(slot0) do
					table.insert(slot0, slot5)
				end

				slot1()
			end)
		end,
		function (slot0)
			slot0:enter(slot0.enter, slot0)
		end,
		function ()
			if slot0 then
				slot0()
			end

			pg.UIMgr.GetInstance():LoadingOff()
		end
	})
end

return slot0
