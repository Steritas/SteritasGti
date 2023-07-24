.onLoad <- function(libname, pkgname) {
  # Check if environment exists
  envs <- reticulate::conda_list()
  if (!"r-reticulate" %in% envs$name) {
    reticulate::conda_create(envname = "r-reticulate", python_version = "3.10")
  }

  reticulate::use_condaenv("r-reticulate", required = TRUE)

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
