function calculate_exponent(x, β, p)
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

function represent_number(x, β, p)
    exponent = calculate_exponent(x, β, p)
    mantissa = x / (β ^ exponent)
    
    # Round the mantissa to the specified precision
    mantissa = round(mantissa * (2 ^ p)) / (2 ^ p)
    
    return mantissa, exponent
end

# Constants
π_value = π
β = 2
p = 12

# Represent π in the specified floating-point system
mantissa, exponent = represent_number(π_value, β, p)

println("π represented in base-2 with precision 12: $mantissa * 2^$exponent")
