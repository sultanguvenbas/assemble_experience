addi $s0 $0 6 #int a=6
addi $s1 $0 7 #int b=7
addi $s2 $0 0 #int c=0

beq $s1 $s0 ELSE #if(a!=b)
addi $s2 $0 5  #int c =5
j EXÝT 

ELSE: addi $s2 $0 7 #int c=7

EXÝT: addi $s0 $s0 1 #int a++
