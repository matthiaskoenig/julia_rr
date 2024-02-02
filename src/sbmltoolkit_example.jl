using SBMLToolkit, ModelingToolkit, OrdinaryDiffEq

cd("/home/mkoenig/git/julia_rr/src/")
println("$pwd()")
SBMLToolkit.checksupport_file("spt_liver.xml")

mdl = readSBML("spt_liver.xml", doc -> begin
    set_level_and_version(3, 2)(doc)
    convert_promotelocals_expandfuns(doc)
end)
rs = ReactionSystem(mdl)  # If you want to create a reaction system
odesys = convert(ODESystem, rs)  # Alternatively: ODESystem(mdl)

tspan = (0.0, 1.0)
prob = ODEProblem(odesys, [], tspan, [])
sol = solve(prob, Tsit5())

println(sol)