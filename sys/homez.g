; homez.g

G91 						; relative mode
G1 H1 Z-300 F500 			; move up to 240mm in the -X direction, stopping if the homing switch is triggered
G1 Z5 F300 					; move slowly 4mm in the +X direction
G1 H1 Z-10 					; move slowly 10mm in the -X direction, stopping at the homing switch
G90 						; back to absolute mode