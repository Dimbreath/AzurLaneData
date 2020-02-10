pg = pg or {}
slot0 = pg
slot0.FontMgr = singletonClass("FontMgr")
slot1 = slot0.FontMgr

function slot0.FontMgr.Init(slot0, slot1)
	print("initializing font manager...")

	slot0.fonts = {}

	slot3[1] = function (slot0)
		ResourceMgr.Inst:getAssetAsync("font/zhunyuan", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0.fonts.heiti = slot0

			UIUtil.preLoadFont(slot0)
			uv1()
		end), false, false)
	end

	slot3[2] = function (slot0)
		ResourceMgr.Inst:getAssetAsync("font/impact", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0.fonts.impact = slot0

			uv1()
		end), false, false)
	end

	slot3[3] = function (slot0)
		ResourceMgr.Inst:getAssetAsync("font/bankgthd", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0.fonts.bankgthd = slot0

			uv1()
		end), false, false)
	end

	slot3[4] = function (slot0)
		ResourceMgr.Inst:getAssetAsync("font/crifont", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0.fonts.crifont = slot0

			uv1()
		end), false, false)
	end

	slot3[5] = function (slot0)
		ResourceMgr.Inst:getAssetAsync("font/missfont", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0.fonts.missfont = slot0

			uv1()
		end), false, false)
	end

	slot3[6] = function (slot0)
		ResourceMgr.Inst:getAssetAsync("font/remfont", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0.fonts.remfont = slot0

			uv1()
		end), false, false)
	end

	slot3[7] = function (slot0)
		ResourceMgr.Inst:getAssetAsync("font/chuanjiadanFont", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0.fonts.chuanjiadanFont = slot0

			uv1()
		end), false, false)
	end

	slot3[8] = function (slot0)
		ResourceMgr.Inst:getAssetAsync("font/tongchangdanFont", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0.fonts.tongchangdanFont = slot0

			uv1()
		end), false, false)
	end

	slot3[9] = function (slot0)
		ResourceMgr.Inst:getAssetAsync("font/weijichuanFont", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0.fonts.weijichuanFont = slot0

			uv1()
		end), false, false)
	end

	slot3[10] = function (slot0)
		ResourceMgr.Inst:getAssetAsync("font/lvnumber", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0.fonts.lvnumber = slot0

			uv1()
		end), false, false)
	end

	slot3[11] = function (slot0)
		ResourceMgr.Inst:getAssetAsync("font/weaponcountfont", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0.fonts.weaponcountfont = slot0

			uv1()
		end), false, false)
	end

	slot3[12] = function (slot0)
		ResourceMgr.Inst:getAssetAsync("font/countnumber", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0.fonts.countnumber = slot0

			uv1()
		end), false, false)
	end

	slot3[13] = function (slot0)
		ResourceMgr.Inst:getAssetAsync("font/explofont", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0.fonts.explofont = slot0

			uv1()
		end), false, false)
	end

	slot3[14] = function (slot0)
		ResourceMgr.Inst:getAssetAsync("font/treatfont", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0.fonts.treatfont = slot0

			uv1()
		end), false, false)
	end

	slot3[15] = function (slot0)
		ResourceMgr.Inst:getAssetAsync("font/MStiffHei", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0.fonts.MStiffHei = slot0

			uv1()
		end), false, false)
	end

	slot3[16] = function (slot0)
		ResourceMgr.Inst:getAssetAsync("font/number", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0.fonts.number = slot0

			uv1()
		end), false, false)
	end

	slot3[17] = function (slot0)
		ResourceMgr.Inst:getAssetAsync("font/sourcehanserifcn-bold_0", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			uv0.fonts.sourcehanserifcn = slot0

			uv1()
		end), false, false)
	end

	parallelAsync({}, function (slot0)
		uv0(slot0)
	end)
end
