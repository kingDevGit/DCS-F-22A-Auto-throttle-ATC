local count = 0
local function counter()
	count = count + 1
	return count
end
-------DEVICE ID-------
devices = {}
devices["AVIONICS"]				= counter()--01
devices["ELECTRICAL_SYSTEM"]	= counter()--02
devices["ENGINE_SYSTEM"]		= counter()--03
devices["WEAPON_SYSTEM"]		= counter()--04
devices["MFD_SYSTEM"]			= counter()--05
devices["PMFD_SYSTEM"]			= counter()--06
devices["ICP_SYSTEM"]			= counter()--07
devices["FCS"]		  			= counter()--08
devices["CLOCK_GMT"]			= counter()--09	--NIGHTSTORM
devices["CLOCK_LOCAL"]			= counter()--10	--NIGHTSTORM
devices["MISSION_TIMER"]		= counter()--11	--NIGHTSTORM
devices["NAVIGATION"]			= counter()--12	--NIGHTSTORM
devices["AUTOTHROTTLE"]			= counter()--13	--FlyingAlex
--devices["NVG"]					= counter()--only works for SU-25T I believe...sigh