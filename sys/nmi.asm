nmi:
 pha
 txa
 pha
 tya
 pha

 inc global
 
 lda #>(spriteblock)
 sta dmafunc				;send empty sprites to OAM.

;----						;set IRQ
 lda #$31
 sta $E000
 sta $C000
 sta $C001
 sta $E000
 sta $E001
;----
 lda #$3F
 sta ppuaddr				;send palette to PPU
 lda #0
 sta ppuaddr

 ldx gamepal
offset = 0
 rept 8
 stx ppudata
 lda gamepal+1+offset
 sta ppudata
 lda gamepal+2+offset
 sta ppudata
 lda gamepal+3+offset
 sta ppudata
 offset = offset+3
 endr
;--							;set PPU controls
 lda ppu0
 sta control0
 lda ppu1
 sta control1
 
 lda stripsx
 sta ppuscroll				;set scroll
 lda #-1
 sta ppuscroll

 lda #$0
 sta irqno					;a number of strip to process
 sta $8000					;set chr page for bgs
 sta $8001
 lda #1
 sta $8000					;set chr page for bg
 lda #2
 sta $8001
 
 pla
 tay
 pla
 tax
 pla
 
 rti