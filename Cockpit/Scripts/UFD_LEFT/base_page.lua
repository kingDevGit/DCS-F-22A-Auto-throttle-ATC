--NIGHTSTORM

dofile(LockOn_Options.script_path.."UFD_LEFT/definitions.lua")
dofile(LockOn_Options.script_path.."fonts.lua")
dofile(LockOn_Options.script_path.."materials.lua")

local function vertices(object, height, half_or_double)
    local width = height
    
    if half_or_double == true then --
        width = 11
    end

    if half_or_double == false then
        width = height * 2
    end

    local half_width = width / 2
    local half_height = height / 2
    local x_positive = half_width
    local x_negative = half_width * -1.0
    local y_positive = half_height
    local y_negative = half_height * -1.0

    object.vertices =
    {
        {x_negative, y_positive},
        {x_positive, y_positive},
        {x_positive, y_negative},
        {x_negative, y_negative}
    }

    object.indices = {0, 1, 2, 2, 3, 0}

    object.tex_coords =
    {
        {0, 0},
        {1, 0},
        {1, 1},
        {0, 1}
    }
end

local IndicationTexturesPath = LockOn_Options.script_path.."../IndicationTextures/"--I dont think this is correct might have to add scripts.
local MainColor 			= {255, 255, 255, 255}--RGBA
local GreenColor 		    = {0, 255, 0, 255}--RGBA
local WhiteColor 			= {255, 255, 255, 255}--RGBA
local RedColor 				= {255, 0, 0, 255}--RGBA
local BlackColor 			= {0, 0, 0, 255}--RGBA
local ScreenColor			= {3, 3, 12, 255}--RGBA 5-5-5
local ADIbottom				= {8, 8, 8, 255}--RGBA
local TealColor				= {0, 255, 255, 255}--RGBA
local TrimColor				= {255, 255, 255, 255}--RGBA
local BOXColor				= {10, 10, 10, 255}--RGBA
local YellowColor 			= {255, 255, 0, 255}--RGBA	--NIGHTSTORM

local REFLECT	 = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/reflection.dds", ScreenColor)	--NIGHTSTORM
local MASK_BOX	 = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/mask_box.dds", 	ScreenColor)--SYSTEM TEST
local MASK_BOX1	 = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/mask_box.dds", 	ADIbottom)--SYSTEM TEST
local MASK_BOXW	 = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/mask_box.dds", 	WhiteColor)--SYSTEM TEST
--local PFD_PAGE_1 = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/pfd_page_1.dds", GreenColor)	--NIGHTSTORM
local FCS_PAGE	 = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/fcs_page.dds", 	GreenColor)
local ADI_TOP	 = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/adi_half.dds", 	TealColor)
local ADI_BOT	 = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/adi_half.dds", 	ADIbottom)
local ADI_LINE	 = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/adi_line.dds", 	WhiteColor)
local ADI_CENTER = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/adi_center.dds", WhiteColor)
local LADDER_TOP = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/ladder_top.dds", BlackColor)
local LADDER_BOT = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/ladder_bot.dds", WhiteColor)
local ADI_TRIM 	 = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/adi_trim.dds",   WhiteColor)
local ADI_FUEL 	 = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/adi_fuel.dds",   GreenColor)
local FUEL_LINE	 = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/mask_box.dds", 	TealColor)
local FUEL_LINE_M = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/mask_box.dds", 	BlackColor)

local BLACK_MASK = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/mask_box.dds", 	BlackColor)
local ADI_TRIM_MASK = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/adi_trim.dds",   BlackColor)
local ADI_CENTER_MASK = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/adi_center.dds", BlackColor)
local LADDER_BOT_MASK = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/ladder_bot.dds", BlackColor)
local FUEL_LINE_MASK	 = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/mask_box.dds", 	BlackColor)--SYSTEM TEST
local FUEL_LINE_MASK2	 = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/mask_box.dds", 	RedColor)--SYSTEM TEST

local ClippingPlaneSize = 50 --Clipping Masks   --50
local ClippingWidth 	= 75--Clipping Masks	--85
local PFD_MASK_BASE1 	= MakeMaterial(nil,{255,0,0,255})--Clipping Masks
local PFD_MASK_BASE2 	= MakeMaterial(nil,{0,0,255,255})--Clipping Masks
local ADI_MASK 	 		= MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/adi_mask.dds", WhiteColor)
local ADI_MASK2 	 	= MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/adi_mask.dds", WhiteColor)
--Clipping Masks
local total_field_of_view           = CreateElement "ceMeshPoly"
total_field_of_view.name            = "total_field_of_view"
total_field_of_view.primitivetype   = "triangles"
total_field_of_view.vertices        = {
										{-1 * ClippingWidth,-1 * ClippingPlaneSize},
										{1 * ClippingWidth,-1 * ClippingPlaneSize},
										{1 * ClippingWidth,1 * ClippingPlaneSize},
										{-1 * ClippingWidth,1 * ClippingPlaneSize},										
									}
total_field_of_view.material        = PFD_MASK_BASE1
total_field_of_view.indices         = {0,1,2,2,3,0}
total_field_of_view.init_pos        = {0, 0, 0}
total_field_of_view.init_rot        = { 0, 0, 0} -- degree NOT rad
total_field_of_view.h_clip_relation = h_clip_relations.REWRITE_LEVEL
total_field_of_view.level           = 1
total_field_of_view.collimated      = false
total_field_of_view.isvisible       = false
Add(total_field_of_view)

local clipPoly               = CreateElement "ceMeshPoly"
clipPoly.name                = "clipPoly-1"
clipPoly.primitivetype       = "triangles"
clipPoly.init_pos            = {0, 0, 0}
clipPoly.init_rot            = { 0, 0 , 0} -- degree NOT rad
clipPoly.vertices            = {
								{-1 * ClippingWidth,-1 * ClippingPlaneSize},
								{1 * ClippingWidth,-1 * ClippingPlaneSize},
								{1 * ClippingWidth,1 * ClippingPlaneSize},
								{-1 * ClippingWidth,1 * ClippingPlaneSize},										
									}
clipPoly.indices             = {0,1,2,2,3,0}
clipPoly.material            = PFD_MASK_BASE2
clipPoly.h_clip_relation     = h_clip_relations.INCREASE_IF_LEVEL
clipPoly.level               = 1
clipPoly.collimated          = false
clipPoly.isvisible           = false
Add(clipPoly)
-------------------------------------------------------------------------------------------------------------------------------------
--TEST
BGROUND                    = CreateElement "ceTexPoly"
BGROUND.name    			= "BG"
--BGROUND.material			= MASK_BOX
BGROUND.material			= REFLECT
BGROUND.change_opacity 		= false
BGROUND.collimated 			= false
BGROUND.isvisible 			= true
BGROUND.init_pos 			= {0, 0, 0} --maybe its x,y,z z being depth...
BGROUND.init_rot 			= {0, 0, 0}
--BGROUND.indices 			= {0, 1, 2, 2, 3, 0}
BGROUND.element_params 		= {"UFD_OPACITY"} --HOPE THIS WORKS G_OP_BACK
BGROUND.controllers			= {{"opacity_using_parameter",0}}
BGROUND.level 				= 2
BGROUND.h_clip_relation     = h_clip_relations.COMPARE
vertices(BGROUND,200)

Add(BGROUND)
----------------------------------------------------------------
ADFUEL                    = CreateElement "ceTexPoly"
ADFUEL.name    			= "fuel_grid"
ADFUEL.material			= ADI_FUEL
ADFUEL.change_opacity 		= false
ADFUEL.collimated 			= false
ADFUEL.isvisible 			= true
ADFUEL.init_pos 			= {0, 0, 0} --maybe its x,y,z z being depth...
ADFUEL.init_rot 			= {0, 0, 0}
ADFUEL.element_params 		= {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
ADFUEL.controllers			= {{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
ADFUEL.level 				= 2
ADFUEL.h_clip_relation      = h_clip_relations.COMPARE
vertices(ADFUEL,200)

Add(ADFUEL)

--[[ --NIGHTSTORM removed original text line
--BARO TEXT
BARO 					= CreateElement "ceStringPoly"
BARO.name 				= "apu spool"
BARO.material 			= UFD_GRN
BARO.value 			= "BARO 29.92  J:3.5  B:2.5"	--NIGHTSTORM
BARO.stringdefs 		= {0.0050, 0.0050, 0.0004, 0.001}
BARO.alignment 			= "LeftCenter"
BARO.formats 			= {"%s"}
BARO.h_clip_relation    = h_clip_relations.COMPARE
BARO.level 				= 2
BARO.init_pos 			= {-60, -43.5, 0} --= {-40, -43, 0}
BARO.init_rot 			= {0, 0, 0}
BARO.element_params 	= {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
BARO.controllers		= {{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(BARO)
]]--
----------------------------------------------------------------------------------------
--NIGHTSTORM
----------------------------------------------------------------------------------------
-------------------------------------------------------------INS STATIC-------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------- ILS
ILS_TEXT 					    = CreateElement "ceStringPoly"
ILS_TEXT.name 				    = "menu"
ILS_TEXT.material 			    = UFD_YEL
ILS_TEXT.value 				    = "ILSN"
ILS_TEXT.stringdefs 		    = {0.0050, 0.0050, 0.0004, 0.001}
ILS_TEXT.alignment 			    = "LeftCenter"
ILS_TEXT.formats 			    = {"%s"}
ILS_TEXT.h_clip_relation        = h_clip_relations.COMPARE
ILS_TEXT.level 				    = 2
ILS_TEXT.init_pos 			    = {-60.0, -43.5, 0}
ILS_TEXT.init_rot 			    = {0, 0, 0}
ILS_TEXT.element_params 	    = {"UFD_OPACITY","L_ADI_OPACITY","ILSN_VIS"}
ILS_TEXT.controllers		    =   {
                                        {"opacity_using_parameter",1},
                                        {"parameter_in_range",0,0.9,1.1},
                                        {"parameter_in_range",2,0.9,1.1},
						            }
Add(ILS_TEXT)
--------------------------------------------------------------------------------------------------- NAV
NAV_TEXT 					    = CreateElement "ceStringPoly"
NAV_TEXT.name 				    = "menu"
NAV_TEXT.material 			    = UFD_GRN
NAV_TEXT.value 				    = "NAV"
NAV_TEXT.stringdefs 		    = {0.0050, 0.0050, 0.0004, 0.001}
NAV_TEXT.alignment 			    = "LeftCenter"
NAV_TEXT.formats 			    = {"%s"}
NAV_TEXT.h_clip_relation        = h_clip_relations.COMPARE
NAV_TEXT.level 				    = 2
NAV_TEXT.init_pos 			    = {-60.0, -43.5, 0}
NAV_TEXT.init_rot 			    = {0, 0, 0}
NAV_TEXT.element_params 	    = {"UFD_OPACITY","L_ADI_OPACITY","NAV_VIS"}
NAV_TEXT.controllers		    =   {
                                        {"opacity_using_parameter",1},
                                        {"parameter_in_range",0,0.9,1.1},
                                        {"parameter_in_range",2,0.9,1.1},
						            }
Add(NAV_TEXT)
----------------------------------------------------------------------------------------
--[[
INS_TEXT 					    	= CreateElement "ceStringPoly"
INS_TEXT.name 				    	= "INS_TEXT"
INS_TEXT.material 			    	= UFD_GRN
INS_TEXT.value 						= "NAV"
INS_TEXT.stringdefs 		    	= {0.0050, 0.0050, 0.0004, 0.001}
INS_TEXT.alignment 					= "LeftCenter"
INS_TEXT.formats 			    	= {"%s"}
INS_TEXT.h_clip_relation       		= h_clip_relations.COMPARE
INS_TEXT.level 						= 2
INS_TEXT.init_pos 			    	= {-60.5, -43.5, 0}
INS_TEXT.init_rot 			    	= {0, 0, 0}
INS_TEXT.element_params 	    	= {"L_ADI_OPACITY","UFD_OPACITY",}
INS_TEXT.controllers		    	= {{"parameter_in_range",0,0.9,1.1},{"opacity_using_parameter",1},}
Add(INS_TEXT)
--]]
----------------------------------------------------------------------------------------
UFD1 					= CreateElement "ceStringPoly"
UFD1.name 				= "ufd buttons"
UFD1.material 			= UFD_GRN
UFD1.value 				= "ADI"
UFD1.stringdefs 		= {0.0050, 0.0050, 0.0004, 0.001}
UFD1.alignment 			= "CenterCenter"
UFD1.formats 			= {"%s"}
UFD1.h_clip_relation    = h_clip_relations.COMPARE
UFD1.level 				= 2
UFD1.init_pos 			= {-24.5, -43.5, 0}
UFD1.init_rot 			= {0, 0, 0}
UFD1.element_params 	= {"L_ADI_OPACITY","UFD_OPACITY",}
UFD1.controllers		= {{"parameter_in_range",0,0.9,1.1},{"opacity_using_parameter",1},}
Add(UFD1)
----------------------------------------------------------------------------------------
UFD2 					= CreateElement "ceStringPoly"
UFD2.name 				= "ufd buttons"
UFD2.material 			= UFD_GRN
UFD2.value 				= "INS"
UFD2.stringdefs 		= {0.0050, 0.0050, 0.0004, 0.001}
UFD2.alignment 			= "CenterCenter"
UFD2.formats 			= {"%s"}
UFD2.h_clip_relation    = h_clip_relations.COMPARE
UFD2.level 				= 2
UFD2.init_pos 			= {0, -43.5, 0}
UFD2.init_rot 			= {0, 0, 0}
UFD2.element_params 	= {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
UFD2.controllers		= {{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(UFD2)
----------------------------------------------------------------------------------------
UFD3 					= CreateElement "ceStringPoly"
UFD3.name 				= "ufd buttons"
UFD3.material 			= UFD_GRN
UFD3.value 				= "TCN"
UFD3.stringdefs 		= {0.0050, 0.0050, 0.0004, 0.001}
UFD3.alignment 			= "CenterCenter"
UFD3.formats 			= {"%s"}
UFD3.h_clip_relation    = h_clip_relations.COMPARE
UFD3.level 				= 2
UFD3.init_pos 			= {24.5, -43.5, 0}
UFD3.init_rot 			= {0, 0, 0}
UFD3.element_params 	= {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
UFD3.controllers		= {{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(UFD3)
----------------------------------------------------------------------------------------
FUEL 					= CreateElement "ceStringPoly"
FUEL.name 				= "ufd buttons"
FUEL.material 			= UFD_GRN
FUEL.value 				= "FUEL %"
FUEL.stringdefs 		= {0.0050, 0.0050, 0.0004, 0.001}
FUEL.alignment 			= "CenterCenter"
FUEL.formats 			= {"%s"}
FUEL.h_clip_relation    = h_clip_relations.COMPARE
FUEL.level 				= 2
FUEL.init_pos 			= {48.5, -43.5, 0}
FUEL.init_rot 			= {0, 0, 0}
FUEL.element_params 	= {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
FUEL.controllers		= {{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(FUEL)
----------------------------------------------------------------------------------------
--NIGHTSTORM
----------------------------------------------------------------------------------------
T 						= CreateElement "ceStringPoly"
T.name 					= "total"
T.material 				= UFD_GRN
T.value 				= "T:"
T.stringdefs 			= {0.0050, 0.0050, 0.0004, 0.001}
T.alignment 			= "CenterCenter"
T.formats 				= {"%s"}
T.h_clip_relation    	= h_clip_relations.COMPARE
T.level 				= 2
T.init_pos 				= {36, 38, 0}
T.init_rot 				= {0, 0, 0}
T.element_params 		= {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
T.controllers			= {{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(T)
----------------------------------------------------------------------------------------
E 						= CreateElement "ceStringPoly"
E.name 					= "tanks"
E.material 				= UFD_FONT
E.value 				= "E:"
E.stringdefs 			= {0.0050, 0.0050, 0.0004, 0.001}
E.alignment 			= "CenterCenter"
E.formats 				= {"%s"}
E.h_clip_relation    	= h_clip_relations.COMPARE
E.level 				= 2
E.init_pos 				= {36, 30	, 0}
E.init_rot 				= {0, 0, 0}
E.element_params 		= {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
E.controllers			= {{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(E)
----------------------------------------------------------------------------------------
--NIGHTSTORM
----------------------------------------------------------------------------------------
F1 					= CreateElement "ceStringPoly"
F1.name 				= "fuel numb"
F1.material 			= UFD_GRN
--F1.value 				= "20"		--NIGHTSTORM
F1.value 				= "100"		--NIGHTSTORM
F1.stringdefs 		= {0.0050, 0.0050, 0.0004, 0.001}
F1.alignment 			= "CenterCenter"
F1.formats 			= {"%s"}
F1.h_clip_relation    = h_clip_relations.COMPARE
F1.level 				= 2
F1.init_pos 			= {58, 20	, 0}
F1.init_rot 			= {0, 0, 0}
F1.element_params 	= {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
F1.controllers		= {{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(F1)
----------------------------------------------------------------------------------------
F2 					= CreateElement "ceStringPoly"
F2.name 				= "fuel numb"
F2.material 			= UFD_GRN
--F2.value 				= "10"		--NIGHTSTORM
F2.value 				= "80"		--NIGHTSTORM
F2.stringdefs 		= {0.0050, 0.0050, 0.0004, 0.001}
F2.alignment 			= "CenterCenter"
F2.formats 			= {"%s"}
F2.h_clip_relation    = h_clip_relations.COMPARE
F2.level 				= 2
--F2.init_pos 			= {58, 5, 0}		--NIGHTSTORM
F2.init_pos 			= {58, 9, 0}		--NIGHTSTORM
F2.init_rot 			= {0, 0, 0}
F2.element_params 	= {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
F2.controllers		= {{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(F2)
----------------------------------------------------------------------------------------
F3 					= CreateElement "ceStringPoly"
F3.name 				= "fuel numb"
F3.material 			= UFD_GRN
--F3.value 				= "8"		--NIGHTSTORM
F3.value 				= "60"		--NIGHTSTORM
F3.stringdefs 		= {0.0050, 0.0050, 0.0004, 0.001}
F3.alignment 			= "CenterCenter"
F3.formats 			= {"%s"}
F3.h_clip_relation    = h_clip_relations.COMPARE
F3.level 				= 2
--F3.init_pos 			= {58, -5, 0}		--NIGHTSTORM
F3.init_pos 			= {58, -2, 0}		--NIGHTSTORM
F3.init_rot 			= {0, 0, 0}
F3.element_params 	= {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
F3.controllers		= {{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(F3)
----------------------------------------------------------------------------------------
F4 					= CreateElement "ceStringPoly"
F4.name 				= "fuel numb"
F4.material 			= UFD_GRN
--F4.value 				= "6"		--NIGHTSTORM
F4.value 				= "40"		--NIGHTSTORM
F4.stringdefs 		= {0.0050, 0.0050, 0.0004, 0.001}
F4.alignment 			= "CenterCenter"
F4.formats 			= {"%s"}
F4.h_clip_relation    = h_clip_relations.COMPARE
F4.level 				= 2
--F4.init_pos 			= {58, -15, 0}		--NIGHTSTORM
F4.init_pos 			= {58, -13, 0}		--NIGHTSTORM
F4.init_rot 			= {0, 0, 0}
F4.element_params 	= {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
F4.controllers		= {{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(F4)
----------------------------------------------------------------------------------------
F5 					= CreateElement "ceStringPoly"
F5.name 				= "fuel numb"
F5.material 			= UFD_GRN
--F5.value 				= "4"		--NIGHTSTORM
F5.value 				= "20"		--NIGHTSTORM
F5.stringdefs 		= {0.0050, 0.0050, 0.0004, 0.001}
F5.alignment 			= "CenterCenter"
F5.formats 			= {"%s"}
F5.h_clip_relation    = h_clip_relations.COMPARE
F5.level 				= 2
--F5.init_pos 			= {58, -25, 0}		--NIGHTSTORM
F5.init_pos 			= {58, -24, 0}		--NIGHTSTORM
F5.init_rot 			= {0, 0, 0}
F5.element_params 	= {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
F5.controllers		= {{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(F5)
----------------------------------------------------------------------------------------
F6 					= CreateElement "ceStringPoly"
F6.name 				= "fuel numb"
F6.material 			= UFD_GRN
--F6.value 				= "2"	--NIGHTSTORM
F6.value 				= "0"	--NIGHTSTORM
F6.stringdefs 		= {0.0050, 0.0050, 0.0004, 0.001}
F6.alignment 			= "CenterCenter"
F6.formats 			= {"%s"}
F6.h_clip_relation    = h_clip_relations.COMPARE
F6.level 				= 2
F6.init_pos 			= {58, -35, 0}
F6.init_rot 			= {0, 0, 0}
F6.element_params 	= {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
F6.controllers		= {{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(F6)
----------------------------------------------------------------------------------------
local ClippingPlaneSize1 = 41.5 --Clipping Masks   --50
local ClippingWidth1 	= 45.5 --Clipping Masks	--85
-------------------------------------------------------------------
local FUELQT				= CreateElement "ceStringPoly"
FUELQT.name					= "rad Alt"
FUELQT.material				= UFD_GRN
FUELQT.init_pos				= {40, 38, 0} --L-R,U-D,F-B
FUELQT.alignment			= "LeftCenter"
FUELQT.stringdefs			= {0.005, 0.005, 0, 0.0} --either 004 or 005
FUELQT.additive_alpha		= true
FUELQT.collimated			= false
FUELQT.isdraw				= true	
FUELQT.use_mipfilter		= true
FUELQT.h_clip_relation		= h_clip_relations.COMPARE
FUELQT.level				= 2
FUELQT.element_params		= {"UFD_OPACITY","FUEL","L_ADI_OPACITY"}
--FUELQT.formats				= {"%.0f"}		--NIGHTSTORM
FUELQT.formats				= {"%05.0f"}		--NIGHTSTORM
FUELQT.controllers			= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(FUELQT)
-------------------------------------------------------------------
-------------------------------------------------------------------
local FUELTQT				= CreateElement "ceStringPoly"
FUELTQT.name				= "tank"
FUELTQT.material			= UFD_FONT
FUELTQT.init_pos			= {40, 30, 0} --L-R,U-D,F-B
FUELTQT.alignment			= "LeftCenter"
FUELTQT.stringdefs			= {0.005, 0.005, 0, 0.0} --either 004 or 005
FUELTQT.additive_alpha		= true
FUELTQT.collimated			= false
FUELTQT.isdraw				= true	
FUELTQT.use_mipfilter		= true
FUELTQT.h_clip_relation		= h_clip_relations.COMPARE
FUELTQT.level				= 2
FUELTQT.element_params		= {"UFD_OPACITY","FUELTANK","L_ADI_OPACITY"}
--FUELTQT.formats				= {"%.0f"}		--NIGHTSTORM
FUELTQT.formats				= {"%05.0f"}		--NIGHTSTORM
FUELTQT.controllers			= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(FUELTQT)
----------------------------------------------------------------------------
local total_field_of_view1           = CreateElement "ceMeshPoly"
total_field_of_view1.name            = "total_field_of_view"
total_field_of_view1.primitivetype   = "triangles"
total_field_of_view1.vertices        = {
										{-1 * ClippingWidth,-1 * ClippingPlaneSize},
										{1 *  ClippingWidth,-1 * ClippingPlaneSize},
										{1 *  ClippingWidth,1 *  ClippingPlaneSize},
										{-1 * ClippingWidth,1 *  ClippingPlaneSize},										
									}
total_field_of_view1.material        = PFD_MASK_BASE1--PFD_MASK_BASE1
total_field_of_view1.indices         = {0,1,2,2,3,0}
total_field_of_view1.init_pos        = {0, 0, 0}
total_field_of_view1.init_rot        = { 0, 0, 0} -- degree NOT rad
total_field_of_view1.h_clip_relation = h_clip_relations.REWRITE_LEVEL
total_field_of_view1.level           = 3
total_field_of_view1.collimated      = false
total_field_of_view1.isvisible       = false
Add(total_field_of_view1)
-----------------
local clipPoly1               = CreateElement "ceMeshPoly"
clipPoly1.name                = "clipPoly-11"
clipPoly1.primitivetype       = "triangles"
clipPoly1.init_pos            = {-16.2, 4.4, 0}
clipPoly1.init_rot            = { 0, 0 , 0} -- degree NOT rad
clipPoly1.vertices            = {
								{-1 * ClippingWidth1,-1 * ClippingPlaneSize1},
								{1 *  ClippingWidth1,-1 * ClippingPlaneSize1},
								{1 *  ClippingWidth1,1 *  ClippingPlaneSize1},
								{-1 * ClippingWidth1,1 *  ClippingPlaneSize1},										
									}
clipPoly1.indices             = {0,1,2,2,3,0}
clipPoly1.material            = PFD_MASK_BASE2
clipPoly1.h_clip_relation     = h_clip_relations.INCREASE_IF_LEVEL
clipPoly1.level               = 3
clipPoly1.collimated          = false
clipPoly1.isvisible           = false
Add(clipPoly1)
--------------
ADIUP                    = CreateElement "ceTexPoly"
ADIUP.name    			 = "up"
ADIUP.material			 = ADI_TOP
ADIUP.change_opacity 		= false
ADIUP.collimated 			= false
ADIUP.isvisible 			= true
ADIUP.init_pos 			= {-16.2, 4.4, 0} --maybe its x,y,z z being depth...
ADIUP.init_rot 			= {0, 0, 0}
--ADIUP.indices 			= {0, 1, 2, 2, 3, 0}
ADIUP.level 				= 4
ADIUP.h_clip_relation     = h_clip_relations.COMPARE
ADIUP.element_params 	  = {"L_ADI_OPACITY","ADIROLL","ADIPITCH","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
ADIUP.controllers		  = {
							{"parameter_in_range",0,0.9,1.1},
							{"rotate_using_parameter",1,1,0},
							{"move_up_down_using_parameter",2,-0.037,0},--needs to be checked with a ladder scale
							{"opacity_using_parameter",3},
						  }
vertices(ADIUP,400)

Add(ADIUP)
-- ----------------
ADIDN                    = CreateElement "ceTexPoly"
ADIDN.name    			 = "bot"
ADIDN.material			 = ADI_BOT
ADIDN.change_opacity 		= false
ADIDN.collimated 			= false
ADIDN.isvisible 			= true
ADIDN.init_pos 			= {-16.2, 4.4, 0} --maybe its x,y,z z being depth...
ADIDN.init_rot 			= {180, 0, 0}
ADIDN.level 				= 4
ADIDN.h_clip_relation     = h_clip_relations.COMPARE
ADIDN.element_params 	  = {"L_ADI_OPACITY","ADIROLL","ADIPITCH","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
ADIDN.controllers		  = {
							{"parameter_in_range",0,0.9,1.1},
							{"rotate_using_parameter",1,1,0},
							{"move_up_down_using_parameter",2,0.037,0},--needs to be checked with a ladder scale
							{"opacity_using_parameter",3},
						  }
vertices(ADIDN,400)


Add(ADIDN)
----------------
ADILAD                    	= CreateElement "ceTexPoly" --need to fix aith more code
ADILAD.name    				= "ladderup"
ADILAD.material			 	= LADDER_TOP
ADILAD.change_opacity 		= false
ADILAD.collimated 			= false
ADILAD.isvisible 			= true
ADILAD.init_pos 			= {-16.2, 4.4, 0} --maybe its x,y,z z being depth...
ADILAD.init_rot 			= {0, 0, 0}
ADILAD.level 				= 4
ADILAD.h_clip_relation     = h_clip_relations.COMPARE
ADILAD.element_params 	  = {"L_ADI_OPACITY","ADIROLL","ADIPITCH",} --HOPE THIS WORKS G_OP_BACK
ADILAD.controllers		  = {
							{"opacity_using_parameter",0},
							{"rotate_using_parameter",1,1,0},
							{"move_up_down_using_parameter",2,-0.037,0},--needs to be checked with a ladder scale -0.094   -0.037
							--{"opacity_using_parameter",3},
						  }
vertices(ADILAD,200)

Add(ADILAD)
-----------------------------------
ADILAD1MASK                    	= CreateElement "ceTexPoly"
ADILAD1MASK.name    				= "ladderdn"
ADILAD1MASK.material			 	= LADDER_BOT_MASK
ADILAD1MASK.change_opacity 		= false
ADILAD1MASK.collimated 			= false
ADILAD1MASK.isvisible 			= true
ADILAD1MASK.init_pos 			= {-16.2, 4.4, 0} --maybe its x,y,z z being depth...
ADILAD1MASK.init_rot 			= {0, 0, 0}
ADILAD1MASK.level 				= 4
ADILAD1MASK.h_clip_relation     = h_clip_relations.COMPARE
ADILAD1MASK.element_params 	  = {"L_ADI_OPACITY","ADIROLL","ADIPITCH"} --HOPE THIS WORKS G_OP_BACK
ADILAD1MASK.controllers		  = {
							{"parameter_in_range",0,0.9,1.1},
							{"rotate_using_parameter",1,1,0},
							{"move_up_down_using_parameter",2,-0.037,0},--needs to be checked with a ladder scale
							--{"opacity_using_parameter",3}
						  }

vertices(ADILAD1MASK,200)

Add(ADILAD1MASK)
-----------------------------------
ADILAD1                    	= CreateElement "ceTexPoly"
ADILAD1.name    				= "ladderdn"
ADILAD1.material			 	= LADDER_BOT
ADILAD1.change_opacity 		= false
ADILAD1.collimated 			= false
ADILAD1.isvisible 			= true
ADILAD1.init_pos 			= {-16.2, 4.4, 0} --maybe its x,y,z z being depth...
ADILAD1.init_rot 			= {0, 0, 0}
ADILAD1.level 				= 4
ADILAD1.h_clip_relation     = h_clip_relations.COMPARE
ADILAD1.element_params 	  = {"L_ADI_OPACITY","ADIROLL","ADIPITCH","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
ADILAD1.controllers		  = {
							{"parameter_in_range",0,0.9,1.1},
							{"rotate_using_parameter",1,1,0},
							{"move_up_down_using_parameter",2,-0.037,0},--needs to be checked with a ladder scale
							{"opacity_using_parameter",3}
						  }

vertices(ADILAD1,200)

Add(ADILAD1)
----------------------------
ADICENTMASK                    	= CreateElement "ceTexPoly"
ADICENTMASK.name    				= "cen"
ADICENTMASK.material			 	= ADI_CENTER_MASK
ADICENTMASK.change_opacity 		= false
ADICENTMASK.collimated 			= false
ADICENTMASK.isvisible 			= true
ADICENTMASK.init_pos 			= {-16.2, 4.4, 0} --maybe its x,y,z z being depth...
ADICENTMASK.init_rot 			= {0, 0, 0}
ADICENTMASK.indices 				= {0, 1, 2, 2, 3, 0}
ADICENTMASK.level 				= 4
ADICENTMASK.h_clip_relation     = h_clip_relations.COMPARE
ADICENTMASK.element_params 	  = {"L_ADI_OPACITY"} --HOPE THIS WORKS G_OP_BACK
ADICENTMASK.controllers		  = {
							--{"parameter_in_range",0,0.9,1.1},
							{"opacity_using_parameter",0}
							--{"rotate_using_parameter",1,1,0},
							--{"move_up_down_using_parameter",2,-0.094,0},--needs to be checked with a ladder scale
							--{"parameter_in_range",0,0.9,1.1}
						  }
ADICENTMASK.tex_coords =
{
    {0, 0},
    {1, 0},
    {1, 1},
    {0, 1}
}

-- local xPos = 20
-- local xNeg = -20
-- local yPos = 20
-- local yNeg = -20

ADICENTMASK.vertices = 
{
    {-20, 20},
    {20, 20},
    {20, -20},
    {-20, -20}
}

Add(ADICENTMASK)
---------------------------
ADICENT                    	= CreateElement "ceTexPoly"
ADICENT.name    				= "cen"
ADICENT.material			 	= ADI_CENTER
ADICENT.change_opacity 		= false
ADICENT.collimated 			= false
ADICENT.isvisible 			= true
ADICENT.init_pos 			= {-16.2, 4.4, 0} --maybe its x,y,z z being depth...
ADICENT.init_rot 			= {0, 0, 0}
ADICENT.indices 				= {0, 1, 2, 2, 3, 0}
ADICENT.level 				= 4
ADICENT.h_clip_relation     = h_clip_relations.COMPARE
ADICENT.element_params 	  = {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
ADICENT.controllers		  = {
							{"parameter_in_range",0,0.9,1.1},
							{"opacity_using_parameter",1}
							--{"rotate_using_parameter",1,1,0},
							--{"move_up_down_using_parameter",2,-0.094,0},--needs to be checked with a ladder scale
							--{"parameter_in_range",0,0.9,1.1}
						  }
ADICENT.tex_coords =
{
    {0, 0},
    {1, 0},
    {1, 1},
    {0, 1}
}

-- local xPos = 20
-- local xNeg = -20
-- local yPos = 20
-- local yNeg = -20

ADICENT.vertices = 
{
    {-20, 20},
    {20, 20},
    {20, -20},
    {-20, -20}
}

Add(ADICENT)
------------------------------------------------------
local total_field_of_view2           = CreateElement "ceMeshPoly"
total_field_of_view2.name            = "total_field_of_view"
total_field_of_view2.primitivetype   = "triangles"
total_field_of_view2.vertices        = {
										{-1 * ClippingWidth,-1 * ClippingPlaneSize},
										{1 *  ClippingWidth,-1 * ClippingPlaneSize},
										{1 *  ClippingWidth,1 *  ClippingPlaneSize},
										{-1 * ClippingWidth,1 *  ClippingPlaneSize},										
									}
total_field_of_view2.material        = PFD_MASK_BASE1--PFD_MASK_BASE1
total_field_of_view2.indices         = {0,1,2,2,3,0}
total_field_of_view2.init_pos        = {0, 0, 0}
total_field_of_view2.init_rot        = { 0, 0, 0} -- degree NOT rad
total_field_of_view2.h_clip_relation = h_clip_relations.REWRITE_LEVEL
total_field_of_view2.level           = 5
total_field_of_view2.collimated      = false
total_field_of_view2.isvisible       = false
Add(total_field_of_view2)
-----------------
local clipPoly2               = CreateElement "ceMeshPoly"
clipPoly2.name                = "clipPoly-11"
clipPoly2.primitivetype       = "triangles"
clipPoly2.init_pos            = {-16.2, 4.4, 0}
clipPoly2.init_rot            = { 0, 0 , 0} -- degree NOT rad
clipPoly2.vertices            = {
								{-1 * ClippingWidth1,-1 * ClippingPlaneSize1},
								{1 *  ClippingWidth1,-1 * ClippingPlaneSize1},
								{1 *  ClippingWidth1,1 *  ClippingPlaneSize1},
								{-1 * ClippingWidth1,1 *  ClippingPlaneSize1},										
									}
clipPoly2.indices             = {0,1,2,2,3,0}
clipPoly2.material            = PFD_MASK_BASE2
clipPoly2.h_clip_relation     = h_clip_relations.INCREASE_IF_LEVEL
clipPoly2.level               = 5
clipPoly2.collimated          = false
clipPoly2.isvisible           = false
Add(clipPoly2)
-----------------------------------------------
-----------------------------------------------
BGROUND1                    	= CreateElement "ceTexPoly" --top left box
BGROUND1.name    				= "BG"
BGROUND1.material				= BLACK_MASK
BGROUND1.change_opacity 		= false
BGROUND1.collimated 			= false
BGROUND1.isvisible 				= true
BGROUND1.init_pos 				= {-51, 36.3, 0}
BGROUND1.init_rot 				= {0, 0, 0}
BGROUND1.indices 				= {0, 1, 2, 2, 3, 0}
BGROUND1.element_params 		= {"L_ADI_OPACITY"} --HOPE THIS WORKS G_OP_BACK
BGROUND1.controllers			= {{"opacity_using_parameter",0}}
BGROUND1.level 					= 6
BGROUND1.h_clip_relation     	= h_clip_relations.COMPARE

BGROUND1.tex_coords =
{
    {0, 0},
    {1, 0},
    {1, 1},
    {0, 1}
}

local levelHeight = 19 --50 was big
local levelWidth = 	24
local halfWidth = levelWidth / 2
local halfHeight = levelHeight / 2
local xPos = halfWidth
local xNeg = halfWidth * -1.0
local yPos = halfHeight
local yNeg = halfHeight * -1.0

BGROUND1.vertices = 
{
    {xNeg, yPos},
    {xPos, yPos},
    {xPos, yNeg},
    {xNeg, yNeg}
}

Add(BGROUND1)
--------------------------------------------------
local LENGRPM				= CreateElement "ceStringPoly"
LENGRPM.name				= "rad Alt"
LENGRPM.material			= UFD_GRN
LENGRPM.init_pos			= {-47, 40, 0} --L-R,U-D,F-B
LENGRPM.alignment			= "RightCenter"
LENGRPM.stringdefs			= {0.005, 0.005, 0, 0.0} --either 004 or 005
LENGRPM.additive_alpha		= true
LENGRPM.collimated			= false
LENGRPM.isdraw				= true	
LENGRPM.use_mipfilter		= true
LENGRPM.h_clip_relation		= h_clip_relations.COMPARE
LENGRPM.level				= 6
LENGRPM.element_params		= {"UFD_OPACITY","RPM_L","L_ADI_OPACITY"}
LENGRPM.formats				= {"%.0f"}--= {"%02.0f"}
LENGRPM.controllers			= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(LENGRPM)
-----------------------------------------------------------------------------------------
ENGPCTL 					= CreateElement "ceStringPoly"
ENGPCTL.name 				= "fuel numb"
ENGPCTL.material 			= UFD_GRN
ENGPCTL.value 				= "%"
ENGPCTL.stringdefs 			= {0.005, 0.005, 0, 0.0} --either 004 or 005
ENGPCTL.alignment 			= "CenterCenter"
ENGPCTL.formats 			= {"%s"}
ENGPCTL.h_clip_relation    	= h_clip_relations.COMPARE
ENGPCTL.level 				= 6
ENGPCTL.init_pos 			= {-44, 40, 0}
ENGPCTL.init_rot 			= {0, 0, 0}
ENGPCTL.element_params 	= {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
ENGPCTL.controllers		= {
								{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(ENGPCTL)
----------------------------------------------------------------------------------------------------------------------
ENGDEGL 					= CreateElement "ceStringPoly"
ENGDEGL.name 				= "fuel numb"
ENGDEGL.material 			= UFD_GRN
ENGDEGL.value 				= "d"
ENGDEGL.stringdefs 			= {0.005, 0.005, 0, 0.0} --either 004 or 005
ENGDEGL.alignment 			= "CenterCenter"
ENGDEGL.formats 			= {"%s"}
ENGDEGL.h_clip_relation    	= h_clip_relations.COMPARE
ENGDEGL.level 				= 6
ENGDEGL.init_pos 			= {-44, 33, 0}
ENGDEGL.init_rot 			= {0, 0, 0}
ENGDEGL.element_params 	= {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
ENGDEGL.controllers		= {
								{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(ENGDEGL)
local LENGEGT				= CreateElement "ceStringPoly"
LENGEGT.name				= "rad Alt"
LENGEGT.material			= UFD_GRN
LENGEGT.init_pos			= {-47, 33, 0} --L-R,U-D,F-B
LENGEGT.alignment			= "RightCenter"
LENGEGT.stringdefs			= {0.005, 0.005, 0, 0.0} --either 004 or 005
LENGEGT.additive_alpha		= true
LENGEGT.collimated			= false
LENGEGT.isdraw				= true	
LENGEGT.use_mipfilter		= true
LENGEGT.h_clip_relation		= h_clip_relations.COMPARE
LENGEGT.level				= 6
LENGEGT.element_params		= {"UFD_OPACITY","EGT_L","L_ADI_OPACITY"}
LENGEGT.formats				= {"%.0f"}--= {"%02.0f"}
LENGEGT.controllers			= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(LENGEGT)
-----------------------------------------------------------------------------------------
----------------------------------
---------------------------------------------------------------
BGROUND1a                    = CreateElement "ceTexPoly" --top center box
BGROUND1a.name    			= "BG"
BGROUND1a.material			= BLACK_MASK
BGROUND1a.change_opacity 		= false
BGROUND1a.collimated 			= false
BGROUND1a.isvisible 			= true
BGROUND1a.init_pos 			= {-16.8, 42, 0}
BGROUND1a.init_rot 			= {0, 0, 0}
BGROUND1a.indices 			= {0, 1, 2, 2, 3, 0}
BGROUND1a.element_params 		= {"L_ADI_OPACITY","L_ADI_OPACITY"}
BGROUND1a.controllers			= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
BGROUND1a.level 				= 6
BGROUND1a.h_clip_relation     = h_clip_relations.COMPARE

BGROUND1a.tex_coords =
{
    {0, 0},
    {1, 0},
    {1, 1},
    {0, 1}
}

local levelHeight = 10 --50 was big
local levelWidth = 	15
local halfWidth = levelWidth / 2
local halfHeight = levelHeight / 2
local xPos = halfWidth
local xNeg = halfWidth * -1.0
local yPos = halfHeight
local yNeg = halfHeight * -1.0

BGROUND1a.vertices = 
{
    {xNeg, yPos},
    {xPos, yPos},
    {xPos, yNeg},
    {xNeg, yNeg}
}

Add(BGROUND1a)
----------------------------------------------------------------
--Heading Digital
local NAV				= CreateElement "ceStringPoly"
NAV.name				= "Navigation"
NAV.material			= UFD_FONT
NAV.init_pos			= {-16.8, 40.8, 0} --L-R,U-D,F-B
NAV.alignment			= "CenterCenter"
NAV.stringdefs			= {0.006, 0.006, 0, 0.0} --either 004 or 005
NAV.additive_alpha		= true
NAV.collimated			= false
NAV.isdraw				= true	
NAV.use_mipfilter		= true
NAV.h_clip_relation		= h_clip_relations.COMPARE
NAV.level				= 6
NAV.element_params		= {"L_ADI_OPACITY","NAV","UFD_OPACITY"}
NAV.formats				= {"%03.0f"}
NAV.controllers			= {{"parameter_in_range",0,0.9,1.1},{"text_using_parameter",1,0},{"opacity_using_parameter",2}}
Add(NAV)
----------------------------------------------------
BGROUND2                    = CreateElement "ceTexPoly" --top right box
BGROUND2.name    			= "BG"
BGROUND2.material			= BLACK_MASK
BGROUND2.change_opacity 		= false
BGROUND2.collimated 			= false
BGROUND2.isvisible 			= true
BGROUND2.init_pos 			= {18.75, 36.3, 0}
BGROUND2.init_rot 			= {0, 0, 0}
BGROUND2.indices 			= {0, 1, 2, 2, 3, 0}
BGROUND2.element_params 		= {"L_ADI_OPACITY"} --HOPE THIS WORKS G_OP_BACK
BGROUND2.controllers			= {{"opacity_using_parameter",0}}
BGROUND2.level 				= 6
BGROUND2.h_clip_relation     = h_clip_relations.COMPARE

BGROUND2.tex_coords =
{
    {0, 0},
    {1, 0},
    {1, 1},
    {0, 1}
}

local levelHeight = 19 --50 was big
local levelWidth = 	24
local halfWidth = levelWidth / 2
local halfHeight = levelHeight / 2
local xPos = halfWidth
local xNeg = halfWidth * -1.0
local yPos = halfHeight
local yNeg = halfHeight * -1.0

BGROUND2.vertices = 
{
    {xNeg, yPos},
    {xPos, yPos},
    {xPos, yNeg},
    {xNeg, yNeg}
}

Add(BGROUND2)
--------------------------------
--------------------------------------------------
local RENGRPM				= CreateElement "ceStringPoly"
RENGRPM.name				= "rad Alt"
RENGRPM.material			= UFD_GRN
RENGRPM.init_pos			= {20, 40, 0} --L-R,U-D,F-B
RENGRPM.alignment			= "RightCenter"
RENGRPM.stringdefs			= {0.005, 0.005, 0, 0.0} --either 004 or 005
RENGRPM.additive_alpha		= true
RENGRPM.collimated			= false
RENGRPM.isdraw				= true	
RENGRPM.use_mipfilter		= true
RENGRPM.h_clip_relation		= h_clip_relations.COMPARE
RENGRPM.level				= 6
RENGRPM.element_params		= {"UFD_OPACITY","RPM_R","L_ADI_OPACITY"}
RENGRPM.formats				= {"%.0f"}--= {"%02.0f"}
RENGRPM.controllers			= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(RENGRPM)
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
ENGPCTR 					= CreateElement "ceStringPoly"
ENGPCTR.name 				= "fuel numb"
ENGPCTR.material 			= UFD_GRN
ENGPCTR.value 				= "%"
ENGPCTR.stringdefs 			= {0.005, 0.005, 0, 0.0} --either 004 or 005
ENGPCTR.alignment 			= "CenterCenter"
ENGPCTR.formats 			= {"%s"}
ENGPCTR.h_clip_relation    	= h_clip_relations.COMPARE
ENGPCTR.level 				= 6
ENGPCTR.init_pos 			= {23, 40, 0}
ENGPCTR.init_rot 			= {0, 0, 0}
ENGPCTR.element_params 		= {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
ENGPCTR.controllers			= {
								{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(ENGPCTR)
----------------------------------------------------------------------------------------------------------------------
ENGDEGR 					= CreateElement "ceStringPoly"
ENGDEGR.name 				= "fuel numb"
ENGDEGR.material 			= UFD_GRN
ENGDEGR.value 				= "d"
ENGDEGR.stringdefs 			= {0.005, 0.005, 0, 0.0} --either 004 or 005
ENGDEGR.alignment 			= "CenterCenter"
ENGDEGR.formats 			= {"%s"}
ENGDEGR.h_clip_relation    	= h_clip_relations.COMPARE
ENGDEGR.level 				= 6
ENGDEGR.init_pos 			= {23, 33, 0}
ENGDEGR.init_rot 			= {0, 0, 0}
ENGDEGR.element_params 	= {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
ENGDEGR.controllers		= {
								{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(ENGDEGR)
--------------------------------------------------
local RENGEGT				= CreateElement "ceStringPoly"
RENGEGT.name				= "rad Alt"
RENGEGT.material			= UFD_GRN
RENGEGT.init_pos			= {20, 33, 0} --L-R,U-D,F-B
RENGEGT.alignment			= "RightCenter"
RENGEGT.stringdefs			= {0.005, 0.005, 0, 0.0} --either 004 or 005
RENGEGT.additive_alpha		= true
RENGEGT.collimated			= false
RENGEGT.isdraw				= true	
RENGEGT.use_mipfilter		= true
RENGEGT.h_clip_relation		= h_clip_relations.COMPARE
RENGEGT.level				= 6
RENGEGT.element_params		= {"UFD_OPACITY","EGT_R","L_ADI_OPACITY"}
RENGEGT.formats				= {"%.0f"}--= {"%02.0f"}
RENGEGT.controllers			= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(RENGEGT)
----------------------------------
BGROUND3                    = CreateElement "ceTexPoly" -- speed box left
BGROUND3.name    			= "BG"
BGROUND3.material			= BLACK_MASK
BGROUND3.change_opacity 		= false
BGROUND3.collimated 			= false
BGROUND3.isvisible 			= true
BGROUND3.init_pos 			= {-56, 4.4, 0}
BGROUND3.init_rot 			= {0, 0, 0}
BGROUND3.indices 			= {0, 1, 2, 2, 3, 0}
BGROUND3.element_params 		= {"L_ADI_OPACITY"} --HOPE THIS WORKS G_OP_BACK
BGROUND3.controllers			= {{"opacity_using_parameter",0}}
BGROUND3.level 				= 6
BGROUND3.h_clip_relation     = h_clip_relations.COMPARE

BGROUND3.tex_coords =
{
    {0, 0},
    {1, 0},
    {1, 1},
    {0, 1}
}

BGROUND3.vertices = 
{
    {-12, 5},
    {12, 5},
    {12, -5},
    {-12, -5}
}

Add(BGROUND3)
---------------------------------------------------------------------
--Indicated Airspeed
local IAS				= CreateElement "ceStringPoly"
IAS.name				= "Indicated Airspeed"
IAS.material			= UFD_FONT
IAS.init_pos			= {-60, 4.4, 0} --L-R,U-D,F-B
IAS.alignment			= "LeftCenter"
IAS.stringdefs			= {0.007, 0.007, 0, 0.0} --either 004 or 005
IAS.additive_alpha		= true
IAS.collimated			= false
IAS.isdraw				= true	
IAS.use_mipfilter		= true
IAS.h_clip_relation	= h_clip_relations.COMPARE
IAS.level				= 6
IAS.element_params		= {"UFD_OPACITY","IAS","L_ADI_OPACITY"}
IAS.formats				= {"%03.0f"} --{"%.0f"}
IAS.controllers			= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(IAS)
---------------------------------------------------------------------
BGROUND4                    = CreateElement "ceTexPoly" -- alt box right
BGROUND4.name    			= "BG"
BGROUND4.material			= BLACK_MASK
BGROUND4.change_opacity 		= false
BGROUND4.collimated 			= false
BGROUND4.isvisible 			= true
BGROUND4.init_pos 			= {17, 4.4, 0}
BGROUND4.init_rot 			= {0, 0, 0}
BGROUND4.indices 			= {0, 1, 2, 2, 3, 0}
BGROUND4.element_params 		= {"L_ADI_OPACITY"} --HOPE THIS WORKS G_OP_BACK
BGROUND4.controllers			= {{"opacity_using_parameter",0}}
BGROUND4.level 				= 6
BGROUND4.h_clip_relation     = h_clip_relations.COMPARE

BGROUND4.tex_coords =
{
    {0, 0},
    {1, 0},
    {1, 1},
    {0, 1}
}


BGROUND4.vertices = 
{
    {-12, 5},
    {12, 5},
    {12, -5},
    {-12, -5}
}

Add(BGROUND4)
-----------------------------------------------------
--Barometric Alt
local BARO				= CreateElement "ceStringPoly"
BARO.name				= "Baro Alt"
BARO.material			= UFD_FONT
BARO.init_pos			= {26.5, 4.4, 0} --L-R,U-D,F-B
BARO.alignment			= "RightCenter"
BARO.stringdefs			= {0.006, 0.006, 0, 0.0} --either 004 or 005
BARO.additive_alpha		= true
BARO.collimated			= false
BARO.isdraw				= true
BARO.use_mipfilter		= true
BARO.h_clip_relation	= h_clip_relations.COMPARE
BARO.level				= 6
BARO.element_params		= {"UFD_OPACITY","BAROALT","L_ADI_OPACITY"}
BARO.formats			= {"%05.0f"}
BARO.controllers		= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(BARO)
-----------------------------------------------------
BGROUND5                    = CreateElement "ceTexPoly" -- alt box right lower
BGROUND5.name    			= "BG"
BGROUND5.material			= BLACK_MASK
BGROUND5.change_opacity 		= false
BGROUND5.collimated 			= false
BGROUND5.isvisible 			= true
BGROUND5.init_pos 			= {18.7, -33.5, 0}
BGROUND5.init_rot 			= {0, 0, 0}
BGROUND5.indices 			= {0, 1, 2, 2, 3, 0}
BGROUND5.element_params 		= {"L_ADI_OPACITY"} --HOPE THIS WORKS G_OP_BACK
BGROUND5.controllers			= {{"opacity_using_parameter",0}}
BGROUND5.level 				= 6
BGROUND5.h_clip_relation     = h_clip_relations.COMPARE

BGROUND5.tex_coords =
{
    {0, 0},
    {1, 0},
    {1, 1},
    {0, 1}
}

BGROUND5.vertices = 
{
    {-12, 5},
    {12, 5},
    {12, -5},
    {-12, -5}
}

Add(BGROUND5)
-----------------------------------------------------
--NIGHTSTORM
-----------------------------------------------------
BGROUND6                    = CreateElement "ceTexPoly" -- alt box right lower
BGROUND6.name    			= "BG"
BGROUND6.material			= BLACK_MASK
BGROUND6.change_opacity 		= false
BGROUND6.collimated 			= false
BGROUND6.isvisible 			= true
BGROUND6.init_pos 			= {-50.7, -33.5, 0}
BGROUND6.init_rot 			= {0, 0, 0}
BGROUND6.indices 			= {0, 1, 2, 2, 3, 0}
BGROUND6.element_params 		= {"L_ADI_OPACITY"} --HOPE THIS WORKS G_OP_BACK
BGROUND6.controllers			= {{"opacity_using_parameter",0}}
BGROUND6.level 				= 6
BGROUND6.h_clip_relation     = h_clip_relations.COMPARE

BGROUND6.tex_coords =
{
    {0, 0},
    {1, 0},
    {1, 1},
    {0, 1}
}

BGROUND6.vertices = 
{
    {-12, 5},
    {12, 5},
    {12, -5},
    {-12, -5}
}

Add(BGROUND6)
-----------------------------------------------------
VVI_NUM				        = CreateElement "ceStringPoly"
VVI_NUM.name				    = "VVI_NUM"
VVI_NUM.material			    = UFD_FONT
VVI_NUM.init_pos			    = {-59.7, -32.5, 0}
VVI_NUM.alignment			= "LeftCenter"
VVI_NUM.stringdefs			= {0.0050, 0.0050, 0, 0.0}
VVI_NUM.additive_alpha		= true
VVI_NUM.collimated			= false
VVI_NUM.isdraw				= true	
VVI_NUM.use_mipfilter		= true
VVI_NUM.h_clip_relation	    = h_clip_relations.COMPARE
VVI_NUM.level				= 6
VVI_NUM.element_params		= {"UFD_OPACITY","VV","L_ADI_OPACITY"}
VVI_NUM.formats			    = {"%05.0f"}
VVI_NUM.controllers		    =   {
                                        {"opacity_using_parameter",0},
                                        {"text_using_parameter",1,0},
                                        {"parameter_in_range",2,0.9,1.1}
                                    }
                                
Add(VVI_NUM)
-----------------------------------------------------
--NIGHTSTORM
-----------------------------------------------------
--------------------------------------------------------------------------
local RADALT				= CreateElement "ceStringPoly"
RADALT.name				= "rad Alt"
RADALT.material			= UFD_FONT
RADALT.init_pos			= {26, -32.5, 0} --L-R,U-D,F-B
RADALT.alignment			= "RightCenter"
RADALT.stringdefs			= {0.005, 0.005, 0, 0.0} --either 004 or 005
RADALT.additive_alpha		= true
RADALT.collimated			= false
RADALT.isdraw				= true	
RADALT.use_mipfilter		= true
RADALT.h_clip_relation	= h_clip_relations.COMPARE
RADALT.level				= 6
RADALT.element_params		= {"UFD_OPACITY","RADALT","L_ADI_OPACITY"}
RADALT.formats			= {"%05.0f"}
RADALT.controllers		= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(RADALT)
---------------------------------------------------------------------TRIM--STOP
ADITRIMMASK                    	= CreateElement "ceTexPoly"
ADITRIMMASK.name    				= "trim"
ADITRIMMASK.material			 	= ADI_TRIM_MASK
ADITRIMMASK.change_opacity 		= false
ADITRIMMASK.collimated 			= false
ADITRIMMASK.isvisible 			= true
ADITRIMMASK.init_pos 			= {0, 0, 0} --maybe its x,y,z z being depth...
ADITRIMMASK.init_rot 			= {0, 0, 0}
ADITRIMMASK.level 				= 6
ADITRIMMASK.h_clip_relation     = h_clip_relations.COMPARE
ADITRIMMASK.element_params 	  = {"L_ADI_OPACITY"} --HOPE THIS WORKS G_OP_BACK
ADITRIMMASK.controllers		  = {
							{"parameter_in_range",0,0.9,1.1},
							--{"rotate_using_parameter",1,1,0},
							--{"move_up_down_using_parameter",2,-0.094,0},--needs to be checked with a ladder scale
						  }
						  
vertices(ADITRIMMASK,199)

Add(ADITRIMMASK)
---------------------------------------------------------------------
ADITRIM                    	= CreateElement "ceTexPoly"
ADITRIM.name    				= "trim"
ADITRIM.material			 	= ADI_TRIM
ADITRIM.change_opacity 		= false
ADITRIM.collimated 			= false
ADITRIM.isvisible 			= true
ADITRIM.init_pos 			= {0, 0, 0} --maybe its x,y,z z being depth...
ADITRIM.init_rot 			= {0, 0, 0}
ADITRIM.level 				= 6
ADITRIM.h_clip_relation     = h_clip_relations.COMPARE
ADITRIM.element_params 	  = {"L_ADI_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
ADITRIM.controllers		  = {
							{"parameter_in_range",0,0.9,1.1},
							--{"rotate_using_parameter",1,1,0},
							--{"move_up_down_using_parameter",2,-0.094,0},--needs to be checked with a ladder scale
							{"opacity_using_parameter",1},
						  }
						  
vertices(ADITRIM,199)

Add(ADITRIM)
-------------------------------------------
local ClippingPlaneSize3 = 29 --Clipping Masks   --50
local ClippingWidth3 	= 5.40 --Clipping Masks	--85
--Clipping Masks
local total_field_of_view3           = CreateElement "ceMeshPoly"
total_field_of_view3.name            = "total_field_of_view"
total_field_of_view3.primitivetype   = "triangles"
total_field_of_view3.vertices        = {
										{-1 * ClippingWidth,-1 * ClippingPlaneSize},
										{1 *  ClippingWidth,-1 * ClippingPlaneSize},
										{1 *  ClippingWidth,1 *  ClippingPlaneSize},
										{-1 * ClippingWidth,1 *  ClippingPlaneSize},										
									}
total_field_of_view3.material        = PFD_MASK_BASE1
total_field_of_view3.indices         = {0,1,2,2,3,0}
total_field_of_view3.init_pos        = {0, 0, 0}
total_field_of_view3.init_rot        = { 0, 0, 0} -- degree NOT rad
total_field_of_view3.h_clip_relation = h_clip_relations.REWRITE_LEVEL
total_field_of_view3.level           = 7
total_field_of_view3.collimated      = false
total_field_of_view3.isvisible       = false
Add(total_field_of_view3)

local clipPoly3               = CreateElement "ceMeshPoly"
clipPoly3.name                = "clipPoly-3"
clipPoly3.primitivetype       = "triangles"
clipPoly3.init_pos            = {43, -7.8, 0}
clipPoly3.init_rot            = { 0, 0 , 0} -- degree NOT rad
clipPoly3.vertices            = {
								{-1 * ClippingWidth3,-1 * ClippingPlaneSize3},
								{1 *  ClippingWidth3,-1 * ClippingPlaneSize3},
								{1 *  ClippingWidth3,1 *  ClippingPlaneSize3},
								{-1 * ClippingWidth3,1 *  ClippingPlaneSize3},										
									}
clipPoly3.indices             = {0,1,2,2,3,0}
clipPoly3.material            = PFD_MASK_BASE2
clipPoly3.h_clip_relation     = h_clip_relations.INCREASE_IF_LEVEL
clipPoly3.level               = 7
clipPoly3.collimated          = false
clipPoly3.isvisible           = false
Add(clipPoly3)
----------------------------------------------------
FUELLINEM                    = CreateElement "ceTexPoly"
FUELLINEM.name    			= "BG"
FUELLINEM.material			= FUEL_LINE_M
FUELLINEM.change_opacity 		= false
FUELLINEM.collimated 			= false
FUELLINEM.isvisible 			= true
FUELLINEM.init_pos 			= {43, -77, 0} --maybe its x,y,z z being depth...
FUELLINEM.element_params 		= {"L_ADI_OPACITY"} --HOPE THIS WORKS G_OP_BACK
FUELLINEM.controllers			= {{"parameter_in_range",0,0.9,1.1}}
FUELLINEM.level 				= 8
FUELLINEM.h_clip_relation     = h_clip_relations.COMPARE
vertices(FUELLINEM,80,true)
----------------------------------------------------------------------------------------------------------
FUELLINEMASK                    	= CreateElement "ceTexPoly"
FUELLINEMASK.name    				= "BG"
FUELLINEMASK.material				= FUEL_LINE_MASK
FUELLINEMASK.change_opacity 		= false
FUELLINEMASK.collimated 			= false
FUELLINEMASK.isvisible 				= true
FUELLINEMASK.init_pos 				= {43, -77, 0} --maybe its x,y,z z being depth...
--FUELLINE.init_rot 			= {0, 0, 0}
FUELLINEMASK.element_params 		= {"FUELL","L_ADI_OPACITY"} --HOPE THIS WORKS G_OP_BACK
--FUELLINE.element_params 		= {"UFD_OPACITY","L_ADI_OPACITY"} --HOPE THIS WORKS G_OP_BACK
FUELLINEMASK.controllers			= 	{
								   			{"move_up_down_using_parameter",0,0.00081,0}, --{"move_up_down_using_parameter",0,0.00052,0},
								   			{"parameter_in_range",1,0.9,1.1}
								  		}
FUELLINEMASK.level 					= 8
FUELLINEMASK.h_clip_relation     	= h_clip_relations.COMPARE
vertices(FUELLINEMASK,80,true)

Add(FUELLINEMASK)
----------------------------------------------------------------------------------------------------------
FUELLINE                    = CreateElement "ceTexPoly"
FUELLINE.name    			= "BG"
FUELLINE.material			= FUEL_LINE
FUELLINE.change_opacity 		= false
FUELLINE.collimated 			= false
FUELLINE.isvisible 			= true
FUELLINE.init_pos 			= {43, -77, 0}
--FUELLINE.init_rot 			= {0, 0, 0}
FUELLINE.element_params 		= {"UFD_OPACITY","FUELL","L_ADI_OPACITY"} --HOPE THIS WORKS G_OP_BACK
--FUELLINE.element_params 		= {"UFD_OPACITY","L_ADI_OPACITY"} --HOPE THIS WORKS G_OP_BACK
FUELLINE.controllers			= {{"opacity_using_parameter",0},
								   {"move_up_down_using_parameter",1,0.00081,0},
								   {"parameter_in_range",2,0.9,1.1}


								  }
FUELLINE.level 				= 8
FUELLINE.h_clip_relation     = h_clip_relations.COMPARE
vertices(FUELLINE,80,true)

Add(FUELLINE)
-------------------------------------------------------------------------------------------------------------------
FUELLINEMASKLOWER                    	= CreateElement "ceTexPoly"
FUELLINEMASKLOWER.name    				= "BG"
FUELLINEMASKLOWER.material				= FUEL_LINE_MASK
FUELLINEMASKLOWER.change_opacity 		= false
FUELLINEMASKLOWER.collimated 			= false
FUELLINEMASKLOWER.isvisible 				= true
FUELLINEMASKLOWER.init_pos 				= {43, -154, 0}
--FUELLINE.init_rot 			= {0, 0, 0}
FUELLINEMASKLOWER.element_params 		= {"FUELL","L_ADI_OPACITY"} --HOPE THIS WORKS G_OP_BACK
--FUELLINE.element_params 		= {"UFD_OPACITY","L_ADI_OPACITY"} --HOPE THIS WORKS G_OP_BACK
FUELLINEMASKLOWER.controllers			= 	{
								   			{"move_up_down_using_parameter",0,0.00081,0}, --{"move_up_down_using_parameter",0,0.00052,0},
								   			{"parameter_in_range",1,0.9,1.1}
								  		}
FUELLINEMASKLOWER.level 					= 8
FUELLINEMASKLOWER.h_clip_relation     	= h_clip_relations.COMPARE
vertices(FUELLINEMASKLOWER,80,true)

Add(FUELLINEMASKLOWER)
----------------------------------------------------------------------------------------------------------
FUELLINEL                    = CreateElement "ceTexPoly"
FUELLINEL.name    			= "BG"
FUELLINEL.material			= FUEL_LINE
FUELLINEL.change_opacity 		= false
FUELLINEL.collimated 			= false
FUELLINEL.isvisible 			= true
FUELLINEL.init_pos 			= {43, -154, 0} --maybe its x,y,z z being depth...
FUELLINEL.element_params 		= {"UFD_OPACITY","FUELL","L_ADI_OPACITY"} --HOPE THIS WORKS G_OP_BACK
FUELLINEL.controllers			= {{"opacity_using_parameter",0},
								   {"move_up_down_using_parameter",1,0.00081,0},
								   {"parameter_in_range",2,0.9,1.1}


								  }
FUELLINEL.level 				= 8
FUELLINEL.h_clip_relation     = h_clip_relations.COMPARE
vertices(FUELLINEL,80,true)

Add(FUELLINEL)
------------------------------------------------------------------------------------------------------------
--NIGHTSTORM WARNING PAGE BELOW THIS LINE
------------------------------------------------------------------------------------------------------------
--Clipping Masks
local total_field_of_viewP2           = CreateElement "ceMeshPoly"
total_field_of_viewP2.name            = "total_field_of_view"
total_field_of_viewP2.primitivetype   = "triangles"
total_field_of_viewP2.vertices        = {
										{-1 * ClippingWidth,-1 * ClippingPlaneSize},
										{1 * ClippingWidth,-1 * ClippingPlaneSize},
										{1 * ClippingWidth,1 * ClippingPlaneSize},
										{-1 * ClippingWidth,1 * ClippingPlaneSize},										
									}
total_field_of_viewP2.material        = PFD_MASK_BASE1
total_field_of_viewP2.indices         = {0,1,2,2,3,0}
total_field_of_viewP2.init_pos        = {0, 0, 0}
total_field_of_viewP2.init_rot        = { 0, 0, 0} -- degree NOT rad
total_field_of_viewP2.h_clip_relation = h_clip_relations.REWRITE_LEVEL
total_field_of_viewP2.level           = 9
total_field_of_viewP2.collimated      = false
total_field_of_viewP2.isvisible       = false
Add(total_field_of_viewP2)

local clipPolyP2               = CreateElement "ceMeshPoly"
clipPolyP2.name                = "clipPoly-1"
clipPolyP2.primitivetype       = "triangles"
clipPolyP2.init_pos            = {0, 0, 0}
clipPolyP2.init_rot            = { 0, 0 , 0} -- degree NOT rad
clipPolyP2.vertices            = {
								{-1 * ClippingWidth,-1 * ClippingPlaneSize},
								{1 * ClippingWidth,-1 * ClippingPlaneSize},
								{1 * ClippingWidth,1 * ClippingPlaneSize},
								{-1 * ClippingWidth,1 * ClippingPlaneSize},										
									}
clipPolyP2.indices             = {0,1,2,2,3,0}
clipPolyP2.material            = PFD_MASK_BASE2
clipPolyP2.h_clip_relation     = h_clip_relations.INCREASE_IF_LEVEL
clipPolyP2.level               = 9
clipPolyP2.collimated          = false
clipPolyP2.isvisible           = false
Add(clipPolyP2)
---------------------------------------------------------------------------------------------------------------PFD-FAKE-BACKGROUND
--NIGHTSTORM FAKE UFD TO BE REMOVED
--[[
PFDFAKE                    = CreateElement "ceTexPoly"
PFDFAKE.name    			= "PFD Warning fake"
PFDFAKE.material			= PFD_PAGE_1
PFDFAKE.change_opacity 		= false
PFDFAKE.collimated 			= false
PFDFAKE.isvisible 			= true
PFDFAKE.init_pos 			= {0, 0, 0} --maybe its x,y,z z being depth...
PFDFAKE.init_rot 			= {0, 0, 0}
PFDFAKE.element_params 		= {"L_WAR_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
PFDFAKE.controllers			= 	{{"parameter_in_range",0,0.9,1.1}, {"opacity_using_parameter",1}}
PFDFAKE.level 				= 10
PFDFAKE.h_clip_relation     = h_clip_relations.COMPARE
vertices(PFDFAKE,130)

Add(PFDFAKE)
]]--
----------------------------------------------------------------------------------------
--NIGHTSTORM
----------------------------------------------------------------------------------------
UFD4 					= CreateElement "ceStringPoly"
UFD4.name 				= "ufd buttons"
UFD4.material 			= UFD_GRN
UFD4.value 				= "UHF"
UFD4.stringdefs 		= {0.0050, 0.0050, 0.0004, 0.001}
UFD4.alignment 			= "CenterCenter"
UFD4.formats 			= {"%s"}
UFD4.h_clip_relation    = h_clip_relations.COMPARE
UFD4.level 				= 10
UFD4.init_pos 			= {-24.5, -43.5, 0}
UFD4.init_rot 			= {0, 0, 0}
UFD4.element_params 	= {"L_WAR_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
UFD4.controllers		= {{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(UFD4)
----------------------------------------------------------------------------------------
UFD5 					= CreateElement "ceStringPoly"
UFD5.name 				= "ufd buttons"
UFD5.material 			= UFD_GRN
UFD5.value 				= "VHF"
UFD5.stringdefs 		= {0.0050, 0.0050, 0.0004, 0.001}
UFD5.alignment 			= "CenterCenter"
UFD5.formats 			= {"%s"}
UFD5.h_clip_relation    = h_clip_relations.COMPARE
UFD5.level 				= 10
UFD5.init_pos 			= {0, -43.5, 0}
UFD5.init_rot 			= {0, 0, 0}
UFD5.element_params 	= {"L_WAR_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
UFD5.controllers		= {{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(UFD5)
----------------------------------------------------------------------------------------
UFD6 					= CreateElement "ceStringPoly"
UFD6.name 				= "ufd buttons"
UFD6.material 			= UFD_GRN
UFD6.value 				= "IFF"
UFD6.stringdefs 		= {0.0050, 0.0050, 0.0004, 0.001}
UFD6.alignment 			= "CenterCenter"
UFD6.formats 			= {"%s"}
UFD6.h_clip_relation    = h_clip_relations.COMPARE
UFD6.level 				= 10
UFD6.init_pos 			= {24.5, -43.5, 0}
UFD6.init_rot 			= {0, 0, 0}
UFD6.element_params 	= {"L_WAR_OPACITY","UFD_OPACITY",} --HOPE THIS WORKS G_OP_BACK
UFD6.controllers		= {{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(UFD6)
----------------------------------------------------------------------------------------
SWAP 					= CreateElement "ceStringPoly"
SWAP.name 				= "ufd buttons"
SWAP.material 			= UFD_GRN
SWAP.value 				= "SWAP"
SWAP.stringdefs 		= {0.0050, 0.0050, 0.0004, 0.001}
SWAP.alignment 			= "CenterCenter"
SWAP.formats 			= {"%s"}
SWAP.h_clip_relation    = h_clip_relations.COMPARE
SWAP.level 				= 10
SWAP.init_pos 			= {0, 43.5, 0}
SWAP.init_rot 			= {0, 0, 0}
SWAP.element_params 	= {"L_WAR_OPACITY","UFD_OPACITY",}
SWAP.controllers		= {{"parameter_in_range",0,0.9,1.1},
								{"opacity_using_parameter",1},
								}
Add(SWAP)
----------------------------------------------------------------------------------------------------------------
MENU1_TEXT 					    	= CreateElement "ceStringPoly"
MENU1_TEXT.name 				    = "menu"
MENU1_TEXT.material 			    = UFD_GRN
MENU1_TEXT.value 					= "UHF  01"
MENU1_TEXT.stringdefs 		    	= {0.0040, 0.0040, 0.0004, 0.001}
MENU1_TEXT.alignment 				= "CenterCenter"
MENU1_TEXT.formats 			    	= {"%s"}
MENU1_TEXT.h_clip_relation       	= h_clip_relations.COMPARE
MENU1_TEXT.level 					= 10
MENU1_TEXT.init_pos 			    = {-53, 42, 0}
MENU1_TEXT.init_rot 			    = {0, 0, 0}
MENU1_TEXT.element_params 	    	= {"L_WAR_OPACITY","UFD_OPACITY",}
MENU1_TEXT.controllers		    	= {{"opacity_using_parameter",1},{"parameter_in_range",0,0.9,1.1}}
Add(MENU1_TEXT)
----------------------------------------------------------------------------------------------------------------
MENU2_TEXT 					    	= CreateElement "ceStringPoly"
MENU2_TEXT.name 				    = "menu"
MENU2_TEXT.material 			    = UFD_GRN
MENU2_TEXT.value 					= "256.000"
MENU2_TEXT.stringdefs 		    	= {0.0040, 0.0040, 0.0004, 0.001}
MENU2_TEXT.alignment 				= "CenterCenter"
MENU2_TEXT.formats 			    	= {"%s"}
MENU2_TEXT.h_clip_relation       	= h_clip_relations.COMPARE
MENU2_TEXT.level 					= 10
MENU2_TEXT.init_pos 			    = {-53, 36, 0}
MENU2_TEXT.init_rot 			    = {0, 0, 0}
MENU2_TEXT.element_params 	    	= {"L_WAR_OPACITY","UFD_OPACITY",}
MENU2_TEXT.controllers		    	= {{"opacity_using_parameter",1},{"parameter_in_range",0,0.9,1.1}}
Add(MENU2_TEXT)
----------------------------------------------------------------------------------------------------------------
MENU3_TEXT 					    	= CreateElement "ceStringPoly"
MENU3_TEXT.name 				    = "menu"
MENU3_TEXT.material 			    = UFD_GRN
MENU3_TEXT.value 					= "VHF  02"
MENU3_TEXT.stringdefs 		    	= {0.0040, 0.0040, 0.0004, 0.001}
MENU3_TEXT.alignment 				= "CenterCenter"
MENU3_TEXT.formats 			    	= {"%s"}
MENU3_TEXT.h_clip_relation       	= h_clip_relations.COMPARE
MENU3_TEXT.level 					= 10
MENU3_TEXT.init_pos 			    = {53, 42, 0}
MENU3_TEXT.init_rot 			    = {0, 0, 0}
MENU3_TEXT.element_params 	    	= {"L_WAR_OPACITY","UFD_OPACITY",}
MENU3_TEXT.controllers		    	= {{"opacity_using_parameter",1},{"parameter_in_range",0,0.9,1.1}}
Add(MENU3_TEXT)
----------------------------------------------------------------------------------------------------------------
MENU4_TEXT 					    	= CreateElement "ceStringPoly"
MENU4_TEXT.name 				    = "menu"
MENU4_TEXT.material 			    = UFD_GRN
MENU4_TEXT.value 					= "143.000"
MENU4_TEXT.stringdefs 		    	= {0.0040, 0.0040, 0.0004, 0.001}
MENU4_TEXT.alignment 				= "CenterCenter"
MENU4_TEXT.formats 			    	= {"%s"}
MENU4_TEXT.h_clip_relation       	= h_clip_relations.COMPARE
MENU4_TEXT.level 					= 10
MENU4_TEXT.init_pos 			    = {53, 36, 0}
MENU4_TEXT.init_rot 			    = {0, 0, 0}
MENU4_TEXT.element_params 	    	= {"L_WAR_OPACITY","UFD_OPACITY",}
MENU4_TEXT.controllers		    	= {{"opacity_using_parameter",1},{"parameter_in_range",0,0.9,1.1}}
Add(MENU4_TEXT)
----------------------------------------------------------------------------------------------------------------
--NIGHTSTORM
----------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------APU-READY
APURUN 					= CreateElement "ceStringPoly"
APURUN.name 			= "lgen"
APURUN.material 		= UFD_YEL --FONT_RPM--
APURUN.value 			= "APU SPOOL"
APURUN.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
APURUN.alignment 		= "CenterCenter"
APURUN.formats 			= {"%s"}
APURUN.h_clip_relation  = h_clip_relations.COMPARE
APURUN.level 			= 10
APURUN.init_rot 		= {0, 0, 0}
APURUN.init_pos 		= {0, 36, 0}
APURUN.element_params = {"L_WAR_OPACITY","APU_SPOOL","UFD_OPACITY"} --HOPE THIS WORKS G_OP_BACK
APURUN.controllers	= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
 Add(APURUN)
-----------------------------------------------------
------------------------------------------------------------------------------------------------------------------------APU-READY
APUREADY 					= CreateElement "ceStringPoly"
APUREADY.name 			= "lgen"
APUREADY.material 		= UFD_GRN --FONT_RPM--
APUREADY.value 			= "APU READY"
APUREADY.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
APUREADY.alignment 		= "CenterCenter"
APUREADY.formats 			= {"%s"}
APUREADY.h_clip_relation  = h_clip_relations.COMPARE
APUREADY.level 			= 10
APUREADY.init_rot 		= {0, 0, 0}
APUREADY.init_pos 		= {0, 36, 0}
APUREADY.element_params = {"L_WAR_OPACITY","APU_READY","UFD_OPACITY"} --HOPE THIS WORKS G_OP_BACK
APUREADY.controllers	= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
 Add(APUREADY)
-----------------------------------------------------
Lgen 					= CreateElement "ceStringPoly"
Lgen.name 			= "lgen"
Lgen.material 		= UFD_RED --FONT_RPM--
Lgen.value 			= "L GEN OUT"
Lgen.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
Lgen.alignment 		= "CenterCenter"
Lgen.formats 			= {"%s"}
Lgen.h_clip_relation  = h_clip_relations.COMPARE
Lgen.level 			= 10
Lgen.init_rot 		= {0, 0, 0}
Lgen.init_pos 		= {0, 30, 0}
Lgen.element_params 	= {"L_WAR_OPACITY","L_GEN_OUT","UFD_OPACITY"}
Lgen.controllers		= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
Add(Lgen)
------------------------------------------------------
Rgen 					= CreateElement "ceStringPoly"
Rgen.name 			= "rgen"
Rgen.material 		= UFD_RED --FONT_RPM--
Rgen.value 			= "R GEN OUT"
Rgen.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
Rgen.alignment 		= "CenterCenter"
Rgen.formats 			= {"%s"}
Rgen.h_clip_relation  = h_clip_relations.COMPARE
Rgen.level 			= 10
Rgen.init_rot 		= {0, 0, 0}
Rgen.init_pos 		= {0, 24, 0}
Rgen.element_params 	= {"L_WAR_OPACITY","R_GEN_OUT","UFD_OPACITY"}
Rgen.controllers		= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
Add(Rgen)
------------------------------------------------------
hyd 					= CreateElement "ceStringPoly"
hyd.name 			= "hyd"
hyd.material 		= UFD_RED --FONT_RPM--
hyd.value 			= "HYDRAULIC"
hyd.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
hyd.alignment 		= "CenterCenter"
hyd.formats 			= {"%s"}
hyd.h_clip_relation  = h_clip_relations.COMPARE
hyd.level 			= 10
hyd.init_rot 		= {0, 0, 0}
hyd.init_pos 		= {0, 18, 0}
hyd.element_params 	= {"L_WAR_OPACITY","HYD_LIGHT","UFD_OPACITY"}
hyd.controllers		= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
Add(hyd)
------------------------------------------------------
oilpress 					= CreateElement "ceStringPoly"
oilpress.name 			= "oil"
oilpress.material 		= UFD_RED --FONT_RPM--
oilpress.value 			= "OIL PRESS"
oilpress.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
oilpress.alignment 		= "CenterCenter"
oilpress.formats 			= {"%s"}
oilpress.h_clip_relation  = h_clip_relations.COMPARE
oilpress.level 				= 10
oilpress.init_rot 			= {0, 0, 0}
oilpress.init_pos 			= {0, 12, 0}
oilpress.element_params 	= {"L_WAR_OPACITY","OIL_LIGHT","UFD_OPACITY"}
oilpress.controllers		= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
Add(oilpress)
------------------------------------------------------
canopy 					= CreateElement "ceStringPoly"
canopy.name 			= "canopy"
canopy.material 		= UFD_RED --FONT_RPM--
canopy.value 			= "CANOPY UNLOCK"
canopy.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
canopy.alignment 		= "CenterCenter"
canopy.formats 			= {"%s"}
canopy.h_clip_relation  = h_clip_relations.COMPARE
canopy.level 			= 10
canopy.init_rot 		= {0, 0, 0}
canopy.init_pos 		= {0, 6, 0}
canopy.element_params 	= {"L_WAR_OPACITY","CANOPY_LIGHT","UFD_OPACITY"} --get_param_handle
canopy.controllers		= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
Add(canopy)
------------------------------------------------------------------------------------------------------------------------Master Caution Warning Light
master_caution 					= CreateElement "ceStringPoly"
master_caution.name 			= "master_caution"
master_caution.material 		= UFD_YEL --FONT_RPM--
master_caution.value 			= "MASTER CAUTION"
master_caution.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
master_caution.alignment 		= "CenterCenter"
master_caution.formats 			= {"%s"}
master_caution.h_clip_relation  = h_clip_relations.COMPARE
master_caution.level 			= 10
master_caution.init_pos 		= {0, 0, 0}
master_caution.init_rot 		= {0, 0, 0}
master_caution.element_params 	= {"L_WAR_OPACITY","CAUTION_LIGHT","UFD_OPACITY"} --get_param_handle
master_caution.controllers		= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
Add(master_caution)
--Bingo
BingoFuel 					= CreateElement "ceStringPoly"
BingoFuel.name 				= "bingo"
BingoFuel.material 			= UFD_YEL --FONT_RPM--
BingoFuel.value 			= "FUEL LOW"
BingoFuel.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
BingoFuel.alignment 		= "CenterCenter"
BingoFuel.formats 			= {"%s"}
BingoFuel.h_clip_relation  = h_clip_relations.COMPARE
BingoFuel.level 			= 10
BingoFuel.init_rot 		= {0, 0, 0}
BingoFuel.init_pos 		= {0, -6, 0}
BingoFuel.element_params 	= {"L_WAR_OPACITY","BINGO_LIGHT","UFD_OPACITY"} --get_param_handle
BingoFuel.controllers		= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
Add(BingoFuel)
--Flaps
FlapsM 					= CreateElement "ceStringPoly"
FlapsM.name 				= "flap"
FlapsM.material 			= UFD_YEL --FONT_RPM--
FlapsM.value 			= "FLAPS"
FlapsM.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
FlapsM.alignment 		= "CenterCenter"
FlapsM.formats 			= {"%s"}
FlapsM.h_clip_relation  = h_clip_relations.COMPARE
FlapsM.level 			= 10
FlapsM.init_rot 		= {0, 0, 0}
FlapsM.init_pos 		= {0, -12, 0}
FlapsM.element_params 	= {"L_WAR_OPACITY","FLAPS_MOVE","UFD_OPACITY"} --get_param_handle
FlapsM.controllers	= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
Add(FlapsM)
--Flaps
Flaps 					= CreateElement "ceStringPoly"
Flaps.name 				= "flap"
Flaps.material 			= UFD_TEAL --FONT_RPM--
Flaps.value 			= "FLAPS"
Flaps.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
Flaps.alignment 		= "CenterCenter"
Flaps.formats 			= {"%s"}
Flaps.h_clip_relation  = h_clip_relations.COMPARE
Flaps.level 			= 10
Flaps.init_rot 		= {0, 0, 0}
Flaps.init_pos 		= {0, -12, 0}
Flaps.element_params 	= {"L_WAR_OPACITY","FLAPS_DOWN","UFD_OPACITY"} --get_param_handle
Flaps.controllers		= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
Add(Flaps)
--Speed Brake	
SpdBrake 					= CreateElement "ceStringPoly"
SpdBrake.name 				= "spd"
SpdBrake.material 			= UFD_TEAL --FONT_RPM--
SpdBrake.value 			= "SPD BRK OUT"
SpdBrake.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
SpdBrake.alignment 		= "CenterCenter"
SpdBrake.formats 			= {"%s"}
SpdBrake.h_clip_relation  = h_clip_relations.COMPARE
SpdBrake.level 			= 10
SpdBrake.init_rot 		= {0, 0, 0}
SpdBrake.init_pos 		= {0, -18, 0}
SpdBrake.element_params 	= {"L_WAR_OPACITY","SPD_BRK_LIGHT","UFD_OPACITY"} --get_param_handle
SpdBrake.controllers		= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
Add(SpdBrake)
--------------------------------------------------------ATC------------------------------------------------------
--ATC FlyingAlex
AutoThrApp 					= CreateElement "ceStringPoly"
AutoThrApp.name 				= "atc_app"
AutoThrApp.material 			= UFD_TEAL --FONT_RPM--
AutoThrApp.value 				= "ATC APPROACH"
AutoThrApp.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
AutoThrApp.alignment 		= "CenterCenter"
AutoThrApp.formats 			= {"%s"}
AutoThrApp.h_clip_relation  = h_clip_relations.COMPARE
AutoThrApp.level 			= 10
AutoThrApp.init_rot 		= {0, 0, 0}
AutoThrApp.init_pos 		= {0, 6, 0}. -- You can't have canopy unlock with the ATC open on ground so use the canopy status text position
AutoThrApp.element_params 	= {"L_WAR_OPACITY","ATC_APPROACH","UFD_OPACITY"} --get_param_handle
AutoThrApp.controllers		= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
Add(AutoThrApp)

AutoThrCru 					= CreateElement "ceStringPoly"
AutoThrCru.name 				= "atc_cru"
AutoThrCru.material 			= UFD_TEAL --FONT_RPM--
AutoThrCru.value 				= "ATC CRUISE"
AutoThrCru.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
AutoThrCru.alignment 		= "CenterCenter"
AutoThrCru.formats 			= {"%s"}
AutoThrCru.h_clip_relation  = h_clip_relations.COMPARE
AutoThrCru.level 			= 10
AutoThrCru.init_rot 		= {0, 0, 0}
AutoThrCru.init_pos 		= {0, 6, 0}
AutoThrCru.element_params 	= {"L_WAR_OPACITY","ATC_CRUISE","UFD_OPACITY"} --get_param_handle
AutoThrCru.controllers		= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
Add(AutoThrCru)

--AAR	
AARReady 					= CreateElement "ceStringPoly"
AARReady.name 				= "aar"
AARReady.material 			= UFD_YEL			--NIGHTSTORM UFD_TEAL
AARReady.value 				= "AAR DOOR"		--NIGHTSTORM AAR READY
AARReady.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
AARReady.alignment 			= "CenterCenter"
AARReady.formats 			= {"%s"}
AARReady.h_clip_relation  	= h_clip_relations.COMPARE
AARReady.level 				= 10
AARReady.init_rot 			= {0, 0, 0}
AARReady.init_pos 			= {0, -24, 0}
AARReady.element_params 	= {"L_WAR_OPACITY","AAR_LIGHT","UFD_OPACITY"} --get_param_handle
AARReady.controllers		= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
Add(AARReady)
---------------------------------------------------CENTER BAY------------------------------------------------------
CENTERBAYCOPEN 						= CreateElement "ceStringPoly"
CENTERBAYCOPEN.name 				= "aar"
CENTERBAYCOPEN.material 			= UFD_YEL
CENTERBAYCOPEN.value 				= "BAY DOOR"
CENTERBAYCOPEN.stringdefs 			= {0.0040, 0.0040, 0.0004, 0.001}
CENTERBAYCOPEN.alignment 			= "CenterCenter"
CENTERBAYCOPEN.formats 				= {"%s"}
CENTERBAYCOPEN.h_clip_relation  	= h_clip_relations.COMPARE
CENTERBAYCOPEN.level 				= 10
CENTERBAYCOPEN.init_pos 			= {0, -24, 0}
CENTERBAYCOPEN.init_rot 			= {0, 0, 0}
CENTERBAYCOPEN.element_params 		= {"UFD_OPACITY","BAY_C_ARG","L_WAR_OPACITY"}
CENTERBAYCOPEN.controllers			= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,0.01,1.2}}
Add(CENTERBAYCOPEN)
----------------------------------------------------LEFT BAY-------------------------------------------------------
LEFTBAYCOPEN 					= CreateElement "ceStringPoly"
LEFTBAYCOPEN.name 				= "aar"
LEFTBAYCOPEN.material 			= UFD_YEL
LEFTBAYCOPEN.value 				= "BAY DOOR"
LEFTBAYCOPEN.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
LEFTBAYCOPEN.alignment 			= "CenterCenter"
LEFTBAYCOPEN.formats 			= {"%s"}
LEFTBAYCOPEN.h_clip_relation  	= h_clip_relations.COMPARE
LEFTBAYCOPEN.level 				= 10
LEFTBAYCOPEN.init_pos 			= {0, -24, 0}
LEFTBAYCOPEN.init_rot 			= {0, 0, 0}
--LEFTBAYCOPEN.element_params 	= {"UFD_OPACITY","BAY_L_ARG","L_WAR_OPACITY"}
--LEFTBAYCOPEN.controllers		= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,0.01,1.2}}
LEFTBAYCOPEN.element_params 	= {"UFD_OPACITY","L_WAR_OPACITY","BAY_L_ARG","BAY_STATION"}	--LEFT side will ONLY light up IF the left bay is selected.
LEFTBAYCOPEN.controllers		= {{"opacity_using_parameter",0},{"parameter_in_range",2,0.01,1.2},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,0.9,1.1}}
Add(LEFTBAYCOPEN)
-----------------------------------------------------RIGHT BAY--------------------------------------------------------
RIGHTBAYCOPEN 					= CreateElement "ceStringPoly"
RIGHTBAYCOPEN.name 				= "aar"
RIGHTBAYCOPEN.material 			= UFD_YEL
RIGHTBAYCOPEN.value 			= "BAY DOOR"
RIGHTBAYCOPEN.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
RIGHTBAYCOPEN.alignment 		= "CenterCenter"
RIGHTBAYCOPEN.formats 			= {"%s"}
RIGHTBAYCOPEN.h_clip_relation  	= h_clip_relations.COMPARE
RIGHTBAYCOPEN.level 			= 10
RIGHTBAYCOPEN.init_pos 			= {0, -24, 0}
RIGHTBAYCOPEN.init_rot 			= {0, 0, 0}
RIGHTBAYCOPEN.element_params 	= {"UFD_OPACITY","BAY_R_ARG","L_WAR_OPACITY"}
RIGHTBAYCOPEN.controllers		= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,0.01,1.2}}
Add(RIGHTBAYCOPEN)
------------
--CHAFF
CHAFF 					= CreateElement "ceStringPoly"
CHAFF.name 				= "chaff"
CHAFF.material 			= UFD_YEL --FONT_RPM--
CHAFF.value 			= "CHAFF"
CHAFF.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
CHAFF.alignment 		= "CenterCenter"
CHAFF.formats 			= {"%s"}
CHAFF.h_clip_relation  = h_clip_relations.COMPARE
CHAFF.level 			= 10
CHAFF.init_rot 			= {0, 0, 0}
CHAFF.init_pos 			= {-20, -36, 0}
CHAFF.element_params 	= {"L_WAR_OPACITY","CHAFF_LIGHT","UFD_OPACITY"} --get_param_handle
CHAFF.controllers		= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
Add(CHAFF)
--Flare
FLARE 					= CreateElement "ceStringPoly"
FLARE.name 				= "chaff"
FLARE.material 			= UFD_YEL --FONT_RPM--
FLARE.value 			= "FLARE"
FLARE.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
FLARE.alignment 		= "CenterCenter"
FLARE.formats 			= {"%s"}
FLARE.h_clip_relation  = h_clip_relations.COMPARE
FLARE.level 			= 10
FLARE.init_rot 		= {0, 0, 0}
FLARE.init_pos 		= {20, -36, 0}
FLARE.element_params 	= {"L_WAR_OPACITY","FLARE_LIGHT","UFD_OPACITY"} --get_param_handle
FLARE.controllers		= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
Add(FLARE)
-------------------------------------------------------------
JAMMER 					= CreateElement "ceStringPoly"
JAMMER.name 				= "chaff"
JAMMER.material 			= UFD_YEL --FONT_RPM--
JAMMER.value 			= "ECM"
JAMMER.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
JAMMER.alignment 		= "CenterCenter"
JAMMER.formats 			= {"%s"}
JAMMER.h_clip_relation  = h_clip_relations.COMPARE
JAMMER.level 			= 10
JAMMER.init_rot 		= {0, 0, 0}
JAMMER.init_pos 		= {0, -36, 0}
JAMMER.element_params 	= {"L_WAR_OPACITY","ECM_ARG","UFD_OPACITY"} --get_param_handle
JAMMER.controllers		= 	{{"parameter_in_range",0,0.9,1.1}, {"parameter_in_range",1,0.9,1.1}, {"opacity_using_parameter",2}}
Add(JAMMER)
-------------------------------------------------------------
GPOWER 					= CreateElement "ceStringPoly"
GPOWER.name 				= "chaff"
GPOWER.material 			= UFD_GRN --FONT_RPM--
GPOWER.value 			= "GROUND POWER"
GPOWER.stringdefs 		= {0.0040, 0.0040, 0.0004, 0.001}
GPOWER.alignment 		= "CenterCenter"
GPOWER.formats 			= {"%s"}
GPOWER.h_clip_relation  = h_clip_relations.COMPARE
GPOWER.level 			= 10
GPOWER.init_rot 		= {0, 0, 0}
GPOWER.init_pos 		= {0, -30, 0}
GPOWER.element_params 	= {"L_WAR_OPACITY","GROUND_POWER","UFD_OPACITY"} --get_param_handle
GPOWER.controllers		= 	{	{"parameter_in_range",0,0.9,1.1},
								{"parameter_in_range",1,0.9,1.1}, 
								{"opacity_using_parameter",2}
							}
Add(GPOWER)
--------------------------------------------------------------------------------------------------- AUTO G
INFO_FCS_AUTO 					        = CreateElement "ceStringPoly"
INFO_FCS_AUTO.name 				        = "menu"
INFO_FCS_AUTO.material 			        = UFD_GRN
INFO_FCS_AUTO.value 				    = "AUTO ACL"					--NIGHTSTORM "AUTO G"
INFO_FCS_AUTO.stringdefs 		        = {0.0040, 0.0040, 0.0004, 0.001}
INFO_FCS_AUTO.alignment 			    = "LeftCenter"
INFO_FCS_AUTO.formats 			        = {"%s"}
INFO_FCS_AUTO.h_clip_relation           = h_clip_relations.COMPARE
INFO_FCS_AUTO.level 				    = 10
INFO_FCS_AUTO.init_pos 			        = {-64, -24, 0}
INFO_FCS_AUTO.init_rot 			        = {0, 0, 0}
INFO_FCS_AUTO.element_params 	        = {"UFD_OPACITY","L_WAR_OPACITY","HUD_MODE","FCS_MODE"}
INFO_FCS_AUTO.controllers		        = {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,0.9,1.1},{"parameter_in_range",3,-0.1,0.1}}
Add(INFO_FCS_AUTO)
--------------------------------------------------------------------------------------------------- AUTO G
INFO_FCS_AUTO 					        = CreateElement "ceStringPoly"
INFO_FCS_AUTO.name 				        = "menu"
INFO_FCS_AUTO.material 			        = UFD_GRN
INFO_FCS_AUTO.value 				    = "AUTO AOA"
INFO_FCS_AUTO.stringdefs 		        = {0.0040, 0.0040, 0.0004, 0.001}
INFO_FCS_AUTO.alignment 			    = "LeftCenter"
INFO_FCS_AUTO.formats 			        = {"%s"}
INFO_FCS_AUTO.h_clip_relation           = h_clip_relations.COMPARE
INFO_FCS_AUTO.level 				     = 10
INFO_FCS_AUTO.init_pos 			        = {-64, -24, 0}
INFO_FCS_AUTO.init_rot 			        = {0, 0, 0}
INFO_FCS_AUTO.element_params 	        = {"UFD_OPACITY","L_WAR_OPACITY","HUD_MODE","FCS_MODE"}
INFO_FCS_AUTO.controllers		        =   {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,1.1,9},{"parameter_in_range",3,-0.1,0.1}}
Add(INFO_FCS_AUTO)

--------------------------------------------------------------------------------------------------- ORIDE
INFO_FCS_ORIDE 					        = CreateElement "ceStringPoly"
INFO_FCS_ORIDE.name 				    = "menu"
INFO_FCS_ORIDE.material 			    = UFD_RED
INFO_FCS_ORIDE.value 				    = "FCS ACM"						--NIGHTSTORM FCS ORIDE
INFO_FCS_ORIDE.stringdefs 		        = {0.0040, 0.0040, 0.0004, 0.001}
INFO_FCS_ORIDE.alignment 			    = "LeftCenter"
INFO_FCS_ORIDE.formats 			        = {"%s"}
INFO_FCS_ORIDE.h_clip_relation          = h_clip_relations.COMPARE
INFO_FCS_ORIDE.level 				    = 10
INFO_FCS_ORIDE.init_pos 			    = {-64, -24, 0}
INFO_FCS_ORIDE.init_rot 			    = {0, 0, 0}
INFO_FCS_ORIDE.element_params 	        = {"UFD_OPACITY","L_WAR_OPACITY","FCS_MODE"}
INFO_FCS_ORIDE.controllers		        =   {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,2.9,3.1}}
Add(INFO_FCS_ORIDE)
--------------------------------------------------------------------------------------------------- AOA
INFO_FCS_G 					        = CreateElement "ceStringPoly"
INFO_FCS_G.name 				    = "menu"
INFO_FCS_G.material 			    = UFD_YEL
INFO_FCS_G.value 				    = "FCS AOA"
INFO_FCS_G.stringdefs 		        = {0.0040, 0.0040, 0.0004, 0.001}
INFO_FCS_G.alignment 			    = "LeftCenter"
INFO_FCS_G.formats 			        = {"%s"}
INFO_FCS_G.h_clip_relation          = h_clip_relations.COMPARE
INFO_FCS_G.level 				    = 10
INFO_FCS_G.init_pos 			    = {-64, -24, 0}
INFO_FCS_G.init_rot 			    = {0, 0, 0}
INFO_FCS_G.element_params 	        = {"UFD_OPACITY","L_WAR_OPACITY","FCS_MODE"}
INFO_FCS_G.controllers		        =   {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,0.9,1.1}}
Add(INFO_FCS_G)
--------------------------------------------------------------------------------------------------- ACL
INFO_FCS_A 					        = CreateElement "ceStringPoly"
INFO_FCS_A.name 				    = "menu"
INFO_FCS_A.material 			    = UFD_YEL
INFO_FCS_A.value 				    = "FCS ACL"		--NIGHTSTORM	"FCS G"
INFO_FCS_A.stringdefs 		        = {0.0040, 0.0040, 0.0004, 0.001}
INFO_FCS_A.alignment 			    = "LeftCenter"
INFO_FCS_A.formats 			        = {"%s"}
INFO_FCS_A.h_clip_relation          = h_clip_relations.COMPARE
INFO_FCS_A.level 				    = 10
INFO_FCS_A.init_pos 			    = {-64, -24, 0}
INFO_FCS_A.init_rot 			    = {0, 0, 0}
INFO_FCS_A.element_params 	        = {"UFD_OPACITY","L_WAR_OPACITY","FCS_MODE"}
INFO_FCS_A.controllers		        =   {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,1.9,2.1}}
Add(INFO_FCS_A)
-------------------------------------------------------------MACH------------------------------------------------------------------------------------------------
MACH_TXT 					    	= CreateElement "ceStringPoly"
MACH_TXT.name 				    	= "MACH_TXT"
MACH_TXT.material 			    	= UFD_GRN
MACH_TXT.value 				    	= "MACH:"
MACH_TXT.stringdefs 		        = {0.0040, 0.0040, 0.0004, 0.001}
MACH_TXT.alignment 			    	= "LeftCenter"
MACH_TXT.formats 			    	= {"%s"}
MACH_TXT.h_clip_relation         	= h_clip_relations.COMPARE
MACH_TXT.level 				    	= 10
MACH_TXT.init_pos 			    	= {-64, -30, 0}
MACH_TXT.init_rot 			    	= {0, 0, 0}
MACH_TXT.element_params 	        = {"UFD_OPACITY","L_WAR_OPACITY"}
MACH_TXT.controllers		        = {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(MACH_TXT)
-------------------------------------------------------------MACH------------------------------------------------------------------------------------------------
M_NUM				        		= CreateElement "ceStringPoly"
M_NUM.name				    		= "M_NUM"
M_NUM.material			    		= UFD_FONT
M_NUM.init_pos			    		= {-48.5, -30, 0}
M_NUM.alignment			    		= "LeftCenter"
M_NUM.stringdefs					= {0.0040, 0.0040, 0, 0.0}
M_NUM.additive_alpha				= true
M_NUM.collimated					= false
M_NUM.isdraw						= true	
M_NUM.use_mipfilter		    		= true
M_NUM.h_clip_relation	    		= h_clip_relations.COMPARE
M_NUM.level				    		= 10
M_NUM.element_params				= {"UFD_OPACITY","MACH","L_WAR_OPACITY"}
M_NUM.formats			    		= {"%02.2f"}--= {"%02.0f"}
M_NUM.controllers		    		=  {
                                       {"opacity_using_parameter",0},
                                       {"text_using_parameter",1,0},
                                       {"parameter_in_range",2,0.9,1.1}
										}
Add(M_NUM)
-------------------------------------------------------------GFORCE-------------------------------------------------------------
G_NUM				    = CreateElement "ceStringPoly"
G_NUM.name				= "G_NUM"
G_NUM.material			= UFD_FONT
G_NUM.init_pos			= {-51, -45, 0}
G_NUM.alignment			= "CenterCenter"
G_NUM.stringdefs		= {0.0070, 0.0070, 0, 0.0}
G_NUM.additive_alpha	= true
G_NUM.collimated		= false
G_NUM.isdraw			= true	
G_NUM.use_mipfilter		= true
G_NUM.h_clip_relation	= h_clip_relations.COMPARE
G_NUM.level				= 10
G_NUM.element_params	= {"UFD_OPACITY","GFORCE","L_WAR_OPACITY"}
G_NUM.formats			= {"%02.2f"}--= {"%02.0f"}
G_NUM.controllers		=   {
                                        {"opacity_using_parameter",0},
                                        {"text_using_parameter",1,0},
                                        {"parameter_in_range",2,0.9,1.1}
                                    }
                                
Add(G_NUM)
-------------------------------------------------------------AOA------------------------------------------------------------------------------------------------
AOA_NUM				    = CreateElement "ceStringPoly"
AOA_NUM.name				= "AOA_NUM"
AOA_NUM.material			= UFD_FONT
AOA_NUM.init_pos			= {51, -45, 0}
AOA_NUM.alignment			= "CenterCenter"
AOA_NUM.stringdefs			= {0.0070, 0.0070, 0, 0.0}
AOA_NUM.additive_alpha		= true
AOA_NUM.collimated			= false
AOA_NUM.isdraw				= true	
AOA_NUM.use_mipfilter		= true
AOA_NUM.h_clip_relation	    = h_clip_relations.COMPARE
AOA_NUM.level				= 10
AOA_NUM.element_params		= {"UFD_OPACITY","AOA","L_WAR_OPACITY"}
AOA_NUM.formats			    = {"%02.2f"}--= {"%02.0f"}
AOA_NUM.controllers		    =   {
                                        {"opacity_using_parameter",0},
                                        {"text_using_parameter",1,0},
                                        {"parameter_in_range",2,0.9,1.1}
                                    }
                                
Add(AOA_NUM)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--NIGHTSTORM ALTITUDE DISPLAYS
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local WARNING_BARO					= CreateElement "ceStringPoly"
WARNING_BARO.name					= "Baro Alt"
WARNING_BARO.material				= UFD_GRN
WARNING_BARO.init_pos				= {-53, 15, 0}
WARNING_BARO.alignment				= "CenterCenter"
WARNING_BARO.stringdefs				= {0.007, 0.007, 0, 0.0}
WARNING_BARO.additive_alpha			= true
WARNING_BARO.collimated				= false
WARNING_BARO.isdraw					= true
WARNING_BARO.use_mipfilter			= true
WARNING_BARO.h_clip_relation		= h_clip_relations.COMPARE
WARNING_BARO.level					= 10
WARNING_BARO.element_params			= {"UFD_OPACITY","BAROALT","L_WAR_OPACITY"}
WARNING_BARO.formats				= {"%05.0f"}
WARNING_BARO.controllers		   	= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(WARNING_BARO)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local WARNING_RADALT				= CreateElement "ceStringPoly"
WARNING_RADALT.name					= "rad Alt"
WARNING_RADALT.material				= UFD_GRN
WARNING_RADALT.init_pos				= {53, 15, 0}
WARNING_RADALT.alignment			= "CenterCenter"
WARNING_RADALT.stringdefs			= {0.007, 0.007, 0, 0.0}
WARNING_RADALT.additive_alpha		= true
WARNING_RADALT.collimated			= false
WARNING_RADALT.isdraw				= true	
WARNING_RADALT.use_mipfilter		= true
WARNING_RADALT.h_clip_relation		= h_clip_relations.COMPARE
WARNING_RADALT.level				= 10
WARNING_RADALT.element_params		= {"UFD_OPACITY","RADALT","L_WAR_OPACITY"}
WARNING_RADALT.formats				= {"%05.0f"}
WARNING_RADALT.controllers			= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(WARNING_RADALT)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--NIGHTSTORM AIRSPEED DISPLAYS
------------------------------------------------------------TAS---------------------------------------------------------------------------------------------------
T_NUM				        = CreateElement "ceStringPoly"
T_NUM.name				    = "I_NUM"
T_NUM.material			    = UFD_FONT
T_NUM.init_pos			    = {53, 3, 0} --L-R,U-D,F-B
T_NUM.alignment			    = "CenterCenter"
T_NUM.stringdefs			= {0.007, 0.007, 0, 0.0}
T_NUM.additive_alpha		= true
T_NUM.collimated			= false
T_NUM.isdraw				= true	
T_NUM.use_mipfilter		    = true
T_NUM.h_clip_relation	    = h_clip_relations.COMPARE
T_NUM.level				    = 10
--T_NUM.parent_element        = M_NUM.name
T_NUM.element_params		= {"UFD_OPACITY","TAS","L_WAR_OPACITY"}
T_NUM.formats			    = {"%03.0f"}--= {"%02.0f"}
T_NUM.controllers		    =   {
                                        {"opacity_using_parameter",0},
                                        {"text_using_parameter",1,0},
                                        {"parameter_in_range",2,0.9,1.1}
                                    }
                                
Add(T_NUM)
------------------------------------------------------------IAS---------------------------------------------------------------------------------------------------
I_NUM				        = CreateElement "ceStringPoly"
I_NUM.name				    = "I_NUM"
I_NUM.material			    = UFD_FONT
I_NUM.init_pos			    = {-53, 3, 0} --L-R,U-D,F-B
I_NUM.alignment			    = "CenterCenter"
I_NUM.stringdefs			= {0.007, 0.007, 0, 0.0}
I_NUM.additive_alpha		= true
I_NUM.collimated			= false
I_NUM.isdraw				= true	
I_NUM.use_mipfilter		    = true
I_NUM.h_clip_relation	    = h_clip_relations.COMPARE
I_NUM.level				    = 10
--I_NUM.parent_element        = M_NUM.name
I_NUM.element_params		= {"UFD_OPACITY","IAS","L_WAR_OPACITY"}
I_NUM.formats			    = {"%03.0f"}--= {"%02.0f"}
I_NUM.controllers		    =   {
                                        {"opacity_using_parameter",0},
                                        {"text_using_parameter",1,0},
                                        {"parameter_in_range",2,0.9,1.1}
                                    }
                                
Add(I_NUM)
-------------------------------------------------------------IFF STATIC-------------------------------------------------------------------------------------------
IFF_TEXT 					    	= CreateElement "ceStringPoly"
IFF_TEXT.name 				    	= "IFF_TEXT"
IFF_TEXT.material 			    	= UFD_GRN
IFF_TEXT.value 						= "IFF: NORM"
IFF_TEXT.stringdefs 		    	= {0.0040, 0.0040, 0.0004, 0.001}
IFF_TEXT.alignment 					= "LeftCenter"		--RightCenter
IFF_TEXT.formats 			    	= {"%s"}
IFF_TEXT.h_clip_relation       		= h_clip_relations.COMPARE
IFF_TEXT.level 						= 10
IFF_TEXT.init_pos 			    	= {-64, -18, 0}	--= {64, -18, 0}
IFF_TEXT.init_rot 			    	= {0, 0, 0}
IFF_TEXT.element_params 	    	= {"L_WAR_OPACITY","UFD_OPACITY",}
IFF_TEXT.controllers		    	= {{"opacity_using_parameter",1},{"parameter_in_range",0,0.9,1.1}}
Add(IFF_TEXT)
-------------------------------------------------------------INS STATIC-------------------------------------------------------------------------------------------
--[[
INS_TEXT 					    	= CreateElement "ceStringPoly"
INS_TEXT.name 				    	= "INS_TEXT"
INS_TEXT.material 			    	= UFD_GRN
INS_TEXT.value 						= "INS: NAV"
INS_TEXT.stringdefs 		    	= {0.0040, 0.0040, 0.0004, 0.001}
INS_TEXT.alignment 					= "LeftCenter"
INS_TEXT.formats 			    	= {"%s"}
INS_TEXT.h_clip_relation       		= h_clip_relations.COMPARE
INS_TEXT.level 						= 10
INS_TEXT.init_pos 			    	= {-64, -18, 0}
INS_TEXT.init_rot 			    	= {0, 0, 0}
INS_TEXT.element_params 	    	= {"L_WAR_OPACITY","UFD_OPACITY",}
INS_TEXT.controllers		    	= {{"opacity_using_parameter",1},{"parameter_in_range",0,0.9,1.1}}
Add(INS_TEXT)
--]]
-------------------------------------------------------------VVI------------------------------------------------------------------------------------------------
VV_TXT 					    = CreateElement "ceStringPoly"
VV_TXT.name 				    = "VVI"
VV_TXT.material 			    = UFD_GRN
VV_TXT.value 				    = "VVI:"
VV_TXT.stringdefs 		        = {0.0038, 0.0040, 0.0004, 0.001}
VV_TXT.alignment 			    = "CenterCenter"
VV_TXT.formats 			        = {"%s"}
VV_TXT.h_clip_relation         = h_clip_relations.COMPARE
VV_TXT.level 				    = 10
VV_TXT.init_pos 			    = {43, -30, 0}
VV_TXT.init_rot 			    = {0, 0, 0}
VV_TXT.element_params 	        = {"UFD_OPACITY","L_WAR_OPACITY"}
VV_TXT.controllers		        = {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(VV_TXT)
----------------------------------
VV_NUM				        = CreateElement "ceStringPoly"
VV_NUM.name				    = "VV_NUM"
VV_NUM.material			    = UFD_FONT
VV_NUM.init_pos			    = {64, -30, 0}
VV_NUM.alignment			= "RightCenter"
VV_NUM.stringdefs			= {0.0040, 0.0040, 0, 0.0}
VV_NUM.additive_alpha		= true
VV_NUM.collimated			= false
VV_NUM.isdraw				= true	
VV_NUM.use_mipfilter		= true
VV_NUM.h_clip_relation	    = h_clip_relations.COMPARE
VV_NUM.level				= 10
VV_NUM.element_params		= {"UFD_OPACITY","VV","L_WAR_OPACITY"}
VV_NUM.formats			    = {"%05.0f"}
VV_NUM.controllers		    =   {
                                        {"opacity_using_parameter",0},
                                        {"text_using_parameter",1,0},
                                        {"parameter_in_range",2,0.9,1.1}
                                    }
                                
Add(VV_NUM)
-------------------------------------------------------------DIGITAL CLOCK--------------------------------------------------------------------------------------
-------------------------------------------------------------GMT------------------------------------------------------------------------------------------------
GMT_TEXT 					    	= CreateElement "ceStringPoly"
GMT_TEXT.name 				    	= "GMT_TEXT"
GMT_TEXT.material 			    	= UFD_GRN
GMT_TEXT.value 						= "T:"
GMT_TEXT.stringdefs 		    	= {0.0040, 0.0040, 0.0004, 0.001}
GMT_TEXT.alignment 					= "RightCenter"
GMT_TEXT.formats 			    	= {"%s"}
GMT_TEXT.h_clip_relation       		= h_clip_relations.COMPARE
GMT_TEXT.level 						= 10
GMT_TEXT.init_pos 			    	= {43, -18, 0}
GMT_TEXT.init_rot 			    	= {0, 0, 0}
GMT_TEXT.element_params 	    	= {"L_WAR_OPACITY","UFD_OPACITY",}
GMT_TEXT.controllers		    	= {{"opacity_using_parameter",1},{"parameter_in_range",0,0.9,1.1}}
Add(GMT_TEXT)
---------------------------------------------------------------HOURS------------------------------------------------------------------------------------------------
GMT_hours				        		= CreateElement "ceStringPoly"
GMT_hours.name				    		= "GMT_hours"
GMT_hours.material			   			= UFD_GRN
GMT_hours.init_pos			    		= {48, -18, 0}
GMT_hours.alignment						= "RightCenter"
GMT_hours.stringdefs					= {0.0040, 0.0040, 0, 0.0}
GMT_hours.additive_alpha				= true
GMT_hours.collimated					= false
GMT_hours.isdraw						= true	
GMT_hours.use_mipfilter					= true
GMT_hours.h_clip_relation	    		= h_clip_relations.COMPARE
GMT_hours.level							= 10
GMT_hours.element_params				= {"UFD_OPACITY","GMT_HOURS","L_WAR_OPACITY"}
GMT_hours.formats			    		= {"%02.0f"}
GMT_hours.controllers					= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(GMT_hours)
-------------------------------------------------------------TIME SEP 4---------------------------------------------------------------------------------------------
TIME2_TEXT 					    		= CreateElement "ceStringPoly"
TIME2_TEXT.name 				    	= "TIME2_TEXT"
TIME2_TEXT.material 			    	= UFD_GRN
TIME2_TEXT.value 						= ":"
TIME2_TEXT.stringdefs 		    		= {0.0040, 0.0040, 0.0004, 0.001}
TIME2_TEXT.alignment 					= "RightCenter"
TIME2_TEXT.formats 			    		= {"%s"}
TIME2_TEXT.h_clip_relation       		= h_clip_relations.COMPARE
TIME2_TEXT.level 						= 10
TIME2_TEXT.init_pos 			    	= {52, -18, 0}
TIME2_TEXT.init_rot 			    	= {0, 0, 0}
TIME2_TEXT.element_params 	    		= {"L_WAR_OPACITY","UFD_OPACITY",}
TIME2_TEXT.controllers		    		= {{"opacity_using_parameter",1},{"parameter_in_range",0,0.9,1.1}}
Add(TIME2_TEXT)
---------------------------------------------------------------MIN------------------------------------------------------------------------------------------------
GMT_mins				        		= CreateElement "ceStringPoly"
GMT_mins.name				    		= "GMT_mins"
GMT_mins.material			   			= UFD_GRN
GMT_mins.init_pos			    		= {56, -18, 0}
GMT_mins.alignment						= "RightCenter"
GMT_mins.stringdefs						= {0.0040, 0.0040, 0, 0.0}
GMT_mins.additive_alpha					= true
GMT_mins.collimated						= false
GMT_mins.isdraw							= true	
GMT_mins.use_mipfilter					= true
GMT_mins.h_clip_relation	    		= h_clip_relations.COMPARE
GMT_mins.level							= 10
GMT_mins.element_params					= {"UFD_OPACITY","GMT_MINS","L_WAR_OPACITY"}
GMT_mins.formats			    		= {"%02.0f"}
GMT_mins.controllers					= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(GMT_mins)
-------------------------------------------------------------TIME SEP 3---------------------------------------------------------------------------------------------
TIME1_TEXT 					    		= CreateElement "ceStringPoly"
TIME1_TEXT.name 				    	= "TIME1_TEXT"
TIME1_TEXT.material 			    	= UFD_GRN
TIME1_TEXT.value 						= ":"
TIME1_TEXT.stringdefs 		    		= {0.0040, 0.0040, 0.0004, 0.001}
TIME1_TEXT.alignment 					= "RightCenter"
TIME1_TEXT.formats 			    		= {"%s"}
TIME1_TEXT.h_clip_relation       		= h_clip_relations.COMPARE
TIME1_TEXT.level 						= 10
TIME1_TEXT.init_pos 			    	= {60, -18, 0}
TIME1_TEXT.init_rot 			    	= {0, 0, 0}
TIME1_TEXT.element_params 	    		= {"L_WAR_OPACITY","UFD_OPACITY",}
TIME1_TEXT.controllers		    		= {{"opacity_using_parameter",1},{"parameter_in_range",0,0.9,1.1}}
Add(TIME1_TEXT)
---------------------------------------------------------------SEC------------------------------------------------------------------------------------------------
GMT_sec				        			= CreateElement "ceStringPoly"
GMT_sec.name				    		= "GMT_sec"
GMT_sec.material			   			= UFD_GRN
GMT_sec.init_pos			    		= {64, -18, 0}
GMT_sec.alignment						= "RightCenter"
GMT_sec.stringdefs						= {0.0040, 0.0040, 0, 0.0}
GMT_sec.additive_alpha					= true
GMT_sec.collimated						= false
GMT_sec.isdraw							= true	
GMT_sec.use_mipfilter					= true
GMT_sec.h_clip_relation	    			= h_clip_relations.COMPARE
GMT_sec.level							= 10
GMT_sec.element_params					= {"UFD_OPACITY","GMT_SECS","L_WAR_OPACITY"}
GMT_sec.formats			    			= {"%02.0f"}
GMT_sec.controllers						= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(GMT_sec)

-------------------------------------------------------------MISSION TIMER--------------------------------------------------------------------------------------
-------------------------------------------------------------ELAPSED TIME------------------------------------------------------------------------------------------------
GMT_TEXT 					    	= CreateElement "ceStringPoly"
GMT_TEXT.name 				    	= "GMT_TEXT"
GMT_TEXT.material 			    	= UFD_GRN
GMT_TEXT.value 						= "E:"
GMT_TEXT.stringdefs 		    	= {0.0040, 0.0040, 0.0004, 0.001}
GMT_TEXT.alignment 					= "RightCenter"
GMT_TEXT.formats 			    	= {"%s"}
GMT_TEXT.h_clip_relation       		= h_clip_relations.COMPARE
GMT_TEXT.level 						= 10
GMT_TEXT.init_pos 			    	= {43, -24, 0}
GMT_TEXT.init_rot 			    	= {0, 0, 0}
GMT_TEXT.element_params 	    	= {"L_WAR_OPACITY","UFD_OPACITY",}
GMT_TEXT.controllers		    	= {{"opacity_using_parameter",1},{"parameter_in_range",0,0.9,1.1}}
Add(GMT_TEXT)
---------------------------------------------------------------HOURS------------------------------------------------------------------------------------------------
MISSION_HOURS				        		= CreateElement "ceStringPoly"
MISSION_HOURS.name				    		= "MISSION_HOURS"
MISSION_HOURS.material			   			= UFD_GRN
MISSION_HOURS.init_pos			    		= {48, -24, 0}
MISSION_HOURS.alignment						= "RightCenter"
MISSION_HOURS.stringdefs					= {0.0040, 0.0040, 0, 0.0}
MISSION_HOURS.additive_alpha				= true
MISSION_HOURS.collimated					= false
MISSION_HOURS.isdraw						= true	
MISSION_HOURS.use_mipfilter					= true
MISSION_HOURS.h_clip_relation	    		= h_clip_relations.COMPARE
MISSION_HOURS.level							= 10
MISSION_HOURS.element_params				= {"UFD_OPACITY","MISSION_HOURS","L_WAR_OPACITY"}
MISSION_HOURS.formats			    		= {"%02.0f"}
MISSION_HOURS.controllers					= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(MISSION_HOURS)
-------------------------------------------------------------TIME SEP 4---------------------------------------------------------------------------------------------
TIME4_TEXT 					    		= CreateElement "ceStringPoly"
TIME4_TEXT.name 				    	= "TIME4_TEXT"
TIME4_TEXT.material 			    	= UFD_GRN
TIME4_TEXT.value 						= ":"
TIME4_TEXT.stringdefs 		    		= {0.0040, 0.0040, 0.0004, 0.001}
TIME4_TEXT.alignment 					= "RightCenter"
TIME4_TEXT.formats 			    		= {"%s"}
TIME4_TEXT.h_clip_relation       		= h_clip_relations.COMPARE
TIME4_TEXT.level 						= 10
TIME4_TEXT.init_pos 			    	= {52, -24, 0}
TIME4_TEXT.init_rot 			    	= {0, 0, 0}
TIME4_TEXT.element_params 	    		= {"L_WAR_OPACITY","UFD_OPACITY",}
TIME4_TEXT.controllers		    		= {{"opacity_using_parameter",1},{"parameter_in_range",0,0.9,1.1}}
Add(TIME4_TEXT)
---------------------------------------------------------------MIN------------------------------------------------------------------------------------------------
MISSION_MINS				        	= CreateElement "ceStringPoly"
MISSION_MINS.name				    	= "MISSION_MINS"
MISSION_MINS.material			   		= UFD_GRN
MISSION_MINS.init_pos			    	= {56, -24, 0}
MISSION_MINS.alignment					= "RightCenter"
MISSION_MINS.stringdefs					= {0.0040, 0.0040, 0, 0.0}
MISSION_MINS.additive_alpha				= true
MISSION_MINS.collimated					= false
MISSION_MINS.isdraw						= true	
MISSION_MINS.use_mipfilter				= true
MISSION_MINS.h_clip_relation	    	= h_clip_relations.COMPARE
MISSION_MINS.level						= 10
MISSION_MINS.element_params				= {"UFD_OPACITY","MISSION_MINS","L_WAR_OPACITY"}
MISSION_MINS.formats			    	= {"%02.0f"}
MISSION_MINS.controllers				= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(MISSION_MINS)
-------------------------------------------------------------TIME SEP 3---------------------------------------------------------------------------------------------
TIME3_TEXT 					    		= CreateElement "ceStringPoly"
TIME3_TEXT.name 				    	= "TIME3_TEXT"
TIME3_TEXT.material 			    	= UFD_GRN
TIME3_TEXT.value 						= ":"
TIME3_TEXT.stringdefs 		    		= {0.0040, 0.0040, 0.0004, 0.001}
TIME3_TEXT.alignment 					= "RightCenter"
TIME3_TEXT.formats 			    		= {"%s"}
TIME3_TEXT.h_clip_relation       		= h_clip_relations.COMPARE
TIME3_TEXT.level 						= 10
TIME3_TEXT.init_pos 			    	= {60, -24, 0}
TIME3_TEXT.init_rot 			    	= {0, 0, 0}
TIME3_TEXT.element_params 	    		= {"L_WAR_OPACITY","UFD_OPACITY",}
TIME3_TEXT.controllers		    		= {{"opacity_using_parameter",1},{"parameter_in_range",0,0.9,1.1}}
Add(TIME3_TEXT)
---------------------------------------------------------------SEC------------------------------------------------------------------------------------------------
MISSION_SECS				        	= CreateElement "ceStringPoly"
MISSION_SECS.name				    	= "MISSION_SECS"
MISSION_SECS.material			   		= UFD_GRN
MISSION_SECS.init_pos			    	= {64, -24, 0}
MISSION_SECS.alignment					= "RightCenter"
MISSION_SECS.stringdefs					= {0.0040, 0.0040, 0, 0.0}
MISSION_SECS.additive_alpha				= true
MISSION_SECS.collimated					= false
MISSION_SECS.isdraw						= true	
MISSION_SECS.use_mipfilter				= true
MISSION_SECS.h_clip_relation	    	= h_clip_relations.COMPARE
MISSION_SECS.level						= 10
MISSION_SECS.element_params				= {"UFD_OPACITY","MISSION_SECS","L_WAR_OPACITY"}
MISSION_SECS.formats			    	= {"%02.0f"}
MISSION_SECS.controllers				= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(MISSION_SECS)
------------------------------------------------------------------------------------------------------------------------------------------------------------------