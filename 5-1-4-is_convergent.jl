function is_convergent(A)
    n = size(A, 1)
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
    # T = M * N
    #Gershgorin Circle Theorem to estimate the spectral radius 𝜌(𝑇)
    spectral_radius = maximum(sum(abs.(N), dims=2) ./ abs.(D[1:n+1:n*n]))
    if spectral_radius < 1
        println("Spectral radius < 1. Jacobi method may converge.")
        return true
    else
        println("Spectral radius >= 1. Jacobi method may not converge.")
        return false
    end
end
A = [4 1 -1; 2 7 1; 1 -3 12]
convergent = is_convergent(A)

