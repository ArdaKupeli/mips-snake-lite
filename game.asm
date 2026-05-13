.data
welcomeMsg:     .asciiz "\n=== MIPS SNAKE LITE ===\n"
menuMsg:        .asciiz "\nMove: 1=Up  2=Down  3=Left  4=Right  5=Exit\nChoice: "
rowMsg:         .asciiz "\nSnake position -> Row: "
colMsg:         .asciiz "  Col: "
gameOverMsg:    .asciiz "\nGame Over! Snake hit the wall.\n"
exitMsg:        .asciiz "\nExiting game...\n"
invalidMsg:     .asciiz "\nInvalid input. Try again.\n"

snakeRow:       .word 2
snakeCol:       .word 2
boardSize:      .word 5

.text
.globl main

main:
    # Print welcome message
    li $v0, 4
    la $a0, welcomeMsg
    syscall

game_loop:
    # Print current row
    li $v0, 4
    la $a0, rowMsg
    syscall

    li $v0, 1
    lw $a0, snakeRow
    syscall

    # Print current col
    li $v0, 4
    la $a0, colMsg
    syscall

    li $v0, 1
    lw $a0, snakeCol
    syscall

    # Print menu
    li $v0, 4
    la $a0, menuMsg
    syscall

    # Read user input
    li $v0, 5
    syscall
    move $t9, $v0       # $t9 = user choice

    # Compare input
    li $t8, 1
    beq $t9, $t8, move_up

    li $t8, 2
    beq $t9, $t8, move_down

    li $t8, 3
    beq $t9, $t8, move_left

    li $t8, 4
    beq $t9, $t8, move_right

    li $t8, 5
    beq $t9, $t8, exit_game

    b invalid_input


move_up:
    lw $t0, snakeRow
    addi $t0, $t0, -1
    sw $t0, snakeRow
    b check_wall


move_down:
    lw $t0, snakeRow
    addi $t0, $t0, 1
    sw $t0, snakeRow
    b check_wall


move_left:
    lw $t1, snakeCol
    addi $t1, $t1, -1
    sw $t1, snakeCol
    b check_wall


move_right:
    lw $t1, snakeCol
    addi $t1, $t1, 1
    sw $t1, snakeCol
    b check_wall


check_wall:
    # Load row and board size
    lw $t0, snakeRow
    lw $t5, boardSize

    # If row < 0 -> game over
    bltz $t0, game_over

    # If row >= boardSize -> game over
    slt $t6, $t0, $t5     # $t6 = 1 if row < boardSize
    beq $t6, $zero, game_over

    # Load col
    lw $t1, snakeCol

    # If col < 0 -> game over
    bltz $t1, game_over

    # If col >= boardSize -> game over
    slt $t6, $t1, $t5     # $t6 = 1 if col < boardSize
    beq $t6, $zero, game_over

    # If no wall collision, continue game
    b game_loop


invalid_input:
    li $v0, 4
    la $a0, invalidMsg
    syscall
    b game_loop


game_over:
    li $v0, 4
    la $a0, gameOverMsg
    syscall

    li $v0, 10
    syscall


exit_game:
    li $v0, 4
    la $a0, exitMsg
    syscall

    li $v0, 10
    syscall
