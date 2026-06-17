// Input
// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.


// Inputs of program are stored in R0 and R1 (RAM[0] and RAM[1])
// R2 = R0 * R1
// Assume R0 >= 0
// R1 >= 0.  
// Less than 32 bit numbe
// meaning r0 and r1 is NOT negative

 
// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.


// Inputs of program are stored in R0 and R1 (RAM[0] and RAM[1])
// R2 = R0 * R1
// Assume R0 >= 0
// R1 >= 0.  
// Less than 32 bit numbe
// meaning r0 and r1 is NOT negative

//@R0   // M = RAM[0] A = 0
//D=M  // d holds any value found at RAM[0]
    // D holds value of R0, so if R0 had 3, d has 3

// we CAN modify original r0 for loop, since r1 will add to itself R0 times!
// R3 will be my counter
@R3  // A = 3
M=0

// Ensure R2 is set to 0 initially
@R2
M=0

// If R0 or R1 is zero, the output needs to be zero
// conditional enter the loop then?

(LOOP)
// Decrement R0 (R0 is the counter)
@R0
D=M
M=D-1


@STOP
D;JEQ

@R1  // M = RAM[1] A = 1
D=M  // set D to original value of r1


@R3
M=D+M  // Add R1 ontop of R3 value


// When its here, its doing the 'multiplicaton' but then it 'adds r1 on top of the product'
// When its at the top, its WAAAAY off
@LOOP  // go to loop IF D is greater than 0? I assume thats what JGT
D;JGT


(STOP)
@R3
D=M  // R3 stores running total

@R2
M=D  // Set contents of D to return register r2

(END)
@END
0;JMP
