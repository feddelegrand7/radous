

get_data <- function(n = 1, seed = NULL) {


link <- ifelse(is.null(seed), 

glue::glue("https://randomuser.me/api/?results={n}&format=csv"), 

glue::glue("https://randomuser.me/api/?seed={seed}&results={n}&format=csv")

)


data <- httr::GET(link)

text <- httr::content(data, as = "text")

return(readr::read_csv(text))

}