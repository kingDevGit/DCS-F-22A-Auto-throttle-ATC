--NIGHTSTORM ADV Page

dofile(LockOn_Options.script_path.."PMFD_CENTER/definitions.lua")
dofile(LockOn_Options.script_path.."fonts.lua")
dofile(LockOn_Options.script_path.."materials.lua")

SetScale(FOV)

local function vertices(object, height, half_or_double)
    local width = height
    
    if half_or_double == true then --
        width = height / 2
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

local BGColor  				= {255, 255, 255, 180}--RGBA
local MainColor 			= {255, 255, 255, 255}--RGBA
local GreenColor 		    = {0, 255, 0, 255}--RGBA
local WhiteColor 			= {255, 255, 255, 255}--RGBA
local RedColor 				= {255, 0, 0, 255}--RGBA
local BlueColor 			= {6, 6, 15, 255}--RGBA
local TealColor				= {0, 255, 255, 255}--RGBA
local ScreenColor			= {3, 3, 12, 255}--RGBA 5-5-5

--------------------------------------------------------------------------------------------------------------------------------------------
local REFLECT	 = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/reflection.dds", ScreenColor)	--NIGHTSTORM
local MASK_BOX	 = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/mask_box.dds", ScreenColor)
local LOGO       = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/22_logo.dds", BlueColor)		--NIGHTSTORM
local ADV_FRAME  = MakeMaterial(LockOn_Options.script_path.."../Scripts/IndicationTextures/adv_frame.dds", GreenColor)	--NIGHTSTORM
--------------------------------------------------------------------------------------------------------------------------------------------


local ClippingPlaneSize = 1.1 --Clipping Masks
local ClippingWidth 	= 1.1 --Clipping Masks

local PFD_MASK_BASE1 	= MakeMaterial(nil,{255,0,0,255})--Clipping Masks
local PFD_MASK_BASE2 	= MakeMaterial(nil,{0,255,0,255})--Clipping Masks

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
total_field_of_view.init_rot        = { 0, 0,0} -- degree NOT rad
total_field_of_view.h_clip_relation = h_clip_relations.REWRITE_LEVEL
total_field_of_view.level           = 1
total_field_of_view.collimated      = false
total_field_of_view.isvisible       = false
Add(total_field_of_view)
--Clipping Masks
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
------------------------------------------------------------------------------------------------CLIPPING-END----------------------------------------------------------------------------------------------
BGROUND                    = CreateElement "ceTexPoly"
BGROUND.name    			= "BG"
--BGROUND.material			= MASK_BOX
BGROUND.material			= REFLECT
BGROUND.change_opacity 		= false
BGROUND.collimated 			= false
BGROUND.isvisible 			= true
BGROUND.init_pos 			= {0, 0, 0} --L-R,U-D,F-B
BGROUND.init_rot 			= {0, 0, 0}
BGROUND.element_params 		= {"MFD_OPACITY","PMFD_MENU_PAGE"}--this may not be bneeded check when more pages done for backlight on page 7 SMS fc3 bs
BGROUND.controllers			= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}--MENU PAGE = 1
BGROUND.level 				= 2
BGROUND.h_clip_relation     = h_clip_relations.COMPARE
vertices(BGROUND,3)
Add(BGROUND)
----------------------------------------------------------------------------------------------------------------
--[[
BLOG                    			= CreateElement "ceTexPoly"
BLOG.name    						= "BG"
BLOG.material						= LOGO
BLOG.change_opacity 				= false
BLOG.collimated 					= false
BLOG.isvisible 						= true
BLOG.init_pos 						= {0, 0, 0} --L-R,U-D,F-B
BLOG.init_rot 						= {0, 0, 0}
BLOG.element_params 				= {"MFD_OPACITY","PMFD_MENU_PAGE"}--this may not be bneeded check when more pages done for backlight on page 7 SMS fc3 bs
BLOG.controllers					= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}--MENU PAGE = 1
BLOG.level 							= 2
BLOG.h_clip_relation     			= h_clip_relations.COMPARE
vertices(BLOG,2.2)
Add(BLOG)
--]]
----------------------------------------------------------------------------------------------------------------
FRAME                      	= CreateElement "ceTexPoly"
FRAME.name    			    = "FRAME"
FRAME.material			    = ADV_FRAME
FRAME.change_opacity 		= false
FRAME.collimated 			= false
FRAME.isvisible 			= true
FRAME.init_pos 				= {0, 0, 0} --L-R,U-D,F-B
FRAME.init_rot 				= {0, 0, 0}
FRAME.element_params 		= {"MFD_OPACITY","PMFD_MENU_PAGE"}
FRAME.controllers			= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
FRAME.level 				= 2
FRAME.h_clip_relation     = h_clip_relations.COMPARE
vertices(FRAME,2.1)
Add(FRAME)
----------------------------------------------------------------------------------------------------------------
MENU1_TEXT 					    	= CreateElement "ceStringPoly"
MENU1_TEXT.name 				    = "menu"
MENU1_TEXT.material 			    = UFD_GRN
MENU1_TEXT.value 					= "UHF  01"
MENU1_TEXT.stringdefs 		    	= {0.0050, 0.0050, 0.0004, 0.001}
MENU1_TEXT.alignment 				= "CenterCenter"
MENU1_TEXT.formats 			    	= {"%s"}
MENU1_TEXT.h_clip_relation       	= h_clip_relations.COMPARE
MENU1_TEXT.level 					= 2
MENU1_TEXT.init_pos 			    = {-0.85, 0.75, 0}
MENU1_TEXT.init_rot 			    = {0, 0, 0}
MENU1_TEXT.element_params 	    	= {"MFD_OPACITY","PMFD_MENU_PAGE"}
MENU1_TEXT.controllers		    	= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(MENU1_TEXT)
----------------------------------------------------------------------------------------------------------------
MENU2_TEXT 					    	= CreateElement "ceStringPoly"
MENU2_TEXT.name 				    = "menu"
MENU2_TEXT.material 			    = UFD_GRN
MENU2_TEXT.value 					= "256.000"
MENU2_TEXT.stringdefs 		    	= {0.0050, 0.0050, 0.0004, 0.001}
MENU2_TEXT.alignment 				= "CenterCenter"
MENU2_TEXT.formats 			    	= {"%s"}
MENU2_TEXT.h_clip_relation       	= h_clip_relations.COMPARE
MENU2_TEXT.level 					= 2
MENU2_TEXT.init_pos 			    = {-0.85, 0.675, 0}
MENU2_TEXT.init_rot 			    = {0, 0, 0}
MENU2_TEXT.element_params 	    	= {"MFD_OPACITY","PMFD_MENU_PAGE"}
MENU2_TEXT.controllers		    	= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(MENU2_TEXT)
----------------------------------------------------------------------------------------------------------------
MENU3_TEXT 					    	= CreateElement "ceStringPoly"
MENU3_TEXT.name 				    = "menu"
MENU3_TEXT.material 			    = UFD_GRN
MENU3_TEXT.value 					= "VHF  02"
MENU3_TEXT.stringdefs 		    	= {0.0050, 0.0050, 0.0004, 0.001}
MENU3_TEXT.alignment 				= "CenterCenter"
MENU3_TEXT.formats 			    	= {"%s"}
MENU3_TEXT.h_clip_relation       	= h_clip_relations.COMPARE
MENU3_TEXT.level 					= 2
MENU3_TEXT.init_pos 			    = {0.85, 0.75, 0}
MENU3_TEXT.init_rot 			    = {0, 0, 0}
MENU3_TEXT.element_params 	    	= {"MFD_OPACITY","PMFD_MENU_PAGE"}
MENU3_TEXT.controllers		    	= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(MENU3_TEXT)
----------------------------------------------------------------------------------------------------------------
MENU4_TEXT 					    	= CreateElement "ceStringPoly"
MENU4_TEXT.name 				    = "menu"
MENU4_TEXT.material 			    = UFD_GRN
MENU4_TEXT.value 					= "143.000"
MENU4_TEXT.stringdefs 		    	= {0.0050, 0.0050, 0.0004, 0.001}
MENU4_TEXT.alignment 				= "CenterCenter"
MENU4_TEXT.formats 			    	= {"%s"}
MENU4_TEXT.h_clip_relation       	= h_clip_relations.COMPARE
MENU4_TEXT.level 					= 2
MENU4_TEXT.init_pos 			    = {0.85, 0.675, 0}
MENU4_TEXT.init_rot 			    = {0, 0, 0}
MENU4_TEXT.element_params 	    	= {"MFD_OPACITY","PMFD_MENU_PAGE"}
MENU4_TEXT.controllers		    	= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(MENU4_TEXT)
----------------------------------------------------------------------------------------------------------------
MENU5_TEXT 					    	= CreateElement "ceStringPoly"
MENU5_TEXT.name 				    = "menu"
MENU5_TEXT.material 			    = UFD_GRN
MENU5_TEXT.value 					= "COMM 1"
MENU5_TEXT.stringdefs 		    	= {0.0060, 0.0060, 0.0004, 0.001}
MENU5_TEXT.alignment 				= "LeftCenter"
MENU5_TEXT.formats 			    	= {"%s"}
MENU5_TEXT.h_clip_relation       	= h_clip_relations.COMPARE
MENU5_TEXT.level 					= 2
MENU5_TEXT.init_pos 			    = {-0.97, 0.9, 0}
MENU5_TEXT.init_rot 			    = {0, 0, 0}
MENU5_TEXT.element_params 	    	= {"MFD_OPACITY","PMFD_MENU_PAGE"}
MENU5_TEXT.controllers		    	= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(MENU5_TEXT)
----------------------------------------------------------------------------------------------------------------
MENU6_TEXT 					    	= CreateElement "ceStringPoly"
MENU6_TEXT.name 				    = "menu"
MENU6_TEXT.material 			    = UFD_GRN
MENU6_TEXT.value 					= "COMM 2"
MENU6_TEXT.stringdefs 		    	= {0.0060, 0.0060, 0.0004, 0.001}
MENU6_TEXT.alignment 				= "RightCenter"
MENU6_TEXT.formats 			    	= {"%s"}
MENU6_TEXT.h_clip_relation       	= h_clip_relations.COMPARE
MENU6_TEXT.level 					= 2
MENU6_TEXT.init_pos 			    = {0.97, 0.9, 0}
MENU6_TEXT.init_rot 			    = {0, 0, 0}
MENU6_TEXT.element_params 	    	= {"MFD_OPACITY","PMFD_MENU_PAGE"}
MENU6_TEXT.controllers		    	= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(MENU6_TEXT)
----------------------------------------------------------------------------------------------------------------
IFFNORM_TXT 					    	= CreateElement "ceStringPoly"
IFFNORM_TXT.name 				    	= "menu"
IFFNORM_TXT.material 			    	= UFD_GRN
IFFNORM_TXT.value 				    	= "IFF: NORM"
IFFNORM_TXT.stringdefs 		        	= {0.0050, 0.0050, 0.0004, 0.001}
IFFNORM_TXT.alignment 			    	= "RightCenter"
IFFNORM_TXT.formats 			        = {"%s"}
IFFNORM_TXT.h_clip_relation          	= h_clip_relations.COMPARE
IFFNORM_TXT.level 				   		= 2
IFFNORM_TXT.init_pos 			    	= {0.94, -0.075, 0}
IFFNORM_TXT.init_rot 			    	= {0, 0, 0}
IFFNORM_TXT.element_params 	        	= {"MFD_OPACITY","PMFD_MENU_PAGE"}
IFFNORM_TXT.controllers		        	= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(IFFNORM_TXT)
----------------------------------------------------------------------------------------------------------------
UHF_TXT 					        = CreateElement "ceStringPoly"
UHF_TXT.name 				    	= "menu"
UHF_TXT.material 			    	= UFD_GRN
UHF_TXT.value 				    	= "UHF"
UHF_TXT.stringdefs 		        	= {0.0050, 0.0050, 0.0004, 0.001}
UHF_TXT.alignment 			    	= "CenterCenter"
UHF_TXT.formats 			        = {"%s"}
UHF_TXT.h_clip_relation          	= h_clip_relations.COMPARE
UHF_TXT.level 				   		= 2
UHF_TXT.init_pos 			    	= {-0.30, 0.975, 0}
UHF_TXT.init_rot 			    	= {0, 0, 0}
UHF_TXT.element_params 	        	= {"MFD_OPACITY","PMFD_MENU_PAGE"}
UHF_TXT.controllers		        	= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(UHF_TXT)
----------------------------------------------------------------------------------------------------------------
VHF_TXT 					    = CreateElement "ceStringPoly"
VHF_TXT.name 				    = "menu"
VHF_TXT.material 			    = UFD_GRN
VHF_TXT.value 				    = "VHF"
VHF_TXT.stringdefs 		        = {0.0050, 0.0050, 0.0004, 0.001}
VHF_TXT.alignment 			    = "CenterCenter"
VHF_TXT.formats 			    = {"%s"}
VHF_TXT.h_clip_relation         = h_clip_relations.COMPARE
VHF_TXT.level 				    = 2
VHF_TXT.init_pos 			    = {0, 0.975, 0}
VHF_TXT.init_rot 			    = {0, 0, 0}
VHF_TXT.element_params 	        = {"MFD_OPACITY","PMFD_MENU_PAGE"}
VHF_TXT.controllers		        =   {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(VHF_TXT)
----------------------------------------------------------------------------------------------------------------
IFF_TXT 					    = CreateElement "ceStringPoly"
IFF_TXT.name 				    = "menu"
IFF_TXT.material 			    = UFD_GRN
IFF_TXT.value 				    = "IFF"
IFF_TXT.stringdefs 		        = {0.0050, 0.0050, 0.0004, 0.001}
IFF_TXT.alignment 			    = "CenterCenter"
IFF_TXT.formats 			    = {"%s"}
IFF_TXT.h_clip_relation         = h_clip_relations.COMPARE
IFF_TXT.level 				    = 2
IFF_TXT.init_pos 			    = {0.31, 0.975, 0}
IFF_TXT.init_rot 			    = {0, 0, 0}
IFF_TXT.element_params 	        = {"MFD_OPACITY","PMFD_MENU_PAGE"}
IFF_TXT.controllers		        =   {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(IFF_TXT)
-------------------------------------------------------------------------------------------------------------------
--NIGHTSTORM
----------------------------------------------------------------------------------------------------------------
PAGETEXT 					    = CreateElement "ceStringPoly"
PAGETEXT.name 				    = "menu"
PAGETEXT.material 			    = UFD_FONT
PAGETEXT.value 				    = "PAGE"
PAGETEXT.stringdefs 		    = {0.0050, 0.0050, 0.0004, 0.001}
PAGETEXT.alignment 			    = "CenterCenter"
PAGETEXT.formats 			    = {"%s"}
PAGETEXT.h_clip_relation        = h_clip_relations.COMPARE
PAGETEXT.level 				    = 2
PAGETEXT.init_pos 			    = {0.62,-0.975, 0}
PAGETEXT.init_rot 			    = {0, 0, 0}
PAGETEXT.element_params 	    = {"MFD_OPACITY","PMFD_MENU_PAGE"}
PAGETEXT.controllers		    =   {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(PAGETEXT)
----------------------------------------------------------------------------------------------------------------
MENUTEXT 					    = CreateElement "ceStringPoly"
MENUTEXT.name 				    = "menu"
MENUTEXT.material 			    = UFD_FONT
MENUTEXT.value 				    = "MENU"
MENUTEXT.stringdefs 		    = {0.0050, 0.0050, 0.0004, 0.001}
MENUTEXT.alignment 			    = "CenterCenter"
MENUTEXT.formats 			    = {"%s"}
MENUTEXT.h_clip_relation        = h_clip_relations.COMPARE
MENUTEXT.level 				    = 2
MENUTEXT.init_pos 			    = {-0.61,-0.975, 0}
MENUTEXT.init_rot 			    = {0, 0, 0}
MENUTEXT.element_params 	        = {"MFD_OPACITY","PMFD_MENU_PAGE"}
MENUTEXT.controllers		        =   {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(MENUTEXT)
----------------------------------------------------------------------------------------------------------------
HUDTEXT 					    = CreateElement "ceStringPoly"
HUDTEXT.name 				    = "hud"
HUDTEXT.material 			    = UFD_GRN
HUDTEXT.value 				    = "HUD"
HUDTEXT.stringdefs 		    	= {0.0050, 0.0050, 0.0004, 0.001}
HUDTEXT.alignment 			    = "CenterCenter"
HUDTEXT.formats 			    = {"%s"}
HUDTEXT.h_clip_relation        	= h_clip_relations.COMPARE
HUDTEXT.level 				    = 2
HUDTEXT.init_pos 			    = {0.0,-0.975, 0}
HUDTEXT.init_rot 			    = {0, 0, 0}
HUDTEXT.element_params 	    	= {"MFD_OPACITY","PMFD_MENU_PAGE"}
HUDTEXT.controllers		    	=   {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(HUDTEXT)
----------------------------------------------------------------------------------------------------------------
INCTEXT 					    = CreateElement "ceStringPoly"
INCTEXT.name 				    = "hudinc"
INCTEXT.material 			    = UFD_GRN
INCTEXT.value 				    = "INC"
INCTEXT.stringdefs 		    	= {0.0050, 0.0050, 0.0004, 0.001}
INCTEXT.alignment 			    = "CenterCenter"
INCTEXT.formats 			    = {"%s"}
INCTEXT.h_clip_relation        	= h_clip_relations.COMPARE
INCTEXT.level 				    = 2
INCTEXT.init_pos 			    = {-0.31,-0.975, 0}
INCTEXT.init_rot 			    = {0, 0, 0}
INCTEXT.element_params 	    	= {"MFD_OPACITY","PMFD_MENU_PAGE"}
INCTEXT.controllers		    	=   {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(INCTEXT)
----------------------------------------------------------------------------------------------------------------
DECTEXT 					    = CreateElement "ceStringPoly"
DECTEXT.name 				    = "huddec"
DECTEXT.material 			    = UFD_GRN
DECTEXT.value 				    = "DEC"
DECTEXT.stringdefs 		    	= {0.0050, 0.0050, 0.0004, 0.001}
DECTEXT.alignment 			    = "CenterCenter"
DECTEXT.formats 			    = {"%s"}
DECTEXT.h_clip_relation        	= h_clip_relations.COMPARE
DECTEXT.level 				    = 2
DECTEXT.init_pos 			    = {0.31,-0.975, 0}
DECTEXT.init_rot 			    = {0, 0, 0}
DECTEXT.element_params 	    	= {"MFD_OPACITY","PMFD_MENU_PAGE"}
DECTEXT.controllers		    	=   {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(DECTEXT)
----------------------------------------------------------------------------------------------------------------
--NIGHTSTORM *WARNING DISPLAYS*
-------------------------------------------------------------------APU SPOOL-----------------------------------------------------
APURUN 						= CreateElement "ceStringPoly"
APURUN.name 				= "lgen"
APURUN.material 			= UFD_YEL
APURUN.value 				= "APU SPOOL"
APURUN.stringdefs 			= {0.0070, 0.0070, 0.0004, 0.001}
APURUN.alignment 			= "CenterCenter"
APURUN.formats 				= {"%s"}
APURUN.h_clip_relation  	= h_clip_relations.COMPARE
APURUN.level 				= 2
APURUN.init_pos 			= {0, 0.6, 0}
APURUN.init_rot 			= {0, 0, 0}
APURUN.element_params 		= {"MFD_OPACITY","APU_SPOOL","PMFD_MENU_PAGE"}
APURUN.controllers			= {{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",0}}
 Add(APURUN)
------------------------------------------------------------------APU READY------------------------------------------------------
APUREADY 					= CreateElement "ceStringPoly"
APUREADY.name 				= "lgen"
APUREADY.material 			= UFD_GRN
APUREADY.value 				= "APU READY"
APUREADY.stringdefs 		= {0.0070, 0.0070, 0.0004, 0.001}
APUREADY.alignment 			= "CenterCenter"
APUREADY.formats 			= {"%s"}
APUREADY.h_clip_relation  	= h_clip_relations.COMPARE
APUREADY.level 				= 2
APUREADY.init_pos 			= {0, 0.6, 0}
APUREADY.init_rot 			= {0, 0, 0}
APUREADY.element_params = {"MFD_OPACITY","APU_READY","PMFD_MENU_PAGE"}
APUREADY.controllers	= 	{{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",2}}
 Add(APUREADY)
-----------------------------------------------------L GEN OUT-----------------------------------------------------
Lgen 						= CreateElement "ceStringPoly"
Lgen.name 					= "lgen"
Lgen.material 				= UFD_RED
Lgen.value 					= "L GEN OUT"
Lgen.stringdefs 			= {0.0070, 0.0070, 0.0004, 0.001}
Lgen.alignment 				= "CenterCenter"
Lgen.formats 				= {"%s"}
Lgen.h_clip_relation  		= h_clip_relations.COMPARE
Lgen.level 					= 2
Lgen.init_pos 				= {0, 0.5, 0}
Lgen.init_rot 				= {0, 0, 0}
Lgen.element_params 		= {"MFD_OPACITY","L_GEN_OUT","PMFD_MENU_PAGE"}
Lgen.controllers			= {{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",0}}
Add(Lgen)
------------------------------------------------------R GEN OUT------------------------------------------------------
Rgen 						= CreateElement "ceStringPoly"
Rgen.name 					= "rgen"
Rgen.material 				= UFD_RED
Rgen.value 					= "R GEN OUT"
Rgen.stringdefs 			= {0.0070, 0.0070, 0.0004, 0.001}
Rgen.alignment 				= "CenterCenter"
Rgen.formats 				= {"%s"}
Rgen.h_clip_relation  		= h_clip_relations.COMPARE
Rgen.level 					= 2
Rgen.init_pos 				= {0, 0.4, 0}
Rgen.init_rot 				= {0, 0, 0}
Rgen.element_params 		= {"MFD_OPACITY","R_GEN_OUT","PMFD_MENU_PAGE"}
Rgen.controllers			= {{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",0}}
Add(Rgen)
------------------------------------------------------HYDRAULIC------------------------------------------------------
hyd 						= CreateElement "ceStringPoly"
hyd.name 					= "hyd"
hyd.material 				= UFD_RED
hyd.value 					= "HYDRAULIC"
hyd.stringdefs 				= {0.0070, 0.0070, 0.0004, 0.001}
hyd.alignment 				= "CenterCenter"
hyd.formats 				= {"%s"}
hyd.h_clip_relation  		= h_clip_relations.COMPARE
hyd.level 					= 2
hyd.init_pos 				= {0, 0.3, 0}
hyd.init_rot 				= {0, 0, 0}
hyd.element_params 			= {"MFD_OPACITY","HYD_LIGHT","PMFD_MENU_PAGE"}
hyd.controllers				= {{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",0}}
Add(hyd)
------------------------------------------------------OIL PRESS------------------------------------------------------
oilpress 					= CreateElement "ceStringPoly"
oilpress.name 				= "oil"
oilpress.material 			= UFD_RED
oilpress.value 				= "OIL PRESS"
oilpress.stringdefs 		= {0.0070, 0.0070, 0.0004, 0.001}
oilpress.alignment 			= "CenterCenter"
oilpress.formats 			= {"%s"}
oilpress.h_clip_relation  	= h_clip_relations.COMPARE
oilpress.level 				= 2
oilpress.init_pos 			= {0, 0.2, 0}
oilpress.init_rot 			= {0, 0, 0}
oilpress.element_params 	= {"MFD_OPACITY","OIL_LIGHT","PMFD_MENU_PAGE"}
oilpress.controllers		= {{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",0}}
Add(oilpress)
------------------------------------------------------CANOPY UNLOCK------------------------------------------------------
canopy 						= CreateElement "ceStringPoly"
canopy.name 				= "canopy"
canopy.material 			= UFD_RED
canopy.value 				= "CANOPY UNLOCK"
canopy.stringdefs 			= {0.0070, 0.0070, 0.0004, 0.001}
canopy.alignment 			= "CenterCenter"
canopy.formats 				= {"%s"}
canopy.h_clip_relation  	= h_clip_relations.COMPARE
canopy.level 				= 2
canopy.init_pos 			= {0, 0.1, 0}
canopy.init_rot 			= {0, 0, 0}
canopy.element_params 		= {"MFD_OPACITY","CANOPY_LIGHT","PMFD_MENU_PAGE"}
canopy.controllers			= {{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",0}}
Add(canopy)
----------------------------------------------MASTER CAUTION--------------------------------------------------------------------------
master_caution 						= CreateElement "ceStringPoly"
master_caution.name 				= "master_caution"
master_caution.material 			= UFD_YEL
master_caution.value 				= "MASTER CAUTION"
master_caution.stringdefs 			= {0.0070, 0.0070, 0.0004, 0.001}
master_caution.alignment 			= "CenterCenter"
master_caution.formats 				= {"%s"}
master_caution.h_clip_relation  	= h_clip_relations.COMPARE
master_caution.level 				= 2
master_caution.init_pos 			= {0, 0, 0}
master_caution.init_rot 			= {0, 0, 0}
master_caution.element_params 		= {"MFD_OPACITY","CAUTION_LIGHT","PMFD_MENU_PAGE"}
master_caution.controllers			= {{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",0}}
Add(master_caution)
--------------------------------------------------------BINGO------------------------------------------------------
BingoFuel 					= CreateElement "ceStringPoly"
BingoFuel.name 				= "bingo"
BingoFuel.material 			= UFD_YEL
BingoFuel.value 			= "FUEL LOW"
BingoFuel.stringdefs 		= {0.0070, 0.0070, 0.0004, 0.001}
BingoFuel.alignment 		= "CenterCenter"
BingoFuel.formats 			= {"%s"}
BingoFuel.h_clip_relation  	= h_clip_relations.COMPARE
BingoFuel.level 			= 2
BingoFuel.init_pos 			= {0, -0.1, 0}
BingoFuel.init_rot 			= {0, 0, 0}
BingoFuel.element_params 	= {"MFD_OPACITY","BINGO_LIGHT","PMFD_MENU_PAGE"}
BingoFuel.controllers		= {{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",0}}
Add(BingoFuel)
--------------------------------------------------------FLAPS------------------------------------------------------
FlapsM 						= CreateElement "ceStringPoly"
FlapsM.name 				= "flap"
FlapsM.material 			= UFD_YEL 
FlapsM.value 				= "FLAPS"
FlapsM.stringdefs 			= {0.0070, 0.0070, 0.0004, 0.001}
FlapsM.alignment 			= "CenterCenter"
FlapsM.formats 				= {"%s"}
FlapsM.h_clip_relation  	= h_clip_relations.COMPARE
FlapsM.level 				= 2
FlapsM.init_pos 			= {0, -0.2, 0}
FlapsM.init_rot 			= {0, 0, 0}
FlapsM.element_params 		= {"MFD_OPACITY","FLAPS_MOVE","PMFD_MENU_PAGE"}
FlapsM.controllers			= {{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",0}}
Add(FlapsM)
--------------------------------------------------------FLAPS------------------------------------------------------
Flaps 						= CreateElement "ceStringPoly"
Flaps.name 					= "flap"
Flaps.material 				= UFD_TEAL
Flaps.value 				= "FLAPS"
Flaps.stringdefs 			= {0.0070, 0.0070, 0.0004, 0.001}
Flaps.alignment 			= "CenterCenter"
Flaps.formats 				= {"%s"}
Flaps.h_clip_relation  		= h_clip_relations.COMPARE
Flaps.level 				= 2
Flaps.init_pos 				= {0, -0.2, 0}
Flaps.init_rot 				= {0, 0, 0}
Flaps.element_params 		= {"MFD_OPACITY","FLAPS_DOWN","PMFD_MENU_PAGE"}
Flaps.controllers			= {{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",0}}
Add(Flaps)
--------------------------------------------------------SPEED BRAKE------------------------------------------------------
SpdBrake 					= CreateElement "ceStringPoly"
SpdBrake.name 				= "spd"
SpdBrake.material 			= UFD_TEAL
SpdBrake.value 				= "SPD BRK OUT"
SpdBrake.stringdefs 		= {0.0070, 0.0070, 0.0004, 0.001}
SpdBrake.alignment 			= "CenterCenter"
SpdBrake.formats 			= {"%s"}
SpdBrake.h_clip_relation  	= h_clip_relations.COMPARE
SpdBrake.level 				= 2
SpdBrake.init_pos 			= {0, -0.3, 0}
SpdBrake.init_rot 			= {0, 0, 0}
SpdBrake.element_params 	= {"MFD_OPACITY","SPD_BRK_LIGHT","PMFD_MENU_PAGE"}
SpdBrake.controllers		= {{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",0}}
Add(SpdBrake)

--ATC FlyingAlex
--------------------------------------------------------ATC------------------------------------------------------
AutoThrApp 					= CreateElement "ceStringPoly"
AutoThrApp.name 				= "atc_app"
AutoThrApp.material 			= UFD_TEAL --FONT_RPM--
AutoThrApp.value 				= "ATC APPROACH"
AutoThrApp.stringdefs 		= {0.0070, 0.0070, 0.0004, 0.001}
AutoThrApp.alignment 		= "CenterCenter"
AutoThrApp.formats 			= {"%s"}
AutoThrApp.h_clip_relation  = h_clip_relations.COMPARE
AutoThrApp.level 			= 2
AutoThrApp.init_rot 		= {0, 0, 0}
AutoThrApp.init_pos 		= {0, 0.1, 0} -- You can't have canopy unlock with the ATC open on ground so use the canopy status text position
AutoThrApp.element_params 	= {"MFD_OPACITY","ATC_APPROACH","PMFD_MENU_PAGE"} --get_param_handle
AutoThrApp.controllers		= {{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",0}}
Add(AutoThrApp)

AutoThrCru 					= CreateElement "ceStringPoly"
AutoThrCru.name 				= "atc_cru"
AutoThrCru.material 			= UFD_TEAL --FONT_RPM--
AutoThrCru.value 				= "ATC CRUISE"
AutoThrCru.stringdefs 		= {0.0070, 0.0070, 0.0004, 0.001}
AutoThrCru.alignment 		= "CenterCenter"
AutoThrCru.formats 			= {"%s"}
AutoThrCru.h_clip_relation  = h_clip_relations.COMPARE
AutoThrCru.level 			= 2
AutoThrCru.init_rot 		= {0, 0, 0}
AutoThrCru.init_pos 		= {0, 0.1, 0}
AutoThrCru.element_params 	= {"MFD_OPACITY","ATC_CRUISE","PMFD_MENU_PAGE"} --get_param_handle
AutoThrCru.controllers		= {{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",0}}
Add(AutoThrCru)

--------------------------------------------------------AAR------------------------------------------------------
AARReady 					= CreateElement "ceStringPoly"
AARReady.name 				= "aar"
AARReady.material 			= UFD_YEL			--NIGHTSTORM UFD_TEAL
AARReady.value 				= "AAR DOOR"		--NIGHTSTORM AAR READY
AARReady.stringdefs 		= {0.0070, 0.0070, 0.0004, 0.001}
AARReady.alignment 			= "CenterCenter"
AARReady.formats 			= {"%s"}
AARReady.h_clip_relation  	= h_clip_relations.COMPARE
AARReady.level 				= 2
AARReady.init_pos 			= {0, -0.4, 0}
AARReady.init_rot 			= {0, 0, 0}
AARReady.element_params 	= {"MFD_OPACITY","AAR_LIGHT","PMFD_MENU_PAGE"}
AARReady.controllers		= {{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",0}}
Add(AARReady)
--NIGHTSTORM TEST
---------------------------------------------------CENTER BAY------------------------------------------------------
CENTERBAYCOPEN 						= CreateElement "ceStringPoly"
CENTERBAYCOPEN.name 				= "aar"
CENTERBAYCOPEN.material 			= UFD_YEL
CENTERBAYCOPEN.value 				= "BAY DOOR"
CENTERBAYCOPEN.stringdefs 			= {0.0070, 0.0070, 0.0004, 0.001}
CENTERBAYCOPEN.alignment 			= "CenterCenter"
CENTERBAYCOPEN.formats 				= {"%s"}
CENTERBAYCOPEN.h_clip_relation  	= h_clip_relations.COMPARE
CENTERBAYCOPEN.level 				= 2
CENTERBAYCOPEN.init_pos 			= {0, -0.4, 0}
CENTERBAYCOPEN.init_rot 			= {0, 0, 0}
CENTERBAYCOPEN.element_params 		= {"MFD_OPACITY","BAY_C_ARG","PMFD_MENU_PAGE"}
CENTERBAYCOPEN.controllers			= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,0.01,1.2}}
Add(CENTERBAYCOPEN)
----------------------------------------------------LEFT BAY-------------------------------------------------------
LEFTBAYCOPEN 					= CreateElement "ceStringPoly"
LEFTBAYCOPEN.name 				= "aar"
LEFTBAYCOPEN.material 			= UFD_YEL
LEFTBAYCOPEN.value 				= "BAY DOOR"
LEFTBAYCOPEN.stringdefs 		= {0.0070, 0.0070, 0.0004, 0.001}
LEFTBAYCOPEN.alignment 			= "CenterCenter"
LEFTBAYCOPEN.formats 			= {"%s"}
LEFTBAYCOPEN.h_clip_relation  	= h_clip_relations.COMPARE
LEFTBAYCOPEN.level 				= 2
LEFTBAYCOPEN.init_pos 			= {0, -0.4, 0}
LEFTBAYCOPEN.init_rot 			= {0, 0, 0}
--LEFTBAYCOPEN.element_params 	= {"MFD_OPACITY","BAY_L_ARG","PMFD_MENU_PAGE"}
--LEFTBAYCOPEN.controllers		= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,0.01,1.2}}
LEFTBAYCOPEN.element_params 	= {"MFD_OPACITY","PMFD_MENU_PAGE","BAY_L_ARG","BAY_STATION"}	--LEFT side will ONLY light up IF the left bay is selected.
LEFTBAYCOPEN.controllers		= {{"opacity_using_parameter",0},{"parameter_in_range",2,0.01,1.2},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,0.9,1.1}}
Add(LEFTBAYCOPEN)
-----------------------------------------------------RIGHT BAY--------------------------------------------------------
RIGHTBAYCOPEN 					= CreateElement "ceStringPoly"
RIGHTBAYCOPEN.name 				= "aar"
RIGHTBAYCOPEN.material 			= UFD_YEL
RIGHTBAYCOPEN.value 			= "BAY DOOR"
RIGHTBAYCOPEN.stringdefs 		= {0.0070, 0.0070, 0.0004, 0.001}
RIGHTBAYCOPEN.alignment 		= "CenterCenter"
RIGHTBAYCOPEN.formats 			= {"%s"}
RIGHTBAYCOPEN.h_clip_relation  	= h_clip_relations.COMPARE
RIGHTBAYCOPEN.level 			= 2
RIGHTBAYCOPEN.init_pos 			= {0, -0.4, 0}
RIGHTBAYCOPEN.init_rot 			= {0, 0, 0}
RIGHTBAYCOPEN.element_params 	= {"MFD_OPACITY","BAY_R_ARG","PMFD_MENU_PAGE"}
RIGHTBAYCOPEN.controllers		= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,0.01,1.2}}
Add(RIGHTBAYCOPEN)
--NIGHTSTORM TEST
-------------------------------------------------------GROUND POWER-------------------------------------------------------------
GPOWER 						= CreateElement "ceStringPoly"
GPOWER.name 				= "chaff"
GPOWER.material 			= UFD_GRN
GPOWER.value 				= "GROUND POWER"
GPOWER.stringdefs 			= {0.0070, 0.0070, 0.0004, 0.001}
GPOWER.alignment 			= "CenterCenter"
GPOWER.formats 				= {"%s"}
GPOWER.h_clip_relation  	= h_clip_relations.COMPARE
GPOWER.level 				= 2
GPOWER.init_pos 			= {0, -0.5, 0}
GPOWER.init_rot 			= {0, 0, 0}
GPOWER.element_params 		= {"MFD_OPACITY","GROUND_POWER","PMFD_MENU_PAGE"}
GPOWER.controllers			= 	{{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",0}}
Add(GPOWER)
----------------------------------------------------------ECM------------------------------------------------------
JAMMER 						= CreateElement "ceStringPoly"
JAMMER.name 				= "chaff"
JAMMER.material 			= UFD_YEL
JAMMER.value 				= "ECM"
JAMMER.stringdefs 			= {0.0070, 0.0070, 0.0004, 0.001}
JAMMER.alignment 			= "CenterCenter"
JAMMER.formats 				= {"%s"}
JAMMER.h_clip_relation  	= h_clip_relations.COMPARE
JAMMER.level 				= 2
JAMMER.init_rot 			= {0, 0, 0}
JAMMER.init_pos 			= {0, -0.6, 0}
JAMMER.element_params 		= {"MFD_OPACITY","ECM_ARG","PMFD_MENU_PAGE"}
JAMMER.controllers			= {{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.9,1.1}, {"opacity_using_parameter",0}}
Add(JAMMER)
--------------------------------------------------------CHAFF------------------------------------------------------
CHAFF 						= CreateElement "ceStringPoly"
CHAFF.name 					= "chaff"
CHAFF.material 				= UFD_YEL
CHAFF.value 				= "CHAFF"
CHAFF.stringdefs 			= {0.0070, 0.0070, 0.0004, 0.001}
CHAFF.alignment 			= "CenterCenter"
CHAFF.formats 				= {"%s"}
CHAFF.h_clip_relation  		= h_clip_relations.COMPARE
CHAFF.level 				= 2
CHAFF.init_pos 				= {-0.4, -0.6, 0}
CHAFF.init_rot 				= {0, 0, 0}
CHAFF.element_params 		= {"MFD_OPACITY","CHAFF_LIGHT","PMFD_MENU_PAGE"}
CHAFF.controllers			= {{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",0}}
Add(CHAFF)
--------------------------------------------------------FLARE------------------------------------------------------
FLARE 						= CreateElement "ceStringPoly"
FLARE.name 					= "chaff"
FLARE.material 				= UFD_YEL
FLARE.value 				= "FLARE"
FLARE.stringdefs 			= {0.0070, 0.0070, 0.0004, 0.001}
FLARE.alignment 			= "CenterCenter"
FLARE.formats 				= {"%s"}
FLARE.h_clip_relation  		= h_clip_relations.COMPARE
FLARE.level 				= 2
FLARE.init_rot 				= {0, 0, 0}
FLARE.init_pos 				= {0.4, -0.6, 0}
FLARE.element_params 		= {"MFD_OPACITY","FLARE_LIGHT","PMFD_MENU_PAGE"}
FLARE.controllers			= {{"parameter_in_range",2,0.9,1.1}, {"parameter_in_range",1,0.1,1.1}, {"opacity_using_parameter",0}}
Add(FLARE)
-------------------------------------------------------------------------------------------------------------------
--NIGHTSTORM *WARNING DISPLAYS*
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------VVI------------------------------------------------------------------------------------------------
VV_TXT 					    = CreateElement "ceStringPoly"
VV_TXT.name 				    = "VVI"
VV_TXT.material 			    = UFD_GRN
VV_TXT.value 				    = "VVI:"
VV_TXT.stringdefs 		        = {0.0050, 0.0050, 0.0004, 0.001}
VV_TXT.alignment 			    = "CenterCenter"
VV_TXT.formats 			        = {"%s"}
VV_TXT.h_clip_relation         = h_clip_relations.COMPARE
VV_TXT.level 				    = 2
VV_TXT.init_pos 			    = {0.71, -0.385, 0}
VV_TXT.init_rot 			    = {0, 0, 0}
VV_TXT.element_params 	        = {"MFD_OPACITY","PMFD_MENU_PAGE"}
VV_TXT.controllers		        = {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(VV_TXT)
----------------------------------
VV_NUM				        = CreateElement "ceStringPoly"
VV_NUM.name				    = "VV_NUM"
VV_NUM.material			    = UFD_FONT
VV_NUM.init_pos			    = {0.94, -0.385, 0}
VV_NUM.alignment			= "RightCenter"
VV_NUM.stringdefs			= {0.0050, 0.0050, 0, 0.0}
VV_NUM.additive_alpha		= true
VV_NUM.collimated			= false
VV_NUM.isdraw				= true	
VV_NUM.use_mipfilter		= true
VV_NUM.h_clip_relation	    = h_clip_relations.COMPARE
VV_NUM.level				= 2
VV_NUM.element_params		= {"MFD_OPACITY","VV","PMFD_MENU_PAGE"}
VV_NUM.formats			    = {"%05.0f"}
VV_NUM.controllers		    =   {
                                        {"opacity_using_parameter",0},
                                        {"text_using_parameter",1,0},
                                        {"parameter_in_range",2,0.9,1.1}
                                    }
                                
Add(VV_NUM)
-------------------------------------------------------------AOA------------------------------------------------------------------------------------------------
AOA_TXT 					    = CreateElement "ceStringPoly"
AOA_TXT.name 				    = "AOA"
AOA_TXT.material 			    = UFD_GRN
AOA_TXT.value 				    = "AOA:"
AOA_TXT.stringdefs 		        = {0.0050, 0.0050, 0.0004, 0.001}
AOA_TXT.alignment 			    = "CenterCenter"
AOA_TXT.formats 			    = {"%s"}
AOA_TXT.h_clip_relation         = h_clip_relations.COMPARE
AOA_TXT.level 				    = 2
AOA_TXT.init_pos 			    = {0.71, -0.7, 0}
AOA_TXT.init_rot 			    = {0, 0, 0}
AOA_TXT.element_params 	        = {"MFD_OPACITY","PMFD_MENU_PAGE"}
AOA_TXT.controllers		        = {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(AOA_TXT)
----------------------------------------------------------------------------------------------------------------------------------
AOA_NUM				    		= CreateElement "ceStringPoly"
AOA_NUM.name					= "AOA_NUM"
AOA_NUM.material				= UFD_FONT
AOA_NUM.init_pos				= {0.94, -0.7, 0}
AOA_NUM.alignment				= "RightCenter"
AOA_NUM.stringdefs				= {0.0050, 0.0050, 0, 0.0}
AOA_NUM.additive_alpha			= true
AOA_NUM.collimated				= false
AOA_NUM.isdraw					= true	
AOA_NUM.use_mipfilter			= true
AOA_NUM.h_clip_relation	    	= h_clip_relations.COMPARE
AOA_NUM.level					= 2
AOA_NUM.element_params			= {"MFD_OPACITY","AOA","PMFD_MENU_PAGE"}
AOA_NUM.formats			    	= {"%02.2f"}--= {"%02.0f"}
AOA_NUM.controllers		    	=   {
                                        {"opacity_using_parameter",0},
                                        {"text_using_parameter",1,0},
                                        {"parameter_in_range",2,0.9,1.1}
                                    }
                                
Add(AOA_NUM)
-------------------------------------------------------------MACH------------------------------------------------------------------------------------------------
MACH_TXT 					    	= CreateElement "ceStringPoly"
MACH_TXT.name 				    	= "MACH_TXT"
MACH_TXT.material 			    	= UFD_GRN
MACH_TXT.value 				    	= "M:"
MACH_TXT.stringdefs 		        = {0.0050, 0.0050, 0.0004, 0.001}
MACH_TXT.alignment 			    	= "CenterCenter"
MACH_TXT.formats 			    	= {"%s"}
MACH_TXT.h_clip_relation         	= h_clip_relations.COMPARE
MACH_TXT.level 				    	= 2
MACH_TXT.init_pos 			    	= {-0.935, -0.385, 0}
MACH_TXT.init_rot 			    	= {0, 0, 0}
MACH_TXT.element_params 	        = {"MFD_OPACITY","PMFD_MENU_PAGE"}
MACH_TXT.controllers		        = {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1}}
Add(MACH_TXT)
-------------------------------------------------------------MACH------------------------------------------------------------------------------------------------
M_NUM				        		= CreateElement "ceStringPoly"
M_NUM.name				    		= "M_NUM"
M_NUM.material			    		= UFD_FONT
M_NUM.init_pos			    		= {-0.755, -0.385, 0}
M_NUM.alignment			    		= "RightCenter"
M_NUM.stringdefs					= {0.0050, 0.0050, 0, 0.0}
M_NUM.additive_alpha				= true
M_NUM.collimated					= false
M_NUM.isdraw						= true	
M_NUM.use_mipfilter		    		= true
M_NUM.h_clip_relation	    		= h_clip_relations.COMPARE
M_NUM.level				    		= 2
M_NUM.element_params				= {"MFD_OPACITY","MACH","PMFD_MENU_PAGE"}
M_NUM.formats			    		= {"%02.3f"}--= {"%02.0f"}
M_NUM.controllers		    		=  {
                                       {"opacity_using_parameter",0},
                                       {"text_using_parameter",1,0},
                                       {"parameter_in_range",2,0.9,1.1}
										}
Add(M_NUM)
-------------------------------------------------------------GFORCE------------------------------------------------------------------------------------------------
GTXT 						= CreateElement "ceStringPoly"
GTXT.name 					= "gtext"
GTXT.material 				= UFD_GRN 
GTXT.value 					= "G:"
GTXT.stringdefs 			= {0.0050, 0.0050, 0.0004, 0.001}
GTXT.alignment 				= "CenterCenter"
GTXT.formats 				= {"%s"}
GTXT.h_clip_relation  		= h_clip_relations.COMPARE
GTXT.level 					= 2
GTXT.init_pos 				= {-0.935, -0.7, 0}
GTXT.init_rot 				= {0, 0, 0}
GTXT.element_params 		= {"MFD_OPACITY","PMFD_MENU_PAGE"} --get_param_handle
--GTXT.controllers			= 	{	{"parameter_in_range",0,0.9,1.1}, {"opacity_using_parameter",0}}
GTXT.controllers			= 	{	{"parameter_in_range",1,0.9,1.1}, {"opacity_using_parameter",0}}
Add(GTXT)
-------------------------------------------------------------GFORCE------------------------------------------------------------------------------------------------
G_NUM				    	= CreateElement "ceStringPoly"
G_NUM.name					= "G_NUM"
G_NUM.material				= UFD_FONT
G_NUM.init_pos				= {-0.755, -0.7, 0} --L-R,U-D,F-B
G_NUM.alignment				= "RightCenter"
G_NUM.stringdefs			= {0.0050, 0.0050, 0, 0.0}
G_NUM.additive_alpha		= true
G_NUM.collimated			= false
G_NUM.isdraw				= true	
G_NUM.use_mipfilter			= true
G_NUM.h_clip_relation		= h_clip_relations.COMPARE
G_NUM.level					= 2
G_NUM.element_params		= {"MFD_OPACITY","GFORCE","PMFD_MENU_PAGE"}
G_NUM.formats				= {"%02.3f"}--= {"%02.0f"}
G_NUM.controllers			=   {
                                        {"opacity_using_parameter",0},
                                        {"text_using_parameter",1,0},
                                        {"parameter_in_range",2,0.9,1.1}
                                    }
Add(G_NUM)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INFO_FCS_AUTO 					        = CreateElement "ceStringPoly"
INFO_FCS_AUTO.name 				        = "menu"
INFO_FCS_AUTO.material 			        = UFD_GRN
INFO_FCS_AUTO.value 				    = "AUTO ACL"					--NIGHTSTORM "AUTO G"
INFO_FCS_AUTO.stringdefs 		        = {0.0050, 0.0050, 0.0004, 0.001}
INFO_FCS_AUTO.alignment 			    = "LeftCenter"
INFO_FCS_AUTO.formats 			        = {"%s"}
INFO_FCS_AUTO.h_clip_relation           = h_clip_relations.COMPARE
INFO_FCS_AUTO.level 				    = 2
INFO_FCS_AUTO.init_pos 			        = {-0.97, -0.075, 0}
INFO_FCS_AUTO.init_rot 			        = {0, 0, 0}
INFO_FCS_AUTO.element_params 	        = {"MFD_OPACITY","PMFD_MENU_PAGE","HUD_MODE","FCS_MODE"}
INFO_FCS_AUTO.controllers		        = {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,0.9,1.1},{"parameter_in_range",3,-0.1,0.1}}
Add(INFO_FCS_AUTO)
--------------------------------------------------------------------------------------------------- AUTO G---------------------------------------------------------------------------------------------------
INFO_FCS_AUTO 					        = CreateElement "ceStringPoly"
INFO_FCS_AUTO.name 				        = "menu"
INFO_FCS_AUTO.material 			        = UFD_GRN
INFO_FCS_AUTO.value 				    = "AUTO AOA"
INFO_FCS_AUTO.stringdefs 		        = {0.0050, 0.0050, 0.0004, 0.001}
INFO_FCS_AUTO.alignment 			    = "LeftCenter"
INFO_FCS_AUTO.formats 			        = {"%s"}
INFO_FCS_AUTO.h_clip_relation           = h_clip_relations.COMPARE
INFO_FCS_AUTO.level 				    = 2
INFO_FCS_AUTO.init_pos 			        = {-0.97, -0.075, 0}
INFO_FCS_AUTO.init_rot 			        = {0, 0, 0}
INFO_FCS_AUTO.element_params 	        = {"MFD_OPACITY","PMFD_MENU_PAGE","HUD_MODE","FCS_MODE"}
INFO_FCS_AUTO.controllers		        = {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,1.1,9},{"parameter_in_range",3,-0.1,0.1}}
Add(INFO_FCS_AUTO)

--------------------------------------------------------------------------------------------------- ORIDE---------------------------------------------------------------------------------------------------
INFO_FCS_ORIDE 					        = CreateElement "ceStringPoly"
INFO_FCS_ORIDE.name 				    = "menu"
INFO_FCS_ORIDE.material 			    = UFD_RED
INFO_FCS_ORIDE.value 				    = "FCS ACM"						--NIGHTSTORM FCS ORIDE
INFO_FCS_ORIDE.stringdefs 		        = {0.0050, 0.0050, 0.0004, 0.001}
INFO_FCS_ORIDE.alignment 			    = "LeftCenter"
INFO_FCS_ORIDE.formats 			        = {"%s"}
INFO_FCS_ORIDE.h_clip_relation          = h_clip_relations.COMPARE
INFO_FCS_ORIDE.level 				    = 2
INFO_FCS_ORIDE.init_pos 			    = {-0.97, -0.075, 0}
INFO_FCS_ORIDE.init_rot 			    = {0, 0, 0}
INFO_FCS_ORIDE.element_params 	        = {"MFD_OPACITY","PMFD_MENU_PAGE","FCS_MODE"}
INFO_FCS_ORIDE.controllers		        = {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,2.9,3.1}}
Add(INFO_FCS_ORIDE)
--------------------------------------------------------------------------------------------------- AOA---------------------------------------------------------------------------------------------------
INFO_FCS_G 					        	= CreateElement "ceStringPoly"
INFO_FCS_G.name 				    	= "menu"
INFO_FCS_G.material 			    	= UFD_YEL
INFO_FCS_G.value 				    	= "FCS AOA"
INFO_FCS_G.stringdefs 		        	= {0.0050, 0.0050, 0.0004, 0.001}
INFO_FCS_G.alignment 			    	= "LeftCenter"
INFO_FCS_G.formats 			        	= {"%s"}
INFO_FCS_G.h_clip_relation          	= h_clip_relations.COMPARE
INFO_FCS_G.level 				    	= 2
INFO_FCS_G.init_pos 			    	= {-0.97, -0.075, 0}
INFO_FCS_G.init_rot 			    	= {0, 0, 0}
INFO_FCS_G.element_params 	        	= {"MFD_OPACITY","PMFD_MENU_PAGE","FCS_MODE"}
INFO_FCS_G.controllers		        	= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,0.9,1.1}}
Add(INFO_FCS_G)
--------------------------------------------------------------------------------------------------- ACL--------------------------------------------------------------------------------------------------- 
INFO_FCS_A 					        	= CreateElement "ceStringPoly"
INFO_FCS_A.name 				    	= "menu"
INFO_FCS_A.material 			    	= UFD_YEL
INFO_FCS_A.value 				    	= "FCS ACL"		--NIGHTSTORM	"FCS G"
INFO_FCS_A.stringdefs 		        	= {0.0050, 0.0050, 0.0004, 0.001}
INFO_FCS_A.alignment 			    	= "LeftCenter"
INFO_FCS_A.formats 			        	= {"%s"}
INFO_FCS_A.h_clip_relation          	= h_clip_relations.COMPARE
INFO_FCS_A.level 				    	= 2
INFO_FCS_A.init_pos 			    	= {-0.97, -0.075, 0}
INFO_FCS_A.init_rot 			    	= {0, 0, 0}
INFO_FCS_A.element_params 	        	= {"MFD_OPACITY","PMFD_MENU_PAGE","FCS_MODE"}
INFO_FCS_A.controllers		        	= {{"opacity_using_parameter",0},{"parameter_in_range",1,0.9,1.1},{"parameter_in_range",2,1.9,2.1}}
Add(INFO_FCS_A)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
--NIGHTSTORM Add clocks
-------------------------------------------------------------GMT CLOCK----------------------------------------------------------------------------------------------
---------------------------------------------------------------HOURS------------------------------------------------------------------------------------------------
GMT_hours				        		= CreateElement "ceStringPoly"
GMT_hours.name				    		= "GMT_hours"
GMT_hours.material			   			= UFD_GRN
GMT_hours.init_pos			    		= {-0.1, 0.85, 0}
GMT_hours.alignment						= "CenterCenter"
GMT_hours.stringdefs					= {0.0050, 0.0050, 0, 0.0}
GMT_hours.additive_alpha				= true
GMT_hours.collimated					= false
GMT_hours.isdraw						= true	
GMT_hours.use_mipfilter					= true
GMT_hours.h_clip_relation	    		= h_clip_relations.COMPARE
GMT_hours.level							= 2
GMT_hours.element_params				= {"MFD_OPACITY","GMT_HOURS","PMFD_MENU_PAGE"}
GMT_hours.formats			    		= {"%02.0f"}
GMT_hours.controllers					= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(GMT_hours)
-------------------------------------------------------------TIME SEP 2---------------------------------------------------------------------------------------------
TIME2_TEXT 					    		= CreateElement "ceStringPoly"
TIME2_TEXT.name 				    	= "TIME2_TEXT"
TIME2_TEXT.material 			    	= UFD_GRN
TIME2_TEXT.value 						= ":"
TIME2_TEXT.stringdefs 		    		= {0.0050, 0.0050, 0, 0.0}
TIME2_TEXT.alignment 					= "CenterCenter"
TIME2_TEXT.formats 			    		= {"%s"}
TIME2_TEXT.h_clip_relation       		= h_clip_relations.COMPARE
TIME2_TEXT.level 						= 2
TIME2_TEXT.init_pos 			    	= {-0.05, 0.85, 0}
TIME2_TEXT.init_rot 			    	= {0, 0, 0}
TIME2_TEXT.element_params 	    		= {"PMFD_MENU_PAGE","MFD_OPACITY",}
TIME2_TEXT.controllers		    		= {{"opacity_using_parameter",1},{"parameter_in_range",0,0.9,1.1}}
Add(TIME2_TEXT)
---------------------------------------------------------------MIN------------------------------------------------------------------------------------------------
GMT_mins				        		= CreateElement "ceStringPoly"
GMT_mins.name				    		= "GMT_mins"
GMT_mins.material			   			= UFD_GRN
GMT_mins.init_pos			    		= {0, 0.85, 0}
GMT_mins.alignment						= "CenterCenter"
GMT_mins.stringdefs						= {0.0050, 0.0050, 0, 0.0}
GMT_mins.additive_alpha					= true
GMT_mins.collimated						= false
GMT_mins.isdraw							= true	
GMT_mins.use_mipfilter					= true
GMT_mins.h_clip_relation	    		= h_clip_relations.COMPARE
GMT_mins.level							= 2
GMT_mins.element_params					= {"MFD_OPACITY","GMT_MINS","PMFD_MENU_PAGE"}
GMT_mins.formats			    		= {"%02.0f"}
GMT_mins.controllers					= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(GMT_mins)
-------------------------------------------------------------TIME SEP 1---------------------------------------------------------------------------------------------
TIME1_TEXT 					    		= CreateElement "ceStringPoly"
TIME1_TEXT.name 				    	= "TIME1_TEXT"
TIME1_TEXT.material 			    	= UFD_GRN
TIME1_TEXT.value 						= ":"
TIME1_TEXT.stringdefs 		    		= {0.0050, 0.0050, 0, 0.0}
TIME1_TEXT.alignment 					= "CenterCenter"
TIME1_TEXT.formats 			    		= {"%s"}
TIME1_TEXT.h_clip_relation       		= h_clip_relations.COMPARE
TIME1_TEXT.level 						= 2
TIME1_TEXT.init_pos 			    	= {0.05, 0.85, 0}
TIME1_TEXT.init_rot 			    	= {0, 0, 0}
TIME1_TEXT.element_params 	    		= {"PMFD_MENU_PAGE","MFD_OPACITY",}
TIME1_TEXT.controllers		    		= {{"opacity_using_parameter",1},{"parameter_in_range",0,0.9,1.1}}
Add(TIME1_TEXT)
---------------------------------------------------------------SEC------------------------------------------------------------------------------------------------
GMT_sec				        			= CreateElement "ceStringPoly"
GMT_sec.name				    		= "GMT_sec"
GMT_sec.material			   			= UFD_GRN
GMT_sec.init_pos			    		= {0.1, 0.85, 0}
GMT_sec.alignment						= "CenterCenter"
GMT_sec.stringdefs						= {0.0050, 0.0050, 0, 0.0}
GMT_sec.additive_alpha					= true
GMT_sec.collimated						= false
GMT_sec.isdraw							= true	
GMT_sec.use_mipfilter					= true
GMT_sec.h_clip_relation	    			= h_clip_relations.COMPARE
GMT_sec.level							= 2
GMT_sec.element_params					= {"MFD_OPACITY","GMT_SECS","PMFD_MENU_PAGE"}
GMT_sec.formats			    			= {"%02.0f"}
GMT_sec.controllers						= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(GMT_sec)
-------------------------------------------------------------LOCAL CLOCK--------------------------------------------------------------------------------------------
---------------------------------------------------------------HOURS------------------------------------------------------------------------------------------------
LOCAL_hours				        		= CreateElement "ceStringPoly"
LOCAL_hours.name				    	= "LOCAL_hours"
LOCAL_hours.material			   		= UFD_GRN
LOCAL_hours.init_pos			    	= {-0.1, -0.85, 0}
LOCAL_hours.alignment					= "CenterCenter"
LOCAL_hours.stringdefs					= {0.0050, 0.0050, 0, 0.0}
LOCAL_hours.additive_alpha				= true
LOCAL_hours.collimated					= false
LOCAL_hours.isdraw						= true	
LOCAL_hours.use_mipfilter				= true
LOCAL_hours.h_clip_relation	    		= h_clip_relations.COMPARE
LOCAL_hours.level						= 2
LOCAL_hours.element_params				= {"MFD_OPACITY","LOCAL_HOURS","PMFD_MENU_PAGE"}
LOCAL_hours.formats			    		= {"%02.0f"}
LOCAL_hours.controllers					= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(LOCAL_hours)
-------------------------------------------------------------TIME SEP 4---------------------------------------------------------------------------------------------
TIME4_TEXT 					    		= CreateElement "ceStringPoly"
TIME4_TEXT.name 				    	= "TIME4_TEXT"
TIME4_TEXT.material 			    	= UFD_GRN
TIME4_TEXT.value 						= ":"
TIME4_TEXT.stringdefs 		    		= {0.0050, 0.0050, 0, 0.0}
TIME4_TEXT.alignment 					= "CenterCenter"
TIME4_TEXT.formats 			    		= {"%s"}
TIME4_TEXT.h_clip_relation       		= h_clip_relations.COMPARE
TIME4_TEXT.level 						= 2
TIME4_TEXT.init_pos 			    	= {-0.05, -0.85, 0}
TIME4_TEXT.init_rot 			    	= {0, 0, 0}
TIME4_TEXT.element_params 	    		= {"PMFD_MENU_PAGE","MFD_OPACITY",}
TIME4_TEXT.controllers		    		= {{"opacity_using_parameter",1},{"parameter_in_range",0,0.9,1.1}}
Add(TIME4_TEXT)
---------------------------------------------------------------MIN------------------------------------------------------------------------------------------------
LOCAL_mins				        		= CreateElement "ceStringPoly"
LOCAL_mins.name				    		= "LOCAL_mins"
LOCAL_mins.material			   			= UFD_GRN
LOCAL_mins.init_pos			    		= {0, -0.85, 0}
LOCAL_mins.alignment					= "CenterCenter"
LOCAL_mins.stringdefs					= {0.0050, 0.0050, 0, 0.0}
LOCAL_mins.additive_alpha				= true
LOCAL_mins.collimated					= false
LOCAL_mins.isdraw						= true	
LOCAL_mins.use_mipfilter				= true
LOCAL_mins.h_clip_relation	    		= h_clip_relations.COMPARE
LOCAL_mins.level						= 2
LOCAL_mins.element_params				= {"MFD_OPACITY","LOCAL_MINS","PMFD_MENU_PAGE"}
LOCAL_mins.formats			    		= {"%02.0f"}
LOCAL_mins.controllers					= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(LOCAL_mins)
-------------------------------------------------------------TIME SEP 3---------------------------------------------------------------------------------------------
TIME3_TEXT 					    		= CreateElement "ceStringPoly"
TIME3_TEXT.name 				    	= "TIME3_TEXT"
TIME3_TEXT.material 			    	= UFD_GRN
TIME3_TEXT.value 						= ":"
TIME3_TEXT.stringdefs 		    		= {0.0050, 0.0050, 0, 0.0}
TIME3_TEXT.alignment 					= "CenterCenter"
TIME3_TEXT.formats 			    		= {"%s"}
TIME3_TEXT.h_clip_relation       		= h_clip_relations.COMPARE
TIME3_TEXT.level 						= 2
TIME3_TEXT.init_pos 			    	= {0.05, -0.85, 0}
TIME3_TEXT.init_rot 			    	= {0, 0, 0}
TIME3_TEXT.element_params 	    		= {"PMFD_MENU_PAGE","MFD_OPACITY",}
TIME3_TEXT.controllers		    		= {{"opacity_using_parameter",1},{"parameter_in_range",0,0.9,1.1}}
Add(TIME3_TEXT)
---------------------------------------------------------------SEC------------------------------------------------------------------------------------------------
LOCAL_sec				        		= CreateElement "ceStringPoly"
LOCAL_sec.name				    		= "LOCAL_sec"
LOCAL_sec.material			   			= UFD_GRN
LOCAL_sec.init_pos			    		= {0.1, -0.85, 0}
LOCAL_sec.alignment						= "CenterCenter"
LOCAL_sec.stringdefs					= {0.0050, 0.0050, 0, 0.0}
LOCAL_sec.additive_alpha				= true
LOCAL_sec.collimated					= false
LOCAL_sec.isdraw						= true	
LOCAL_sec.use_mipfilter					= true
LOCAL_sec.h_clip_relation	    		= h_clip_relations.COMPARE
LOCAL_sec.level							= 2
LOCAL_sec.element_params				= {"MFD_OPACITY","LOCAL_SECS","PMFD_MENU_PAGE"}
LOCAL_sec.formats			    		= {"%02.0f"}
LOCAL_sec.controllers					= {{"opacity_using_parameter",0},{"text_using_parameter",1,0},{"parameter_in_range",2,0.9,1.1}}
Add(LOCAL_sec)
