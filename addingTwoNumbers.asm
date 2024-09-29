segment .data 

   msg1 db "Enter a digit "
   len1 equ $- msg1 

   msg2 db "Please enter a second digit"
   len2 equ $- msg2 

   msg3 db "The sum is: "
   len3 equ $- msg3

segment .bss

   num1 resb 2 
   num2 resb 2 
   sum resb 1
section .text
global _start
_start:
    ;print msg1
    mov edx,len1
    mov ecx,msg1
    mov ebx,1
    mov eax,4
    int 0x80

    ;get input from user
    mov edx,5
    mov ecx,[num1]
    mov ebx,0
    mov eax,3
    int 0x80

    ;print msg2
    mov edx,len2
    mov ecx,msg2
    mov ebx,1
    mov eax,4
    int 0x80

    ;get input from user
    mov edx,5
    mov ecx,[num2]
    mov ebx,0
    mov eax,3
    int 0x80

    ;add the digits
    mov eax,[num1]
    sub eax,'0'
    mov ebx,[num2]
    sub ebx,'0'
    add eax,ebx
    add eax,'0'
    int 0x80

    mov [sum], eax
    ;print the sum messsage
    mov edx,len3
    mov ecx,msg3
    mov ebx,1
    mov eax,4
    int 0x80

    ;print the sum
    mov edx,5
    mov ecx,sum
    mov ebx,1
    mov eax,4
    int 0x80

    ;exit the program
    mov eax,1
    mov ebx,0
    int 0x80

    
