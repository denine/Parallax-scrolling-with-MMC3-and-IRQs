   .enum 0
global: dsb 1		;a global for nmi synchronization
ppu0: dsb 1
ppu1: dsb 1			;ppu control and ppu mask updates in vblank
addr: dsb 2			;ram for indirect addressing
irqno: dsb 1		;irq\strip counter.
stripsx: dsb 4		;we have 4 strips to scroll
stripsspd: dsb 1	;speed counter for mountain strip
gamepal: dsb 25		;games palette, used to update palette during vblank