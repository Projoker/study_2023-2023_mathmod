using Plots

a = 7.7
r0 = a / 4.3

# радиусы катера при движении к центру
rk_straight = collect(a:-0.01:r0)
# углы катера при движении к центру
θk_straight = fill(1e-10, length(rk_straight))
# уравнение радиуса катера при движении по спирали
fk(θ) = r0 * ℯ ^ (θ / √9.89)
# углы катера при движении по спирали
θk_spiral = collect(0:0.01:2π)
# радиусы катера при движении по спирали
rk_spiral = fk.(θk_spiral)
# углы катера
θk = append!(θk_straight, θk_spiral)
# радиусы катера
rk = append!(rk_straight, rk_spiral)

# радиусы лодки
rl = append!(collect(0:0.01:r0), rk_spiral)
# углы лодки
θl = fill(1.5*π, length(rl))

plt = plot(
  proj = :polar,
  aspect_ratio=:equal,
  dpi=300,
  legend=true)

plot!(
  plt,
  θl,
  rl,
  xlabel="θ",
  ylabel="r(θ)",
  label="Траектория лодки",
  color=:red,
  title="Лодка")

plot!(
  plt,
  θk,
  rk,
  xlabel="θ",
  ylabel="r(θ)",
  label="Траектория катера",
  color=:blue,
  title="Катер")

savefig(plt, "solution.png")
