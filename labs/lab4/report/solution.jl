using Plots
using DifferentialEquations

x0 = 0.7
y0 = 1.5

tspan = (0,57)

function F(du, u, p, t)
 du[1] = u[2]
 du[2] = f(t)-a*u[2]-b*u[1]
end


a = 0
b = 13
f(t) = 0

prob = ODEProblem(F, [x0;y0], tspan)
sol = solve(prob, saveat=0.05)
X = Float64[]
Y = Float64[]
for u in sol.u
	x, y = u
	push!(X,x)
	push!(Y,y)
end

plt = plot(legend=true)
plot!(plt, sol)
savefig(plt, "solution1.png")
plt = plot(legend=true)
plot!(plt, X, Y)
savefig(plt, "solution1_phase.png")


a = 7
b = 1
f(t) = 0

prob = ODEProblem(F, [x0;y0], tspan)
sol = solve(prob, saveat=0.05)
X = Float64[]
Y = Float64[]
for u in sol.u
	x, y = u
	push!(X,x)
	push!(Y,y)
end

plt = plot(legend=true)
plot!(plt, sol)
savefig(plt, "solution2.png")
plt = plot(legend=true)
plot!(plt, X, Y)
savefig(plt, "solution2_phase.png")


a = 1
b = 30
f(t) = sin(0.6 * t)

prob = ODEProblem(F, [x0;y0], tspan)
sol = solve(prob, saveat=0.05)
X = Float64[]
Y = Float64[]
for u in sol.u
	x, y = u
	push!(X,x)
	push!(Y,y)
end

plt = plot(legend=true)
plot!(plt, sol)
savefig(plt, "solution3.png")
plt = plot(legend=true)
plot!(plt, X, Y)
savefig(plt, "solution3_phase.png")
