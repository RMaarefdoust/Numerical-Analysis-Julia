function calculate_smallest_floating_point_params_and_mantissa(numbers::Vector{Float64}, base::Int)
    # Initialize values for the smallest precision, L, U, and mantissa
    smallest_p = Inf
    smallest_L = Inf
    smallest_U = -Inf
    smallest_mantissa1 = 0.0
    smallest_mantissa2 = 0.0

    # Iterate over each number to find the common values
    for number in numbers
        # Extracting sign, exponent, and mantissa bits
        bits = bitstring(number)
        sign_bit = parse(Int, bits[1])
        exponent_bits = parse(Int, bits[2:12], base=2) - 1023
        mantissa_bits = parse(Float64, "1.$(bits[13:end])")

        # Calculate precision (p)
        p = ceil(log10(abs(number)))

        # Calculate exponent range [L, U]
        L = floor(log10(abs(number))) - 1
        U = floor(log10(abs(number)))

        # Update the smallest values if necessary
        if p < smallest_p
            smallest_p = p
            smallest_L = L
            smallest_U = U
            if number == numbers[1]
                smallest_mantissa1 = mantissa_bits
            elseif number == numbers[2]
                smallest_mantissa2 = mantissa_bits
            end
        end
    end

    return Int(smallest_p), Int(smallest_L), Int(smallest_U), smallest_mantissa1, smallest_mantissa2
end

# Test with the given numbers and base β=10
numbers = [239487.234 , 0.0000000034394]
base = 10

smallest_p, smallest_L, smallest_U, smallest_mantissa1, smallest_mantissa2 = calculate_smallest_floating_point_params_and_mantissa(numbers, base)

println(" (p): $smallest_p")
println(" L: $smallest_L")
println(" U: $smallest_U")
println("Mantissa for 239487.234: $smallest_mantissa1")
println(" Mantissa for 0.0000000034394: $smallest_mantissa2")
