.data
    message1: .ascii "The numbers are eqaul.\n"
    message2: .ascii "\nNothing happened."
    message3: .ascii "\nThe numbers are different."
    
.text
main:
    addi $t0 $zero 5  #int a=5
    addi $t1 $zero 20 #int b=20
    addi $t2 $zero 15
    addi $t3 $zero 15
    
    beq $t0 $t1 numbersEqual #if(a==b)jump to numbersEqual 
    li $v0 4
    la $a0 message2
    syscall 
    
   ### bne $t2 $t3 numbersDifferent #if(a!=b) jump to numbersDifferent
   ###li $v0 4
   ### la $a0 message2
   ### syscall 
    
    
#the end of main
li $v0 10
syscall
    
    numbersEqual:
        li $v0 4
        la $a0 message1
        syscall
        
    
    ###numbersDifferent:
        ###li $v0 4
        ###la $a0 message3
        ###syscall
       