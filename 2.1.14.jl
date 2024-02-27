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


println("1. For x = 234597.34, β = 10:")
println("   Exponent: $(calculate_exponent(234597.34, 10))\n")

println("2. For x = 0.00000178, β = 10:")
println("   Exponent: $(calculate_exponent(0.00000178, 10))\n")

println("3. For x = 998, β = 2:")
println("   Exponent: $(calculate_exponent(998, 2))\n")

println("4. For x = 0.01, β = 2:")
println("   Exponent: $(calculate_exponent(0.01, 2))")
