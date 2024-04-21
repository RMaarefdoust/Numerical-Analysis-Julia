using MatrixDepot
using SparseArrays
using LinearAlgebra
using Plots
function Jacobi(A, b, tol, max_iter, x)
    n = length(b)
    x_next = zeros(n)
    D = zeros(n, n)
    D[1:n+1:n*n] .= A[1:n+1:n*n] 
    M = D
    N = M - A
    niter = 0   
    residuals=[]
    push!(residuals, norm(b - A * x, Inf))
    while (true) || (niter < max_iter)
        x_next = M \ (N * x + b)
        if maximum(abs.(x_next - x)) < tol * maximum(abs.(x))
            break
        end
        x = x_next
        push!(residuals, norm(b - A * x, Inf))
        niter += 1
    end
    return x_next, residuals,niter
end
function gaussseidel(A, b, tol, max_iter, x)
    n = length(b)
    x_next = zeros(n)
    D = zeros(n, n)
    D[1:n+1:n*n] .= A[1:n+1:n*n] 
    L = zeros(n, n)
    for i in 2:n
        L[i, 1:i-1] .= A[i, 1:i-1]
    end    
    
    U = zeros(n, n)
    for i in 1:n
        U[i, i+1:end] .= A[i, i+1:end]
    end
    niter = 0
    residuals=[]
    push!(residuals, norm(b - A * x, Inf))
    while (true) || (niter < max_iter)
        for i in 1:n
            x_next[i] = (b[i] - dot(L[i, :], x_next) - dot(U[i, :], x)) / D[i, i]
        end
        if maximum(abs.(x_next - x)) < tol * maximum(abs.(x))
            break
        end
        x .= x_next
        push!(residuals, norm(b - A * x, Inf))
        niter += 1
    end
    return x_next, residuals,niter
end
function SOR(A, b, w, tol, max_iter, x)
    n = length(b)
    x_next = zeros(n)
    D = zeros(n, n)
    D[1:n+1:n*n] .= A[1:n+1:n*n] 
    L = zeros(n, n)
    for i in 2:n
        L[i, 1:i-1] .= A[i, 1:i-1]
    end    
    
    U = zeros(n, n)
    for i in 1:n
        U[i, i+1:end] .= A[i, i+1:end]
    end
    niter = 0
    residuals=[]
    push!(residuals, norm(b - A * x, Inf))
    while niter < max_iter
        for i in 1:n
            x_next[i] = ((1 - w) * x[i]) + (w * ((b[i] - dot(L[i, :], x_next) - dot(U[i, :], x)) / D[i, i]))
        end
        if maximum(abs.(x_next - x)) < tol * maximum(abs.(x))
            break
        end
        x .= x_next
        push!(residuals, norm(b - A * x, Inf))
        niter += 1
    end
    if niter == max_iter
        println("\n-****---SOR Method did not converge with w = ", w)
    end 
    return x_next, residuals,niter
end
function steepestdescent(A, b, x0, tol)
    x = x0
    residuals = []
    push!(residuals, norm(b - A * x, Inf))
    it = 0
    while (true)
        x_old = copy(x)
        r = b - A * x
        alpha = dot(r, r) / dot(r, A * r)
        x += alpha * r
        push!(residuals, norm(b - A * x, Inf))
        if norm(x - x_old, Inf) < tol
            break
        end
        it += 1
    end
    return x, residuals, it
end
A = matrixdepot("poisson", 10)
b = rand(size(A, 1))
x0 = zeros(size(A, 1))
tol = 1e-6
max_iter = 1000
@time x_jacobi, residuals_jacobi,jacob_iter = Jacobi(A, b, tol, max_iter, x0)
@time x_gauss_seidel,residuals_gauss_seidel,gauss_seidel_iter=gaussseidel(A, b, tol, max_iter, x0)
w = 1.5
@time x_sor, residuals_sor ,SOR_iter= SOR(A, b, w, tol, max_iter, x0)
@time x_gradient_descent, residuals_gradient_descent, gradient_descent_iter = steepestdescent(A, b, x0, tol)
println("\n---- Solutions ----")
println("Jacobi: ", x_jacobi)
println("Gauss-Seidel: ", x_gauss_seidel)
println("SOR: ", x_sor)
println("Gradient Descent: ", x_gradient_descent)
println("\n\n ---- Convergence Behavior ----")
println("Jacobi Residuals: ", jacob_iter)
println("Gauss-Seidel: ", gauss_seidel_iter)
println("SOR Residuals: ", SOR_iter)
println("Gradient Descent Iterations: ", gradient_descent_iter)
# Plot residuals or iteration numbers over iterations for each method
plot(residuals_jacobi, label = "Jacobi", xlabel = "Iteration", ylabel = "Residual", title = "Residuals over Iterations (Jacobi)", color = :blue)
plot!(residuals_gauss_seidel, label = "Gauss-Seidel", color = :red)
plot!(residuals_sor, label = "SOR", color = :green)
plot!(residuals_gradient_descent, label = "Gradient Descent", color = :orange)
#plot(residuals_sor, label = "SOR", xlabel = "Iteration", ylabel = "Residual", title = "Residuals over Iterations (sor)", color = :green)
#plot!(residuals_gradient_descent, label = "Gradient Descent", color = :orange)
