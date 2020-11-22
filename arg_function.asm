.data

.text

main:
    
    addi $a1 $zero 10
    addi $a2 $zero 20
    
    
    jal addNumbers
    
    li $v0 1
    addi $a0 $v1 0 
    syscall
    
    li $v0 10 #the end of main
    syscall
    
    
    addNumbers:
        
        add $v1 $a1 $a2
        
        jr $ra
