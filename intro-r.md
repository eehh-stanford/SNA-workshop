
## Introduction to `R`

- [What Is R?](#what-is-r)
- [Why Use R?](#why-use-r)
- [Wouldn't Something Menu-Driven Be Easier?](#wouldnt-something-menu-driven-be-easier)
- [Rhesus Monkey Grooming Network](#rhesus-monkey-grooming-network)

Back to [main page](README.md).

### What Is R?

- `R` is statistical numerical software
- `R` is a "dialect" of the S statistical programming language
- `R` is a system for interactive data analysis
- `R` is a high-level programming language
- `R` is state-of-the-art in statistical computing. It is what many (most?) research statisticians use in their work

### Why Use R?

- `R` is FREE! That, by itself, is almost enough. No complicated licensing. Broad dissemination of research methodologies and results, etc.
- `R` is available for a variety of computer platforms (e.g., Linux, MacOS, Windows).
- `R` is widely used by professional statisticians, social scientists, biologists, demographers, and other scientists. This increases the likelihood that code will exist to do a calculation you might want to do.
- `R` has remarkable online help lists, tutorials, etc.
- `R` represents the state-of-the-art in statistical computing.

### Wouldn't Something Menu-Driven Be Easier?

- Fallacious thinking
- For teaching, text-based input is always better
- Example code can be copied and input *exactly*; you can then tweak it and see what happens, facilitating the learning process
- An example
- What follows is a pretty complicated graph of the grooming interactions of a group of rhesus monkeys, *Macaca mulatta*, observed by Sade (1972)
- With the code I used to generate this graph, you can recreate the figure *exactly*. Try it! It doesn't matter if you have no idea what you're doing yet. That's the point.
- The only thing you need to make this figure is to install and load the library `igraph`

### Rhesus Monkey Grooming Network

``` r
require(igraph)
rhesus <- read.table("https://web.stanford.edu/class/earthsys214/data/sade1.txt", 
                     skip=1, header=FALSE)
rhesus <- as.matrix(rhesus)
nms <- c("066", "R006", "CN", "ER", "CY", "EC", "EZ", "004", "065", "022", "076", 
         "AC", "EK", "DL", "KD", "KE")
sex <- c(rep("M",7), rep("F",9))
dimnames(rhesus)[[1]] <- nms
dimnames(rhesus)[[2]] <- nms
grhesus <- graph_from_adjacency_matrix(rhesus, weighted=TRUE)
V(grhesus)$sex <- sex

rhesus.layout <- layout.kamada.kawai(grhesus)
plot(grhesus, edge.width=log10(E(grhesus)$weight)+1, vertex.label=V(grhesus)$name,
     vertex.color=as.numeric(V(grhesus)$sex=="F")+5, layout=rhesus.layout)
```
