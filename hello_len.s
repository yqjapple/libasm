;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    hello.s                                            :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: juligonz <juligonz@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/03/20 15:20:02 by juligonz          #+#    #+#              ;
;    Updated: 2020/03/29 19:57:45 by juligonz         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;


section .data
	text db "Hello, world!", 10,0
	
section .text
	global _start

%macro exit 0
	mov rax, 60
	mov rdi, 0
	syscall
%endmacro
	
_start:

	mov rax, text
	call _print
	
	exit

	;; input : rax as a pointer to string
	;; output : print string at rax
_print:
	push rax
	mov rbx, 0
_printLoop:
	inc rax
	inc rbx
	mov cl, [rax]
	cmp cl, 0
	jne _printLoop

	mov rax, 1
	mov rdi, 1
	pop rsi
	mov rdx, rbx
	syscall
	ret
