#mtcars data processing
library(tidyverse)
library(here)

data(mtcars)
mtcars <-
  tibble::rownames_to_column(mtcars, var = "id") %>%
  tibble::as_tibble() %>%
  tidyr::separate(id, into = c("make", "model"), sep = " ", remove = FALSE, extra = "merge")

usethis::use_data(mtcars, overwrite = TRUE, compress = 'xz')

saveRDS(mtcars, file = here::here("data", "mtcars.Rds"))
