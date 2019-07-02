#! /usr/bin/Rscript

get_args <- function() {

    parser <- argparse::ArgumentParser()
    parser$add_argument("--input-dir", default = "_source")
    parser$parse_args()

}


render_post <- function(input) {

    input <- file.path("..", input)
    original_wd <- setwd("_posts")
    rmarkdown::render(
        input,
        output_dir = ".",
        output_format = "md_document",
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

    knitr::opts_chunk$set(fig.path = "../assets/")
    log <- purrr::map_chr(inputs, maybe_render)

    cat(log, sep="\n")

}


if (!interactive()) {
    main()
}
