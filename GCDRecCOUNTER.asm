.data 
    str1: .asciiz "Enter an integer: "
    str2: .asciiz "\nEnter another integer: "
    str3: .asciiz "\nThe greatest common divisor is : "
.text
main:
    #request first integer value from user
    li $v0 4  #print string
    la $a0 str1  #give the str1 address
    syscall #do it
    
    #get user's answer for str1
    li $v0 5  #read integer
    syscall
    
    #store str1 value
    move $t0 $v0
    
    #request second integer value from user
    li $v0 4  #print string
    la $a0 str2  #give the str2 address
    syscall #do it
    
    #get user's answer for str2
    li $v0 5  #read integer
    syscall
    
    #store str2 value
    move $t1 $v0
   
    #call function
    addi $t6 $t6 1 ####################################################################################################
    jal LOOP 
    
    #print str3
    li $v0 4
    la $a0 str3
    syscall
    
    #print result
    li $v0 1
    
    addi $t9 $t9 1 ##############################################################
    addi $a0 $v1 0
    
    syscall
    

#the end of main
li $v0 10
syscall

LOOP:
    addi $t9 $t9 1 ##############################################################
    addi $sp $sp -12 # add stack 3 item
    
    addi $t7 $t7 1 ################################
    sw $t0 12($sp) #save argument
    
    addi $t7 $t7 1 ################################
    sw $t1 8($sp) #save argument 
    
    addi $t7 $t7 1 ################################
    sw $ra 4($sp) #save return address
    
    addi $t6 $t6 1 ####################################################################################################
    beq $t0 0 L1 #if($a0==$a1) jump tp L1
    
    addi $t8 $t8 1 ############################################################################################################################
    div $t1 $t0 #divison 2 values
    
    addi $t9 $t9 1 ##############################################################
    add $t1 $zero $t0 #change $t1 to $t0
    
    
    mfhi $t0 #get result from hi
    
    addi $t6 $t6 1 ####################################################################################################
    jal LOOP #recursive call
   
    
    
L1:
    #base case
    addi $t9 $t9 1 ##############################################################
    add $v1 $zero $t1 #result will be one of them 
    
    addi $t9 $t9 1 ##############################################################
    addi $sp $sp 12
    
    addi $t7 $t7 1 ################################
    lw $ra 4($sp) #restore return addres
    
    jr $ra #return 
    
    
    
    
    
    
    
    
    
