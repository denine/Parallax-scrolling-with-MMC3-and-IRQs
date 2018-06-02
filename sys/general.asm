waitframe:
 lda global
@1
 cmp global
 beq @1
 rts

;---------
turnninon:
 lda #%10001000
turnninoncon0
 sta ppu0
turnninoncon1
 lda #%00011110
 sta ppu1
 
 lda $2002
 lda #$80
 sta control0
 jsr waitframe
 
 rts
;---------
turnninoff:
 lda #0
 sta control1
 sta ppu1
 
 lda #$80
 sta control0
 sta ppu0
 
 jmp waitframe
;---------
uplpal:				;x-id
 lda palsl,x
 sta addr
 lda palsh,x
 sta addr+1

 ldy #0
 ldx #0
@lp
 lda (addr),y
 sta gamepal,x
 inx
 iny
 cpy #13+12
 bne @lp
 
@end:
 rts
 
palsl:
 dl splashpal
palsh:
 dh splashpal
 
splashpal:
 hex 0f
 hex 022120
 hex 021620
 hex 001020
 hex 020010