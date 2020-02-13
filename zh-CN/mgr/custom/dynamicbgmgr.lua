pg = pg or {}
pg.DynamicBgMgr = singletonClass("DynamicBgMgr")
this = pg.DynamicBgMgr

function this.Ctor(slot0)
	slot0.cache = {}
end

function this.LoadBg(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = "bg/star_level_bg_" .. slot2

	if PathMgr.FileExists(PathMgr.getAssetBundle("ui/star_level_bg_" .. slot2)) then
		slot0:ClearBg(slot1:getUIName())
		PoolMgr.GetInstance():GetPrefab(slot8, "", true, function (slot0)
			if not slot0.exited then
				setParent(slot0, setParent, false)
				slot0:GetComponent(typeof(CriManaEffectUI)):Pause(false)
				setActive(slot0.GetComponent(typeof(CriManaEffectUI)), false)

				if false ~= nil then
					slot3(slot0)
				end

				slot4:InsertCache(slot0:getUIName(), slot5, slot0)
			else
				PoolMgr.GetInstance():DestroyPrefab(slot6, "")
			end
		end, 1)
	else
		slot0:ClearBg(slot1:getUIName())
		GetSpriteFromAtlasAsync(slot7, "", function (slot0)
			if not slot0.exited then
				setImageSprite(setImageSprite, slot0)
				setActive(setActive, true)

				if setActive ~= nil then
					slot2(slot0)
				end
			else
				PoolMgr.GetInstance():DestroySprite(slot3)
			end
		end)
	end
end

function this.ClearBg(slot0, slot1)
	for slot5 = #slot0.cache, 1, -1 do
		if slot0.cache[slot5].uiName == slot1 then
			slot6.dyBg.GetComponent(slot8, typeof(CriManaEffectUI)):Pause(true)
			PoolMgr.GetInstance():ReturnPrefab("ui/star_level_bg_" .. slot6.bgName, "", slot6.dyBg)

			if #slot0.cache > 1 then
				PoolMgr.GetInstance():DestroyPrefab(slot7, "")
			end

			table.remove(slot0.cache, slot5)
		end
	end
end

function this.InsertCache(slot0, slot1, slot2, slot3)
	for slot7, slot8 in ipairs(slot0.cache) do
		if slot8.uiName == slot1 and slot8.bgName == slot2 then
			slot8.dyBg = slot3

			return
		end
	end

	table.insert(slot0.cache, {
		uiName = slot1,
		bgName = slot2,
		dyBg = slot3
	})
end

return
