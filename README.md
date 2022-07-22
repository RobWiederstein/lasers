
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lasers

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of lasers is to make the FAA laser incidents data available.

## Development Version

You can install the development version with the code below:

``` r
# install.packages("devtools")
devtools::install_github("RobWiederstein/lasers)
```

## Usage

``` r
library(lasers)
head(lasers) |> tibble::tibble()
#> # A tibble: 6 × 9
#>   date_time           flight_id aircraft altitude airport laser_color injury
#>   <dttm>              <chr>     <fct>       <int> <chr>   <fct>       <chr> 
#> 1 2022-01-01 01:05:00 AAL2305   Other       28000 ZMP     blue        no    
#> 2 2022-01-01 01:09:00 EJA145    Other        2000 PBI     green       no    
#> 3 2022-01-01 01:18:00 DAL1013   A320         1000 LAX     green       no    
#> 4 2022-01-01 01:20:00 CFS7686   Other         700 PDX     multi       no    
#> 5 2022-01-01 01:25:00 N500MH    Other        2000 TOA     green       no    
#> 6 2022-01-01 01:30:00 N3386E    C172          800 MYF     green       no    
#> # … with 2 more variables: city <chr>, state <chr>
```

## Acknowledgements

Many thanks to the following persons, entities and agencies for making
the project possible:

-   The U.S. Federal Aviation Administration

## Code of Conduct

Please note that the lasers project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
