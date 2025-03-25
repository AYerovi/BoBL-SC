setwd("~/Documents/Adrian/Universitario/RA/R")
library(haven)
library(tidyverse)
base0 <- as_tibble(read_sav("base final v2.sav"))
nase <- base0

# Creacion de las variables necesarias ---------------------------------------------------

summary(base$S3_P0411) # "Ninguna de las anteriores" discrimination
summary(base$S3_P04121) # "Otros, indique", non-numeric variable

col_names <- colnames(base)

attach(base)
base$LF = (11 - (base$S3_P041-1) - (base$S3_P042-1) - (base$S3_P043-1) - 
             (base$S3_P044-1) - (base$S3_P045-1) - (base$S3_P046-1) - (base$S3_P047-1) - 
             (base$S3_P048-1) - (base$S3_P049-1) - (base$S3_P0410-1) - (base$S3_P0411-1))/11

summary(base$LF)

# "Seccion 2 P2"
base$DISCR_FAM = S3_P02A1 + S3_P02A2 + S3_P02A3 + S3_P02A4 + S3_P02A5 + S3_P02A6 +
  S3_P02A7 + S3_P02B1 + S3_P02B2 + S3_P02B3 + S3_P02B4 + S3_P02B5 + S3_P02C1 + 
  S3_P02C2 +S3_P02C3 + S3_P02C4 + S3_P02C5 + S3_P02C6 + S3_P02C7 + S3_P02C8 + 
  S3_P02D1 + S3_P02D2 + S3_P02D3 + S3_P02D4 + S3_P02D5 - 25

base$DISCR_SOC = S3_P03A3.1 + S3_P03A3.2 + S3_P03A3.3 + S3_P03A3.4 + S3_P03A3.5 +
  S3_P03A3.6 + S3_P03B3.1 + S3_P03B3.2 + S3_P03C3.1 + S3_P03C3.2 + S3_P03C3.3 +
  S3_P03C3.4 + S3_P03C3.5 - 13

base$DISCR = 0.5*(base$DISCR_FAM/25) + 0.5*(base$DISCR_SOC/13)
base$DISCR_2 = 0.25*(base$DISCR_FAM/25) + 0.75*(base$DISCR_SOC/13)
base$DISCR_3 = 0.75*(base$DISCR_FAM/25) + 0.25*(base$DISCR_SOC/13)
summary(base$DISCR)

attach(base)
cor(LF, DISCR)

base <- subset(base, S1_P01 < 99)
base$AGE = base$S1_P01
base$AGE2 = base$S1_P01^2

base <- subset(base, S5_P03 != 12)
base$EDUC = base$S5_P03

base <- subset(base, S1_P03 != 3)
base$SEX = base$S1_P03 - 1

base <- subset(base, S1_P02 != 8)
base$M_status = base$S1_P02

base <- subset(base, S1_P04 != 7)
base$SEX_OR = base$S1_P04

base$SEX_ACTIVE = base$S6_P09

base$JOB_CHARGE = base$S6_P05

base <- subset(base, S6_P07 != 99999)
for(i in 1:dim(base)[1]){
  if(base$S6_P07[i] > 0){
    base$S6_P07[i] = log(base$S6_P07[i]+1)
  }
  else{
    base$S6_P07[i] = NA
  }
}
base$INCOME = base$S6_P07
summary(base$INCOME)

base$B_THERE = 0 
for(i in 1:dim(base)[1]){
  if(base$S1_P12[i] == 1){
    base$B_THERE[i] = 1 
  }
}

colnames(base)
data <- base[,c(1:6, 497:510)]

write.csv(base, "base.csv")
write.csv(data, "data.csv")

base$ORG = 0
for( i in 1:dim(base)[1]){
  if(base$IORG[i]==1){
    base$ORG[i]=1
  }
}
mean(base$ORG)
sum(base$ORG)


#Sampling correction ---------------------------------------------------------

install.packages("sampleSelection")
library(sampleSelection)

h <- selection(ORG ~ DISCR + AGE + AGE2 + INCOME + EDUC + factor(JOB_CHARGE) + factor(SEX) + factor(UG_CIUD), 
               LF ~ DISCR + AGE + AGE2 + EDUC + factor(M_status), data = base)
summary(h)

h_2 <- selection(ORG ~ DISCR_2 + AGE + AGE2 + INCOME + EDUC + factor(JOB_CHARGE) + factor(SEX) + factor(UG_CIUD), 
               LF ~ DISCR_2 + AGE + AGE2 + EDUC + factor(M_status), data = base)
summary(h_2)

h_3 <- selection(ORG ~ DISCR_3 + AGE + AGE2 + INCOME + EDUC + factor(JOB_CHARGE) + factor(SEX) + factor(UG_CIUD), 
                 LF ~ DISCR_3 + AGE + AGE2 + EDUC + factor(M_status), data = base)
summary(h_3)


h1 <- selection(ORG ~ DISCR_FAM + DISCR_SOC + AGE + AGE2 + INCOME + EDUC + factor(JOB_CHARGE) + factor(SEX) + factor(UG_CIUD), 
               LF ~ DISCR_FAM + DISCR_SOC + AGE + AGE2 + EDUC + factor(M_status), data = base)
summary(h1)

stargazer(h, h_2, h_3, h1, title="Results", align=TRUE)

### Latex output --------------------------------------------------------------
#install.packages("labelled")
#library(labelled)
#install.packages("stargazer")
library(stargazer)

t1 <- stargazer(m1_corr, m2_corr, m3_corr, title="Results", align=TRUE)
print(t1, file = "r1.tex")

stargazer(m_LF_DISCR_0, m_LF_DISCR_1, m_LF_DISCR_2, m_LF_DISCR_3, title="Results", align=TRUE)

stargazer(m1, m2, m3, title="Results", align=TRUE)

stargazer(m1_corr, m2_corr, m3, title="IV results",
          align=TRUE, dep.var.labels=c("Overall Rating","High Rating"),
          covariate.labels=c("Discrimination","log(Income)",
                             "Born before 1980","Lives in metropolis",
                             "Not migrated","Born1980$*$Metropolis", 
                             "Born1980$*$Metropolis$*$non-migrant", "Constant"),
          omit.stat=c("LL","ser","f"), no.space=TRUE)

stargazer(m1, m2, m3, title="results",
          align=TRUE, dep.var.labels=c("Overall Rating","High Rating"),
          covariate.labels=c("Discrimination","log(Income)",
                             "Born before 1980","Lives in metropolis",
                             "Not migrated","Born1980$*$Metropolis", 
                             "Born1980$*$Metropolis$*$non-migrant", "Constant"),
          omit.stat=c("LL","ser","f"), no.space=TRUE)

m1 <- ivreg(data=data,  LF ~ Discr | Born1980)
summary(m1)

