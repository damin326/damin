INPUT   RD      STDIN
        COMP    ENTER
        JEQ     PRINT
        COMP    SPACE
        JEQ     SPACEF
        COMP    PLUS
        JEQ     PLUSF
        COMP    MINUS
        JEQ     MINUSF
        COMP    MUL
        JEQ     MULF
        COMP    DIV
        JEQ     DIVF
	
        SUB     ZERO
	STA	TMP
	LDA	CNT
	COMP    SIX
        JEQ     ADDF
	LDA	TMP
        LDX     INDEX
        STA     STACK, X
        LDA     TOP
        ADDR    A, X
        STX     INDEX
	ADD	TOP
	STA	CNT
        J       INPUT

SPACEF	LDA	TOP
	STA	CNT
	J	INPUT

ADDF	LDA	TOP
	SUBR	A, X
	LDA	STACK, X
	MUL	TEN
	ADD	TMP
	STA	STACK, X
	LDA	TOP
	ADDR	A, X
	STX	INDEX
	J	INPUT

PLUSF   LDA     TOP
        LDX     INDEX
        SUBR    A, X
        LDA     STACK, X
        STA     TMP
        LDA     TOP
        SUBR    A, X
        LDA     STACK, X
        ADD     TMP
        STA     STACK, X
        LDA     TOP
        ADDR    A, X
        STX     INDEX
        J       INPUT

MINUSF  LDA     TOP
        LDX     INDEX
        SUBR    A, X
        LDA     STACK, X
        STA     TMP
        LDA     TOP
        SUBR    A, X
        LDA     STACK, X
        SUB     TMP
        STA     STACK, X
        LDA     TOP
        ADDR    A, X
        STX     INDEX
        J       INPUT

MULF    LDA     TOP
        LDX     INDEX
        SUBR    A, X
        LDA     STACK, X
        STA     TMP
        LDA     TOP
        SUBR    A, X
        LDA     STACK, X
        MUL     TMP
        STA     STACK, X
        LDA     TOP
        ADDR    A, X
        STX     INDEX
        J       INPUT

DIVF    LDA     TOP
        LDX     INDEX
        SUBR    A, X
        LDA     STACK, X
        STA     TMP
        LDA     TOP
        SUBR    A, X
        LDA     STACK, X
        DIV     TMP
        STA     STACK, X
        LDA     TOP
        ADDR    A, X
        STX     INDEX
        J       INPUT

PRINT   LDX     TOP
        LDA     STACK, X
        COMP    TEN
        JLT     SPRINT
        DIV     TEN
        ADD     ZERO
        WD      STDOUT
        SUB     ZERO
        MUL     TEN
        STA     TMP
        LDA     STACK, X
        SUB     TMP
        ADD     ZERO
        WD      STDOUT
        J       STOP

SPRINT  ADD     ZERO
        WD      STDOUT
        J       STOP

STOP    J       STOP

STDIN   BYTE    0
STDOUT  BYTE    1
ENTER   WORD    10
INDEX   WORD    0x3
TMP     WORD    0x3
CNT	WORD	0x3
STACK   RESW    100
TOP     WORD    0x3
TEN     WORD    0xA
SIX	WORD	0x6
ZERO    WORD    0x30
PLUS    WORD    0x2B
MINUS   WORD    0x2D
MUL     WORD    0x2A
DIV     WORD    0x2F
SPACE   WORD    0x20
