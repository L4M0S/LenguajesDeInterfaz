
	org 00h
	mov a,#00h
	mov p0,a
	mov a,#0ffh
	mov p1,a

inicio:	mov a,p1
	cjne a,#01h,otra
	ljmp suma

suma:	mov a,p1
	mov b,p1
	add a,b
	mov p0,a
	ljmp inicio

otra:	cjne a,#02h,otra1
	ljmp resta
	
resta:	mov a,p1
	mov b,p1
	subb a,b
	mov p0,a
	ljmp inicio

otra1: 	cjne a,#03h,otra2
	ljmp multi

multi:	mov a,p1
	mov b,p1
	mul ab
	mov p0,a
	ljmp inicio

otra2: 	cjne a,#04h,otra3
	ljmp divi

divi:	mov a,p1
	mov b,p1
	div ab
	mov p0,a
	ljmp inicio

otra3:	cjne a,#05h,otra4
	ljmp sumal;sumalogica

sumal:	mov a,p1
	mov b,p1
	orl a,b
	mov p0,a
	ljmp inicio

otra4:	cjne a,#06h,otra5
	ljmp restal;restalogica

restal:	mov a,p1
	mov b,p1
	cpl a
	orl a,b
	mov p0,a
	ljmp inicio

otra5:	cjne a,#07h,otra6
	ljmp multil;multilogica

multil:	mov a,p1
	mov b,p1
	anl a,b
	mov p0,a
	ljmp inicio

otra6:	cjne a,#08h,otra7
	ljmp xor;

xor:	mov a,p1
	mov b,p1
	xrl a,b
	mov p0,a
	ljmp inicio

otra7:	cjne a,#09h,otra8
	;inversor
	mov a,p1
	cpl a
	mov p0,a
	ljmp inicio

otra8: 	ljmp inicio;

	end

;http://what-when-how.com/8051-microcontroller/loop-and-jump-instructions-in-8051/
;http://www.sc.ehu.es/sbweb/webcentro/automatica/web_8051/Contenido/set_8051/set8051.htm
;https://tallerelectronica.com/set-instrucciones-8051/