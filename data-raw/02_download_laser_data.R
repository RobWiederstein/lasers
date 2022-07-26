faa_laser_all_years <-
    list(
        #`2022` = obtain_faa_laser_2022(),
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
file <- "./data-raw/faa_laser_2010-2021.csv"
write.csv(faa_laser, file = file, row.names = F)
