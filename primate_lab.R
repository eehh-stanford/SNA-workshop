require(igraph)
el <- cbind(c("Richard", "Richard", "Richard", "Richard", "Richard", "Richard", "Tony", "Tony", "Tony", "Tony", "Jamie", "Jamie", "Richard", "Richard", "Sonia", "Jamie", "Richard", "Sonia", "Jamie", "Richard"),
            c("Tony", "Jamie", "Adrian", "Mike", "Nancylou", "Nathan", "Jamie", "Nathan", "Mike", "Adrian", "Mike", "Nancylou", "Sonia", "Melissa", "Melissa", "Melissa", "Andy",  "Andy", "Andy", "Babette"))
plab3 <- graph.edgelist(el, directed=FALSE)
plot(plab3, vertex.shape="none", vertex.label.family="Helvetica")

