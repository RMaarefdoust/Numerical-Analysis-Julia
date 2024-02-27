# Function to evaluate the left-hand side: x^2 - y^2
function lhs_difference(x, y)
    return x^2 - y^2
end

# Function to evaluate the right-hand side: (x - y)(x + y)
function rhs_difference(x, y)
    return (x - y) * (x + y)
end

# Example usage with large values and x ≈ y
x = 1.0e10
y = 1.0e10 + 1.0e-6  # Assume x ≈ y

# Calculate results
result_lhs = lhs_difference(x, y)
result_rhs = rhs_difference(x, y)

# Display results
println("Left-hand side (x^2 - y^2): $result_lhs")
println("Right-hand side ((x - y)(x + y)): $result_rhs")
