.data
    newLine: .ascii "\n"
.text

main:

    addi $s0 $zero 10
    
    jal increasingNumber
    
    #print a new line 
    li $v0 4
    la $a0 newLine
    syscall
    
    jal printValue
    
    
    
#exit program
li $v0 10
syscall
    
    increasingNumber:
        addi $sp $sp -8  #create a stack hem value tutcaz hem de $ra adresini 
        sw $s0 0($sp) #first eleman 
        sw $ra 4($sp)
        
        addi $s0 $zero 30
        
        jal printValue 
        
        lw $s0 0($sp) #restore s0
        lw $ra 4($sp) #restore ra
        addi $sp $sp 4 #add second eleman
        
        jr $ra
        
        
    printValue:
        #print new value
        li $v0 1
        move $a0 $s0
        syscall
        
        jr $ra
        
        
        