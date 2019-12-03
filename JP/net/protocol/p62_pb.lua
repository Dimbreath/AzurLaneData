slot0 = require("protobuf")

module("p62_pb")

SC_62045 = slot0.Descriptor()
slot2 = slot0.FieldDescriptor()
CS_62046 = slot0.Descriptor()
slot3 = slot0.FieldDescriptor()
SC_62047 = slot0.Descriptor()
slot4 = slot0.FieldDescriptor()
SC_62048 = slot0.Descriptor()
slot5 = slot0.FieldDescriptor()
CS_62049 = slot0.Descriptor()
slot6 = slot0.FieldDescriptor()
SC_62050 = slot0.Descriptor()
slot7 = slot0.FieldDescriptor()
slot8 = slot0.FieldDescriptor()
SC_62051 = slot0.Descriptor()
slot9 = slot0.FieldDescriptor()
CS_62052 = slot0.Descriptor()
slot10 = slot0.FieldDescriptor()
SC_62053 = slot0.Descriptor()
slot11 = slot0.FieldDescriptor()
SC_62054 = slot0.Descriptor()
slot12 = slot0.FieldDescriptor()
slot13 = slot0.FieldDescriptor()
FACILITYINFO = slot0.Descriptor()
slot14 = slot0.FieldDescriptor()
slot15 = slot0.FieldDescriptor()
FACILITYADDITIONINFO = slot0.Descriptor()
slot16 = slot0.FieldDescriptor()
slot17 = slot0.FieldDescriptor()
LOG_INFO = slot0.Descriptor()
slot18 = slot0.FieldDescriptor()
slot19 = slot0.FieldDescriptor()
slot20 = slot0.FieldDescriptor()
slot21 = slot0.FieldDescriptor()
slot22 = slot0.FieldDescriptor()
slot23 = slot0.FieldDescriptor()
slot2.name = "facility_list"
slot2.full_name = ".p62.sc_62045.facility_list"
slot2.number = 1
slot2.index = 0
slot2.label = 3
slot2.has_default_value = false
slot2.default_value = {}
slot2.message_type = FACILITYINFO
slot2.type = 11
slot2.cpp_type = 10
SC_62045.name = "sc_62045"
SC_62045.full_name = ".p62.sc_62045"
SC_62045.nested_types = {}
SC_62045.enum_types = {}
SC_62045.fields = {
	slot2
}
SC_62045.is_extendable = false
SC_62045.extensions = {}
slot3.name = "facility_id"
slot3.full_name = ".p62.cs_62046.facility_id"
slot3.number = 1
slot3.index = 0
slot3.label = 2
slot3.has_default_value = false
slot3.default_value = 0
slot3.type = 13
slot3.cpp_type = 3
CS_62046.name = "cs_62046"
CS_62046.full_name = ".p62.cs_62046"
CS_62046.nested_types = {}
CS_62046.enum_types = {}
CS_62046.fields = {
	slot3
}
CS_62046.is_extendable = false
CS_62046.extensions = {}
slot4.name = "result"
slot4.full_name = ".p62.sc_62047.result"
slot4.number = 1
slot4.index = 0
slot4.label = 2
slot4.has_default_value = false
slot4.default_value = 0
slot4.type = 13
slot4.cpp_type = 3
SC_62047.name = "sc_62047"
SC_62047.full_name = ".p62.sc_62047"
SC_62047.nested_types = {}
SC_62047.enum_types = {}
SC_62047.fields = {
	slot4
}
SC_62047.is_extendable = false
SC_62047.extensions = {}
slot5.name = "addition_info"
slot5.full_name = ".p62.sc_62048.addition_info"
slot5.number = 1
slot5.index = 0
slot5.label = 3
slot5.has_default_value = false
slot5.default_value = {}
slot5.message_type = FACILITYADDITIONINFO
slot5.type = 11
slot5.cpp_type = 10
SC_62048.name = "sc_62048"
SC_62048.full_name = ".p62.sc_62048"
SC_62048.nested_types = {}
SC_62048.enum_types = {}
SC_62048.fields = {
	slot5
}
SC_62048.is_extendable = false
SC_62048.extensions = {}
slot6.name = "project_id"
slot6.full_name = ".p62.cs_62049.project_id"
slot6.number = 1
slot6.index = 0
slot6.label = 2
slot6.has_default_value = false
slot6.default_value = 0
slot6.type = 13
slot6.cpp_type = 3
CS_62049.name = "cs_62049"
CS_62049.full_name = ".p62.cs_62049"
CS_62049.nested_types = {}
CS_62049.enum_types = {}
CS_62049.fields = {
	slot6
}
CS_62049.is_extendable = false
CS_62049.extensions = {}
slot7.name = "result"
slot7.full_name = ".p62.sc_62050.result"
slot7.number = 1
slot7.index = 0
slot7.label = 2
slot7.has_default_value = false
slot7.default_value = 0
slot7.type = 13
slot7.cpp_type = 3
slot8.name = "award_list"
slot8.full_name = ".p62.sc_62050.award_list"
slot8.number = 2
slot8.index = 1
slot8.label = 3
slot8.has_default_value = false
slot8.default_value = {}
slot8.message_type = require("common_pb").DROPINFO
slot8.type = 11
slot8.cpp_type = 10
SC_62050.name = "sc_62050"
SC_62050.full_name = ".p62.sc_62050"
SC_62050.nested_types = {}
SC_62050.enum_types = {}
SC_62050.fields = {
	slot7,
	slot8
}
SC_62050.is_extendable = false
SC_62050.extensions = {}
slot9.name = "log_list"
slot9.full_name = ".p62.sc_62051.log_list"
slot9.number = 1
slot9.index = 0
slot9.label = 3
slot9.has_default_value = false
slot9.default_value = {}
slot9.message_type = LOG_INFO
slot9.type = 11
slot9.cpp_type = 10
SC_62051.name = "sc_62051"
SC_62051.full_name = ".p62.sc_62051"
SC_62051.nested_types = {}
SC_62051.enum_types = {}
SC_62051.fields = {
	slot9
}
SC_62051.is_extendable = false
SC_62051.extensions = {}
slot10.name = "type"
slot10.full_name = ".p62.cs_62052.type"
slot10.number = 1
slot10.index = 0
slot10.label = 2
slot10.has_default_value = false
slot10.default_value = 0
slot10.type = 13
slot10.cpp_type = 3
CS_62052.name = "cs_62052"
CS_62052.full_name = ".p62.cs_62052"
CS_62052.nested_types = {}
CS_62052.enum_types = {}
CS_62052.fields = {
	slot10
}
CS_62052.is_extendable = false
CS_62052.extensions = {}
slot11.name = "resource"
slot11.full_name = ".p62.sc_62053.resource"
slot11.number = 1
slot11.index = 0
slot11.label = 2
slot11.has_default_value = false
slot11.default_value = 0
slot11.type = 13
slot11.cpp_type = 3
SC_62053.name = "sc_62053"
SC_62053.full_name = ".p62.sc_62053"
SC_62053.nested_types = {}
SC_62053.enum_types = {}
SC_62053.fields = {
	slot11
}
SC_62053.is_extendable = false
SC_62053.extensions = {}
slot12.name = "contribute_flag"
slot12.full_name = ".p62.sc_62054.contribute_flag"
slot12.number = 1
slot12.index = 0
slot12.label = 2
slot12.has_default_value = false
slot12.default_value = 0
slot12.type = 13
slot12.cpp_type = 3
slot13.name = "join_cold_time"
slot13.full_name = ".p62.sc_62054.join_cold_time"
slot13.number = 2
slot13.index = 1
slot13.label = 2
slot13.has_default_value = false
slot13.default_value = 0
slot13.type = 13
slot13.cpp_type = 3
SC_62054.name = "sc_62054"
SC_62054.full_name = ".p62.sc_62054"
SC_62054.nested_types = {}
SC_62054.enum_types = {}
SC_62054.fields = {
	slot12,
	slot13
}
SC_62054.is_extendable = false
SC_62054.extensions = {}
slot14.name = "id"
slot14.full_name = ".p62.facilityinfo.id"
slot14.number = 1
slot14.index = 0
slot14.label = 2
slot14.has_default_value = false
slot14.default_value = 0
slot14.type = 13
slot14.cpp_type = 3
slot15.name = "level"
slot15.full_name = ".p62.facilityinfo.level"
slot15.number = 2
slot15.index = 1
slot15.label = 2
slot15.has_default_value = false
slot15.default_value = 0
slot15.type = 13
slot15.cpp_type = 3
FACILITYINFO.name = "facilityinfo"
FACILITYINFO.full_name = ".p62.facilityinfo"
FACILITYINFO.nested_types = {}
FACILITYINFO.enum_types = {}
FACILITYINFO.fields = {
	slot14,
	slot15
}
FACILITYINFO.is_extendable = false
FACILITYINFO.extensions = {}
slot16.name = "type"
slot16.full_name = ".p62.facilityAdditionInfo.type"
slot16.number = 1
slot16.index = 0
slot16.label = 2
slot16.has_default_value = false
slot16.default_value = 0
slot16.type = 13
slot16.cpp_type = 3
slot17.name = "addition"
slot17.full_name = ".p62.facilityAdditionInfo.addition"
slot17.number = 2
slot17.index = 1
slot17.label = 3
slot17.has_default_value = false
slot17.default_value = {}
slot17.type = 13
slot17.cpp_type = 3
FACILITYADDITIONINFO.name = "facilityAdditionInfo"
FACILITYADDITIONINFO.full_name = ".p62.facilityAdditionInfo"
FACILITYADDITIONINFO.nested_types = {}
FACILITYADDITIONINFO.enum_types = {}
FACILITYADDITIONINFO.fields = {
	slot16,
	slot17
}
FACILITYADDITIONINFO.is_extendable = false
FACILITYADDITIONINFO.extensions = {}
slot18.name = "cmd"
slot18.full_name = ".p62.log_info.cmd"
slot18.number = 1
slot18.index = 0
slot18.label = 2
slot18.has_default_value = false
slot18.default_value = 0
slot18.type = 13
slot18.cpp_type = 3
slot19.name = "time"
slot19.full_name = ".p62.log_info.time"
slot19.number = 2
slot19.index = 1
slot19.label = 2
slot19.has_default_value = false
slot19.default_value = 0
slot19.type = 13
slot19.cpp_type = 3
slot20.name = "user_id"
slot20.full_name = ".p62.log_info.user_id"
slot20.number = 3
slot20.index = 2
slot20.label = 2
slot20.has_default_value = false
slot20.default_value = 0
slot20.type = 13
slot20.cpp_type = 3
slot21.name = "name"
slot21.full_name = ".p62.log_info.name"
slot21.number = 4
slot21.index = 3
slot21.label = 2
slot21.has_default_value = false
slot21.default_value = ""
slot21.type = 9
slot21.cpp_type = 9
slot22.name = "arg0"
slot22.full_name = ".p62.log_info.arg0"
slot22.number = 5
slot22.index = 4
slot22.label = 3
slot22.has_default_value = false
slot22.default_value = {}
slot22.type = 13
slot22.cpp_type = 3
slot23.name = "arg1"
slot23.full_name = ".p62.log_info.arg1"
slot23.number = 6
slot23.index = 5
slot23.label = 1
slot23.has_default_value = false
slot23.default_value = 0
slot23.type = 13
slot23.cpp_type = 3
LOG_INFO.name = "log_info"
LOG_INFO.full_name = ".p62.log_info"
LOG_INFO.nested_types = {}
LOG_INFO.enum_types = {}
LOG_INFO.fields = {
	slot18,
	slot19,
	slot20,
	slot21,
	slot22,
	slot23
}
LOG_INFO.is_extendable = false
LOG_INFO.extensions = {}
cs_62046 = slot0.Message(CS_62046)
cs_62049 = slot0.Message(CS_62049)
cs_62052 = slot0.Message(CS_62052)
facilityAdditionInfo = slot0.Message(FACILITYADDITIONINFO)
facilityinfo = slot0.Message(FACILITYINFO)
log_info = slot0.Message(LOG_INFO)
sc_62045 = slot0.Message(SC_62045)
sc_62047 = slot0.Message(SC_62047)
sc_62048 = slot0.Message(SC_62048)
sc_62050 = slot0.Message(SC_62050)
sc_62051 = slot0.Message(SC_62051)
sc_62053 = slot0.Message(SC_62053)
sc_62054 = slot0.Message(SC_62054)

return
