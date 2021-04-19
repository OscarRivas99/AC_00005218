              
              
              
              org 100h

              section  .text

; Escribir cuatro iniciales de su nombre completo empezando en la dirección de memoria 200h OSCAR EDUARDO RIVAS BORJAS 00005218

              MOV       byte [200h], "O"
              MOV       byte [201h], "E"
              MOV       byte [202h], "R"
              MOV       byte [203h], "B"
;Copiar el valor de 200h a AX usando direccionamiento directo.
              MOV       AX,  [200h]

;Copiar el valor de 201h a CX usando direccionamiento indirecto por registro.
              MOV       BX,  [201h]
              MOV       CX,  [BX]
;Copiar el valor de 202h a DX usando direccionamiento indirecto base más índice.
              MOV       BP,  0200h
              MOV       SI,  0002h
              MOV       DX,  [BP + SI]
;Copiar el valor de 203h a DI usando direccionamiento relativo por registro.
              MOV       BX,  0200h
              MOV       DI,  [BX + 0003h]  

              int        20h
