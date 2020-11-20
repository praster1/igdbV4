#' igdb_request requests the IGDB API for information
#'
#' @param endpoint   The endpoint you wish to request, use the pre-made endpoint varaiables
#' @param parameters the completed query parameters from igdb_parameters
#' @param key IGDB API key
#' @return a structure containing: \itemize{
#' \item content: Parsed JSON
#' \item path: complete path
#' \item response
#' }
#' @export
#' @examples 
#' igdb_request(GAMES, igdb_parameters(fields = "id,name"), key = "YOUR_KEY")
igdb_request = function(endpoint, params = "", client_id = "", client_secret = "")
{
	completePath = paste0(endpoint, params)
	igdb_complete_request(completePath, client_id, client_secret)
}