slot1 = string.match(..., ".*%.") or ""
slot0 = require(slot1 .. "dis_mips")
slot1.create = slot0.create_el
slot1.disass = slot0.disass_el
slot1.regname = slot0.regname

return {}
