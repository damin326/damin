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
        FLOAT
	LDA	CNT
	COMP    TWO
        JEQ     ADDF
        LDX     INDEX
        STF     STACK, X
        LDA     TOP
        ADDR    A, X
        STX     INDEX
	LDA	TWO
	STA	CNT
        J       INPUT

SPACEF	LDA	ONE
	STA	CNT
	J	INPUT

ADDF	STF     TMP
        LDA	TOP
	SUBR	A, X
	LDF	STACK, X
	MULF	#10
	ADDF	TMP
	STF	STACK, X
	ADDR	A, X
	STX	INDEX
	J	INPUT

PLUSF   LDA     TOP
        LDX     INDEX
        SUBR    A, X
        LDF     STACK, X
        STF     TMP
        SUBR    A, X
        LDF     STACK, X
        ADDF    TMP
        STF     STACK, X
        ADDR    A, X
        STX     INDEX
        J       INPUT

MINUSF  LDA     TOP
        LDX     INDEX
        SUBR    A, X
        LDF     STACK, X
        STF     TMP
        SUBR    A, X
        LDF     STACK, X
        SUBF    TMP
        STF     STACK, X
        ADDR    A, X
        STX     INDEX
        J       INPUT

MULF    LDA     TOP
        LDX     INDEX
        SUBR    A, X
        LDF     STACK, X
        STF     TMP
        SUBR    A, X
        LDF     STACK, X
        MULF    TMP
        STF     STACK, X
        ADDR    A, X
        STX     INDEX
        J       INPUT

DIVF    LDA     TOP
        LDX     INDEX
        SUBR    A, X
        LDF     STACK, X
        STF     TMP
        SUBR    A, X
        LDF     STACK, X
        DIVF    TMP
        STF     STACK, X
        ADDR    A, X
        STX     INDEX
        J       INPUT

PRINT   LDX     TOP
        LDF     STACK, X
        FIX
        COMP    #10
        JLT     SPRINT
        DIV     #10
        ADD     ZERO
        WD      STDOUT
        SUB     ZERO
        MUL     #10
        STA     TMP
        LDF     STACK, X
        FIX
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
INDEX   WORD    0x6
TMP     WORD    0x6
CNT	WORD	0x1
ONE	WORD	0x1
TWO	WORD	0x2
STACK   RESW    100
TOP     WORD    0x6
TEN     WORD    0xA
ZERO    WORD    0x30
PLUS    WORD    0x2B
MINUS   WORD    0x2D
MUL     WORD    0x2A
DIV     WORD    0x2F
SPACE   WORD    0x20
