// Orbit v1.0.0

// note- thermometer is bound to the lights action group

TOGGLE LIGHTS.
PRINT "Launching in 5s...".
LOCK THROTTLE to 0.9.
LOCK STEERING to HEADING(90, 90).
WAIT 5.

PRINT "Launching!".
STAGE. 
WAIT 1. TOGGLE LIGHTS

WAIT UNTIL STAGE:SOLIDFUEL < 0.1.
WAIT 0.1
PRINT "Discarding boosters.".
STAGE.

WAIT UNTIL ALTITUDE > 20000. TOGGLE LIGHTS.
WAIT UNTIL ALTITUDE > 70000. TOGGLE LIGHTS.

WAIT UNTIL ALT.RADAR < 500. STAGE.
WAIT UNTIL ALT.RADAR < 1. WAIT 1. TOGGLE LIGHTS.
