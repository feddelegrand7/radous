#' Query random user data from the Random User Generator API
#'
#' @param n Number of users to fetch, up to 5,000 generated users in one request. Defaults to 1
#' @param seed A character string used to generate the same set of users. Defaults to NULL.
#'
#' @return A tibble that contains random user data
#' @export
#'
#' @examples
#'
#' get_data(n = 10, seed = "1990")
#'

get_data <- function(n = 1, seed = NULL) {


checkmate::assert_number(n,
                         na.ok = FALSE,
                         lower = 0,
                         upper = 5000,
                         finite = TRUE)

checkmate::assert_character(seed, null.ok = TRUE)

link <- ifelse(is.null(seed),

glue::glue("https://randomuser.me/api/?results={n}&format=csv"),

glue::glue("https://randomuser.me/api/?seed={seed}&results={n}&format=csv")

)

tryCatch(

  expr = {

    data <- httr::RETRY(
      "GET",
      link,
      times = 3)


    text <- httr::content(data, as = "text")

    data <- readr::read_csv(text)

    data <- janitor::clean_names(data)

    return(data)


  },

  error = function(cond){


    message(paste0("Error: ", cond))

    return(NA)

  }


)




}
