.onLoad <- function(libname, pkgname) {
  if (is.null(reticulate::conda_binary())) {
    stop("Conda is not installed. Please install Conda to use this package.")
  }

  # Create a conda environment if it doesn't exist
  if (!"my_env" %in% reticulate::conda_list()$name) {
    reticulate::conda_create("my_env", packages = "python=3.10")
  }

  # Use the created environment
  reticulate::use_condaenv("my_env", required = TRUE)

  # Check if the Python package is installed
  python_packages <- reticulate::py_module_available("steritas_gti")

  if (!python_packages) {
    # Retrieve the environment variable
    git_repo_token <- Sys.getenv("GIT_REPO_TOKEN")
    print(11111)
    print(git_repo_token)

    # Check if the GIT_REPO_TOKEN is set
    if (git_repo_token == "") {
      stop("GIT_REPO_TOKEN is not set. Please set this environment variable to continue.")
    }

    # Install the Python package
    package_url <- paste0("git+https://Steritas:", git_repo_token, "@github.com/Steritas/steritas_gti.git")
    reticulate::py_install(package_url, pip=TRUE)
  }
}
