slot0 = class("FleetCellView", import(".SpineCellView"))

function slot0.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)

	slot0.tfShadow = slot0.tf:Find("shadow")
	slot0.tfArrow = slot0.tf:Find("arrow")
	slot0.tfAmmo = slot0.tf:Find("ammo")
	slot0.tfAmmoText = slot0.tfAmmo:Find("text")
	slot0.tfOp = slot0.tf:Find("op")
	slot0.onClear = false
end

function slot0.getOrder(slot0)
	return 3
end

function slot0.showPoisonDamage(slot0, slot1)
	slot2 = "banai_dian01"
	slot3 = slot0.tfShip.localPosition

	PoolMgr.GetInstance():LoadAsset("ui/" .. slot2, slot2, false, nil, function (slot0)
		if uv0.onClear then
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. uv1, uv1, slot0)
		else
			slot1 = Instantiate(slot0)

			setParent(slot1.transform, uv0.tf, false)

			slot2 = LeanTween.moveY(uv0.tfShip, uv2.y - 10, 0.1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()

			if not IsNil(slot1:GetComponent(typeof(ParticleSystemEvent))) then
				slot3:AddEndEvent(function (slot0)
					uv0.tfShip.localPosition = uv1

					PoolMgr.GetInstance():ReturnPrefab("ui/" .. uv2, uv2, slot0)
					LeanTween.cancel(uv0.tfShip.gameObject)

					if uv3 then
						uv3()
					end
				end)
			end
		end
	end, true)
end

function slot0.clear(slot0)
	uv0.super.clear(slot0)

	slot0.onClear = true
end

return slot0
