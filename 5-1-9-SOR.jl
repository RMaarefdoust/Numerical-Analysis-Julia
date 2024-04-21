function SOR(A, b, w, tol, max_iter=1000)
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
    while niter < max_iter
        for i in 1:n
            x_next[i] = ((1 - w) * x[i]) + (w * ((b[i] - dot(L[i, :], x_next) - dot(U[i, :], x)) / D[i, i]))
        end
        
        if maximum(abs.(x_next - x)) < tol * maximum(abs.(x))
            break
        end
        x .= x_next
        niter += 1
    end
    if niter == max_iter
        println("\n-****---SOR Method did not converge with w = ", w)
    end 
    return x_next, niter
end
A = [4 1 -1; 2 7 1; 1 -3 12]
b = [19; 3; 31]
tolerance = 1e-6
ws = [0.5, 1.0, 1.5, 1.9, 1.95, 1.99]
for w in ws
    println("\n--------------------------------------------------------------------")
    println("SOR Method (w = ", w, "):")
    @time x_sor, iterations_sor = SOR(A, b, w, tolerance)
    println("Final Answer (SOR, w = ", w, "): ", x_sor)
    println("Iterations (SOR, w = ", w, "): ", iterations_sor)
end
