titlestart:
 jsr turnninoff
 
 ldx #0
 jsr uplpal				;upload palette
 
;-----					;upload nametable to VRAM.
 lda #$20
 sta ppuaddr
 lda #0
 sta ppuaddr
 lda #<nametable
 sta addr
 lda #>nametable
 sta addr+1
 ldx #0
 ldy #0
@loop
 lda (addr),y
 sta ppudata
 iny
 bne @loop
 inc addr+1
 inx
 cpx #4
 bne @loop
;-----
 jsr turnninon
@lp
 jsr waitframe

 lda stripsspd
 bne @1
 lda #3				;mountains move one pixel every two frames
 sta stripsspd
 inc stripsx
@1
 dec stripsspd
 
 ;no code for logo - it doesnt move at all
 
 inc stripsx+2			;fence moves one pixel every frame

 inc stripsx+3			;ground moves twice every frame
 inc stripsx+3
 
 jmp @lp
 

;--
nametable:
 incbin "gfx\nametable.nam"