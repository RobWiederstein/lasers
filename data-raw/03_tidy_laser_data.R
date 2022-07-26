# Clean ----
rm(list = ls())
file <- "./data-raw/faa_laser_2010-2021.csv"
df <- readr::read_csv(file = file)
library(dplyr)
library(tidyr)
library(lubridate)
library(stringr)
library(forcats)
library(outliers)
# incident_date -- ok
df_1 <-
    df |>
    tidyr::separate(
        incident_date,
        into = c("year", "month", "day"),
        sep = c("-")
    ) |>
    # limit to acceptable answers - lost 0!
    filter(year %in% paste0(2010:2022)) |>
    filter(month %in% stringr::str_pad(
        1:12,
        side = "left",
        width = 2,
        pad = "0"
    )) |>
    filter(day %in% stringr::str_pad(
        1:31,
        side = "left",
        width = 2,
        pad = "0"
    ))

# 2 incident_time
df_2 <-
    df_1 |>
    mutate(incident_time = stringr::str_pad(
        incident_time,
        side = "left",
        pad = "0",
        width = 4
    )) |>
    # lose one ".05375"
    mutate(incident_time = replace(
        incident_time,
        nchar(incident_time) != 4,
        NA
    )) |>
    tidyr::separate(
        incident_time,
        into = c("hour", "min"),
        sep = 2
    ) |>
    # lost 3 on hour
    filter(hour %in% stringr::str_pad(
        0:24,
        width = 2,
        side = "left",
        pad = "0"
    )) |>
    # lost 0
    filter(min %in% stringr::str_pad(
        0:60,
        width = 2,
        side = "left",
        pad = "0"
    ))
# create date time
df_3 <-
    df_2 |>
    mutate(
        date_time = lubridate::make_datetime(
            year,
            month,
            day,
            hour,
            min
        ),
        .keep = "unused",
        .before = flight_id
    )
# aircraft convert to factor
df_4 <-
    df_3 |>
    mutate(aircraft = forcats::fct_lump_n(
        aircraft,
        9
    ))
# altitude - 1455 NAs
df_5 <-
    df_4 |>
    mutate(altitude = as.integer(altitude)) |>
    # altitude 1.3 million?
    filter(!altitude %in% c(outliers::outlier(altitude)))
# laser color
df_6 <-
    df_5 |>
    mutate(across(laser_color, ~ tolower(.x))) |>
    mutate(laser_color = replace(
        laser_color,
        laser_color == "unkn",
        NA
    )) |>
    mutate(laser_color = replace(
        laser_color,
        laser_color == "unk",
        NA
    )) |>
    mutate(laser_color = forcats::fct_lump_n(
        f = laser_color,
        n = 5,
        other_level = "multi"
    ))

# injury
df_7 <-
    df_6 |>
    mutate(across(injury, ~ tolower(.x))) |>
    mutate(injury = case_when(
        injury == "no*" ~ "no",
        injury == "*no" ~ "no",
        injury == "unk" ~ NA_character_,
        injury == "green" ~ NA_character_,
        injury == "mp" ~ NA_character_,
        injury == "unkn" ~ NA_character_,
        TRUE ~ as.character(injury)
    ))
# state name - omit islands and territories
df_8 <-
    df_7 |>
    filter(state %in% state.name)
# omit nas
df_9 <-
    df_8 |>
    na.omit()
lasers <- df_9
#save
usethis::use_data(lasers, overwrite = TRUE)
