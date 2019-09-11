
function dyn_esc(init,params,FUN::Function,Cond_FUN::Function;ths= 25,silently =false)
    if ths<1
        println(stderr,"Threshold must be an interger >1")
    end
    for i in 1:ths
        init = FUN(init,params)
        if Cond_FUN(init)
            return i
        end
    end
    if silently
        println("Unfinished after"*string(ths)*"iterations")
    end
    return ths
end

# Mandelbrot conditions

condition_mandelbrot(x::Complex) = abs(x)>2

#condition_mandelbrot(3)



iterate_mandelbrot(x::Complex,c::Complex) = x^2+c

escape_mandelbrot(init::Complex) = dyn_esc(init,init,iterate_mandelbrot,condition_mandelbrot)

escape_mandelbrot(.3+0im)

function ply_mandelbrot(rArray,iArray)
    lr = length(rArray);li = length(iArray)
    m = zeros(li,lr)
    
    for i in 1:lr, j in 1:li
        m[j,i] = escape_mandelbrot(rArray[i]+iArray[j]*im)
    end
    return m
end