slot0 = require("protobuf")

module("p62_pb")

slot2 = {
	SC_62045_FACILITY_LIST_FIELD = slot0.FieldDescriptor(),
	CS_62046_FACILITY_ID_FIELD = slot0.FieldDescriptor(),
	SC_62047_RESULT_FIELD = slot0.FieldDescriptor(),
	SC_62048_ADDITION_INFO_FIELD = slot0.FieldDescriptor(),
	CS_62049_PROJECT_ID_FIELD = slot0.FieldDescriptor(),
	SC_62050_RESULT_FIELD = slot0.FieldDescriptor(),
	SC_62050_AWARD_LIST_FIELD = slot0.FieldDescriptor(),
	SC_62051_LOG_LIST_FIELD = slot0.FieldDescriptor(),
	CS_62052_TYPE_FIELD = slot0.FieldDescriptor(),
	SC_62053_RESOURCE_FIELD = slot0.FieldDescriptor(),
	SC_62054_CONTRIBUTE_FLAG_FIELD = slot0.FieldDescriptor(),
	SC_62054_JOIN_COLD_TIME_FIELD = slot0.FieldDescriptor(),
	FACILITYINFO_ID_FIELD = slot0.FieldDescriptor(),
	FACILITYINFO_LEVEL_FIELD = slot0.FieldDescriptor(),
	FACILITYADDITIONINFO_TYPE_FIELD = slot0.FieldDescriptor(),
	FACILITYADDITIONINFO_ADDITION_FIELD = slot0.FieldDescriptor(),
	LOG_INFO_CMD_FIELD = slot0.FieldDescriptor(),
	LOG_INFO_TIME_FIELD = slot0.FieldDescriptor(),
	LOG_INFO_USER_ID_FIELD = slot0.FieldDescriptor(),
	LOG_INFO_NAME_FIELD = slot0.FieldDescriptor(),
	LOG_INFO_ARG0_FIELD = slot0.FieldDescriptor(),
	LOG_INFO_ARG1_FIELD = slot0.FieldDescriptor()
}
SC_62045 = slot0.Descriptor()
CS_62046 = slot0.Descriptor()
SC_62047 = slot0.Descriptor()
SC_62048 = slot0.Descriptor()
CS_62049 = slot0.Descriptor()
SC_62050 = slot0.Descriptor()
SC_62051 = slot0.Descriptor()
CS_62052 = slot0.Descriptor()
SC_62053 = slot0.Descriptor()
SC_62054 = slot0.Descriptor()
FACILITYINFO = slot0.Descriptor()
FACILITYADDITIONINFO = slot0.Descriptor()
LOG_INFO = slot0.Descriptor()
slot2.SC_62045_FACILITY_LIST_FIELD.name = "facility_list"
slot2.SC_62045_FACILITY_LIST_FIELD.full_name = "p62.sc_62045.facility_list"
slot2.SC_62045_FACILITY_LIST_FIELD.number = 1
slot2.SC_62045_FACILITY_LIST_FIELD.index = 0
slot2.SC_62045_FACILITY_LIST_FIELD.label = 3
slot2.SC_62045_FACILITY_LIST_FIELD.has_default_value = false
slot2.SC_62045_FACILITY_LIST_FIELD.default_value = {}
slot2.SC_62045_FACILITY_LIST_FIELD.message_type = FACILITYINFO
slot2.SC_62045_FACILITY_LIST_FIELD.type = 11
slot2.SC_62045_FACILITY_LIST_FIELD.cpp_type = 10
SC_62045.name = "sc_62045"
SC_62045.full_name = "p62.sc_62045"
SC_62045.nested_types = {}
SC_62045.enum_types = {}
SC_62045.fields = {
	slot2.SC_62045_FACILITY_LIST_FIELD
}
SC_62045.is_extendable = false
SC_62045.extensions = {}
slot2.CS_62046_FACILITY_ID_FIELD.name = "facility_id"
slot2.CS_62046_FACILITY_ID_FIELD.full_name = "p62.cs_62046.facility_id"
slot2.CS_62046_FACILITY_ID_FIELD.number = 1
slot2.CS_62046_FACILITY_ID_FIELD.index = 0
slot2.CS_62046_FACILITY_ID_FIELD.label = 2
slot2.CS_62046_FACILITY_ID_FIELD.has_default_value = false
slot2.CS_62046_FACILITY_ID_FIELD.default_value = 0
slot2.CS_62046_FACILITY_ID_FIELD.type = 13
slot2.CS_62046_FACILITY_ID_FIELD.cpp_type = 3
CS_62046.name = "cs_62046"
CS_62046.full_name = "p62.cs_62046"
CS_62046.nested_types = {}
CS_62046.enum_types = {}
CS_62046.fields = {
	slot2.CS_62046_FACILITY_ID_FIELD
}
CS_62046.is_extendable = false
CS_62046.extensions = {}
slot2.SC_62047_RESULT_FIELD.name = "result"
slot2.SC_62047_RESULT_FIELD.full_name = "p62.sc_62047.result"
slot2.SC_62047_RESULT_FIELD.number = 1
slot2.SC_62047_RESULT_FIELD.index = 0
slot2.SC_62047_RESULT_FIELD.label = 2
slot2.SC_62047_RESULT_FIELD.has_default_value = false
slot2.SC_62047_RESULT_FIELD.default_value = 0
slot2.SC_62047_RESULT_FIELD.type = 13
slot2.SC_62047_RESULT_FIELD.cpp_type = 3
SC_62047.name = "sc_62047"
SC_62047.full_name = "p62.sc_62047"
SC_62047.nested_types = {}
SC_62047.enum_types = {}
SC_62047.fields = {
	slot2.SC_62047_RESULT_FIELD
}
SC_62047.is_extendable = false
SC_62047.extensions = {}
slot2.SC_62048_ADDITION_INFO_FIELD.name = "addition_info"
slot2.SC_62048_ADDITION_INFO_FIELD.full_name = "p62.sc_62048.addition_info"
slot2.SC_62048_ADDITION_INFO_FIELD.number = 1
slot2.SC_62048_ADDITION_INFO_FIELD.index = 0
slot2.SC_62048_ADDITION_INFO_FIELD.label = 3
slot2.SC_62048_ADDITION_INFO_FIELD.has_default_value = false
slot2.SC_62048_ADDITION_INFO_FIELD.default_value = {}
slot2.SC_62048_ADDITION_INFO_FIELD.message_type = FACILITYADDITIONINFO
slot2.SC_62048_ADDITION_INFO_FIELD.type = 11
slot2.SC_62048_ADDITION_INFO_FIELD.cpp_type = 10
SC_62048.name = "sc_62048"
SC_62048.full_name = "p62.sc_62048"
SC_62048.nested_types = {}
SC_62048.enum_types = {}
SC_62048.fields = {
	slot2.SC_62048_ADDITION_INFO_FIELD
}
SC_62048.is_extendable = false
SC_62048.extensions = {}
slot2.CS_62049_PROJECT_ID_FIELD.name = "project_id"
slot2.CS_62049_PROJECT_ID_FIELD.full_name = "p62.cs_62049.project_id"
slot2.CS_62049_PROJECT_ID_FIELD.number = 1
slot2.CS_62049_PROJECT_ID_FIELD.index = 0
slot2.CS_62049_PROJECT_ID_FIELD.label = 2
slot2.CS_62049_PROJECT_ID_FIELD.has_default_value = false
slot2.CS_62049_PROJECT_ID_FIELD.default_value = 0
slot2.CS_62049_PROJECT_ID_FIELD.type = 13
slot2.CS_62049_PROJECT_ID_FIELD.cpp_type = 3
CS_62049.name = "cs_62049"
CS_62049.full_name = "p62.cs_62049"
CS_62049.nested_types = {}
CS_62049.enum_types = {}
CS_62049.fields = {
	slot2.CS_62049_PROJECT_ID_FIELD
}
CS_62049.is_extendable = false
CS_62049.extensions = {}
slot2.SC_62050_RESULT_FIELD.name = "result"
slot2.SC_62050_RESULT_FIELD.full_name = "p62.sc_62050.result"
slot2.SC_62050_RESULT_FIELD.number = 1
slot2.SC_62050_RESULT_FIELD.index = 0
slot2.SC_62050_RESULT_FIELD.label = 2
slot2.SC_62050_RESULT_FIELD.has_default_value = false
slot2.SC_62050_RESULT_FIELD.default_value = 0
slot2.SC_62050_RESULT_FIELD.type = 13
slot2.SC_62050_RESULT_FIELD.cpp_type = 3
slot2.SC_62050_AWARD_LIST_FIELD.name = "award_list"
slot2.SC_62050_AWARD_LIST_FIELD.full_name = "p62.sc_62050.award_list"
slot2.SC_62050_AWARD_LIST_FIELD.number = 2
slot2.SC_62050_AWARD_LIST_FIELD.index = 1
slot2.SC_62050_AWARD_LIST_FIELD.label = 3
slot2.SC_62050_AWARD_LIST_FIELD.has_default_value = false
slot2.SC_62050_AWARD_LIST_FIELD.default_value = {}
slot2.SC_62050_AWARD_LIST_FIELD.message_type = require("common_pb").DROPINFO
slot2.SC_62050_AWARD_LIST_FIELD.type = 11
slot2.SC_62050_AWARD_LIST_FIELD.cpp_type = 10
SC_62050.name = "sc_62050"
SC_62050.full_name = "p62.sc_62050"
SC_62050.nested_types = {}
SC_62050.enum_types = {}
SC_62050.fields = {
	slot2.SC_62050_RESULT_FIELD,
	slot2.SC_62050_AWARD_LIST_FIELD
}
SC_62050.is_extendable = false
SC_62050.extensions = {}
slot2.SC_62051_LOG_LIST_FIELD.name = "log_list"
slot2.SC_62051_LOG_LIST_FIELD.full_name = "p62.sc_62051.log_list"
slot2.SC_62051_LOG_LIST_FIELD.number = 1
slot2.SC_62051_LOG_LIST_FIELD.index = 0
slot2.SC_62051_LOG_LIST_FIELD.label = 3
slot2.SC_62051_LOG_LIST_FIELD.has_default_value = false
slot2.SC_62051_LOG_LIST_FIELD.default_value = {}
slot2.SC_62051_LOG_LIST_FIELD.message_type = LOG_INFO
slot2.SC_62051_LOG_LIST_FIELD.type = 11
slot2.SC_62051_LOG_LIST_FIELD.cpp_type = 10
SC_62051.name = "sc_62051"
SC_62051.full_name = "p62.sc_62051"
SC_62051.nested_types = {}
SC_62051.enum_types = {}
SC_62051.fields = {
	slot2.SC_62051_LOG_LIST_FIELD
}
SC_62051.is_extendable = false
SC_62051.extensions = {}
slot2.CS_62052_TYPE_FIELD.name = "type"
slot2.CS_62052_TYPE_FIELD.full_name = "p62.cs_62052.type"
slot2.CS_62052_TYPE_FIELD.number = 1
slot2.CS_62052_TYPE_FIELD.index = 0
slot2.CS_62052_TYPE_FIELD.label = 2
slot2.CS_62052_TYPE_FIELD.has_default_value = false
slot2.CS_62052_TYPE_FIELD.default_value = 0
slot2.CS_62052_TYPE_FIELD.type = 13
slot2.CS_62052_TYPE_FIELD.cpp_type = 3
CS_62052.name = "cs_62052"
CS_62052.full_name = "p62.cs_62052"
CS_62052.nested_types = {}
CS_62052.enum_types = {}
CS_62052.fields = {
	slot2.CS_62052_TYPE_FIELD
}
CS_62052.is_extendable = false
CS_62052.extensions = {}
slot2.SC_62053_RESOURCE_FIELD.name = "resource"
slot2.SC_62053_RESOURCE_FIELD.full_name = "p62.sc_62053.resource"
slot2.SC_62053_RESOURCE_FIELD.number = 1
slot2.SC_62053_RESOURCE_FIELD.index = 0
slot2.SC_62053_RESOURCE_FIELD.label = 2
slot2.SC_62053_RESOURCE_FIELD.has_default_value = false
slot2.SC_62053_RESOURCE_FIELD.default_value = 0
slot2.SC_62053_RESOURCE_FIELD.type = 13
slot2.SC_62053_RESOURCE_FIELD.cpp_type = 3
SC_62053.name = "sc_62053"
SC_62053.full_name = "p62.sc_62053"
SC_62053.nested_types = {}
SC_62053.enum_types = {}
SC_62053.fields = {
	slot2.SC_62053_RESOURCE_FIELD
}
SC_62053.is_extendable = false
SC_62053.extensions = {}
slot2.SC_62054_CONTRIBUTE_FLAG_FIELD.name = "contribute_flag"
slot2.SC_62054_CONTRIBUTE_FLAG_FIELD.full_name = "p62.sc_62054.contribute_flag"
slot2.SC_62054_CONTRIBUTE_FLAG_FIELD.number = 1
slot2.SC_62054_CONTRIBUTE_FLAG_FIELD.index = 0
slot2.SC_62054_CONTRIBUTE_FLAG_FIELD.label = 2
slot2.SC_62054_CONTRIBUTE_FLAG_FIELD.has_default_value = false
slot2.SC_62054_CONTRIBUTE_FLAG_FIELD.default_value = 0
slot2.SC_62054_CONTRIBUTE_FLAG_FIELD.type = 13
slot2.SC_62054_CONTRIBUTE_FLAG_FIELD.cpp_type = 3
slot2.SC_62054_JOIN_COLD_TIME_FIELD.name = "join_cold_time"
slot2.SC_62054_JOIN_COLD_TIME_FIELD.full_name = "p62.sc_62054.join_cold_time"
slot2.SC_62054_JOIN_COLD_TIME_FIELD.number = 2
slot2.SC_62054_JOIN_COLD_TIME_FIELD.index = 1
slot2.SC_62054_JOIN_COLD_TIME_FIELD.label = 2
slot2.SC_62054_JOIN_COLD_TIME_FIELD.has_default_value = false
slot2.SC_62054_JOIN_COLD_TIME_FIELD.default_value = 0
slot2.SC_62054_JOIN_COLD_TIME_FIELD.type = 13
slot2.SC_62054_JOIN_COLD_TIME_FIELD.cpp_type = 3
SC_62054.name = "sc_62054"
SC_62054.full_name = "p62.sc_62054"
SC_62054.nested_types = {}
SC_62054.enum_types = {}
SC_62054.fields = {
	slot2.SC_62054_CONTRIBUTE_FLAG_FIELD,
	slot2.SC_62054_JOIN_COLD_TIME_FIELD
}
SC_62054.is_extendable = false
SC_62054.extensions = {}
slot2.FACILITYINFO_ID_FIELD.name = "id"
slot2.FACILITYINFO_ID_FIELD.full_name = "p62.facilityinfo.id"
slot2.FACILITYINFO_ID_FIELD.number = 1
slot2.FACILITYINFO_ID_FIELD.index = 0
slot2.FACILITYINFO_ID_FIELD.label = 2
slot2.FACILITYINFO_ID_FIELD.has_default_value = false
slot2.FACILITYINFO_ID_FIELD.default_value = 0
slot2.FACILITYINFO_ID_FIELD.type = 13
slot2.FACILITYINFO_ID_FIELD.cpp_type = 3
slot2.FACILITYINFO_LEVEL_FIELD.name = "level"
slot2.FACILITYINFO_LEVEL_FIELD.full_name = "p62.facilityinfo.level"
slot2.FACILITYINFO_LEVEL_FIELD.number = 2
slot2.FACILITYINFO_LEVEL_FIELD.index = 1
slot2.FACILITYINFO_LEVEL_FIELD.label = 2
slot2.FACILITYINFO_LEVEL_FIELD.has_default_value = false
slot2.FACILITYINFO_LEVEL_FIELD.default_value = 0
slot2.FACILITYINFO_LEVEL_FIELD.type = 13
slot2.FACILITYINFO_LEVEL_FIELD.cpp_type = 3
FACILITYINFO.name = "facilityinfo"
FACILITYINFO.full_name = "p62.facilityinfo"
FACILITYINFO.nested_types = {}
FACILITYINFO.enum_types = {}
FACILITYINFO.fields = {
	slot2.FACILITYINFO_ID_FIELD,
	slot2.FACILITYINFO_LEVEL_FIELD
}
FACILITYINFO.is_extendable = false
FACILITYINFO.extensions = {}
slot2.FACILITYADDITIONINFO_TYPE_FIELD.name = "type"
slot2.FACILITYADDITIONINFO_TYPE_FIELD.full_name = "p62.facilityAdditionInfo.type"
slot2.FACILITYADDITIONINFO_TYPE_FIELD.number = 1
slot2.FACILITYADDITIONINFO_TYPE_FIELD.index = 0
slot2.FACILITYADDITIONINFO_TYPE_FIELD.label = 2
slot2.FACILITYADDITIONINFO_TYPE_FIELD.has_default_value = false
slot2.FACILITYADDITIONINFO_TYPE_FIELD.default_value = 0
slot2.FACILITYADDITIONINFO_TYPE_FIELD.type = 13
slot2.FACILITYADDITIONINFO_TYPE_FIELD.cpp_type = 3
slot2.FACILITYADDITIONINFO_ADDITION_FIELD.name = "addition"
slot2.FACILITYADDITIONINFO_ADDITION_FIELD.full_name = "p62.facilityAdditionInfo.addition"
slot2.FACILITYADDITIONINFO_ADDITION_FIELD.number = 2
slot2.FACILITYADDITIONINFO_ADDITION_FIELD.index = 1
slot2.FACILITYADDITIONINFO_ADDITION_FIELD.label = 3
slot2.FACILITYADDITIONINFO_ADDITION_FIELD.has_default_value = false
slot2.FACILITYADDITIONINFO_ADDITION_FIELD.default_value = {}
slot2.FACILITYADDITIONINFO_ADDITION_FIELD.type = 13
slot2.FACILITYADDITIONINFO_ADDITION_FIELD.cpp_type = 3
FACILITYADDITIONINFO.name = "facilityAdditionInfo"
FACILITYADDITIONINFO.full_name = "p62.facilityAdditionInfo"
FACILITYADDITIONINFO.nested_types = {}
FACILITYADDITIONINFO.enum_types = {}
FACILITYADDITIONINFO.fields = {
	slot2.FACILITYADDITIONINFO_TYPE_FIELD,
	slot2.FACILITYADDITIONINFO_ADDITION_FIELD
}
FACILITYADDITIONINFO.is_extendable = false
FACILITYADDITIONINFO.extensions = {}
slot2.LOG_INFO_CMD_FIELD.name = "cmd"
slot2.LOG_INFO_CMD_FIELD.full_name = "p62.log_info.cmd"
slot2.LOG_INFO_CMD_FIELD.number = 1
slot2.LOG_INFO_CMD_FIELD.index = 0
slot2.LOG_INFO_CMD_FIELD.label = 2
slot2.LOG_INFO_CMD_FIELD.has_default_value = false
slot2.LOG_INFO_CMD_FIELD.default_value = 0
slot2.LOG_INFO_CMD_FIELD.type = 13
slot2.LOG_INFO_CMD_FIELD.cpp_type = 3
slot2.LOG_INFO_TIME_FIELD.name = "time"
slot2.LOG_INFO_TIME_FIELD.full_name = "p62.log_info.time"
slot2.LOG_INFO_TIME_FIELD.number = 2
slot2.LOG_INFO_TIME_FIELD.index = 1
slot2.LOG_INFO_TIME_FIELD.label = 2
slot2.LOG_INFO_TIME_FIELD.has_default_value = false
slot2.LOG_INFO_TIME_FIELD.default_value = 0
slot2.LOG_INFO_TIME_FIELD.type = 13
slot2.LOG_INFO_TIME_FIELD.cpp_type = 3
slot2.LOG_INFO_USER_ID_FIELD.name = "user_id"
slot2.LOG_INFO_USER_ID_FIELD.full_name = "p62.log_info.user_id"
slot2.LOG_INFO_USER_ID_FIELD.number = 3
slot2.LOG_INFO_USER_ID_FIELD.index = 2
slot2.LOG_INFO_USER_ID_FIELD.label = 2
slot2.LOG_INFO_USER_ID_FIELD.has_default_value = false
slot2.LOG_INFO_USER_ID_FIELD.default_value = 0
slot2.LOG_INFO_USER_ID_FIELD.type = 13
slot2.LOG_INFO_USER_ID_FIELD.cpp_type = 3
slot2.LOG_INFO_NAME_FIELD.name = "name"
slot2.LOG_INFO_NAME_FIELD.full_name = "p62.log_info.name"
slot2.LOG_INFO_NAME_FIELD.number = 4
slot2.LOG_INFO_NAME_FIELD.index = 3
slot2.LOG_INFO_NAME_FIELD.label = 2
slot2.LOG_INFO_NAME_FIELD.has_default_value = false
slot2.LOG_INFO_NAME_FIELD.default_value = ""
slot2.LOG_INFO_NAME_FIELD.type = 9
slot2.LOG_INFO_NAME_FIELD.cpp_type = 9
slot2.LOG_INFO_ARG0_FIELD.name = "arg0"
slot2.LOG_INFO_ARG0_FIELD.full_name = "p62.log_info.arg0"
slot2.LOG_INFO_ARG0_FIELD.number = 5
slot2.LOG_INFO_ARG0_FIELD.index = 4
slot2.LOG_INFO_ARG0_FIELD.label = 3
slot2.LOG_INFO_ARG0_FIELD.has_default_value = false
slot2.LOG_INFO_ARG0_FIELD.default_value = {}
slot2.LOG_INFO_ARG0_FIELD.type = 13
slot2.LOG_INFO_ARG0_FIELD.cpp_type = 3
slot2.LOG_INFO_ARG1_FIELD.name = "arg1"
slot2.LOG_INFO_ARG1_FIELD.full_name = "p62.log_info.arg1"
slot2.LOG_INFO_ARG1_FIELD.number = 6
slot2.LOG_INFO_ARG1_FIELD.index = 5
slot2.LOG_INFO_ARG1_FIELD.label = 1
slot2.LOG_INFO_ARG1_FIELD.has_default_value = false
slot2.LOG_INFO_ARG1_FIELD.default_value = 0
slot2.LOG_INFO_ARG1_FIELD.type = 13
slot2.LOG_INFO_ARG1_FIELD.cpp_type = 3
LOG_INFO.name = "log_info"
LOG_INFO.full_name = "p62.log_info"
LOG_INFO.nested_types = {}
LOG_INFO.enum_types = {}
LOG_INFO.fields = {
	slot2.LOG_INFO_CMD_FIELD,
	slot2.LOG_INFO_TIME_FIELD,
	slot2.LOG_INFO_USER_ID_FIELD,
	slot2.LOG_INFO_NAME_FIELD,
	slot2.LOG_INFO_ARG0_FIELD,
	slot2.LOG_INFO_ARG1_FIELD
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
