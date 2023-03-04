;Update: 04.03.2023

; Drives
M569 P0.1 S0
M569 P0.2 S1                		; physical drive X 0.2 goes forwards 
M569 P0.3 S1                		; physical drive Y 0.3 goes forwards 
M569 P0.4 S1

M584 X0.2 Y0.3 Z0.4 E0.1						; set drive mapping

M350 X16 Y16 Z16 E16 I1           				; configure microstepping with interpolation
;M92 X160.61 Y160.05 Z1911 E837	    			; set steps per mm
;M92 X80.709 Y81.444 Z1911 E837	    			; set steps per mm
M92 X80.709 Y81.444 Z1274 E837	    			; set steps per mm
;M92 X80.305 Y80.025 Z1911 E837:481
M566 X540 Y540		        			; set maximum instantaneous speed changes (mm/min)
M203 X5000 Y5000 Z500					; set maximum speeds (mm/min)
M201 X400 Y300 Z200		        		; set accelerations (mm/s^2)
M906 X1200 Y1400 Z1700 E550				; set motor currents (mA) and motor idle factor in per cent

M574 X1 P"io0.in" S1				; set X endstop
M574 Y1 P"io1.in" S1				; set Y endstop
M574 Z1 P"io2.in" S1
M208 X350 Y270 Z240

;===== HEATERS =====

; Bed
M308 S0 P"0.temp0" Y"PT1000"					; configure sensor 0 as thermistor on pin temp0
M950 H0 C"out0" T0                          	; create bed heater output on out0 and map it to sensor 0
M307 H0 B0 R0.138 C1807.3 D34.64 S0.70 V26.1	; tuning results for 65*C without closed chamber and at 26.1 V
M140 H0                                     	; map heated bed to heater 0
M143 H0 S120                                	; set temperature limit for heater 0 to 120C

; Right extruder
M308 S2 P"0.temp2" Y"thermistor"
M950 H2 C"out2" T2
M307 H2 R3.042 K0.418:0.123 D7.28 E1.35 S1.00 B0 V24.0		; PID tuning for PLA
M307 H1 B0 S1.00 
M143 H0 S280                               	; set temperature limit for heater 3 to 300*C
M950 F2 C"out1"
M563 P1 S"Right extruder" D0.1 H2 F2

M572 D0 S0.075			; pressure advance for PLA
M572 D1 S0.075			; pressure advance for PLA

M302 P1