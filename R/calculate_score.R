#' Calculates GTI scores for input subjects and returns the results
#'
#' @param input_subjects A DataFrame representing the input subjects.
#' @param baseline A string indicating the baseline visit to use for calculating changes. Default is "previous".
#' @param include A list of strings indicating which measures to include in the output. Default is an empty list, which includes all measures.
#' @param output_format Either 'json' or 'df'. By default, it returns the same as input_subjects type.
#' @param algorithm Indicates which algorithm to use. Default is 'agti' (adults).
#' @param unit Indicates whether to use metric (0) or imperial(1) units. Default is 0 (metric).
#' @param fill_missing Indicates whether to fill missing values or not. Default is FALSE.
#'
#' @return A JSON-formatted string representing the output scores for each measure and subject.
#' @export
#'
#' @examples
#' \dontrun{
#' calculate_score(subjects, baseline = "previous", algorithm = "agti")
#' }
calculate_score <- function(input_subjects, baseline = "previous", include = list(), output_format = NULL,
                            algorithm = "agti", unit = 0, fill_missing = FALSE) {
  reticulate::use_miniconda("r-reticulate", required = TRUE)

  st <- reticulate::import("steritas_gti")

  # Call the Python function
  result <- st$calculate_score(input_subjects, baseline, include, output_format,
                               algorithm, unit, fill_missing)

  return(result)
}
