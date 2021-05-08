org 100h

section .text

; OSCAR EDUARDO RIVAS BORJAS 00005218

        XOR AX, AX ; Limpiando el registro AX
        MOV AX, 00d ; Mover a AX 0
        jmp sumarcarne ; salto sin condición, vamos a la etiqueta sumarcarne
sumarcarne:
        
        ADD AX, 00 ; Sumo a AX un 0
        ADD AX, 00 ; Sumo a AX un 0
        ADD AX, 00 ; Sumo a AX un 0
        ADD AX, 00 ; Sumo a AX un 0
        ADD AX, 5d ; Sumo a AX un 5
        ADD AX, 2d ; Sumo a AX un 2
        ADD AX, 1d ; Sumo a AX un 1
        ADD AX, 8d ; Sumo a AX un 8

        jmp promedio ; Salto a la etiqueta promedio
        
promedio:
        MOV BL,8d
        DIV BL
        MOV [20Ah], AX
        jmp exit

exit:
        int 20h

; 0+0+0+0+5+2+1+8 = 16
; Promedio = 2