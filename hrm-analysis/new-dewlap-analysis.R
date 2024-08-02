load("../../3.JEB_submission/Revell_etal_fitmultiMk.analyses/dewlap-analysis/dewlap-analysis.Rdata")

library(phytools)

er_hrm.dewlap<-fitHRM(as.phylo(treedC),DomCol,
  model="ER",parallel=TRUE,niter=10)

sym_hrm.dewlap<-fitHRM(treedC,DomCol,model="SYM",parallel=TRUE,
  corHMM_model=TRUE,niter=10)

ard_hrm.dewlap<-fitHRM(treedC,DomCol,model="ARD",parallel=TRUE,
  corHMM_model=TRUE,niter=20)

ard_hrm.dewlap2<-fitHRM(treedC,DomCol,model="ARD",parallel=TRUE,
  corHMM_model=TRUE,niter=50)

ard_hrm.dewlap$lik(as.Qmatrix(er_hrm.dewlap))

options(scipen=0)

round(anova(fitER1,fitERmulti1,er_hrm.dewlap,
  fitSYM1,fitSYMmulti1,sym_hrm.dewlap,
  fitARD1,fitARDmulti1,ard_hrm.dewlap2),6)

save(er_hrm.dewlap,sym_hrm.dewlap,ard_hrm.dewlap2,
  file="dewlap-hrm-analysis.rda")

# er_gamma.dewlap<-fitgammaMk(treedC,DomCol,min.alpha=0.01,
#   marginal=TRUE,parallel=TRUE)
# er_gamma.dewlap
# 
# ard_gamma.dewlap<-fitgammaMk(treedC,DomCol,min.alpha=0.01,
#   model="ARD",
#   marginal=TRUE,parallel=TRUE)
# ard_gamma.dewlap
# 
# sym_gamma.dewlap<-fitgammaMk(treedC,DomCol,min.alpha=0.01,
#   model="SYM",
#   marginal=TRUE,parallel=TRUE)
# plot(sym_gamma.dewlap)
