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
		uv0 = uv1 and Time.unscaledTime or 0
		uv2 = nil
		uv3 = uv4(unpack(uv5, 1, uv5.len))

		if not uv2 then
			uv5 = nil
		end
	end

	return function (...)
		slot0 = Time.unscaledTime

		if not uv0 and not uv1 then
			uv0 = slot0
		end

		uv3 = {
			len = select("#", ...),
			...
		}

		if uv2 - (slot0 - uv0) <= 0 or uv2 < slot1 then
			if uv4 then
				uv4:Stop()

				uv4 = nil
			end

			uv0 = slot0
			uv5 = uv6(unpack(uv3, 1, uv3.len))

			if not uv4 then
				uv3 = nil
			end
		elseif not uv4 and uv1 then
			uv4 = Timer.New(uv7, slot1, 1)

			uv4:Start()
		end

		return uv5
	end
end

function debounce(slot0, slot1, slot2)
	slot3, slot4, slot5, slot6, slot7 = nil

	function slot7()
		if Time.unscaledTime - uv0 < uv1 and slot0 > 0 then
			uv2 = Timer.New(uv3, uv1 - slot0, 1)

			uv2:Start()
		else
			uv2 = nil

			if not uv4 then
				uv5 = uv6(unpack(uv7, 1, uv7.len))

				if not uv2 then
					uv7 = nil
				end
			else
				uv4 = false
			end
		end
	end

	return function (...)
		uv0 = {
			len = select("#", ...),
			...
		}
		uv1 = Time.unscaledTime
		slot0 = uv2 and not uv3

		if not uv3 then
			uv3 = Timer.New(uv4, uv5, 1)

			uv3:Start()
		end

		if slot0 then
			uv6 = uv7(unpack(uv0, 1, uv0.len))
			uv0 = nil
		end

		return uv6
	end
end

function createLog(slot0, slot1)
	if LOG and slot1 then
		return function (...)
			print(uv0 .. ": ", ...)
		end
	else
		print(slot0 .. ": log disabled")

		return function ()
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
	ResourceMgr.Inst:getAssetAsync(slot0 .. "/" .. slot1, slot1, uv0.Events.UnityAction_UnityEngine_Object(function (slot0)
		uv0(Instantiate(slot0))
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
	ResourceMgr.Inst:getAssetAsync(slot0, slot1 or "", typeof(Sprite), uv0.Events.UnityAction_UnityEngine_Object(function (slot0)
		uv0(slot0)
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
	slot4 = slot2:GetComponent(typeof(Image))
	slot4.enabled = false
	uv0[slot4] = slot0

	LoadSpriteAtlasAsync(slot0, slot1, function (slot0)
		if not IsNil(uv0) and uv1[uv0] == uv2 then
			uv1[uv0] = nil
			uv0.enabled = true
			uv0.sprite = slot0

			if uv3 then
				uv0:SetNativeSize()
			end
		end
	end)
end

function LoadImageSpriteAsync(slot0, slot1, slot2)
	LoadImageSpriteAtlasAsync(slot0, nil, slot1, slot2)
end

function GetSpriteFromAtlas(slot0, slot1)
	PoolMgr.GetInstance():GetSprite(slot0, slot1, false, function (slot0)
		uv0 = slot0
	end)

	return nil
end

function GetSpriteFromAtlasAsync(slot0, slot1, slot2)
	PoolMgr.GetInstance():GetSprite(slot0, slot1, true, function (slot0)
		uv0(slot0)
	end)
end

function GetImageSpriteFromAtlasAsync(slot0, slot1, slot2, slot3)
	slot4 = slot2:GetComponent(typeof(Image))
	slot4.enabled = false
	uv0[slot4] = slot0 .. slot1

	GetSpriteFromAtlasAsync(slot0, slot1, function (slot0)
		if not IsNil(uv0) and uv1[uv0] == uv2 .. uv3 then
			uv1[uv0] = nil
			uv0.enabled = true
			uv0.sprite = slot0

			if uv4 then
				uv0:SetNativeSize()
			end
		end
	end)
end

function SetAction(slot0, slot1)
	slot0:GetComponent(typeof(SpineAnimUI)):SetAction(slot1, 0)
end

function emojiText(slot0, slot1)
	slot2 = ResourceMgr.Inst:loadAssetBundleSync("emojis")
	slot4 = GetComponent(slot0, "MeshRenderer")
	slot5 = Shader.Find("Unlit/Transparent")
	slot8 = {}
	slot9 = 0
	GetComponent(slot0, "TextMesh").text = string.gsub(slot1, "#(%d+)#", function (slot0)
		if not uv0[slot0] then
			uv1 = uv1 + 1
			slot2 = Material.New(uv2)
			slot2.mainTexture = ResourceMgr.Inst:LoadAssetSync(uv3, "emoji" .. slot0, false, false)

			table.insert(uv4, slot2)

			uv0[slot0] = uv1
			slot1 = uv1
		end

		return "<quad material=" .. uv1 .. " />"
	end)
	slot4.materials = {
		slot4.materials[0]
	}

	ResourceMgr.Inst:ClearBundleRef("emojis", false, false)
end

function setPaintingImg(slot0, slot1)
	setImageSprite(slot0, LoadSprite("painting/" .. slot1) or LoadSprite("painting/unknown"))
	resetAspectRatio(slot0)
end

function setPaintingPrefab(slot0, slot1, slot2, slot3)
	slot4 = findTF(slot0, "fitter")

	removeAllChildren(slot4)

	slot5 = GetOrAddComponent(slot4, "PaintingScaler")
	slot5.FrameName = slot2 or ""
	slot5.Tween = 1
	slot6 = slot1

	if not slot3 and PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. slot1 .. "_n")) and PlayerPrefs.GetInt("paint_hide_other_obj_" .. slot1, 0) ~= 0 then
		slot1 = slot1 .. "_n"
	end

	if not slot3 and PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. slot1 .. "_n")) and PlayerPrefs.GetInt("paint_hide_other_obj_" .. slot1, 0) ~= 0 then
		slot1 = slot1 .. "_n"
	end

	PoolMgr.GetInstance():GetPainting(slot1, false, function (slot0)
		setParent(slot0, uv0, false)

		if not IsNil(findTF(slot0, "Touch")) then
			setActive(slot1, false)
		end

		if findTF(slot0, "hx") then
			setActive(slot2, HXSet.isHx())
		end

		Ship.SetExpression(uv0:GetChild(0), uv1)
	end)
end

slot2 = {}

function setPaintingPrefabAsync(slot0, slot1, slot2, slot3, slot4)
	slot5 = findTF(slot0, "fitter")

	removeAllChildren(slot5)

	slot6 = GetOrAddComponent(slot5, "PaintingScaler")
	slot6.FrameName = slot2 or ""
	slot6.Tween = 1
	slot7 = slot1

	if PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. slot1 .. "_n")) and PlayerPrefs.GetInt("paint_hide_other_obj_" .. slot1, 0) ~= 0 then
		slot1 = slot1 .. "_n"
	end

	if not slot4 and PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. slot1 .. "_n")) and PlayerPrefs.GetInt("paint_hide_other_obj_" .. slot1, 0) ~= 0 then
		slot1 = slot1 .. "_n"
	end

	uv0[slot0] = slot1

	PoolMgr.GetInstance():GetPainting(slot1, true, function (slot0)
		if IsNil(uv0) or uv1[uv0] ~= uv2 then
			PoolMgr.GetInstance():ReturnPainting(uv2, slot0)
		else
			setParent(slot0, uv3, false)

			uv1[uv0] = nil

			Ship.SetExpression(slot0, uv4)
		end

		if not IsNil(findTF(slot0, "Touch")) then
			setActive(slot1, false)
		end

		if uv5 then
			uv5()
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

		uv0[slot0] = nil
	end
end

function setColorCount(slot0, slot1, slot2)
	setText(slot0, string.format(slot1 < slot2 and "<color=" .. COLOR_RED .. ">%d</color>/%d" or "%d/%d", slot1, slot2))
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
		uv0 = "cv-" .. slot0 .. (tobool(ShipWordHelper.CVBattleKey[string.gsub(slot1, "_%w+", "")]) and "-battle" or "")
		uv1 = slot1
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
end

function stopStorySound()
end

function errorMessage(slot0)
	if ERROR_MESSAGE[slot0] == nil then
		slot1 = ERROR_MESSAGE[9999] .. ":" .. slot0
	end

	return slot1
end

function errorTip(slot0, slot1, ...)
	slot3 = nil

	if pg.gametip[slot0 .. "_error_" .. slot1] then
		return ((not pg.gametip[slot0 .. "_error"] or slot2.tip) and pg.gametip.common_error.tip) .. i18n(slot4, ...)
	elseif pg.gametip["common_error_" .. slot1] then
		return slot3 .. i18n(slot4, ...)
	else
		return slot3 .. slot1 .. ":" .. errorMessage(slot1)
	end
end

function colorNumber(slot0, slot1)
	if #{} > 0 then
		slot4 = 0

		return string.gsub(string.gsub(string.gsub(slot0, "<color=#%x+>", function (slot0)
			table.insert(uv0, slot0)

			return uv1
		end), "%d+%.?%d*%%*", function (slot0)
			return "<color=" .. uv0 .. ">" .. slot0 .. "</color>"
		end), "@COLOR_SCOPE", function (slot0)
			uv0 = uv0 + 1

			return uv1[uv0]
		end)
	else
		return slot0
	end
end

function getBounds(slot0)
	slot1 = LuaHelper.GetWorldCorners(rtf(slot0))
	slot2 = Bounds.New(slot1[0], Vector3.zero)

	slot2:Encapsulate(slot1[2])

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
		slot3 = findTF(slot0, "specialFrame") or cloneTplTo(slot0, slot0, "specialFrame")
		slot2 = slot2 or "frame" .. slot1

		uv0(slot3, uv1[slot2] or uv1.other)
		setImageSprite(slot3, GetSpriteFromAtlas("weaponframes", slot2))
		setActive(slot3, true)
	else
		setImageColor(slot0, shipRarity2FrameColor(slot1 + 1))

		if findTF(slot0, "specialFrame") then
			setActive(slot3, false)
		end
	end
end

function slot5(slot0, slot1, slot2, slot3)
	function slot4(slot0, slot1)
		if findTF(uv0, "icon_bg/" .. slot0 .. "(Clone)") then
			setActive(slot2, slot1)
		elseif slot1 then
			LoadAndInstantiateAsync("ui", string.lower(slot0), function (slot0)
				if IsNil(uv0) or findTF(uv0, "icon_bg/" .. uv1 .. "(Clone)") then
					Object.Destroy(slot0)
				else
					setParent(slot0, uv0:Find("icon_bg"))

					if uv0:Find("icon_bg/stars") then
						slot1:SetAsLastSibling()
					end

					setActive(slot0, uv2)
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

	slot8 = slot4.childCount

	for slot8 = 1, math.max(slot2, slot8) do
		setActive(slot4.childCount < slot8 and cloneTplTo(slot3, slot4) or slot4:GetChild(slot8 - 1), slot8 <= slot2)
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
		setText(slot2, slot1 and (type(slot1) ~= "number" or slot1 > 0) and slot1 or "")
	end
end

function updateEquipment(slot0, slot1, slot2)
	slot2 = slot2 or {}
	slot3 = EquipmentRarity.Rarity2Print(slot1.config.rarity)

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. slot3))
	setFrame(findTF(slot0, "icon_bg/frame"), slot3)

	slot4 = findTF(slot0, "icon_bg/icon")

	uv0(slot4, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync("equips/" .. slot1.config.icon, "", slot4)
	uv1(slot0, true, slot1.config.rarity)
	uv2(slot0, slot1.config.level - 1, slot1.config.expired_date)
	uv3(slot0, slot1.config.name, slot2)
	uv4(slot0, slot1.count)
	uv5(slot0, slot1.config.rarity, slot2)
end

function updateItem(slot0, slot1, slot2)
	slot2 = slot2 or {}
	slot3 = pg.item_data_statistics[slot1.id]

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. ItemRarity.Rarity2Print(slot3.rarity)))

	slot5 = nil

	if slot3.type == 9 then
		slot5 = "frame6"
	end

	setFrame(findTF(slot0, "icon_bg/frame"), slot4, slot5)
	GetImageSpriteFromAtlasAsync(slot1.icon or slot3.icon, "", findTF(slot0, "icon_bg/icon"))
	uv0(slot0, false)
	uv1(slot0, 0, checkExist(pg.item_data_template[slot1.id], {
		"expired_date"
	}))
	uv2(slot0, HXSet.hxLan(slot3.name), slot2)
	uv3(slot0, slot3.rarity + 1, slot2)
end

function updateWorldItem(slot0, slot1, slot2)
	slot2 = slot2 or {}
	slot4 = ItemRarity.Rarity2Print(pg.world_item_data_template[slot1.id].rarity)

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. slot4))
	setFrame(findTF(slot0, "icon_bg/frame"), slot4)
	GetImageSpriteFromAtlasAsync(slot1.icon or slot3.icon, "", findTF(slot0, "icon_bg/icon"))
	uv0(slot0, false)
	uv1(slot0, 0, slot3.expired_date)
	uv2(slot0, HXSet.hxLan(slot3.name), slot2)
	uv3(slot0, slot3.rarity + 1, slot2)
end

function updateShip(slot0, slot1, slot2)
	slot3 = slot1:rarity2bgPrint()
	slot4 = slot1:getPainting()
	slot5 = getProxy(ShipSkinProxy)

	if (slot2 or {}).anonymous then
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

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. (slot2.isSkin and "-skin" or slot3)))

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

	GetImageSpriteFromAtlasAsync(slot2.Q and "QIcon/" or "SquareIcon/" .. slot4, "", findTF(slot0, "icon_bg/icon"))

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

	uv0(slot0, slot2.initStar, slot1:getStar())
	uv1(slot0, slot1:getName(), slot2)
	uv2(slot0, slot2.isSkin and 5 or slot1:getRarity(), slot2)
end

function updateCommander(slot0, slot1, slot2)
	slot4 = ShipRarity.Rarity2Print(slot1:getRarity())
	slot5 = slot1:getPainting()

	if (slot2 or {}).anonymous then
		slot4 = 1
		slot5 = "unknown"
	end

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. (slot2.isSkin and "-skin" or slot4)))
	setFrame(findTF(slot0, "icon_bg/frame"), slot4)

	if slot2.gray then
		setGray(slot6, true, true)
	end

	GetImageSpriteFromAtlasAsync(slot2.Q and "QIcon/" or "SquareIcon/" .. slot5, "", findTF(slot0, "icon_bg/icon"))

	if findTF(slot0, "icon_bg/lv") then
		setActive(slot9, true)

		if findTF(slot9, "Text") and slot1.level then
			setText(slot10, slot1.level)
		end
	end

	uv0(slot0, slot2.initStar, slot1:getStar())
	uv1(slot0, slot1:getName(), slot2)
end

function updateStrategy(slot0, slot1, slot2)
	slot2 = slot2 or {}
	slot3 = pg.strategy_data_template[slot1.id]
	slot4 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. slot4))
	setFrame(findTF(slot0, "icon_bg/frame"), slot4)
	GetImageSpriteFromAtlasAsync("strategyicon/" .. slot3.icon, "", findTF(slot0, "icon_bg/icon"))
	uv0(slot0, false)
	uv1(slot0, HXSet.hxLan(slot3.name), slot2)
	uv2(slot0, 1, slot2)
end

function updateFurniture(slot0, slot1, slot2)
	slot2 = slot2 or {}
	slot4 = ItemRarity.Rarity2Print(pg.furniture_data_template[slot1].rarity) or ItemRarity.Gray

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. slot4))
	setFrame(findTF(slot0, "icon_bg/frame"), slot4)
	GetImageSpriteFromAtlasAsync("furnitureicon/" .. slot3.icon, "", findTF(slot0, "icon_bg/icon"))
	uv0(slot0, false)
	uv1(slot0, HXSet.hxLan(slot3.name), slot2)
	uv2(slot0, slot3.rarity + 1, slot2)
end

slot10 = nil

function findCullAndClipWorldRect(slot0)
	if #slot0 == 0 then
		return false
	end

	for slot5 = 1, #slot0 do
		slot1 = rectIntersect(slot0[1].canvasRect, slot0[slot5].canvasRect)
	end

	if slot1.width <= 0 or slot1.height <= 0 then
		return false
	end

	uv0 = uv0 or GameObject.Find("UICamera/Canvas").transform
	slot2 = uv0:TransformPoint(Vector3(slot1.x, slot1.y, 0))
	slot3 = uv0:TransformPoint(Vector3(slot1.x + slot1.width, slot1.y + slot1.height, 0))

	return true, Vector4(slot2.x, slot2.y, slot3.x, slot3.y)
end

function rectIntersect(slot0, slot1)
	slot4 = math.max(slot0.y, slot1.y)
	slot5 = math.min(slot0.y + slot0.height, slot1.y + slot1.height)

	if math.max(slot0.x, slot1.x) <= math.min(slot0.x + slot0.width, slot1.x + slot1.width) and slot4 <= slot5 then
		return uv0.Rect.New(slot2, slot4, slot3 - slot2, slot5 - slot4)
	end

	return uv0.Rect.New(0, 0, 0, 0)
end

function getDropInfo(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0) do
		if slot6[1] == DROP_TYPE_SHIP then
			table.insert(slot1, Ship.New({
				configId = slot6[2]
			}):getConfig("name") .. "x" .. (slot6[3] or 1))
		elseif slot7 == DROP_TYPE_EQUIP then
			table.insert(slot1, Equipment.New({
				id = slot8
			}):getConfig("name") .. "x" .. counts)
		elseif slot7 == DROP_TYPE_SIREN_EQUIP then
			-- Nothing
		elseif slot7 == DROP_TYPE_RESOURCE then
			table.insert(slot1, Item.New({
				id = id2ItemId(slot8)
			}):getConfig("name") .. "x" .. slot9)
		elseif slot7 == DROP_TYPE_ITEM then
			table.insert(slot1, Item.New({
				id = slot8
			}):getConfig("name") .. "x" .. slot9)
		elseif slot7 == DROP_TYPE_FURNITURE then
			table.insert(slot1, Furniture.New({
				id = slot8
			}):getConfig("name") .. "x" .. slot9)
		elseif slot7 == DROP_TYPE_STRATEGY then
			table.insert(slot1, strategy_data_template[slot8].name .. "x" .. slot9)
		elseif slot7 == DROP_TYPE_SKIN then
			table.insert(slot1, pg.ship_skin_template[slot8].name .. "x" .. slot9)
		elseif slot7 == DROP_TYPE_EQUIPMENT_SKIN then
			table.insert(slot1, pg.equip_skin_template[slot8].name .. "x" .. slot9)
		end
	end

	return table.concat(slot1, ",")
end

function updateDrop(slot0, slot1, slot2)
	slot2 = slot2 or {}
	slot3 = type
	slot4 = slot1.type or slot1.dropType
	slot5 = ""
	slot6 = ""
	slot8 = nil

	for slot12, slot13 in ipairs({
		{
			"icon_bg/slv"
		},
		{
			"icon_bg/IconColorful(Clone)"
		},
		{
			"icon_bg/Item_duang5(Clone)"
		},
		{
			"icon_bg/frame/specialFrame"
		},
		{
			"ship_type",
			DROP_TYPE_SHIP
		},
		{
			"icon_bg/new",
			DROP_TYPE_SHIP
		},
		{
			"icon_bg/npc",
			DROP_TYPE_SHIP
		}
	}) do
		slot8 = slot0:Find(slot13[1])

		if slot4 ~= slot13[2] and not IsNil(slot8) then
			setActive(slot8, false)
		end
	end

	slot0:Find("icon_bg/frame"):GetComponent(typeof(Image)).enabled = true

	uv0(slot0, getDropRarity(slot1), slot2, true)
	uv1(findTF(slot0, "icon_bg/icon"), {
		2,
		2,
		2,
		2
	})

	if slot4 == DROP_TYPE_RESOURCE then
		slot9 = id2ItemId(slot1.id)
		slot6 = pg.item_data_statistics[slot9].display

		updateItem(slot0, Item.New({
			id = slot9
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
		slot10 = getProxy(EquipmentProxy):getEquipmentById(slot1.id)
		slot6 = pg.equip_data_statistics[slot10.configId].descrip

		updateEquipment(slot0, slot10, slot2)
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
		slot5 = pg.equip_skin_template[slot1.id]

		updateEquipmentSkin(slot0, {
			rarity = slot5.rarity,
			icon = slot5.icon,
			name = slot5.name,
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
		slot5 = pg.emoji_template[slot1.id]
		slot6 = slot5.item_desc

		updateEmoji(slot0, slot5)
	end

	slot1.cfg = slot5
	slot1.desc = HXSet.hxLan(slot6)

	uv2(slot0, slot1.count)
end

function updateDropCfg(slot0)
	slot1 = ""
	slot2 = ""

	if (slot0.type or slot0.dropType) == DROP_TYPE_RESOURCE then
		slot2 = pg.item_data_statistics[id2ItemId(slot0.id)].display
	elseif slot3 == DROP_TYPE_ITEM then
		slot2 = pg.item_data_statistics[slot0.id].display
	elseif slot3 == DROP_TYPE_EQUIP then
		slot2 = pg.equip_data_statistics[slot0.id].descrip
	elseif slot3 == DROP_TYPE_SIREN_EQUIP then
		slot2 = pg.equip_data_statistics[getProxy(EquipmentProxy):getEquipmentById(slot0.id).configId].descrip
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
	slot5 = 4

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. slot5))
	setFrame(findTF(slot0, "icon_bg/frame"), slot5)

	slot6 = findTF(slot0, "icon_bg/icon")
	slot7 = nil

	if slot1 == AttireConst.TYPE_CHAT_FRAME then
		slot7 = "chat_frame"
	elseif slot1 == AttireConst.TYPE_ICON_FRAME then
		slot7 = "icon_frame"
	end

	GetImageSpriteFromAtlasAsync("Props/" .. slot7, "", slot6)
	uv0(slot0, HXSet.hxLan(slot4.name), slot3)
end

function updateEmoji(slot0, slot1, slot2)
	GetImageSpriteFromAtlasAsync("Props/" .. "icon_emoji", "", findTF(slot0, "icon_bg/icon"))

	slot5 = 4

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. slot5))
	setFrame(findTF(slot0, "icon_bg/frame"), slot5)
	uv0(slot0, HXSet.hxLan(slot1.name), slot2)
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
		slot1 = getProxy(EquipmentProxy):getEquipmentById(slot0.id) and slot4.count or 0
	elseif slot3 == DROP_TYPE_SHIP then
		slot1 = getProxy(BayProxy):getConfigShipCount(slot0.id)
	elseif slot3 == DROP_TYPE_FURNITURE then
		slot1 = getProxy(DormProxy):getFurnitrueCount(slot0.id)
	elseif slot3 == DROP_TYPE_STRATEGY then
		-- Nothing
	elseif slot3 == DROP_TYPE_SKIN then
		slot1 = getProxy(ShipSkinProxy):getSkinCountById(slot0.id)
	elseif slot3 == DROP_TYPE_VITEM then
		-- Nothing
	elseif slot3 == DROP_TYPE_EQUIPMENT_SKIN then
		slot1 = getProxy(EquipmentProxy):getEquipmnentSkinById(slot0.id) and slot4.count or 0
	end

	return slot1, slot2
end

function updateEquipmentSkin(slot0, slot1, slot2)
	slot2 = slot2 or {}
	slot3 = EquipmentRarity.Rarity2Print(slot1.rarity)

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. slot3))
	setFrame(findTF(slot0, "icon_bg/frame"), slot3, "frame7")
	GetImageSpriteFromAtlasAsync("equips/" .. slot1.icon, "", findTF(slot0, "icon_bg/icon"))
	uv0(slot0, false)
	uv1(slot0, 0, slot1.expired_date)
	uv2(slot0, slot1.name, slot2)
	uv3(slot0, slot1.count)
	uv4(slot0, slot1.rarity, slot2)
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
		print(slot0.id)

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

	if slot1 then
		table.insert({}, {
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
		if getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator) and slot2.data.shipId then
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

	for slot5, slot6 in pairs(getProxy(BayProxy):getData()) do
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
		for slot7, slot8 in ipairs(slot2) do
			if slot7 < #slot2 then
				slot3 = "" .. i18n(slot8[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", pg.item_data_statistics[slot8[1]].name, slot8[2]) .. i18n("text_noRes_info_tip_link")
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
			gotoChargeScene(uv0, uv1)
		end
	})
end

function shoppingBatch(slot0, slot1, slot2, slot3, slot4)
	if math.floor(getProxy(PlayerProxy):getData()[id2res(pg.shop_template[slot0].resource_type)] / (slot1.price or slot5.resource_num)) <= 0 then
		slot10 = 1
	end

	if slot2 ~= nil and slot2 < slot10 then
		slot10 = slot2 or slot10
	end

	slot11 = true
	slot12 = 1

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
				uv0 = math.floor(slot1 / uv1.num)

				if uv3 < uv0 * uv2 then
					setText(slot0, i18n(uv4, slot2, slot1, COLOR_RED, uv5))

					uv6 = false
				else
					setText(slot0, i18n(uv4, slot2, slot1, COLOR_GREEN, uv5))

					uv6 = true
				end
			end,
			onYes = function ()
				if uv0 then
					pg.m02:sendNotification(GAME.SHOPPING, {
						id = uv1,
						count = uv2
					})
				elseif uv3 then
					pg.TipsMgr.GetInstance():ShowTips(i18n(uv3))
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
				end
			end
		})
	end
end

function gotoChargeScene(slot0, slot1)
	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
		wrap = slot0 or ChargeScene.TYPE_ITEM,
		noRes = slot1
	})
end

function clearDrop(slot0)
	clearImageSprite(findTF(slot0, "icon_bg"))
	clearImageSprite(findTF(slot0, "icon_bg/frame"))
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

	if slot1 then
		setActive(slot4, true)
		setActive(findTF(slot0, "unknown"), false)
		setActive(findTF(slot0, "lock"), not slot2)
		LoadImageSpriteAsync("skillicon/" .. slot1.icon, findTF(slot4, "icon"))
		setText(findTF(slot4, "name"), shortenString(getSkillName(slot1.id), slot3 or 8))
		setText(findTF(slot4, "level"), "LEVEL: " .. (slot2 and slot2.level or "??"))
		setTextColor(slot8, uv0[slot1.color or "blue"])
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

	function slot5(slot0)
		return function ()
			if uv0 then
				playSoundEffect(SOUND_BACK)
			end

			slot0, slot1 = uv1()

			if slot0 then
				uv2(slot1)
			end
		end
	end

	slot6 = slot4.onReleased

	pg.DelegateInfo.Add(slot0, slot6)
	slot6:RemoveAllListeners()
	slot6:AddListener(slot5(function (slot0)
		slot0:emit(BaseUI.ON_BACK)
	end))

	slot7 = slot4.onLongPressed

	pg.DelegateInfo.Add(slot0, slot7)
	slot7:RemoveAllListeners()
	slot7:AddListener(slot5(function (slot0)
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
	slot2, slot3 = pg.TimeMgr.GetInstance():parseTimeFrom(pg.TimeMgr.GetInstance():GetServerTime())

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

	for slot8 = 1, #slot0 do
		if not string.byte(slot0, slot8) then
			break
		end

		if slot9 >= 48 and slot9 <= 57 or slot9 >= 65 and slot9 <= 90 or slot9 >= 97 and slot9 <= 122 then
			table.insert(slot1, string.char(slot9))
		elseif slot9 >= 228 and slot9 <= 233 then
			slot11 = string.byte(slot0, slot8 + 2)

			if string.byte(slot0, slot8 + 1) and slot11 and slot10 >= 128 and slot10 <= 191 and slot11 >= 128 and slot11 <= 191 then
				slot8 = slot8 + 2

				table.insert(slot1, string.char(slot9, slot10, slot11))

				slot2 = slot2 + 1
			end
		elseif slot9 == 227 and (PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_KR) then
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
	slot3 = slot3 or 0.2

	if slot5 then
		LeanTween.cancel(go(slot0))
	end

	slot9 = rtf(slot0)

	LeanTween.move(slot9, Vector3(slot1 or slot9.anchoredPosition.x, slot2 or slot9.anchoredPosition.y, 0), slot3):setEase(slot7 or LeanTweenType.easeInOutSine)

	if slot4 then
		slot10:setDelay(slot4)
	end

	if slot6 then
		GetOrAddComponent(slot0, "CanvasGroup").blocksRaycasts = false
	end

	slot10:setOnComplete(System.Action(function ()
		if uv0 then
			uv0()
		end

		if uv1 then
			GetOrAddComponent(uv2, "CanvasGroup").blocksRaycasts = true
		end
	end))

	return slot10
end

function TweenValue(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot8 = LeanTween.value(go(slot0), slot1, slot2, slot3):setOnUpdate(System.Action_float(function (slot0)
		if uv0 then
			uv0(slot0)
		end
	end)):setOnComplete(System.Action(function ()
		if uv0 then
			uv0()
		end
	end)):setDelay(slot4 or 0)

	if slot7 and slot7 > 0 then
		slot8:setRepeat(slot7)
	end

	return slot8
end

function rotateAni(slot0, slot1, slot2)
	return LeanTween.rotate(rtf(slot0), 360 * slot1, slot2):setLoopClamp()
end

function blinkAni(slot0, slot1, slot2, slot3)
	return LeanTween.alpha(rtf(slot0), slot3 or 0, slot1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(slot2 or 0)
end

function scaleAni(slot0, slot1, slot2, slot3)
	return LeanTween.scale(rtf(slot0), slot3 or 0, slot1):setLoopPingPong(slot2 or 0)
end

function floatAni(slot0, slot1, slot2, slot3)
	return LeanTween.moveY(rtf(slot0), slot0.localPosition.y + slot1, slot2):setLoopPingPong(slot3 or 0)
end

slot13 = tostring

function tostring(slot0)
	if slot0 == nil then
		return "nil"
	end

	if uv0(slot0) == nil then
		if type(slot0) == "table" then
			return "{}"
		end

		return " ~nil"
	end

	return slot1
end

function wordVer(slot0, slot1)
	if #filterEgyUnicode(slot0) ~= #slot0 then
		if (slot1 or {}).isReplace then
			slot0 = slot2
		else
			return 1
		end
	end

	slot4 = pg.word_template
	slot5 = pg.word_legal_template
	slot1.isReplace = slot1.isReplace or false
	slot1.replaceWord = slot1.replaceWord or "*"
	slot7 = 1
	slot8 = ""
	slot9 = 0

	while slot7 <= #wordSplit(slot0) do
		slot10, slot7, slot12 = wordLegalMatch(slot3, slot5, slot7)

		if slot10 then
			slot8 = slot8 .. slot12
		else
			slot13, slot7, slot15 = wordVerMatch(slot3, slot4, slot1, slot7, "", false, slot7, "")

			if slot13 then
				slot9 = slot9 + 1

				if slot1.isReplace then
					slot8 = slot8 .. slot15
				end
			else
				if slot1.isReplace then
					slot8 = slot8 .. slot3[slot7]
				end

				slot7 = slot7 + 1
			end
		end
	end

	if slot1.isReplace then
		return slot9, slot8
	else
		return slot9
	end
end

function wordLegalMatch(slot0, slot1, slot2, slot3, slot4)
	if slot2 > #slot0 then
		return slot3, slot2, slot4
	end

	slot6 = slot1[slot0[slot2]]

	if slot4 == nil then
		slot4 = ""
	end

	if slot6 then
		if slot6.this then
			return wordLegalMatch(slot0, slot6, slot2 + 1, true, slot4 .. slot5)
		else
			return wordLegalMatch(slot0, slot6, slot2 + 1, false, slot4 .. slot5)
		end
	else
		return slot3, slot2, slot4
	end
end

slot14 = string.byte("a")
slot15 = string.byte("z")
slot16 = string.byte("A")
slot17 = string.byte("Z")

function slot18(slot0)
	if not slot0 then
		return slot0
	end

	if string.byte(slot0) > 128 then
		return
	end

	if uv0 <= slot1 and slot1 <= uv1 then
		return string.char(slot1 - 32)
	elseif uv2 <= slot1 and slot1 <= uv3 then
		return string.char(slot1 + 32)
	else
		return slot0
	end
end

function wordVerMatch(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if slot3 > #slot0 then
		return slot5, slot6, slot7
	end

	if slot1[slot0[slot3]] then
		slot10, slot11, slot12 = wordVerMatch(slot0, slot9, slot2, slot3 + 1, slot2.isReplace and slot4 .. slot2.replaceWord or slot4, slot9.this or slot5, slot9.this and slot3 + 1 or slot6, slot9.this and (slot2.isReplace and slot4 .. slot2.replaceWord or slot4) or slot7)

		if slot10 then
			return slot10, slot11, slot12
		end
	end

	slot10 = uv0(slot8)
	slot9 = slot1[slot10]

	if slot10 ~= slot8 and slot9 then
		slot11, slot12, slot13 = wordVerMatch(slot0, slot9, slot2, slot3 + 1, slot2.isReplace and slot4 .. slot2.replaceWord or slot4, slot9.this or slot5, slot9.this and slot3 + 1 or slot6, slot9.this and (slot2.isReplace and slot4 .. slot2.replaceWord or slot4) or slot7)

		if slot11 then
			return slot11, slot12, slot13
		end
	end

	return slot5, slot6, slot7
end

function wordSplit(slot0)
	slot1 = {}

	for slot5 in slot0:gmatch("[-\\xc2-\\xf4][\\x80-\\xbf]*") do
		slot1[#slot1 + 1] = slot5
	end

	return slot1
end

function contentWrap(slot0, slot1, slot2)
	return #LuaHelper.WrapContent(slot0, slot1, slot2) ~= #slot0, slot3
end

function cancelRich(slot0)
	slot1 = nil

	for slot5 = 1, 20 do
		slot0, slot7 = string.gsub(slot0, "<([^>]*)>", "%1")

		if slot7 <= 0 then
			break
		end
	end

	return slot0
end

function filterCharForiOS(slot0)
end

function getSkillConfig(slot0)
	if not require("GameCfg.buff.buff_" .. slot0) then
		warn("找不到技能配置: " .. slot0)

		return
	end

	slot2 = Clone(slot1)
	slot2.name = getSkillName(slot0)
	slot2.desc = HXSet.hxLan(slot2.desc)
	slot2.desc_get = HXSet.hxLan(slot2.desc_get)

	_.each(slot2, function (slot0)
		slot0.desc = HXSet.hxLan(slot0.desc)
	end)

	return slot2
end

function getSkillName(slot0)
	if not pg.skill_data_template[slot0] and not pg.skill_data_display[slot0] then
		return ""
	end

	return HXSet.hxLan(slot1.name)
end

function getSkillDescGet(slot0)
	if not pg.skill_data_template[slot0] then
		return ""
	end

	slot2 = slot1.desc_get ~= "" and slot1.desc_get or slot1.desc

	for slot6, slot7 in pairs(slot1.desc_get_add) do
		if slot7[2] then
			slot8 = setColorStr(slot7[1], COLOR_GREEN) .. specialGSub(i18n("word_skill_desc_get"), "$1", setColorStr(slot7[2], COLOR_GREEN))
		end

		slot2 = specialGSub(slot2, "$" .. slot6, slot8)
	end

	return HXSet.hxLan(slot2)
end

function getSkillDescLearn(slot0, slot1)
	if not pg.skill_data_template[slot0] then
		return ""
	end

	if not slot2.desc_add then
		return HXSet.hxLan(slot2.desc)
	end

	for slot7, slot8 in pairs(slot2.desc_add) do
		if slot8[slot1][2] then
			slot9 = slot8[slot1][1] .. specialGSub(i18n("word_skill_desc_learn"), "$1", slot8[slot1][2])
		end

		slot3 = specialGSub(slot3, "$" .. slot7, setColorStr(slot9, COLOR_YELLOW))
	end

	return HXSet.hxLan(slot3)
end

function getSkillDesc(slot0, slot1)
	if not pg.skill_data_template[slot0] then
		return ""
	end

	if not slot2.desc_add then
		return HXSet.hxLan(slot2.desc)
	end

	for slot7, slot8 in pairs(slot2.desc_add) do
		slot3 = specialGSub(slot3, "$" .. slot7, setColorStr(slot8[slot1][1], COLOR_GREEN))
	end

	return HXSet.hxLan(slot3)
end

function specialGSub(slot0, slot1, slot2)
	return string.gsub(string.gsub(string.gsub(string.gsub(slot0, "<color=#", "<color=NNN"), "#", ""), slot1, string.gsub(slot2, "%%", "%%%%")), "<color=NNN", "<color=#")
end

function topAnimation(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = {}
	slot7 = 0.05

	if slot0 then
		slot8 = slot0.transform.localPosition.x

		setAnchoredPosition(slot0, {
			x = slot8 - 500
		})
		shiftPanel(slot0, slot8, nil, 0.05, slot4 or 0.27, true, true)
		setActive(slot0, true)
	end

	setActive(slot1, false)
	setActive(slot2, false)
	setActive(slot3, false)

	for slot11 = 1, 3 do
		table.insert(slot6, LeanTween.delayedCall(slot4 + 0.13 + slot7 * slot11, System.Action(function ()
			if uv0 then
				setActive(uv0, not uv0.gameObject.activeSelf)
			end
		end)).uniqueId)
		table.insert(slot6, LeanTween.delayedCall(slot4 + 0.02 + slot7 * slot11, System.Action(function ()
			if uv0 then
				setActive(uv0, not go(uv0).activeSelf)
			end

			if uv0 then
				setActive(uv1, not go(uv1).activeSelf)
			end
		end)).uniqueId)
	end

	if slot5 then
		table.insert(slot6, LeanTween.delayedCall(slot4 + 0.13 + slot7 * 3 + 0.1, System.Action(function ()
			uv0()
		end)).uniqueId)
	end

	return slot6
end

function cancelTweens(slot0)
	if not slot0 then
		LeanTween:cancelAll()

		return
	end

	for slot4, slot5 in ipairs(slot0) do
		if slot5 then
			LeanTween.cancel(slot5)
		end
	end
end

function calcRelativeRectPos(slot0, slot1, slot2, slot3)
	slot4 = slot2.x + slot1.width / 2
	slot5 = slot2.x + slot2.width - slot1.width / 2
	slot6 = slot2.y + slot1.height / 2
	slot7 = slot2.y + slot2.height - slot1.height / 2
	slot9 = 10

	for slot14 = 360 / slot9, 1, -1 do
		pos = slot0.center + Quaternion.Euler(0, 0, slot9) * slot3

		if function (slot0)
			return uv0 <= slot0.x and slot0.x <= uv1 and uv2 <= slot0.y and slot0.y <= uv3
		end(pos) then
			return pos
		end
	end

	return _.min({
		Vector2(slot4, slot6),
		Vector2(slot4, slot7),
		Vector2(slot5, slot7),
		Vector2(slot5, slot6)
	}, function (slot0)
		return Vector2.Distance(slot0, uv0.center)
	end)
end

function getOfflineTimeStamp(slot0)
	slot3 = ""

	return (pg.TimeMgr.GetInstance():GetServerTime() - slot0 > 59 or i18n("just_now")) and (slot2 > 3599 or i18n("several_minutes_before", math.floor(slot2 / 60))) and (slot2 > 86399 or i18n("several_hours_before", math.floor(slot2 / 3600))) and i18n("several_days_before", math.floor(slot2 / 86400))
end

function playMovie(slot0, slot1, slot2)
	if not IsNil(GameObject.Find("OverlayCamera/Overlay/UITop/MoviePanel")) then
		pg.UIMgr.GetInstance():LoadingOn()
		WWWLoader.Inst:LoadStreamingAsset(slot0, function (slot0)
			pg.UIMgr.GetInstance():LoadingOff()

			slot1 = GCHandle.Alloc(slot0, GCHandleType.Pinned)

			setActive(uv0, true)

			slot2 = uv0:AddComponent(typeof(CriManaMovieControllerForUI))

			slot2.player:SetData(slot0, slot0.Length)

			slot2.target = uv0:GetComponent(typeof(Image))
			slot2.loop = false
			slot2.additiveMode = false
			slot2.playOnStart = true
			slot3 = nil

			Timer.New(function ()
				if uv0.player.status == CriMana.Player.Status.PlayEnd or uv0.player.status == CriMana.Player.Status.Stop or uv0.player.status == CriMana.Player.Status.Error then
					uv1:Stop()
					Object.Destroy(uv0)
					GCHandle.Free(uv2)
					setActive(uv3, false)

					if uv4 then
						uv4()
					end
				end
			end, 0.2, -1):Start()
			removeOnButton(uv0)

			if uv2 then
				onButton(nil, uv0, function ()
					uv0:Stop()
					uv1.onClick:RemoveAllListeners()
				end, SFX_CANCEL)
			end
		end)
	elseif slot1 then
		slot1()
	end
end

PaintCameraAdjustOn = false

function cameraPaintViewAdjust(slot0)
	if PaintCameraAdjustOn ~= slot0 then
		slot1 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(CanvasScaler))

		if slot0 then
			CameraUtil.AutoAdapt = false

			CameraUtil.Revert()

			slot1.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight
			slot1.matchWidthOrHeight = 1
		else
			CameraUtil.AutoAdapt = true
			CameraUtil.CurrentWidth = 1
			CameraUtil.CurrentHeight = 1
			CameraUtil.AspectRatio = 1.7777777777777777
			slot1.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand
		end

		PaintCameraAdjustOn = slot0
	end
end

function ManhattonDist(slot0, slot1)
	return math.abs(slot0.row - slot1.row) + math.abs(slot0.column - slot1.column)
end

function checkFirstHelpShow(slot0)
	if not getProxy(SettingsProxy):checkReadHelp(slot0) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[slot0].tip
		})
		slot1:recordReadHelp(slot0)
	end
end

preOrientation = nil
preNotchFitterEnabled = false

function openPortrait(slot0)
	enableNotch(slot0, true)

	preOrientation = Input.deviceOrientation:ToString()

	print("Begining Orientation:" .. preOrientation)

	Screen.autorotateToPortrait = true
	Screen.autorotateToPortraitUpsideDown = true

	cameraPaintViewAdjust(true)
end

function closePortrait(slot0)
	enableNotch(slot0, false)

	Screen.autorotateToPortrait = false
	Screen.autorotateToPortraitUpsideDown = false

	print("Closing Orientation:" .. preOrientation)

	Screen.orientation = ScreenOrientation.LandscapeLeft
	slot1 = Timer.New(function ()
		Screen.orientation = ScreenOrientation.AutoRotation
	end, 0.2, 1):Start()

	cameraPaintViewAdjust(false)
end

function enableNotch(slot0, slot1)
	if slot0 == nil then
		return
	end

	slot0:GetComponent("NotchAdapt").enabled = slot1

	if slot0:GetComponent("AspectRatioFitter") then
		if slot1 then
			slot3.enabled = preNotchFitterEnabled
		else
			preNotchFitterEnabled = slot3.enabled
			slot3.enabled = false
		end
	end
end

function numberFormat(slot0, slot1)
	slot2 = ""
	slot4 = string.len(tostring(slot0))

	if slot1 == nil then
		slot1 = ","
	end

	for slot8 = 1, slot4 do
		if slot8 % 3 == 0 and slot4 - slot8 ~= 0 then
			slot2 = tostring(slot1) .. (string.char(string.byte(slot3, slot4 + 1 - slot8)) .. slot2)
		end
	end

	return slot2
end

function comma_value(slot0)
	slot2 = 0

	while true do
		slot1, slot4 = string.gsub(slot0, "^(-?%d+)(%d%d%d)", "%1,%2")

		if slot4 == 0 then
			break
		end
	end

	return slot1
end

function SwitchPanel(slot0, slot1, slot2, slot3, slot4, slot5)
	slot3 = defaultValue(slot3, SWITCH_PANEL_TIME)

	if slot5 then
		LeanTween.cancel(go(slot0))
	end

	if slot1 then
		Vector3.New(tf(slot0).localPosition.x, tf(slot0).localPosition.y, tf(slot0).localPosition.z).x = slot1
	end

	if slot2 then
		slot6.y = slot2
	end

	slot7 = LeanTween.move(rtf(slot0), slot6, slot3):setEase(LeanTweenType.easeInOutSine)

	if slot4 then
		slot7:setDelay(slot4)
	end

	return slot7
end

function getSpecialItemPage(slot0)
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
end

function updateActivityTaskStatus(slot0)
	slot1 = slot0:getConfig("config_id")
	slot2, slot3 = getActivityTask(slot0, true)

	if not slot3 then
		if slot1 == 0 or slot1 == 1 then
			pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
				cmd = 1,
				activity_id = slot0.id,
				arg1 = slot2
			})

			return true
		elseif slot1 == 2 or slot1 == 3 then
			pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
				cmd = 1,
				activity_id = slot0.id
			})

			return true
		end
	end

	return false
end

function setShipCardFrame(slot0, slot1, slot2)
	slot0.localScale = Vector3.one
	slot0.anchorMin = Vector2.zero
	slot0.anchorMax = Vector2.one

	setImageSprite(slot0, GetSpriteFromAtlas("shipframe", slot2 or slot1))
end

function setRectShipCardFrame(slot0, slot1, slot2)
	slot0.localScale = Vector3.one
	slot0.anchorMin = Vector2.zero
	slot0.anchorMax = Vector2.one

	setImageSprite(slot0, GetSpriteFromAtlas("shipframe", "b" .. (slot2 or slot1)))
end

function flushShipCard(slot0, slot1, slot2)
	slot3 = slot1:rarity2bgPrint()

	setImageSprite(findTF(slot0, "content/bg"), GetSpriteFromAtlas("bg/star_level_card_" .. slot3, ""))

	findTF(slot0, "content/ship_icon"):GetComponent("Image").sprite = GetSpriteFromAtlas("shipYardIcon/unknown", "")

	LoadSpriteAsync("shipYardIcon/" .. slot1:getPainting(), function (slot0)
		if uv0 then
			if uv1 then
				uv1(slot0, uv0.configId)
			else
				uv2.sprite = slot0
			end
		end
	end)
	setImageSprite(findTF(slot0, "content/info/top/type"), GetSpriteFromAtlas("shiptype", shipType2print(slot1:getShipType())))
	setText(findTF(slot0, "content/dockyard/lv/Text"), defaultValue(slot1.level, 1))
	setShipCardFrame(findTF(slot0, "content/front/frame"), slot3, slot1.propose and "prop" .. (slot1:isBluePrintShip() and slot3 or "") or nil)

	slot9 = findTF(slot0, "content/front/stars")

	setActive(slot9, true)

	slot12 = slot1:getStar()

	for slot17 = slot9.childCount, slot1:getMaxStar() - 1 do
		cloneTplTo(findTF(slot9, "star_tpl"), slot9)
	end

	for slot17 = 0, slot9.childCount - 1 do
		slot9:GetChild(slot17).gameObject:SetActive(slot17 < slot13)
		SetActive(slot18:Find("star_tpl"), slot17 < slot12)
		SetActive(slot18:Find("star_empty_tpl"), slot12 <= slot17)
	end

	slot14 = findTF(slot0, "content/front/bg_other")
	slot15 = nil
	slot16 = false

	if slot1.propose then
		slot15 = "duang_6_jiehun" .. (slot1:isBluePrintShip() and "_tuzhi" or "")
	elseif slot1:getRarity() == 6 then
		slot15 = "duang_6"
	end

	if slot15 then
		slot17 = slot15 .. "(Clone)"

		eachChild(slot14, function (slot0)
			setActive(slot0, slot0.name == uv0)

			uv1 = uv1 or slot0.name == uv0
		end)

		if not slot16 then
			PoolMgr.GetInstance():GetPrefab("effect/" .. slot15, "", true, function (slot0)
				setParent(slot0, uv0)
			end)
		end
	end

	setActive(slot14, slot15)
end

function TweenItemAlphaAndWhite(slot0)
	LeanTween.cancel(go(slot0))

	slot1 = GetOrAddComponent(slot0, "CanvasGroup")
	slot1.alpha = 0

	LeanTween.alphaCanvas(slot1, 1, 0.2):setUseEstimatedTime(true)

	if findTF(slot0.transform, "white_mask") then
		setActive(slot2, false)
	end
end

function getGroupOwnSkins(slot0)
	slot1 = {}
	slot3 = getProxy(ShipSkinProxy):getSkinList()

	if getProxy(CollectionProxy):getShipGroup(slot0) then
		for slot9, slot10 in ipairs(ShipGroup.getSkinList(slot0)) do
			if slot10.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(slot3, slot10.id) or slot10.skin_type == ShipSkin.SKIN_TYPE_REMAKE and slot4.trans or slot10.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and slot4.married == 1 then
				slot1[slot10.id] = true
			end
		end
	end

	if HXSet.isHx() then
		for slot8 = #slot1, 1, -1 do
			if pg.ship_skin_template[slot1[slot8].id].isHX == 1 then
				table.remove(slot1, slot8)
			end
		end
	end

	return slot1
end

function split(slot0, slot1)
	slot2 = {}

	if not slot0 then
		return nil
	end

	slot3 = #slot0
	slot4 = 1

	while slot3 >= slot4 do
		if string.find(slot0, slot1, slot4) == nil then
			table.insert(slot2, string.sub(slot0, slot4, slot3))

			break
		end

		table.insert(slot2, string.sub(slot0, slot4, slot5 - 1))

		if slot5 == slot3 then
			table.insert(slot2, "")

			break
		end

		slot4 = slot5 + 1
	end

	return slot2
end

function NumberToChinese(slot0, slot1)
	slot2 = ""

	for slot7 = 1, #slot0 do
		if string.sub(slot0, slot7, slot7) ~= "0" or slot8 == "0" and not slot1 then
			slot2 = slot1 and (slot3 >= 2 and (slot7 == 1 and (slot8 == "1" and i18n("number_" .. 10) or i18n("number_" .. slot8) .. i18n("number_" .. 10)) or i18n("number_" .. slot8) .. i18n("number_" .. 10) .. i18n("number_" .. slot8)) or i18n("number_" .. slot8) .. i18n("number_" .. 10) .. i18n("number_" .. slot8) .. i18n("number_" .. slot8)) or i18n("number_" .. slot8) .. i18n("number_" .. 10) .. i18n("number_" .. slot8) .. i18n("number_" .. slot8) .. i18n("number_" .. slot8)
		end
	end

	return slot2
end

function getActivityTask(slot0, slot1)
	slot2 = getProxy(TaskProxy)
	slot4 = pg.TimeMgr.GetInstance()
	slot6, slot7, slot8 = nil
	slot12 = #slot0:getConfig("config_data")

	for slot12 = math.max(slot0.data3, 1), math.min(slot4:DiffDay(slot0.data1, slot4:GetServerTime()) + 1, slot12) do
		for slot17, slot18 in ipairs(_.flatten({
			slot3[slot12]
		})) do
			if slot2:getTaskById(slot18) then
				return slot6.id, slot6
			end

			if slot7 then
				if slot2:getFinishTaskById(slot18) then
					slot7 = slot8
				elseif slot1 then
					return slot18
				else
					return slot7.id, slot7
				end
			else
				slot7 = slot2:getFinishTaskById(slot18)
				slot8 = slot8 or slot18
			end
		end
	end

	if slot7 then
		return slot7.id, slot7
	else
		return slot8
	end
end

function setImageFromImage(slot0, slot1, slot2)
	GetComponent(slot0, "Image").sprite = GetComponent(slot1, "Image").sprite

	if slot2 then
		slot3:SetNativeSize()
	end
end

function skinTimeStamp(slot0)
	slot1, slot2, slot3, slot4 = pg.TimeMgr.GetInstance():parseTimeFrom(slot0)

	if slot1 >= 1 then
		return i18n("limit_skin_time_day", slot1)
	elseif slot1 <= 0 and slot2 > 0 then
		return i18n("limit_skin_time_day_min", slot2, slot3)
	elseif slot1 <= 0 and slot2 <= 0 and (slot3 > 0 or slot4 > 0) then
		return i18n("limit_skin_time_min", math.max(slot3, 1))
	elseif slot1 <= 0 and slot2 <= 0 and slot3 <= 0 and slot4 <= 0 then
		return i18n("limit_skin_time_overtime")
	end
end

function InstagramTimeStamp(slot0)
	if (pg.TimeMgr.GetInstance():GetServerTime() - slot0) / 86400 > 1 then
		return i18n("ins_word_day", math.floor(slot3))
	elseif slot2 / 3600 > 1 then
		return i18n("ins_word_hour", math.floor(slot4))
	elseif slot2 / 60 > 1 then
		return i18n("ins_word_minu", math.floor(slot5))
	else
		return i18n("ins_word_minu", 1)
	end
end

function InstagramReplyTimeStamp(slot0)
	if (pg.TimeMgr.GetInstance():GetServerTime() - slot0) / 86400 > 1 then
		return i18n1(math.floor(slot3) .. "d")
	elseif slot2 / 3600 > 1 then
		return i18n1(math.floor(slot4) .. "h")
	elseif slot2 / 60 > 1 then
		return i18n1(math.floor(slot5) .. "min")
	else
		return i18n1("1min")
	end
end

function attireTimeStamp(slot0)
	slot1, slot2, slot3, slot4 = pg.TimeMgr.GetInstance():parseTimeFrom(slot0)

	if slot1 <= 0 and slot2 <= 0 and slot3 <= 0 and slot4 <= 0 then
		return i18n("limit_skin_time_overtime")
	else
		return i18n("attire_time_stamp", slot1, slot2, slot3)
	end
end

function checkExist(slot0, ...)
	for slot5, slot6 in ipairs({
		...
	}) do
		if not slot0 then
			return false
		end

		slot0 = (type(slot0[slot6[1]]) ~= "function" or slot0[slot6[1]](slot0, unpack(slot6[2] or {}))) and slot0[slot6[1]](slot0, unpack(slot6[2] or ))[slot6[1]]
	end

	return slot0
end

function showRepairMsgbox()
	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		content = i18n("resource_verify_warn"),
		custom = {
			{
				text = i18n("msgbox_repair_l2d"),
				onCallback = function ()
					if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-live2d.csv") then
						Live2DUpdateMgr.Inst:StartVerify()
					else
						pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
					end
				end
			},
			{
				text = i18n("msgbox_repair"),
				onCallback = function ()
					if PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") then
						UpdateMgr.Inst:StartVerify()
					else
						pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
					end
				end
			}
		}
	})
end

function resourceVerify(slot0, slot1)
	if CSharpVersion > 35 then
		UpdateMgr.Inst:StartVerify()

		return
	end

	slot3 = nil
	slot4 = PathMgr.ReadAllLines(Application.persistentDataPath .. "/hashes.csv")
	slot5 = {}

	if slot0 then
		setActive(slot0, true)
	else
		pg.UIMgr.GetInstance():LoadingOn()
	end

	function slot6()
		if uv0 then
			setActive(uv0, false)
		else
			pg.UIMgr.GetInstance():LoadingOff()
		end

		print(uv1)

		if uv1 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("resource_verify_fail", ""),
				onYes = function ()
					VersionMgr.Inst:DeleteCacheFiles()
					Application.Quit()
				end
			})
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("resource_verify_success")
			})
		end
	end

	slot8 = nil

	function (slot0)
		if slot0 < 0 then
			uv0()

			return
		end

		if uv1 then
			setSlider(uv1, 0, uv2, uv2 - slot0)
		end

		slot1 = string.split(uv3[slot0], ",")

		if PathMgr.FileExists(PathMgr.getAssetBundle(slot1[1])) and slot1[3] == HashUtil.CalcMD5(PathMgr.ReadAllBytes(PathMgr.getAssetBundle(slot2))) then
			onNextTick(function ()
				uv0(uv1 - 1)
			end)

			return
		end

		uv5 = slot2

		uv0()
	end(slot4.Length - 1)
end

function checkBirthFormat(slot0)
	if #slot0 ~= 8 then
		return false
	end

	slot1 = 0

	while slot1 < #slot0 do
		if string.byte(slot0, slot1 + 1) < 48 or slot3 > 57 then
			return false
		end

		slot1 = slot1 + 1
	end

	return true
end

slot19 = xpcall

function TryCall(slot0, slot1, ...)
	uv0(slot0, function (slot0)
		errorMsg("Error Handler", slot0)

		if uv0 then
			uv0(slot0)
		end
	end, ...)
end

function isHalfBodyLive2D(slot0)
	return _.any({
		"biaoqiang",
		"z23",
		"lafei",
		"lingbo",
		"mingshi",
		"xuefeng"
	}, function (slot0)
		return slot0 == uv0
	end)
end

function GetServerState(slot0)
	slot1 = -1
	slot2 = 0
	slot3 = 1
	slot4 = 2

	VersionMgr.Inst:WebRequest(NetConst.GetServerStateUrl(), function (slot0, slot1)
		slot2 = true
		slot3 = false

		for slot7 in string.gmatch(slot1, "\"state\":%d") do
			if slot7 ~= "\"state\":1" then
				slot2 = false
			end

			slot3 = true
		end

		if not slot3 then
			slot2 = false
		end

		if uv0 ~= nil then
			uv0(slot2 and uv1 or uv2)
		end
	end)
end
