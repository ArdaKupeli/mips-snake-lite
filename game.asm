.data
welcomeMsg:     .asciiz "\n=== MIPS SNAKE LITE ===\n"
menuMsg:        .asciiz "\nMove: 1=Up  2=Down  3=Left  4=Right  5=Exit\nChoice: "

rowMsg:         .asciiz "\nSnake position -> Row: "
colMsg:         .asciiz "  Col: "

foodRowMsg:     .asciiz "\nFood position  -> Row: "
foodColMsg:     .asciiz "  Col: "

scoreMsg:       .asciiz "\nScore: "
eatMsg:         .asciiz "\nFood eaten! Score increased.\n"
winMsg:         .asciiz "\nYou win! Final score reached.\n"
gameOverMsg:    .asciiz "\nGame Over! Snake hit the wall.\n"
exitMsg:        .asciiz "\nExiting game...\n"
invalidMsg:     .asciiz "\nInvalid input. Try again.\n"

snakeRow:       .word 2
snakeCol:       .word 2

foodRow:        .word 0
foodCol:        .word 4

score:          .word 0
targetScore:    .word 3
boardSize:      .word 5

.text
.globl main

main:
    # Print welcome message
    li $v0, 4
    la $a0, welcomeMsg
    syscall

game_loop:
    # Print snake row
    li $v0, 4
    la $a0, rowMsg
    syscall

    li $v0, 1
    lw $a0, snakeRow
    syscall

    # Print snake col
    li $v0, 4
    la $a0, colMsg
    syscall

    li $v0, 1
    lw $a0, snakeCol
    syscall

    # Print food row
    li $v0, 4
    la $a0, foodRowMsg
    syscall

    li $v0, 1
    lw $a0, foodRow
    syscall

    # Print food col
    li $v0, 4
    la $a0, foodColMsg
    syscall

    li $v0, 1
    lw $a0, foodCol
    syscall

    # Print score
    li $v0, 4
    la $a0, scoreMsg
    syscall

    li $v0, 1
    lw $a0, score
    syscall

    # Print menu
    li $v0, 4
    la $a0, menuMsg
    syscall

    # Read user input
    li $v0, 5
    syscall
    move $t9, $v0       # $t9 = user choice

    # Direction control
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
    slt $t6, $t0, $t5
    beq $t6, $zero, game_over

    # Load col
    lw $t1, snakeCol

    # If col < 0 -> game over
    bltz $t1, game_over

    # If col >= boardSize -> game over
    slt $t6, $t1, $t5
    beq $t6, $zero, game_over

    b check_food


check_food:
    # Check if snakeRow == foodRow
    lw $t0, snakeRow
    lw $t1, foodRow
    bne $t0, $t1, game_loop

    # Check if snakeCol == foodCol
    lw $t2, snakeCol
    lw $t3, foodCol
    bne $t2, $t3, game_loop

    # If both row and col match, food is eaten
    li $v0, 4
    la $a0, eatMsg
    syscall

    # score = score + 1
    lw $t4, score
    addi $t4, $t4, 1
    sw $t4, score

    # If score == targetScore, win
    lw $t5, targetScore
    beq $t4, $t5, win_game

    # Move food based on score
    li $t6, 1
    beq $t4, $t6, set_food_second

    li $t6, 2
    beq $t4, $t6, set_food_third

    b game_loop


set_food_second:
    # New food position: row = 4, col = 4
    li $t7, 4
    sw $t7, foodRow

    li $t7, 4
    sw $t7, foodCol

    b game_loop


set_food_third:
    # New food position: row = 1, col = 1
    li $t7, 1
    sw $t7, foodRow

    li $t7, 1
    sw $t7, foodCol

    b game_loop


invalid_input:
    li $v0, 4
    la $a0, invalidMsg
    syscall
    b game_loop


win_game:
    li $v0, 4
    la $a0, winMsg
    syscall

    li $v0, 10
    syscall


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
