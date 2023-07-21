.onLoad <- function(libname, pkgname) {
  # Check if r-reticulate exists in users environments
  if (!("r-reticulate" %in% reticulate::conda_list()$name)) {
    # Install miniconda if it's not installed
    reticulate::install_miniconda()
  }

  # Use miniconda environment
  reticulate::use_miniconda("r-reticulate", required = TRUE)

  # Check if the Python package is installed
  python_packages <- reticulate::py_module_available("steritas_gti")

  if (!python_packages) {
    # Retrieve the environment variable
    git_repo_token <- Sys.getenv("GIT_REPO_TOKEN")

    # Check if the GIT_REPO_TOKEN is set
    if (git_repo_token == "") {
      stop("GIT_REPO_TOKEN is not set. Please set this environment variable to continue.")
    }

    # Install the Python package
    package_url <- paste0("git+https://Steritas:", git_repo_token, "@github.com/Steritas/steritas_gti.git")
    reticulate::py_install(package_url, pip=TRUE)
  }
}
