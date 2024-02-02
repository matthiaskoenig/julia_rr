# Calling libroadrunner python
#
#= 
PyCall is currently configured to use the Python version at:

/usr/bin/python3

and you should use whatever mechanism you usually use (apt-get, pip, conda,
etcetera) to install the Python package containing the libroadrunner module.

One alternative is to re-configure PyCall to use a different Python
version on your system: set ENV["PYTHON"] to the path/name of the python
executable you want to use, run Pkg.build("PyCall"), and re-launch Julia. 
=#

# ENV["PYTHON"]="/home/mkoenig/.virtualenvs/roadrunner"
# Pkg.add("PyCall")
# Pkg.build("PyCall")

# https://github.com/JuliaPy/Conda.jl#conda-and-pip
# pkg.add("Conda")
# import Conda

# Conda.pip_interop(true)

# install pip package
# Conda.pip(command, package, env): run pip command on packages in environment
# Conda.pip("install", "libroadrunner")

cd("/home/mkoenig/git/julia_rr/src/")

using Distributed, PyCall
@everywhere using Distributed, PyCall
@everywhere const libroadrunner = pyimport("roadrunner")

println(libroadrunner)
rr = libroadrunner.RoadRunner("spt_liver.xml")
# Matrix{Float64}; alias for Array{T,2}
s = rr.simulate(0, 10, steps=100)
println(typeof(s))
println(s)

println("nprocs: $(nprocs())")
println("nworkers: $(nworkers())")

addprocs(10)
println("nworkers: $(nworkers())")

# "cannot pickle 'module' object"

@distributed for _ in 1:20
    rr = libroadrunner.RoadRunner("spt_liver.xml")

    # Matrix{Float64}; alias for Array{T,2}
    s = rr.simulate(0, 10, steps=1000)
    println("sim")
    return s
end

