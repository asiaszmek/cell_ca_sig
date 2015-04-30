setwd("/home/neuro/Documents/cell_ca_sig")
species_names<-as.character(read.table("species_name.txt")$V1)
names<-c("time","ca","camca1","camca3",species_names)
observs<-read.table("observes.txt")

#colum indexes
bK0<-as.numeric(unlist(strsplit(toString(observs$V2[1]),",")))+4
bK1<-as.numeric(unlist(strsplit(toString(observs$V2[2]),",")))+4
bK2<-as.numeric(unlist(strsplit(toString(observs$V2[3]),",")))+4
bK3<-as.numeric(unlist(strsplit(toString(observs$V2[4]),",")))+4
bK4<-as.numeric(unlist(strsplit(toString(observs$V2[5]),",")))+4
bK5<-as.numeric(unlist(strsplit(toString(observs$V2[6]),",")))+4
bK6<-as.numeric(unlist(strsplit(toString(observs$V2[7]),",")))+4
bT0<-as.numeric(unlist(strsplit(toString(observs$V2[8]),",")))+4
bT1<-as.numeric(unlist(strsplit(toString(observs$V2[9]),",")))+4
bT2<-as.numeric(unlist(strsplit(toString(observs$V2[10]),",")))+4
bT3<-as.numeric(unlist(strsplit(toString(observs$V2[11]),",")))+4
bT4<-as.numeric(unlist(strsplit(toString(observs$V2[12]),",")))+4
bT5<-as.numeric(unlist(strsplit(toString(observs$V2[13]),",")))+4
bT6<-as.numeric(unlist(strsplit(toString(observs$V2[14]),",")))+4

library("ggplot2")
setwd("/home/neuro/Documents/cell_ca_sig/results_src10_int10us")
data_nano<-read.table("nano.txt")
names(data_nano)<-names
unbound_b<-data_nano[,bK0]
bound_b<-rowSums(cbind(data_nano[,bK1],2*data_nano[,bK2],3*data_nano[,bK3],4*data_nano[,bK4],5*data_nano[,bK5],6*data_nano[,bK6]))
phos_b<-rowSums(cbind(data_nano[,bT1],2*data_nano[,bT2],3*data_nano[,bT3],4*data_nano[,bT4],5*data_nano[,bT5],6*data_nano[,bT6]))
bound_total<-rowSums(cbind(bound_b,data_nano$g7,data_nano$g11))
phos_total<-rowSums(cbind(phos_b,data_nano$g11,data_nano$g12))
data_nano$bound_b<-bound_b
data_nano$phos_b<-phos_b
data_nano$bound_total<-bound_total
data_nano$phos_total<-phos_total
#gs<-ggplot(data=data_nano, aes(x=time, y=b4)) + geom_line()+ xlab("time")
gs<-ggplot(data=data_nano, aes(x=time, y=(camca1+2*camca2+3*camca3+4*camca4+bound_total)/ca)) + geom_line()+ xlab("time")

setwd("/home/neuro/Documents/cell_ca_sig/results_src10_int10us")
data_cytol<-read.table("cytol.txt")
names(data_cytol)<-names
unbound_b<-data_cytol[,bK0]
bound_b<-rowSums(cbind(data_cytol[,bK1],2*data_cytol[,bK2],3*data_cytol[,bK3],4*data_cytol[,bK4],5*data_cytol[,bK5],6*data_cytol[,bK6]))
phos_b<-rowSums(cbind(data_cytol[,bT1],2*data_cytol[,bT2],3*data_cytol[,bT3],4*data_cytol[,bT4],5*data_cytol[,bT5],6*data_cytol[,bT6]))
bound_total<-rowSums(cbind(bound_b,data_cytol$g7,data_cytol$g11))
phos_total<-rowSums(cbind(phos_b,data_cytol$g11,data_cytol$g12))
data_cytol$bound_b<-bound_b
data_cytol$phos_b<-phos_b
data_cytol$bound_total<-bound_total
data_cytol$phos_total<-phos_total
#gc<-ggplot(data=data_cytol, aes(x=time, y=b4)) + geom_line()+ xlab("time")
gc<-ggplot(data=data_cytol, aes(x=time, y=(camca1+2*camca2+3*camca3+4*camca4+bound_total)/ca)) + geom_line()+ xlab("time")

setwd("/home/neuro/Documents/cell_ca_sig/results_src10_int10us")
data_nucleus<-read.table("nucleus.txt")
names(data_nucleus)<-names
gn<-ggplot(data_nucleus, aes(x=time, y=ca)) + geom_line()+ xlab("time")