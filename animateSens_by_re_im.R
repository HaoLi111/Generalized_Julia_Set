
require(av)
setwd("D:\\Math modelling\\Fractal\\JL_IFS\\Sens_by_re_im/")
pSensList = seq(from = -5,by = .1,to = -0.1)
rSensList = seq(from = -2,by = .1,to = 2)
iSensList = seq(from = 0,by = .1,to = 2)
lpSensList = length(pSensList)
lrSensList = length(rSensList)
liSensList = length(iSensList)
dir.create("byP")
for(i in 1:length(rSensList)){
    for(j in 1:length(iSensList)){
        try({
            av_encode_video(paste0("p",1:lpSensList,"/r",i,"/",j,".png"),
        paste0("byP/","r",i,"i",j,".mp4"),framerate=10)
        })
    }
}

for(i in 1:length(rSensList)){
    for(j in 1:length(iSensList)){
        try({
            av_encode_video(paste0("p",1:lpSensList,"/r",i,"/",j,".png"),
        paste0("byP/","r",i,"i",j,".avi"),framerate=10)
        })
    }
}
img_list = c()
for(i in 1:length(rSensList)){
    for(j in 1:length(iSensList)){
        if(file.exists(paste0("byP/","r",i,"i",j,".avi"))){
            img_list = c(img_list,paste0("p",1:lpSensList,"/r",i,"/",j,".png"))
        }

    }
}
av_encode_video(img_list,
        paste0("byP/","Collection by p.mp4"),framerate=10)
