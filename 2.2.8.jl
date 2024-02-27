function calculate_smallest_and_largest_numbers(β, p, L, U)
    # Calculate the smallest positive number
    smallest_exponent = L
    smallest_mantissa = 1.0 * β^-p
    smallest_positive_number = β^smallest_exponent * smallest_mantissa

    # Calculate the largest positive number
    largest_exponent = U
    largest_mantissa = (β - 1.0) / β * 10.0^(p - 1)  # Use floating-point literals
    largest_positive_number = β^largest_exponent * largest_mantissa

    return smallest_positive_number, largest_positive_number
end

# Parameters for the floating-point number system
β = 10
p = 5
L = -20
U = 20

# Calculate smallest and largest positive numbers
smallest, largest = calculate_smallest_and_largest_numbers(β, p, L, U)

# Display the results
println("Smallest Positive Number: $smallest")
println("Largest Positive Number: $largest")
