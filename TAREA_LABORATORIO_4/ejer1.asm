
        org     100h

        section .text

        mov     BP, arrNum     ; BP = puntero a arrByte
   
        call    ParImpar        ; llama función

        
     
        int     20h

        section .data

arrNum db      01,02,03,04,06,07,08,09,10,11,0xA                 ; arreglo de numeros byte empezando en dirección arrByte
     

; FUNCIONES


ParImpar:
        xor     SI, SI          ; SI = 0
        xor     DI, DI 
while:  
        mov     AL, [BP+SI]     ; AL = [puntero a arreglo + SI]
        cmp     AL, 0xA         ; verifica si AL == 0xA
        je       end
        inc     SI
        mov      BL,2
        div      BL            
        cmp      AH,0
        je       esPar
        ja       esImpar     
esPar:
        mov byte    [300h+DI], AL   
        inc     DI  
        jmp     while
esImPar:
        mov byte    [320h+DI], AL 
        inc     DI   
        jmp     while

end:    
        ret       


