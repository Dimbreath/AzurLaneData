pg = pg or {}
slot0 = pg
slot0.ShaderMgr = singletonClass("ShaderMgr")
slot1 = slot0.ShaderMgr

function slot0.ShaderMgr.Init(slot0, slot1)
	print("initializing shader manager...")
	ResourceMgr.Inst:loadAssetBundleAsync("shader", function (slot0)
		uv0.shaders = slot0

		uv1()
	end)
end
