section .data                           ;Data segment
   qmsg db 'Please enter a number: ' ;Ask the user to enter a number
   lenQmsg equ $-qmsg            ;The length of the message
   displMsg db 'You have entered: '
   lenDisplMsg equ $-displMsg               

section .bss           ;Uninitialized data
   num resb 5

section .text
global _start
_start:
    ;display the query message
    mov edx,lenQmsg
    mov ecx,qmsg
    mov ebx,1
    mov eax,4
    int 80h
    ;get input from user

    mov edx,5 ;input is an integer
    mov ecx,num ;holds the value of the input
    mov ebx,2 ;int
    mov eax,3
    int 80h

    ;print the display message
    mov edx,lenDisplMsg
    mov ecx,displMsg
    mov ebx,1
    mov eax,4
    int 80h

    ;print the number got from user
    mov edx,5
    mov ecx,num
    mov ebx,1
    mov eax,4
    int 80h

    ;exit the program
    mov eax,1
    int 80h


