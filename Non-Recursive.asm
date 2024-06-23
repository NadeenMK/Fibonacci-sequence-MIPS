.data
index:   .word 0       
res:     .word 0       
msg:     .asciiz "Enter the index (n): "      

.text
.globl main

main:
    li $v0, 4                
    la $a0, msg              
    syscall
    li $v0, 5                
    syscall
    sw $v0, index            
    lw $t0, index           
    li $t1, 0                
    li $t2, 1              

loop1:
    beq $t0, 0, result       
    beq $t0, 1, result       
    add $t3, $t1, $t2       
    move $t1, $t2           
    move $t2, $t3            
    addi $t0, $t0, -1        
    bnez $t0, loop1         

result:
    sw $t2, res              
    li $v0, 1                
    lw $a0, res              
    syscall
    li $v0, 10               
    syscall
