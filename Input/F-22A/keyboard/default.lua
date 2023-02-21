--NIGHTSTORM

local res = external_profile("Config/Input/Aircrafts/base_keyboard_binding.lua")
-- dofile(LockOn_Options.script_path.."devices.lua")
-- dofile(LockOn_Options.script_path.."command_defs.lua")

-- ignore_features(res.keyCommands,{"dragchute"})

local SelectLeft    = 10000
local SelectRight   = 10001
local SelectCenter  = 10002
local SelectAll     = 10003
local SelectStep    = 10004
local Dogfight      = 10005
local AirORIDE      = 10006
local MasterArm     = 10007
local MasterArm_T   = 10008
local Battery       = 10009
local Battery_T     = 10010
local L_GEN         = 10011
local L_GEN_T       = 10012
local R_GEN         = 10013
local R_GEN_T       = 10014
local AAR           = 10015
local AAR_T         = 10016
local DayNight      = 10017
local DayNight_T    = 10018
local Park          = 10019
local Park_T        = 10020
local Detent_F      = 10021
local Detent_S      = 10022
local Brakes        = 10023  
local AirORIDE_T    = 10024    
local APU           = 10025   
local PICKLE        = 10026
local SMFD_Swap     = 10027  
local L_cutoff      = 10028
local R_cutoff      = 10029  
local FCSCenter     = 10030
local FCSNoseUp     = 10031
local FCSNoseDn     = 10032
local FCSRel        = 10033
local FCSMode       = 10034
local FCSAOA        = 10035
local FCSG          = 10036
local FCSStep       = 10037
local BrakesON      = 10038
local BrakesOFF     = 10039
local FCSpitch      = 10040
local ICP_COM1      = 10041
local ICP_COM2      = 10042
local ICP_NAV       = 10043
local ICP_STPT      = 10044
local ICP_ALT       = 10045
local ICP_HUD       = 10046
local ICP_AP        = 10047
local ICP_OP1       = 10048
local ICP_OP2       = 10049
local ICP_OP3       = 10050
local ICP_OP4       = 10051
local ICP_OP5       = 10052
local ICP_OTHR      = 10053
local CLIPBOARD_LEFT   	= 10054
local CLIPBOARD_RIGHT	= 10055
--local L_BRAKE       = 10056
--local R_BRAKE       = 10057
--Left MFD
    local LMFD_OSB_01    = 10061
    local LMFD_OSB_02    = 10062
    local LMFD_OSB_03    = 10063
    local LMFD_OSB_04    = 10064
    local LMFD_OSB_05    = 10065
    local LMFD_OSB_06    = 10066
    local LMFD_OSB_07    = 10067
    local LMFD_OSB_08    = 10068
    local LMFD_OSB_09    = 10069
    local LMFD_OSB_10    = 10070
    local LMFD_OSB_11    = 10071
    local LMFD_OSB_12    = 10072
    local LMFD_OSB_13    = 10073
    local LMFD_OSB_14    = 10074
    local LMFD_OSB_15    = 10075
    local LMFD_OSB_16    = 10076
    local LMFD_OSB_17    = 10077
    local LMFD_OSB_18    = 10078
    local LMFD_OSB_19    = 10079
    local LMFD_OSB_20    = 10080
--Right MFD
    local RMFD_OSB_01    = 10091
    local RMFD_OSB_02    = 10092
    local RMFD_OSB_03    = 10093
    local RMFD_OSB_04    = 10094
    local RMFD_OSB_05    = 10095
    local RMFD_OSB_06    = 10096
    local RMFD_OSB_07    = 10097
    local RMFD_OSB_08    = 10098
    local RMFD_OSB_09    = 10099
    local RMFD_OSB_10    = 10100
    local RMFD_OSB_11    = 10101
    local RMFD_OSB_12    = 10102
    local RMFD_OSB_13    = 10103
    local RMFD_OSB_14    = 10104
    local RMFD_OSB_15    = 10105
    local RMFD_OSB_16    = 10106
    local RMFD_OSB_17    = 10107
    local RMFD_OSB_18    = 10108
    local RMFD_OSB_19    = 10109
    local RMFD_OSB_20    = 10110
--Center MFD
    local CMFD_OSB_01    = 10111
    local CMFD_OSB_02    = 10112
    local CMFD_OSB_03    = 10113
    local CMFD_OSB_04    = 10114
    local CMFD_OSB_05    = 10115
    local CMFD_OSB_06    = 10116
    local CMFD_OSB_07    = 10117
    local CMFD_OSB_08    = 10118
    local CMFD_OSB_09    = 10119
    local CMFD_OSB_10    = 10120
    local CMFD_OSB_11    = 10121
    local CMFD_OSB_12    = 10122
    local CMFD_OSB_13    = 10123
    local CMFD_OSB_14    = 10124
    local CMFD_OSB_15    = 10125
    local CMFD_OSB_16    = 10126
    local CMFD_OSB_17    = 10127
    local CMFD_OSB_18    = 10128
    local CMFD_OSB_19    = 10129
    local CMFD_OSB_20    = 10130
--PMFD
    local PMFD_OSB_01    = 10131
    local PMFD_OSB_02    = 10132
    local PMFD_OSB_03    = 10133
    local PMFD_OSB_04    = 10134
    local PMFD_OSB_05    = 10135
    local PMFD_OSB_06    = 10136
    local PMFD_OSB_07    = 10137
    local PMFD_OSB_08    = 10138
    local PMFD_OSB_09    = 10139
    local PMFD_OSB_10    = 10140
    local PMFD_OSB_11    = 10141
    local PMFD_OSB_12    = 10142
    local PMFD_OSB_13    = 10143
    local PMFD_OSB_14    = 10144
    local PMFD_OSB_15    = 10145
    local PMFD_OSB_16    = 10146
    local PMFD_OSB_17    = 10147
    local PMFD_OSB_18    = 10148
    local PMFD_OSB_19    = 10149
    local PMFD_OSB_20    = 10150

    local LIGHT_TAXI      = 10151
    local LIGHT_TAXI_T    = 10152
    local LIGHT_LANDING   = 10153
    local LIGHT_LANDING_T = 10154
----------------------------------------NIGHTSTORM Custom Commands
	local NavMode	      = 10155	
--MFD LEFT
	local LMFD_ENG	      = 10156
	local LMFD_FCS	      = 10157
	local LMFD_FUEL	      = 10158
	local LMFD_ADI	      = 10159
	local LMFD_BAY	      = 10160	
	local LMFD_VVI	      = 10161
	local LMFD_SMS	      = 10162	
	local LMFD_HSI	      = 10163	
	local LMFD_SYS	      = 10164
--MFD RIGHT
	local RMFD_ENG	      = 10165
	local RMFD_FCS	      = 10166
	local RMFD_FUEL	      = 10167
	local RMFD_ADI	      = 10168
	local RMFD_BAY	      = 10169	
	local RMFD_VVI	      = 10170
	local RMFD_RWR	      = 10171	
	local RMFD_HSI	      = 10172	
	local RMFD_SYS	      = 10173
--MFD CENTER
	local CMFD_ENG	      = 10174
	local CMFD_FCS	      = 10175
	local CMFD_FUEL	      = 10176
	local CMFD_ADI	      = 10177
	local CMFD_BAY	      = 10178	
	local CMFD_VVI	      = 10179
	local CMFD_MAP	      = 10180	
	local CMFD_HSI	      = 10181	
	local CMFD_SYS	      = 10182
--MFD CYCLE
	local LMFD_CYCLE      = 10183	
	local RMFD_CYCLE      = 10184	
	local CMFD_CYCLE      = 10185
--PFD CENTER
	local PMFD_CYCLE      = 10186
	local PMFD_ADV	      = 10187
	local PMFD_RADAR      = 10188
	local PMFD_MAP	      = 10189
	local PMFD_SYS	      = 10190
	local PMFD_CHK	      = 10191	--CONFIG
	local PMFD_ENG	      = 10192	--SFM
	local PMFD_VVI	      = 10193	--NIGHTSTORM
	local PMFD_FUEL	      = 10200	--NIGHTSTORM	
	local PMFD_HSD	      = 10201	--NIGHTSTORM			
--CONFIG OPTIONS
	local CANOPY_CLING	  = 10194
	local COCKPIT_PHOTO	  = 10195
--	local COCKPIT_FLOOD	  = 10196
--	local PILOT_VISOR	  = 10197
--	local CANOPY_TINT	  = 10198
	local DefaultMode	  = 10199
	local BVRMode		  = 10202
	local CRSMode		  = 10203		
----------------------------------------NIGHTSTORM Custom Commands

--  FlyingAlex ATC Mod toggle command
local AutoThrottle    = 10210

	
join(res.keyCommands,{

-- FlyingAlex
    {down = AutoThrottle,               name = _('Autopilot - Toggle ATC'),               category = _('Autopilot')},  


--SMFD Both    
    {down = SMFD_Swap,                  name = _('SMFD Page Swap'),                       category = _('F-22A Systems')},

--NIGHTSTORM
    {down = 3009, up = 3009, cockpit_device_id = 1, value_down = 1.0, value_up = 0.0, name = _('Special - SMFD Right OSB'),                     category = _('F-22A Systems')},
    {down = 3010, up = 3010, cockpit_device_id = 1, value_down = 1.0, value_up = 0.0, name = _('Special - SMFD Left OSB'),                      category = _('F-22A Systems')},
--NIGHTSTORM		
	
--MFD LEFT
 
	{down = LMFD_ENG,	                name = _('LMFD ENG Page'),               category = _('F-22A MFD Left')},
	{down = LMFD_FCS,	                name = _('LMFD FCS Page'),               category = _('F-22A MFD Left')},
	{down = LMFD_FUEL,	                name = _('LMFD FUEL Page'),              category = _('F-22A MFD Left')},
	{down = LMFD_ADI,	                name = _('LMFD ADI Page'),               category = _('F-22A MFD Left')},
	{down = LMFD_BAY,	                name = _('LMFD BAY Page'),               category = _('F-22A MFD Left')},
	{down = LMFD_VVI,	                name = _('LMFD VVI Page'),               category = _('F-22A MFD Left')},
	{down = LMFD_HSI,	                name = _('LMFD HSI Page'),               category = _('F-22A MFD Left')},
	{down = LMFD_SMS,	                name = _('LMFD SMS Page'),               category = _('F-22A MFD Left')},
	{down = LMFD_SYS,	                name = _('LMFD SYS Page'),               category = _('F-22A MFD Left')},	

	{down = LMFD_CYCLE,	                name = _('Cycle Left MFD Page'),          category = _('F-22A HOTAS')},	

--[[
    {down = LMFD_OSB_01,                name = _('MFD Left OSB 1'),                       category = _('F-22A MFD Left')},
    {down = LMFD_OSB_02,                name = _('MFD Left OSB 2'),                       category = _('F-22A MFD Left')},
    {down = LMFD_OSB_03,                name = _('MFD Left OSB 3'),                       category = _('F-22A MFD Left')},
    {down = LMFD_OSB_04,                name = _('MFD Left OSB 4'),                       category = _('F-22A MFD Left')},
    {down = LMFD_OSB_05,                name = _('MFD Left OSB 5'),                       category = _('F-22A MFD Left')},
    {down = LMFD_OSB_06,                name = _('MFD Left OSB 6'),                       category = _('F-22A MFD Left')},
    {down = LMFD_OSB_07,                name = _('MFD Left OSB 7'),                       category = _('F-22A MFD Left')},
    {down = LMFD_OSB_08,                name = _('MFD Left OSB 8'),                       category = _('F-22A MFD Left')},
    {down = LMFD_OSB_09,                name = _('MFD Left OSB 9'),                       category = _('F-22A MFD Left')},
    {down = LMFD_OSB_10,                name = _('MFD Left OSB 10'),                      category = _('F-22A MFD Left')},
    {down = LMFD_OSB_11,                name = _('MFD Left OSB 11'),                      category = _('F-22A MFD Left')},
    {down = LMFD_OSB_12,                name = _('MFD Left OSB 12'),                      category = _('F-22A MFD Left')},
    {down = LMFD_OSB_13,                name = _('MFD Left OSB 13'),                      category = _('F-22A MFD Left')},
    {down = LMFD_OSB_14,                name = _('MFD Left OSB 14'),                      category = _('F-22A MFD Left')},
    {down = LMFD_OSB_15,                name = _('MFD Left OSB 15'),                      category = _('F-22A MFD Left')},
    {down = LMFD_OSB_16,                name = _('MFD Left OSB 16'),                      category = _('F-22A MFD Left')},
    {down = LMFD_OSB_17,                name = _('MFD Left OSB 17'),                      category = _('F-22A MFD Left')},
    {down = LMFD_OSB_18,                name = _('MFD Left OSB 18'),                      category = _('F-22A MFD Left')},
    {down = LMFD_OSB_19,                name = _('MFD Left OSB 19'),                      category = _('F-22A MFD Left')},
    {down = LMFD_OSB_20,                name = _('MFD Left OSB 20'),                      category = _('F-22A MFD Left')},
--]]
 --NIGHTSTORM
	{down = 3001, up = 3001, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 1'),                       category = _('F-22A MFD Left')},
    {down = 3002, up = 3002, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 2'),                       category = _('F-22A MFD Left')},
    {down = 3003, up = 3003, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 3'),                       category = _('F-22A MFD Left')},
    {down = 3004, up = 3004, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 4'),                       category = _('F-22A MFD Left')},
    {down = 3005, up = 3005, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 5'),                       category = _('F-22A MFD Left')},
    {down = 3006, up = 3006, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 6'),                       category = _('F-22A MFD Left')},
    {down = 3007, up = 3007, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 7'),                       category = _('F-22A MFD Left')},
    {down = 3008, up = 3008, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 8'),                       category = _('F-22A MFD Left')},
    {down = 3009, up = 3009, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 9'),                       category = _('F-22A MFD Left')},
    {down = 3010, up = 3010, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 10'),                      category = _('F-22A MFD Left')},
    {down = 3011, up = 3011, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 11'),                      category = _('F-22A MFD Left')},
    {down = 3012, up = 3012, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 12'),                      category = _('F-22A MFD Left')},
    {down = 3013, up = 3013, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 13'),                      category = _('F-22A MFD Left')},
    {down = 3014, up = 3014, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 14'),                      category = _('F-22A MFD Left')},
    {down = 3015, up = 3015, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 15'),                      category = _('F-22A MFD Left')},
    {down = 3016, up = 3016, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 16'),                      category = _('F-22A MFD Left')},
    {down = 3017, up = 3017, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 17'),                      category = _('F-22A MFD Left')},
    {down = 3018, up = 3018, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 18'),                      category = _('F-22A MFD Left')},
    {down = 3019, up = 3019, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 19'),                      category = _('F-22A MFD Left')},
    {down = 3020, up = 3020, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Left OSB 20'),                      category = _('F-22A MFD Left')},
--NIGHTSTORM 

--MFD RIGHT

	{down = RMFD_ENG,	                name = _('RMFD ENG Page'),               category = _('F-22A MFD Right')},
	{down = RMFD_FCS,	                name = _('RMFD FCS Page'),               category = _('F-22A MFD Right')},
	{down = RMFD_FUEL,	                name = _('RMFD FUEL Page'),              category = _('F-22A MFD Right')},
	{down = RMFD_ADI,	                name = _('RMFD ADI Page'),               category = _('F-22A MFD Right')},
	{down = RMFD_BAY,	                name = _('RMFD BAY Page'),               category = _('F-22A MFD Right')},
	{down = RMFD_VVI,	                name = _('RMFD VVI Page'),               category = _('F-22A MFD Right')},
	{down = RMFD_HSI,	                name = _('RMFD HSI Page'),               category = _('F-22A MFD Right')},
	{down = RMFD_RWR,	                name = _('RMFD RWR Page'),               category = _('F-22A MFD Right')},
	{down = RMFD_SYS,	                name = _('RMFD SYS Page'),               category = _('F-22A MFD Right')},	
	
	{down = RMFD_CYCLE,	                name = _('Cycle Right MFD Page'),         category = _('F-22A HOTAS')},			

--[[
    {down = RMFD_OSB_01,                name = _('MFD Right OSB 1'),                      category = _('F-22A MFD Right')},
    {down = RMFD_OSB_02,                name = _('MFD Right OSB 2'),                      category = _('F-22A MFD Right')},
    {down = RMFD_OSB_03,                name = _('MFD Right OSB 3'),                      category = _('F-22A MFD Right')},
    {down = RMFD_OSB_04,                name = _('MFD Right OSB 4'),                      category = _('F-22A MFD Right')},
    {down = RMFD_OSB_05,                name = _('MFD Right OSB 5'),                      category = _('F-22A MFD Right')},
    {down = RMFD_OSB_06,                name = _('MFD Right OSB 6'),                      category = _('F-22A MFD Right')},
    {down = RMFD_OSB_07,                name = _('MFD Right OSB 7'),                      category = _('F-22A MFD Right')},
    {down = RMFD_OSB_08,                name = _('MFD Right OSB 8'),                      category = _('F-22A MFD Right')},
    {down = RMFD_OSB_09,                name = _('MFD Right OSB 9'),                      category = _('F-22A MFD Right')},
    {down = RMFD_OSB_10,                name = _('MFD Right OSB 10'),                     category = _('F-22A MFD Right')},
    {down = RMFD_OSB_11,                name = _('MFD Right OSB 11'),                     category = _('F-22A MFD Right')},
    {down = RMFD_OSB_12,                name = _('MFD Right OSB 12'),                     category = _('F-22A MFD Right')},
    {down = RMFD_OSB_13,                name = _('MFD Right OSB 13'),                     category = _('F-22A MFD Right')},
    {down = RMFD_OSB_14,                name = _('MFD Right OSB 14'),                     category = _('F-22A MFD Right')},
    {down = RMFD_OSB_15,                name = _('MFD Right OSB 15'),                     category = _('F-22A MFD Right')},
    {down = RMFD_OSB_16,                name = _('MFD Right OSB 16'),                     category = _('F-22A MFD Right')},
    {down = RMFD_OSB_17,                name = _('MFD Right OSB 17'),                     category = _('F-22A MFD Right')},
    {down = RMFD_OSB_18,                name = _('MFD Right OSB 18'),                     category = _('F-22A MFD Right')},
    {down = RMFD_OSB_19,                name = _('MFD Right OSB 19'),                     category = _('F-22A MFD Right')},
    {down = RMFD_OSB_20,                name = _('MFD Right OSB 20'),                     category = _('F-22A MFD Right')},
--]]
--NIGHTSTORM 
	{down = 3021, up = 3021, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 1'),                       category = _('F-22A MFD Right')},
    {down = 3022, up = 3022, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 2'),                       category = _('F-22A MFD Right')},
    {down = 3023, up = 3023, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 3'),                       category = _('F-22A MFD Right')},
    {down = 3024, up = 3024, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 4'),                       category = _('F-22A MFD Right')},
    {down = 3025, up = 3025, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 5'),                       category = _('F-22A MFD Right')},
    {down = 3026, up = 3026, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 6'),                       category = _('F-22A MFD Right')},
    {down = 3027, up = 3027, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 7'),                       category = _('F-22A MFD Right')},
    {down = 3028, up = 3028, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 8'),                       category = _('F-22A MFD Right')},
    {down = 3029, up = 3029, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 9'),                       category = _('F-22A MFD Right')},
    {down = 3030, up = 3030, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 10'),                      category = _('F-22A MFD Right')},
    {down = 3031, up = 3031, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 11'),                      category = _('F-22A MFD Right')},
    {down = 3032, up = 3032, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 12'),                      category = _('F-22A MFD Right')},
    {down = 3033, up = 3033, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 13'),                      category = _('F-22A MFD Right')},
    {down = 3034, up = 3034, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 14'),                      category = _('F-22A MFD Right')},
    {down = 3035, up = 3035, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 15'),                      category = _('F-22A MFD Right')},
    {down = 3036, up = 3036, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 16'),                      category = _('F-22A MFD Right')},
    {down = 3037, up = 3037, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 17'),                      category = _('F-22A MFD Right')},
    {down = 3038, up = 3038, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 18'),                      category = _('F-22A MFD Right')},
    {down = 3039, up = 3039, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 19'),                      category = _('F-22A MFD Right')},
    {down = 3040, up = 3040, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Right OSB 20'),                      category = _('F-22A MFD Right')},
--NIGHTSTORM 

--MFD CENTER

	{down = CMFD_ENG,	                name = _('CMFD ENG Page'),               category = _('F-22A MFD Center')},
	{down = CMFD_FCS,	                name = _('CMFD FCS Page'),               category = _('F-22A MFD Center')},
	{down = CMFD_FUEL,	                name = _('CMFD FUEL Page'),              category = _('F-22A MFD Center')},
	{down = CMFD_ADI,	                name = _('CMFD ADI Page'),               category = _('F-22A MFD Center')},
	{down = CMFD_BAY,	                name = _('CMFD BAY Page'),               category = _('F-22A MFD Center')},
	{down = CMFD_VVI,	                name = _('CMFD VVI Page'),               category = _('F-22A MFD Center')},
	{down = CMFD_HSI,	                name = _('CMFD HSI Page'),               category = _('F-22A MFD Center')},
	{down = CMFD_MAP,	                name = _('CMFD MAP Page'),               category = _('F-22A MFD Center')},
	{down = CMFD_SYS,	                name = _('CMFD SYS Page'),               category = _('F-22A MFD Center')},	
	
	{down = CMFD_CYCLE,	                name = _('Cycle Center MFD Page'),        category = _('F-22A HOTAS')},	

--[[
    {down = CMFD_OSB_01,                name = _('MFD Center OSB 1'),                     category = _('F-22A MFD Center')},
    {down = CMFD_OSB_02,                name = _('MFD Center OSB 2'),                     category = _('F-22A MFD Center')},
    {down = CMFD_OSB_03,                name = _('MFD Center OSB 3'),                     category = _('F-22A MFD Center')},
    {down = CMFD_OSB_04,                name = _('MFD Center OSB 4'),                     category = _('F-22A MFD Center')},
    {down = CMFD_OSB_05,                name = _('MFD Center OSB 5'),                     category = _('F-22A MFD Center')},
    {down = CMFD_OSB_06,                name = _('MFD Center OSB 6'),                     category = _('F-22A MFD Center')},
    {down = CMFD_OSB_07,                name = _('MFD Center OSB 7'),                     category = _('F-22A MFD Center')},
    {down = CMFD_OSB_08,                name = _('MFD Center OSB 8'),                     category = _('F-22A MFD Center')},
    {down = CMFD_OSB_09,                name = _('MFD Center OSB 9'),                     category = _('F-22A MFD Center')},
    {down = CMFD_OSB_10,                name = _('MFD Center OSB 10'),                    category = _('F-22A MFD Center')},
    {down = CMFD_OSB_11,                name = _('MFD Center OSB 11'),                    category = _('F-22A MFD Center')},
    {down = CMFD_OSB_12,                name = _('MFD Center OSB 12'),                    category = _('F-22A MFD Center')},
    {down = CMFD_OSB_13,                name = _('MFD Center OSB 13'),                    category = _('F-22A MFD Center')},
    {down = CMFD_OSB_14,                name = _('MFD Center OSB 14'),                    category = _('F-22A MFD Center')},
    {down = CMFD_OSB_15,                name = _('MFD Center OSB 15'),                    category = _('F-22A MFD Center')},
    {down = CMFD_OSB_16,                name = _('MFD Center OSB 16'),                    category = _('F-22A MFD Center')},
    {down = CMFD_OSB_17,                name = _('MFD Center OSB 17'),                    category = _('F-22A MFD Center')},
    {down = CMFD_OSB_18,                name = _('MFD Center OSB 18'),                    category = _('F-22A MFD Center')},
    {down = CMFD_OSB_19,                name = _('MFD Center OSB 19'),                    category = _('F-22A MFD Center')},
    {down = CMFD_OSB_20,                name = _('MFD Center OSB 20'),                    category = _('F-22A MFD Center')},
--]]
 --NIGHTSTORM
	{down = 3041, up = 3041, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 1'),                       category = _('F-22A MFD Center')},
    {down = 3042, up = 3044, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 2'),                       category = _('F-22A MFD Center')},
    {down = 3043, up = 3043, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 3'),                       category = _('F-22A MFD Center')},
    {down = 3044, up = 3044, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 4'),                       category = _('F-22A MFD Center')},
    {down = 3045, up = 3045, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 5'),                       category = _('F-22A MFD Center')},
    {down = 3046, up = 3046, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 6'),                       category = _('F-22A MFD Center')},
    {down = 3047, up = 3047, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 7'),                       category = _('F-22A MFD Center')},
    {down = 3048, up = 3048, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 8'),                       category = _('F-22A MFD Center')},
    {down = 3049, up = 3049, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 9'),                       category = _('F-22A MFD Center')},
    {down = 3050, up = 3050, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 10'),                      category = _('F-22A MFD Center')},
    {down = 3051, up = 3051, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 11'),                      category = _('F-22A MFD Center')},
    {down = 3052, up = 3052, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 12'),                      category = _('F-22A MFD Center')},
    {down = 3053, up = 3053, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 13'),                      category = _('F-22A MFD Center')},
    {down = 3054, up = 3054, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 14'),                      category = _('F-22A MFD Center')},
    {down = 3055, up = 3055, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 15'),                      category = _('F-22A MFD Center')},
    {down = 3056, up = 3056, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 16'),                      category = _('F-22A MFD Center')},
    {down = 3057, up = 3057, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 17'),                      category = _('F-22A MFD Center')},
    {down = 3058, up = 3058, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 18'),                      category = _('F-22A MFD Center')},
    {down = 3059, up = 3059, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 19'),                      category = _('F-22A MFD Center')},
    {down = 3060, up = 3060, cockpit_device_id = 5, value_down = 1.0, value_up = 0.0, name = _('Special - MFD Center OSB 20'),                      category = _('F-22A MFD Center')},
 --NIGHTSTORM

--PMFD

--PFD CENTER

	{down = PMFD_ADV,	                name = _('PMFD ADV Page'),               	category = _('F-22A PMFD')},
	{down = PMFD_RADAR,	                name = _('PMFD RADAR Page'),               	category = _('F-22A PMFD')},
	{down = PMFD_MAP,	                name = _('PMFD MAP Page'),              	category = _('F-22A PMFD')},
	{down = PMFD_SYS,	                name = _('PMFD SYS Page'),               	category = _('F-22A PMFD')},
	{down = PMFD_CHK,	                name = _('PMFD CHK Page'),               	category = _('F-22A PMFD')},
	{down = PMFD_ENG,	                name = _('PMFD ENG Page'),               	category = _('F-22A PMFD')},
	{down = PMFD_VVI,	                name = _('PMFD VVI Page'),               	category = _('F-22A PMFD')},
	{down = PMFD_FUEL,	                name = _('PMFD FUEL Page'),               	category = _('F-22A PMFD')},		
	{down = PMFD_HSD,	                name = _('PMFD HSD Page'),               	category = _('F-22A PMFD')},		
	
	{down = PMFD_CYCLE,	                name = _('Cycle PMFD Page'),        		category = _('F-22A HOTAS')},	

--[[
    {down = PMFD_OSB_01,                name = _('PMFD OSB 1'),                           category = _('F-22A PMFD')},
    {down = PMFD_OSB_02,                name = _('PMFD OSB 2'),                           category = _('F-22A PMFD')},
    {down = PMFD_OSB_03,                name = _('PMFD OSB 3'),                           category = _('F-22A PMFD')},
    {down = PMFD_OSB_04,                name = _('PMFD OSB 4'),                           category = _('F-22A PMFD')},
    {down = PMFD_OSB_05,                name = _('PMFD OSB 5'),                           category = _('F-22A PMFD')},
    {down = PMFD_OSB_06,                name = _('PMFD OSB 6'),                           category = _('F-22A PMFD')},
    {down = PMFD_OSB_07,                name = _('PMFD OSB 7'),                           category = _('F-22A PMFD')},
    {down = PMFD_OSB_08,                name = _('PMFD OSB 8'),                           category = _('F-22A PMFD')},
    {down = PMFD_OSB_09,                name = _('PMFD OSB 9'),                           category = _('F-22A PMFD')},
    {down = PMFD_OSB_10,                name = _('PMFD OSB 10'),                          category = _('F-22A PMFD')},
    {down = PMFD_OSB_11,                name = _('PMFD OSB 11'),                          category = _('F-22A PMFD')},
    {down = PMFD_OSB_12,                name = _('PMFD OSB 12'),                          category = _('F-22A PMFD')},
    {down = PMFD_OSB_13,                name = _('PMFD OSB 13'),                          category = _('F-22A PMFD')},
    {down = PMFD_OSB_14,                name = _('PMFD OSB 14'),                          category = _('F-22A PMFD')},
    {down = PMFD_OSB_15,                name = _('PMFD OSB 15'),                          category = _('F-22A PMFD')},
    {down = PMFD_OSB_16,                name = _('PMFD OSB 16'),                          category = _('F-22A PMFD')},
    {down = PMFD_OSB_17,                name = _('PMFD OSB 17'),                          category = _('F-22A PMFD')},
    {down = PMFD_OSB_18,                name = _('PMFD OSB 18'),                          category = _('F-22A PMFD')},
    {down = PMFD_OSB_19,                name = _('PMFD OSB 19'),                          category = _('F-22A PMFD')},
    {down = PMFD_OSB_20,                name = _('PMFD OSB 20'),                          category = _('F-22A PMFD')}, 
--]]

--NIGHTSTORM
	{down = 3001, up = 3001, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 1'),                       category = _('F-22A PMFD')},
    {down = 3002, up = 3002, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 2'),                       category = _('F-22A PMFD')},
    {down = 3003, up = 3003, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 3'),                       category = _('F-22A PMFD')},
    {down = 3004, up = 3004, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 4'),                       category = _('F-22A PMFD')},
    {down = 3005, up = 3005, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 5'),                       category = _('F-22A PMFD')},
    {down = 3006, up = 3006, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 6'),                       category = _('F-22A PMFD')},
    {down = 3007, up = 3007, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 7'),                       category = _('F-22A PMFD')},
    {down = 3008, up = 3008, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 8'),                       category = _('F-22A PMFD')},
    {down = 3009, up = 3009, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 9'),                       category = _('F-22A PMFD')},
    {down = 3010, up = 3010, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 10'),                      category = _('F-22A PMFD')},
    {down = 3011, up = 3011, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 11'),                      category = _('F-22A PMFD')},
    {down = 3012, up = 3012, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 12'),                      category = _('F-22A PMFD')},
    {down = 3013, up = 3013, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 13'),                      category = _('F-22A PMFD')},
    {down = 3014, up = 3014, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 14'),                      category = _('F-22A PMFD')},
    {down = 3015, up = 3015, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 15'),                      category = _('F-22A PMFD')},
    {down = 3016, up = 3016, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 16'),                      category = _('F-22A PMFD')},
    {down = 3017, up = 3017, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 17'),                      category = _('F-22A PMFD')},
    {down = 3018, up = 3018, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 18'),                      category = _('F-22A PMFD')},
    {down = 3019, up = 3019, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 19'),                      category = _('F-22A PMFD')},
    {down = 3020, up = 3020, cockpit_device_id = 6, value_down = 1.0, value_up = 0.0, name = _('Special - MFD PMFD OSB 20'),                      category = _('F-22A PMFD')},
--NIGHTSTORM

--MISC BINDS               
    {down = CLIPBOARD_LEFT,             name = _('Clipboard Left Show/Hide'),           category = _('F-22A Misc')},
    {down = CLIPBOARD_RIGHT,            name = _('Clipboard Right Show/Hide'),          category = _('F-22A Misc')},    
	{down = CANOPY_CLING,	            name = _('Garfiled Clinger'),              		category = _('F-22A Misc')},	
	{down = COCKPIT_PHOTO,	            name = _('Cockpit Photograph'),            		category = _('F-22A Misc')},		
--	{down = COCKPIT_FLOOD,	            name = _('Cockpit Flood Color'),           		category = _('F-22A Misc')},	
--	{down = PILOT_VISOR,	            name = _('Pilot Visor Type'),           		category = _('F-22A Misc')},	
--	{down = CANOPY_TINT,	            name = _('Canopy Tint Color'),           		category = _('F-22A Misc')},	

--F-22 Weapons
    {down = Detent_F, up = Detent_F,    name = _('Weapons: Trigger First Detent'),       category = _('F-22A HOTAS')},
    {down = Detent_S, up = Detent_S,    name = _('Weapons: Trigger Second Detent'),      category = _('F-22A HOTAS')},
    {down = PICKLE, up = PICKLE,        name = _('Weapons: Release'),                    category = _('F-22A HOTAS')},
--ICP BINDS
    {down = ICP_COM1,                   name = _('ICP COMM 1'),                          category = _('F-22A ICP')},
    {down = ICP_COM2,                   name = _('ICP COMM 2'),                          category = _('F-22A ICP')},
    {down = ICP_NAV,                    name = _('ICP NAV'),                             category = _('F-22A ICP')},
    {down = ICP_STPT,                   name = _('ICP STPT'),                            category = _('F-22A ICP')},
    {down = ICP_ALT,                    name = _('ICP ALT'),                             category = _('F-22A ICP')},
    {down = ICP_HUD,                    name = _('ICP HUD'),                             category = _('F-22A ICP')},
    {down = ICP_AP,                     name = _('ICP AP'),                              category = _('F-22A ICP')},
    {down = ICP_OTHR,                   name = _('ICP OTHR'),                            category = _('F-22A ICP')},
    {down = ICP_OP1,                    name = _('ICP Option 1'),                        category = _('F-22A ICP')},
    {down = ICP_OP2,                    name = _('ICP Option 2'),                        category = _('F-22A ICP')},
    {down = ICP_OP3,                    name = _('ICP Option 3'),                        category = _('F-22A ICP')},
    {down = ICP_OP4,                    name = _('ICP Option 4'),                        category = _('F-22A ICP')},
    {down = ICP_OP5,                    name = _('ICP Option 5'),                        category = _('F-22A ICP')},
-- FCS BINDS
    {down = FCSNoseUp, up = FCSRel,     name = _('FCS Trim: Nose Up'),                   category = _('F-22A HOTAS')},
    {down = FCSNoseDn, up = FCSRel,     name = _('FCS Trim: Nose Down'),                 category = _('F-22A HOTAS')},
    {down = FCSCenter,                  name = _('FCS Trim: Center'),                    category = _('F-22A HOTAS')},
    {down = FCSMode,                    name = _('FCS Mode: AUTO/OFF'),                  category = _('F-22A HOTAS')},
    --{down = FCSAOA,                     name = _('FCS Mode: AOA Override'),              category = _('F-22A HOTAS')},
    --{down = FCSG,                       name = _('FCS Mode: G Override'),                category = _('F-22A HOTAS')},
    {down = FCSStep,                    name = _('FCS Mode: AUTO/AOA/G/OFF'),            category = _('F-22A HOTAS')},

    -- {down = L_cutoff, up = L_cutoff,   name = _('Throttle (Left) - OFF/IDLE'),          category = _('F-22A HOTAS')},
    -- {down = R_cutoff, up = R_cutoff,   name = _('Throttle (Right) - OFF/IDLE'),         category = _('F-22A HOTAS')},

--F-22 CUSTOM BINDS
    {down = SelectLeft,                 name = _('Weapon Bay Select Left'),             category = _('F-22A HOTAS')},
    {down = SelectRight,                name = _('Weapon Bay Select Right'),            category = _('F-22A HOTAS')},
    {down = SelectCenter,               name = _('Weapon Bay Select Center'),           category = _('F-22A HOTAS')},
    {down = SelectAll,                  name = _('Weapon Bay Select All'),              category = _('F-22A HOTAS')},
    {down = SelectStep,                 name = _('Weapon Bay Select Toggle'),           category = _('F-22A HOTAS')},
    {down = AirORIDE, up = AirORIDE,    name = _('Weapon Bay Override (AIR)'),          category = _('F-22A HOTAS')},
    {down = AirORIDE_T,                 name = _('Weapon Bay Override Toggle (AIR)'),   category = _('F-22A HOTAS')},
    {down = Dogfight,                   name = _('Dogfight MFD Override'),              category = _('F-22A HOTAS')},
    {down = BVRMode,		            name = _('BVR Missile MFD Override'), 			category = _('F-22A HOTAS')},		
    {down = NavMode,	                name = _('NavMode MFD Override'),               category = _('F-22A HOTAS')},	
    {down = DefaultMode,	            name = _('Default MFD/Cancel Override'), 		category = _('F-22A HOTAS')},
    {down = CRSMode,	            	name = _('Cruise MFD Override'), 				category = _('F-22A HOTAS')},		
    {down = APU, up = APU,              name = _('APU Start'),                          category = _('F-22A HOTAS')},
--Special Switch Functionality
    {down = Battery, up = Battery,      name = _('Battery On/Off'),                     category = _('F-22A Systems')},
    {down = Battery_T,                  name = _('Battery Toggle'),                     category = _('F-22A Systems')},
    {down = MasterArm, up = MasterArm,  name = _('Master Arm On/Off'),                  category = _('F-22A Systems')},
    {down = MasterArm_T,                name = _('Master Arm Toggle'),                  category = _('F-22A Systems')},
    {down = DayNight, up = DayNight,    name = _('Day/Night Mode'),                     category = _('F-22A Systems')},
    {down = DayNight_T,                 name = _('Day/Night Mode Toggle'),              category = _('F-22A Systems')},
    {down = L_GEN, up = L_GEN,          name = _('Left Generator On/Off'),              category = _('F-22A Systems')},
    {down = L_GEN_T,                    name = _('Left Generator Toggle'),              category = _('F-22A Systems')},
    {down = R_GEN, up = R_GEN,          name = _('Right Generator On/Off'),             category = _('F-22A Systems')},
    {down = R_GEN_T,                    name = _('Right Generator Toggle'),             category = _('F-22A Systems')},
    {down = AAR,   up = AAR,            name = _('Air-Air Refuel Open/Close'),          category = _('F-22A Systems')},
    {down = AAR_T,                      name = _('Air-Air Refuel Toggle'),              category = _('F-22A Systems')},
    {down = Park, up = Park,            name = _('Parking Brake On/Off'),               category = _('F-22A Systems')},
    {down = Park_T,                     name = _('Parking Brake Toggle'),               category = _('F-22A Systems')},
    {down = LIGHT_TAXI, up = LIGHT_TAXI,        name = _('Taxi Light On/Off'),          category = _('F-22A Systems')},   
    {down = LIGHT_TAXI_T,               name = _('Taxi Light Toggle'),                  category = _('F-22A Systems')},
    {down = LIGHT_LANDING, up = LIGHT_LANDING,  name = _('Landing Light On/Off'),       category = _('F-22A Systems')},   
    {down = LIGHT_LANDING_T,            name = _('Landing Light Toggle'),               category = _('F-22A Systems')}, 

    {down = BrakesON, up = BrakesOFF,   name = _('Wheel Brakes Both'), 	                category = _('F-22A Systems')},
    --{down = L_BRAKE,  up = BrakesOFF,   name = _('Wheel Brakes Left'),                  category = _('F-22A Systems')},
    --{down = R_BRAKE,  up = BrakesOFF,   name = _('Wheel Brakes Right'),                 category = _('F-22A Systems')},

-------------------------------------------------------------------------------------------------------------------------------------------------------
--NIGHTSTORM
--[[
AVIONICS = 1

ELECTRICAL_SYSTEM = 2

ENGINE_SYSTEM = 3

WEAPON_SYSTEM = 4

MFD_SYSTEM = 5

PMFD_SYSTEM = 6

ICP_SYSTEM = 7

FCS = 8
--]]
	--HUD Brightness
	{down = 3029, cockpit_device_id = 7, value_down = 1.0, name = _('Special - HUD Brightness INC'),            category = _('F-22A Systems')},
	{down = 3030, cockpit_device_id = 7, value_down = 1.0, name = _('Special - HUD Brightness DEC'),            category = _('F-22A Systems')},	
	
	--Power Systems
	
	{down = 3002, up = 3002, cockpit_device_id = 3, value_down = 1.0, value_up = 0.0, name = _('Special - APU START/RUN'),               category = _('F-22A Systems')},
	{down = 3002, up = 3002, cockpit_device_id = 3, value_down = -1.0, value_up = 0.0, name = _('Special - APU OFF/RUN'),                category = _('F-22A Systems')},
	{down = 3002, up = 3002, cockpit_device_id = 3, value_down = -1.0, value_up = -1.0, name = _('Special - APU OFF'),                category = _('F-22A Systems')},	
	
	--Throttle
	{down = 3009, up = 3009, cockpit_device_id = 3, value_down = 1.0, value_up = 0.0, name = _('Special - Left Engine OFF'),  category = _('F-22A HOTAS')},
	{down = 3010, up = 3010, cockpit_device_id = 3, value_down = 1.0, value_up = 0.0, name = _('Special - Right Engine OFF'), category = _('F-22A HOTAS')},
	
	--Internal Lighting
	{down = 3003, cockpit_device_id = 1, value_down = 1.0, name = _('Special - MFD Lights ON'),               category = _('F-22A Systems')},
	{down = 3003, cockpit_device_id = 1, value_down = -1.0, name = _('Special - MFD Lights OFF'),             category = _('F-22A Systems')},
	{down = 3004, cockpit_device_id = 1, value_down = 1.0, name = _('Special - INST Lights ON'),              category = _('F-22A Systems')},
	{down = 3004, cockpit_device_id = 1, value_down = -1.0, name = _('Special - INST Lights OFF'),            category = _('F-22A Systems')},
	{down = 3005, cockpit_device_id = 1, value_down = 1.0, name = _('Special - CONSOLE Lights ON'),           category = _('F-22A Systems')},
	{down = 3005, cockpit_device_id = 1, value_down = -1.0, name = _('Special - CONSOLE Lights OFF'),         category = _('F-22A Systems')},
	{down = 3006, cockpit_device_id = 1, value_down = 1.0, name = _('Special - FLOOD Lights ON'),             category = _('F-22A Systems')},
	{down = 3006, cockpit_device_id = 1, value_down = -1.0, name = _('Special - FLOOD Lights OFF'),           category = _('F-22A Systems')},
	
	--External Lighting
	{down = 3007, cockpit_device_id = 1, value_down = 1.0, name = _('Special - FORM Lights ON'),              category = _('F-22A Systems')},
	{down = 3007, cockpit_device_id = 1, value_down = -1.0, name = _('Special - FORM Lights OFF'),            category = _('F-22A Systems')},
	{down = 3004, up = 3004, cockpit_device_id = 2, value_down = 1.0, value_up = 0.0, name = _('Special - Landing Light ON/OFF'),            category = _('F-22A Systems')},
	{down = 3004, up = 3004, cockpit_device_id = 2, value_down = -1.0, value_up = 0.0, name = _('Special - TAXI light ON/OFF'),              category = _('F-22A Systems')},
    {down = 3003, cockpit_device_id = 2, value_down = 0.0, name = _('Special - NAV Lights OFF'),              category = _('F-22A Systems')},
    {down = 3003, cockpit_device_id = 2, value_down = 0.1, name = _('Special - NAV Lights ANTICOL'),          category = _('F-22A Systems')},
    {down = 3003, cockpit_device_id = 2, value_down = 0.2, name = _('Special - NAV Lights POS/ANTICOL'),      category = _('F-22A Systems')},
    {down = 3003, cockpit_device_id = 2, value_down = 0.3, name = _('Special - NAV Lights POS FLASH'),        category = _('F-22A Systems')},
	{down = 3003, cockpit_device_id = 2, value_down = 0.4, name = _('Special - NAV Lights POS STEADY'),       category = _('F-22A Systems')},
	{down = 3002, cockpit_device_id = 2, value_down = 1.0, name = _('Special - AAR Lights ON'),               category = _('F-22A Systems')},
	{down = 3002, cockpit_device_id = 2, value_down = -1.0, name = _('Special - AAR Lights OFF'),             category = _('F-22A Systems')},

	--Systems
	{down = 3002, up = 3002, cockpit_device_id = 4, value_down = 1.0, value_up = 0.0, name = _('Special - Emergency Jettison'),          category = _('F-22A Systems')}, 
	
	
--NIGHTSTORM	
-------------------------------------------------------------------------------------------------------------------------------------------------------
    -- Autopilot
    {combos = {{key = 'A'}, {key = '1', reformers = {'LAlt'}}}, down = iCommandPlaneAutopilot, name = _('Autopilot - Attitude Hold'), category = _('Autopilot')},
    {combos = {{key = 'H'}, {key = '2', reformers = {'LAlt'}}}, down = iCommandPlaneStabHbar, name = _('Autopilot - Altitude Hold'), category = _('Autopilot')},
    {combos = {{key = '9', reformers = {'LAlt'}}}, down = iCommandPlaneStabCancel, name = _('Autopilot Disengage'), category = _('Autopilot')},    
    --Flight Control
    {combos = {{key = 'T', reformers = {'LAlt'}}}, down = iCommandPlaneTrimOn, up = iCommandPlaneTrimOff, name = _('T/O Trim'), category = _('Flight Control')},
	{combos = {{key = 'S'}}, down = iCommandPlaneCobra, name = ('FCS Direct AOA Control'), category = ('Flight Control')},	--NIGHTSTORM FCS HIGH AOA
        -- Systems
    {combos = {{key = 'R', reformers = {'LCtrl'}}}, down = iCommandPlaneAirRefuel, name = _('Refueling Boom'), category = _('Systems')},
    {combos = {{key = 'R', reformers = {'LAlt'}}}, down = iCommandPlaneJettisonFuelTanks, name = _('Jettison Fuel Tanks'), category = _('Systems')},
--    {combos = {{key = 'S'}}, down = iCommandPlane_HOTAS_NoseWheelSteeringButton, up = iCommandPlane_HOTAS_NoseWheelSteeringButton, name = _('Nose Gear Maneuvering Range'), category = _('Systems')},
    {combos = {{key = 'Q', reformers = {'LAlt'}}}, down = iCommandPlane_HOTAS_NoseWheelSteeringButtonOff, up = iCommandPlane_HOTAS_NoseWheelSteeringButtonOff, name = _('Nose Wheel Steering'), category = _('Systems')},
    {combos = {{key = 'A', reformers = {'LCtrl'}}}, down = iCommandPlaneWheelBrakeLeftOn, up = iCommandPlaneWheelBrakeLeftOff, name = _('Wheel Brake Left On/Off'), category = _('Systems')},
    {combos = {{key = 'A', reformers = {'LAlt'}}}, down = iCommandPlaneWheelBrakeRightOn, up = iCommandPlaneWheelBrakeRightOff, name = _('Wheel Brake Right On/Off'), category = _('Systems')},
    {combos = {{key = 'T', reformers = {'LShift'}}}, down = iCommandClockElapsedTimeReset, name = _('Elapsed Time Clock Start/Stop/Reset'), category = _('Systems')},
        -- Modes
    {combos = {{key = '2'}}, down = iCommandPlaneModeBVR, name = _('(2) Beyond Visual Range Mode'), category = _('Modes')},
    {combos = {{key = '3'}}, down = iCommandPlaneModeVS, name = _('(3) Close Air Combat Vertical Scan Mode'), category = _('Modes')},
    {combos = {{key = '4'}}, down = iCommandPlaneModeBore, name = _('(4) Close Air Combat Bore Mode'), category = _('Modes')},
    {combos = {{key = '5'}}, down = iCommandPlaneModeHelmet, name = _('(5) Close Air Combat HMD Helmet Mode'), category = _('Modes')},
    {combos = {{key = '6'}}, down = iCommandPlaneModeFI0, name = _('(6) Longitudinal Missile Aiming Mode/FLOOD mode'), category = _('Modes')},
    {combos = {{key = '7'}}, down = iCommandPlaneModeGround, name = _('(7) Air-To-Ground Mode'), category = _('Modes')},
    {combos = {{key = '8'}}, down = iCommandPlaneModeGrid, name = _('(8) Gunsight Reticle Switch'), category = _('Modes')},
        -- Sensors
    {combos = {{key = 'Enter'}}, down = iCommandPlaneChangeLock, up = iCommandPlaneChangeLockUp, name = _('Target Lock'), category = _('Sensors')},
    {combos = {{key = 'Back'}}, down = iCommandSensorReset, name = _('Radar - Return To Search/NDTWS'), category = _('Sensors')},
    {down = iCommandRefusalTWS, name = _('Unlock TWS Target'), category = _('Sensors')},
    {combos = {{key = 'I'}}, down = iCommandPlaneRadarOnOff, name = _('Radar On/Off'), category = _('Sensors')},
    {combos = {{key = 'I', reformers = {'RAlt'}}}, down = iCommandPlaneRadarChangeMode, name = _('Radar RWS/TWS Mode Select'), category = _('Sensors')},
    {combos = {{key = 'I', reformers = {'RCtrl'}}}, down = iCommandPlaneRadarCenter, name = _('Target Designator To Center'), category = _('Sensors')},
    {combos = {{key = 'I', reformers = {'RShift'}}}, down = iCommandPlaneChangeRadarPRF, name = _('Radar Pulse Repeat Frequency Select'), category = _('Sensors')},
    {combos = {{key = 'O'}}, down = iCommandPlaneEOSOnOff, name = _('Electro-Optical System On/Off'), category = _('Sensors')},
    {combos = {{key = 'O', reformers = {'RShift'}}}, down = iCommandPlaneLaserRangerOnOff, name = _('Laser Ranger On/Off'), category = _('Sensors')},
    {combos = {{key = 'O', reformers = {'RCtrl'}}}, down = iCommandPlaneNightTVOnOff, name = _('Night Vision (FLIR or LLTV) On/Off'), category = _('Sensors')},
    {combos = {{key = ';'}}, pressed = iCommandPlaneRadarUp, up = iCommandPlaneRadarStop, name = _('Target Designator Up'), category = _('Sensors')},
    {combos = {{key = '.'}}, pressed = iCommandPlaneRadarDown, up = iCommandPlaneRadarStop, name = _('Target Designator Down'), category = _('Sensors')},
    {combos = {{key = ','}}, pressed = iCommandPlaneRadarLeft, up = iCommandPlaneRadarStop, name = _('Target Designator Left'), category = _('Sensors')},
    {combos = {{key = '/'}}, pressed = iCommandPlaneRadarRight, up = iCommandPlaneRadarStop, name = _('Target Designator Right'), category = _('Sensors')},
    {combos = {{key = ';', reformers = {'RShift'}}}, pressed = iCommandSelecterUp, up = iCommandSelecterStop, name = _('Scan Zone Up'), category = _('Sensors')},
    {combos = {{key = '.', reformers = {'RShift'}}}, pressed = iCommandSelecterDown, up = iCommandSelecterStop, name = _('Scan Zone Down'), category = _('Sensors')},
    {combos = {{key = ',', reformers = {'RShift'}}}, pressed = iCommandSelecterLeft, up = iCommandSelecterStop, name = _('Scan Zone Left'), category = _('Sensors')},
    {combos = {{key = '/', reformers = {'RShift'}}}, pressed = iCommandSelecterRight, up = iCommandSelecterStop, name = _('Scan Zone Right'), category = _('Sensors')},
    {combos = {{key = '='}}, down = iCommandPlaneZoomIn, name = _('Display Zoom In'), category = _('Sensors')},
    {combos = {{key = '-'}}, down = iCommandPlaneZoomOut, name = _('Display Zoom Out'), category = _('Sensors')},
    {combos = {{key = '-', reformers = {'RCtrl'}}}, down = iCommandDecreaseRadarScanArea, name = _('Radar Scan Zone Decrease'), category = _('Sensors')},
    {combos = {{key = '=', reformers = {'RCtrl'}}}, down = iCommandIncreaseRadarScanArea, name = _('Radar Scan Zone Increase'), category = _('Sensors')},
    {combos = {{key = '=', reformers = {'RAlt'}}}, pressed = iCommandPlaneIncreaseBase_Distance, up = iCommandPlaneStopBase_Distance, name = _('Target Specified Size Increase'), category = _('Sensors')},
    {combos = {{key = '-', reformers = {'RAlt'}}}, pressed = iCommandPlaneDecreaseBase_Distance, up = iCommandPlaneStopBase_Distance, name = _('Target Specified Size Decrease'), category = _('Sensors')},
    {combos = {{key = 'R', reformers = {'RShift'}}}, down = iCommandChangeRWRMode, name = _('RWR/SPO Mode Select'), category = _('Sensors')},
    {combos = {{key = ',', reformers = {'RAlt'}}}, down = iCommandPlaneThreatWarnSoundVolumeDown, name = _('RWR/SPO Sound Signals Volume Down'), category = _('Sensors')},
    {combos = {{key = '.', reformers = {'RAlt'}}}, down = iCommandPlaneThreatWarnSoundVolumeUp, name = _('RWR/SPO Sound Signals Volume Up'), category = _('Sensors')},
        -- Weapons                                                                        
    {combos = {{key = 'V', reformers = {'LCtrl'}}}, down = iCommandPlaneSalvoOnOff, name = _('Salvo Mode'), category = _('Weapons')},
    {combos = {{key = 'Space', reformers = {'RAlt'}}}, down = iCommandPlanePickleOn,	up = iCommandPlanePickleOff, name = _('Weapon Release'), category = _('Weapons')},
    {combos = {{key = 'C', reformers = {'LShift'}}}, down = iCommandChangeGunRateOfFire, name = _('Cannon Rate Of Fire / Cut Of Burst select'), category = _('Weapons')},
    })
    return res