org 100h

section .text

; OSCAR EDUARDO RIVAS BORJAS 00005218

        XOR AX, AX ; Limpiando el registro AX
        XOR BX, BX 
        XOR SI, SI
        MOV BL,8d
        MOV word CX,8d
        MOV SI,00
        MOV AX, 00d ; Mover a AX 0

        MOV byte [0200h],00
        MOV byte [0201h],00
        MOV byte [0202h],00
        MOV byte [0203h],00
        MOV byte [0204h],05
        MOV byte [0205h],02
        MOV byte [0206h],01
        MOV byte [0207h],08
        
        jmp sumarcarne ; salto sin condición, vamos a la etiqueta sumarcarne
sumarcarne:
        
        ADD AL, [0200h+ SI] ; Sumo a AX un 0
        INC SI
        loop iterar
       
        
promedio:
        DIV BL
        MOV [20Ah], AX
        jmp exit

exit:
        int 20h

; 0+0+0+0+5+2+1+8 = 16
; Promedio = 2