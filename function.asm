.data
    myMessange: .asciiz "Hello everyone\n"
    messange2: .word 5
.text

main:
   
    jal displayMessange
    
    li $v0, 1
    lw $a0 messange2
    syscall
    
     
li $v0 10 #means the program is done and have to be all time
syscall 

    displayMessange:
        li $v0, 4 #print string
        la $a0 myMessange
        syscall
    
        jr $ra 
