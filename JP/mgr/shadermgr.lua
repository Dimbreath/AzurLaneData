pg = pg or {}
pg.ShaderMgr = singletonClass("ShaderMgr")
slot1 = pg.ShaderMgr

pg.ShaderMgr.Init = function (slot0, slot1)
	print("initializing shader manager...")
	ResourceMgr.Inst:loadAssetBundleAsync("shader", function (slot0)
		slot0.shaders = slot0

		slot0()
	end)
end

return
