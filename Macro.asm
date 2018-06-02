ppuaddr = $2006
ppudata = $2007
spriteblock = $700
dmafunc = $4014
control0 = $2000
control1 = $2001
ppuscroll = $2005

;-----------------------
macro add var
 clc
 adc var

 .endm

;-----------------------
macro sub var
 sec
 sbc var

 .endm

;-----------------------
macro nega
 eor #255
 clc
 adc #1

 .endm
