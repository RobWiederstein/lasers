# Download ----
# obtain_faa_laser_2022 <- function() {
#     file <- paste0(
#         "https://www.faa.gov/sites/faa.gov/files/2022-06/",
#         "Laser-Report-2022-through-06-31.xlsx"
#     )
#     sheet <- "Incidents"
#     faa_laser_2022 <-
#         rio::import(
#             file = file,
#             sheet = sheet,
#             range = cellranger::cell_limits(c(1, 1), c(NA, NA)),
#             .name_repair = ~ janitor::make_clean_names(.x),
#             setclass = "tibble",
#             na = c("", "UNKN")
#         )
#     print("2022 FAA laser data downloaded . . . ")
#     faa_laser_2022
# }
obtain_faa_laser_2021 <- function() {
    file <- paste0(
        "https://www.faa.gov/sites/faa.gov/files/2022-02/",
        "Laser-Report-2021-FINAL.xlsx"
    )
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
    file <- paste0(
        "https://www.faa.gov/sites/faa.gov/files/about/initiatives/",
        "lasers/laws/Laser_Report_2020.xlsx"
    )
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
    file <- paste0(
        "https://www.faa.gov/sites/faa.gov/files/about/initiatives/",
        "lasers/laws/Laser_Report_2019_final.xlsx"
    )
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
    file <- paste0(
        "https://www.faa.gov/sites/faa.gov/files/about/initiatives/",
        "lasers/laws/Laser_Report_2018_final.xlsx"
    )
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
    file <- paste0(
        "https://www.faa.gov/sites/faa.gov/files/about/initiatives/",
        "lasers/laws/reported_laser_illumination_incidents_CY_2017.xlsx"
    )
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
    file <- paste0(
        "https://www.faa.gov/sites/faa.gov/files/about/initiatives/",
        "lasers/laws/reported_laser_illumination_incidents_CY_2016.xlsx"
    )
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
    faa_laser_2016 <- faa_laser_2016 |> dplyr::select(!aviation_altitude)
    print("2016 FAA laser data downloaded . . . ")
    faa_laser_2016
}
obtain_faa_laser_2015 <- function() {
    file <- paste0(
        "https://www.faa.gov/sites/faa.gov/files/about/initiatives/",
        "lasers/laws/reported_laser_illumination_incidents_CY_2015.xls"
    )
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
    file <- paste0(
        "https://www.faa.gov/sites/faa.gov/files/about/initiatives/",
        "lasers/laws/laser_incidents_2010-2014.xls"
    )
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
    file <- paste0(
        "https://www.faa.gov/sites/faa.gov/files/about/initiatives/",
        "lasers/laws/laser_incidents_2010-2014.xls"
    )
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
    file <- paste0(
        "https://www.faa.gov/sites/faa.gov/files/about/initiatives/",
        "lasers/laws/laser_incidents_2010-2014.xls"
    )
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
    file <- paste0(
        "https://www.faa.gov/sites/faa.gov/files/about/initiatives/",
        "lasers/laws/laser_incidents_2010-2014.xls"
    )
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
    file <- paste0(
        "https://www.faa.gov/sites/faa.gov/files/about/initiatives/",
        "lasers/laws/laser_incidents_2010-2014.xls"
    )
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
