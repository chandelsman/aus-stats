

library(tidyverse)
library(lubridate)

# Import raw data
aus_raw <-
  readxl::read_excel(here::here("data", "AUS 1st Quarter 2021.xlsx")) %>%
  mutate(
    `Original Complete Date` = date(mdy_hm(`Original Complete Date`)),
    aus_cyto = case_when(str_detect(
      `Cyto Screen`,
      regex("atypia of undetermined significance|aus", ignore_case = TRUE)
    ) ~ "AUS",
    TRUE ~ "No_AUS"),
    aus_path = case_when(
      str_detect(
        `Pathologist Diagnosis`,
        regex("atypia of undetermined significance",
              ignore_case = TRUE)
      ) ~ "AUS",
      str_detect(
        `Pathologist Diagnosis`,
        regex("atypia of undetermine significance",
              ignore_case = TRUE)
      ) ~ "AUS",
      str_detect(
        `Pathologist Diagnosis`,
        regex("atypia of uncertain significance",
              ignore_case = TRUE)
      ) ~ "AUS",
      str_detect(
        `Pathologist Diagnosis`,
        regex("atypia of unknown significance",
              ignore_case = TRUE)
      ) ~ "AUS",
      str_detect(
        `Pathologist Diagnosis`,
        regex(
          "focal atypical follicular cells of undetermined significance",
          ignore_case = TRUE
        )
      ) ~ "AUS",
      str_detect(
        `Pathologist Diagnosis`,
        regex(
          "focal atypical cells of undetermined significance",
          ignore_case = TRUE
        )
      ) ~ "AUS",
      str_detect(
        `Pathologist Diagnosis`,
        regex(
          "atypical follicular cells of undetermined significance",
          ignore_case = TRUE
        )
      ) ~ "AUS",
      TRUE ~ "No_AUS"
    )
  )

aus_raw %>%
  group_by(Cytotech) %>% 
  summarise(
    n = n(),
    aus_cyto = sum(aus_cyto == "AUS"),
    pct_cyto = aus_cyto / n,

  )

aus_raw %>%
  group_by(Pathologist) %>% 
  summarise(
    n = n(),
    aus_path = sum(aus_path == "AUS"),
    pct_path = aus_path / n
  )

# aus_raw <-
#   list.files(
#     path = here::here("data"),
#     pattern = "^\\d{4}q\\d-aus\\.xls",
#     full.names = TRUE
#   ) %>%
#   sapply(readxl::read_excel, simplify = FALSE) %>%
#   bind_rows() %>% 
#   mutate(
#     Released_Time = lubridate::mdy(Released_Time), 
#     Original_Complete_Date = lubridate::mdy_hm(Original_Complete_Date)
#   )
