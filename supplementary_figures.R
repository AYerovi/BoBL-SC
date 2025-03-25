# J. P. Diaz-Sanchez & A. Yerovi
# Better off by law? The Association between a Constitutional Re-form and the Subjective Well-Being of the LGBT community
# Supplementary Figures

# First set the directory
# dir <- "XXXXXX"
# setwd("XXXX")

library(haven)
data <- read_dta(paste(dir, "data.dta", sep = ""))

library(tidyverse)
library(dplyr)

# SF2 Density histograms ---------------------------------------------

d1 <- data$DISCR
d1 <- d1[order(d1, decreasing = F)]
P_d1 <- data.frame(N = c(1:length(d1)), d1)
plot(P_d1$N, P_d1$d1, type = "l", cex=1, cex.lab = 1.5,
     ylab="Discrimination, simple average", xlab = "N", family=c("serif"))

d2 <- data$D_W1
d2 <- d2[order(d2, decreasing = F)]
d3 <- data$D_W2
d3 <- d3[order(d3, decreasing = F)]
d4 <- data$D_W3
d4 <- d4[order(d4, decreasing = F)]
P_d <- data.frame(N = c(1:length(d2)), d2)
P_d <- cbind(P_d, d3)
P_d <- cbind(P_d, d4)

plot(P_d$N, P_d$d2, type = "l", col = alpha(rgb(0,0,1), 0.5),  lwd=5.0, cex=1, cex.lab = 1.5,
     ylab="Discrimination, weighted average", xlab = "N", family=c("serif"))
lines(P_d$N,P_d$d3, type = "l", col= alpha(rgb(1,0,0), 1),  lwd=2.0)
lines(P_d$N,P_d$d4, type = "l", col= alpha(rgb(0,0,0), 0.5),  lwd=2.0)
# P_d$d1_100 = P_d1$d1/100
# lines(P_d$N, P_d$d1, type = "l", col= alpha(rgb(0,0,0), 1),  lwd=2.0)


de2 <- density(P_d$d2)
de3 <- density(P_d$d3)
de4 <- density(P_d$d4)
plot(de4, main="Density", xlim=c(0,2.1), col = alpha(rgb(0,0,0), 0.8), cex=1, cex.lab = 1.5, lwd=2.0,
     xlab="Discrimination index, weighted average", family=c("serif"))
lines(de3, col = alpha(rgb(1,0,0), 1), lwd=2.0)
lines(de2, col = alpha(rgb(0,0,1), 0.8), lwd=2.0)

## Cumulative histogram 

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
u_d4 <- unique(P_d$d4)
u_d4_count <- vector()
for(i in 1:length(u_d4)){
  temp <- P_d[P_d$d4 == u_d4[i], ]
  k = dim(temp)[1]
  u_d4_count <- append(u_d4_count, k)
  rm(temp, k)
}
u_d2_count_c <- cumsum(u_d2_count)/sum(u_d2_count)
u_d3_count_c <- cumsum(u_d3_count)/sum(u_d3_count)
u_d4_count_c <- cumsum(u_d4_count)/sum(u_d4_count)

d2 <- data.frame(u_d2, u_d2_count_c)
d3 <- data.frame(u_d3, u_d3_count_c)
d4 <- data.frame(u_d4, u_d4_count_c)

plot(d4$u_d4, d4$u_d4_count_c, type = "l", xlim=c(0,2.2), col = alpha(rgb(0,0,0), 0.8), cex=1, 
     cex.lab = 1.5, lwd=2.0, xlab="Discrimination index, weighted average", 
     ylab=" Cumulative density", family=c("serif"))
lines(d3$u_d3, d3$u_d3_count_c, col = alpha(rgb(1,0,0), 1), lwd=2.0)
lines(d2$u_d2, d2$u_d2_count_c, col = alpha(rgb(0,0,1), 0.8), lwd=2.0)

# SF3 Density histograms SB ----------------------------------

s1 <- data$S_W1
s1 <- s1[order(s1, decreasing = F)]
s2 <- data$S_W2
s2 <- s2[order(s2, decreasing = F)]
P_s <- data.frame(N = c(1:length(s1)), s1)
P_s <- cbind(P_s, s2)

plot(P_s$N, P_s$s1, type = "l", col = alpha(rgb(0,0,1), 1),  lwd=2.0, cex=1, cex.lab = 1.5,
     ylab="Well-being, weighted average", xlab = "N", family=c("serif"))
lines(P_s$N,P_s$s2, type = "l", col= alpha(rgb(1,0,0), 1),  lwd=2.0)

se1 <- density(P_s$s1)
se2 <- density(P_s$s2)
plot(se2, main="Density", xlim=c(0,1.7), col = alpha(rgb(1,0,0), 1), cex=1, cex.lab = 1.5, lwd=2.0,
     xlab="Well-being, weighted average", family=c("serif"))
lines(se1, col = alpha(rgb(0,0,1), 1), lwd=2.0)


## Cumulative histogram 

u_s1 <- unique(P_s$s1)
u_s1_count <- vector()
for(i in 1:length(u_s1)){
  temp <- P_s[P_s$s1 == u_s1[i], ]
  k = dim(temp)[1]
  u_s1_count <- append(u_s1_count, k)
  rm(temp, k)
}
u_s2 <- unique(P_s$s2)
u_s2_count <- vector()
for(i in 1:length(u_s2)){
  temp <- P_s[P_s$s2 == u_s2[i], ]
  k = dim(temp)[1]
  u_s2_count <- append(u_s2_count, k)
  rm(temp, k)
}
u_s1_count_c <- cumsum(u_s1_count)/sum(u_s1_count)
u_s2_count_c <- cumsum(u_s2_count)/sum(u_s2_count)

s1 <- data.frame(u_s1, u_s1_count_c)
s2 <- data.frame(u_s2, u_s2_count_c)

plot(s2$u_s2, s2$u_s2_count_c, type = "l", xlim=c(0,1.5), col = alpha(rgb(1,0,0), 1), cex=1, 
     cex.lab = 1.5, lwd=2.0, xlab="Well-being index, weighted average", 
     ylab=" Cumulative density", family=c("serif"))
lines(s1$u_s1, s1$u_s1_count_c, col = alpha(rgb(0,0,1), 1), lwd=2.0)


# SF4 Scatterplots ------------------------------------------------
## Discrimination perceptions vs WB 
library(ggplot2)
bub_plot <- data[, colnames(data) %in% c("DISCR", "S")]
bub_plot <- na.omit(bub_plot)
bub_plot$n = paste(as.character(bub_plot$S), 
                   as.character(bub_plot$DISCR), 
                   sep = " ")
pairs <- unique(bub_plot$n)
count <- vector()
for(i in 1:length(pairs)){
  temp <- bub_plot[bub_plot$n == pairs[i], ]
  k = dim(temp)[1]
  count <- append(count, k)
  rm(temp, k)
}
Counts <- data.frame(pairs, count)
colnames(Counts)[1] <- "n"
Counts <- left_join(Counts, bub_plot)
rm(bub_plot, count, pairs)

ggplot(Counts, aes(DISCR, S, size = count)) + 
  geom_point(col = "black", shape = 1) + 
  geom_smooth(method = "lm", se = T, col = "blue") +
  geom_smooth(method = "loess", se = T, col = "red") +
  labs(x = "Discrimination perceptions", y = "Well-being index") + 
  theme_classic(base_family = "serif", base_size = 18)

## Family discrimination perceptions vs WB 

bub_plot <- data[, colnames(data) %in% c("DISCR_FAM_I", "S")]
bub_plot <- na.omit(bub_plot)
bub_plot$n = paste(as.character(bub_plot$S), 
                   as.character(bub_plot$DISCR_FAM_I), 
                   sep = " ")
pairs <- unique(bub_plot$n)
count <- vector()
for(i in 1:length(pairs)){
  temp <- bub_plot[bub_plot$n == pairs[i], ]
  k = dim(temp)[1]
  count <- append(count, k)
  rm(temp, k)
}
Counts <- data.frame(pairs, count)
colnames(Counts)[1] <- "n"
Counts <- left_join(Counts, bub_plot)
rm(bub_plot, count, pairs)

ggplot(Counts, aes(DISCR_FAM_I, S, size = count)) + 
  geom_point(col = "black", shape = 1) + 
  geom_smooth(method = "lm", se = T, col = "blue") +
  geom_smooth(method = "loess", se = T, col = "red") +
  labs(x = "Discrimination perceptions, family", y = "Well-being index") + 
  theme_classic(base_family = "serif", base_size = 18)

## Social discrimination perceptions vs WB 

bub_plot <- data[, colnames(data) %in% c("DISCR_SOCIAL_I", "S")]
bub_plot <- na.omit(bub_plot)
bub_plot$n = paste(as.character(bub_plot$S), 
                   as.character(bub_plot$DISCR_SOCIAL_I), 
                   sep = " ")
pairs <- unique(bub_plot$n)
count <- vector()
for(i in 1:length(pairs)){
  temp <- bub_plot[bub_plot$n == pairs[i], ]
  k = dim(temp)[1]
  count <- append(count, k)
  rm(temp, k)
}
Counts <- data.frame(pairs, count)
colnames(Counts)[1] <- "n"
Counts <- left_join(Counts, bub_plot)
rm(bub_plot, count, pairs)

ggplot(Counts, aes(DISCR_SOCIAL_I, S, size = count)) + 
  geom_point(col = "black", shape = 1) + 
  geom_smooth(method = "lm", se = T, col = "blue") +
  geom_smooth(method = "loess", se = T, col = "red") +
  labs(x = "Discrimination perceptions, social", y = "Well-being index") + 
  theme_classic(base_family = "serif", base_size = 18)

## Social discrimination perceptions vs WB 

bub_plot <- data[, colnames(data) %in% c("DISCR_SOCIAL_I", "S")]
bub_plot <- na.omit(bub_plot)
bub_plot$n = paste(as.character(bub_plot$S), 
                   as.character(bub_plot$DISCR_SOCIAL_I), 
                   sep = " ")
pairs <- unique(bub_plot$n)
count <- vector()
for(i in 1:length(pairs)){
  temp <- bub_plot[bub_plot$n == pairs[i], ]
  k = dim(temp)[1]
  count <- append(count, k)
  rm(temp, k)
}
Counts <- data.frame(pairs, count)
colnames(Counts)[1] <- "n"
Counts <- left_join(Counts, bub_plot)
rm(bub_plot, count, pairs)

ggplot(Counts, aes(DISCR_SOCIAL_I, S, size = count)) + 
  geom_point(col = "black", shape = 1) + 
  geom_smooth(method = "lm", se = T, col = "blue") +
  geom_smooth(method = "loess", se = T, col = "red") +
  labs(x = "Discrimination perceptions, social", y = "Well-being index") + 
  theme_classic(base_family = "serif", base_size = 18)


