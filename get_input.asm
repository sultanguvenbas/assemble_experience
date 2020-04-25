.data
   prompt: .asciiz "Enter your age: "
   message: .asciiz "\nYour age is :"
.text

main:
    #promt the user to enter age
    li $v0 4 #print string
    la $a0 prompt
    syscall 
    
    #get user's age
    li $v0 5 #read integer
    syscall
    
    #store the age in $t0
    move $t0 $v0
    
    #display 
    li $v0 4
    la $a0 message
    syscall
    
    #print age
    li $v0 1
    move $a0 $t0
    syscall


#the end of main
li $v0 10
syscall