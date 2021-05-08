
org     100h

        XOR CX,CX
        mov ch,00
        mov cl,05  ;Factorial de 5
        mov ah,00
        mov al,01
        cmp cl,00
        jz salto1
condic  mul cx
        loop condic
salto1  mov [20Bh],al        

        int 20h
