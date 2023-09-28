#Quatro:
#1. For communicating to decision-makers, who want to focus on the conclusions
#2. For collaborating with other data scientists 
#3. As an environment in which to do data science, as a modern-day lab notebook where you can capture not only what you did, but also what you were thinking

#Quatro-Basics: quatro file is a text file.qmd

---
title: "Diamond sizes"
date: 2022-09-12
format: html
---

{r}
#| label: setup
#| include: false

library(tidyverse)
library(palmerpenguins)

smaller <- diamonds |> 
  filter(carat <= 2.5)
smaller
#```

#We have data about `r nrow(diamonds)` diamonds.
#Only `r nrow(diamonds) - nrow(smaller)` are larger than 2.5 carats.
#The distribution of the remainder is shown below:
  
#  ```{r}
#| label: plot-smaller-diamonds
#| echo: false

smaller |> 
  ggplot(aes(x = carat)) + 
  geom_freqpoly(binwidth = 0.01)
  ggsave("carat_count_plot.png")
#.................................................................

  quarto::quarto_render("diamond-sizes.qmd")



```