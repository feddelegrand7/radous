
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
#>  1 female Miss       Afsar      Akgül                 3553 Sehitler Cd     
#>  2 male   Mr         Soan       Dumas                 5985 Grande Rue      
#>  3 male   Mr         Iker       Rubio                 5160 Paseo de Zorril~
#>  4 female Miss       Ida        Christia~              633 Marsvej         
#>  5 male   Mr         Kadir      Ekici                 7257 Abanoz Sk       
#>  6 male   Mr         Edward     Anderson              6438 Te Atatu Road   
#>  7 male   Mr         Lino       Vidal                  832 Rue Duquesne    
#>  8 male   Monsieur   Muhamed    Moreau                4439 Rue Abel        
#>  9 male   Mr         Tim        Caron                 9924 Rue Pasteur     
#> 10 female Ms         Nina       Burke                 4505 Rolling Green Rd
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

<img src="https://randomuser.me/api/portraits/women/48.jpg" height="150px" width="150px"/><!--/html_preserve-->

## Code of Conduct

Please note that the radous project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
