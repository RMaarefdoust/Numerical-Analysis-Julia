using Random

# Set the random seed for reproducibility
Random.seed!(42)

# Generate 1000 normally distributed random numbers
n = 1000
mean_value = 1000.0
std_dev = 0.1
data = mean_value .+ std_dev * randn(n)

# Compute variance using the first formula
variance_formula1 = sum((data .- mean(data)).^2) / n

# Compute variance using the second formula
variance_formula2 = (sum(data .^ 2) / n) - mean(data)^2

# Display results
println("Variance (Formula 1): $variance_formula1")
println("Variance (Formula 2): $variance_formula2")
