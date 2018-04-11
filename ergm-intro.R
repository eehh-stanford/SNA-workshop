


#library(devtools)
#install_github("zalmquist/networkdata")
library(networkdata)

## 
library(statnet)
load("bott.RData")
summary(bott)
bott
plot(bott[[1]])
plot(bott[[2]])
plot(bott[[3]])
plot(bott[[4]])
plot(bott[[5]])

## 
summary(bott[[4]]~edges) # how many edges?
bottmodel.01 <- ergm(bott[[4]]~edges) # Estimate minimal model
summary(bottmodel.01) # The fitted model object

## 
summary(bott[[4]]~edges+triangle)
bottmodel.02 <- ergm(bott[[4]]~edges+triangle)
summary(bottmodel.02)

## 
age <- bott[[4]] %v% "age.month"
summary(age)
plot(bott[[4]], vertex.cex=age/24)
summary(bott[[4]]~edges+nodecov('age.month'))
bottmodel.03 <- ergm(bott[[4]]~edges+nodecov('age.month'))
summary(bottmodel.03)

## 
bottmodel.03b <- ergm(bott[[4]]~edges+nodeicov('age.month'))
summary(bottmodel.03b)

## 
bottmodel.03c <- ergm(bott[[4]]~edges+absdiff('age.month'))
summary(bottmodel.03c)

## 
bottmodel.04 <- ergm(bott[[4]]~edges+mutual)
summary(bottmodel.04)

## 
# Test the imitation network also using edges from the talking network
bottmodel.05 <- ergm(bott[[4]]~edges+edgecov(bott[[1]]))
summary(bottmodel.05)

## 
## note that this creates a vector of all the kids' ages
bott[[4]]%v%"age.month"
## create matrix of pairwise absolute age differences
agediff <- abs(outer(bott[[4]]%v%"age.month",bott[[4]]%v%"age.month","-"))
bottmodel.06 <- ergm(bott[[4]]~edges+edgecov(bott[[1]])+edgecov(agediff))
summary(bottmodel.06)

## 
bottmodel.06.gof <- gof(bottmodel.06 ~ model + esp + distance)
bottmodel.06.gof
plot(bottmodel.06.gof)

## 
## install.packages("latticeExtra")
library(latticeExtra)

## 
mcmc.diagnostics(bottmodel.04)

## 
bottmodel.07 <- ergm(bott[[4]]~edges+nodeicov('age.month')+edgecov(bott[[1]])+edgecov(agediff)+gwesp(1,fixed=FALSE))
summary(bottmodel.07)

