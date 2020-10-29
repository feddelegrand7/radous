
<!-- README.md is generated from README.Rmd. Please edit that file -->

# radous

<!-- badges: start -->

<!-- badges: end -->

`radous` allows you to generate random user data from the [Random User
Generator API](https://randomuser.me/) which can be useful in many
situations :

  - Teaching;
  - Testing a function;
  - Testing an application (Shiny, Dash or others)

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
#>  1 male   Mr         Alexander  Jones                 5199 Riccarton Road  
#>  2 male   Mr         Ben        Gustafss~             3337 Borger Withs ga~
#>  3 male   Mr         Nikolai    Romundst~             2697 Sverre Iversens~
#>  4 female Mrs        Samantha   Wilson                6208 Weymouth Road   
#>  5 female Mrs        Sam        Kelley                4978 Main Street     
#>  6 female Ms         Kristen    Wade                  9714 Hamilton Ave    
#>  7 female Mrs        Clarisse   Laurent               4706 Esplanade du 9 ~
#>  8 female Mrs        Alexia     Duval                 9299 Avenue Joliot C~
#>  9 female Mrs        Stacy      Hernandez             7248 Groveland Terra~
#> 10 male   Mr         Phillip    Harrison              2362 Mockingbird Ln  
#> # ... with 28 more variables: location.city <chr>, location.state <chr>,
#> #   location.country <chr>, location.postcode <dbl>,
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

random_image <- get_data(n = 1) %>% select(picture.large) %>% pull()

htmltools::img(src = random_image, height = "150px", width = "150px")
```

<!--html_preserve-->

<img src="https://randomuser.me/api/portraits/women/31.jpg" height="150px" width="150px"/><!--/html_preserve-->

## Code of Conduct

Please note that the radous project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
