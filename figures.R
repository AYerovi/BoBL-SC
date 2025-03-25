# J. P. Diaz-Sanchez & A. Yerovi
# Better off by law? The Association between a Constitutional Re-form and the Subjective Well-Being of the LGBT community
# Figures

# First set the directory
# dir <- "XXXXXX"
# setwd("XXXX")

library(haven)
data <- read_dta(paste(dir, "data.dta", sep = ""))

library(tidyverse)
library(dplyr)

# F1 ---------------------------------------------------------

d1 <- data$DISCR
d1 <- d1[order(d1, decreasing = F)]
d2 <- data$DISCR_FAM_I
d2 <- d2[order(d2, decreasing = F)]
d3 <- data$DISCR_SOCIAL_I
d3 <- d3[order(d3, decreasing = F)]
P_d <- data.frame(N = c(1:length(d1)), d1)
P_d <- cbind(P_d, d2)
P_d <- cbind(P_d, d3)

de1 <- density(P_d$d1)
de2 <- density(P_d$d2)
de3 <- density(P_d$d3)
plot(de2, main="Density", xlim=c(0,100), col = alpha(rgb(0,0,1), 1), cex=1, cex.lab = 1.5, lwd=2.0,
     xlab="Discrimination index, simple average", family=c("serif"))
lines(de3, col = alpha(rgb(1,0,0), 0.8), lwd=2.0)
lines(de1, col = alpha(rgb(0,0,0), 0.8), lwd=2.0)

## Cumulative histogram 

u_d1 <- unique(P_d$d1)
u_d1_count <- vector()
for(i in 1:length(u_d1)){
  temp <- P_d[P_d$d1 == u_d1[i], ]
  k = dim(temp)[1]
  u_d1_count <- append(u_d1_count, k)
  rm(temp, k)
}
u_d2 <- unique(P_d$d2)
u_d2_count <- vector()
for(i in 1:length(u_d2)){
  temp <- P_d[P_d$d2 == u_d2[i], ]
  k = dim(temp)[1]
  u_d2_count <- append(u_d2_count, k)
  rm(temp, k)
}
u_d3 <- unique(P_d$d3)
u_d3_count <- vector()
for(i in 1:length(u_d3)){
  temp <- P_d[P_d$d3 == u_d3[i], ]
  k = dim(temp)[1]
  u_d3_count <- append(u_d3_count, k)
  rm(temp, k)
}
u_d1_count_c <- cumsum(u_d1_count)/sum(u_d1_count)
u_d2_count_c <- cumsum(u_d2_count)/sum(u_d2_count)
u_d3_count_c <- cumsum(u_d3_count)/sum(u_d3_count)

d1 <- data.frame(u_d1, u_d1_count_c)
d2 <- data.frame(u_d2, u_d2_count_c)
d3 <- data.frame(u_d3, u_d3_count_c)

plot(d1$u_d1, d1$u_d1_count_c, type = "l", xlim=c(0,100), col = alpha(rgb(0,0,0), 0.7), cex=1, 
     cex.lab = 1.5, lwd=3.0, xlab="Discrimination index, simple average", 
     ylab=" Cumulative density", family=c("serif"))
lines(d2$u_d2, d2$u_d2_count_c, col = alpha(rgb(0,0,1), 0.8), lwd=2.0)
lines(d3$u_d3, d3$u_d3_count_c, col = alpha(rgb(1,0,0), 0.8), lwd=2.0)


# F2 ------------------------------------------------------

s <- data$S
s <- s[order(s, decreasing = F)]
s <- na.omit(s)
P_s <- data.frame(N = c(1:length(s)), s)

se <- density(P_s$s)
plot(se, main="Density", xlim=c(0,100), col = alpha(rgb(0,0,0), 1), cex=1, cex.lab = 1.5, lwd=2.0,
     xlab="Well-being index, simple average", family=c("serif"))

## Cumulative histogram 

u_s <- unique(P_s$s)
u_s <- na.omit(u_s)
u_s_count <- vector()
for(i in 1:length(u_s)){
  temp <- P_s[P_s$s == u_s[i], ]
  k = dim(temp)[1]
  u_s_count <- append(u_s_count, k)
  rm(temp, k)
}
u_s_count_c <- cumsum(u_s_count)/sum(u_s_count)

s <- data.frame(u_s, u_s_count_c)

plot(s$u_s, s$u_s_count_c, type = "l", xlim=c(0,100), col = alpha(rgb(0,0,0), 1), cex=1, 
     cex.lab = 1.5, lwd=3.0, xlab="Well-being index, simple average", 
     ylab=" Cumulative density", family=c("serif"))


# F3 ------------------------------------------------------------
# Age histograms

Ages <- unique(na.omit(data$AGE))
counts <- vector()
for(i in 1:length(Ages)){
  temp <- data[data$AGE == Ages[i], ]
  k <- dim(temp)[1]
  counts <- append(counts, k)
}

h <- data.frame(x = Ages, y = counts)
h <- h[order(h$x), ]

h$Fr = 0
for(i in 1:dim(h)[1]){
  h$Fr[i] = h$y[i]/sum(h$y)
}
h$FrA = h$Fr
for(i in 2:dim(h)[1]){
  h$FrA[i] = h$Fr[i] + h$FrA[i-1]
}

plot(h$x, h$Fr, pch=16, cex=0.7, cex.lab = 1.5, type = "o", xlab="Age", ylab="Freq.", family=c("serif"))
plot(h$x, h$FrA, pch=16, cex=0.7, cex.lab = 1.5, type = "o", xlab="Age", ylab="Cumulative Freq.", family=c("serif"))


## Discr. and WB per age 

Ages <- unique(data$AGE)
data$AGE <- as.numeric(data$AGE)
data$DISCR_FAM_I <- as.numeric(data$DISCR_FAM_I)


means <- vector()
for(i in 1:length(Ages)){
  temp <- data[data$AGE == Ages[i], ]
  k <- mean(temp$DISCR_FAM_I, na.rm = T)
  means <- append(means, k)
}

g <- data.frame(x = Ages, y = means)
g <- na.omit(g)
g <- g[order(g$x), ]
plot(g$x, g$y, pch=16, cex=1, cex.lab = 1.5, type = "o", xlab="Age", 
     ylab="Perceptions of discrimination, family",
     family=c("serif"))

means <- vector()
for(i in 1:length(Ages)){
  temp <- data[data$AGE == Ages[i], ]
  k <- mean(temp$DISCR, na.rm = T)
  means <- append(means, k)
}

g <- data.frame(x = Ages, y = means)
g <- na.omit(g)
g <- g[order(g$x), ]
plot(g$x, g$y, pch=16, cex=1, cex.lab = 1.5, type = "o",xlab="Age", 
     ylab="Perceptions of discrimination", 
     family=c("serif"))

means <- vector()
for(i in 1:length(Ages)){
  temp <- data[data$AGE == Ages[i], ]
  k <- mean(temp$DISCR_SOCIAL_I, na.rm = T)
  means <- append(means, k)
}

g <- data.frame(x = Ages, y = means)
g <- na.omit(g)
g <- g[order(g$x), ]
plot(g$x, g$y, pch=16, cex=1, cex.lab = 1.5, type = "o", xlab="Age", 
     ylab="Perceptions of social discrimination", family=c("serif"))

means <- vector()
for(i in 1:length(Ages)){
  temp <- data[data$AGE == Ages[i], ]
  k <- mean(temp$S, na.rm = T)
  means <- append(means, k)
}

g <- data.frame(x = Ages, y = means)
g <- na.omit(g)
g <- g[order(g$x), ]
plot(g$x, g$y, pch=16, cex=1, cex.lab = 1.5, 
     type = "o", xlab="Age", ylab="Well-being perceptions",
     family=c("serif"))


