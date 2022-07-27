test_that("lasers have 9 variables", {
  expect_equal(ncol(lasers), 9)
})
test_that("lasers have no missing values", {
    expect_true(all(is.na(lasers)) == F)
})
test_that("lasers have more than 63036 obs", {
    expect_gte(nrow(lasers), 63036)
})
