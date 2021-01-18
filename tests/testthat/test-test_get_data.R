

data <- httr::RETRY(
  "GET",
  "https://randomuser.me/api/?seed=123&results=100&format=csv",
  times = 3)


text <- httr::content(data, as = "text")

data <- readr::read_csv(text)

final <- janitor::clean_names(data)


test_that("testing identical results", {


  testthat::expect_s3_class(get_data(n = 10), "data.frame")

  testthat::expect_equal(ncol(final), ncol(get_data(n = 10, seed = "123")))


})
