# Download ----
obtain_faa_laser_2022 <- function() {
    file <- "https://www.faa.gov/sites/faa.gov/files/2022-06/Laser-Report-2022-through-05-31.xlsx"
    sheet <- "Incidents"
    faa_laser_2022 <- tibble::as_tibble(
        rio::import(
            file = file,
            sheet = sheet,
            range = cellranger::cell_limits(c(1, 1), c(NA, NA)),
            .name_repair = ~ janitor::make_clean_names(.x),
            setclass = "tibble",
            na = c("", "UNKN")
        )
    )
    print("2022 FAA laser data downloaded . . . ")
    faa_laser_2022
}
obtain_faa_laser_2021 <- function() {
    file <- "https://www.faa.gov/sites/faa.gov/files/2022-02/Laser-Report-2021-FINAL.xlsx"
    sheet <- "2021 Lasers to DATE"
    faa_laser_2021 <-
        rio::import(
            file = file,
            sheet = sheet,
            range = cellranger::cell_limits(c(2, 1), c(NA, NA)),
            .name_repair = ~ janitor::make_clean_names(.x),
            setclass = "tibble",
            na = c("", "UNKN")
        )
    print("2021 FAA laser data downloaded . . . ")
    faa_laser_2021
}
obtain_faa_laser_2020 <- function() {
    file <- "https://www.faa.gov/sites/faa.gov/files/about/initiatives/lasers/laws/Laser_Report_2020.xlsx"
    sheet <- "Laser Report 2020"
    faa_laser_2020 <-
        rio::import(
            file = file,
            sheet = sheet,
            range = cellranger::cell_limits(c(1, 1), c(NA, NA)),
            .name_repair = ~ janitor::make_clean_names(.x),
            na = "Unknown",
            setclass = "tibble",
            na = c("", "UNKN")
        )
    print("2020 FAA laser data downloaded . . . ")
    faa_laser_2020
}
obtain_faa_laser_2019 <- function() {
    file <- "https://www.faa.gov/sites/faa.gov/files/about/initiatives/lasers/laws/Laser_Report_2019_final.xlsx"
    sheet <- "Laser Report 2019"
    faa_laser_2019 <-
        rio::import(
            file = file,
            sheet = sheet,
            range = cellranger::cell_limits(c(1, 1), c(NA, NA)),
            .name_repair = ~ janitor::make_clean_names(.x),
            setclass = "tibble",
            na = c("", "UNKN")
        )
    print("2019 FAA laser data downloaded . . . ")
    faa_laser_2019
}
obtain_faa_laser_2018 <- function() {
    file <- "https://www.faa.gov/sites/faa.gov/files/about/initiatives/lasers/laws/Laser_Report_2018_final.xlsx"
    sheet <- "Laser Report 2018"
    faa_laser_2018 <-
        rio::import(
            file = file,
            sheet = sheet,
            range = cellranger::cell_limits(c(1, 1), c(NA, NA)),
            .name_repair = ~ janitor::make_clean_names(.x),
            setclass = "tibble",
            na = c("", "UNKN")
        )
    faa_laser_2018 <- faa_laser_2018[-3389, ]
    print("2018 FAA laser data downloaded . . . ")
    faa_laser_2018
}
obtain_faa_laser_2017 <- function() {
    file <- "https://www.faa.gov/sites/faa.gov/files/about/initiatives/lasers/laws/reported_laser_illumination_incidents_CY_2017.xlsx"
    sheet <- "Laser Report 2017"
    faa_laser_2017 <-
        rio::import(
            file = file,
            sheet = sheet,
            range = cellranger::cell_limits(c(1, 1), c(NA, NA)),
            .name_repair = ~ janitor::make_clean_names(.x),
            setclass = "tibble",
            na = c("", "UNKN")
        )
    print("2017 FAA laser data downloaded . . . ")
    faa_laser_2017
}
obtain_faa_laser_2016 <- function() {
    file <- "https://www.faa.gov/sites/faa.gov/files/about/initiatives/lasers/laws/reported_laser_illumination_incidents_CY_2016.xlsx"
    sheet <- "2016 Laser Report"
    faa_laser_2016 <-
        rio::import(
            file = file,
            sheet = sheet,
            range = cellranger::cell_limits(c(1, 1), c(NA, NA)),
            .name_repair = ~ janitor::make_clean_names(.x),
            setclass = "tibble",
            na = c("", "UNKN")
        )
    faa_laser_2016 <- dplyr::select(faa_laser_2016, -aviation_altitude)
    print("2016 FAA laser data downloaded . . . ")
    faa_laser_2016
}
obtain_faa_laser_2015 <- function() {
    file <- "https://www.faa.gov/sites/faa.gov/files/about/initiatives/lasers/laws/reported_laser_illumination_incidents_CY_2015.xls"
    sheet <- "Sheet1"
    faa_laser_2015 <-
        rio::import(
            file = file,
            sheet = sheet,
            range = cellranger::cell_limits(c(1, 1), c(NA, 10)),
            .name_repair = ~ janitor::make_clean_names(.x),
            setclass = "tibble",
            na = c("", "UNKN")
        )
    print("2015 FAA laser data downloaded . . . ")
    faa_laser_2015
}
obtain_faa_laser_2014 <- function() {
    file <- "https://www.faa.gov/sites/faa.gov/files/about/initiatives/lasers/laws/laser_incidents_2010-2014.xls"
    sheet <- "Laser Report 2014"
    faa_laser_2014_raw <-
        rio::import(
            file = file,
            sheet = sheet,
            range = cellranger::cell_limits(c(1, 1), c(NA, NA)),
            .name_repair = ~ janitor::make_clean_names(.x),
            setclass = "tibble",
            na = c("", "UNKN")
        )
    faa_laser_2014 <-
        faa_laser_2014_raw |>
        dplyr::select(-no_a_c) |>
        dplyr::rename(
            incident_date = date,
            incident_time = time_utc,
            flight_id = aircraft_id,
            aircraft = type_a_c,
            altitude = alt,
            airport = major_city,
            laser_color = color,
            injury = injury_reported,
            city = city,
            state = state
        )
    print("2014 FAA laser data downloaded . . . ")
    faa_laser_2014
}
obtain_faa_laser_2013 <- function() {
    file <- "https://www.faa.gov/sites/faa.gov/files/about/initiatives/lasers/laws/laser_incidents_2010-2014.xls"
    sheet <- "Laser Report 2013"
    faa_laser_2013_raw <-
        rio::import(
            file = file,
            sheet = sheet,
            range = cellranger::cell_limits(c(1, 1), c(NA, NA)),
            .name_repair = ~ janitor::make_clean_names(.x),
            setclass = "tibble",
            na = c("", "UNKN")
        )
    faa_laser_2013 <-
        faa_laser_2013_raw |>
        dplyr::select(-no_a_c) |>
        dplyr::rename(
            incident_date = date,
            incident_time = time_utc,
            flight_id = aircraft_id,
            aircraft = type_a_c,
            altitude = alt,
            airport = major_city,
            laser_color = color,
            injury = injury_reported,
            city = city,
            state = state
        )
    print("2013 FAA laser data downloaded . . . ")
    faa_laser_2013
}
obtain_faa_laser_2012 <- function() {
    file <- "https://www.faa.gov/sites/faa.gov/files/about/initiatives/lasers/laws/laser_incidents_2010-2014.xls"
    sheet <- "Laser Report 2012"
    faa_laser_2012_raw <-
        rio::import(
            file = file,
            sheet = sheet,
            range = cellranger::cell_limits(c(1, 1), c(NA, NA)),
            .name_repair = ~ janitor::make_clean_names(.x),
            setclass = "tibble",
            na = c("", "UNKN")
        )
    faa_laser_2012 <-
        faa_laser_2012_raw |>
        dplyr::select(-no_a_c) |>
        dplyr::rename(
            incident_date = date,
            incident_time = time_utc,
            flight_id = aircraft_id,
            aircraft = type_a_c,
            altitude = alt,
            airport = major_city,
            laser_color = color,
            injury = injury_reported,
            city = city,
            state = state
        )
    print("2012 FAA laser data downloaded . . . ")
    faa_laser_2012
}
obtain_faa_laser_2011 <- function() {
    file <- "https://www.faa.gov/sites/faa.gov/files/about/initiatives/lasers/laws/laser_incidents_2010-2014.xls"
    sheet <- "Laser Report 2011"
    faa_laser_2011_raw <-
        rio::import(
            file = file,
            sheet = sheet,
            range = cellranger::cell_limits(c(1, 1), c(NA, NA)),
            .name_repair = ~ janitor::make_clean_names(.x),
            setclass = "tibble",
            na = c("", "UNKN")
        )
    faa_laser_2011 <-
        faa_laser_2011_raw |>
        dplyr::select(-no_a_c) |>
        dplyr::rename(
            incident_date = date,
            incident_time = time_utc,
            flight_id = ac_id,
            aircraft = type_a_c,
            altitude = alt,
            airport = major_city,
            laser_color = color,
            injury = injury_reported,
            city = city,
            state = state
        )
    print("2011 FAA laser data downloaded . . . ")
    faa_laser_2011
}
obtain_faa_laser_2010 <- function() {
    file <- "https://www.faa.gov/sites/faa.gov/files/about/initiatives/lasers/laws/laser_incidents_2010-2014.xls"
    sheet <- "Laser Report 2010"
    faa_laser_2010_raw <-
        rio::import(
            file = file,
            sheet = sheet,
            range = cellranger::cell_limits(c(1, 1), c(NA, NA)),
            .name_repair = ~ janitor::make_clean_names(.x),
            setclass = "tibble",
            na = c("", "UNKN")
        )
    faa_laser_2010 <-
        faa_laser_2010_raw |>
        dplyr::select(-no_a_c) |>
        dplyr::rename(
            incident_date = date,
            incident_time = time_utc,
            flight_id = acid,
            aircraft = type_a_c,
            altitude = alt,
            airport = major_city,
            laser_color = color,
            injury = injury_reported,
            city = city,
            state = state
        )
    print("2010 FAA laser data downloaded . . . ")
    faa_laser_2010
}

faa_laser_all_years <-
    list(
        `2022` = obtain_faa_laser_2022(),
        `2021` = obtain_faa_laser_2021(),
        `2020` = obtain_faa_laser_2020(),
        `2019` = obtain_faa_laser_2019(),
        `2018` = obtain_faa_laser_2018(),
        `2017` = obtain_faa_laser_2017(),
        `2016` = obtain_faa_laser_2016(),
        `2015` = obtain_faa_laser_2015(),
        `2014` = obtain_faa_laser_2014(),
        `2013` = obtain_faa_laser_2013(),
        `2012` = obtain_faa_laser_2012(),
        `2011` = obtain_faa_laser_2011(),
        `2010` = obtain_faa_laser_2010()
    )
faa_laser <- data.table::rbindlist(faa_laser_all_years) |>
    na.omit()
file <- "./data-raw/faa_laser_2010-2022.rds"
saveRDS(faa_laser, file = file)
# Clean ----
rm(list = ls())
file <- "./data-raw/faa_laser_2010-2022.rds"
df <- readRDS(file = file)
library(dplyr)
# incident_date -- ok
df.1 <-
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
df.2 <-
    df.1 |>
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
df.3 <-
    df.2 |>
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
df.4 <-
    df.3 |>
    mutate(aircraft = forcats::fct_lump_n(
        aircraft,
        9
    ))
# altitude - 1455 NAs
df.5 <-
    df.4 |>
    mutate(altitude = as.integer(altitude)) |>
    #altitude 1.3 million?
    filter(!altitude %in% c(outliers::outlier(altitude)))
# laser color
df.6 <-
    df.5 |>
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
df.7 <-
    df.6 |>
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
df.8 <-
    df.7 |>
    filter(state %in% state.name)
# omit nas
df.9 <-
    df.8 |>
    na.omit()
lasers <- df.9
usethis::use_data(lasers, overwrite = TRUE)
