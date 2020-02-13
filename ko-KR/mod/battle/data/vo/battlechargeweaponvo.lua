ys = ys or {}
slot0 = ys
slot1 = slot0.Battle
slot1 = slot1.BattleConfig
slot2 = slot0.Battle
slot3 = class
slot4 = "BattleChargeWeaponVO"
slot5 = slot0.Battle
slot5 = slot5.BattlePlayerWeaponVO
slot3 = slot3(slot4, slot5)
slot2.BattleChargeWeaponVO = slot3
slot2 = slot0.Battle
slot2 = slot2.BattleChargeWeaponVO
slot3 = "BattleChargeWeaponVO"
slot2.__name = slot3
slot2 = slot0.Battle
slot2 = slot2.BattleChargeWeaponVO
slot3 = slot1.ChargeWeaponConfig
slot3 = slot3.GCD
slot2.GCD = slot3

function slot3(slot0)
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.Ctor
	slot2 = slot0
	slot3 = slot0
	slot3 = slot3.GCD

	slot1(slot2, slot3)
end

slot2.Ctor = slot3

function slot3(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.super
	slot2 = slot2.AppendWeapon
	slot3 = slot0
	slot4 = slot1

	slot2(slot3, slot4)

	slot3 = slot1
	slot2 = slot1.SetPlayerChargeWeaponVO
	slot4 = slot0

	slot2(slot3, slot4)
end

slot2.AppendWeapon = slot3

function slot3(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.super
	slot2 = slot2.Deduct
	slot3 = slot0
	slot4 = slot1

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.ResetFocus

	slot2(slot3)
end

slot2.Deduct = slot3

function slot3(slot0)
	slot1 = slot0._focus

	if slot1 then
		slot1 = slot0
		slot1 = slot1.Battle
		slot1 = slot1.BattleCameraUtil
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot3 = slot1
		slot2 = slot1.FocusCharacter
		slot4 = nil
		slot5 = slot1
		slot5 = slot5.CAST_CAM_ZOOM_OUT_DURATION_CANNON
		slot6 = slot1
		slot6 = slot6.CAST_CAM_ZOOM_OUT_EXTRA_DELAY_CANNON

		slot2(slot3, slot4, slot5, slot6)

		slot3 = slot1
		slot2 = slot1.ZoomCamara
		slot4 = slot1
		slot4 = slot4.CAST_CAM_ZOOM_SIZE
		slot5 = slot1
		slot5 = slot5.CAST_CAM_OVERLOOK_SIZE
		slot6 = slot1
		slot6 = slot6.CAST_CAM_ZOOM_OUT_DURATION_CANNON

		slot2(slot3, slot4, slot5, slot6)

		slot2 = slot1
		slot2 = slot2.CAST_CAM_ZOOM_OUT_DURATION_CANNON
		slot3 = slot1
		slot3 = slot3.CAST_CAM_ZOOM_OUT_EXTRA_DELAY_CANNON
		slot2 = slot2 + slot3
		slot3 = LeanTween
		slot3 = slot3.delayedCall
		slot4 = slot2
		slot5 = System
		slot5 = slot5.Action

		function slot6()
			slot0 = slot0
			slot1 = false
			slot0._focus = slot1
			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.BulletTime
			slot2 = slot2
			slot2 = slot2.SPEED_FACTOR_FOCUS_CHARACTER
			slot3 = nil

			slot0(slot1, slot2, slot3)

			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.ZoomCamara
			slot2, slot3 = nil
			slot4 = slot2
			slot4 = slot4.CAST_CAM_OVERLOOK_REVERT_DURATION

			slot0(slot1, slot2, slot3, slot4)
		end

		slot3(slot4, slot5(slot6))
	end
end

slot2.ResetFocus = slot3

return
