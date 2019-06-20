;https://app.box.com/s/1x7yulf92vizkvbvke3gz3gz13w0wugu
CR EQU 0dh
LF EQU 0Ah
RET_TX EQU 30H
tx EQU 31H

ORG 000H; encendido o reset 
AJMP inicio
ORG 0003H; external interrupt 0 
ACALL RETARDO 
ACALL INT_EXT_0
reti; 
ORG 000BH; timer 0 overflow vector
reti; 

ORG 0013H; external interrupt 1 vector
reti

org 001BH
reti

ORG 0023H;direccion del interruptor del puerto serial
MOV P0,SBUF
CLR RI;nueva interrupcion
RETI

ORG 0050H

inicio:;****** MODO SERIAL 9600 1BIT INICIO 1 BIT PARADA 8 BIT DATOS
MOV SCON,#050H   ;RX habilitada y modo 2
SETB ES;interrupcion serial
SETB EX0         ;Habilitando la interrupcion externa 0
SETB IT0         ;Activado por nivel bajo
SETB EA;interrupcion global
;****** TIMER
MOV TMOD,#20H             ;TIMER 1 MODO AUTORECARGA
MOV TH1,#0fDH       ;CARGA PARA 9600 BAUDIOS
SETB TR1;INICIO DEL TIMER 1
mov p0,#00

;REPEAT:
;NOP
;NOP
;NOP
;NOP
;JMP REPEAT

INT_EXT_0:
mov dptr,#mensaje
mov r0,#0
seguir_tx_men:
mov a,r0
movc a,@a+dptr
mov tx,a
call tx_
inc r0
cjne a,#0ah,seguir_tx_men
RET

TX_:
clr ri
clr ti
mov sbuf,tx

falta_tx:
;jnb TI,falta_tx
clr TI
;call delay_TX
ret

MENSAJE:
DB 'HOLA MUNDO',0dh,0ah,'$'

RETARDO:
MOV R7,#80H
LAZO2: MOV R6,#05H
LAZO1:  DJNZ R6,LAZO1
DJNZ R7,LAZO2
RET

DELAY_TX:
MOV RET_TX,#0ffH

AAA:
DJNZ RET_TX,AAA
RET

END