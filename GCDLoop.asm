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
   
    #I did not write in loop part because whenever we call loop, stack might be overflow
    addi $sp $sp -16 # add stack 2 item
    sw $t0 12($sp) #save argument
    sw $t1 8($sp) #save argument 
    

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
    sw $ra 4($sp) #save return address
    beq $t0 $t1 EXÝT2 #go to EXÝT2 if $t0 == $t1
    slt $t3 $t0 $t1 #$t3=0 if($t0 > $t1)
    beq $t3 $zero EXÝT1 # go to EXÝT1 if $t0 > $t1
    sub $t1 $t1 $t0
    j LOOP
    
    
    
EXÝT1:
    sub $t0 $t0 $t1   #$t0=$t0-t1
    j LOOP
    
EXÝT2:
    
    lw $ra 4($sp) #save return address 
    add $v1 $zero $t0 #result will be one of them
    addi $sp $sp 16
    
    jr $ra #return
    
    
    
    
    
    
