slot0 = class("BackYardBaseThemeTemplate", import("..BackYardTheme"))

function slot0.BuildId(slot0)
	return getProxy(PlayerProxy):getData().id .. slot0
end

function slot0.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1, BackYardTheme.TYPE_USER)

	slot0.userId = slot1.user_id
	slot0.pos = slot1.pos
	slot0.player = slot1.player
	slot0.time = slot1.upload_time or 0
	slot0.collectionCnt = slot1.fav_count or 0
	slot0.likeCnt = slot1.like_count or 0
	slot0.isLike = slot1.is_like or 0
	slot0.isCollection = slot1.is_collection or 0
	slot0.desc = slot1.desc or ""
	slot0.rawPutList = slot1.furniture_put_list or {}
end

function slot0.GetType(slot0)
end

function slot0.IsSelfUsage(slot0)
	return slot0:GetType() == BackYardConst.THEME_TEMPLATE_USAGE_TYPE_SELF
end

function slot0.GetUserId(slot0)
	return slot0.userId
end

function slot0.SetPlayerInfo(slot0, slot1)
	slot0.player = slot1
end

function slot0.ExistPlayerInfo(slot0)
	return slot0.player ~= nil
end

function slot0.GetUploadTime(slot0)
	if slot0.time > 0 then
		return pg.TimeMgr.GetInstance():STimeDescC(slot0.time, "%Y/%m/%d")
	else
		return ""
	end
end

function slot0.IsPushed(slot0)
	return slot0.time > 0
end

function slot0.GetLikeCnt(slot0)
	if slot0.likeCnt > 99999 then
		return "99999+"
	else
		return slot0.likeCnt
	end
end

function slot0.GetCollectionCnt(slot0)
	if slot0.collectionCnt > 99999 then
		return "99999+"
	else
		return slot0.collectionCnt
	end
end

function slot0.IsLiked(slot0)
	return slot0.isLike == 1
end

function slot0.IsCollected(slot0)
	return slot0.isCollection == 1
end

function slot0.CancelCollection(slot0)
	if slot0:IsCollected() then
		slot0.isCollection = 0
	end
end

function slot0.AddCollection(slot0)
	if not slot0:IsCollected() then
		slot0.isCollection = 1
		slot0.collectionCnt = slot0.collectionCnt + 1
	end
end

function slot0.AddLike(slot0)
	if not slot0:IsLiked() then
		slot0.isLike = 1
		slot0.likeCnt = slot0.likeCnt + 1
	end
end

function slot0.ExistLocalImage(slot0)
	return BackYardThemeTempalteUtil.FileExists(slot0.id)
end

function slot0.GetAllFurniture(slot0)
	return slot0.furnitruesByIds
end

function slot0.GetFurnitureCnt(slot0)
end

function slot0.GetRawFurnitrueData(slot0)
	return slot0.furnitures
end

function slot0.GetRawPutList(slot0)
	return slot0.rawPutList
end

function slot0.GetName(slot0)
	return slot0.name
end

function slot0.GetDesc(slot0)
	return slot0.desc
end

function slot0.GetTextureName(slot0)
	return slot0.id
end

function slot0.GetTextureIconName(slot0)
	return slot0.id .. "_icon"
end

function slot0.MatchSearchKey(slot0, slot1)
	return not slot1 or slot1 == "" or function (slot0)
		return string.find(uv0:GetName(), slot0)
	end(slot1) or function (slot0)
		return string.find(uv0:GetDesc(), slot0)
	end(slot1)
end

function slot0.GetPos(slot0)
	return slot0.pos
end

function slot0.ShouldFetch(slot0)
	return false
end

function slot0.ShouldFetch(slot0)
	return false
end

return slot0
