;----------------------------------------------------------------
; constants
;----------------------------------------------------------------
 include "Macro.asm"
 include "vars.asm"
   .ende

;----------------------------------------------------------------
; iNES header
;----------------------------------------------------------------

   .db "NES", $1a ;identification of the iNES header
   .db $01 ;number of 16KB PRG-ROM pages
   
   .db $02 ;number of 8KB CHR-ROM pages
   .db $40|%0000 ;mapper 2 and mirroring
   .dsb 9, $00 ;clear the remaining bytes

;----------------------------------------------------------------
; All data
;----------------------------------------------------------------
 .base $C000
 include "Sys\Reset.asm"
 include "Sys\nmi.asm"
 include "Sys\irq.asm"
 include "Sys\general.asm"
 include "sys\title.asm"
 
 .org $fffa
 dw nmi
 dw reset
 dw irq
 
 incbin "gfx\top.chr"
 incbin "gfx\logo.chr"
 incbin "gfx\bottom.chr"
 
;----
 align $4000				;a dummy chr bank to have a nice round 32kb ROM