# Assembly
Organization &amp; Assembly Programs
Everything, except the shell scripts, in this folder is written using the 32-bit MIPS assembly language. Enjoy!

## Program Overview
- Demo.s
 - Some demonstration assembly from class
- cbarajas_hw01.s
 - Hello World program
- Array.s
 - Makes a 10x10 matrix
 - fills the cells with numbers 0-9 inclusively
 - then prompts users with row and column numbers returning the val of that cell
- Mars.sh
 - This is a wrapper for the MIPS simulator MARS which allows to be ran at the terminal
- SetupMars.sh
 - Must have Git and Java installed first. Setups up the MARS MIPS simulator to run at the terminal
- AnalyzeString.s
 - This program piggy backs off of BytePrinter. By doing a bytewise comparison of two ascii strings it should tell if you the string in memory is the same the string that was input by the user.
- BytePrinter.s
 - Prints the values individual ascii characters of the input string
- HnF.s
 - "Hide aNd Find". This program takes a number from the user and drops it randomly inside a 10x10 matrix. Then, from there, the program searches the matrix for the number in question and will return the row, column value that the number exists in.
- PrintRNGInt.s
 - Takes some upper boundary B and prints N randomly generated integers that exist between 0 and the bounary B. Both B and N are input by the user at runtime.
 
## More Explanation To Come!