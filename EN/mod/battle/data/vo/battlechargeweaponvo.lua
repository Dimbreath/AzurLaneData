ys = ys or {}
ys.Battle.BattleChargeWeaponVO = class("BattleChargeWeaponVO", ys.Battle.BattlePlayerWeaponVO)
ys.Battle.BattleChargeWeaponVO.__name = "BattleChargeWeaponVO"
ys.Battle.BattleChargeWeaponVO.GCD = ys.Battle.BattleConfig.ChargeWeaponConfig.GCD

function ys.Battle.BattleChargeWeaponVO.Ctor(slot0)
	slot0.super.Ctor(slot0, slot0.GCD)
end

function ys.Battle.BattleChargeWeaponVO.AppendWeapon(slot0, slot1)
	slot0.super.AppendWeapon(slot0, slot1)
	slot1:SetPlayerChargeWeaponVO(slot0)
end

function ys.Battle.BattleChargeWeaponVO.Deduct(slot0, slot1)
	slot0.super.Deduct(slot0, slot1)
	slot0:ResetFocus()
end

function ys.Battle.BattleChargeWeaponVO.ResetFocus(slot0)
	if slot0._focus then
		slot1 = slot0.Battle.BattleCameraUtil.GetInstance()

		slot1:FocusCharacter(nil, slot1.CAST_CAM_ZOOM_OUT_DURATION_CANNON, slot1.CAST_CAM_ZOOM_OUT_EXTRA_DELAY_CANNON)
		slot1:ZoomCamara(slot1.CAST_CAM_ZOOM_SIZE, slot1.CAST_CAM_OVERLOOK_SIZE, slot1.CAST_CAM_ZOOM_OUT_DURATION_CANNON)
		LeanTween.delayedCall(slot1.CAST_CAM_ZOOM_OUT_DURATION_CANNON + slot1.CAST_CAM_ZOOM_OUT_EXTRA_DELAY_CANNON, System.Action(function ()
			slot0._focus = false

			false:BulletTime(slot2.SPEED_FACTOR_FOCUS_CHARACTER, nil)
			false:ZoomCamara(slot2, nil, slot2.CAST_CAM_OVERLOOK_REVERT_DURATION)
		end))
	end
end

return
