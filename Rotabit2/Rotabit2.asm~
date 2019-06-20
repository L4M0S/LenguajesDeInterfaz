org 00h
mov a,#00h
mov b,#05h
mov p0,a
ljmp inicio
inicio: mov a,#01h
aca: mov p0,a
rl a
cjne a,#80h,aca
alla: mov p0,a
rr a
cjne a,#01h,alla
djnz b,inicio
end