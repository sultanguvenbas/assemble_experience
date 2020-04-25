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
    
     li $v0 1
     move $a0 $s0
     syscall
    
#the end od main
li $v0 10
syscall
    
    increasingNumber:
        addi $sp $sp -4  #create a stack
        sw $s0 0($sp) #first eleman 10
        
        addi $s0 $s0 30
        
        #print new value
        li $v0 1
        move $a0 $s0
        syscall
        
        
        lw $s0 0($sp)
        addi $sp $sp 4 #add second eleman
        
        jr $ra
        
        
   
        
        
