
<!-- README.md is generated from README.Rmd. Please edit that file -->

# radous

<!-- badges: start -->

<!-- badges: end -->

`radous` allows you to generate random user data from the [Random User
Generator API](https://randomuser.me/)

## Installation

You can install the development version of `radous` from
[GitHub](https://github.com/) with:

``` r

#install.packages("remotes") ---- If not installed

remotes::install_github("feddelegrand7/radous")
```

## Usage

`radous` is extremely simple to use and has one function: `get_data()`.

Suppose we want to generate 10 random user data:

``` r

library(radous)

get_data(n = 10)
#> # A tibble: 10 x 34
#>    gender name.title name.first name.last location.street~ location.street~
#>    <chr>  <chr>      <chr>      <chr>                <dbl> <chr>           
#>  1 female Mrs        Alice      Claire                2051 Alfred St       
#>  2 male   Mr         Filip      Brøndbo               2394 Damstredet      
#>  3 female Mrs        Olivia     Wood                    40 Grey Street     
#>  4 female Miss       Alix       Faure                 5122 Avenue du Châte~
#>  5 male   Mr         Durk       Ijzermans              847 Jan van Goijenl~
#>  6 female Madame     Nancy      Lefevre               7266 Rue Laure-Diebo~
#>  7 female Ms         Letitia    Nguyen                 108 Homestead Rd    
#>  8 female Ms         Eda        Van den ~             5061 Judith Leysters~
#>  9 female Mrs        Tracey     Murphy                8015 E North St      
#> 10 male   Mr         Danny      Griffin                746 The Grove       
#> # ... with 28 more variables: location.city <chr>, location.state <chr>,
#> #   location.country <chr>, location.postcode <chr>,
#> #   location.coordinates.latitude <dbl>, location.coordinates.longitude <dbl>,
#> #   location.timezone.offset <chr>, location.timezone.description <chr>,
#> #   email <chr>, login.uuid <chr>, login.username <chr>, login.password <chr>,
#> #   login.salt <chr>, login.md5 <chr>, login.sha1 <chr>, login.sha256 <chr>,
#> #   dob.date <dttm>, dob.age <dbl>, registered.date <dttm>,
#> #   registered.age <dbl>, phone <chr>, cell <chr>, id.name <chr>,
#> #   id.value <chr>, picture.large <chr>, picture.medium <chr>,
#> #   picture.thumbnail <chr>, nat <chr>
```

If you want to generate always the same set of users, you can use the
`seed` argument:

``` r

get_data(n = 5, seed = "1990")
#> # A tibble: 5 x 34
#>   gender name.title name.first name.last location.street~ location.street~
#>   <chr>  <chr>      <chr>      <chr>                <dbl> <chr>           
#> 1 female Mrs        Bernice    Duncan                9327 N Stelling Rd   
#> 2 female Mrs        Kine       Otnes                 6127 Tjernveien      
#> 3 female Ms         Keira      King                  7676 Mt Wellington H~
#> 4 female Mrs        Amelia     Young                 7477 Simcoe St       
#> 5 male   Mr         Júnio      Santos                4240 Rua Pará        
#> # ... with 28 more variables: location.city <chr>, location.state <chr>,
#> #   location.country <chr>, location.postcode <chr>,
#> #   location.coordinates.latitude <dbl>, location.coordinates.longitude <dbl>,
#> #   location.timezone.offset <chr>, location.timezone.description <chr>,
#> #   email <chr>, login.uuid <chr>, login.username <chr>, login.password <chr>,
#> #   login.salt <chr>, login.md5 <chr>, login.sha1 <chr>, login.sha256 <chr>,
#> #   dob.date <dttm>, dob.age <dbl>, registered.date <dttm>,
#> #   registered.age <dbl>, phone <chr>, cell <chr>, id.name <chr>,
#> #   id.value <chr>, picture.large <chr>, picture.medium <chr>,
#> #   picture.thumbnail <chr>, nat <chr>
```

Let’s run the above code again to check if we get the same info:

``` r

get_data(n = 5, seed = "1990")
#> # A tibble: 5 x 34
#>   gender name.title name.first name.last location.street~ location.street~
#>   <chr>  <chr>      <chr>      <chr>                <dbl> <chr>           
#> 1 female Mrs        Bernice    Duncan                9327 N Stelling Rd   
#> 2 female Mrs        Kine       Otnes                 6127 Tjernveien      
#> 3 female Ms         Keira      King                  7676 Mt Wellington H~
#> 4 female Mrs        Amelia     Young                 7477 Simcoe St       
#> 5 male   Mr         Júnio      Santos                4240 Rua Pará        
#> # ... with 28 more variables: location.city <chr>, location.state <chr>,
#> #   location.country <chr>, location.postcode <chr>,
#> #   location.coordinates.latitude <dbl>, location.coordinates.longitude <dbl>,
#> #   location.timezone.offset <chr>, location.timezone.description <chr>,
#> #   email <chr>, login.uuid <chr>, login.username <chr>, login.password <chr>,
#> #   login.salt <chr>, login.md5 <chr>, login.sha1 <chr>, login.sha256 <chr>,
#> #   dob.date <dttm>, dob.age <dbl>, registered.date <dttm>,
#> #   registered.age <dbl>, phone <chr>, cell <chr>, id.name <chr>,
#> #   id.value <chr>, picture.large <chr>, picture.medium <chr>,
#> #   picture.thumbnail <chr>, nat <chr>
```

If you need some user images, it’s easy to get:

``` r

library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

random_image <- get_data(n = 5) %>% select(picture.medium) %>% pull()

knitr::include_graphics(random_image)
```

<img src="https://randomuser.me/api/portraits/med/men/79.jpg" width="50%" height="50%" /><img src="https://randomuser.me/api/portraits/med/men/74.jpg" width="50%" height="50%" /><img src="https://randomuser.me/api/portraits/med/women/19.jpg" width="50%" height="50%" /><img src="https://randomuser.me/api/portraits/med/women/82.jpg" width="50%" height="50%" /><img src="https://randomuser.me/api/portraits/med/women/10.jpg" width="50%" height="50%" />

## Code of Conduct

Please note that the radous project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
