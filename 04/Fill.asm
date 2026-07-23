// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.


// Outer loop - infinite -checks KBD value

// Inner loop - writing - overwrites the entire screen
// actual writing -- if key pressed, write '0'(black) to every word/ pixel? else -1 for cleared(white)
    // need to iterate row 0-255
    // while iterating the row, access each word 0-31
    // do the write
    // save to register value of KBD - this is determine in outer loop
    // if inner write loop should be entered

    // go to outerloop when done

// Outer_LOOP
// 1. read KBD
// 2. KBD == 0 then R1 = -1 else R1 = 0
// 3. Inner loop write fill to all screen words (256 x 32 iterations)
// 4. jump back to outer_loop.
//
// For simplicity always enter iner loop when you compute fill
//
// Phase a set R1 to -1 when Ram[kbd] == 0
// 0 when ram[kbd] != 0

// R0 is screen address / word address
// R1 - actual value to set in each address
// R2 counter, ensures we fill all words.

(OUTER_LOOP)
@8192  // A literally has value 8192
D=A  // set D to 8192
@R2
M=D  // set contents of r2 to 8192 - exactly what we need.

// set R0 to @Screen address - 
@SCREEN
D=A  // storing Screen address into D
@R0
M=D // Change R0 contents to equal screen start address. R0 is a poitner

    // Check RAM[KBD]
    @KBD
    D=M  // gets value of KBD
    // use a register, lets use r1
    @KBD_NO_INPUT // -- IF kbd has no input 0, jump and set r1 to -1
    D;JEQ // go if no KBD input

    // KBD does have a input
    @R1
    M=0 // black

    @INNER_LOOP
    0;JMP


    // Prevents fall through
    @OUTER_LOOP
    0;JMP

// RAM kbd == 0
(KBD_NO_INPUT)
    @R1
    M=-1 // white
    // Prevents fall through
    @INNER_LOOP
    0;JMP

// Enter Inner loop - before, set counter
// 
(INNER_LOOP)
// loop 0-255, 0-31 iterations
// Get value of R1, 
// Make writes to @SCREEN
// do the stuff, r1 is the fill value, so update screen
@R1 // Grab fill value
D=M // store R1 value in D

@R0 // -- A = R0 address
A=M  // Updates register on Current iteration word (1 out of 8k)
M=D // WRITES R1 fill value to R0 contents

// Increment R0
@R0
M=M+1

// Decrement R2
@R2   // R2 is the remaining word count. when zero, were done writing
M=M-1
D=M  // Make sure D represents current counter value

@OUTER_LOOP
D;JEQ  // If counter is 0, we done, exit inner_loop.

// else
@INNER_LOOP
0;JMP

// dont need to track row / word, just think of it as 8192 word array
// start counter at 8192 - decrement each time. when its 0 that should be it
// logically the same, but one less loop and easier syntax
