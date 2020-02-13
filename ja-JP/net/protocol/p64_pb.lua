slot0 = require("protobuf")
slot1 = require("common_pb")

module("p64_pb")

SC_64000 = slot0.Descriptor()
slot2 = slot0.FieldDescriptor()
CS_64001 = slot0.Descriptor()
slot3 = slot0.FieldDescriptor()
slot4 = slot0.FieldDescriptor()
SC_64002 = slot0.Descriptor()
slot5 = slot0.FieldDescriptor()
CS_64003 = slot0.Descriptor()
slot6 = slot0.FieldDescriptor()
SC_64004 = slot0.Descriptor()
slot7 = slot0.FieldDescriptor()
FLEETTECH = slot0.Descriptor()
slot8 = slot0.FieldDescriptor()
slot9 = slot0.FieldDescriptor()
slot10 = slot0.FieldDescriptor()
slot11 = slot0.FieldDescriptor()
slot2.name = "tech_list"
slot2.full_name = ".p64.sc_64000.tech_list"
slot2.number = 1
slot2.index = 0
slot2.label = 3
slot2.has_default_value = false
slot2.default_value = {}
slot2.message_type = FLEETTECH
slot2.type = 11
slot2.cpp_type = 10
SC_64000.name = "sc_64000"
SC_64000.full_name = ".p64.sc_64000"
SC_64000.nested_types = {}
SC_64000.enum_types = {}
SC_64000.fields = {
	slot2
}
SC_64000.is_extendable = false
SC_64000.extensions = {}
slot3.name = "tech_group_id"
slot3.full_name = ".p64.cs_64001.tech_group_id"
slot3.number = 1
slot3.index = 0
slot3.label = 2
slot3.has_default_value = false
slot3.default_value = 0
slot3.type = 13
slot3.cpp_type = 3
slot4.name = "tech_id"
slot4.full_name = ".p64.cs_64001.tech_id"
slot4.number = 2
slot4.index = 1
slot4.label = 2
slot4.has_default_value = false
slot4.default_value = 0
slot4.type = 13
slot4.cpp_type = 3
CS_64001.name = "cs_64001"
CS_64001.full_name = ".p64.cs_64001"
CS_64001.nested_types = {}
CS_64001.enum_types = {}
CS_64001.fields = {
	slot3,
	slot4
}
CS_64001.is_extendable = false
CS_64001.extensions = {}
slot5.name = "result"
slot5.full_name = ".p64.sc_64002.result"
slot5.number = 1
slot5.index = 0
slot5.label = 2
slot5.has_default_value = false
slot5.default_value = 0
slot5.type = 13
slot5.cpp_type = 3
SC_64002.name = "sc_64002"
SC_64002.full_name = ".p64.sc_64002"
SC_64002.nested_types = {}
SC_64002.enum_types = {}
SC_64002.fields = {
	slot5
}
SC_64002.is_extendable = false
SC_64002.extensions = {}
slot6.name = "tech_group_id"
slot6.full_name = ".p64.cs_64003.tech_group_id"
slot6.number = 1
slot6.index = 0
slot6.label = 2
slot6.has_default_value = false
slot6.default_value = 0
slot6.type = 13
slot6.cpp_type = 3
CS_64003.name = "cs_64003"
CS_64003.full_name = ".p64.cs_64003"
CS_64003.nested_types = {}
CS_64003.enum_types = {}
CS_64003.fields = {
	slot6
}
CS_64003.is_extendable = false
CS_64003.extensions = {}
slot7.name = "result"
slot7.full_name = ".p64.sc_64004.result"
slot7.number = 1
slot7.index = 0
slot7.label = 2
slot7.has_default_value = false
slot7.default_value = 0
slot7.type = 13
slot7.cpp_type = 3
SC_64004.name = "sc_64004"
SC_64004.full_name = ".p64.sc_64004"
SC_64004.nested_types = {}
SC_64004.enum_types = {}
SC_64004.fields = {
	slot7
}
SC_64004.is_extendable = false
SC_64004.extensions = {}
slot8.name = "group_id"
slot8.full_name = ".p64.fleettech.group_id"
slot8.number = 1
slot8.index = 0
slot8.label = 2
slot8.has_default_value = false
slot8.default_value = 0
slot8.type = 13
slot8.cpp_type = 3
slot9.name = "effect_tech_id"
slot9.full_name = ".p64.fleettech.effect_tech_id"
slot9.number = 2
slot9.index = 1
slot9.label = 2
slot9.has_default_value = false
slot9.default_value = 0
slot9.type = 13
slot9.cpp_type = 3
slot10.name = "study_tech_id"
slot10.full_name = ".p64.fleettech.study_tech_id"
slot10.number = 3
slot10.index = 2
slot10.label = 2
slot10.has_default_value = false
slot10.default_value = 0
slot10.type = 13
slot10.cpp_type = 3
slot11.name = "study_finish_time"
slot11.full_name = ".p64.fleettech.study_finish_time"
slot11.number = 4
slot11.index = 3
slot11.label = 2
slot11.has_default_value = false
slot11.default_value = 0
slot11.type = 13
slot11.cpp_type = 3
FLEETTECH.name = "fleettech"
FLEETTECH.full_name = ".p64.fleettech"
FLEETTECH.nested_types = {}
FLEETTECH.enum_types = {}
FLEETTECH.fields = {
	slot8,
	slot9,
	slot10,
	slot11
}
FLEETTECH.is_extendable = false
FLEETTECH.extensions = {}
cs_64001 = slot0.Message(CS_64001)
cs_64003 = slot0.Message(CS_64003)
fleettech = slot0.Message(FLEETTECH)
sc_64000 = slot0.Message(SC_64000)
sc_64002 = slot0.Message(SC_64002)
sc_64004 = slot0.Message(SC_64004)

return
