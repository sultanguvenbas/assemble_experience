.data
    myMessange: .asciiz "Hello sultan\n"

.text

li $v0, 4  #print string
la $a0, myMessange #send to address of myMessange
syscall
