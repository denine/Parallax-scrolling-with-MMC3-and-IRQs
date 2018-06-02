irq:
 pha
 txa
 pha
 tya
 pha
 
 lda #1
 sta $E000
 
 ldx irqno
 ldy #$0
 sty $8000
 lda chrnums,x	;get chr page for current strip
 sta $8001
 iny
 sty $8000
 add #2
 sta $8001		;set graphics
 
 lda scanlines,x
 sta $E000
 sta $C000
 sta $C001
 sta $E000
 sta $E001

 nop
 nop			;writes to ppuscroll should be made as close to Hblank as possible
 nop			;(but before actual Hblank starts). So we burn some cpu time with NOPs.
 
 lda $2002		;reset ppu toggle, so our write to ppuscroll changes X scroll.
 lda stripsx+1,x
 sta ppuscroll
 lda #0
 sta ppuscroll
 
 inc irqno
 
 pla
 tay
 pla
 tax
 pla
 
 rti
 
 
;----
chrnums			;chr pages for strips
 db 4,8,8
scanlines		;the height of each strip. Last one whould reach "below" screen so irq can be reset in vblank
 db $5f,$23,$FF