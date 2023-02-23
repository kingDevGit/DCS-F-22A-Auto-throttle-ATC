# DCS-F-22A-Auto-throttle-ATC
Add-on Script to enable Auto throttle to DCS World F-22A Community Mod
Concept is similar to F/A-18C ATC 
This ATC mod is ported from JAS39 Gripen Mod.  Thanks for keeping the works open-source Whisky_actual!

# Reason

I'm a lazy computer pilot.  I always use ATC to land F/A-18C.  I believe F-22A must have ATC feature so I implement it.

Actually it's really hard to keep AoA when there's no "E Bucket" on F-15C Avionics unlike F-16 or F/A-18C.  Also when the weather is bad it's really hard to land.

With this mod, you can land easily with the help of ilsn glidepath assists.

Moreover, the F-22A can gain speed easily while you are still working on the radar, rwr, nav ... With the atc cruise mode you have a handy way to keep speed and fuels consumption. 

# Video Demo

https://www.youtube.com/watch?v=aMsrY0aYt78

In the video I demo the landing with AoA 7 degree.  However I found it's more realistic to use degree of 12 to simulate the landing posture IRL. Nose up, cushion landing.

So you need to trim more up to land with this mod more than what I have shown in the video.
 

# Requirements
Grinnelli F-22A Community Mod from https://grinnellidesigns.com/f22/

nightstorm F-22A Enhancement Mod for best compatibiilty (as it's my current version) https://forum.dcs.world/topic/252855-f-22a-raptor-mod-enhancement-mod/

As currently only nightstorm is actively updating the mod.  This repo will keep updated with nightstorm's version.

Great work nightstorm.


# Installation
Copy "Scripts"&"Input" folder to "[PATH-TO-DCS-Saved-Game]/mods/aircraft/F-22A/" .  Overwrite existing files.
Add binding for Auto-throttle. It's under category Autopilot.

# Usage
After you bind a key to Auto-throttle, depress it to engage ATC.

This ATC has two modes and they will engage with different situations.

- Approach Mode
    This mode mainly is for landing. It will keep the plane with 12 degree of AoA.
    Would be engage when flaps down and speedbrake on.

    According to the F-22A landing video on youtube, it seems that speedbrake need to be on while landing.
    https://www.youtube.com/watch?v=or4w30frzF4
    https://www.youtube.com/watch?v=7WTiRgKEFbY

    P.S. Flaps need to be all down to engage in approach mode.  Wait the FLAPS DOWN text turn blue before depress engage atc.
    
    ## Landing procedure with ATC: 
    - Speedbrake out, when ias <=250knots, gear down, flaps down.
    - ATC engage, trim the velocity vector point to the runway.
    - Adjust banking with the stick, no need to touch the throttle anymore.
    - Once touched down, brake as usual.
    - Easy landed. Taxi to runway.

- Cruise Mode
    This mode is for cruise as the name stated. It will try to keep the plane with the TRUE AIRSPEED of the plane at the time ATC is engaged

   ## ATC would be disengaged when the following conditions are met:

    - Flaps position changed

    - Weight on Wheels

    - Master Caution Light On

- UFD will should the status text "ATC APPROACH"/"ATC CRUISE"

- Throttle would be unusable when ATC is engaged


- Approach mode will keep the aircraft with AoA 12 degrees.  With this AoA the aircraft could land with the posture very close to real life.

- Cruise mode will try to keep your existing true airspeed.  Useful on AAR, cruise.  The plane in this mod could accelerate very quickly so it could prevent the aircraft from draining fuels.  Also because of the same reason (plane easy to go fast), ATC won't be useful on slow speed as even you pull the throttle all way down the plane can still keep the speed for quite a while or even accelerate if you point the nose downward.  That's also why you need the speedbrake to maintain AoA in approach mode tho IRL F-22A do use the speedbrake while landing so it's close to realistic. 

# Work in progress
- Fine tune the PID settings.  Have not done any calculation of integration since graduation from college.
- Add animations for engaging / disengaging ATC
- Add more handy triggers to disengage the ATC

# Credits
- Development team of JAS39C Gripen Community Mod https://github.com/whisky-actual/Community-JAS-39-C for the logic of ATC and the PID setting
- Grinnelli for the mod
- nightstorm for keep updating the mod
