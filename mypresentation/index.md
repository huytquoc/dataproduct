---
title       : Developing Data Products - Course Project
subtitle    : Car Price Estimation
author      : Huy Tran
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Contents

#### 1. Introduction
#### 2. Cars dataset Overview
#### 3. Simple Linear Model Overview
#### 4. Final Linear Model Fit - Price Prediction Summary
#### 5. Car Price Application

---

## Introduction

As part of the Developing Data Products - Course Project, I'm developing a Shiny Application - Car Price Estimation. In which, the Prediction Linear Model is fitted basing on the Cars Dataset of "caret" package. 

With the Car Price Estimation App, user can put in values of car features including Mileage, Cylinder, Doors, Leather, Convertible, Hatchback, and Sedan, the App will provide estimated Price for the car basing on the input values.

Note: The model fit and estimation performed in the Application is just for the purpose to show how reactive functions work in Shiny. The model fit, the accuracy is NOT in scope of this Application.

---

## Cars dataset Overview




```r
data(cars)
head(cars, 5)
```

```
##      Price Mileage Cylinder Doors Cruise Sound Leather Buick Cadillac
## 1 22661.05   20105        6     4      1     0       0     1        0
## 2 21725.01   13457        6     2      1     1       0     0        0
## 3 29142.71   31655        4     2      1     1       1     0        0
## 4 30731.94   22479        4     2      1     0       0     0        0
## 5 33358.77   17590        4     2      1     1       1     0        0
##   Chevy Pontiac Saab Saturn convertible coupe hatchback sedan wagon
## 1     0       0    0      0           0     0         0     1     0
## 2     1       0    0      0           0     1         0     0     0
## 3     0       0    1      0           1     0         0     0     0
## 4     0       0    1      0           1     0         0     0     0
## 5     0       0    1      0           1     0         0     0     0
```


--- 
## Simple Linear Model Overview
Reviewing the simple linear model with the Price outcome against the rest of other variables.

```r
lm.fit <- lm(Price~., data=cars)
summary(lm.fit)$coefficients
```

```
##                  Estimate   Std. Error    t value      Pr(>|t|)
## (Intercept) -1124.1964049 992.59079168  -1.132588  2.577314e-01
## Mileage        -0.1842076   0.01256171 -14.664211  3.105605e-43
## Cylinder     3659.4543048 113.34473249  32.286055 2.018928e-146
## Doors        1567.0716111 258.91806882   6.052384  2.204691e-09
## Cruise        340.8694804 295.96167020   1.151735  2.497788e-01
## Sound         440.9169244 234.48419021   1.880370  6.042589e-02
## Leather       790.8219718 249.74484222   3.166520  1.602072e-03
## Buick         947.7050291 552.53037674   1.715209  8.669956e-02
## Cadillac    13362.3756488 624.81572282  21.386107  2.161550e-80
## Chevy        -549.2060512 439.71408526  -1.249007  2.120329e-01
## Pontiac     -1399.8825041 486.84800209  -2.875400  4.143812e-03
## Saab        12278.2029336 554.60394636  22.138687  7.600977e-85
## convertible 11022.5866706 541.90416388  20.340472  2.843191e-74
## hatchback   -6361.9596090 610.41252139 -10.422394  6.436081e-24
## sedan       -4449.3576582 446.30928821  -9.969225  3.965157e-22
```

---

## Linear Model Fit Summary

Simply basing on the simple linear model as assessed in the previous Slide, we select the features including Mileage, Cylinder, Doors, Leather, Convertible, Hatchback, and Sedan for the final Model fit. 


```r
lm.fit.final <- lm(Price~Mileage+Cylinder+Doors+Leather+convertible+hatchback+sedan, data=cars)
summary(lm.fit.final)$coefficients
```

```
##                  Estimate   Std. Error    t value      Pr(>|t|)
## (Intercept) -12025.231172 1.658730e+03  -7.249662  9.901874e-13
## Mileage         -0.179402 2.490833e-02  -7.202488  1.371546e-12
## Cylinder      4074.494573 1.545098e+02  26.370460 1.228015e-110
## Doors         5055.383628 4.447457e+02  11.366909  7.514819e-28
## Leather       2863.090946 4.611911e+02   6.208036  8.630073e-10
## convertible  21524.769345 9.550733e+02  22.537295  2.225687e-87
## hatchback   -13454.252513 1.051406e+03 -12.796444  3.143284e-34
## sedan        -7843.293865 8.013574e+02  -9.787510  1.946458e-21
```

---

## Car Price Application

The Car Price Application can be accessed via the link: [Car Price Estimation - Shiny App] (https://huytquoc.shinyapps.io/carPriceEstimate)

Please click on the Link provided above to run the Shiny App - Car Price Estimation.

Thank you for watching!
