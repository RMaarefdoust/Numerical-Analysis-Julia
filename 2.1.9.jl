# Import the ForwardDiff module
#import Pkg
#Pkg.add("ForwardDiff")

using ForwardDiff
f(x) = exp(x)
g(x) = exp(-x)
x0 = 2
delta_x0_over_x0 = 1e-2
condition_number_f = abs(x0 / f(x0) * ForwardDiff.derivative(f, x0))
condition_number_g = abs(x0 / g(x0) * ForwardDiff.derivative(g, x0))
relative_forward_error_f = condition_number_f * delta_x0_over_x0
relative_forward_error_g = condition_number_g * delta_x0_over_x0
println("condition_number for f(x_0): ", condition_number_f)
println("condition_number for g(x_0): ", condition_number_g)
println("relative forward error  f(x_0): ", relative_forward_error_f)
println("relative forward error  g(x_0): ", relative_forward_error_g)
println("f(x_0): ", f(x0))
println("g(x_0): ", g(x0))
println("f(x_0 + delta_x0): ", f(x0 + delta_x0_over_x0))
println("g(x_0 + delta_x0): ", g(x0 + delta_x0_over_x0))
