	processor 6502

	seg code
	org $F000


	;; Adequate assembly 6502 to the 6507 architecture ;;
	
Start:
	sei			; Disable interrupts
	cld			; Disable BCD decimal math mode
	ldx #$FF
	txs

	;; Clear the Page Zero region
	;; RAM and TIA registers

	lda #0
	ldx #$FF
	sta $FF

MemLoop:
	dex
	sta $0,X
	bne MemLoop

	;; Fill ROM size to 4KB

	org $FFFC
	.word Start		; Reset vector
	.word Start		; Interrupt vector
