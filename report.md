# MIPS Snake Lite - Project Report

## 1. Project Title

MIPS Snake Lite

## 2. Project Description

This project is a simple grid-based Snake game developed in MIPS Assembly for the QtSpim simulator.

The player controls the snake using console input. The snake moves on a 5x5 board. The goal is to collect food, increase the score, and reach the target score. If the snake hits the wall, the game ends.

## 3. Game Rules

- The snake starts at position Row 2, Col 2.
- The board size is 5x5.
- The player enters a movement direction from the console.
- If the snake reaches the food position, the score increases.
- If the snake hits the wall, the game ends.
- If the score reaches the target score, the player wins.
- The player can exit the game manually.

## 4. Controls

- 1 = Up
- 2 = Down
- 3 = Left
- 4 = Right
- 5 = Exit

## 5. Algorithm

1. Print the welcome message.
2. Display snake position, food position, and score.
3. Read user input.
4. Update snake position according to the selected direction.
5. Check wall collision.
6. Check food collision.
7. If food is eaten, increase score and move food to the next position.
8. If target score is reached, print win message.
9. Otherwise, repeat the game loop.
10. Exit cleanly when the game ends.

## 6. Assembly Concepts Used

This project demonstrates the following Computer Organization concepts:

- `.data` segment
- `.word` variables
- `.asciiz` strings
- Register usage
- Temporary registers
- `lw` and `sw` memory access
- `li`, `la`, `add`, `addi`
- `beq`, `bne`, `bltz`, `slt`
- Loop structure
- Conditional branching
- Syscall-based input/output
- Clean program exit using syscall 10

## 7. Register Usage

| Register | Purpose |
|---|---|
| `$v0` | Syscall service number and input result |
| `$a0` | Argument for syscall output |
| `$t0` | Snake row value |
| `$t1` | Snake column value or food row |
| `$t2` | Snake column or temporary comparison value |
| `$t3` | Food column |
| `$t4` | Score value |
| `$t5` | Board size or target score |
| `$t6` | Comparison result |
| `$t7` | Temporary value for new food position |
| `$t8` | Direction comparison value |
| `$t9` | User input choice |

## 8. Memory Variables

| Variable | Purpose |
|---|---|
| `snakeRow` | Current row position of the snake |
| `snakeCol` | Current column position of the snake |
| `foodRow` | Current row position of the food |
| `foodCol` | Current column position of the food |
| `score` | Current score |
| `targetScore` | Score needed to win |
| `boardSize` | Size of the game board |

## 9. Input / Output

The game uses MIPS syscall instructions for console input and output.

- `syscall 4` is used to print strings.
- `syscall 5` is used to read integer input.
- `syscall 1` is used to print integer values.
- `syscall 10` is used to terminate the program.

## 10. Conclusion

This project shows how a simple game can be implemented using MIPS Assembly. It includes memory variables, register operations, user input, output messages, loop control, branching, score tracking, and collision detection.
