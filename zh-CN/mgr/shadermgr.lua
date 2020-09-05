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

function slot1.LoadShader(slot0, slot1, slot2, slot3)
	if slot2 then
		ResourceMgr.Inst:LoadAssetAsync(slot0.shaders, slot1, typeof(Shader), UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0(slot0)
		end), true, false)
	else
		slot3(ResourceMgr.Inst:LoadAssetSync(slot0.shaders, slot1, typeof(Shader), true, false))
	end
end

function slot1.SetSpineUIOutline(slot0, slot1, slot2)
	slot0:LoadShader("Unlit-Colored_Alpha_UI_Outline", false, function (slot0)
		slot2 = Material.New(slot0)

		slot2:SetColor("_OutlineColor", uv1)
		slot2:SetFloat("_OutlineWidth", 5.75)
		slot2:SetFloat("_ThresholdEnd", 0.2)

		GetComponent(uv0, "SkeletonGraphic").material = slot2
	end)
end

function slot1.DelSpineUIOutline(slot0, slot1)
	GetComponent(slot1, "SkeletonGraphic").material = nil
end
