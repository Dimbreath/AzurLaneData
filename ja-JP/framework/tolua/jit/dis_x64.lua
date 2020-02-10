slot1 = string.match(..., ".*%.") or ""
slot0 = require(slot1 .. "dis_x86")
slot1.create = slot0.create64
slot1.disass = slot0.disass64
slot1.regname = slot0.regname64

return {}
