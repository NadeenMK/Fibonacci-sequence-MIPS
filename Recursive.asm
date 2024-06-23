.data
msg: .asciiz "Enter the index (n):"

.text
.globl main

main:
    li $v0, 4           
    la $a0, msg
    syscall

    li $v0, 5          
    syscall
    move $a0, $v0       

    jal rec         

    move $a0, $v0      
    li $v0, 1           
    syscall

    li $v0, 10          
    syscall

rec:
    addi $sp, $sp, -16  
    sw $ra, 12($sp)    
    sw $a0, 0($sp)     
    sw $s0, 4($sp)     
    sw $s1, 8($sp)     
    li $t1, 1           
    beq $a0, $zero, case1
    beq $a0, $t1, case2  
    addi $a0, $a0, -1  
    jal rec         
    move $s0, $v0       
    lw $a0, 0($sp)     
    addi $a0, $a0, -2  
    jal rec         
    move $s1, $v0       
    add $v0, $s0, $s1  
    lw $s0, 4($sp)      
    lw $s1, 8($sp)      
    lw $ra, 12($sp)     
    addi $sp, $sp, 16 
    jr $ra             
case1:
    li $v0, 0         
    lw $ra, 12($sp)    
    addi $sp, $sp, 16 
    jr $ra             

case2:
    li $v0, 1          
    lw $ra, 12($sp)    
    addi $sp, $sp, 16   
    jr $ra             
