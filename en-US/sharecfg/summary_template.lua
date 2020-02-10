slot2[1] = {
	"<size=40>#name#</size>"
}
slot2[2] = {
	"到港日期:#registerTime#"
}
slot2[3] = {
	"执勤:#days#天"
}
slot3[2] = {
	"guildName",
	""
}
slot2[4] = {
	"所属大舰队:#guildName#"
}
slot2[5] = {
	"在指挥官出色的指挥下,\n已将作战海域推进到：#chapterName#"
}
slot2[6] = {
	"誓约人数:#proposeCount#人"
}
slot2[7] = {
	"特殊勋章获取数量:#medalCount#枚"
}
slot2[8] = {
	"后宅家具收集量:#furnitureCount#件\n总计消耗家具币:#furnitureWorth#"
}
slot1.text = {}
slot1.painting = {
	shipId = "#flagShipId#"
}
slot0[1] = {
	style = 1,
	share_btn = true,
	page = 1
}
slot1.condition = {
	"isProPose",
	true
}
slot2[1] = {
	"第一个与指挥官缔结誓约的舰娘是:\n#firstProposeName#\n 他已经与您相伴#proposeTime#天了"
}
slot2[2] = {
	"指挥官一共与#proposeCount#名舰娘缔结誓约,\n一定要遵守与舰娘们的誓约哟~"
}
slot1.text = {}
slot1.painting = {
	shipId = "#firstProposeShipId#"
}
slot0[2] = {
	style = 1,
	page = 2
}
slot1.condition = {
	"isProPose",
	false
}
slot2[1] = {
	"指挥官还没与舰娘缔结过誓约哟~是还没有遇到挚爱之人吗？"
}
slot1.text = {}
slot1.painting = {
	shipId = 100001
}
slot0[3] = {
	style = 1,
	page = 2.1
}
slot0[4] = {
	title = "获得的特殊勋章",
	style = 2,
	page = 3
}

return {}
