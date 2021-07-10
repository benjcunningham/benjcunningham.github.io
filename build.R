#! /usr/bin/Rscript

get_args <- function() {

    parser <- argparse::ArgumentParser()
    parser$add_argument("--input-dir", default = "_source")
    parser$parse_args()

}


output_format <- function() {

    out <- rmarkdown::md_document(
        variant = "markdown_github+yaml_metadata_block+tex_math_dollars"
    )

    out$knitr$opts_chunk$fig.path <- "../assets/"
    out$knitr$knit_hooks$html.cap <- html.cap

    out

}


html.cap <- function(before, options, envir) {

    if (!before) {

        envir$html.cap.num <- (envir$html.cap.num + 1) %z% 1
        paste0('<p class="caption"><b>Fig. ', envir$html.cap.num, ": </b>", options$html.cap,"</p>")

    }

}


`%z%` <- function(x, y) if (length(x) == 0) y else x


render_post <- function(input) {

    input <- file.path("..", input)
    original_wd <- setwd("_posts")

    rmarkdown::render(
        input,
        output_dir = ".",
        output_format = output_format(),
        output_options = list(
            variant = "markdown_github+yaml_metadata_block+tex_math_dollars"
        ),
        env = environment()
    )

    setwd(original_wd)

}


maybe_render <- function(input) {

    base_name <- basename(substr(input, 1, nchar(input) - 4))
    pattern <- paste0("^", base_name, "\\.md$")
    md_file <- list.files("_posts", pattern = pattern, full.names = TRUE)

    if ((length(md_file) == 0) ||
        (file.info(md_file[1])$mtime < file.info(input)$mtime)) {

        render_post(input)

        out <- crayon::magenta(paste("Built", input))

    } else {

        out <- crayon::cyan(paste("Skipped", input))

    }

    out

}


main <- function() {

    args <- get_args()
    inputs <- list.files(args$input_dir, pattern = "\\.Rmd", full.names = TRUE)

    log <- purrr::map_chr(inputs, maybe_render)

    cat(log, sep="\n")

}

default_repo <- "http://cran.us.r-project.org"

if (!require(argparse)) { install.packages("argparse", repos = default_repo) }
if (!require(crayon)) { install.packages("crayon", repos = default_repo) }
if (!require(purrr)) { install.packages("purrr", repos = default_repo) }
if (!require(reticulate)) { install.packages("reticulate", repos = default_repo) }
if (!require(rmarkdown)) { install.packages("rmarkdown", repos = default_repo) }

if (!interactive()) {
    main()
}
