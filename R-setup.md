---
layout: post
title: "Getting started in R and RStudio"
author: Elspeth Ready
date: 2017-04-02
---

-   [Installing R](#installing-r)
-   [Installing RStudio](#installing-rstudio)
-   [More detailed instructions](#more-detailed-instructions)
-   [Installing packages](#installing-packages)
-   [Getting started in RStudio](#getting-started-in-rstudio)

Installing R
============

Go to the [R website](https://cran.r-project.org/mirrors.html) and choose the CRAN mirror closest to you. Choose your operating system and then download the most recent version of R (or whatever is appropriate if you have an older operating system). Install it on your computer as you would any other software program.

Installing RStudio
==================

In addition to R itself, you will require a program in which to edit your R code. Most R users now use RStudio, which can be found [here](https://www.rstudio.com/). Follow the links on the webpage to download the free desktop version of RStudio, and choose the appropriate version for your operating system (for easiest installation, just use the "installers" rather than installing from ZIP or tarball). Again, install the program as you would any other software.

More detailed instructions
==========================

If you need more detailed instructions on installing the software, there are many online video tutorials that will walk you through the process.

For Mac users, a recent video tutorial for installing R and RStudio can be found [here](https://medium.com/@GalarnykMichael/install-r-and-rstudio-on-mac-e911606ce4f4).

For PC users, a recent video tutorial for installing R can be found [here](https://www.youtube.com/watch?v=WzEaFpXVTkk) and one for installing RStudio can be found [here](https://www.youtube.com/watch?v=OtonR6RUgY0).

If you encounter difficulties, you are probably not the first person to experience a particular issue. Googling the problem you are encountering will often lead to a solution.

Installing packages
===================

R contains a lot of basic functionality for programming and statistics, but for specialized tasks like network analysis, we require additional software packages to extend R's capabilities (if we don't wish to code up all the functions we need ourselves). For this workshop, we will use the `igraph` and `statnet` packages.

Once you've installed RStudio, open the program, and install `igraph` and `statnet` by entering each of these lines of code in the console window (at the bottom left of the default RStudio layout):

``` r
install.packages("igraph") 
install.packages("statnet", dependencies=TRUE)
```

You'll probably be prompted to choose a mirror again (choose whatever is closest to you). RStudio might ask you where you want to store package files on your computer. The default suggestion for packages is fine.

The argument `dependencies=TRUE` just means that you'll allow R to also install any packages that the package you're installing needs; `statnet` requires a few additional packages. Download `statnet` over a good internet connection, it is quite large!

Manuals for these packages are available through CRAN ([igraph](https://cran.r-project.org/web/packages/igraph/igraph.pdf) and [statnet](https://cran.r-project.org/web/packages/statnet/statnet.pdf)).

Getting started in RStudio
==========================

In RStudio, create your own .R script file (File → New File → R Script). Type and save your code in the script file. To run a line of code, send it from the script to the console using `Ctrl+Enter` on your keyboard.

Familiarize yourself with the basics of R by working through our next tutorial (Introduction to R.)

When closing RStudio, it will ask if you want to save the workspace---the answer is almost always "NO.''

A cheatsheet to help you remember syntax and basic functions is always useful when learning a new programming language. You can find one [here](https://www.rstudio.com/wp-content/uploads/2016/10/r-cheat-sheet-3.pdf).
