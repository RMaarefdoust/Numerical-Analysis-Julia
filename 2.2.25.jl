function original_expression(x)
    result = 1 / (1 - x) - 1 / (1 + x)
    return result
end

function rewritten_expression(x)
    numerator = 2x
    denominator = 1 - x^2
    result = numerator / denominator
    return result
end
x_value = 0.9999999  # a value close to 1
result_original = original_expression(x_value)
result_rewritten = rewritten_expression(x_value)
println("Original expression result for x = $x_value: $result_original")
println("Rewritten expression result for x = $x_value: $result_rewritten")
    