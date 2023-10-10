feed <img src="man/figures/logo.png" align="right" />
=======================================================

A tool for getting the information of animal feeds.

## Overview
feed is a tool for getting the information of animal feeds. Basically, it can load, modify, and compare the animal feed dataset from Animal Feed Resources Information System (INRA CIRAD AFZ and FAO).   

## Installation  
``` r
# install.packages("remots")
remotes::install_github("adatalab/feed")
```

## Usage
``` r
library(feed)
```

### Feed information
#### feed_list
`feed_list` function shows the list of feeds of [feedipedia.org](https://www.feedipedia.org/).

``` r
# All feeds
feed_list(category = "all")

# Forage plants
feed_list(category = "forage")

# Plant products/by-products
feed_list(category = "plantProduct")

# Feeds of animal origin
feed_list(category = "animalOrigin")

# Other feeds
feed_list(category = "other")
```

#### feed_search
`feed_search` function shows the results found at [feedipedia.org](https://www.feedipedia.org/). When you find the result (in the R or Web) that you want, copy the url for scraping the feed data using `feed_info` function.      

``` r
feed_search("maize")
```

#### feed_info
`feed_info` function shows the nutritive values of the specific feedstuff(url) in the form of a dataframe.

``` r
# get the information about the url
feed_info(url = "https://www.feedipedia.org/node/556")
```

### Conversion
#### dm_asis
`dm_asis` function converts dry-matter basis into as-is basis.

``` r
df <- data.frame(nutrient = c("CP", "NDF", "EE", "Ash"), composition = c(10, 30, 5, 2))
dm_asis(composition = df$composition, dm = 85, digits = 2)
```

#### asis_dm
`asis_dm` function converts as-is basis into dry-mater basis.

``` r
df <- data.frame(nutrient = c("CP", "NDF", "EE", "Ash"), composition = c(10, 30, 5, 2))
asis_dm(composition = df$composition, dm = 85, digits = 2)
```

#### j_cal
`j_cal` function converts joule into calorie.  

``` r
j_cal(joule = 4000, standard = "15")
```

#### cal_j
`cal_j` function converts calorie into joule.  

``` r
cal_j(cal = 5000, standard = "15")
```

### Datasets
#### feed_nias
`feed_nias` is a dataset fram National Institute of Animal Science (South Korea). This dataset contains the information of common feed ingredient used in South Korea. **The dataset contains the Korean language.**

``` r
feed_nias

# find the ingredients by the name
feed_nias %>% dplyr::filter(grepl("옥수수", .$ingredients))
```

#### amino_acids
This dataset contains the list and characteristics of amino acids.
``` r
amino_acids
```

#### fatty_acids
This dataset contains the list and characteristics of saturated and unsaturated fatty acids.
``` r
fatty_acids
```

## Getting helps
Email: ruminoreticulum@gmail.com
