pg = pg or {}
pg.Live2DMgr = singletonClass("Live2DMgr")
this = pg.Live2DMgr

function this.GetLive2DModelAsync(slot0, slot1, slot2)
	slot0:AddRefCount(slot1)
	LoadAndInstantiateAsync("live2d", slot1, function (slot0)
		if CSharpVersion < 18 and slot0 ~= nil then
			slot0:GetComponent(tolua.findtype("Live2D.Cubism.Framework.Physics.CubismPhysicsController")).enabled = false
			slot0.GetComponent(tolua.findtype("Live2D.Cubism.Framework.Physics.CubismPhysicsController")).enabled = true
		end

		slot0(slot0)
	end)
end

function this.TryReleaseLive2dRes(slot0, slot1)
	if slot0:SubRefCount(slot1) then
		slot0:ReleaseLive2dRes(slot1)
	end
end

function this.ReleaseLive2dRes(slot0, slot1)
	ResourceMgr.Inst:ClearBundleRef("live2d/" .. slot1, true, true)
end

function this.AddRefCount(slot0, slot1)
	if not slot0.refCounterDic then
		slot0.refCounterDic = {}
	end

	if not slot0.refCounterDic[slot1] then
		slot0.refCounterDic[slot1] = 1
	else
		slot0.refCounterDic[slot1] = slot0.refCounterDic[slot1] + 1
	end
end

function this.SubRefCount(slot0, slot1)
	if slot0.refCounterDic and slot0.refCounterDic[slot1] then
		slot0.refCounterDic[slot1] = slot0.refCounterDic[slot1] - 1

		if slot0.refCounterDic[slot1] <= 0 then
			slot0.refCounterDic[slot1] = nil

			return true
		end
	else
		return true
	end

	return false
end

return
