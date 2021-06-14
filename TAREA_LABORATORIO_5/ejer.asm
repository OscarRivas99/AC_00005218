org 100h

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d

  ;  MOV BP, cadena

    MOV DH, 10; fila en la que se mostrará el cursor
    MOV DL, 20 ;columna en la que se mostrará el cursor
    MOV byte [200h], 12 ; seteando a la direccion de memoria 200 el valor de 12(fila)
    MOV byte [201h], 14 ; seteando a la direccion de memoria 200 el valor de 14(fila)
    MOV byte [202h], 16 ; seteando a la direccion de memoria 200 el valor de 16(fila)

    call modotexto

    IteracionN1:
    ;Loop para mover el cursor e imprimir el primer nombre
    
        call movercursor ;llamada a mover cursor
        MOV CL, [cadena+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter; Llamada a escribircaracter
        INC SI ; SE SUMA 1 A SI PARA CONTINUAR CON EL SIGUIENTE CARACTER
        INC DL ; SE SUMA 1 A DL PARA MOVER CURSOR A LA SIGUIENTE COLUMNA
        INC DI ; contador para terminar la ejecución del programa al llegar a 6
        CMP DI, 06d ; Comparación de DI con 06d que son los caracteres de OSCAR contando el espacio
        JB IteracionN1 ; si DI es menor a 6, entonces que siga iterando.
        MOV DI, 0  ; se reinicia el iterador de caracteres
        MOV DL, 20  ; ser reinicia el valor de la columna otra vez a 20 para comenzar en la siguiente fila 
        jmp IteracionN2 ; salta a la iteracion del segundo nombre.

    IteracionN2:
    ;Loop para mover el cursor y el caracter a imprimir en pantalla
        MOV DH, [200h]
        call movercursor ;llamada a mover cursor
        MOV CL, [cadena+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter; Llamada a escribircaracter
        INC SI ; SE SUMA 1 A SI PARA CONTINUAR CON EL SIGUIENTE CARACTER
        INC DL ; SE SUMA 1 A DL PARA MOVER CURSOR A LA SIGUIENTE COLUMNA
        INC DI ; contador para terminar la ejecución del programa al llegar a 8
        CMP DI, 08d ; Comparación de DI con 08d que es el numero de caracteres de EDUARDO contando el espacio
        JB IteracionN2 ; si DI es menor a 10, entonces que siga iterando.
        MOV DI, 0 ; se reinicia el iterador de caracteres
        MOV DL, 20 ; ser reinicia el valor de la columna otra vez a 20 para comenzar en la siguiente fila 
        jmp IteracionA1 ; salta a la iteracion del primer apellido
    
    IteracionA1:
    ;Loop para mover el cursor y el caracter a imprimir en pantalla
        MOV DH, [201h]
        call movercursor ;llamada a mover cursor
        MOV CL, [cadena+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter; Llamada a escribircaracter
        INC SI ; SE SUMA 1 A SI PARA CONTINUAR CON EL SIGUIENTE CARACTER
        INC DL ; SE SUMA 1 A DL PARA MOVER CURSOR A LA SIGUIENTE COLUMNA
        INC DI ; contador para terminar la ejecución del programa al llegar a 6
        CMP DI, 06d ; Comparación de DI con 06d que es el numero de caracteres de RIVAS contando el espacio
        JB IteracionA1 ; si DI es menor a 6, entonces que siga iterando.
        MOV DI, 0 ; se reinicia el iterador de caracteres
        MOV DL, 20 ; se reinicia el iterador de caracteres
        jmp IteracionA2 ; salta a la iteracion del segundo apellido

    IteracionA2:
    ;Loop para mover el cursor y el caracter a imprimir en pantalla
        MOV DH, [202h]
        call movercursor ;llamada a mover cursor
        MOV CL, [cadena+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter; Llamada a escribircaracter
        INC SI ; SE SUMA 1 A SI PARA CONTINUAR CON EL SIGUIENTE CARACTER
        INC DL ; SE SUMA 1 A DL PARA MOVER CURSOR A LA SIGUIENTE COLUMNA
        INC DI ; contador para terminar la ejecución del programa al llegar a 7
        CMP DI, 07d ; Comparación de DI con 07d que es el numero de caracteres de BORJAS contando el espacio
        JB IteracionA2 ; si DI es menor a 7, entonces que siga iterando.
        MOV DI, 0 ; se reinicia el iterador de caracteres
        MOV DL, 20 ; se reinicia el iterador de caracteres
        jmp esperartecla ; salta a esperar tecla, para finalizar la ejecucion

    modotexto: 
    
        MOV AH, 0h ; activa modo texto
        MOV AL, 03h ; modo gráfico deseado
        INT 10h
        RET
    movercursor:
     
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV BH, 0h 
        INT 10h
        RET
    escribircaracter:
            
        MOV AH, 0Ah ; escribe caracter en pantalla según posición del cursor
        MOV AL, CL ; denotamos el caracter a escribir en pantalla, los valores deben ser según código hexadecimal de tabla ASCII
        MOV BH, 0h ; número de página
        MOV CX, 1h ; número de veces a escribir el caracter
        INT 10h
        RET

    esperartecla:
   
        MOV AH, 00h ;espera buffer del teclado para avanzar en la siguiente instrucción
        INT 16h
    exit:
        int 20h



    section .data

    cadena DB 'Oscar Eduardo Rivas Borjas'
    