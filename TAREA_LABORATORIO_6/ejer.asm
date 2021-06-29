; GUARDAR UNA CADENA EN UN VARIABLE Y ESCRIBIRLA EN LA CONSOLA DE MS-DOS
; MAIN
	org 	100h

	section	.text

    MOV BP, frase                 ; se guardan los caracteres de frase en el registro BP
	call  	LeerCadena

	call 	EscribirCadena

	call	EsperarTecla

	int 	20h

	section	.data

msg1	db	"BIENVENIDO$"               ; MENSAJE DE BIENVENIDO
msg3 	db 	"INCORRECTO$"             ; MENSAJE DE INCORRECTO
pass 	db 	"arqui$"                 ; CLAVE 
frase 	times 	20  	db	" " 	 ; FRASE A LEER

; FUNCIONES

; Permite leer un carácter de la entrada estándar con echo
; Parámetros:   AH: 07h         
; Salida:       AL: caracter ASCII leído
EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret


; Leer cadena de texto desde el teclado
; Salida:       SI: longitud de la cadena 		BP: direccion de guardado
LeerCadena:
        xor     SI, SI          ; SI = 0
while:  
        call    EsperarTecla    ; retorna un caracter en AL
        cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
        je      exit           ; si AL == EnterKey, saltar a exit
        mov     [BP+SI], AL   	; guardar caracter en memoria
        jmp     validar           ; saltar a validar

validar:
    
	mov 	CL,[frase + SI]   ; se coloca el caracter actual de la frase ingresada en el registro CL, recorriendo caracter por caracter
	mov 	BL,[pass + SI]    ; se coloca el caracter actual de la clave definida en el registro BL, recorriendo caracter por caracter
	INC     SI             	  ; se incrementa el registro indice SI para modficar la posicion en las cadenas corresponientes y recorrerla.
	CMP     BL,CL          	  ; se comparan los registros BL Y CL que contienen el caracter actual de ambas cadenas.
	JE      Correcto      	  ; si todos los caracteres coinciden con la otra cadena se salta a Correcto
	JNP     Incorrecto    	  ; si por lo menos un caracter no coincide, se salta a Incorrecto
	jmp     while 
    
Correcto:
		XOR  DX,DX            
		MOV DX, msg1    ; se manda la cadena al registro DX  que se encarga de escribir el mensaje de CORRECTO al ser parametro de la funcion EscribirCadena
		jmp while
Incorrecto:
		XOR  DX,DX
		MOV DX, msg3    ; se manda la cadena al registro DX  que se encarga de escribir el mensaje de INCORRECTO al ser parametro de la funcion EscribirCadena
		jmp while

exit:
	mov 	byte [BP+SI], "$"	; agregar $ al final de la cadena
        ret


EscribirCadena:
	mov 	AH, 09h
	int 	21h
	ret