#' igdb_complete_request function creates a new GET request to the IGDB API
#' This function is used by igdb_request() which creates the complete path for you.
#'
#' @param completePath the complete pathcosists of the endpoint path and the query parameters
#' @param key IGDB API key
#' @return a structure containing: \itemize{
#' \item content: Parsed JSON
#' \item path: complete path
#' \item response
#' }
#' @export
#' @import jsonlite
#' @import httr
igdb_complete_request = function(completePath = "", client_id = "", client_secret = "")
{
	if(client_id == "")		{	stop("Empty API key, please set the parameter 'key' with your API key.")	}
	if(client_secret == "")		{	stop("Empty API key, please set the parameter 'key' with your API key.")	}

	# url = modify_url("https://api-v3.igdb.com", path = completePath)
	# url = modify_url("https://api.igdb.com/v4", path = completePath)
	url = paste0("https://api.igdb.com/v4/", path = completePath)


	# resp = GET(url, add_headers(`user-key` = key), encode = "json")
	# resp = GET(url, add_headers(`client_id` = client_id, `client_secret` = client_secret), encode = "json")
	resp = httr::GET(url, httr::add_headers(`client_id` = client_id, `client_secret` = client_secret), encode = "json")

	if (httr::http_type(resp) != "application/json") {	stop("API did not return json", call. = FALSE)	}

	parsed = jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = FALSE)

	if (httr::http_error(resp)) 
	{
		msg = list("IGDB API request failed", str(httr::status_code(resp)))
		stop(	sprintf(	paste(msg, collapse = ": ")	),	call. = FALSE	)	
	}

	structure(	list(	content = parsed,	path = completePath,	response = resp	),	class = "igdb_api"	)
}