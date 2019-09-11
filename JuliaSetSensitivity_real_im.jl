
include("Julia_set_sensitivity.jl")


rSens = .4
iSens=.3
pSens=2

rBase = -2:2e-3:2
iBase = -2:2e-3:2


@time m =ply_GJulia(rBase,iBase,[rSens+iSens,pSens];ths=1000)


log10m = log10.(m)

maximum(m)
maximum(log10m)

using Plots


pyplot()
Plots.contour(rBase,iBase,log10m;fill=log10m,markerstrokewidth=.001,aspect_ratio=1,bg_color=:black,fg_color = RGB1(.7,.7,1),size=(1400,1050),dpi=150)
Plots.title!("Lg(Iteration time), z = z^$pSens + ( $rSens + $iSens i)")
