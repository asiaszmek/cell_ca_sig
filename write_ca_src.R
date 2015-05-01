setwd("/home/neuro/Documents/cell_ca_sig/")
data<-read.table("soma_ica_burst.dat")
filew<-"ica_burst_10usec.txt"
filecon<-file(filew,"w")
dt=0.01
for(i in 1:20000){
    #print(i)
    on=(i-1)*dt
    off=i*dt
    ca_src=as.integer(-data$V2[i]*31205)
    if(ca_src<0){ca_src=0}
    tmp<-c(paste("cmd i ",on," ", off, " ", dt, " pointsource ca ", ca_src," 0 0 4999.5"))
    #print(tmp)
    write(tmp,filecon,append=T)
}
close(filecon)

