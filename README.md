
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
#>    gender name_title name_first name_last location_street~ location_street~
#>    <chr>  <chr>      <chr>      <chr>                <dbl> <chr>           
#>  1 male   Mr         Tony       Gutierrez             2207 Preston Rd      
#>  2 female Mrs        Gül        Karaböcek             4812 Necatibey Cd    
#>  3 male   Mr         Emil       Petersen              9711 Kildegårdsvej   
#>  4 male   Mr         Darryl     Russell               7752 Plum St         
#>  5 male   Mr         Diethelm   Merk                  3741 Lindenweg       
#>  6 female Miss       Kamila     Lian                  1226 Jorines vei     
#>  7 male   Mr         Ceyhun     Süleyman~             2644 Necatibey Cd    
#>  8 female Mrs        Margaret   Höfler                3777 Kirchweg        
#>  9 male   Mr         Arturo     Gallego               5652 Calle de La Alm~
#> 10 male   Mr         Ricardo    Cano                  9684 Avenida de Sala~
#> # ... with 28 more variables: location_city <chr>, location_state <chr>,
#> #   location_country <chr>, location_postcode <dbl>,
#> #   location_coordinates_latitude <dbl>, location_coordinates_longitude <dbl>,
#> #   location_timezone_offset <chr>, location_timezone_description <chr>,
#> #   email <chr>, login_uuid <chr>, login_username <chr>, login_password <chr>,
#> #   login_salt <chr>, login_md5 <chr>, login_sha1 <chr>, login_sha256 <chr>,
#> #   dob_date <dttm>, dob_age <dbl>, registered_date <dttm>,
#> #   registered_age <dbl>, phone <chr>, cell <chr>, id_name <chr>,
#> #   id_value <chr>, picture_large <chr>, picture_medium <chr>,
#> #   picture_thumbnail <chr>, nat <chr>
```

If you want to generate always the same set of users, you can use the
`seed` argument:

``` r

get_data(n = 5, seed = "1990")
#> # A tibble: 5 x 34
#>   gender name_title name_first name_last location_street~ location_street~
#>   <chr>  <chr>      <chr>      <chr>                <dbl> <chr>           
#> 1 female Mrs        Bernice    Duncan                9327 N Stelling Rd   
#> 2 female Mrs        Kine       Otnes                 6127 Tjernveien      
#> 3 female Ms         Keira      King                  7676 Mt Wellington H~
#> 4 female Mrs        Amelia     Young                 7477 Simcoe St       
#> 5 male   Mr         Júnio      Santos                4240 Rua Pará        
#> # ... with 28 more variables: location_city <chr>, location_state <chr>,
#> #   location_country <chr>, location_postcode <chr>,
#> #   location_coordinates_latitude <dbl>, location_coordinates_longitude <dbl>,
#> #   location_timezone_offset <chr>, location_timezone_description <chr>,
#> #   email <chr>, login_uuid <chr>, login_username <chr>, login_password <chr>,
#> #   login_salt <chr>, login_md5 <chr>, login_sha1 <chr>, login_sha256 <chr>,
#> #   dob_date <dttm>, dob_age <dbl>, registered_date <dttm>,
#> #   registered_age <dbl>, phone <chr>, cell <chr>, id_name <chr>,
#> #   id_value <chr>, picture_large <chr>, picture_medium <chr>,
#> #   picture_thumbnail <chr>, nat <chr>
```

Let’s run the above code again to check if we get the same info:

``` r

get_data(n = 5, seed = "1990")
#> # A tibble: 5 x 34
#>   gender name_title name_first name_last location_street~ location_street~
#>   <chr>  <chr>      <chr>      <chr>                <dbl> <chr>           
#> 1 female Mrs        Bernice    Duncan                9327 N Stelling Rd   
#> 2 female Mrs        Kine       Otnes                 6127 Tjernveien      
#> 3 female Ms         Keira      King                  7676 Mt Wellington H~
#> 4 female Mrs        Amelia     Young                 7477 Simcoe St       
#> 5 male   Mr         Júnio      Santos                4240 Rua Pará        
#> # ... with 28 more variables: location_city <chr>, location_state <chr>,
#> #   location_country <chr>, location_postcode <chr>,
#> #   location_coordinates_latitude <dbl>, location_coordinates_longitude <dbl>,
#> #   location_timezone_offset <chr>, location_timezone_description <chr>,
#> #   email <chr>, login_uuid <chr>, login_username <chr>, login_password <chr>,
#> #   login_salt <chr>, login_md5 <chr>, login_sha1 <chr>, login_sha256 <chr>,
#> #   dob_date <dttm>, dob_age <dbl>, registered_date <dttm>,
#> #   registered_age <dbl>, phone <chr>, cell <chr>, id_name <chr>,
#> #   id_value <chr>, picture_large <chr>, picture_medium <chr>,
#> #   picture_thumbnail <chr>, nat <chr>
```

If you need some user images, it’s easy to get:

``` r

library(dplyr)

random_image <- get_data(n = 1) %>% select(picture_large) %>% pull()

htmltools::img(src = random_image, height = "150px", width = "150px")
```

<!--html_preserve-->

<img src="https://randomuser.me/api/portraits/men/9.jpg" height="150px" width="150px"/><!--/html_preserve-->

## Code of Conduct

Please note that the radous project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
