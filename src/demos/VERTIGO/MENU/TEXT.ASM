
;//				   -* TEXT.ASM *-
;//
;//浜様様様様様様様様様様様様様様様様様様様様様様様様様様�
;//�											  �
;//� By Paul Carroll 1995                                �
;//�                                                     �
;//�        - Some handy direction screen write routines �
;//�  	    for text mode;                             �
;//�       				     				  �
;//藩様様様様様様様様様様様様様様様様様様様様様様様様様様�

	.MODEL large
	.386
	.CODE
	PUBLIC _PutChar,_ChangeAttr,_GetChar

;// Puts a single char with attrib to x,y point on screen

_PutChar PROC C x:WORD,y:WORD,c:BYTE,attr:BYTE

	mov ax,y
	mov bx,80
	mul bx
	add ax,x
	mov bx,2
	mul bx
	mov di,ax
	mov ax,0b800h
	mov es,ax
	mov al,c
	mov ah,attr
	mov es:[di],al
	inc di
	mov es:[di],ah

	ret

_PutChar ENDP


;// Changes the attrib of a char at a given x,y point

_ChangeAttr PROC C x:WORD,y:WORD,attr:BYTE

	mov ax,y
	mov bx,80
	mul bx
	add ax,x
	mov bx,2
	mul bx
	mov di,ax
	add di,1
	mov ax,0b800h
	mov es,ax
	mov al,attr
	mov es:[di],al

	ret

_ChangeAttr ENDP


;// Gets ASCII num and attrib of char at x,y
;//
;// Returns : AL - ASCII num
;// 		    AH - Attrib

_GetChar PROC C x:WORD,y:WORD

	mov ax,y
	mov bx,80
	mul bx
	add ax,x
	mov bx,2
	mul bx
	mov di,ax
	mov ax,0b800h
	mov es,ax
	mov al,es:[di]
	inc di
	mov ah,es:[di]

	ret

_GetChar ENDP

	end

