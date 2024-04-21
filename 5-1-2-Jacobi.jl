
function Jacobi(A, b, tol)
    n = length(b)
    x = zeros(n)
    x_next = zeros(n)
    D = zeros(n, n)
    D[1:n+1:n*n] .= A[1:n+1:n*n] 
    println("D",D)

    L = zeros(n, n)
    for i in 2:n
        L[i, 1:i-1] .= A[i, 1:i-1]
    end
    println("L",L)

    U = zeros(n, n)
    for i in 1:n
        U[i, i+1:end] .= A[i, i+1:end]
    end
    println("U",U)
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
        println("Iteration #: ",niter,"  x:  ",x)
    end
    return x_next, niter
end

A = [4 1 -1; 2 7 1; 1 -3 12]
b = [19; 3; 31]
tolerance = 1e-6
x_Answer, iterations = Jacobi(A, b, tolerance)
println("Final Answer: ", x_Answer)
println("Iterations: ", iterations)
