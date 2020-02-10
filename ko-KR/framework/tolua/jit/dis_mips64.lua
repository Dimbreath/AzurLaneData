slot1 = string.match(..., ".*%.") or ""
slot0 = require(slot1 .. "dis_mips")
slot1.create = slot0.create
slot1.disass = slot0.disass
slot1.regname = slot0.regname

return {}
