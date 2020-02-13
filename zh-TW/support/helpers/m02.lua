slot0 = UnityEngine

function flog(slot0, slot1)
	if slot0 and slot1 and pg.ConnectionMgr.GetInstance():isConnected() then
		pg.m02:sendNotification(GAME.SEND_CMD, {
			cmd = "log",
			arg1 = slot0,
			arg2 = slot1
		})
	end
end

function throttle(slot0, slot1, slot2)
	slot3, slot4, slot5 = nil
	slot6 = 0

	function slot7()
		slot0 = (slot1 and Time.unscaledTime) or 0
		slot0 = slot0
		slot2 = nil
		slot3 = slot4(unpack(slot5))

		if not slot5 then
			slot5 = nil
		end
	end

	return function (...)
		if not Time.unscaledTime and not slot1 then
			slot0 = slot0
		end

		slot3 = {
			...
		}

		if slot2 - (slot0 - slot0) <= 0 or slot2 < slot1 then
			if slot4 then
				slot4:Stop()

				slot4 = nil
			end

			slot0 = slot0
			slot5 = slot6(unpack(unpack))

			if not unpack then
				slot3 = nil
			end
		elseif not slot4 and slot1 then
			slot4:Start()
		end

		return slot5
	end
end

function debounce(slot0, slot1, slot2)
	slot3, slot4, slot5, slot6, slot7 = nil

	function slot7()
		if Time.unscaledTime -  < Time.unscaledTime and slot0 > 0 then
			Timer.New(slot3, slot1 - slot0, 1):Start()
		else
			slot2 = nil

			if not slot4 then
				slot5 = slot6(unpack(slot7))

				if not unpack then
					slot7 = nil
				end
			else
				slot4 = false
			end
		end
	end

	return function (...)
		slot0 = {
			...
		}
		slot1 = Time.unscaledTime
		slot0 = slot2 and not slot3

		if not slot3 then
			slot3:Start()
		end

		if slot0 then
			slot6 = slot7(unpack(slot0))
			slot0 = nil
		end

		return slot6
	end
end

function createLog(slot0, slot1)
	if LOG and slot1 then
		return function (...)
			print(slot0 .. ": ", ...)
		end
	else
		print(slot0 .. ": log disabled")

		return function ()
			return
		end
	end
end

function getProxy(slot0)
	return pg.m02:retrieveProxy(slot0.__cname)
end

function getBackYardProxy(slot0)
	return pg.backyard:retrieveProxy(slot0.__cname)
end

function LoadAndInstantiateAsync(slot0, slot1, slot2, slot3, slot4)
	ResourceMgr.Inst:getAssetAsync(slot0 .. "/" .. slot1, slot1, slot0.Events.UnityAction_UnityEngine_Object(function (slot0)
		slot0(Instantiate(slot0))
	end), defaultValue(slot3, true), defaultValue(slot4, true))
end

function LoadAndInstantiateSync(slot0, slot1, slot2, slot3)
	return Instantiate(ResourceMgr.Inst:getAssetSync(slot0 .. "/" .. slot1, slot1, defaultValue(slot2, true), defaultValue(slot3, true)))
end

slot1 = {}

function LoadSprite(slot0, slot1)
	return ResourceMgr.Inst:getAssetSync(slot0, slot1 or "", typeof(Sprite), true, false)
end

function LoadSpriteAtlasAsync(slot0, slot1, slot2)
	ResourceMgr.Inst:getAssetAsync(slot0, slot1 or "", typeof(Sprite), slot0.Events.UnityAction_UnityEngine_Object(function (slot0)
		slot0(slot0)
	end), true, false)
end

function LoadSpriteAsync(slot0, slot1)
	LoadSpriteAtlasAsync(slot0, nil, slot1)
end

function LoadAny(slot0, slot1, slot2)
	return ResourceMgr.Inst:getAssetSync(slot0, slot1, slot2, true, false)
end

function LoadAnyAsync(slot0, slot1, slot2, slot3)
	return ResourceMgr.Inst:getAssetAsync(slot0, slot1, slot2, slot3, true, false)
end

function LoadImageSpriteAtlasAsync(slot0, slot1, slot2, slot3)
	slot2:GetComponent(typeof(Image)).enabled = false
	slot0[slot2.GetComponent(typeof(Image))] = slot0

	LoadSpriteAtlasAsync(slot0, slot1, function (slot0)
		if not IsNil(slot0) and slot1[slot0] == slot0 then
			slot1[slot0] = nil
			slot0.enabled = true
			slot0.sprite = slot0

			if nil then
				slot0:SetNativeSize()
			end
		end
	end)
end

function LoadImageSpriteAsync(slot0, slot1, slot2)
	LoadImageSpriteAtlasAsync(slot0, nil, slot1, slot2)
end

function GetSpriteFromAtlas(slot0, slot1)
	PoolMgr.GetInstance():GetSprite(slot0, slot1, false, function (slot0)
		slot0 = slot0
	end)

	return nil
end

function GetSpriteFromAtlasAsync(slot0, slot1, slot2)
	PoolMgr.GetInstance():GetSprite(slot0, slot1, true, function (slot0)
		slot0(slot0)
	end)
end

function GetImageSpriteFromAtlasAsync(slot0, slot1, slot2, slot3)
	slot2:GetComponent(typeof(Image)).enabled = false
	slot0[slot2.GetComponent(typeof(Image))] = slot0 .. slot1

	GetSpriteFromAtlasAsync(slot0, slot1, function (slot0)
		if not IsNil(slot0) and slot1[slot0] == slot0 .. slot3 then
			slot1[slot0] = nil
			slot0.enabled = true
			slot0.sprite = slot0

			if slot4 then
				slot0:SetNativeSize()
			end
		end
	end)
end

function SetAction(slot0, slot1)
	slot0:GetComponent(typeof(SpineAnimUI)):SetAction(slot1, 0)
end

function emojiText(slot0, slot1)
	slot2 = ResourceMgr.Inst:loadAssetBundleSync("emojis")
	slot5 = Shader.Find("Unlit/Transparent")
	slot8 = {}
	slot9 = 0
	GetComponent(slot0, "TextMesh").text = string.gsub(slot1, "#(%d+)#", function (slot0)
		if not slot0[slot0] then
			Material.New(Material.New).mainTexture = ResourceMgr.Inst:LoadAssetSync(ResourceMgr.Inst.LoadAssetSync, "emoji" .. slot0, false, false)

			table.insert(table.insert, Material.New(Material.New))

			slot0[slot0] = slot1 + 1
			slot1 = slot1 + 1
		end

		return "<quad material=" .. slot1 .. " />"
	end)
	GetComponent(slot0, "MeshRenderer").materials = {
		GetComponent(slot0, "MeshRenderer").materials[0]
	}

	ResourceMgr.Inst:ClearBundleRef("emojis", false, false)
end

function setPaintingImg(slot0, slot1)
	setImageSprite(slot0, LoadSprite("painting/" .. slot1) or LoadSprite("painting/unknown"))
	resetAspectRatio(slot0)
end

function setPaintingPrefab(slot0, slot1, slot2, slot3)
	removeAllChildren(slot4)

	GetOrAddComponent(findTF(slot0, "fitter"), "PaintingScaler").FrameName = slot2 or ""
	GetOrAddComponent(findTF(slot0, "fitter"), "PaintingScaler").Tween = 1
	slot6 = slot1

	if not slot3 and PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. slot1 .. "_n")) and PlayerPrefs.GetInt("paint_hide_other_obj_" .. slot1, 0) ~= 0 then
		slot1 = slot1 .. "_n"
	end

	if not slot3 and PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. slot1 .. "_n")) and PlayerPrefs.GetInt("paint_hide_other_obj_" .. slot1, 0) ~= 0 then
		slot1 = slot1 .. "_n"
	end

	PoolMgr.GetInstance():GetPainting(slot1, false, function (slot0)
		setParent(slot0, slot0, false)

		if not IsNil(findTF(slot0, "Touch")) then
			setActive(slot1, false)
		end

		Ship.SetExpression(slot0:GetChild(0), slot1)
	end)
end

slot2 = {}

function setPaintingPrefabAsync(slot0, slot1, slot2, slot3, slot4)
	removeAllChildren(slot5)

	GetOrAddComponent(findTF(slot0, "fitter"), "PaintingScaler").FrameName = slot2 or ""
	GetOrAddComponent(findTF(slot0, "fitter"), "PaintingScaler").Tween = 1
	slot7 = slot1

	if PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. slot1 .. "_n")) and PlayerPrefs.GetInt("paint_hide_other_obj_" .. slot1, 0) ~= 0 then
		slot1 = slot1 .. "_n"
	end

	if not slot4 and PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. slot1 .. "_n")) and PlayerPrefs.GetInt("paint_hide_other_obj_" .. slot1, 0) ~= 0 then
		slot1 = slot1 .. "_n"
	end

	slot0[slot0] = slot1

	PoolMgr.GetInstance():GetPainting(slot1, true, function (slot0)
		if IsNil(slot0) or slot1[slot0] ~= slot0 then
			PoolMgr.GetInstance():ReturnPainting(PoolMgr.GetInstance(), slot0)
		else
			setParent(slot0, slot3, false)

			setParent[slot0] = nil

			Ship.SetExpression(slot0, false)
		end

		if not IsNil(findTF(slot0, "Touch")) then
			setActive(slot1, false)
		end

		if slot5 then
			slot5()
		end
	end)
end

function retPaintingPrefab(slot0, slot1)
	if slot0 and slot1 then
		if findTF(slot0, "fitter") and slot2.childCount > 0 and not IsNil(slot2:GetChild(0)) then
			if not IsNil(findTF(slot3, "Touch")) then
				eachChild(slot4, function (slot0)
					if not IsNil(slot0:GetComponent(typeof(Button))) then
						Object.Destroy(slot1)
					end
				end)
			end

			PoolMgr.GetInstance():ReturnPainting(string.gsub(slot3.name, "%(Clone%)", ""), slot3.gameObject)
		end

		slot0[slot0] = nil
	end
end

function setColorCount(slot0, slot1, slot2)
	setText(slot0, string.format((slot1 < slot2 and "<color=" .. COLOR_RED .. ">%d</color>/%d") or "%d/%d", slot1, slot2))
end

function setColorStr(slot0, slot1)
	return "<color=" .. slot1 .. ">" .. slot0 .. "</color>"
end

function setSizeStr(slot0, slot1)
	slot2, slot3 = string.gsub(slot0, "[<]size=%d+[>]", "<size=" .. slot1 .. ">")

	if slot3 == 0 then
		slot2 = "<size=" .. slot1 .. ">" .. slot2 .. "</size>"
	end

	return slot2
end

function playSoundEffect(slot0)
	if not slot0 then
		return
	end

	string.gsub(slot0, "event:/cv/(.+)/(.+)", function (slot0, slot1)
		slot0 = "cv-" .. slot0 .. ((tobool(ShipWordHelper.CVBattleKey[string.gsub(slot1, "_%w+", "")]) and "-battle") or "")
		slot1 = slot1
	end)

	if nil and slot2 then
		return pg.CriMgr.GetInstance():PlayCV(slot1, slot2)
	else
		return pg.CriMgr.GetInstance():PlaySE(string.gsub(string.gsub(slot0, "event:/(battle)/(.+)", "%1-%2"), "event:/(ui)/(.+)", "%1-%2"))
	end
end

function playBGM(slot0)
	pg.CriMgr.GetInstance():PlayBGM(slot0)
end

function playStory(slot0, slot1)
	pg.StoryMgr.GetInstance():Play(slot0, slot1)
end

function playStorySound(slot0)
	return
end

function stopStorySound()
	return
end

function errorMessage(slot0)
	if ERROR_MESSAGE[slot0] == nil then
		slot1 = ERROR_MESSAGE[9999] .. ":" .. slot0
	end

	return slot1
end

function errorTip(slot0, slot1, ...)
	slot3 = nil
	slot3 = (not pg.gametip[slot0 .. "_error"] or slot2.tip) and pg.gametip.common_error.tip

	if pg.gametip[slot0 .. "_error_" .. slot1] then
		return slot3 .. i18n(slot4, ...)
	elseif pg.gametip["common_error_" .. slot1] then
		return slot3 .. i18n(slot4, ...)
	else
		return slot3 .. slot1 .. ":" .. errorMessage(slot1)
	end
end

function colorNumber(slot0, slot1)
	slot2 = "@COLOR_SCOPE"
	slot0 = string.gsub(string.gsub(slot0, "<color=#%x+>", function (slot0)
		table.insert(slot0, slot0)

		return table.insert
	end), "%d+%.?%d*%%*", function (slot0)
		return "<color=" .. slot0 .. ">" .. slot0 .. "</color>"
	end)

	if #{} > 0 then
		slot4 = 0

		return string.gsub(slot0, slot2, function (slot0)
			return slot0 + 1[]
		end)
		return
	end

	return slot0
end

function getBounds(slot0)
	slot2 = Bounds.New(LuaHelper.GetWorldCorners(rtf(slot0))[0], Vector3.zero)

	slot2:Encapsulate(LuaHelper.GetWorldCorners(rtf(slot0))[2])

	return slot2
end

function slot3(slot0, slot1)
	slot0.localScale = Vector3.one
	slot0.anchorMin = Vector2.zero
	slot0.anchorMax = Vector2.one
	slot0.offsetMin = Vector2(slot1[1], slot1[2])
	slot0.offsetMax = Vector2(-slot1[3], -slot1[4])
end

slot4 = {
	frame04 = {
		-8,
		-8.5,
		-8,
		-8
	},
	frame05 = {
		-8,
		-8.5,
		-8,
		-8
	},
	frame6 = {
		-16.5,
		-2.5,
		-3.5,
		-16.5
	},
	frame7 = {
		-16.5,
		-2.5,
		-3.5,
		-16.5
	},
	frame_npc = {
		-4,
		-4,
		-4,
		-4
	},
	frame_prop = {
		-11,
		-12,
		-14,
		-14
	},
	other = {
		-2.5,
		-4.5,
		-3,
		-4.5
	}
}

function setFrame(slot0, slot1, slot2)
	setImageColor(slot0, Color(1, 1, 1, 1))
	setImageSprite(slot0, GetSpriteFromAtlas("weaponframes", "frame"))

	if slot2 or string.sub(slot1, 1, 1) == "0" or tonumber(slot1) > 5 then
		slot0(findTF(slot0, "specialFrame") or cloneTplTo(slot0, slot0, "specialFrame"), slot1[slot2 or "frame" .. slot1] or slot1.other)
		setImageSprite(findTF(slot0, "specialFrame") or cloneTplTo(slot0, slot0, "specialFrame"), GetSpriteFromAtlas("weaponframes", slot2 or "frame" .. slot1))
		setActive(findTF(slot0, "specialFrame") or cloneTplTo(slot0, slot0, "specialFrame"), true)
	else
		setImageColor(slot0, shipRarity2FrameColor(slot1 + 1))

		if findTF(slot0, "specialFrame") then
			setActive(slot3, false)
		end
	end
end

function slot5(slot0, slot1, slot2, slot3)
	function slot4(slot0, slot1)
		if findTF(slot0, "icon_bg/" .. slot0 .. "(Clone)") then
			setActive(slot2, slot1)
		elseif slot1 then
			LoadAndInstantiateAsync("ui", string.lower(slot0), function (slot0)
				if IsNil(slot0) or findTF(slot0, "icon_bg/" .. findTF .. "(Clone)") then
					Object.Destroy(slot0)
				else
					setParent(slot0, slot0:Find("icon_bg"))

					if slot0:Find("icon_bg/stars") then
						slot1:SetAsLastSibling()
					end

					setActive(slot0, setActive)
				end
			end)
		end
	end

	slot5 = nil

	if slot3 then
		slot5 = {
			[5] = {
				name = "Item_duang5",
				active = slot2.fromAwardLayer and slot1 >= 5
			}
		}
	else
		slot5 = {
			[6] = {
				name = "IconColorful",
				active = not slot2.noIconColorful and slot1 == 6
			}
		}
	end

	for slot9, slot10 in pairs(slot5) do
		slot4(slot10.name, slot10.active)
	end
end

function slot6(slot0, slot1, slot2)
	slot3 = findTF(slot0, "icon_bg/startpl")

	if findTF(slot0, "icon_bg/stars") and slot3 then
		setActive(slot4, false)
		setActive(slot3, false)
	end

	if not slot4 or not slot1 then
		return
	end

	for slot8 = 1, math.max(slot2, slot4.childCount), 1 do
		setActive((slot4.childCount < slot8 and cloneTplTo(slot3, slot4)) or slot4:GetChild(slot8 - 1), slot8 <= slot2)
	end

	setActive(slot4, true)
end

function slot7(slot0, slot1, slot2)
	if not IsNil(findTF(slot0, "icon_bg/slv")) then
		setActive(slot3, slot1 > 0)
		setText(findTF(slot3, "Text"), slot1)
	end
end

function slot8(slot0, slot1, slot2)
	if not IsNil(findTF(slot0, "name")) then
		setText(slot3, slot1)

		if slot2.hideName then
			setActive(slot3, false)
		end
	end
end

function slot9(slot0, slot1)
	if not IsNil(findTF(slot0, "icon_bg/count")) then
		setText(slot2, (slot1 and (type(slot1) ~= "number" or slot1 > 0) and slot1) or "")
	end
end

function updateEquipment(slot0, slot1, slot2)
	slot3 = EquipmentRarity.Rarity2Print(slot1.config.rarity)

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. slot3))
	setFrame(findTF(slot0, "icon_bg/frame"), slot3)

	slot4 = findTF(slot0, "icon_bg/icon")

	slot0(slot4, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync("equips/" .. slot1.config.icon, "", slot4)
	slot1(slot0, true, slot1.config.rarity)

	-- Decompilation error in this vicinity:
	slot2 or {}(slot0, slot1.config.level - 1, slot1.config.expired_date)
	slot3(slot0, slot1.config.name, 
	-- Decompilation error in this vicinity:
	slot2 or )
	slot4(slot0, slot1.count)
	slot4(slot0, slot1.config.rarity, 
	-- Decompilation error in this vicinity:
	slot2 or )
end

function updateItem(slot0, slot1, slot2)
	slot2 = slot2 or {}

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. ItemRarity.Rarity2Print(pg.item_data_statistics[slot1.id].rarity)))

	slot5 = nil

	if pg.item_data_statistics[slot1.id].type == 9 then
		slot5 = "frame6"
	end

	setFrame(findTF(slot0, "icon_bg/frame"), slot4, slot5)
	GetImageSpriteFromAtlasAsync(slot1.icon or slot3.icon, "", findTF(slot0, "icon_bg/icon"))
	slot0(slot0, false)
	slot1(slot0, 0, checkExist(pg.item_data_template[slot1.id], {
		"expired_date"
	}))
	slot2(slot0, HXSet.hxLan(slot3.name), slot2)
	slot3(slot0, slot3.rarity + 1, slot2)
end

function updateWorldItem(slot0, slot1, slot2)
	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. ItemRarity.Rarity2Print(pg.world_item_data_template[slot1.id].rarity)))
	setFrame(findTF(slot0, "icon_bg/frame"), slot4)
	GetImageSpriteFromAtlasAsync(slot1.icon or slot3.icon, "", findTF(slot0, "icon_bg/icon"))
	slot0(slot0, false)
	slot1(slot0, 0, slot3.expired_date)

	-- Decompilation error in this vicinity:
	slot2 or {}(slot0, HXSet.hxLan(slot3.name), 
	-- Decompilation error in this vicinity:
	slot2 or )
	slot3(slot0, slot3.rarity + 1, 
	-- Decompilation error in this vicinity:
	slot2 or )
end

function updateShip(slot0, slot1, slot2)
	slot3 = slot1:rarity2bgPrint()
	slot4 = slot1:getPainting()
	slot5 = getProxy(ShipSkinProxy)

	if slot2 or {}.anonymous then
		slot3 = "1"
		slot4 = "unknown"
	end

	if findTF(slot0, "icon_bg/new") then
		if slot2.isSkin then
			setActive(slot6, not slot5:hasOldNonLimitSkin(slot1.skinId))
		else
			setActive(slot6, slot1.virgin)
		end
	end

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. ((slot2.isSkin and "-skin") or slot3)))

	slot8 = findTF(slot0, "icon_bg/frame")
	slot9 = nil

	if slot1.isNpc then
		slot9 = "frame_npc"
	elseif slot1.propose then
		slot9 = "frame_prop"
	elseif slot2.isSkin then
		slot9 = "frame7"
	end

	setFrame(slot8, slot3, slot9)

	if slot2.gray then
		setGray(slot7, true, true)
	end

	GetImageSpriteFromAtlasAsync((slot2.Q and "QIcon/") or "SquareIcon/" .. slot4, "", findTF(slot0, "icon_bg/icon"))

	if findTF(slot0, "icon_bg/lv") then
		setActive(slot11, not slot1.isNpc)

		if not slot1.isNpc and findTF(slot11, "Text") and slot1.level then
			setText(slot12, slot1.level)
		end
	end

	if findTF(slot0, "ship_type") then
		setActive(slot12, true)
		setImageSprite(slot12, GetSpriteFromAtlas("shiptype", shipType2print(slot1:getShipType())))
	end

	if not IsNil(slot7:Find("npc")) then
		if slot6 and go(slot6).activeSelf then
			setActive(slot13, false)
		else
			setActive(slot13, slot1:isActivityNpc())
		end
	end

	slot0(slot0, slot2.initStar, slot1:getStar())
	slot1(slot0, slot1:getName(), slot2)
	slot2(slot0, (slot2.isSkin and 5) or slot1:getRarity(), slot2)
end

function updateCommander(slot0, slot1, slot2)
	slot4 = ShipRarity.Rarity2Print(slot3)
	slot5 = slot1:getPainting()

	if slot2 or {}.anonymous then
		slot4 = 1
		slot5 = "unknown"
	end

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. ((slot2.isSkin and "-skin") or slot4)))
	setFrame(findTF(slot0, "icon_bg/frame"), slot4)

	if slot2.gray then
		setGray(slot6, true, true)
	end

	GetImageSpriteFromAtlasAsync((slot2.Q and "QIcon/") or "SquareIcon/" .. slot5, "", findTF(slot0, "icon_bg/icon"))

	if findTF(slot0, "icon_bg/lv") then
		setActive(slot9, true)

		if findTF(slot9, "Text") and slot1.level then
			setText(slot10, slot1.level)
		end
	end

	slot0(slot0, slot2.initStar, slot1:getStar())
	slot1(slot0, slot1:getName(), slot2)
end

function updateStrategy(slot0, slot1, slot2)
	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. ItemRarity.Rarity2Print(ItemRarity.Gray)))
	setFrame(findTF(slot0, "icon_bg/frame"), slot4)
	GetImageSpriteFromAtlasAsync("strategyicon/" .. pg.strategy_data_template[slot1.id].icon, "", slot5)
	slot0(slot0, false)
	slot1(slot0, HXSet.hxLan(pg.strategy_data_template[slot1.id].name), 
	-- Decompilation error in this vicinity:
	slot2 or {})

	-- Decompilation error in this vicinity:
	slot2 or (slot0, 1, 
	-- Decompilation error in this vicinity:
	slot2 or )
end

function updateFurniture(slot0, slot1, slot2)
	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. (ItemRarity.Rarity2Print(pg.furniture_data_template[slot1].rarity) or ItemRarity.Gray)))
	setFrame(findTF(slot0, "icon_bg/frame"), ItemRarity.Rarity2Print(pg.furniture_data_template[slot1].rarity) or ItemRarity.Gray)
	GetImageSpriteFromAtlasAsync("furnitureicon/" .. slot3.icon, "", slot5)
	slot0(slot0, false)
	slot1(slot0, HXSet.hxLan(slot3.name), 
	-- Decompilation error in this vicinity:
	slot2 or {})

	-- Decompilation error in this vicinity:
	slot2 or (slot0, slot3.rarity + 1, 
	-- Decompilation error in this vicinity:
	slot2 or )
end

slot10 = nil

function findCullAndClipWorldRect(slot0)
	if #slot0 == 0 then
		return false
	end

	slot1 = slot0[1].canvasRect

	for slot5 = 1, #slot0, 1 do
		slot1 = rectIntersect(slot1, slot0[slot5].canvasRect)
	end

	if slot1.width <= 0 or slot1.height <= 0 then
		return false
	end

	slot2 = slot0 or GameObject.Find("UICamera/Canvas").transform

	return true, Vector4(slot0:TransformPoint(Vector3(slot1.x, slot1.y, 0)).x, slot0.TransformPoint(Vector3(slot1.x, slot1.y, 0)).y, slot0:TransformPoint(Vector3(slot1.x + slot1.width, slot1.y + slot1.height, 0)).x, slot0.TransformPoint(Vector3(slot1.x + slot1.width, slot1.y + slot1.height, 0)).y)
end

function rectIntersect(slot0, slot1)
	slot4 = math.max(slot0.y, slot1.y)
	slot5 = math.min(slot0.y + slot0.height, slot1.y + slot1.height)

	if math.max(slot0.x, slot1.x) <= math.min(slot0.x + slot0.width, slot1.x + slot1.width) and slot4 <= slot5 then
		return slot0.Rect.New(slot2, slot4, slot3 - slot2, slot5 - slot4)
	end

	return slot0.Rect.New(0, 0, 0, 0)
end

function getDropInfo(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0) do
		slot7 = slot6[1]
		slot8 = slot6[2]
		slot9 = slot6[3] or 1

		if slot7 == DROP_TYPE_SHIP then
			table.insert(slot1, Ship.New({
				configId = slot8
			}).getConfig(slot10, "name") .. "x" .. slot9)
		elseif slot7 == DROP_TYPE_EQUIP then
			table.insert(slot1, Equipment.New({
				id = slot8
			}).getConfig(slot10, "name") .. "x" .. counts)
		elseif slot7 == DROP_TYPE_SIREN_EQUIP then
		elseif slot7 == DROP_TYPE_RESOURCE then
			table.insert(slot1, Item.New({
				id = id2ItemId(slot8)
			}).getConfig(slot10, "name") .. "x" .. slot9)
		elseif slot7 == DROP_TYPE_ITEM then
			table.insert(slot1, Item.New({
				id = slot8
			}).getConfig(slot10, "name") .. "x" .. slot9)
		elseif slot7 == DROP_TYPE_FURNITURE then
			table.insert(slot1, Furniture.New({
				id = slot8
			}).getConfig(slot10, "name") .. "x" .. slot9)
		elseif slot7 == DROP_TYPE_STRATEGY then
			table.insert(slot1, strategy_data_template[slot8].name .. "x" .. slot9)
		elseif slot7 == DROP_TYPE_SKIN then
			table.insert(slot1, pg.ship_skin_template[slot8].name .. "x" .. slot9)
		elseif slot7 == DROP_TYPE_EQUIPMENT_SKIN then
			table.insert(slot1, pg.equip_skin_template[slot8].name .. "x" .. slot9)
		end
	end

	return table.concat(slot1, "、")
end

function updateDrop(slot0, slot1, slot2)
	slot2 = slot2 or {}
	slot3 = type
	slot4 = slot1.type or slot1.dropType
	slot5 = ""
	slot6 = ""
	slot8 = nil

	for slot12, slot13 in ipairs(slot7) do
		slot8 = slot0:Find(slot13[1])

		if slot4 ~= slot13[2] and not IsNil(slot8) then
			setActive(slot8, false)
		end
	end

	slot0:Find("icon_bg/frame"):GetComponent(typeof(Image)).enabled = true

	slot0(slot0, getDropRarity(slot1), slot2, true)
	slot1(findTF(slot0, "icon_bg/icon"), {
		2,
		2,
		2,
		2
	})

	if slot4 == DROP_TYPE_RESOURCE then
		slot6 = pg.item_data_statistics[id2ItemId(slot1.id)].display

		updateItem(slot0, Item.New({
			id = id2ItemId(slot1.id)
		}), slot2)
	elseif slot4 == DROP_TYPE_ITEM then
		slot6 = pg.item_data_statistics[slot1.id].display

		updateItem(slot0, Item.New({
			id = slot1.id
		}), slot2)
	elseif slot4 == DROP_TYPE_EQUIP then
		slot6 = pg.equip_data_statistics[slot1.id].descrip

		updateEquipment(slot0, Equipment.New({
			id = slot1.id
		}), slot2)
	elseif slot4 == DROP_TYPE_SIREN_EQUIP then
		slot6 = pg.equip_data_statistics[getProxy(EquipmentProxy).getEquipmentById(slot9, slot1.id).configId].descrip

		updateEquipment(slot0, getProxy(EquipmentProxy).getEquipmentById(slot9, slot1.id), slot2)
	elseif slot4 == DROP_TYPE_SHIP then
		slot9, slot10, slot11 = ShipWordHelper.GetWordAndCV(pg.ship_data_statistics[slot1.id].skin_id, ShipWordHelper.WORD_TYPE_DROP)
		slot6 = slot11 or i18n("ship_drop_desc_default")
		slot12 = Ship.New({
			configId = slot1.id,
			skin_id = slot1.skinId,
			propose = slot1.propose
		})
		slot12.remoulded = slot1.remoulded
		slot12.virgin = slot1.virgin

		updateShip(slot0, slot12, slot2)
	elseif slot4 == DROP_TYPE_NPC_SHIP then
		slot10, slot11, slot12 = ShipWordHelper.GetWordAndCV(pg.ship_data_statistics[getProxy(BayProxy):getShipById(slot1.id).configId].skin_id, ShipWordHelper.WORD_TYPE_DROP)
		slot6 = slot12 or i18n("ship_drop_desc_default")

		updateShip(slot0, slot9, slot2)
	elseif slot4 == DROP_TYPE_FURNITURE then
		slot6 = pg.furniture_data_template[slot1.id].describe

		updateFurniture(slot0, slot1.id, slot2)
	elseif slot4 == DROP_TYPE_STRATEGY then
		slot6 = pg.strategy_data_template[slot1.id].desc

		updateStrategy(slot0, Item.New({
			id = slot1.id
		}), slot2)
	elseif slot4 == DROP_TYPE_SKIN then
		slot9, slot10, slot6 = ShipWordHelper.GetWordAndCV(slot1.id, ShipWordHelper.WORD_TYPE_DROP)
		slot2.isSkin = true

		updateShip(slot0, Ship.New({
			configId = tonumber(pg.ship_skin_template[slot1.id].ship_group .. "1"),
			skin_id = slot1.id
		}), slot2)
	elseif slot4 == DROP_TYPE_EQUIPMENT_SKIN then
		updateEquipmentSkin(slot0, {
			rarity = pg.equip_skin_template[slot1.id].rarity,
			icon = pg.equip_skin_template[slot1.id].icon,
			name = pg.equip_skin_template[slot1.id].name,
			count = slot1.count
		}, slot2)
	elseif slot4 == DROP_TYPE_VITEM then
		slot6 = pg.item_data_statistics[slot1.id].display

		updateItem(slot0, Item.New({
			id = slot1.id
		}), slot2)
	elseif slot4 == DROP_TYPE_WORLD_ITEM then
		slot6 = pg.world_item_data_template[slot1.id].display

		updateWorldItem(slot0, WorldItem.New({
			id = slot1.id
		}), slot2)
	elseif slot4 == DROP_TYPE_CHAT_FRAME then
		updateAttire(slot0, AttireConst.TYPE_CHAT_FRAME, pg.item_data_chat[slot1.id], slot2)
	elseif slot4 == DROP_TYPE_ICON_FRAME then
		updateAttire(slot0, AttireConst.TYPE_ICON_FRAME, pg.item_data_frame[slot1.id], slot2)
	elseif slot4 == DROP_TYPE_EMOJI then
		slot6 = pg.emoji_template[slot1.id].item_desc

		updateEmoji(slot0, pg.emoji_template[slot1.id])
	end

	slot1.cfg = slot5
	slot1.desc = HXSet.hxLan(slot6)

	slot2(slot0, slot1.count)
end

function updateDropCfg(slot0)
	slot1 = ""
	slot2 = ""
	slot3 = slot0.type or slot0.dropType

	if slot3 == DROP_TYPE_RESOURCE then
		slot2 = pg.item_data_statistics[id2ItemId(slot0.id)].display
	elseif slot3 == DROP_TYPE_ITEM then
		slot2 = pg.item_data_statistics[slot0.id].display
	elseif slot3 == DROP_TYPE_EQUIP then
		slot2 = pg.equip_data_statistics[slot0.id].descrip
	elseif slot3 == DROP_TYPE_SIREN_EQUIP then
		slot2 = pg.equip_data_statistics[getProxy(EquipmentProxy).getEquipmentById(slot4, slot0.id).configId].descrip
	elseif slot3 == DROP_TYPE_SHIP then
		slot4, slot5, slot6 = ShipWordHelper.GetWordAndCV(pg.ship_data_statistics[slot0.id].skin_id, ShipWordHelper.WORD_TYPE_DROP)
		slot2 = slot6 or i18n("ship_drop_desc_default")
	elseif slot3 == DROP_TYPE_NPC_SHIP then
		slot5, slot6, slot7 = ShipWordHelper.GetWordAndCV(pg.ship_data_statistics[getProxy(BayProxy):getShipById(slot0.id).configId].skin_id, ShipWordHelper.WORD_TYPE_DROP)
		slot2 = slot7 or i18n("ship_drop_desc_default")
	elseif slot3 == DROP_TYPE_FURNITURE then
		slot2 = pg.furniture_data_template[slot0.id].describe
	elseif slot3 == DROP_TYPE_STRATEGY then
		slot2 = pg.strategy_data_template[slot0.id].desc
	elseif slot3 == DROP_TYPE_SKIN then
		slot1 = pg.ship_skin_template[slot0.id]
		slot4, slot5, slot2 = ShipWordHelper.GetWordAndCV(slot0.id, ShipWordHelper.WORD_TYPE_DROP)
	elseif slot3 == DROP_TYPE_EQUIPMENT_SKIN then
		slot1 = pg.equip_skin_template[slot0.id]
	elseif slot3 == DROP_TYPE_VITEM then
		slot2 = pg.item_data_statistics[slot0.id].display
	elseif slot3 == DROP_TYPE_WORLD_ITEM then
		slot2 = pg.world_item_data_template[slot0.id].display
	elseif slot3 == DROP_TYPE_CHAT_FRAME then
		slot1 = pg.item_data_chat[slot0.id]
	elseif slot3 == DROP_TYPE_ICON_FRAME then
		slot1 = pg.item_data_frame[slot0.id]
	elseif slot3 == DROP_TYPE_EMOJI then
		slot2 = pg.emoji_template[slot0.id].item_desc
	end

	slot0.cfg = slot1
	slot0.desc = HXSet.hxLan(slot2)
end

function updateAttire(slot0, slot1, slot2, slot3)
	slot4 = slot2

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. 4))
	setFrame(findTF(slot0, "icon_bg/frame"), slot5)

	slot6 = findTF(slot0, "icon_bg/icon")
	slot7 = nil

	if slot1 == AttireConst.TYPE_CHAT_FRAME then
		slot7 = "chat_frame"
	elseif slot1 == AttireConst.TYPE_ICON_FRAME then
		slot7 = "icon_frame"
	end

	GetImageSpriteFromAtlasAsync("Props/" .. slot7, "", slot6)
	slot0(slot0, HXSet.hxLan(slot4.name), slot3)
end

function updateEmoji(slot0, slot1, slot2)
	GetImageSpriteFromAtlasAsync("Props/" .. slot4, "", slot3)
	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. 4))
	setFrame(findTF(slot0, "icon_bg/frame"), slot5)
	slot0(slot0, HXSet.hxLan(slot1.name), slot2)
end

function GetOwnedpropCount(slot0)
	slot1 = 0
	slot2 = false

	if slot0.type == DROP_TYPE_RESOURCE then
		slot1 = getProxy(PlayerProxy):getRawData():getResById(slot0.id)

		if slot0.id == 1 or slot0.id == 2 then
			slot2 = true
		end
	elseif slot3 == DROP_TYPE_ITEM then
		slot1 = getProxy(BagProxy):getItemCountById(slot0.id)
		slot2 = true
	elseif slot3 == DROP_TYPE_EQUIP then
		slot1 = (getProxy(EquipmentProxy):getEquipmentById(slot0.id) and slot4.count) or 0
	elseif slot3 == DROP_TYPE_SHIP then
		slot1 = getProxy(BayProxy):getConfigShipCount(slot0.id)
	elseif slot3 == DROP_TYPE_FURNITURE then
		slot1 = getProxy(DormProxy):getFurnitrueCount(slot0.id)
	elseif slot3 == DROP_TYPE_STRATEGY then
	elseif slot3 == DROP_TYPE_SKIN then
		slot1 = getProxy(ShipSkinProxy):getSkinCountById(slot0.id)
	elseif slot3 == DROP_TYPE_VITEM then
	elseif slot3 == DROP_TYPE_EQUIPMENT_SKIN then
		return (getProxy(EquipmentProxy):getEquipmnentSkinById(slot0.id) and slot4.count) or 0, slot2
	end
end

function updateEquipmentSkin(slot0, slot1, slot2)
	slot3 = EquipmentRarity.Rarity2Print(slot1.rarity)

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. slot3))
	setFrame(findTF(slot0, "icon_bg/frame"), slot3, "frame7")
	GetImageSpriteFromAtlasAsync("equips/" .. slot1.icon, "", slot4)
	slot0(slot0, false)
	slot1(slot0, 0, slot1.expired_date)

	-- Decompilation error in this vicinity:
	slot2 or {}(slot0, slot1.name, 
	-- Decompilation error in this vicinity:
	slot2 or )
	slot3(slot0, slot1.count)

	-- Decompilation error in this vicinity:
	findTF(slot0, "icon_bg/icon")(slot0, slot1.rarity, 
	-- Decompilation error in this vicinity:
	slot2 or )
end

function getDropRarity(slot0)
	slot1 = 1

	if slot0.type == DROP_TYPE_RESOURCE then
		slot1 = pg.item_data_statistics[id2ItemId(slot0.id)].rarity + 1
	elseif slot2 == DROP_TYPE_ITEM then
		slot1 = pg.item_data_statistics[slot0.id].rarity + 1
	elseif slot2 == DROP_TYPE_EQUIP then
		slot1 = pg.equip_data_statistics[slot0.id].rarity
	elseif slot2 == DROP_TYPE_SHIP then
		slot1 = pg.ship_data_statistics[slot0.id].rarity
	elseif slot2 == DROP_TYPE_FURNITURE then
		slot1 = pg.furniture_data_template[slot0.id].comfortable + 1
	elseif slot2 == DROP_TYPE_STRATEGY then
		slot1 = 1
	elseif slot2 == DROP_TYPE_SKIN then
		slot1 = 5
	end

	return slot1
end

function NoPosMsgBox(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot5 = {}

	if slot1 then
		table.insert(slot5, {
			text = "text_noPos_clear",
			atuoClose = true,
			onCallback = slot1
		})
	end

	if slot2 then
		table.insert(slot5, {
			text = "text_noPos_buy",
			atuoClose = true,
			onCallback = slot2
		})
	end

	if slot3 then
		table.insert(slot5, {
			text = "text_noPos_intensify",
			atuoClose = true,
			onCallback = slot3
		})
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		hideNo = true,
		content = slot0,
		custom = slot5,
		weight = LayerWeightConst.TOP_LAYER
	})
end

function openDestroyEquip()
	if pg.m02:hasMediator(EquipmentMediator.__cname) then
		if getProxy(ContextProxy).getCurrentContext(slot0):getContextByMediator(EquipmentMediator) and slot2.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = slot2
			})
		else
			pg.m02:sendNotification(EquipmentMediator.BATCHDESTROY_MODE)

			return
		end
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {
		warp = StoreHouseConst.WARP_TO_WEAPON,
		mode = StoreHouseConst.DESTORY
	})
end

function openDockyardClear()
	slot0 = {}

	for slot5, slot6 in pairs(slot1) do
		if slot6:isActivityNpc() and not table.contains(slot0, slot6.id) then
			table.insert(slot0, slot6.id)
		end
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
		blockLock = true,
		prevFlag = false,
		selectedMax = 10,
		skipSelect = true,
		mode = DockyardScene.MODE_DESTROY,
		leftTopInfo = i18n("word_destroy"),
		onShip = Ship.canDestroyShip,
		ignoredIds = slot0
	})
end

function openDockyardIntensify()
	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
		prevFlag = false,
		mode = DockyardScene.MODE_OVERVIEW,
		onClick = function (slot0, slot1)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				page = 3,
				shipId = slot0.id,
				shipVOs = slot1
			})
		end
	})
end

function GoShoppingMsgBox(slot0, slot1, slot2)
	if slot2 then
		slot3 = ""

		for slot7, slot8 in ipairs(slot2) do
			slot3 = slot3 .. i18n((slot8[1] == 59001 and "text_noRes_info_tip") or "text_noRes_info_tip2", pg.item_data_statistics[slot8[1]].name, slot8[2])

			if slot7 < #slot2 then
				slot3 = slot3 .. i18n("text_noRes_info_tip_link")
			end
		end

		if slot3 ~= "" then
			slot0 = slot0 .. "\n" .. i18n("text_noRes_tip", slot3)
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = slot0,
		weight = LayerWeightConst.SECOND_LAYER,
		onYes = function ()
			gotoChargeScene(gotoChargeScene, )
		end
	})
end

function shoppingBatch(slot0, slot1, slot2, slot3, slot4)
	if math.floor(getProxy(PlayerProxy).getData(slot6)[id2res(pg.shop_template[slot0].resource_type)] / (slot1.price or slot5.resource_num)) <= 0 then
		slot10 = 1
	end

	if slot2 ~= nil and slot2 < slot10 then
		slot10 = slot2 or slot10
		slot11 = true
		slot12 = 1
	end

	if slot5 ~= nil and slot1.id then
		print(slot10 * slot5.num, "--", slot10)

		slot13 = Item.New({
			id = slot1.id
		}):getConfig("name")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			needCounter = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = slot1.id
			},
			addNum = slot5.num,
			maxNum = slot10 * slot5.num,
			defaultNum = slot5.num,
			numUpdate = function (slot0, slot1)
				if slot0 < slot0 *  then
					setText(slot0, i18n(slot4, slot2, slot1, COLOR_RED, i18n))

					slot6 = false
				else
					setText(slot0, i18n(slot4, slot2, slot1, COLOR_GREEN, i18n))

					slot6 = true
				end
			end,
			onYes = function ()
				if slot0 then
					pg.m02:sendNotification(GAME.SHOPPING, {
						id = slot1,
						count = GAME.SHOPPING
					})
				elseif slot3 then
					pg.TipsMgr.GetInstance():ShowTips(i18n(slot3))
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
				end
			end
		})
	end
end

function gotoChargeScene(slot0, slot1)
	if pg.m02:hasMediator(ChargeMediator.__cname) then
		if getProxy(ContextProxy).getCurrentContext(slot2):getContextByMediator(ShopsMediator) then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = slot4
			})
		end

		if slot0 then
			pg.m02:sendNotification(PlayerResource.GO_MALL, {
				type = slot0,
				noRes = slot1
			})
		end
	else
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
			wrap = slot0 or ChargeScene.TYPE_ITEM,
			noRes = slot1
		})
	end
end

function clearDrop(slot0)
	clearImageSprite(slot1)
	clearImageSprite(slot2)
	clearImageSprite(findTF(slot0, "icon_bg/icon"))

	if findTF(slot0, "icon_bg/icon/icon") then
		clearImageSprite(slot4)
	end
end

slot11 = {
	red = Color.New(1, 0.25, 0.25),
	blue = Color.New(0.11, 0.55, 0.64),
	yellow = Color.New(0.92, 0.52, 0)
}

function updateSkill(slot0, slot1, slot2, slot3)
	slot4 = findTF(slot0, "skill")
	slot5 = findTF(slot0, "lock")
	slot6 = findTF(slot0, "unknown")

	if slot1 then
		setActive(slot4, true)
		setActive(slot6, false)
		setActive(slot5, not slot2)
		LoadImageSpriteAsync("skillicon/" .. slot1.icon, findTF(slot4, "icon"))
		setText(findTF(slot4, "name"), shortenString(getSkillName(slot1.id), slot3 or 8))
		setText(findTF(slot4, "level"), "LEVEL: " .. ((slot2 and slot2.level) or "??"))
		setTextColor(setText, slot0[slot1.color or "blue"])
	else
		setActive(slot4, false)
		setActive(slot6, true)
		setActive(slot5, false)
	end
end

slot12 = true

function onBackButton(slot0, slot1, slot2, slot3)
	slot4 = GetOrAddComponent(slot1, "UILongPressTrigger")
	slot4.longPressThreshold = defaultValue(slot3, 1)

	pg.DelegateInfo.Add(slot0, slot6)
	slot4.onReleased.RemoveAllListeners(slot6)
	slot4.onReleased.AddListener(slot6, slot5(function (slot0)
		slot0:emit(BaseUI.ON_BACK)
	end))
	pg.DelegateInfo.Add(slot0, slot7)
	slot4.onLongPressed.RemoveAllListeners(slot7)
	slot4.onLongPressed:AddListener(
	-- Decompilation error in this vicinity:
	function (slot0)
		return function ()
			if slot0 then
				playSoundEffect(SOUND_BACK)
			end

			slot0, slot1 = slot1()

			if slot0 then
				slot2(slot1)
			end
		end
	end(function (slot0)
		slot0:emit(BaseUI.ON_HOME)
	end))
end

function GetZeroTime()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0)
end

function GetHalfHour()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0, 1800)
end

function GetNextHour(slot0)
	slot2, slot3 = pg.TimeMgr.GetInstance():parseTimeFrom(slot1)

	return slot2 * 86400 + (slot3 + slot0) * 3600
end

function shortenString(slot0, slot1)
	slot2 = 0
	slot3 = 0
	slot4 = 0
	slot5 = #slot0

	while slot2 < slot5 do
		slot7 = 1

		if string.byte(slot0, slot2 + 1) < 128 then
			slot2 = slot2 + 1
			slot7 = 0.5
		elseif slot6 >= 192 and slot6 < 224 then
			slot2 = slot2 + 2
		elseif slot6 >= 224 and slot6 < 240 then
			slot2 = slot2 + 3
		elseif slot6 >= 240 and slot6 < 248 then
			slot2 = slot2 + 4
		elseif slot6 >= 248 and slot6 < 252 then
			slot2 = slot2 + 5
		elseif slot6 >= 252 and slot6 < 254 then
			slot2 = slot2 + 6
		else
			error("invalid utf8 string")
		end

		if slot1 <= slot3 + slot7 then
			slot4 = slot2

			break
		end
	end

	if slot4 == 0 or slot4 == slot5 then
		return slot0
	end

	return string.sub(slot0, 1, slot4) .. ".."
end

function nameValidityCheck(slot0, slot1, slot2, slot3)
	slot4 = true
	slot5, slot6 = utf8_to_unicode(slot0)
	slot7 = filterEgyUnicode(filterSpecChars(slot0))
	slot8 = wordVer(slot0)

	if not checkSpaceValid(slot0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n(slot3[1]))

		slot4 = false
	elseif slot8 > 0 or slot7 ~= slot0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(slot3[4]))

		slot4 = false
	elseif slot6 < slot1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(slot3[2]))

		slot4 = false
	elseif slot2 < slot6 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(slot3[3]))

		slot4 = false
	end

	return slot4
end

function checkSpaceValid(slot0)
	if PLATFORM_CODE == PLATFORM_US then
		return true
	end

	return slot0 == string.gsub(string.gsub(slot0, " ", ""), "　", "")
end

function filterSpecChars(slot0)
	slot1 = {}
	slot2 = 0
	slot3 = 0
	slot4 = 0

	for slot8 = 1, #slot0, 1 do
		if not string.byte(slot0, slot8) then
			break
		end

		if (slot9 >= 48 and slot9 <= 57) or (slot9 >= 65 and slot9 <= 90) or (slot9 >= 97 and slot9 <= 122) then
			table.insert(slot1, string.char(slot9))
		elseif slot9 >= 228 and slot9 <= 233 then
			slot11 = string.byte(slot0, slot8 + 2)

			if string.byte(slot0, slot8 + 1) and slot11 and slot10 >= 128 and slot10 <= 191 and slot11 >= 128 and slot11 <= 191 then
				slot8 = slot8 + 2

				table.insert(slot1, string.char(slot9, slot10, slot11))

				slot2 = slot2 + 1
			end
		elseif slot9 == 227 and PLATFORM_CODE == PLATFORM_JP then
			slot11 = string.byte(slot0, slot8 + 2)

			if string.byte(slot0, slot8 + 1) and slot11 and slot10 > 128 and slot10 <= 191 and slot11 >= 128 and slot11 <= 191 then
				slot8 = slot8 + 2

				table.insert(slot1, string.char(slot9, slot10, slot11))

				slot3 = slot3 + 1
			end
		elseif slot9 > 233 and PLATFORM_CODE == PLATFORM_KR then
			slot11 = string.byte(slot0, slot8 + 2)

			if string.byte(slot0, slot8 + 1) and slot11 and slot10 >= 128 and slot10 <= 191 and slot11 >= 128 and slot11 <= 191 then
				slot8 = slot8 + 2

				table.insert(slot1, string.char(slot9, slot10, slot11))

				slot4 = slot4 + 1
			end
		elseif PLATFORM_CODE == PLATFORM_US then
			if slot8 ~= 1 and slot9 == 32 then
				if string.byte(slot0, slot8 + 1) == 32 then
					slot8 = slot8 + 1
				else
					table.insert(slot1, string.char(slot9))
				end
			end

			if slot9 == 195 and string.byte(slot0, slot8 + 1) == 188 then
				table.insert(slot1, string.char(slot9, slot10))
			end
		end

		if slot9 == 95 then
			table.insert(slot1, string.char(slot9))
		end
	end

	return table.concat(slot1), slot2 + slot3 + slot4
end

function filterEgyUnicode(slot0)
	return string.gsub(string.gsub(slot0, "\\xf0\\x93[\\x80-\\x8f][\\x80-\\xbf]", ""), "\\xf0\\x93\\x90[\\x80-\\xaf]", "")
end

function shiftPanel(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-5, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-16, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 19-20, warpins: 2 ---
	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot3 = 0.2
		--- END OF BLOCK #0 ---



	end

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-11, warpins: 1 ---
		LeanTween.cancel(go(slot0))
		--- END OF BLOCK #0 ---



	end

	slot9 = rtf(slot0)

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-18, warpins: 1 ---
		slot1 = slot9.anchoredPosition.x
		--- END OF BLOCK #0 ---



	end

	slot2 = slot2 or slot9.anchoredPosition.y

	LeanTween.move(slot9, Vector3(slot1, slot2 or slot9.anchoredPosition.y, 0), slot3):setEase(slot7 or LeanTweenType.easeInOutSine)

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #4 21-22, warpins: 1 ---
	slot2 = slot9.anchoredPosition.y
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 23-34, warpins: 2 ---
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #6 35-36, warpins: 1 ---
	slot7 = LeanTweenType.easeInOutSine

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 37-42, warpins: 2 ---
	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 43-46, warpins: 1 ---
		slot10:setDelay(slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 47-48, warpins: 2 ---
	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 49-54, warpins: 1 ---
		GetOrAddComponent(slot0, "CanvasGroup").blocksRaycasts = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 55-63, warpins: 2 ---
	slot10:setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-5, warpins: 1 ---
			slot0()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-8, warpins: 2 ---
		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-14, warpins: 1 ---
			GetOrAddComponent(slot2, "CanvasGroup").blocksRaycasts = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 15-15, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end))

	return slot10
	--- END OF BLOCK #9 ---



end

function TweenValue(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-27, warpins: 1 ---
	slot9 = LeanTween.value(go(slot0), slot1, slot2, slot3):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-7, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-5, warpins: 1 ---
			slot0()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-6, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end))
	slot8 = LeanTween.value(go(slot0), slot1, slot2, slot3).setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-7, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)).setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-5, warpins: 1 ---
			slot0()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-6, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)).setDelay

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-28, warpins: 1 ---
		slot10 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 29-31, warpins: 2 ---
	slot8 = slot8(slot9, slot10)

	if slot7 and slot7 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-38, warpins: 1 ---
		slot8:setRepeat(slot7)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 39-40, warpins: 3 ---
	return slot8
	--- END OF BLOCK #2 ---



end

function rotateAni(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	return LeanTween.rotate(rtf(slot0), 360 * slot1, slot2):setLoopClamp()
	--- END OF BLOCK #0 ---



end

function blinkAni(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot4 = LeanTween.alpha
	slot5 = rtf(slot0)

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		slot6 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-19, warpins: 2 ---
	slot5 = slot4(slot5, slot6, slot1):setEase(LeanTweenType.easeInOutSine)
	slot4 = slot4(slot5, slot6, slot1).setEase(LeanTweenType.easeInOutSine).setLoopPingPong

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-20, warpins: 1 ---
		slot6 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 21-21, warpins: 2 ---
	return slot4(slot5, slot6)
	--- END OF BLOCK #2 ---



end

function scaleAni(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot4 = LeanTween.scale
	slot5 = rtf(slot0)

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		slot6 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-14, warpins: 2 ---
	slot5 = slot4(slot5, slot6, slot1)
	slot4 = slot4(slot5, slot6, slot1).setLoopPingPong

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-15, warpins: 1 ---
		slot6 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-16, warpins: 2 ---
	return slot4(slot5, slot6)
	--- END OF BLOCK #2 ---



end

function floatAni(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot6 = LeanTween.moveY(rtf(slot0), slot0.localPosition.y + slot1, slot2)
	slot5 = LeanTween.moveY(rtf(slot0), slot0.localPosition.y + slot1, slot2).setLoopPingPong

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-16, warpins: 1 ---
		slot7 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-17, warpins: 2 ---
	return slot5(slot6, slot7)
	--- END OF BLOCK #1 ---



end

slot13 = tostring

function tostring(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot0 == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-4, warpins: 1 ---
		return "nil"
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 2 ---
	if slot0(slot0) == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-14, warpins: 1 ---
		if type(slot0) == "table" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-16, warpins: 1 ---
			return "{}"
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 17-18, warpins: 2 ---
		return " ~nil"
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-19, warpins: 2 ---
	return slot1
	--- END OF BLOCK #2 ---



end

function wordVer(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot1 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-10, warpins: 2 ---
	if #filterEgyUnicode(slot0) ~= #slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-13, warpins: 1 ---
		if slot1.isReplace then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-15, warpins: 1 ---
			slot0 = slot2
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-17, warpins: 1 ---
			return 1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-27, warpins: 3 ---
	slot3 = wordSplit(slot0)
	slot4 = pg.word_template
	slot5 = pg.word_legal_template

	if not slot1.isReplace then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-28, warpins: 1 ---
		slot6 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 29-32, warpins: 2 ---
	slot1.isReplace = slot6

	if not slot1.replaceWord then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-33, warpins: 1 ---
		slot6 = "*"
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 34-38, warpins: 2 ---
	slot1.replaceWord = slot6
	slot6 = #slot3
	slot7 = 1
	slot8 = ""
	slot9 = 0

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 39-40, warpins: 5 ---
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 41-83, warpins: 0 ---
	while slot7 <= slot6 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-41, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 42-48, warpins: 1 ---
		slot10, slot11, slot12 = wordLegalMatch(slot3, slot5, slot7)

		if slot10 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 49-53, warpins: 1 ---
			slot7 = slot11
			slot8 = slot8 .. slot12

			if slot8 .. slot12 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 54-65, warpins: 1 ---
				slot13, slot14, slot15 = wordVerMatch(slot3, slot4, slot1, slot7, "", false, slot7, "")

				if slot13 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 66-70, warpins: 1 ---
					slot7 = slot14
					slot9 = slot9 + 1

					if slot1.isReplace then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 71-74, warpins: 1 ---
						if slot8 .. slot15 or slot1.isReplace then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 78-80, warpins: 1 ---
							slot8 = slot8 .. slot3[slot7]
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 81-82, warpins: 2 ---
						slot7 = slot7 + 1
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 83-83, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 83-85, warpins: 1 ---
	if slot1.isReplace then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 86-89, warpins: 1 ---
		return slot9, slot8
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 90-90, warpins: 1 ---
		return slot9
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 91-91, warpins: 2 ---
	return
	--- END OF BLOCK #8 ---



end

function wordLegalMatch(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot2 > #slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		return slot3, slot2, slot4
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-11, warpins: 2 ---
	slot6 = slot1[slot0[slot2]]

	if slot4 == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-13, warpins: 1 ---
		slot4 = ""
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-15, warpins: 2 ---
	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-18, warpins: 1 ---
		if slot6.this then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-28, warpins: 1 ---
			return wordLegalMatch(slot0, slot6, slot2 + 1, true, slot4 .. slot5)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-38, warpins: 1 ---
			return wordLegalMatch(slot0, slot6, slot2 + 1, false, slot4 .. slot5)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-42, warpins: 1 ---
		return slot3, slot2, slot4
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 43-43, warpins: 3 ---
	return
	--- END OF BLOCK #3 ---



end

function wordVerMatch(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot3 > #slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		return slot5, slot6, slot7
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-11, warpins: 2 ---
	if slot1[slot0[slot3]] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-14, warpins: 1 ---
		if slot9.this then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-17, warpins: 1 ---
			if slot2.isReplace then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 18-32, warpins: 1 ---
				return wordVerMatch(slot0, slot9, slot2, slot3 + 1, slot4 .. slot2.replaceWord, true, slot3 + 1, slot4 .. slot2.replaceWord)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-43, warpins: 1 ---
				return wordVerMatch(slot0, slot9, slot2, slot3 + 1, slot4, true, slot3 + 1, slot4)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 44-46, warpins: 1 ---
			if slot2.isReplace then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 47-59, warpins: 1 ---
				return wordVerMatch(slot0, slot9, slot2, slot3 + 1, slot4 .. slot2.replaceWord, slot5, slot6, slot7)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 60-70, warpins: 1 ---
				return wordVerMatch(slot0, slot9, slot2, slot3 + 1, slot4, slot5, slot6, slot7)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 71-74, warpins: 1 ---
		return slot5, slot6, slot7
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 75-75, warpins: 5 ---
	return
	--- END OF BLOCK #2 ---



end

function wordSplit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot1 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-11, warpins: 0 ---
	for slot5 in slot0:gmatch("[-\\xc2-\\xf4][\\x80-\\xbf]*") do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-9, warpins: 1 ---
		slot1[#slot1 + 1] = slot5
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-11, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-12, warpins: 1 ---
	return slot1
	--- END OF BLOCK #2 ---



end

function contentWrap(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	if #LuaHelper.WrapContent(slot0, slot1, slot2) == #slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-12, warpins: 1 ---
		slot4 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-13, warpins: 1 ---
		slot4 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-15, warpins: 2 ---
	return slot4, slot3
	--- END OF BLOCK #1 ---



end

function cancelRich(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = nil

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-18, warpins: 0 ---
	for slot5 = 1, 20, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-16, warpins: 2 ---
		slot0, slot1 = string.gsub(slot0, "<([^>]*)>", "%1")

		if slot7 <= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-17, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-18, warpins: 1 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-19, warpins: 2 ---
	return slot0
	--- END OF BLOCK #2 ---



end

function filterCharForiOS(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

function getSkillConfig(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if not require("GameCfg.buff.buff_" .. slot0) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-13, warpins: 1 ---
		warn("找不到技能配置: " .. slot0)

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-37, warpins: 1 ---
	slot2 = Clone(slot1)
	slot2.name = getSkillName(slot0)
	slot2.desc = HXSet.hxLan(slot2.desc)
	slot2.desc_get = HXSet.hxLan(slot2.desc_get)

	_.each(slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0.desc = HXSet.hxLan(slot0.desc)

		return
		--- END OF BLOCK #0 ---



	end)

	return slot2
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 38-38, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

function getSkillName(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if not pg.skill_data_template[slot0] and not pg.skill_data_display[slot0] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-12, warpins: 1 ---
		return ""
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-16, warpins: 3 ---
	return HXSet.hxLan(slot1.name)
	--- END OF BLOCK #1 ---



end

function getSkillDescGet(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if not pg.skill_data_template[slot0] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		return ""
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-10, warpins: 2 ---
	if slot1.desc_get == "" or not slot1.desc_get then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-14, warpins: 2 ---
		slot2 = slot1.desc
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-18, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 19-47, warpins: 0 ---
	for slot6, slot7 in pairs(slot1.desc_get_add) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-25, warpins: 1 ---
		slot8 = setColorStr(slot7[1], COLOR_GREEN)

		if slot7[2] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-37, warpins: 1 ---
			slot8 = slot8 .. specialGSub(i18n("word_skill_desc_get"), "$1", setColorStr(slot7[2], COLOR_GREEN))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 38-45, warpins: 2 ---
		slot2 = specialGSub(slot2, "$" .. slot6, slot8)
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 46-47, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 48-51, warpins: 1 ---
	return HXSet.hxLan(slot2)
	--- END OF BLOCK #4 ---



end

function getSkillDescLearn(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if not pg.skill_data_template[slot0] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		return ""
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-11, warpins: 2 ---
	slot3 = slot2.desc

	if not slot2.desc_add then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-15, warpins: 1 ---
		return HXSet.hxLan(slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-19, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 20-48, warpins: 0 ---
	for slot7, slot8 in pairs(slot2.desc_add) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-25, warpins: 1 ---
		slot9 = slot8[slot1][1]

		if slot8[slot1][2] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-35, warpins: 1 ---
			slot9 = slot9 .. specialGSub(i18n("word_skill_desc_learn"), "$1", slot8[slot1][2])
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 36-46, warpins: 2 ---
		slot3 = specialGSub(slot3, "$" .. slot7, setColorStr(slot9, COLOR_YELLOW))
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 47-48, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 49-52, warpins: 1 ---
	return HXSet.hxLan(slot3)
	--- END OF BLOCK #4 ---



end

function getSkillDesc(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if not pg.skill_data_template[slot0] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		return ""
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-11, warpins: 2 ---
	slot3 = slot2.desc

	if not slot2.desc_add then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-15, warpins: 1 ---
		return HXSet.hxLan(slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-19, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 20-34, warpins: 0 ---
	for slot7, slot8 in pairs(slot2.desc_add) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-32, warpins: 1 ---
		slot3 = specialGSub(slot3, "$" .. slot7, setColorStr(slot8[slot1][1], COLOR_GREEN))
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 33-34, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 35-38, warpins: 1 ---
	return HXSet.hxLan(slot3)
	--- END OF BLOCK #4 ---



end

function specialGSub(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-36, warpins: 1 ---
	return string.gsub(string.gsub(string.gsub(string.gsub(slot0, "<color=#", "<color=NNN"), "#", ""), slot1, slot2), "<color=NNN", "<color=#")
	--- END OF BLOCK #0 ---



end

function topAnimation(slot0, slot1, slot2, slot3, slot4, slot5)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot6 = {}

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		slot4 = 0.27
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-7, warpins: 2 ---
	slot7 = 0.05

	if slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-29, warpins: 1 ---
		setAnchoredPosition(slot0, {
			x = slot0.transform.localPosition.x - 500
		})
		shiftPanel(slot0, slot8, nil, 0.05, slot4, true, true)
		setActive(slot0, true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 30-45, warpins: 2 ---
	setActive(slot1, false)
	setActive(slot2, false)
	setActive(slot3, false)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 46-76, warpins: 0 ---
	for slot11 = 1, 3, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-76, warpins: 2 ---
		table.insert(slot6, LeanTween.delayedCall(slot4 + 0.13 + slot7 * slot11, System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-10, warpins: 1 ---
				setActive(setActive, not slot0.gameObject.activeSelf)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 11-11, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)).uniqueId)
		table.insert(slot6, LeanTween.delayedCall(slot4 + 0.02 + slot7 * slot11, System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-11, warpins: 1 ---
				setActive(setActive, not go(setActive).activeSelf)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 12-14, warpins: 2 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-22, warpins: 1 ---
				setActive(slot1, not go(slot1).activeSelf)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 23-23, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



		end)).uniqueId)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 77-78, warpins: 1 ---
	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 79-94, warpins: 1 ---
		table.insert(slot6, LeanTween.delayedCall(slot4 + 0.13 + slot7 * 3 + 0.1, System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			slot0()

			return
			--- END OF BLOCK #0 ---



		end)).uniqueId)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 95-96, warpins: 2 ---
	return slot6
	--- END OF BLOCK #5 ---



end

function cancelTweens(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-7, warpins: 1 ---
		LeanTween:cancelAll()

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-11, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-19, warpins: 0 ---
	for slot4, slot5 in ipairs(slot0) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-13, warpins: 1 ---
		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-17, warpins: 1 ---
			LeanTween.cancel(slot5)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-19, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 20-20, warpins: 1 ---
	return
	--- END OF BLOCK #3 ---



end

function calcRelativeRectPos(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-32, warpins: 1 ---
	slot4 = slot2.x + slot1.width / 2
	slot5 = (slot2.x + slot2.width) - slot1.width / 2
	slot6 = slot2.y + slot1.height / 2
	slot7 = (slot2.y + slot2.height) - slot1.height / 2

	function slot8(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0 > slot0.x or slot0.x >  or slot2 > slot0.y or slot0.y > slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-18, warpins: 4 ---
			slot1 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-19, warpins: 1 ---
			slot1 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 20-20, warpins: 2 ---
		return slot1
		--- END OF BLOCK #1 ---



	end

	slot10 = Quaternion.Euler(0, 0, slot9)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 33-45, warpins: 0 ---
	for slot14 = 360 / 10, 1, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-41, warpins: 2 ---
		pos = slot0.center + slot10 * slot3

		if slot8(pos) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-44, warpins: 1 ---
			return pos
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 45-45, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 46-71, warpins: 1 ---
	return _.min({
		Vector2(slot4, slot6),
		Vector2(slot4, slot7),
		Vector2(slot5, slot7),
		Vector2(slot5, slot6)
	}, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		return Vector2.Distance(slot0, slot0.center)
		--- END OF BLOCK #0 ---



	end)
	--- END OF BLOCK #2 ---



end

function getOfflineTimeStamp(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot3 = ""

	if pg.TimeMgr.GetInstance():GetServerTime() - slot0 <= 59 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-17, warpins: 1 ---
		slot3 = i18n("just_now")
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-20, warpins: 1 ---
		if slot2 <= 3599 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-29, warpins: 1 ---
			slot3 = i18n("several_minutes_before", math.floor(slot2 / 60))
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-32, warpins: 1 ---
			if slot2 <= 86399 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-41, warpins: 1 ---
				slot3 = i18n("several_hours_before", math.floor(slot2 / 3600))
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 42-49, warpins: 1 ---
				slot3 = i18n("several_days_before", math.floor(slot2 / 86400))
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 50-50, warpins: 4 ---
	return slot3
	--- END OF BLOCK #1 ---



end

function playMovie(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	if not IsNil(GameObject.Find("OverlayCamera/Overlay/UITop/MoviePanel")) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-24, warpins: 1 ---
		pg.UIMgr.GetInstance():LoadingOn()
		WWWLoader.Inst:LoadStreamingAsset(slot0, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-61, warpins: 1 ---
			pg.UIMgr.GetInstance():LoadingOff()

			slot1 = GCHandle.Alloc(slot0, GCHandleType.Pinned)

			setActive(slot0, true)

			slot2 = slot0:AddComponent(typeof(CriManaMovieControllerForUI))

			slot2.player:SetData(slot0, slot0.Length)

			slot2.target = slot0:GetComponent(typeof(Image))
			slot2.loop = false
			slot2.additiveMode = false
			slot2.playOnStart = true
			slot3 = nil

			Timer.New(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-9, warpins: 1 ---
				if slot0.player.status == CriMana.Player.Status.PlayEnd or slot0.player.status == CriMana.Player.Status.Stop or slot0.player.status == CriMana.Player.Status.Error then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 28-46, warpins: 3 ---
					slot1:Stop()
					Object.Destroy(Object.Destroy)
					GCHandle.Free(slot2)
					setActive(slot3, false)

					if slot4 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 47-48, warpins: 1 ---
						slot4()
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 49-49, warpins: 3 ---
				return
				--- END OF BLOCK #1 ---



			end, 0.2, -1).Start(slot3)
			removeOnButton(slot0)

			if slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 62-67, warpins: 1 ---
				onButton(nil, slot0, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-10, warpins: 1 ---
					slot0:Stop()
					slot1.onClick:RemoveAllListeners()

					return
					--- END OF BLOCK #0 ---



				end, SFX_CANCEL)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 68-69, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-26, warpins: 1 ---
		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-28, warpins: 1 ---
			slot1()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 29-30, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

PaintCameraAdjustOn = false

function cameraPaintViewAdjust(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if PaintCameraAdjustOn ~= slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-15, warpins: 1 ---
		slot1 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(CanvasScaler))

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-28, warpins: 1 ---
			CameraUtil.AutoAdapt = false

			CameraUtil.Revert()

			slot1.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight
			slot1.matchWidthOrHeight = 1
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-44, warpins: 1 ---
			CameraUtil.AutoAdapt = true
			CameraUtil.CurrentWidth = 1
			CameraUtil.CurrentHeight = 1
			CameraUtil.AspectRatio = 1.7777777777777777
			slot1.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 45-45, warpins: 2 ---
		PaintCameraAdjustOn = slot0
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 46-46, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function ManhattonDist(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	return math.abs(slot0.row - slot1.row) + math.abs(slot0.column - slot1.column)
	--- END OF BLOCK #0 ---



end

function checkFirstHelpShow(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	if not getProxy(SettingsProxy):checkReadHelp(slot0) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-28, warpins: 1 ---
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[slot0].tip
		})
		slot1:recordReadHelp(slot0)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 29-29, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

preOrientation = nil
preNotchFitterEnabled = false

function openPortrait(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-25, warpins: 1 ---
	enableNotch(slot0, true)

	preOrientation = Input.deviceOrientation:ToString()

	print("Begining Orientation:" .. preOrientation)

	Screen.autorotateToPortrait = true
	Screen.autorotateToPortraitUpsideDown = true

	cameraPaintViewAdjust(true)

	return
	--- END OF BLOCK #0 ---



end

function closePortrait(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-32, warpins: 1 ---
	enableNotch(slot0, false)

	Screen.autorotateToPortrait = false
	Screen.autorotateToPortraitUpsideDown = false

	print("Closing Orientation:" .. preOrientation)

	Screen.orientation = ScreenOrientation.LandscapeLeft
	slot1 = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		Screen.orientation = ScreenOrientation.AutoRotation

		return
		--- END OF BLOCK #0 ---



	end, 0.2, 1):Start()

	cameraPaintViewAdjust(false)

	return
	--- END OF BLOCK #0 ---



end

function enableNotch(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot0 == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-14, warpins: 2 ---
	slot0:GetComponent("NotchAdapt").enabled = slot1

	if slot0:GetComponent("AspectRatioFitter") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-16, warpins: 1 ---
		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-19, warpins: 1 ---
			slot3.enabled = preNotchFitterEnabled
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-23, warpins: 1 ---
			preNotchFitterEnabled = slot3.enabled
			slot3.enabled = false
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 24-24, warpins: 3 ---
	return
	--- END OF BLOCK #2 ---



end

function comma_value(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot1 = slot0
	slot2 = 0

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-3, warpins: 3 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 4-16, warpins: 0 ---
	while true do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-13, warpins: 1 ---
		slot1, slot2 = string.gsub(slot1, "^(-?%d+)(%d%d%d)", "%1,%2")

		if slot4 == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-14, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-15, warpins: 0 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-16, warpins: 0 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 16-16, warpins: 1 ---
	return slot1
	--- END OF BLOCK #3 ---



end

function SwitchPanel(slot0, slot1, slot2, slot3, slot4, slot5)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot3 = defaultValue(slot3, SWITCH_PANEL_TIME)

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-13, warpins: 1 ---
		LeanTween.cancel(go(slot0))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-33, warpins: 2 ---
	slot6 = Vector3.New(tf(slot0).localPosition.x, tf(slot0).localPosition.y, tf(slot0).localPosition.z)

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-34, warpins: 1 ---
		slot6.x = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 35-36, warpins: 2 ---
	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-37, warpins: 1 ---
		slot6.y = slot2
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 38-52, warpins: 2 ---
	slot7 = LeanTween.move(rtf(slot0), slot6, slot3):setEase(LeanTweenType.easeInOutSine)

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 53-56, warpins: 1 ---
		slot7:setDelay(slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 57-57, warpins: 2 ---
	return slot7
	--- END OF BLOCK #4 ---



end

function getSpecialItemPage(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	return ({
		{
			mediator = AssignedShipMediator,
			viewComponent = AssignedShipScene
		},
		{
			mediator = AssignedShipMediator,
			viewComponent = AssignedShipScene2
		},
		{
			mediator = AssignedShipMediator,
			viewComponent = AssignedShipScene3
		}
	})[slot0]
	--- END OF BLOCK #0 ---



end

function updateActivityTaskStatus(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot1 = slot0:getConfig("config_id")
	slot2, slot3 = getActivityTask(slot0, true)

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-12, warpins: 1 ---
		if slot1 == 0 or slot1 == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-28, warpins: 2 ---
			pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
				cmd = 1,
				activity_id = slot0.id,
				arg1 = slot2
			})

			return true
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-30, warpins: 1 ---
			if slot1 == 2 or slot1 == 3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-44, warpins: 2 ---
				pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
					cmd = 1,
					activity_id = slot0.id
				})

				return true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 45-46, warpins: 4 ---
	return false
	--- END OF BLOCK #1 ---



end

function setShipCardFrame(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot0.localScale = Vector3.one
	slot0.anchorMin = Vector2.zero
	slot0.anchorMax = Vector2.one
	slot3 = setImageSprite
	slot4 = slot0
	slot5 = GetSpriteFromAtlas
	slot6 = "shipframe"

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-16, warpins: 1 ---
		slot7 = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-19, warpins: 2 ---
	slot3(slot4, slot5(slot6, slot7))

	return
	--- END OF BLOCK #1 ---



end

function setRectShipCardFrame(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot0.localScale = Vector3.one
	slot0.anchorMin = Vector2.zero
	slot0.anchorMax = Vector2.one
	slot3 = setImageSprite
	slot4 = slot0
	slot5 = GetSpriteFromAtlas
	slot6 = "shipframe"
	slot7 = "b"

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-17, warpins: 1 ---
		slot8 = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-21, warpins: 2 ---
	slot3(slot4, slot5(slot6, slot7 .. slot8))

	return
	--- END OF BLOCK #1 ---



end

function flushShipCard(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-73, warpins: 1 ---
	setImageSprite(slot4, GetSpriteFromAtlas("bg/star_level_card_" .. slot3, ""))

	findTF(slot0, "content/ship_icon"):GetComponent("Image").sprite = GetSpriteFromAtlas("shipYardIcon/unknown", "")

	LoadSpriteAsync("shipYardIcon/" .. slot1:getPainting(), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			if slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-12, warpins: 1 ---
				slot1(slot0, slot0.configId)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-14, warpins: 1 ---
				slot2.sprite = slot0
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-15, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end)
	setImageSprite(slot7, GetSpriteFromAtlas("shiptype", shipType2print(slot1:getShipType())))
	setText(findTF(slot0, "content/dockyard/lv/Text"), defaultValue(slot1.level, 1))

	slot9 = setShipCardFrame
	slot10 = findTF(slot0, "content/front/frame")
	slot11 = slot1:rarity2bgPrint()

	if slot1.propose then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 74-79, warpins: 1 ---
		slot12 = "prop"

		if not slot1:isBluePrintShip() or not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 82-82, warpins: 2 ---
			slot13 = ""
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 83-85, warpins: 2 ---
		if not (slot12 .. slot13) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 86-86, warpins: 2 ---
			slot12 = nil
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 87-110, warpins: 2 ---
	slot9(slot10, slot11, slot12)

	slot9 = findTF(slot0, "content/front/stars")

	setActive(slot9, true)

	slot10 = findTF(slot9, "star_tpl")
	slot12 = slot1:getStar()

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 111-115, warpins: 0 ---
	for slot17 = slot9.childCount, slot1:getMaxStar() - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 111-115, warpins: 2 ---
		cloneTplTo(slot10, slot9)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 116-120, warpins: 1 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 121-156, warpins: 0 ---
	for slot17 = 0, slot9.childCount - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 121-129, warpins: 2 ---
		slot20 = slot9:GetChild(slot17).gameObject
		slot19 = slot9.GetChild(slot17).gameObject.SetActive

		if slot17 >= slot13 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 130-131, warpins: 1 ---
			slot21 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 132-132, warpins: 1 ---
			slot21 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 133-140, warpins: 2 ---
		slot19(slot20, slot21)

		slot19 = SetActive
		slot20 = slot18:Find("star_tpl")

		if slot17 >= slot12 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 141-142, warpins: 1 ---
			slot21 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 143-143, warpins: 1 ---
			slot21 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 144-151, warpins: 2 ---
		slot19(slot20, slot21)

		slot19 = SetActive
		slot20 = slot18:Find("star_empty_tpl")

		if slot12 > slot17 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 152-153, warpins: 1 ---
			slot21 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 154-154, warpins: 1 ---
			slot21 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 155-156, warpins: 2 ---
		slot19(slot20, slot21)
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 157-165, warpins: 1 ---
	slot14 = findTF(slot0, "content/front/bg_other")
	slot15 = nil
	slot16 = false

	if slot1.propose then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 166-171, warpins: 1 ---
		slot17 = "duang_6_jiehun"

		if slot1:isBluePrintShip() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 172-173, warpins: 1 ---
			slot18 = "_tuzhi"
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 174-174, warpins: 1 ---
			slot18 = ""
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 175-176, warpins: 2 ---
		slot15 = slot17 .. slot18
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 177-181, warpins: 1 ---
		if slot1:getRarity() == 6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 182-182, warpins: 1 ---
			slot15 = "duang_6"
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 183-184, warpins: 3 ---
	if slot15 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 185-193, warpins: 1 ---
		slot17 = slot15 .. "(Clone)"

		eachChild(slot14, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot1 = setActive
			slot2 = slot0

			if slot0.name ~= slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-8, warpins: 1 ---
				slot3 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-9, warpins: 1 ---
				slot3 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 10-13, warpins: 2 ---
			slot1(slot2, slot3)

			if not slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-17, warpins: 1 ---
				if slot0.name ~= slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 18-19, warpins: 1 ---
					slot1 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 20-20, warpins: 1 ---
					slot1 = true
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 21-22, warpins: 3 ---
			slot1 = slot1

			return
			--- END OF BLOCK #2 ---



		end)

		if not slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 194-205, warpins: 1 ---
			PoolMgr.GetInstance():GetPrefab("effect/" .. slot15, "", true, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				setParent(slot0, slot0)

				return
				--- END OF BLOCK #0 ---



			end)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 206-206, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 207-212, warpins: 2 ---
	setActive(slot14, slot15)

	return
	--- END OF BLOCK #7 ---



end

function TweenItemAlphaAndWhite(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	LeanTween.cancel(go(slot0))

	GetOrAddComponent(slot0, "CanvasGroup").alpha = 0

	LeanTween.alphaCanvas(slot1, 1, 0.2):setUseEstimatedTime(true)

	if findTF(slot0.transform, "white_mask") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-32, warpins: 1 ---
		setActive(slot2, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 33-33, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function getGroupOwnSkins(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot1 = {}
	slot3 = getProxy(ShipSkinProxy).getSkinList(slot2)

	if getProxy(CollectionProxy):getShipGroup(slot0) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-24, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-57, warpins: 0 ---
		for slot9, slot10 in ipairs(slot5) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-29, warpins: 1 ---
			if slot10.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(slot3, slot10.id) or (slot10.skin_type == ShipSkin.SKIN_TYPE_REMAKE and slot4.trans) or (slot10.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and slot4.married == 1) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 53-55, warpins: 4 ---
				slot1[slot10.id] = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 56-57, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 58-58, warpins: 2 ---
	return slot1
	--- END OF BLOCK #1 ---



end

function split(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = {}

	if not slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-5, warpins: 1 ---
		return nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-7, warpins: 2 ---
	slot3 = #slot0
	slot4 = 1

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 8-9, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 10-50, warpins: 0 ---
	while slot3 >= slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-18, warpins: 1 ---
		if string.find(slot0, slot1, slot4) == nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-29, warpins: 1 ---
			table.insert(slot2, string.sub(slot0, slot4, slot3))

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 30-30, warpins: 1 ---
			break
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 30-41, warpins: 1 ---
		table.insert(slot2, string.sub(slot0, slot4, slot5 - 1))

		if slot5 == slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-47, warpins: 1 ---
			table.insert(slot2, "")

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 48-48, warpins: 1 ---
			break
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 48-49, warpins: 1 ---
		slot4 = slot5 + 1
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 50-50, warpins: 1 ---
		--- END OF BLOCK #4 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 50-50, warpins: 3 ---
	return slot2
	--- END OF BLOCK #4 ---



end

function NumberToChinese(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = ""

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-70, warpins: 0 ---
	for slot7 = 1, #slot0, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-14, warpins: 2 ---
		if string.sub(slot0, slot7, slot7) ~= "0" or (slot8 == "0" and not slot1) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-20, warpins: 2 ---
			if slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-23, warpins: 1 ---
				if slot3 >= 2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 24-25, warpins: 1 ---
					if slot7 == 1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 26-27, warpins: 1 ---
						if slot8 == "1" then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 28-34, warpins: 1 ---
							slot2 = i18n("number_" .. 10)
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 35-46, warpins: 1 ---
							slot2 = i18n("number_" .. slot8) .. i18n("number_" .. 10)
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 47-54, warpins: 1 ---
						slot2 = slot2 .. i18n("number_" .. slot8)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 55-62, warpins: 1 ---
					slot2 = slot2 .. i18n("number_" .. slot8)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 63-69, warpins: 1 ---
				slot2 = slot2 .. i18n("number_" .. slot8)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 70-70, warpins: 7 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 71-71, warpins: 1 ---
	return slot2
	--- END OF BLOCK #2 ---



end

function getActivityTask(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-32, warpins: 1 ---
	slot2 = getProxy(TaskProxy)
	slot4 = pg.TimeMgr.GetInstance()
	slot6, slot7, slot8 = nil

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 33-82, warpins: 0 ---
	for slot12 = math.max(slot0.data3, 1), math.min(slot5, #slot0:getConfig("config_data")), 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-42, warpins: 2 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 43-81, warpins: 0 ---
		for slot17, slot18 in ipairs(slot13) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 43-49, warpins: 1 ---
			if slot2:getTaskById(slot18) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 50-52, warpins: 1 ---
				return slot6.id, slot6
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 53-54, warpins: 2 ---
			if slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 55-61, warpins: 1 ---
				if slot2:getFinishTaskById(slot18) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 62-63, warpins: 1 ---
					slot7 = slot8
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 64-65, warpins: 1 ---
					if slot1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 66-67, warpins: 1 ---
						return slot18
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 68-71, warpins: 1 ---
						return slot7.id, slot7
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 72-78, warpins: 1 ---
				slot7 = slot2:getFinishTaskById(slot18)

				if not slot8 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 79-79, warpins: 1 ---
					slot8 = slot18
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 80-81, warpins: 6 ---
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 82-82, warpins: 1 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 83-84, warpins: 1 ---
	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 85-88, warpins: 1 ---
		return slot7.id, slot7
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 89-89, warpins: 1 ---
		return slot8
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 90-90, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

function setImageFromImage(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	GetComponent(slot0, "Image").sprite = GetComponent(slot1, "Image").sprite

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-15, warpins: 1 ---
		slot3:SetNativeSize()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function skinTimeStamp(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot1, slot2, slot3, slot4 = pg.TimeMgr.GetInstance():parseTimeFrom(slot0)

	if slot1 >= 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-16, warpins: 1 ---
		return i18n("limit_skin_time_day", slot1)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-19, warpins: 1 ---
		if slot1 <= 0 and slot2 > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-28, warpins: 1 ---
			return i18n("limit_skin_time_day_min", slot2, slot3)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-31, warpins: 2 ---
			if slot1 <= 0 and slot2 <= 0 and (slot3 > 0 or slot4 > 0) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 41-49, warpins: 2 ---
				return i18n("limit_skin_time_min", math.max(slot3, 1))
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 50-52, warpins: 3 ---
				if slot1 <= 0 and slot2 <= 0 and slot3 <= 0 and slot4 <= 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 62-64, warpins: 1 ---
					return i18n("limit_skin_time_overtime")
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 65-65, warpins: 8 ---
	return
	--- END OF BLOCK #1 ---



end

function InstagramTimeStamp(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	if (pg.TimeMgr.GetInstance():GetServerTime() - slot0) / 86400 > 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-20, warpins: 1 ---
		return i18n("ins_word_day", math.floor(slot3))
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-24, warpins: 1 ---
		if slot2 / 3600 > 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-32, warpins: 1 ---
			return i18n("ins_word_hour", math.floor(slot4))
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-36, warpins: 1 ---
			if slot2 / 60 > 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 37-44, warpins: 1 ---
				return i18n("ins_word_minu", math.floor(slot5))
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 45-48, warpins: 1 ---
				return i18n("ins_word_minu", 1)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 49-49, warpins: 4 ---
	return
	--- END OF BLOCK #1 ---



end

function InstagramReplyTimeStamp(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	if (pg.TimeMgr.GetInstance():GetServerTime() - slot0) / 86400 > 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-21, warpins: 1 ---
		return i18n1(math.floor(slot3) .. "d")
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-25, warpins: 1 ---
		if slot2 / 3600 > 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-34, warpins: 1 ---
			return i18n1(math.floor(slot4) .. "h")
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-38, warpins: 1 ---
			if slot2 / 60 > 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 39-47, warpins: 1 ---
				return i18n1(math.floor(slot5) .. "min")
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 48-50, warpins: 1 ---
				return i18n1("1min")
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 51-51, warpins: 4 ---
	return
	--- END OF BLOCK #1 ---



end

function attireTimeStamp(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot1, slot2, slot3, slot4 = pg.TimeMgr.GetInstance():parseTimeFrom(slot0)

	if slot1 <= 0 and slot2 <= 0 and slot3 <= 0 and slot4 <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-24, warpins: 1 ---
		return i18n("limit_skin_time_overtime")
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-30, warpins: 4 ---
		return i18n("attire_time_stamp", slot1, slot2, slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 31-31, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function checkExist(slot0, ...)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	function slot1(slot0, slot1, ...)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		if type(slot0[slot1]) == "function" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-10, warpins: 1 ---
			return slot0[slot1](slot0, ...)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-12, warpins: 1 ---
			return slot0[slot1]
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-13, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-31, warpins: 0 ---
	for slot6, slot7 in ipairs(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-10, warpins: 1 ---
		if not slot0 or type(slot0) ~= "table" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-18, warpins: 2 ---
			return false
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 19-25, warpins: 2 ---
		slot8 = slot1
		slot9 = slot0
		slot10 = slot7[1]
		slot11 = unpack

		if not slot7[2] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-26, warpins: 1 ---
			slot12 = {}
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 27-29, warpins: 2 ---
		slot0 = slot8(slot9, slot10, slot11(slot12))
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 30-31, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 32-33, warpins: 1 ---
	return slot0
	--- END OF BLOCK #2 ---



end

function showRepairMsgbox()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-31, warpins: 1 ---
	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		content = i18n("resource_verify_warn"),
		custom = {
			{
				text = i18n("msgbox_repair_l2d"),
				onCallback = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-9, warpins: 1 ---
					if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-live2d.csv") then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 10-15, warpins: 1 ---
						Live2DUpdateMgr.Inst:StartVerify()
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 16-25, warpins: 1 ---
						pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 26-26, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end
			},
			{
				text = i18n("msgbox_repair"),
				onCallback = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-9, warpins: 1 ---
					if PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 10-15, warpins: 1 ---
						UpdateMgr.Inst:StartVerify()
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 16-25, warpins: 1 ---
						pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 26-26, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end
			}
		}
	})

	return
	--- END OF BLOCK #0 ---



end

function resourceVerify(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if CSharpVersion > 35 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-10, warpins: 1 ---
		UpdateMgr.Inst:StartVerify()

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-22, warpins: 1 ---
	slot3 = nil
	slot4 = PathMgr.ReadAllLines(slot2)
	slot5 = {}

	if slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-27, warpins: 1 ---
		setActive(slot0, true)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-34, warpins: 1 ---
		pg.UIMgr.GetInstance():LoadingOn()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 35-43, warpins: 2 ---
	function slot6()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-8, warpins: 1 ---
			setActive(setActive, false)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-15, warpins: 1 ---
			pg.UIMgr.GetInstance():LoadingOff()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-21, warpins: 2 ---
		print(slot1)

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-37, warpins: 1 ---
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("resource_verify_fail", ""),
				onYes = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-9, warpins: 1 ---
					VersionMgr.Inst:DeleteCacheFiles()
					Application.Quit()

					return
					--- END OF BLOCK #0 ---



				end
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-49, warpins: 1 ---
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("resource_verify_success")
			})
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 50-50, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end

	slot8 = nil


	-- Decompilation error in this vicinity:
	function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 < 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0()

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-9, warpins: 1 ---
		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-16, warpins: 1 ---
			setSlider(setSlider, 0, , slot2 - slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 17-34, warpins: 2 ---
		slot3 = string.split(slot3[slot0], ",")[3]

		if PathMgr.FileExists(PathMgr.getAssetBundle(slot2)) and slot3 == HashUtil.CalcMD5(PathMgr.ReadAllBytes(PathMgr.getAssetBundle(slot2))) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 48-52, warpins: 1 ---
			onNextTick(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				slot0(slot1 - 1)

				return
				--- END OF BLOCK #0 ---



			end)

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 53-57, warpins: 3 ---
		slot5 = slot2

		slot0()

		return
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 58-58, warpins: 2 ---
		--- END OF BLOCK #4 ---



	end(slot4.Length - 1)

	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 44-44, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

function checkBirthFormat(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if #slot0 ~= 8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-5, warpins: 1 ---
		return false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-7, warpins: 2 ---
	slot1 = 0
	slot2 = #slot0

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 8-9, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 10-26, warpins: 0 ---
	while slot1 < slot2 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-18, warpins: 1 ---
		if string.byte(slot0, slot1 + 1) < 48 or slot3 > 57 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-23, warpins: 2 ---
			return false
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 24-25, warpins: 2 ---
		slot1 = slot1 + 1
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 26-26, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 26-27, warpins: 1 ---
	return true
	--- END OF BLOCK #4 ---



end

slot14 = xpcall

function TryCall(slot0, slot1, ...)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0(slot0, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		errorMsg("Error Handler", slot0)

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-10, warpins: 1 ---
			slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-11, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end, ...)

	return
	--- END OF BLOCK #0 ---



end

function isHalfBodyLive2D(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	return _.any({
		"biaoqiang",
		"z23",
		"lafei",
		"lingbo",
		"mingshi",
		"xuefeng"
	}, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 ~= slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-5, warpins: 1 ---
			slot1 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-6, warpins: 1 ---
			slot1 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-7, warpins: 2 ---
		return slot1
		--- END OF BLOCK #1 ---



	end)
	--- END OF BLOCK #0 ---



end

function GetServerState(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot1 = -1
	slot2 = 0
	slot3 = 1
	slot4 = 2

	VersionMgr.Inst:WebRequest(NetConst.GetServerStateUrl(), function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot2 = true
		slot3 = false

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-14, warpins: 0 ---
		for slot7 in string.gmatch(slot1, "\"state\":%d") do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-10, warpins: 1 ---
			if slot7 ~= "\"state\":1" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-11, warpins: 1 ---
				slot2 = false
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 12-12, warpins: 2 ---
			slot3 = true
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 13-14, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 15-16, warpins: 1 ---
		if not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-17, warpins: 1 ---
			slot2 = false
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 18-20, warpins: 2 ---
		if slot0 ~= nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-23, warpins: 1 ---
			slot4 = slot0

			if not slot2 or not slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 27-27, warpins: 2 ---
				slot5 = slot2
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 28-28, warpins: 2 ---
			slot4(slot5)
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 29-29, warpins: 2 ---
		return
		--- END OF BLOCK #4 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

return
