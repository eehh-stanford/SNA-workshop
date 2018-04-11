## Code for graphs intro
## James Holland Jones
## Stanford University
## 11 April 2018


## 
require(igraph)
g <- graph(c(1,2), n=2, dir=FALSE)
plot(g, vertex.color="lightblue")

## 
# generate a triangle
g <- graph( c(1,2, 2,3, 1,3), n=3, dir=FALSE)
### do some stuff with tkplot() and get coords which we call tri.coords
tri.coords <- matrix( c(228,416, 436,0, 20,0), nr=3, nc=2, byrow=TRUE)
par(mfrow=c(1,2))
plot(g, vertex.color="lightblue")
plot(g, layout=tri.coords, vertex.color="lightblue")

## 
A <- matrix( c(0,1,1, 1,0,1, 1,1,0), nrow=3, ncol=3, byrow=TRUE)
g <- graph_from_adjacency_matrix(A, mode="undirected", diag=FALSE)
plot(g, layout=tri.coords, vertex.color="lightblue")

## 
A1 <- matrix( c(0,1,0, 0,0,1, 1,0,0), nrow=3, ncol=3, byrow=TRUE)
g1 <- graph_from_adjacency_matrix(A1, mode="directed", diag=FALSE)
plot(g1, layout=tri.coords, vertex.color="lightblue")

## 
A <- as.matrix(read.table("http://web.stanford.edu/class/ess360/data/kapferer-tailorshop1.txt", 
                          header=TRUE, row.names=1))
G <- graph.adjacency(A, mode="undirected", diag=FALSE)
## note the alias for graph_from_adjacency_matrix()
## this is the older call for this function
plot(G, vertex.color="lightblue")

## 
plot(G,vertex.size=0, vertex.color="white", vertex.frame.color="white", 
     vertex.label.cex=0.75, edge.color=grey(0.85))

## 
fg <- fastgreedy.community(G)
subg1 <- induced.subgraph(G, which(membership(fg)==4))
summary(subg1)
plot(subg1,vertex.size=0, vertex.color="white", vertex.frame.color="white", 
     vertex.label.cex=0.75, edge.color=grey(0.85))

## 
subg2 <- induced.subgraph(G, which(membership(fg)==4 | membership(fg)==1))
subg3 <- delete.edges(subg2, c(12, 39, 40))
par(mfrow=c(1,2))
plot(subg2, vertex.size=0, vertex.color="white", vertex.frame.color="white", 
     vertex.label.cex=0.5, edge.color=grey(0.85))
plot(subg3, vertex.size=0, vertex.color="white", vertex.frame.color="white", 
     vertex.label.cex=0.5, edge.color=grey(0.85))

## 
plot(graph.full(5), vertex.color="lightblue")

## 
g <- make_graph( c(1,2, 1,3, 1,4, 1,5), n=5, dir=FALSE )
mki <- c("lightblue",rep("white",4))
lay <- matrix(c(0,0, 1,0, 0,1, -1,0, 0,-1),nr=5,nc=2,byrow = TRUE)
vf <- c("black", rep("white",4))
plot(g, vertex.label=NA, vertex.color=mki, vertex.frame.color=vf, edge.width=3, layout=lay)

## 
degree(G)

## 
g <- erdos.renyi.game(1000, 1/500)
dd <- degree_distribution(g)
lendd <- length(dd)
plot((1:lendd)-1,dd, type="h", lwd=20, lend=2, col="blue", xlab="Degree (k)", ylab="Probability(K=k)")

## 
d <- get.diameter(G)
E(G)$color <- "SkyBlue2"
E(G)$width <- 1
E(G, path=d)$color <- "red"
E(G, path=d)$width <- 2
V(G)$labelcolor <- V(G)$color  <- "blue"
V(G)[d]$labelcolor <- V(G)[d]$color <- "red"
plot(G, vertex.color="white", vertex.frame.color="white", vertex.label.cex=0.5,
     edge.color=E(G)$color, edge.width=E(G)$width,
     vertex.label.color=V(G)$labelcolor,
     vertex.size=3)

## 
g <- graph( c( 1,2, 3,4, 5,6, 6,5), n=8)
ccc <- cbind(c(300, 100, 100, 300, 100, 300, 100, 300),  
             c(300, 300, 230, 230, 160, 160, 90, 90))
plot(g, layout=ccc, vertex.color=grey(0.75))

## 
g030t <- graph( c(1,2, 2,3, 1,3), n=3)
plot(g030t, vertex.color="lightblue")
#tkplot(g030t)
#tk_coords(1)
tri.coords <- matrix( c(228,416, 436,0, 20,0), nr=3, nc=2, byrow=TRUE)
plot(g030t, layout=tri.coords, vertex.color="lightblue")

## 
g <- sample_gnm(15, 45, directed = TRUE)
plot(g, vertex.color="lightblue")
triad_census(g)

## 
## define triads
DD <- graph( c(3,1, 3,2), n=3, directed=TRUE)
DS <- graph( c(3,1, 2,1), n=3, directed=TRUE)
BDID <- graph( c(3,1, 2,3), n=3, directed=TRUE)
ISDB <- graph( c(3,1, 1,2), n=3, directed=TRUE)
labs <- c("B","C","A")

## 
par(mfrow=c(2,2))
plot(DD, layout=tri.coords,
     vertex.label=labs,
     vertex.label.family="sans",
     vertex.label.color="black",
     vertex.color="lightblue",
     vertex.frame.color="black",
     vertex.size=50,
     edge.width=2,
     edge.color=grey(0.5))
title("DD")

plot(DS, layout=tri.coords,
     vertex.label=labs,
     vertex.label.family="sans",
     vertex.label.color="black",
     vertex.color="lightblue",
     vertex.frame.color="black",
     vertex.size=50,
     edge.width=2,
     edge.color=grey(0.5))
title("DS")

plot(BDID, layout=tri.coords,
     vertex.label=labs,
     vertex.label.family="sans",
     vertex.label.color="black",
     vertex.color="lightblue",
     vertex.frame.color="black",
     vertex.size=50,
     edge.width=2,
     edge.color=grey(0.5))
title("BDID")

plot(ISDB, layout=tri.coords,
     vertex.label=labs,
     vertex.label.family="sans",
     vertex.label.color="black",
     vertex.color="lightblue",
     vertex.frame.color="black",
     vertex.size=50,
     edge.width=2,
     edge.color=grey(0.5))
title("ISDB")

## 
eplabs <- c("M","S","F")
EP <- graph( c(1,2, 1,3, 2,3), n=3, directed=FALSE)
plot(EP, layout=tri.coords,
     vertex.label=eplabs,
     vertex.label.family="sans",
     vertex.label.color="black",
     vertex.color="white",
     vertex.frame.color="black",
     vertex.size=25,
     edge.width=5,
     edge.color=c("red","red","green"))

## 

flo <- read.table("http://web.stanford.edu/class/ess360/data/flo.txt", 
                  header=TRUE, row.names=1)
gflo <- graph_from_adjacency_matrix(as.matrix(flo), mode="undirected")
gflo
plot(gflo, vertex.color="lightblue")

## 
is.connected(gflo)
clusters(gflo)

## 
gflo1 <- decompose.graph(gflo)[[1]]
plot(gflo1, vertex.color="lightblue")

## 

flo <- read.table("http://web.stanford.edu/class/ess360/data/flo.txt", 
                  header=TRUE, row.names=1)
gflo <- graph_from_adjacency_matrix(as.matrix(flo), mode="undirected")
gflo
plot(gflo, vertex.color="lightblue")

## 
## note we're working with the matrix, not the graph object here
n <- dim(flo)[1]
2*sum(apply(flo,1,sum)/2)/(n*(n-1))
graph.density(gflo)


## 
infocentral <- function(X){
  ## assumes binary relation
  k <- dim(X)[1]
  A <- matrix(as.numeric(!X),nr=k,nc=k)
  diag(A) <- apply(X,1,sum)+1
  C <- solve(A)
  T <- sum(diag(C))
  R <- apply(C,1,sum)[1]
  ic <- 1/(diag(C) + (T - 2*R)/k)
  return(ic)
}

## 
gflo1 <- induced.subgraph(gflo, subcomponent(gflo,1))
## remove Pucci from the matrix
flo1 <- flo[-12,-12]

## 
n <- n-1
2*sum(apply(flo1,1,sum)/2)/(n*(n-1))
graph.density(gflo1)

ic <- infocentral(flo1)
CE <- abs(bonpow(gflo1))

measures <- cbind(CD=degree(gflo1),
              CB=round(betweenness(gflo1),1),
              CC=round(closeness(gflo1),2),
              CI=round(ic,2),
              CE=round(CE,2))
dimnames(measures)[[1]] <- dimnames(flo1)[[1]]
measures
# Plot the graph one last time with the vertices sized according to
# betweenness centrality
plot(gflo1, vertex.size=measures[,"CB"]+1, vertex.color="lightblue")

## 
## correlation matrix of the centralities
cor(measures)
## vertex size proportional to eigenvalue centrality
plot(gflo1, vertex.size=measures[,"CE"]*10, vertex.color="lightblue")

