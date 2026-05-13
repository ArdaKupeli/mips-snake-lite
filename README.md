# MIPS Snake Lite

MIPS Snake Lite is a simple grid-based Snake game written in MIPS Assembly for the QtSpim simulator.

## Project Description

This project was developed for the CEN 222 Computer Organization course.  
The goal of the project is to demonstrate basic Assembly programming concepts through a simple game.

The player controls a snake on a 5x5 board using console input.  
The snake can move up, down, left, and right.  
The player collects food, increases the score, and wins when the target score is reached.  
If the snake hits the wall, the game ends.

## Controls

- 1 = Up
- 2 = Down
- 3 = Left
- 4 = Right
- 5 = Exit

## Features

- User input using syscall
- Console output using syscall
- Snake position tracking
- Food position tracking
- Score system
- Wall collision detection
- Win condition
- Game loop
- Conditional branching

## Assembly Concepts Used

This project demonstrates the following Computer Organization concepts:

- `.data` segment
- `.word` variables
- `.asciiz` strings
- Register usage
- Temporary registers
- `lw` and `sw` memory access
- `beq`, `bne`, `bltz`, and `slt` branch logic
- `addi` for position and score updates
- Loop control
- Clean program exit using syscall 10

## How to Run

1. Open QtSpim.
2. Load `game.asm`.
3. Run the program.
4. Enter movement choices from the console.

## Example Gameplay

Initial position:

```text
Snake position -> Row: 2  Col: 2
Food position  -> Row: 0  Col: 4
Score: 0
