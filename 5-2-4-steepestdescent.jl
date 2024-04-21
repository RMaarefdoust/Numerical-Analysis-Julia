using LinearAlgebra
using Plots
function steepestdescent(A, b, x0, tol)
    x = x0
    residuals = []
    push!(residuals, norm(b - A * x, Inf))
    while true
        x_old = copy(x)
        r = b - A * x
        alpha = dot(r, r) / dot(r, A * r)
        x += alpha * r
        push!(residuals, norm(b - A * x, Inf))
        if norm(x - x_old, Inf) < tol
            break
        end
    end
    return x, residuals
end

A1 = [2 1; 1 2]
A2 = [4 2; 2 1.00001]
b = rand(2)
x0 = zeros(2)
tol = 1e-6
x1, residuals1 = steepestdescent(A1, b, x0, tol)
x2, residuals2 = steepestdescent(A2, b, x0, tol)
plot1 = Plots.plot([x0[1], x1[1], x2[1]], [x0[2], x1[2], x2[2]], marker = :circle, label = ["Initial guess" "Matrix A1" "Matrix A2"], xlabel = "x", ylabel = "y", title = "Iterates in the xy-plane")
plot2 = Plots.plot(residuals1, label = "Matrix A1", xlabel = "Iteration", ylabel = "Residual", title = "Residuals over Iterations", color = :blue)
Plots.plot!(plot2, residuals2, label = "Matrix A2", color = :red)
Plots.plot(plot1, plot2, layout = (2, 1))
