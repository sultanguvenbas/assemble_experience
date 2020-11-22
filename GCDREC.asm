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
    jal LOOP 
    
    #print str3
    li $v0 4
    la $a0 str3
    syscall
    
    #print result
    li $v0 1
    addi $a0 $v1 0
    syscall
    

#the end of main
li $v0 10
syscall

LOOP:
    addi $sp $sp -16 # add stack 3 item
    sw $t0 12($sp) #save argument
    sw $t1 8($sp) #save argument 
    sw $ra 4($sp) #save return address
    
    
    beq $t0 0 L1 #if($a0==$a1) jump tp L1
    div $t1 $t0 #divison 2 values
    add $t1 $zero $t0 #change $t1 to $t0
    mfhi $t0 #get result from hi
    
    
    jal LOOP #recursive call
   
    
    
L1:
    #base case
    add $v1 $zero $t1 #result will be one of them 
    addi $sp $sp 16
    lw $ra 4($sp) #restore return addres
    
    jr $ra #return 
    
    
    
    
    
    
    
    
    
