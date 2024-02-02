# Loading and running roadrunner model
# https://docs.juliahub.com/General/RoadRunner/stable/
# https://juliapackages.com/p/roadrunner
# https://sunnyxu.github.io/RoadRunner.jl/
# RoadRunner ────────── v0.1.2

# import Pkg
# Pkg.add("RoadRunner")
cd("/home/mkoenig/git/julia_rr/src/")
using RoadRunner
println(pwd())
println("roadrunner version:", RoadRunner.getVersionStr())

sbmlFile = "spt_liver.xml"
f = open(sbmlFile)
sbmlStr = read(f, String)
close(f)
rr = RoadRunner.createRRInstance()
RoadRunner.loadSBML(rr, sbmlStr)
print(rr)
RoadRunner.simulateEx(rr, 0, 100, 200)


println("-" ^ 80)

# rr2 = RoadRunner.createRRInstance()
# rr2 = RoadRunner.loadSBMLFromFile(rr2, sbmlFile)
# RoadRunner.simulateEx(rr2, 0, 100, 200)

# Array
data = RoadRunner.getSimulationResult(rr)
println(data)

println("-" ^ 80)


