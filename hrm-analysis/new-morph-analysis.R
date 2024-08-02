library(phytools)
library(foreach)
library(doParallel)

load("../../3.JEB_submission/Revell_etal_fitmultiMk.analyses/morph-analysis/morph-analysis.Rdata")

nn<-c(colnames(anolis_vert),paste(colnames(anolis_vert),"*",sep=""))
MODEL<-matrix(0,length(nn),length(nn),dimnames=list(nn,nn))

for(i in 1:(ncol(anolis_vert)-1)){
  MODEL[i,i+1]<-1
  MODEL[i+1,i]<-2
  MODEL[i+ncol(anolis_vert),i+1+ncol(anolis_vert)]<-3
  MODEL[i+1+ncol(anolis_vert),i+ncol(anolis_vert)]<-4
}
for(i in 1:ncol(anolis_vert)){
  MODEL[i,i+ncol(anolis_vert)]<-5
  MODEL[i+ncol(anolis_vert),i]<-6
}

MODEL

anolis_vert.hidden<-cbind(anolis_vert,anolis_vert)
colnames(anolis_vert.hidden)<-nn


## set number of optimization iterations per model
niter<-20
## open cluster for parallelized optimization
ncores<-min(niter,parallel::detectCores()-2)
mc<-makeCluster(ncores,type="PSOCK")
registerDoParallel(cl=mc)

fits<-foreach(i=1:niter)%dopar%{
  phytools::fitMk(pruned.anolis_tree,
  anolis_vert.hidden,model=MODEL,
  rand_start=TRUE)
}

stopCluster(cl=mc)

logL<-sapply(fits,logLik)
print(logL)

fit.hrm<-fits[[which.max(logL)[1]]]
fit.hrm

Q<-as.Qmatrix(fit.hrm)
nc<-ncol(Q)
ind<-c(1:(nc/2),(nc/2):1+nc/2)
Q<-Q[ind,ind]
Q<-as.Qmatrix(Q)

png(file="test-hidden-rates.png",width=8,height=7,units="in",res=600)
plot(Q,text=FALSE,cex.traits=0.6,width=TRUE,
  max.lwd=5,color=TRUE,xlim=c(-1.5,1),ylim=c(-1,1),
  show.zeros=FALSE)
dev.off()

png(file="hidden-rates.png",width=8,height=7,units="in",res=600)
plot(fit.hrm,text=FALSE,cex.traits=0.6,width=TRUE,
  max.lwd=5,color=TRUE,xlim=c(-1.5,1),ylim=c(-1,1),
  show.zeros=FALSE)
dev.off()

best_so_far<-fit.hrm

anova(fit.single,fit.multi,fit.hrm)

save(fit.hrm,file="morph-hrm-analysis.rda")
