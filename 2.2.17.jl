# Generate an array of positive numbers
n = 1000
x = rand(Float64, n)  # Replace with your data or generate as needed

# Summation functions
function sum_from_smallest_to_largest(arr)
    return sum(sort(arr))
end

function sum_from_largest_to_smallest(arr)
    return sum(sort(arr, rev=true))
end

# Test the two summation methods
result_smallest_to_largest = sum_from_smallest_to_largest(x)
result_largest_to_smallest = sum_from_largest_to_smallest(x)

# Display results
println("Sum from smallest to largest: $result_smallest_to_largest")
println("Sum from largest to smallest: $result_largest_to_smallest")
