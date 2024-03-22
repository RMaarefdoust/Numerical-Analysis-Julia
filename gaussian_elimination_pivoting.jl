using LinearAlgebra

function gaussian_elimination_pivoting!(A::Matrix{Float64}, b::Vector{Float64})
    n = length(b)
    P = collect(1:n) 
    for j in 1:n-1
        pivot_row = argmax(abs.(A[j:n, j])) + j - 1
        if pivot_row != j
            A[[j, pivot_row], :] = A[[pivot_row, j], :]  # Swap rows in A
            b[j], b[pivot_row] = b[pivot_row], b[j]      # Swap elements in b
            P[j], P[pivot_row] = P[pivot_row], P[j]      # Update P 
        end

        for i in j+1:n
            mij = A[i, j] / A[j, j]
            A[i, j] = mij
            for k in j+1:n
                A[i, k] -= mij * A[j, k]
            end
            b[i] -= mij * b[j]
        end
    end

    return [A, b], P
end

# Example 
A = [2.0 1.0 -1.0; -3.0 -1.0 2.0; -2.0 1.0 2.0]
b = [8.0; -11.0; -3.0]

LU, P = gaussian_elimination_pivoting!(copy(A), copy(b))
println("-------------------------My Function Results:------------------")
println("-----------------------------------------------------------")
println(" LU factorization (L\\U):")
println(LU[1])
println("\n Permutation vector P:")
println(P)


L1,U1,P1=lu(A)
println("\n ------------ Julia lu function  Results:---------------------------")
println("-----------------------------------------------------------------------------")

println("\n L:",L1,"\n \n U:",U1,"\n \n P:",P1)

