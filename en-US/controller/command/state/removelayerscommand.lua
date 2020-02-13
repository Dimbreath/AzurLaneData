class("RemoveLayersCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.SceneMgr.GetInstance():removeLayer(slot0.facade, slot1:getBody().context, slot1.getBody().callback)
end

return class("RemoveLayersCommand", pm.SimpleCommand)
