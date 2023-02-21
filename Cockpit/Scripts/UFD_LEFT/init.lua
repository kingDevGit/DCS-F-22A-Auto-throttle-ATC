dofile(LockOn_Options.common_script_path.."devices_defs.lua")

indicator_type = indicator_types.COMMON
purposes 	 = {render_purpose.GENERAL}
init_pageID		= 1

-------PAGE IDs-------
BASE    = 1
--INDICATION = 2

page_subsets  = {
[BASE]    		= LockOn_Options.script_path.."UFD_LEFT/base_page.lua",
--[INDICATION]    = LockOn_Options.script_path.."LDDI/indication_page.lua",
}
pages = 
{
	{
	 BASE,
	 --INDICATION
	 },
}
dofile(LockOn_Options.common_script_path.."ViewportHandling.lua")

try_find_assigned_viewport("F22A_UFD_LEFT")
