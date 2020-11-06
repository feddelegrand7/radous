
<!-- README.md is generated from README.Rmd. Please edit that file -->

# radous

<!-- badges: start -->

[![R build
status](https://github.com/feddelegrand7/radous/workflows/R-CMD-check/badge.svg)](https://github.com/feddelegrand7/radous/actions)
[![Codecov test
coverage](https://codecov.io/gh/feddelegrand7/radous/branch/master/graph/badge.svg)](https://codecov.io/gh/feddelegrand7/radous?branch=master)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/radous)](https://cran.r-project.org/package=radous)
[![CRAN\_time\_from\_release](https://www.r-pkg.org/badges/ago/radous)](https://cran.r-project.org/package=radous)
[![CRAN\_latest\_release\_date](https://www.r-pkg.org/badges/last-release/radous)](https://cran.r-project.org/package=radous)
[![metacran
downloads](https://cranlogs.r-pkg.org/badges/radous)](https://cran.r-project.org/package=radous)
[![metacran
downloads](https://cranlogs.r-pkg.org/badges/grand-total/radous)](https://cran.r-project.org/package=radous)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://choosealicense.com/licenses/mit/)
[![R
badge](https://img.shields.io/badge/Build%20with-♥%20and%20R-blue)](https://github.com/feddelegrand7/radous)
<!-- badges: end -->

`radous` allows you to generate random user data from the [Random User
Generator API](https://randomuser.me/) which can be useful in many
situations :

  - Teaching;
  - Testing a function;
  - Testing an application (Shiny, Dash or others)

**You can generate up to 5000 observations in one query.**

## Installation

You can install `radous` from CRAN with : 

``` r
install.packages('radous')
```

## Usage

`radous` is extremely simple to use and has one function: `get_data()`.

Suppose we want to generate 10 random user data:

``` r

library(radous)

get_data(n = 10)
# A tibble: 10 x 34
   gender name_title name_first name_last location_street~ location_street~
   <chr>  <chr>      <chr>      <chr>                <dbl> <chr>           
 1 male   Mr         Pierre     Lopez                  590 Rue Abel-Ferry  
 2 male   Mr         Louis      Cole                  1166 King Street     
 3 male   Mr         Rafael     Muñoz                 4773 Avenida de Sala~
 4 male   Mr         Wallace    Stevens               5981 Pockrus Page Rd 
 5 female Miss       Teresa     Moya                  8417 Calle de Toledo 
 6 male   Mr         Oskari     Waisanen              7122 Hatanpään Valta~
 7 female Miss       Alice      Johnson               9217 Oxford Terrace  
 8 male   Mr         Sasha      Bertrand              5260 Rue de L'Abbé-G~
 9 female Miss       Caroline   Russell               3237 Hickory Creek Dr
10 female Miss       Kim        Vargas                6124 Hunters Creek Dr
# ... with 28 more variables: location_city <chr>, location_state <chr>,
#   location_country <chr>, location_postcode <chr>,
#   location_coordinates_latitude <dbl>, location_coordinates_longitude <dbl>,
#   location_timezone_offset <chr>, location_timezone_description <chr>,
#   email <chr>, login_uuid <chr>, login_username <chr>, login_password <chr>,
#   login_salt <chr>, login_md5 <chr>, login_sha1 <chr>, login_sha256 <chr>,
#   dob_date <dttm>, dob_age <dbl>, registered_date <dttm>,
#   registered_age <dbl>, phone <chr>, cell <chr>, id_name <chr>,
#   id_value <chr>, picture_large <chr>, picture_medium <chr>,
#   picture_thumbnail <chr>, nat <chr>
```

If you want to generate always the same set of users, you can use the
`seed` argument:

``` r

get_data(n = 5, seed = "1990")
# A tibble: 5 x 34
  gender name_title name_first name_last location_street~ location_street~
  <chr>  <chr>      <chr>      <chr>                <dbl> <chr>           
1 female Mrs        Bernice    Duncan                9327 N Stelling Rd   
2 female Mrs        Kine       Otnes                 6127 Tjernveien      
3 female Ms         Keira      King                  7676 Mt Wellington H~
4 female Mrs        Amelia     Young                 7477 Simcoe St       
5 male   Mr         Júnio      Santos                4240 Rua Pará        
# ... with 28 more variables: location_city <chr>, location_state <chr>,
#   location_country <chr>, location_postcode <chr>,
#   location_coordinates_latitude <dbl>, location_coordinates_longitude <dbl>,
#   location_timezone_offset <chr>, location_timezone_description <chr>,
#   email <chr>, login_uuid <chr>, login_username <chr>, login_password <chr>,
#   login_salt <chr>, login_md5 <chr>, login_sha1 <chr>, login_sha256 <chr>,
#   dob_date <dttm>, dob_age <dbl>, registered_date <dttm>,
#   registered_age <dbl>, phone <chr>, cell <chr>, id_name <chr>,
#   id_value <chr>, picture_large <chr>, picture_medium <chr>,
#   picture_thumbnail <chr>, nat <chr>
```

Let’s run the above code again to check if we get the same info:

``` r

get_data(n = 5, seed = "1990")
# A tibble: 5 x 34
  gender name_title name_first name_last location_street~ location_street~
  <chr>  <chr>      <chr>      <chr>                <dbl> <chr>           
1 female Mrs        Bernice    Duncan                9327 N Stelling Rd   
2 female Mrs        Kine       Otnes                 6127 Tjernveien      
3 female Ms         Keira      King                  7676 Mt Wellington H~
4 female Mrs        Amelia     Young                 7477 Simcoe St       
5 male   Mr         Júnio      Santos                4240 Rua Pará        
# ... with 28 more variables: location_city <chr>, location_state <chr>,
#   location_country <chr>, location_postcode <chr>,
#   location_coordinates_latitude <dbl>, location_coordinates_longitude <dbl>,
#   location_timezone_offset <chr>, location_timezone_description <chr>,
#   email <chr>, login_uuid <chr>, login_username <chr>, login_password <chr>,
#   login_salt <chr>, login_md5 <chr>, login_sha1 <chr>, login_sha256 <chr>,
#   dob_date <dttm>, dob_age <dbl>, registered_date <dttm>,
#   registered_age <dbl>, phone <chr>, cell <chr>, id_name <chr>,
#   id_value <chr>, picture_large <chr>, picture_medium <chr>,
#   picture_thumbnail <chr>, nat <chr>
```

If you need some user images, it’s easy to get:

``` r

library(dplyr)

random_image <- get_data(n = 1) %>% select(picture_large) %>% pull()

htmltools::img(src = random_image, height = "150px", width = "150px")
```

<!--html_preserve-->

<img src="https://randomuser.me/api/portraits/men/23.jpg" height="150px" width="150px"/><!--/html_preserve-->

## Teaching with `radous` 👨‍🏫

The generated data has 34 variables (columns) with different types of
information that you can play with. The data frame is particularly
suited for teaching the tidyverse, here some examples:

#### Select

<details>

<summary>

> Here we select columns that are related to users’ location:

</summary>

``` r

library(tidyverse)

df <- get_data(n = 500, seed = 123)

df %>% select(contains("location"))
# A tibble: 500 x 10
   location_street~ location_street~ location_city location_state
              <dbl> <chr>            <chr>         <chr>         
 1             9120 Rua Três         Parnaíba      Roraima       
 2             3420 Armagh Street    Taupo         West Coast    
 3             7871 Hämeentie        Tyrnävä       Åland         
 4             9456 Henry Street     Kilkenny      Wexford       
 5             8290 Bulevardi        Tervo         Tavastia Prop~
 6             4794 Rue Bossuet      Lamone        Zug           
 7             1201 Richmond Road    Brighton and~ Buckinghamshi~
 8             2483 Cedar St         Beaumont      British Colum~
 9              659 Vatan Cd         Hakkâri       Elazig        
10             4841 Bagdat Cd        Bursa         Karaman       
# ... with 490 more rows, and 6 more variables: location_country <chr>,
#   location_postcode <chr>, location_coordinates_latitude <dbl>,
#   location_coordinates_longitude <dbl>, location_timezone_offset <chr>,
#   location_timezone_description <chr>
```

</details>

#### Filter

<details>

<summary>

> Getting the users that are US citizens:

</summary>

``` r

df %>% filter(nat == "US")
# A tibble: 25 x 34
   gender name_title name_first name_last location_street~ location_street~
   <chr>  <chr>      <chr>      <chr>                <dbl> <chr>           
 1 female Miss       Bella      Palmer                6951 First Street    
 2 male   Mr         Joseph     Gardner               8106 Eason Rd        
 3 female Mrs        Marlene    James                 4385 Spring St       
 4 male   Mr         Raymond    Day                   6389 Spring Hill Rd  
 5 male   Mr         Lester     Marshall              9574 White Oak Dr    
 6 male   Mr         Wyatt      Stevens               3341 Ash Dr          
 7 female Ms         Linda      James                 4549 Spring St       
 8 female Ms         Darlene    Lee                   4457 Hunters Creek Dr
 9 male   Mr         Nathaniel  Henderson             6333 W Pecan St      
10 male   Mr         Sean       Stephens              3079 Dogwood Ave     
# ... with 15 more rows, and 28 more variables: location_city <chr>,
#   location_state <chr>, location_country <chr>, location_postcode <chr>,
#   location_coordinates_latitude <dbl>, location_coordinates_longitude <dbl>,
#   location_timezone_offset <chr>, location_timezone_description <chr>,
#   email <chr>, login_uuid <chr>, login_username <chr>, login_password <chr>,
#   login_salt <chr>, login_md5 <chr>, login_sha1 <chr>, login_sha256 <chr>,
#   dob_date <dttm>, dob_age <dbl>, registered_date <dttm>,
#   registered_age <dbl>, phone <chr>, cell <chr>, id_name <chr>,
#   id_value <chr>, picture_large <chr>, picture_medium <chr>,
#   picture_thumbnail <chr>, nat <chr>
```

</details>

#### relocate

<details>

<summary>

> Relocating the last column `nat` to the beginning:

</summary>

``` r

df %>% relocate(nat, before = gender)
# A tibble: 500 x 34
   nat   gender name_title name_first name_last location_street~
   <chr> <chr>  <chr>      <chr>      <chr>                <dbl>
 1 BR    male   Mr         Heldo      Campos                9120
 2 NZ    female Mrs        Peyton     Jackson               3420
 3 FI    female Ms         Viivi      Ruona                 7871
 4 IE    female Mrs        Kaitlin    Steward               9456
 5 FI    female Miss       Linnea     Pulkkinen             8290
 6 CH    female Madame     Valentine  Le Gall               4794
 7 GB    female Mrs        Suzanna    Miller                1201
 8 CA    male   Mr         Antoine    Thompson              2483
 9 TR    female Miss       Latife     Kurutluo~              659
10 TR    male   Mr         Vedat      Aydan                 4841
# ... with 490 more rows, and 28 more variables: location_street_name <chr>,
#   location_city <chr>, location_state <chr>, location_country <chr>,
#   location_postcode <chr>, location_coordinates_latitude <dbl>,
#   location_coordinates_longitude <dbl>, location_timezone_offset <chr>,
#   location_timezone_description <chr>, email <chr>, login_uuid <chr>,
#   login_username <chr>, login_password <chr>, login_salt <chr>,
#   login_md5 <chr>, login_sha1 <chr>, login_sha256 <chr>, dob_date <dttm>,
#   dob_age <dbl>, registered_date <dttm>, registered_age <dbl>, phone <chr>,
#   cell <chr>, id_name <chr>, id_value <chr>, picture_large <chr>,
#   picture_medium <chr>, picture_thumbnail <chr>
```

</details>

#### group\_by & summarise

<details>

<summary>

> Calculating median age by gender:

</summary>

``` r

df %>% group_by(gender) %>% 
  summarise(median_age = median(dob_age))
`summarise()` ungrouping output (override with `.groups` argument)
# A tibble: 2 x 2
  gender median_age
  <chr>       <dbl>
1 female       51.5
2 male         49  
```

</details>

#### count, arrange & desc

<details>

<summary>

> Getting the number of users per country of residence:
> 
> </summary>

``` r
df %>% 
  count(location_country) %>% 
  arrange(desc(n))
# A tibble: 17 x 2
   location_country     n
   <chr>            <int>
 1 Ireland             36
 2 Turkey              36
 3 Spain               35
 4 Canada              34
 5 France              33
 6 Australia           32
 7 Finland             32
 8 Iran                32
 9 New Zealand         30
10 Norway              30
11 Germany             29
12 United Kingdom      26
13 United States       25
14 Netherlands         24
15 Switzerland         24
16 Brazil              22
17 Denmark             20
```

</details>

#### filter & str\_detect

<details>

<summary>

> Filtering out the users that have a cell number that begins with 081:

</summary>

``` r
df %>% select(1:3, cell) %>% 
  filter(str_detect(cell, "081"))
# A tibble: 36 x 4
   gender name_title name_first cell        
   <chr>  <chr>      <chr>      <chr>       
 1 female Mrs        Kaitlin    081-087-1612
 2 male   Mr         Jason      081-584-4669
 3 male   Mr         Arnold     081-470-7126
 4 male   Mr         Brent      081-614-3193
 5 female Mrs        Fiona      081-779-4190
 6 female Mrs        Megan      081-511-0321
 7 female Ms         Izzie      081-850-4070
 8 male   Mr         Leslie     081-172-5148
 9 male   Mr         Edgar      081-206-3946
10 female Ms         Deborah    081-984-3691
# ... with 26 more rows
```

## Code of Conduct

Please note that the radous project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
