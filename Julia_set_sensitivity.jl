

escape_julia(init::Complex,par_C::Complex) = dyn_esc(init,par_C,iterate_mandelbrot,condition_mandelbrot)

function ply_julia(rArray,iArray,par_C::Complex)
    lr = length(rArray);li = length(iArray)
    m = zeros(li,lr)
    for i in 1:lr, j in 1:li
        m[j,i] = escape_julia(rArray[i]+iArray[j]*im,par_C)
    end
    return m
end

include("dyn_escNifs-mandelbrot.jl")


iterate_GJulia(x,params::Array)=(x^params[2] + params[1]) #c,power
function escape_GJulia(init::Complex,params::Array;ths=50)
    return dyn_esc(init,params,iterate_GJulia,condition_mandelbrot;ths=ths)
end
function ply_GJulia(rArray::Array,iArray::Array,params::Array;ths=50)
    lr = length(rArray);li = length(iArray)
    m = zeros(li,lr)
    for i in 1:lr, j in 1:li
        m[j,i] = escape_GJulia(rArray[i]+iArray[j]*im,params)
    end
    return m
end

function ply_GJulia(rArray,iArray,params::Array;ths=50)
    lr = length(rArray);li = length(iArray)
    m = zeros(li,lr)
    for i in 1:lr, j in 1:li
        m[j,i] = escape_GJulia(rArray[i]+iArray[j]*im,params;ths=ths)
    end
    return m
end
