#' Laser Incidents reported to FAA 2010 - 2022
#'
#' A dataset containing details of 66,558 laser incidents
#'
#' @format A data frame with 66,558 rows and 9 variables:
#' \describe{
#'   \item{date_time}{date and time of incident}
#'   \item{flight_id}{flight identification as character, i.e. "AAL2305"}
#'   \item{aircraft}{aircraft type, i.e. "B737"}
#'   \item{altitude}{altitude of aircraft in feet}
#'   \item{airport}{three digit FAA airport identifier}
#'   \item{laser_color}{laser color: blue, green, purple, red, white or multi}
#'   \item{injury}{injury reported: yes or no}
#'   \item{city}{nearest city when incident occurred}
#'   \item{state}{state when incident occurred}
#' }
#' @details
#' Observations that were missing data were omitted.  Of the original 69,337 incidents, 66,558 were retained.  Altitude contained one observation of 1.3 million feet and it was omitted as an data entry error and classified as an outlier. Date and time were combined into a single column.
#'
#' @source \url{https://www.faa.gov/about/initiatives/lasers/laws}
"lasers"
