#' Create package logo
#'
#' `create_pkg_logo()` creates and saves the package logo as `./man/figures/logo.png`
#' @importFrom  ggplot2 ggplot aes geom_density theme_void
#' @importFrom hexSticker sticker
#' @importFrom ggimage theme_transparent
#' @importFrom stats rnorm
create_pkg_logo <- function(){
    dt <- tibble::tibble(x = stats::rnorm(1000))
    p <- ggplot2::ggplot(dt) +
    ggplot2::aes(x = dt$x) +
    ggplot2::geom_density(color = "#dd5600")
    p <- p + ggplot2::theme_void() + ggimage::theme_transparent()
    p
    outfile <- "./man/figures/logo.png"
    hexSticker::sticker(p,
            package = "lasers",
            filename = outfile,
            h_fill = "#2fa4e7",
            h_color = "#dd5600",
            p_size = 20,
            s_x = 1,
            s_y = 1,
            s_width = 1.5,
            s_height = .6
    )
}
