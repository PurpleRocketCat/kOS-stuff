// kOStok Launch v1.0.0

FUNCTION TILT {
	PARAMETER minimum_altitude.
	PARAMETER angle.
	
	WAIT UNTIL ALTITUDE > minimum_altitude.
	NOTIFY("Locking heading to " + angle + " degrees").
	LOCK STEERING TO HEADING(0, angle).
}

NOTIFY("Launch program initiated").
TILT(0,80), LOCK THROTTLE TO 1.

WAIT 5. NOTIFY("Launching!"). STAGE.

WAIT UNTIL VERTICALSPEED > 300. LOCK THROTTLE TO 0.35.

TILT(10000, 70).
TILT(20000, 55).
TILT(30000, 40).

WAIT UNTIL APOAPSIS > 70000.
TILT(0, 10). LOCK THROTTLE TO 0.1.

WAIT UNTIL STAGE:LIQUIDFUEL < 180. 
NOTIFY("Ditching launch stage"). 
LOCK THROTTLE to 0. WAIT 5. STAGE

WAIT UNTIL ETA: APOAPSIS < 20. 
TILT(0, 0). WAIT 5. LOCK THROTTLE TO 1

WAIT UNTIL PERIAPSIS > 70000.
LOCK THROTTLE TO 0. NOTIFY("Orbit achieved"). 

WAIT 5. NOTIFY("Shutting down").
SET SHIP:CONTROL:PILOTMAINTHROTTLE TO 0. SHUTDOWN.
