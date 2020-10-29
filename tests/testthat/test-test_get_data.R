
data <- httr::GET("https://randomuser.me/api/?seed=123&results=10&format=csv")

text <- httr::content(data, as = "text")

final <- readr::read_csv(text)



test_that("testing identical results", {

  testthat::expect_identical(final,get_data(n = 10, seed = "123"))

  testthat::expect_s3_class(get_data(n = 10), "data.frame")

  testthat::expect_equal(ncol(final), ncol(get_data(n = 10, seed = "123")))


})
