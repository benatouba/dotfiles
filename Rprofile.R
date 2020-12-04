Sys.setenv(R_LIBS_USER="~/.local/lib/R/x86_64-pc-linux-gnu-library/4.0/")
.libPaths( c("~/.local/lib/R/x86_64-pc-linux-gnu-library/4.0/", .libPaths()))

options(languageserver.formatting_style = function(options) {
    styler::tidyverse_style(scope = "indention", indent_by = options$tabSize)
})
