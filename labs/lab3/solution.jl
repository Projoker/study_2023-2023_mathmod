using Plots
using DifferentialEquations

x0 = 105000
y0 = 95000

a = 0.35
b = 0.45
c = 0.69
h = 0.61
P1(t) = 2*sin(t)
Q1(t) = cos(t)+1

function F1(du, u, p, t)
 du[1] = -a*u[1] - b*u[2] + P1(t)
 du[2] = -c*u[1] - h*u[2] + Q1(t)
end

prob = ODEProblem(F1, [x0;y0], (0,10))
condition(u,t,integrator) = u[1] >= 0 && u[2] >= 0
cb = ContinuousCallback(condition,terminate!)
sol = solve(prob,callback=cb)

plt1 = plot(legend=true)
plot!(plt1, sol)
savefig(plt1, "solution1.png")

a = 0.35
b = 0.73
c = 0.45
h = 0.41
P2(t) = 2*sin(2*t)
Q2(t) = cos(t)+1

function F2(du, u, p, t)
 du[1] = -a*u[1] - b*u[2] + P2(t)
 du[2] = -c*u[1]*u[2] - h*u[2] + Q2(t)
end

prob2 = ODEProblem(F2, [x0;y0], (0,10))
sol2 = solve(prob2,callback=cb)

plt2 = plot(legend=true)
plot!(plt2, sol2)
savefig(plt2, "solution2.png")
