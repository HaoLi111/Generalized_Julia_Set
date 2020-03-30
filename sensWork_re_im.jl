pSensList = -5:.1:5
rSensList =-2:.1:2
iSensList = 0:.1:2
rBase = -2:2e-3:2
iBase = -2:2e-3:2

cd("D:\\Math modelling\\Fractal\\JL_IFS")
include("Julia_set_sensitivity.jl")
using Plots
using GR
#mkdir("Sens_by_re_im")

#cd("Sens_by_re_im")
dir_current=  "Sens_by_re_im"
gr()
t1 = time()
println("$t1")

missionIndex = 1:length(pSensList)
for i in missionIndex
    if !isdir(dir_current*"/p$i")
        #mkdir(dir_current*"/p$i")
    end
    for j in 1:length(rSensList)
        if !isdir(dir_current*"/p$i/r$j")
            mkdir(dir_current*"/p$i/r$j")
        end
        for k in 1:length(iSensList)
            
            rSens = rSensList[j];iSens=iSensList[k];pSens=pSensList[i]
            x=[]
            try
            if !isfile(dir_current*"/p$i/r$j/$k.png")  
                println("working on $i;$j;$k")
                m =ply_GJulia(rBase,iBase,[rSens+iSens*im,pSens];ths=1000)
                log10m = log10.(m)
                
                Plots.contour(rBase,iBase,log10m;fill=log10m,markerstrokewidth=.01,aspect_ratio=1,bg_color=:black,fg_color ="white",size=[1600,1280],dpi=150)
                Plots.title!("Generalized Julia Set ; Lg(Iteration time), z = z^$pSens + ( $rSens + $iSens i)")
                Plots.savefig(dir_current*"/p$i/r$j/$k.png")
            end
            catch x
            end

        end
    end
end
t2=time()


