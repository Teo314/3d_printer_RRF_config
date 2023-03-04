; homex.g

G91 						; relative mode
;G1 S2 Z4 F200 				; raise head to avoid dragging nozzle over the bed
G1 H1 X-400 F3000 			; move up to 240mm in the -X direction, stopping if the homing switch is triggered
G1 X5 F500 					; move slowly 4mm in the +X direction
G1 H1 X-10 					; move slowly 10mm in the -X direction, stopping at the homing switch
;G1 S2 Z-4 F200 			; lower the head again
G90 						; back to absolute mode