# growth charts

Create growth charts for infants and children ages 0 to 2 using the [WHO's Child Growth Standards](http://www.who.int/childgrowth/en/). Includes the following charts:

* Head circumference for age
* Height/length for age
* Weight for age
* Weight for length

```r
devtools::install_github("aaronwolen/growthcharts")

library(growthcharts)
weight_for_age(weight = 8.5, age = 10)
```

![](http://i.imgur.com/UfKlVeb.png)
