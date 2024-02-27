function calculate_floating_point_params_and_number(number::Float64, base::Int)
    # Calculate precision (p)
    p = ceil(log10(abs(number)))

    # Calculate exponent range [L, U]
    L = floor(log10(abs(number))) - 1
    U = floor(log10(abs(number)))

    # Extracting sign, exponent, and mantissa bits
    bits = bitstring(number)
    sign_bit = parse(Int, bits[1])
    exponent_bits = parse(Int, bits[2:12], base=2) - 1023
    mantissa_bits = parse(Float64, "1.$(bits[13:end])")

    # Calculate actual number
    actual_number = number * base^-U

    return sign_bit, mantissa_bits, Int(p), Int(L), Int(U), actual_number
end

# Test with the given numbers and base β=10
number1 = 239487.234
number2 = 0.0000000034394
base = 10

sign1, m1, p1, L1, U1, actual_number1 = calculate_floating_point_params_and_number(number1, base)
sign2, m2, p2, L2, U2, actual_number2 = calculate_floating_point_params_and_number(number2, base)

println("For $number1:")
println("Sign: $sign1")
println("Mantissa (m): $m1")
println("Precision (p): $p1")
println("Exponent Range [L, U]: [$L1, $U1]")
println("Actual Number: $actual_number1")

println("\nFor $number2:")
println("Sign: $sign2")
println("Mantissa (m): $m2")
println("Precision (p): $p2")
println("Exponent Range [L, U]: [$L2, $U2]")
println("Actual Number: $actual_number2")
