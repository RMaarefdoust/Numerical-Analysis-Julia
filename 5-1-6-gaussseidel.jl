function Jacobi(A, b, tol)
    n = length(b)
    x = zeros(n)
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
    M = D
    N = -(L + U)
    niter = 0
    while true
        x_next = M \ (N * x + b)
        if maximum(abs.(x_next - x)) < tol * maximum(abs.(x))
            break
        end
        x = x_next
        niter += 1
    end
    return x_next, niter
end

function gaussseidel(A, b, tol)
    n = length(b)
    x = zeros(n)
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
    while true
        for i in 1:n
            x_next[i] = (b[i] - dot(L[i, :], x_next) - dot(U[i, :], x)) / D[i, i]
        end
        if maximum(abs.(x_next - x)) < tol * maximum(abs.(x))
            break
        end
        x .= x_next
        niter += 1
    end
    return x_next, niter
end
A = [4 1 -1; 2 7 1; 1 -3 12]
b = [19; 3; 31]
tolerance = 1e-6
println("-----------Jacobi Method:------------------------------------------")
@time x_jacobi, iterations_jacobi = Jacobi(A, b, tolerance)
println("\n------------Gauss-Seidel Method:-----------------------------------")
@time x_gaussseidel, iterations_gaussseidel = gaussseidel(A, b, tolerance)
println("\n-------------------------------------------------------------------")
println("Final Answer (Jacobi): ", x_jacobi)
println("Iterations (Jacobi): ", iterations_jacobi)
println("\n--------------------------------------------------------------------")
println("Final Answer (Gauss-Seidel): ", x_gaussseidel)
println("Iterations (Gauss-Seidel): ", iterations_gaussseidel)
println("--------------------------------------------------------------------")
