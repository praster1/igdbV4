#' Helper function for igdb_parameters function
#' DO NOT USE
#'
#' @param param     igdb_parameters param variable
#' @param result    igdb_parameters result variable
#' @param paramName param variable name
#' @return refactored parameter text
#' @export
resultQuery = function(param = "", result = "", paramName = "") 
{
	if(result == "") {
		paramName = paste("?", paramName, "=", param, sep = "")
		return(paramName)
	} else {
		paramName = paste("&", paramName, "=", param, sep = "")
		return(paramName)
	}
}