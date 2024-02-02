# solving quadratic function

function solvequadratic(a, b, c)
    d = sqrt(b^2 - 4*a*c)
    # return on last line
    (-b -d) / 2*a, (-b + d) / 2*a
end

println(solvequadratic(1, -2, -3))
println("-" ^ 80)

A = [1 2
     3 4]
B = [5 6
     7 8]

println(A + B)
println("-" ^ 80)

fib(n) = (BigInt[1 1; 1 0]^n)[2]
println(fib(10))

# empty Array
# x = Array{Int64, 3, 3}
# println(x)

# hcat, vcat