.data
    # Data section
    num1:   .word  5    # First number
    num2:   .word  7    # Second number
    result: .word  0    # Storage for the result

.text
    # Text section (main program)

    # Load the first number into a register
    lw $t0, num1

    # Load the second number into another register
    lw $t1, num2

    # Add the two numbers and store the result in $t2
    add $t2, $t0, $t1

    # Store the result in memory
    sw $t2, result

    # Exit the program
    li $v0, 10
    syscall