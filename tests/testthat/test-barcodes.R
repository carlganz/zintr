context("Test that barcodes are printed")

if (requireNamespace("png", quietly = TRUE)) {

# example

numbers <- png::readPNG(system.file(package = "zintr", "examples", "barcode1.png"))

letters <- png::readPNG(system.file(package = "zintr", "examples", "barcode2.png"))

test_that("barcode_print does not error", {
  testthat::expect_silent(barcode_print(8675309, "out1.png"))
  testthat::expect_silent(barcode_print("Hello World", "out2.png"))
})

new_numbers <- png::readPNG("out1.png")

new_letters <- png::readPNG("out2.png")

test_that("dimensions are the same", {
  expect_true(all(dim(numbers) == dim(new_numbers)))
  expect_true(all(dim(letters) == dim(new_letters)))
})

test_that("RGB are the same", {
  expect_true(all(numbers == new_numbers))
  expect_true(all(letters == new_letters))
})

file.remove("out1.png", "out2.png")

}