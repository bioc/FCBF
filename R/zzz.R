.onLoad <- function(libname, pkgname) {
  opts <- list(
    type = if (interactive())
      "timer"
    else
      "none",
    char = "+",
    txt.width = 50,
    gui.width = 300,
    style = 3,
    initial = 0,
    title = "R progress bar",
    label = "",
    nout = 100L,
    min_time = 0,
    use_lb = FALSE
  )
  optsx <- getOption("pboptions")
  if (!is.null(optsx)) {
    for (i in intersect(names(opts), names(optsx)))
      opts[[i]] <- optsx[[i]]
    for (i in setdiff(names(optsx), names(opts)))
      opts[[i]] <- optsx[[i]]
  }
  options("pboptions" = opts)
  invisible(NULL)
}

.onUnload <- function(libpath) {
  options("pboptions" = NULL)
  invisible(NULL)
}
.onAttach <- function(libname, pkgname) {
    msg <- sprintf(
        "Package '%s' is deprecated and will be removed from Bioconductor
         version %s", pkgname, "3.20")
    .Deprecated(msg=paste(strwrap(msg, exdent=2), collapse="\n"))
}

