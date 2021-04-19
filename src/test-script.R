

library(tidyverse)

# Import raw data

aus_raw <-
  list.files(
    path = here::here("data"),
    pattern = "^\\d{4}q\\d-aus\\.xls",
    full.names = TRUE
  ) %>%
  sapply(readxl::read_excel, simplify = FALSE) %>%
  bind_rows() %>% 
  mutate(
    Released_Date = lubridate::mdy(Released_Time), 
    Original_Complete_Date = lubridate::mdy_hm(Original_Complete_Date)
  )
