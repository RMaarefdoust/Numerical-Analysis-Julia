function largest_mantissa(β, p)
    return β^p - 1
end

function calculate_exponent(x, β)
    if x == 0
        return 0
    end
    
    exponent = 0
    
    while abs(x) >= β
        x /= β
        exponent += 1
    end
    
    while abs(x) < 1
        x *= β
        exponent -= 1
    end
    
    return exponent
end

function calculate_largest_mantissa_formula(β, p)
    exponent_limit = p - 1
    return β^exponent_limit
end

# Test cases
println("1. For β = 10 and p = 5:")
println("   Largest Mantissa Formula: $(calculate_largest_mantissa_formula(10, 5))")

# Binary representation for the largest mantissa
largest_mantissa_binary_10_5 = string(largest_mantissa(10, 5), base=2)
println("   Largest Mantissa Binary: $largest_mantissa_binary_10_5\n")

println("2. For β = 2 and p = 10:")
println("   Largest Mantissa Formula: $(calculate_largest_mantissa_formula(2, 10))")

# Binary representation for the largest mantissa
largest_mantissa_binary_2_10 = string(largest_mantissa(2, 10), base=2)
println("   Largest Mantissa Binary: $largest_mantissa_binary_2_10\n")


function calculate_exponent(x, β)
    if x == 0
        return 0
    end
    
    exponent = 0
    
    while abs(x) >= β
        x /= β
        exponent += 1
    end
    
    while abs(x) < 1
        x *= β
        exponent -= 1
    end
    
    return exponent
end

# Test cases
println("1. For x = 234597.34, β = 10:")
println("   Exponent: $(calculate_exponent(234597.34, 10))\n")

println("2. For x = 0.00000178, β = 10:")
println("   Exponent: $(calculate_exponent(0.00000178, 10))\n")

println("3. For x = 998, β = 2:")
println("   Exponent: $(calculate_exponent(998, 2))\n")

println("4. For x = 0.01, β = 2:")
println("   Exponent: $(calculate_exponent(0.01, 2))")
